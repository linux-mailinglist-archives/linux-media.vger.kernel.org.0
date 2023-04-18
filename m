Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18AEF6E5ABF
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 09:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjDRHrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 03:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjDRHrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 03:47:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B4E72A7
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 00:46:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A88E962DC6
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 07:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45A2C433EF;
        Tue, 18 Apr 2023 07:46:54 +0000 (UTC)
Message-ID: <86de50ed-5bd9-6cdf-a430-895839568ffd@xs4all.nl>
Date:   Tue, 18 Apr 2023 09:46:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Martin Kepplinger <martink@posteo.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] staging: media: imx: initialize hs_settle to avoid warning
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

Initialize hs_settle to 0 to avoid this compiler warning:

imx8mq-mipi-csi2.c: In function 'imx8mq_mipi_csi_start_stream.part.0':
imx8mq-mipi-csi2.c:91:55: warning: 'hs_settle' may be used uninitialized [-Wmaybe-uninitialized]
   91 | #define GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
      |                                                       ^~
imx8mq-mipi-csi2.c:357:13: note: 'hs_settle' was declared here
  357 |         u32 hs_settle;
      |             ^~~~~~~~~

It's a false positive, but it is too complicated for the compiler to detect that.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 32700cb8bc4d..ca2efcc21efe 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -354,7 +354,7 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 					struct v4l2_subdev_state *sd_state)
 {
 	int ret;
-	u32 hs_settle;
+	u32 hs_settle = 0;

 	ret = imx8mq_mipi_csi_sw_reset(state);
 	if (ret)
