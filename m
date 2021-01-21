Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3A22FE610
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 10:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbhAUJOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 04:14:18 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:42473 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728332AbhAUJN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 04:13:26 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R591e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UMQ.y10_1611220314;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMQ.y10_1611220314)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 21 Jan 2021 17:12:06 +0800
From:   Yang Li <abaci-bugfix@linux.alibaba.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Yang Li <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH 3/3] media: atomisp: remove redundant NULL check
Date:   Thu, 21 Jan 2021 17:11:52 +0800
Message-Id: <1611220312-89384-3-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611220312-89384-1-git-send-email-abaci-bugfix@linux.alibaba.com>
References: <1611220312-89384-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix below warnings reported by coccicheck:
./drivers/staging/media/atomisp/pci/atomisp_cmd.c:4269:2-8: WARNING:
NULL check before some freeing functions is not needed.
./drivers/staging/media/atomisp/pci/atomisp_cmd.c:4626:2-8: WARNING:
NULL check before some freeing functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 592ea99..72a6cac 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4265,8 +4265,7 @@ int atomisp_set_parameters(struct video_device *vdev,
 apply_parameter_failed:
 	if (css_param)
 		atomisp_free_css_parameters(css_param);
-	if (param)
-		kvfree(param);
+	kvfree(param);
 
 	return ret;
 }
@@ -4626,8 +4625,7 @@ int atomisp_fixed_pattern(struct atomisp_sub_device *asd, int flag,
 err:
 	if (ret && res)
 		ia_css_frame_free(res);
-	if (tmp_buf)
-		vfree(tmp_buf);
+	vfree(tmp_buf);
 	if (ret == 0)
 		*result = res;
 	return ret;
-- 
1.8.3.1

