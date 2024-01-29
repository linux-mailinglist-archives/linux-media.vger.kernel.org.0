Return-Path: <linux-media+bounces-4373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9228F841428
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 21:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDE51B24B55
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 20:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F65F15696E;
	Mon, 29 Jan 2024 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gxKLnpUX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1A276048
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559820; cv=none; b=dWdfFNmy3N695Yv2tT22oQ1NyIboTWcv+pu5er2Idj9NZI0LaIqB/ghWB0FkHz1spUqm+233hfHfSXFfkXPrWaix6Jok4hYeOAMLJYSrfFWbr1DJL91OmGcVEtkpaF/HhZ12LUn7Se/U18IJkO06GE60EO2jZHQQ1V6KjmBiD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559820; c=relaxed/simple;
	bh=Ot4y9HFnz8lYhBsy6M1MCuYOQLMxiWhCczIycUYeTQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cky4OD9yFEcqRoTfUUnPZaA2tS/qWd0Kb+E7Wfl77YMGtagMkWvvogHR8EKOZmvsE2Ag2G0AG1pXvWyIGZGRfwqFGVuSWjuIm8vj/tcGguArFiGK7cuI8BzhECE0AyJNZCMvgcll6VLvvlySng1aUkUrFdgnaUjjDe+LqVFZrJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gxKLnpUX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5101f2dfdadso5516214e87.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 12:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706559816; x=1707164616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1EvAfIe+TWbdKFyLsQsg3/MhDZ+EgY9F19+VEh4ohk=;
        b=gxKLnpUX2FViPz+bwgFN0rMN7AFYbDe/Ne5luiMDUNwEcGrnhaaVSBj3/OH3IFk0qs
         iD/sFiCVKrN027K+XFN5mn4ITeXiNrigtYoKqLVWDIUpiZ02wCNAkE/cKcBIWZheFrQT
         6UG33yI3NUn22ElU9dsz+uCTZVuMCJQLBypRBvNyNRBgjFC7qw3rTsvGVt9V97ksbsiP
         ZEl8lA38Or2YW10J4C+Y7So7gHHRkdnAWBh9frb9HMsYDVBqy8L6ffhw2hzNM5LOLezN
         LvWgKMs6BPBbAF2ix8/i8gz3UYqFanBiceq7Z89ewBnHA1OLs1zPa2m4CVjk/NZXAzID
         xjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559816; x=1707164616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1EvAfIe+TWbdKFyLsQsg3/MhDZ+EgY9F19+VEh4ohk=;
        b=LbhpeANX9I315+1sGOsorcCYX3X5YUCErX1rnlLup6pUbmocwd4VUgMQ/nX8I5EfHz
         gcFWcFw1PEpKrpopKGRkB5Y3xuqHSF5g+v9QGnrdFNhGMI467qFnG40XFfYHCm+SVX4P
         KeBASvQCvyOEqDybCirNrN1GMsvIHtni74GF8amvk6XUAnT6B6hjUctPTEBdr4cUMKxW
         Mmmgn3/jij9YbX8TZ64VcTV0H59MtDILVdKe5zsYTXlN+wKsjFbafMYAc+/492dGnc3x
         sE0+sryd8VHqxweozaaeuNIp6Qs065mTpHvhkGduHmZAcFLG/Fjo2cqpTqpc44quq/8g
         irzg==
X-Gm-Message-State: AOJu0Ywr6q9Fjj89Y/Yi4djSKrl20Y0HgkgGGpCtJSq7gginUH7a65ZJ
	PBU370QSC4kx9YiBBGz7R5CW+awtDMU8Gl9dPUFTbty3zBxo2ZLzHzyAmyUlyOc=
X-Google-Smtp-Source: AGHT+IHzvIBnuj+VZVntCxM65I+CUqxr8H86zD1M5FUds+0GiQqHbOUfp9qCBITF2QL9eJBjk4lEiw==
X-Received: by 2002:ac2:5f0f:0:b0:511:17f1:8e09 with SMTP id 15-20020ac25f0f000000b0051117f18e09mr384810lfq.35.1706559816315;
        Mon, 29 Jan 2024 12:23:36 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm4316386ejb.54.2024.01.29.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:23:36 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/6] media: rcar-vin: Simplify remote source type detection
Date: Mon, 29 Jan 2024 21:22:50 +0100
Message-ID: <20240129202254.1126012-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The video source connected to a VIN instance can be either be a CSI-2
receiver, a CS-ISP or a parallel device. Each one requiring slightly
different configuration, sometimes reusing the same registers with
different meaning depending on what video source is used. The video
source type can change at run-time using the media device API.

This was introduced with R-Car Gen3 with two possible video sources and
have since been extended with one more. Instead of adding more flags
that needs to be set/cleared when changing links in the media graph add
functionality to use the media device to determine the video source
type.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     |  3 --
 .../platform/renesas/rcar-vin/rcar-dma.c      | 48 ++++++++++++++-----
 .../platform/renesas/rcar-vin/rcar-vin.h      |  2 -
 3 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 47aeeeb4354e..8555fa446811 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -807,7 +807,6 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 		for (i = 0; i < RCAR_VIN_NUM; i++) {
 			if (group->vin[i] &&
 			    group->vin[i]->parallel.subdev == sd) {
-				group->vin[i]->is_csi = false;
 				ret = 0;
 				goto out;
 			}
@@ -865,8 +864,6 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 		ret = rvin_set_channel_routing(group->vin[master_id], chsel);
 		if (ret)
 			goto out;
-
-		vin->is_csi = true;
 	}
 out:
 	mutex_unlock(&group->lock);
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index e2c40abc6d3d..f392e177c59b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -178,6 +178,28 @@ static bool rvin_scaler_needed(const struct rvin_dev *vin)
 		 vin->compose.height == vin->format.height);
 }
 
+static struct v4l2_subdev *rvin_remote_subdev(const struct rvin_dev *vin)
+{
+	struct media_pad *pad;
+
+	if (!vin->info->use_mc)
+		return vin->parallel.subdev;
+
+	pad = media_pad_remote_pad_first(&vin->pad);
+	if (!pad)
+		return NULL;
+
+	return media_entity_to_v4l2_subdev(pad->entity);
+}
+
+static bool rvin_remote_is_parallel(const struct rvin_dev *vin)
+{
+	if (!vin->parallel.subdev)
+		return false;
+
+	return rvin_remote_subdev(vin) == vin->parallel.subdev;
+}
+
 struct vin_coeff {
 	unsigned short xs_value;
 	u32 coeff_set[24];
@@ -752,7 +774,7 @@ static int rvin_setup(struct rvin_dev *vin)
 		break;
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 		/* BT.656 8bit YCbCr422 or BT.601 8bit YCbCr422 */
-		if (!vin->is_csi &&
+		if (rvin_remote_is_parallel(vin) &&
 		    vin->parallel.mbus_type == V4L2_MBUS_BT656)
 			vnmc |= VNMC_INF_YUV8_BT656;
 		else
@@ -765,7 +787,7 @@ static int rvin_setup(struct rvin_dev *vin)
 		break;
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 		/* BT.656 10bit YCbCr422 or BT.601 10bit YCbCr422 */
-		if (!vin->is_csi &&
+		if (rvin_remote_is_parallel(vin) &&
 		    vin->parallel.mbus_type == V4L2_MBUS_BT656)
 			vnmc |= VNMC_INF_YUV10_BT656;
 		else
@@ -791,13 +813,13 @@ static int rvin_setup(struct rvin_dev *vin)
 		case VNMC_INF_YUV10_BT656:
 		case VNMC_INF_YUV16:
 		case VNMC_INF_RGB666:
-			if (vin->is_csi) {
+			if (!rvin_remote_is_parallel(vin)) {
 				vin_err(vin, "Invalid setting in MIPI CSI2\n");
 				return -EINVAL;
 			}
 			break;
 		case VNMC_INF_RAW8:
-			if (!vin->is_csi) {
+			if (rvin_remote_is_parallel(vin)) {
 				vin_err(vin, "Invalid setting in Digital Pins\n");
 				return -EINVAL;
 			}
@@ -813,7 +835,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	else
 		dmr2 = VNDMR2_FTEV | VNDMR2_VLV(1);
 
-	if (!vin->is_csi) {
+	if (rvin_remote_is_parallel(vin)) {
 		/* Hsync Signal Polarity Select */
 		if (!(vin->parallel.bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
 			dmr2 |= VNDMR2_HPS;
@@ -904,10 +926,10 @@ static int rvin_setup(struct rvin_dev *vin)
 
 		if (vin->info->model == RCAR_GEN3) {
 			/* Select between CSI-2 and parallel input */
-			if (vin->is_csi)
-				vnmc &= ~VNMC_DPINE;
-			else
+			if (rvin_remote_is_parallel(vin))
 				vnmc |= VNMC_DPINE;
+			else
+				vnmc &= ~VNMC_DPINE;
 		}
 	}
 
@@ -1337,14 +1359,16 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 
 static int rvin_set_stream(struct rvin_dev *vin, int on)
 {
-	struct v4l2_subdev *sd;
+	struct v4l2_subdev *sd = rvin_remote_subdev(vin);
 	struct media_pad *pad;
 	int ret;
 
+	if (!sd)
+		return -EPIPE;
+
 	/* No media controller used, simply pass operation to subdevice. */
 	if (!vin->info->use_mc) {
-		ret = v4l2_subdev_call(vin->parallel.subdev, video, s_stream,
-				       on);
+		ret = v4l2_subdev_call(sd, video, s_stream, on);
 
 		return ret == -ENOIOCTLCMD ? 0 : ret;
 	}
@@ -1353,8 +1377,6 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	if (!pad)
 		return -EPIPE;
 
-	sd = media_entity_to_v4l2_subdev(pad->entity);
-
 	if (!on) {
 		video_device_pipeline_stop(&vin->vdev);
 		return v4l2_subdev_call(sd, video, s_stream, 0);
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index ce5419818b36..4bfe8ea031c5 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -202,7 +202,6 @@ struct rvin_info {
  * @sequence:		V4L2 buffers sequence number
  * @state:		keeps track of operation state
  *
- * @is_csi:		flag to mark the VIN as using a CSI-2 subdevice
  * @chsel:		Cached value of the current CSI-2 channel selection
  *
  * @mbus_code:		media bus format code
@@ -246,7 +245,6 @@ struct rvin_dev {
 	unsigned int sequence;
 	enum rvin_dma_state state;
 
-	bool is_csi;
 	unsigned int chsel;
 
 	u32 mbus_code;
-- 
2.43.0


