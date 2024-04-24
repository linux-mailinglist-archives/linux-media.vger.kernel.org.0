Return-Path: <linux-media+bounces-10097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8258B178A
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 948B32840CE
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5866171E55;
	Wed, 24 Apr 2024 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sCo64Gmw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC916FF3C
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003081; cv=none; b=I3XrBtEFs/aISLqwbCEWSvesjxXGNS+HFsuZywodMPBE7Q+m8bHiY4CT/A+gD/NfNnzdYSsHgodKKulxds4cxuqW6yckXBSJ15gBqrOJ5gVsE8TmJZ8025C2GfIc6rITRQgNOHm2vJ9Pp4MZAMt9xa45RsNythpEyLmUKrl4w4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003081; c=relaxed/simple;
	bh=CWEL4Fkb5R4zL6/RfHcvEfvcmBEMguZNx9uzGQboYKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=moLV91SD4Svg8vXEKtYyrjFSlUZqKALKB6NXSjwyATqW98Mn3hhN3r5VsqNsJ5Z37VdqGmi+eiXxyLvn5SYBXZ8wfUnH+XWazPzBBjrA/MqWccSHltNu2QjQ/sEFXjJvGROHbEUwPrHiwvQ9ZlyNnK0/OKh9Ot+70GkUUTnKMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sCo64Gmw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA5EBB1;
	Thu, 25 Apr 2024 01:57:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003022;
	bh=CWEL4Fkb5R4zL6/RfHcvEfvcmBEMguZNx9uzGQboYKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sCo64GmwDcMOXmr3YqisyeuxOL4AYc8iGFhj/c51qY6k1oCBaaWuSYwcOjW6MkdKr
	 2nOK0SumrEuwN+L2s7d8eaY2eU0FCrp428RI3A2hzRMgd9h5J6A+I+0LdPpEOoqTet
	 GR6VZn+DfIPzVbF2CORgNuJJS8JPXSZ+FDBh5uh8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 5/9] media: vimc: Centralize subdev internal_ops initialization
Date: Thu, 25 Apr 2024 02:57:37 +0300
Message-ID: <20240424235741.17093-6-laurent.pinchart@ideasonboard.com>
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

Initialize the subdev internal_ops field in the vimc_ent_sd_register()
function. This handles the internal ops the same way as the subdev ops,
and prepares for moving to the V4L2 subdev active state API.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-common.c  | 2 ++
 drivers/media/test-drivers/vimc/vimc-common.h  | 2 ++
 drivers/media/test-drivers/vimc/vimc-debayer.c | 5 ++---
 drivers/media/test-drivers/vimc/vimc-lens.c    | 2 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c  | 5 ++---
 drivers/media/test-drivers/vimc/vimc-sensor.c  | 4 +---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
index 2e72974e35b4..3da2271215c6 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.c
+++ b/drivers/media/test-drivers/vimc/vimc-common.c
@@ -358,6 +358,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 			 u32 function,
 			 u16 num_pads,
 			 struct media_pad *pads,
+			 const struct v4l2_subdev_internal_ops *int_ops,
 			 const struct v4l2_subdev_ops *sd_ops)
 {
 	int ret;
@@ -367,6 +368,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 
 	/* Initialize the subdev */
 	v4l2_subdev_init(sd, sd_ops);
+	sd->internal_ops = int_ops;
 	sd->entity.function = function;
 	sd->entity.ops = &vimc_ent_sd_mops;
 	sd->owner = THIS_MODULE;
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 6a76717e0384..7a45a2117748 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -215,6 +215,7 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
  * @num_pads:	number of pads to initialize
  * @pads:	the array of pads of the entity, the caller should set the
  *		flags of the pads
+ * @int_ops:	pointer to &struct v4l2_subdev_internal_ops.
  * @sd_ops:	pointer to &struct v4l2_subdev_ops.
  *
  * Helper function initialize and register the struct vimc_ent_device and struct
@@ -227,6 +228,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 			 u32 function,
 			 u16 num_pads,
 			 struct media_pad *pads,
+			 const struct v4l2_subdev_internal_ops *int_ops,
 			 const struct v4l2_subdev_ops *sd_ops);
 
 /**
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index e2f12a7fb58f..d4ca57b3672d 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -591,12 +591,11 @@ static struct vimc_ent_device *vimc_debayer_add(struct vimc_device *vimc,
 	ret = vimc_ent_sd_register(&vdebayer->ved, &vdebayer->sd, v4l2_dev,
 				   vcfg_name,
 				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
-				   vdebayer->pads, &vimc_debayer_ops);
+				   vdebayer->pads, &vimc_debayer_internal_ops,
+				   &vimc_debayer_ops);
 	if (ret)
 		goto err_free_hdl;
 
-	vdebayer->sd.internal_ops = &vimc_debayer_internal_ops;
-
 	vdebayer->ved.process_frame = vimc_debayer_process_frame;
 	vdebayer->ved.dev = vimc->mdev.dev;
 	vdebayer->mean_win_size = vimc_debayer_ctrl_mean_win_size.def;
diff --git a/drivers/media/test-drivers/vimc/vimc-lens.c b/drivers/media/test-drivers/vimc/vimc-lens.c
index e7d78fa8ccdb..42c58a3e3f1b 100644
--- a/drivers/media/test-drivers/vimc/vimc-lens.c
+++ b/drivers/media/test-drivers/vimc/vimc-lens.c
@@ -72,7 +72,7 @@ static struct vimc_ent_device *vimc_lens_add(struct vimc_device *vimc,
 
 	ret = vimc_ent_sd_register(&vlens->ved, &vlens->sd, v4l2_dev,
 				   vcfg_name, MEDIA_ENT_F_LENS, 0,
-				   NULL, &vimc_lens_ops);
+				   NULL, NULL, &vimc_lens_ops);
 	if (ret)
 		goto err_free_hdl;
 
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 013cd84f82be..4f9c44a663e1 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -421,14 +421,13 @@ static struct vimc_ent_device *vimc_scaler_add(struct vimc_device *vimc,
 	ret = vimc_ent_sd_register(&vscaler->ved, &vscaler->sd, v4l2_dev,
 				   vcfg_name,
 				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
-				   vscaler->pads, &vimc_scaler_ops);
+				   vscaler->pads, &vimc_scaler_internal_ops,
+				   &vimc_scaler_ops);
 	if (ret) {
 		kfree(vscaler);
 		return ERR_PTR(ret);
 	}
 
-	vscaler->sd.internal_ops = &vimc_scaler_internal_ops;
-
 	vscaler->ved.process_frame = vimc_scaler_process_frame;
 	vscaler->ved.dev = vimc->mdev.dev;
 
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 11df18332865..5c31d9435cdd 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -424,12 +424,10 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
 	ret = vimc_ent_sd_register(&vsensor->ved, &vsensor->sd, v4l2_dev,
 				   vcfg_name,
 				   MEDIA_ENT_F_CAM_SENSOR, 1, &vsensor->pad,
-				   &vimc_sensor_ops);
+				   &vimc_sensor_internal_ops, &vimc_sensor_ops);
 	if (ret)
 		goto err_free_tpg;
 
-	vsensor->sd.internal_ops = &vimc_sensor_internal_ops;
-
 	vsensor->ved.process_frame = vimc_sensor_process_frame;
 	vsensor->ved.dev = vimc->mdev.dev;
 
-- 
Regards,

Laurent Pinchart


