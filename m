Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36ADF75A79E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbjGTHS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjGTHS0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:18:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3E12115
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:18:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D146761904
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 07:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8827C433C7
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 07:18:23 +0000 (UTC)
Message-ID: <f0f8e8bd-4f7c-2c80-65e7-b5e04e122f60@xs4all.nl>
Date:   Thu, 20 Jul 2023 09:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] staging: media: sun6i-isp: drop of_match_ptr for ID table
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not make any sense.

This also fixes this !CONFIG_OF error:

drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:529:34: warning: 'sun6i_isp_of_match' defined but not used [-Wunused-const-variable=]
  529 | static const struct of_device_id sun6i_isp_of_match[] = {
      |                                  ^~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 0dc75adbd9d8..472057f03bc2 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -541,7 +541,7 @@ static struct platform_driver sun6i_isp_platform_driver = {
 	.remove_new = sun6i_isp_remove,
 	.driver	= {
 		.name		= SUN6I_ISP_NAME,
-		.of_match_table	= of_match_ptr(sun6i_isp_of_match),
+		.of_match_table	= sun6i_isp_of_match,
 		.pm		= &sun6i_isp_pm_ops,
 	},
 };
-- 
2.40.1

