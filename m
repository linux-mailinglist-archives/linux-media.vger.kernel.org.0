Return-Path: <linux-media+bounces-10098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1CF8B178B
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFBDA1F24BC6
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA9A16F286;
	Wed, 24 Apr 2024 23:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X8zBkqxm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5937716F27D
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003083; cv=none; b=Wo/J2ABEyMl6l1lnwPq0oAxaewWk0V85GHGmVRxrk67gCwtvYC+sIKkU/WTte2kp9YeEw2kXjs9ahBqasfYo36xB2d82SfPMo9lt/OhQN0l/szusgxHruP/WIm94YkwRKqSYk923pLZlT0yiZNkYq4OQ5xlL+NFIoDFdtBQAqFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003083; c=relaxed/simple;
	bh=wUCiNdEL0ad5YLNiI1O3Ogmqj4IDQTeR02LrrANDopY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iI7HhXSmX6MVpgWJ9x7N90TY+hCHCB7NBoKstBPbGfJhwQceumTcXfYa/qeaYtT2sPaLQwoIYWxtobHWoocC8XueGnpedM1Ks17Aq+bWomEfnFaDFevHSMIR/I84cApHk7QMQgM9nHZfzqP1ElBxG+CnHAjK1w4RJlexxvG0uxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X8zBkqxm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8530C4D0;
	Thu, 25 Apr 2024 01:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003023;
	bh=wUCiNdEL0ad5YLNiI1O3Ogmqj4IDQTeR02LrrANDopY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X8zBkqxmSh6KIDWR6045sYy4UEIjhKsgzKPEivgmBuoE8LziLvswTGlsUl8fhJHcq
	 MEpsTQy62lzRqwLLr9qEbsj2R+fDP5vwMb3jdcQTmM3V+mZhbCE5RfDaErUvyq4n0q
	 Fd4tjAjyoQwO/V1JTela0qd+Qjqk9rowkZcQiekg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 6/9] media: vimc: Initialize subdev active state
Date: Thu, 25 Apr 2024 02:57:38 +0300
Message-ID: <20240424235741.17093-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finalize subdev initialization for all subdevs that provide a
.init_state() operation. This creates an active state for all those
subdevs, which subsequent patches will use to simplify the
implementation of individual vimc entities.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-common.c | 23 ++++++++++++++++++-
 .../media/test-drivers/vimc/vimc-debayer.c    |  1 +
 drivers/media/test-drivers/vimc/vimc-lens.c   |  1 +
 drivers/media/test-drivers/vimc/vimc-scaler.c |  1 +
 drivers/media/test-drivers/vimc/vimc-sensor.c |  1 +
 5 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
index 3da2271215c6..4f4fcb26e236 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.c
+++ b/drivers/media/test-drivers/vimc/vimc-common.c
@@ -8,6 +8,8 @@
 #include <linux/init.h>
 #include <linux/module.h>
 
+#include <media/v4l2-ctrls.h>
+
 #include "vimc-common.h"
 
 /*
@@ -385,17 +387,36 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 	if (ret)
 		return ret;
 
+	/*
+	 * Finalize the subdev initialization if it supports active states. Use
+	 * the control handler lock as the state lock if available.
+	 */
+	if (int_ops && int_ops->init_state) {
+		if (sd->ctrl_handler)
+			sd->state_lock = sd->ctrl_handler->lock;
+
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(v4l2_dev->dev,
+				"%s: subdev initialization failed (err=%d)\n",
+				name, ret);
+			goto err_clean_m_ent;
+		}
+	}
+
 	/* Register the subdev with the v4l2 and the media framework */
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret) {
 		dev_err(v4l2_dev->dev,
 			"%s: subdev register failed (err=%d)\n",
 			name, ret);
-		goto err_clean_m_ent;
+		goto err_clean_sd;
 	}
 
 	return 0;
 
+err_clean_sd:
+	v4l2_subdev_cleanup(sd);
 err_clean_m_ent:
 	media_entity_cleanup(&sd->entity);
 	return ret;
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index d4ca57b3672d..9f8a31fb0695 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -540,6 +540,7 @@ static void vimc_debayer_release(struct vimc_ent_device *ved)
 		container_of(ved, struct vimc_debayer_device, ved);
 
 	v4l2_ctrl_handler_free(&vdebayer->hdl);
+	v4l2_subdev_cleanup(&vdebayer->sd);
 	media_entity_cleanup(vdebayer->ved.ent);
 	kfree(vdebayer);
 }
diff --git a/drivers/media/test-drivers/vimc/vimc-lens.c b/drivers/media/test-drivers/vimc/vimc-lens.c
index 42c58a3e3f1b..96399057a2b5 100644
--- a/drivers/media/test-drivers/vimc/vimc-lens.c
+++ b/drivers/media/test-drivers/vimc/vimc-lens.c
@@ -92,6 +92,7 @@ static void vimc_lens_release(struct vimc_ent_device *ved)
 		container_of(ved, struct vimc_lens_device, ved);
 
 	v4l2_ctrl_handler_free(&vlens->hdl);
+	v4l2_subdev_cleanup(&vlens->sd);
 	media_entity_cleanup(vlens->ved.ent);
 	kfree(vlens);
 }
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 4f9c44a663e1..f8639f5b4d0c 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -398,6 +398,7 @@ static void vimc_scaler_release(struct vimc_ent_device *ved)
 	struct vimc_scaler_device *vscaler =
 		container_of(ved, struct vimc_scaler_device, ved);
 
+	v4l2_subdev_cleanup(&vscaler->sd);
 	media_entity_cleanup(vscaler->ved.ent);
 	kfree(vscaler);
 }
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 5c31d9435cdd..9eb24c4791bf 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -340,6 +340,7 @@ static void vimc_sensor_release(struct vimc_ent_device *ved)
 
 	v4l2_ctrl_handler_free(&vsensor->hdl);
 	tpg_free(&vsensor->tpg);
+	v4l2_subdev_cleanup(&vsensor->sd);
 	media_entity_cleanup(vsensor->ved.ent);
 	kfree(vsensor);
 }
-- 
Regards,

Laurent Pinchart


