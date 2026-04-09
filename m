Return-Path: <linux-media+bounces-58398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCD3Iu0I2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D84A3CF3F4
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1BE7301574E
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DDC335571;
	Thu,  9 Apr 2026 20:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXmZR2wT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B02339B2D
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765718; cv=none; b=UloPeJsmomV5fCBJbIG8CbUbCBhWEOzq1/cvCLCPMb5UIUOtj6OI7vrMEl25AY1htxS7fGweLfD+inUt3sq+Dk8HR1Mlfwu3c/9CM/P04TXqkIwhTadrcIIprJSV5iFMZeUIL4l1GUnskSPRHloI9J0fs0H75hb4+iXPAb2Jlac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765718; c=relaxed/simple;
	bh=1480LV8OtbuBn6Vd5xwqnr685ec8wI6Dfu/SHpptv8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3FRHiSH2vba1aF+37LtDEEVbYqdEu/tjDKV2jHTH+5kFFedj/dvvypzv43xg1/sXXjvJd7NlriBgoyoVcOWYxMOmfDC//QBEUpH4bZg95hs0AL4RSg+ux0/lmTgtqtTEOcyqus42Zq90urjaffyQ1//3/dxCyIl6hVgctjSiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXmZR2wT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765717; x=1807301717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1480LV8OtbuBn6Vd5xwqnr685ec8wI6Dfu/SHpptv8I=;
  b=KXmZR2wTu6hqgrNikcq94LkFcryBUWR78F52v8Eps055PBj0NJId61+h
   vn/Lwv/WJNqzNKR2euEtqhNxjZfYKyFEZ6D4lJ5QZHA3oWgTMbEbnMvUU
   OdSkJUxo/WyN7qnMmMICxcIUXSQk8Pb1r/m21R1PUYnt+vuYMa90gnIiG
   OTgPVtr3YmhTz56kR94lcD9+8VMsncw2/VVKpLpW4nn/i5W3/CoRLgDka
   sO0yWH5p0+gqLe879MU1IZWk8IiMTKnbiWxGj3c1UPe/4qRkvXLOm2P28
   XWV0Tb6eRqOPldhl7v++a8woME0LBypa8C6dM+h4mYGmjPieiDR/g4fpU
   A==;
X-CSE-ConnectionGUID: s3CmgC4eR+GXws8+v78EFA==
X-CSE-MsgGUID: kFuSUGccQOub6PPgvMCe4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408806"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: BqLcaW98STaCjMItOXRL5Q==
X-CSE-MsgGUID: C/U9x0VGTimT1mCE/Ff2ZQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6395B1220BD;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045qC-3d0Z;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 79/86] media: ipu6: Rework watermark calculation
Date: Thu,  9 Apr 2026 23:14:54 +0300
Message-ID: <20260409201501.975242-80-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58398-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D84A3CF3F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move watermark calculation to ipu6-isys-csi2.c and do the whole thing
as streaming is about to start. There's no need to store all the
information so that it is bound to video nodes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 78 +++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  4 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  5 -
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 92 -------------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    | 15 ---
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 42 ++++-----
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 +-
 7 files changed, 97 insertions(+), 141 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 77e13644746d..15e965396f4a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -233,6 +233,73 @@ void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
 	}
 }
 
+static void ipu6_isys_csi2_setup_watermark(struct ipu6_isys_csi2 *csi2,
+					   struct v4l2_subdev_state *csi2_state,
+					   struct v4l2_subdev *remote_sd)
+{
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
+	struct v4l2_subdev_route *route;
+	u32 max_stream_data_rate = 0, hblank = 0;
+	s64 link_freq;
+	int ret;
+
+	ret = v4l2_g_ctrl(remote_sd->ctrl_handler, &hb);
+	if (!ret)
+		hblank = max(0, hb.value);
+
+	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
+	if (link_freq <= 0) {
+		csi2->watermark.force_iwake_disable = true;
+		dev_warn(dev, "unexpected link_freq %lld (source %s)\n",
+			 link_freq, remote_sd->entity.name);
+		ipu6_isys_update_watermark_setting(csi2->isys);
+		return;
+	}
+
+	for_each_active_route(&csi2_state->routing, route) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(csi2_state, CSI2_PAD_SINK,
+						   route->sink_stream);
+		if (WARN_ON(!fmt))
+			continue;
+
+		u32 bpp = ipu6_isys_mbus_code_to_bpp(fmt->code);
+		u64 pixel_rate = mul_u64_u32_div(link_freq, csi2->nlanes * 2,
+						 bpp);
+		u32 pixels_per_line = fmt->width + hblank;
+		u64 line_time_ns = div_u64(pixels_per_line * NSEC_PER_SEC,
+					   pixel_rate);
+		u32 bytes_per_line = fmt->width * bpp / 8;
+		u32 pages_per_line =
+			DIV_ROUND_UP(bytes_per_line,
+				     csi2->isys->pdata->ipdata->sram_gran_size);
+		u32 pb_bytes_per_line =
+			pages_per_line << csi2->isys->pdata->ipdata->sram_gran_shift;
+		u64 stream_data_rate =
+			div64_u64(pb_bytes_per_line * 1000, line_time_ns);
+
+		dev_dbg(dev, "stream %u:%u -> %u:%u data rate %lld\n",
+			route->sink_pad, route->sink_stream, route->source_pad,
+			route->source_stream, stream_data_rate);
+
+		max_stream_data_rate = max(max_stream_data_rate,
+					   stream_data_rate);
+	}
+
+	csi2->watermark.stream_data_rate = max_stream_data_rate;
+
+	ipu6_isys_update_watermark_setting(csi2->isys);
+}
+
+static void ipu6_isys_csi2_clear_watermark(struct ipu6_isys_csi2 *csi2)
+{
+	csi2->watermark.force_iwake_disable = false;
+	csi2->watermark.stream_data_rate = 0;
+	ipu6_isys_update_watermark_setting(csi2->isys);
+}
+
 static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 				     const struct ipu6_isys_csi2_timing *timing,
 				     unsigned int nlanes, int enable)
@@ -415,6 +482,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, true))
 		return 0;
 
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	ipu6_isys_csi2_setup_watermark(csi2, state, remote_sd);
+
 	ret = ipu6_isys_start_stream_firmware(av);
 	if (ret) {
 		dev_err(sd->dev, "start stream of firmware failed\n");
@@ -429,9 +501,6 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_stop_stream_firmware;
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
 					 csi2->stream_ids);
 	if (ret)
@@ -449,6 +518,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_close_streaming_firmware(av);
 
 err_del_av:
+	ipu6_isys_csi2_clear_watermark(csi2);
 	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
 
@@ -493,6 +563,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	csi2->streaming = false;
 
+	ipu6_isys_csi2_clear_watermark(csi2);
+
 out_del_csi2_entry:
 	list_del(&av->csi2_entry);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index 5ff7af0ab274..fb7cd898008c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -44,6 +44,10 @@ struct ipu6_isys_csi2 {
 	u32 receiver_errors;
 	unsigned int nlanes;
 	unsigned int port;
+	struct {
+		u32 stream_data_rate;
+		bool force_iwake_disable;
+	} watermark;
 	bool streaming;
 	u64 stream_ids;
 };
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index b7c7ccae0452..f4c8386ce7d7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -584,8 +584,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	}
 
 	list_add(&aq->node, &stream->queues);
-	ipu6_isys_configure_stream_watermark(av, source_pad->entity);
-	ipu6_isys_update_stream_watermark(av, true);
 
 	ret = ipu6_isys_stream_start(av);
 	if (ret)
@@ -596,7 +594,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 out_stream_start:
-	ipu6_isys_update_stream_watermark(av, false);
 	list_del(&aq->node);
 
 out_fw_close:
@@ -620,8 +617,6 @@ static void stop_streaming(struct vb2_queue *q)
 
 	mutex_lock(&stream->mutex);
 
-	ipu6_isys_update_stream_watermark(av, false);
-
 	mutex_lock(&av->isys->stream_mutex);
 	ipu6_isys_video_set_streaming(av, 0);
 	list_del(&aq->node);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 56ed1a4c45d6..0350d34f3b67 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -738,98 +738,6 @@ int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 	return 0;
 }
 
-void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
-					  struct media_entity *source)
-{
-	struct ipu6_isys *isys = av->isys;
-	struct ipu6_isys_csi2 *csi2 = NULL;
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-	struct device *dev = &isys->adev->auxdev.dev;
-	struct v4l2_subdev *esd;
-	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
-	s64 link_freq;
-	int ret;
-
-	esd = media_entity_to_v4l2_subdev(source);
-
-	av->watermark.width = ipu6_isys_get_frame_width(av);
-	av->watermark.height = ipu6_isys_get_frame_height(av);
-
-	ret = v4l2_g_ctrl(esd->ctrl_handler, &hb);
-	if (!ret && hb.value >= 0)
-		av->watermark.hblank = hb.value;
-	else
-		av->watermark.hblank = 0;
-
-	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
-	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
-	if (link_freq <= 0) {
-		mutex_lock(&iwake_watermark->mutex);
-		iwake_watermark->force_iwake_disable = true;
-		mutex_unlock(&iwake_watermark->mutex);
-		dev_warn(dev, "unexpected link_freq from %s, disable iwake\n",
-			 source->name);
-		return;
-	}
-
-	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *format;
-	unsigned int bpp;
-
-	state = v4l2_subdev_lock_and_get_active_state(&csi2->asd.sd);
-	format = v4l2_subdev_state_get_format(state, 0, av->source_stream);
-	bpp = ipu6_isys_mbus_code_to_bpp(format->code);
-	v4l2_subdev_unlock_state(state);
-
-	av->watermark.pixel_rate = mul_u64_u32_div(link_freq, csi2->nlanes * 2,
-						   bpp);
-}
-
-static void calculate_stream_datarate(struct ipu6_isys_video *av)
-{
-	struct video_stream_watermark *watermark = &av->watermark;
-	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	u32 pages_per_line, pb_bytes_per_line, pixels_per_line, bytes_per_line;
-	u64 line_time_ns, stream_data_rate;
-
-	pixels_per_line = watermark->width + watermark->hblank;
-	line_time_ns =  div_u64(pixels_per_line * NSEC_PER_SEC,
-				watermark->pixel_rate);
-	bytes_per_line = watermark->width * pfmt->bpp / 8;
-	pages_per_line = DIV_ROUND_UP(bytes_per_line,
-				      av->isys->pdata->ipdata->sram_gran_size);
-	pb_bytes_per_line =
-		pages_per_line << av->isys->pdata->ipdata->sram_gran_shift;
-	stream_data_rate = div64_u64(pb_bytes_per_line * 1000, line_time_ns);
-
-	watermark->stream_data_rate = stream_data_rate;
-}
-
-void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state)
-{
-	struct isys_iwake_watermark *iwake_watermark =
-		&av->isys->iwake_watermark;
-
-	if (!av->watermark.pixel_rate)
-		return;
-
-	if (state) {
-		calculate_stream_datarate(av);
-		mutex_lock(&iwake_watermark->mutex);
-		list_add(&av->watermark.stream_node,
-			 &iwake_watermark->video_list);
-		mutex_unlock(&iwake_watermark->mutex);
-	} else {
-		av->watermark.stream_data_rate = 0;
-		mutex_lock(&iwake_watermark->mutex);
-		list_del(&av->watermark.stream_node);
-		mutex_unlock(&iwake_watermark->mutex);
-	}
-
-	update_watermark_setting(av->isys);
-}
-
 void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
 {
 	struct device *dev;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 5dd70175a857..e2a3bc482004 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -63,16 +63,6 @@ struct ipu6_isys_stream {
 	u8 vc;
 };
 
-struct video_stream_watermark {
-	u32 width;
-	u32 height;
-	u32 hblank;
-	u32 frame_rate;
-	u64 pixel_rate;
-	u64 stream_data_rate;
-	struct list_head stream_node;
-};
-
 struct ipu6_isys_video {
 	struct ipu6_isys_queue aq;
 	struct list_head csi2_entry;
@@ -86,7 +76,6 @@ struct ipu6_isys_video {
 	struct ipu6_isys_csi2 *csi2;
 	struct ipu6_isys_stream *stream;
 	unsigned int streaming;
-	struct video_stream_watermark watermark;
 	u32 source_stream;
 	u8 vc;
 	u8 dt;
@@ -119,10 +108,6 @@ ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle);
 struct ipu6_isys_stream *
 ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc);
 
-void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
-					  struct media_entity *source);
-void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state);
-
 u32 ipu6_isys_get_format(struct ipu6_isys_video *av);
 u32 ipu6_isys_get_data_size(struct ipu6_isys_video *av);
 u32 ipu6_isys_get_bytes_per_line(struct ipu6_isys_video *av);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 1a2d6b107b73..aa892f86d17c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -529,52 +529,47 @@ static void enable_iwake(struct ipu6_isys *isys, bool enable)
 	mutex_unlock(&iwake_watermark->mutex);
 }
 
-void update_watermark_setting(struct ipu6_isys *isys)
+void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys)
 {
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
 	u32 iwake_threshold, iwake_critical_threshold, page_num;
 	struct device *dev = &isys->adev->auxdev.dev;
 	u32 calc_fill_time_us = 0, ltr = 0, did = 0;
-	struct video_stream_watermark *p_watermark;
 	enum ltr_did_type ltr_did_type;
-	struct list_head *stream_node;
 	u64 isys_pb_datarate_mbs = 0;
 	u32 mem_open_threshold = 0;
 	struct ltr_did ltrdid;
 	u64 threshold_bytes;
 	u32 max_sram_size;
 	u32 shift;
+	bool force_iwake_disable = false;
+
+	lockdep_assert_held(&isys->stream_mutex);
 
 	shift = isys->pdata->ipdata->sram_gran_shift;
 	max_sram_size = isys->pdata->ipdata->max_sram_size;
 
-	mutex_lock(&iwake_watermark->mutex);
-	if (iwake_watermark->force_iwake_disable) {
+	for (unsigned int i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
+		isys_pb_datarate_mbs +=
+			isys->csi2[i].watermark.stream_data_rate;
+		force_iwake_disable |=
+			isys->csi2[i].watermark.force_iwake_disable;
+	}
+
+	if (force_iwake_disable) {
+		dev_dbg(dev, "watermark: forcing iwake disabled\n");
 		set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
 		set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
 				   CRITICAL_THRESHOLD_IWAKE_DISABLE);
-		goto unlock_exit;
-	}
-
-	if (list_empty(&iwake_watermark->video_list)) {
-		isys_pb_datarate_mbs = 0;
-	} else {
-		list_for_each(stream_node, &iwake_watermark->video_list) {
-			p_watermark = list_entry(stream_node,
-						 struct video_stream_watermark,
-						 stream_node);
-			isys_pb_datarate_mbs += p_watermark->stream_data_rate;
-		}
+		return;
 	}
-	mutex_unlock(&iwake_watermark->mutex);
 
 	if (!isys_pb_datarate_mbs) {
+		dev_dbg(dev, "watermark: disabled iwake\n");
 		enable_iwake(isys, false);
 		set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
-		mutex_lock(&iwake_watermark->mutex);
 		set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
 				   CRITICAL_THRESHOLD_IWAKE_DISABLE);
-		goto unlock_exit;
+		return;
 	}
 
 	enable_iwake(isys, true);
@@ -609,7 +604,6 @@ void update_watermark_setting(struct ipu6_isys *isys)
 	iwake_threshold = max_t(u32, 1, threshold_bytes >> shift);
 	iwake_threshold = min_t(u32, iwake_threshold, max_sram_size);
 
-	mutex_lock(&iwake_watermark->mutex);
 	if (isys->pdata->ipdata->enhanced_iwake) {
 		set_iwake_register(isys, GDA_IWAKE_THRESHOLD_INDEX,
 				   DEFAULT_IWAKE_THRESHOLD);
@@ -631,7 +625,7 @@ void update_watermark_setting(struct ipu6_isys *isys)
 	iwake_critical_threshold = iwake_threshold +
 		(IS_PIXEL_BUFFER_PAGES - iwake_threshold) / 2;
 
-	dev_dbg(dev, "threshold: %u critical: %u\n", iwake_threshold,
+	dev_dbg(dev, "watermark: threshold: %u critical: %u\n", iwake_threshold,
 		iwake_critical_threshold);
 
 	set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
@@ -641,8 +635,6 @@ void update_watermark_setting(struct ipu6_isys *isys)
 	       isys->adev->isp->base + REG_PKGC_PMON_CFG);
 	writel(VAL_PKGC_PMON_CFG_START,
 	       isys->adev->isp->base + REG_PKGC_PMON_CFG);
-unlock_exit:
-	mutex_unlock(&iwake_watermark->mutex);
 }
 
 static void isys_iwake_watermark_init(struct ipu6_isys *isys)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 7fb8cb820912..c171e4e053c3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -181,7 +181,7 @@ void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
 
 extern const struct v4l2_ioctl_ops ipu6_isys_ioctl_ops;
 
-void update_watermark_setting(struct ipu6_isys *isys);
+void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys);
 
 int ipu6_isys_mcd_phy_set_power(struct ipu6_isys *isys,
 				struct ipu6_isys_csi2_config *cfg,
-- 
2.47.3


