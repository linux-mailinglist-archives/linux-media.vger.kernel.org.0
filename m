Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2333473D4
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 09:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234171AbhCXInP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 04:43:15 -0400
Received: from m12-18.163.com ([220.181.12.18]:60577 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234143AbhCXImm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 04:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9w4n7
        pCQ+xBIwuXyTz+/d9YQ+ktMmMahOP3n55cdsT0=; b=YM/7UV5vSrxihme7X97Y1
        pm21mEb2CRTSCVXmHkJWTgij0GOdi4qfHwbhRFEu2kaPljk8nUuGkVYcfDzgAWp2
        gELHZcWmRjHreXkSMMbImGaRpZd7jCtxGf/Xkt8l1ToXvBLk50b1WdOk0ZvoHIot
        Qv7ketyZr82W18vHBBDmXY=
Received: from caizhichao.ccdomain.com (unknown [218.94.48.178])
        by smtp14 (Coremail) with SMTP id EsCowAAXAuAp+1pgj7KtaQ--.50389S2;
        Wed, 24 Mar 2021 16:41:31 +0800 (CST)
From:   Zhichao Cai <tomstomsczc@163.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Zhichao Cai <caizhichao@yulong.com>
Subject: [PATCH] drivers:staging: NULL check before some freeing functions is not needed.
Date:   Wed, 24 Mar 2021 16:41:26 +0800
Message-Id: <20210324084126.895-1-tomstomsczc@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowAAXAuAp+1pgj7KtaQ--.50389S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFy7KF4xGF4xXr1kWr1UAwb_yoWrCrWfpF
        W0vw1DC3y8Xr1UArsrJw4xJa45A397tayUGa92g3WfWa1xtFWfAF1aka45GrnYqrW5X3ya
        yF45WrW2gw4DtrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc4SrUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: pwrp23prpvu6rf6rljoofrz/xtbBdRtfilaD+lnWcgAAsp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zhichao Cai <caizhichao@yulong.com>

Fixes coccicheck warning:
drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c:390:2-8: WARNING: NULL check before some freeing functions is not needed.
drivers/staging/media/atomisp/pci/sh_css_params.c:1579:2-8: WARNING: NULL check before some freeing functions is not needed.
drivers/staging/media/atomisp/pci/sh_css_params.c:3010:2-8: WARNING: NULL check before some freeing functions is not needed.
drivers/staging/media/atomisp/pci/atomisp_cmd.c:4269:2-8: WARNING: NULL check before some freeing functions is not needed.
drivers/staging/media/atomisp/pci/atomisp_cmd.c:4630:2-7: WARNING: NULL check before some freeing functions is not needed.
drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c:159:4-10: WARNING: NULL check before some freeing functions is not needed.

Signed-off-by: Zhichao Cai <caizhichao@yulong.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c                     | 6 ++----
 .../media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c  | 3 +--
 drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c | 3 +--
 drivers/staging/media/atomisp/pci/sh_css_params.c                   | 6 ++----
 4 files changed, 6 insertions(+), 12 deletions(-)

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
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index 3e72dab..13caa55 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -386,8 +386,7 @@ struct ia_css_isp_dvs_statistics_map *
 
 	return me;
 err:
-	if (me)
-		kvfree(me);
+	kvfree(me);
 	return NULL;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index e861777..823ec54 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -155,8 +155,7 @@
 
 	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
-			if (mem_params->params[pclass][mem].address)
-				kvfree(mem_params->params[pclass][mem].address);
+			kvfree(mem_params->params[pclass][mem].address);
 			if (css_params->params[pclass][mem].address)
 				hmm_free(css_params->params[pclass][mem].address);
 			mem_params->params[pclass][mem].address = NULL;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 7467256..644e145 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1575,8 +1575,7 @@ struct ia_css_isp_3a_statistics_map *
 	return me;
 
 err:
-	if (me)
-		kvfree(me);
+	kvfree(me);
 	return NULL;
 }
 
@@ -3006,8 +3005,7 @@ static void free_map(struct sh_css_ddr_address_map *map)
 	}
 
 	kvfree(params);
-	if (per_frame_params)
-		kvfree(per_frame_params);
+	kvfree(per_frame_params);
 	stream->isp_params_configs = NULL;
 	stream->per_frame_isp_params_configs = NULL;
 
-- 
1.9.1


