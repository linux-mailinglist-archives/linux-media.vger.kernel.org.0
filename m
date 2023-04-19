Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31CDD6E73A1
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 09:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjDSHGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 03:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjDSHGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 03:06:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74301985
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 00:06:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 41D3E61B39
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 07:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E07DC433D2;
        Wed, 19 Apr 2023 07:06:04 +0000 (UTC)
Message-ID: <5406825f-9b67-a59e-de62-b446ad316b96@xs4all.nl>
Date:   Wed, 19 Apr 2023 09:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] staging: media: atomisp: init high & low vars
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a compiler warning:

include/linux/dev_printk.h: In function 'ov2680_probe':
include/linux/dev_printk.h:144:31: warning: 'high' may be used uninitialized [-Wmaybe-uninitialized]
  144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                               ^~~~~~~~
In function 'ov2680_detect',
    inlined from 'ov2680_s_config' at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:468:8,
    inlined from 'ov2680_probe' at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:647:8:
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:376:13: note: 'high' was declared here
  376 |         u32 high, low;
      |             ^~~~

'high' is indeed uninitialized after the ov_read_reg8() call failed, so there is no
point showing the value. Just say that the read failed. But low can also be used
uninitialized later, so just make it more robust and properly zero the high and low
variables.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 63de214916f5..c079368019e8 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -373,7 +373,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 static int ov2680_detect(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u32 high, low;
+	u32 high = 0, low = 0;
 	int ret;
 	u16 id;
 	u8 revision;
@@ -383,7 +383,7 @@ static int ov2680_detect(struct i2c_client *client)

 	ret = ov_read_reg8(client, OV2680_SC_CMMN_CHIP_ID_H, &high);
 	if (ret) {
-		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
+		dev_err(&client->dev, "sensor_id_high read failed (%d)\n", ret);
 		return -ENODEV;
 	}
 	ret = ov_read_reg8(client, OV2680_SC_CMMN_CHIP_ID_L, &low);
