Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86FC304704
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 19:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731124AbhAZRPW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:15:22 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:43126 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389961AbhAZJ1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 04:27:11 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UMxxyMj_1611653142;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMxxyMj_1611653142)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 26 Jan 2021 17:25:49 +0800
From:   Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] media: atomisp: Simplify the calculation of variables
Date:   Tue, 26 Jan 2021 17:25:40 +0800
Message-Id: <1611653140-76630-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/staging/media/atomisp/pci/sh_css_params.c:4652:24-26: WARNING
!A || A && B is equivalent to !A || B.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 24fc497..9eb02f4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4649,10 +4649,8 @@ struct ia_css_dvs_6axis_config *
 	params = stream->isp_params_configs;
 
 	/* Backward compatibility by default consider pipe as Video*/
-	if (!params || (params &&
-			!params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO])) {
+	if (!params || !params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO])
 		goto err;
-	}
 
 	dvs_config = kvcalloc(1, sizeof(struct ia_css_dvs_6axis_config),
 			      GFP_KERNEL);
-- 
1.8.3.1

