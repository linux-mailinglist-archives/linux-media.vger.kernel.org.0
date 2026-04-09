Return-Path: <linux-media+bounces-58405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBqGJ+8I2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B613CF3FD
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D780130285EA
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEDD33CEA2;
	Thu,  9 Apr 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGSz9RJ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98804336EC6
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765723; cv=none; b=f0mLIFIZuolO5iOE/NPa6B/uw32pZtnkERtWGeBIGI9+cATK4KIP4a0QF8dnWQ7WBYtCQXNqvNjnWlx8ijNzvR0EmRJvL1C5PrIvco/8HdrbhDPFcJbpicnxqF5BE8k1tsv37KZOdM28syZpEb/xSPeb+2o16FujGbFwmrU3LTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765723; c=relaxed/simple;
	bh=Pp+DQD26KblaD7eL7ZEJV5ydCR4nFr7ThkcIfZ6E9pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glBDDWTRaGg2fuDqNaNENWl2J5mlhvIlIHBTyLc4Ly8tI2k3Cm4fAn2HZlZVp7PK7Ah6r9TLFgqNRkAmz1sAfCBRYtbRZ4GZmtRWzRGirJlxMJ3CH3CPzYSGlMsvJDjAtjjST77rF7YAqAtcEWbdNIt6L/5tE43BuIXvaqGEVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGSz9RJ4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765720; x=1807301720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pp+DQD26KblaD7eL7ZEJV5ydCR4nFr7ThkcIfZ6E9pM=;
  b=jGSz9RJ4c2Sjm2MYBJ55IUjRdBRhVhRpKBJa3YGThYgsHT/Xf7Ob2oPw
   MYQxUuMeKPk6cnUQZkh9/eXs/kJ/6R03ix0WYfOBUsQ+nLgojpSwNpG26
   MqPExIdVFPZQMyGqmcEHQ4uQdbw+izSA/1xC5//fbfmBrVYsxlkUhCPOO
   ESGDhbvhMAvQV/rOG6/HzapYwYAK47/bfD4tF2GXbJnhZWfuTeTJlyezP
   EUhSrK9LeLhMhFh4rFdhUZEJNu5u8lF1ln52xWKgNjnOjCf8+u7ab4/Me
   AWcSmkxsd1xqF/3QRtefSiRR0UK1VFlN5AyPZifvZWn4Vst7cBSw0+6Kg
   Q==;
X-CSE-ConnectionGUID: 6qg98YOUR8+rag2J0cyzRA==
X-CSE-MsgGUID: uKSRLuBQSJ2lmq0DFvaIxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408878"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408878"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
X-CSE-ConnectionGUID: fcpcI3+TTP2rdqzW550fyg==
X-CSE-MsgGUID: tK8d+0pJTZqzXyuLC6vsvw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6CE8E122108;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045qM-3lmz;
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
Subject: [PATCH v12 81/86] media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
Date: Thu,  9 Apr 2026 23:14:56 +0300
Message-ID: <20260409201501.975242-82-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58405-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59B613CF3FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The stream concept of the IPU6 firmware is aligned with that of the CSI-2,
effectively meaning that a stream equals to a CSI-2 virtual channel. Right
now this means that all streams on a CSI-2 interface are started and
stopped simultaneously, once all related video nodes are set streaming.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  91 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  47 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 403 ++++++++----------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  18 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  47 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   6 +-
 7 files changed, 249 insertions(+), 365 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 15e965396f4a..b1cf2c622b01 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -443,8 +443,8 @@ static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 
 	if (streams_enabled == nodes_streaming) {
 		dev_dbg(asd->sd.dev,
-			"changing streaming state to %s on \"%s\":%u\n",
-			str_enabled_disabled(enable), asd->sd.entity.name, pad);
+			"changing streaming state to %s on \"%s\"\n",
+			str_enabled_disabled(enable), asd->sd.entity.name);
 		return true;
 	}
 
@@ -467,6 +467,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
 	struct ipu6_isys_video *av =
 		container_of_const(vdev_pad, struct ipu6_isys_video, pad);
+	struct v4l2_mbus_frame_desc desc = {
+		.type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
+	};
 	u64 sink_streams;
 	int ret;
 
@@ -478,6 +481,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 	csi2->stream_ids |= sink_streams;
+	av->sink_stream = __ffs(sink_streams);
 
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, true))
 		return 0;
@@ -487,7 +491,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_csi2_setup_watermark(csi2, state, remote_sd);
 
-	ret = ipu6_isys_start_stream_firmware(av);
+	ret = v4l2_subdev_get_frame_desc(remote_sd, remote_pad->index, &desc);
+	if (ret)
+		goto err_del_av;
+
+	ret = ipu6_isys_alloc_start_streams_firmware(csi2, state, &desc);
 	if (ret) {
 		dev_err(sd->dev, "start stream of firmware failed\n");
 		goto err_del_av;
@@ -514,11 +522,13 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
 
 err_stop_stream_firmware:
-	ipu6_isys_stop_streaming_firmware(av);
-	ipu6_isys_close_streaming_firmware(av);
+	ipu6_isys_stop_streams_firmware(csi2);
+	ipu6_isys_close_streams_firmware(csi2);
+	ipu6_isys_free_streams_firmware(csi2);
 
 err_del_av:
 	ipu6_isys_csi2_clear_watermark(csi2);
+	ipu6_isys_csi2_streaming_change(asd, state, pad, false);
 	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
 
@@ -540,28 +550,29 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, false))
-		goto out_del_csi2_entry;
-
 	sink_streams =
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
+	csi2->stream_ids &= ~sink_streams;
+
+	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, false))
+		goto out_del_csi2_entry;
+
 	csi2->streaming = false;
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	ipu6_isys_stop_streaming_firmware(av);
+	ipu6_isys_stop_streams_firmware(csi2);
 
 	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index,
-				    csi2->stream_ids);
+				    csi2->stream_ids | sink_streams);
 
-	ipu6_isys_close_streaming_firmware(av);
-
-	csi2->streaming = false;
+	ipu6_isys_close_streams_firmware(csi2);
+	ipu6_isys_free_streams_firmware(csi2);
 
 	ipu6_isys_csi2_clear_watermark(csi2);
 
@@ -714,6 +725,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 		goto fail;
 
 	INIT_LIST_HEAD(&csi2->av_head);
+	INIT_LIST_HEAD(&csi2->streams);
 	csi2->asd.source = IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
 	csi2->asd.supported_codes = csi2_supported_codes;
 	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
@@ -764,56 +776,3 @@ void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream)
 	dev_dbg(dev, "eof_event::csi2-%i sequence: %i\n",
 		csi2->port, frame_sequence);
 }
-
-int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
-				   struct ipu6_isys_csi2 *csi2,
-				   struct media_entity *source_entity,
-				   struct v4l2_mbus_frame_desc_entry *entry)
-{
-	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
-	struct device *dev = &csi2->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc desc;
-	struct v4l2_subdev *source;
-	struct media_pad *pad;
-	unsigned int i;
-	int ret;
-
-	source = media_entity_to_v4l2_subdev(source_entity);
-	if (!source)
-		return -EPIPE;
-
-	pad = media_pad_remote_pad_first(&csi2->asd.pad[CSI2_PAD_SINK]);
-	if (!pad)
-		return -EPIPE;
-
-	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
-	if (ret)
-		return ret;
-
-	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(dev, "Unsupported frame descriptor type\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < desc.num_entries; i++) {
-		if (source_stream == desc.entry[i].stream) {
-			desc_entry = &desc.entry[i];
-			break;
-		}
-	}
-
-	if (!desc_entry) {
-		dev_err(dev, "Failed to find stream %u from remote subdev\n",
-			source_stream);
-		return -EINVAL;
-	}
-
-	if (desc_entry->bus.csi2.vc >= NR_OF_CSI2_VC) {
-		dev_err(dev, "invalid vc %d\n", desc_entry->bus.csi2.vc);
-		return -EINVAL;
-	}
-
-	*entry = *desc_entry;
-
-	return 0;
-}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index fb7cd898008c..6caee336da89 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -39,6 +39,8 @@ struct ipu6_isys_csi2 {
 	struct ipu6_isys *isys;
 	struct ipu6_isys_video av[NR_OF_CSI2_SRC_PADS];
 	struct list_head av_head;
+	struct list_head streams;
+	struct ipu6_isys_stream *streams_by_vc[NR_OF_CSI2_VC];
 
 	void __iomem *base;
 	u32 receiver_errors;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index f4c8386ce7d7..31df83b9f45f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -286,19 +286,24 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 /* Start streaming for real. The buffer list must be available. */
 static int ipu6_isys_stream_start(struct ipu6_isys_video *av)
 {
-	struct ipu6_isys_stream *stream = av->stream;
-	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct ipu6_isys_buffer_list bl;
 	int ret;
 
-	guard(mutex)(&stream->isys->stream_mutex);
+	guard(mutex)(&av->isys->stream_mutex);
 	ret = ipu6_isys_video_set_streaming(av, 1);
 	if (ret)
 		return ret;
 
+	if (!av->stream)
+		return 0;
 	if (!av->csi2->streaming)
 		return 0;
 
+	struct ipu6_isys_stream *stream = av->stream;
+
+	guard(mutex)(&stream->mutex);
+
 	do {
 		struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 		struct isys_fw_msgs *msg;
@@ -522,7 +527,6 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 static void ipu6_isys_stream_cleanup(struct ipu6_isys_video *av)
 {
 	video_device_pipeline_stop(&av->vdev);
-	ipu6_isys_put_stream(av->stream);
 	av->stream = NULL;
 }
 
@@ -533,9 +537,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct ipu6_isys_stream *stream;
 	struct media_pad *source_pad, *remote_pad;
-	bool first;
 	int ret;
 
 	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
@@ -556,12 +558,11 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out_return_buffers;
 	}
 
-	ret = ipu6_isys_setup_video(av, remote_pad, source_pad);
-	if (ret < 0) {
-		dev_dbg(dev, "failed to setup video\n");
+	bool has_pipeline = (bool)video_device_pipeline(&av->vdev);
+
+	ret = video_device_pipeline_alloc_start(&av->vdev);
+	if (ret < 0)
 		goto out_return_buffers;
-	}
-	first = ret;
 
 	ret = ipu6_isys_link_fmt_validate(aq);
 	if (ret) {
@@ -575,29 +576,13 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto out_pipeline_stop;
 
-	stream = av->stream;
-	mutex_lock(&stream->mutex);
-	if (first) {
-		ret = ipu6_isys_video_prepare_stream(av, source_pad->entity);
-		if (ret)
-			goto out_fw_close;
-	}
-
-	list_add(&aq->node, &stream->queues);
-
 	ret = ipu6_isys_stream_start(av);
 	if (ret)
-		goto out_stream_start;
-
-	mutex_unlock(&stream->mutex);
+		goto out_fw_close;
 
 	return 0;
 
-out_stream_start:
-	list_del(&aq->node);
-
 out_fw_close:
-	mutex_unlock(&stream->mutex);
 	ipu6_isys_fw_close(av->isys);
 
 out_pipeline_stop:
@@ -613,17 +598,11 @@ static void stop_streaming(struct vb2_queue *q)
 {
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct ipu6_isys_stream *stream = av->stream;
-
-	mutex_lock(&stream->mutex);
 
 	mutex_lock(&av->isys->stream_mutex);
 	ipu6_isys_video_set_streaming(av, 0);
-	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
-	mutex_unlock(&stream->mutex);
-
 	ipu6_isys_stream_cleanup(av);
 
 	return_buffers(aq, VB2_BUF_STATE_ERROR);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 0350d34f3b67..2344e4a880d6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -440,37 +440,38 @@ static int link_validate(struct media_link *link)
 	return ret;
 }
 
-static void get_stream_opened(struct ipu6_isys_video *av)
+static void get_stream_opened(struct ipu6_isys *isys)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&av->isys->streams_lock, flags);
-	av->isys->stream_opened++;
-	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	isys->stream_opened++;
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
 }
 
-static void put_stream_opened(struct ipu6_isys_video *av)
+static void put_stream_opened(struct ipu6_isys *isys)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&av->isys->streams_lock, flags);
-	av->isys->stream_opened--;
-	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	isys->stream_opened--;
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
 }
 
 static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
-				struct ipu6_fw_isys_stream_cfg_data_abi *cfg)
+				struct ipu6_fw_isys_stream_cfg_data_abi *cfg,
+				struct ipu6_isys_stream *stream,
+				struct media_pad *src_pad,
+				struct v4l2_mbus_frame_desc_entry *entry)
 {
-	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
 	struct v4l2_subdev_state *state = v4l2_subdev_get_locked_active_state(sd);
 	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
 	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
-	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_queue *aq = &av->aq;
-	struct v4l2_mbus_framefmt fmt;
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
+	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect v4l2_crop;
 	struct ipu6_isys *isys = av->isys;
 	int input_pins = cfg->nof_input_pins++;
@@ -478,13 +479,13 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	u32 src_stream;
 
 	src_stream = __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->index);
-	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
+	fmt = v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
 	v4l2_crop = *v4l2_subdev_state_get_crop(state, src_pad->index, src_stream);
 
 	input_pin = &cfg->input_pins[input_pins];
-	input_pin->input_res.width = fmt.width;
-	input_pin->input_res.height = fmt.height;
-	input_pin->dt = av->dt;
+	input_pin->input_res.width = fmt->width;
+	input_pin->input_res.height = fmt->height;
+	input_pin->dt = entry->bus.csi2.dt;
 	input_pin->bits_per_pix = pfmt->bpp_packed;
 	input_pin->mapped_dt = 0x40; /* invalid mipi data type */
 	input_pin->mipi_decompression = 0;
@@ -525,13 +526,15 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	return 0;
 }
 
-int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av)
+static int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
+					   struct v4l2_mbus_frame_desc *desc)
 {
 	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 	struct ipu6_isys_buffer_list bl;
-	struct ipu6_isys_stream *stream = av->stream;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = &stream->asd->isys->adev->auxdev.dev;
+	struct v4l2_subdev_state *csi2_state =
+		v4l2_subdev_get_locked_active_state(&stream->asd->sd);
 	struct isys_fw_msgs *msg = NULL;
 	struct ipu6_isys_queue *aq;
 	int ret, retout, tout;
@@ -548,17 +551,42 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av)
 		return -ENOMEM;
 
 	stream_cfg = &msg->fw_msg.stream;
-	stream_cfg->src = stream->stream_source;
+	stream_cfg->src = stream->asd->source;
 	stream_cfg->vc = stream->vc;
 	stream_cfg->isl_use = 0;
 	stream_cfg->sensor_type = IPU6_FW_ISYS_SENSOR_MODE_NORMAL;
 
 	list_for_each_entry(aq, &stream->queues, node) {
 		struct ipu6_isys_video *__av = ipu6_isys_queue_to_video(aq);
+		struct media_pad *remote_pad =
+			media_pad_remote_pad_first(&__av->pad);
+		u64 source_streams = 1;
+		unsigned int sink_stream =
+			__ffs(v4l2_subdev_state_xlate_streams(csi2_state,
+							      remote_pad->index,
+							      CSI2_PAD_SINK,
+							      &source_streams));
+		struct v4l2_mbus_frame_desc_entry *entry;
+		unsigned int i;
+
+		for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; i++) {
+			entry = &desc->entry[i];
+
+			if (entry->stream == sink_stream)
+				break;
+		}
+
+		if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
+			dev_err(dev, "cannot find frame desc entry for sink stream %u\n",
+				sink_stream);
+			return -EINVAL;
+		}
 
-		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg);
+		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg, stream, remote_pad,
+					   entry);
 		if (ret < 0) {
-			ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+			ipu6_put_fw_msg_buf(stream->isys,
+					    (uintptr_t)stream_cfg);
 			return ret;
 		}
 	}
@@ -569,22 +597,22 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av)
 
 	reinit_completion(&stream->stream_open_completion);
 
-	ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle,
+	ret = ipu6_fw_isys_complex_cmd(stream->isys, stream->stream_handle,
 				       stream_cfg, msg->dma_addr,
 				       sizeof(*stream_cfg),
 				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
 	if (ret < 0) {
 		dev_err(dev, "can't open stream (%d)\n", ret);
-		ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+		ipu6_put_fw_msg_buf(stream->isys, (uintptr_t)stream_cfg);
 		return ret;
 	}
 
-	get_stream_opened(av);
+	get_stream_opened(stream->isys);
 
 	tout = wait_for_completion_timeout(&stream->stream_open_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
 
-	ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+	ipu6_put_fw_msg_buf(stream->isys, (uintptr_t)stream_cfg);
 
 	if (!tout) {
 		dev_err(dev, "stream open time out\n");
@@ -611,7 +639,7 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av)
 
 	send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE;
 	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream_cfg->nof_output_pins);
-	ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle, buf,
+	ret = ipu6_fw_isys_complex_cmd(stream->isys, stream->stream_handle, buf,
 				       msg->dma_addr, sizeof(*buf), send_type);
 	if (ret < 0) {
 		dev_err(dev, "can't start streaming (%d)\n", ret);
@@ -637,7 +665,7 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av)
 out_stream_close:
 	reinit_completion(&stream->stream_close_completion);
 
-	retout = ipu6_fw_isys_simple_cmd(av->isys,
+	retout = ipu6_fw_isys_simple_cmd(stream->isys,
 					 stream->stream_handle,
 					 IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
 	if (retout < 0) {
@@ -655,25 +683,25 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av)
 		dev_dbg(dev, "stream close complete\n");
 
 out_put_stream_opened:
-	put_stream_opened(av);
+	put_stream_opened(stream->isys);
 
 	return ret;
 }
 
-void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av)
+static int ipu6_isys_stop_streaming_firmware(struct ipu6_isys_stream *stream,
+					     struct v4l2_mbus_frame_desc *desc)
 {
-	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct ipu6_isys_stream *stream = av->stream;
+	struct device *dev = &stream->isys->adev->auxdev.dev;
 	int ret, tout;
 
 	reinit_completion(&stream->stream_stop_completion);
 
-	ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
+	ret = ipu6_fw_isys_simple_cmd(stream->isys, stream->stream_handle,
 				      IPU6_FW_ISYS_SEND_TYPE_STREAM_FLUSH);
 
 	if (ret < 0) {
 		dev_err(dev, "can't stop stream (%d)\n", ret);
-		return;
+		return 0;
 	}
 
 	tout = wait_for_completion_timeout(&stream->stream_stop_completion,
@@ -684,21 +712,24 @@ void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av)
 		dev_warn(dev, "stream stop error: %d\n", stream->error);
 	else
 		dev_dbg(dev, "stop stream: complete\n");
+
+	return 0;
 }
 
-void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av)
+static int ipu6_isys_close_streaming_firmware(struct ipu6_isys_stream *stream,
+					      struct v4l2_mbus_frame_desc *desc)
 {
-	struct ipu6_isys_stream *stream = av->stream;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
 	int ret, tout;
 
 	reinit_completion(&stream->stream_close_completion);
 
-	ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
+	ret = ipu6_fw_isys_simple_cmd(stream->isys, stream->stream_handle,
 				      IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
 	if (ret < 0) {
 		dev_err(dev, "can't close stream (%d)\n", ret);
-		return;
+		return 0;
 	}
 
 	tout = wait_for_completion_timeout(&stream->stream_close_completion,
@@ -710,155 +741,158 @@ void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av)
 	else
 		dev_dbg(dev, "close stream: complete\n");
 
-	put_stream_opened(av);
+	put_stream_opened(stream->isys);
+
+	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
+		stream->isys->streams_by_handle[stream->stream_handle] = NULL;
+		csi2->streams_by_vc[stream->vc] = NULL;
+	}
+
+	return 0;
 }
 
-int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity)
+static int call_on_streams(struct ipu6_isys_csi2 *csi2,
+			   int (*start)(struct ipu6_isys_stream *stream,
+					struct v4l2_mbus_frame_desc *desc),
+			   int (*stop)(struct ipu6_isys_stream *stream,
+				       struct v4l2_mbus_frame_desc *desc),
+			   struct ipu6_isys_stream *end,
+			   struct v4l2_mbus_frame_desc *desc)
 {
-	struct ipu6_isys_stream *stream = av->stream;
-	struct ipu6_isys_csi2 *csi2;
-
-	atomic_set(&stream->sequence, 0);
+	struct ipu6_isys_stream *stream;
 
-	stream->seq_index = 0;
-	memset(stream->seq, 0, sizeof(stream->seq));
+	list_for_each_entry(stream, &csi2->streams, csi2_entry) {
+		int ret;
 
-	if (WARN_ON(!list_empty(&stream->queues)))
-		return -EINVAL;
+		if (stream == end)
+			break;
 
-	stream->stream_source = stream->asd->source;
-	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
-	csi2->receiver_errors = 0;
+		ret = start(stream, desc);
+		if (ret && stop) {
+			call_on_streams(csi2, stop, NULL, stream, desc);
 
-	dev_dbg(&av->isys->adev->auxdev.dev,
-		"prepare stream: external entity %s\n",
-		source_entity->name);
+			return ret;
+		}
+	}
 
 	return 0;
 }
 
-void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
+void ipu6_isys_free_streams_firmware(struct ipu6_isys_csi2 *csi2)
 {
-	struct device *dev;
-	unsigned int i;
-	unsigned long flags;
-
-	if (!stream) {
-		pr_err("ipu6-isys: no available stream\n");
-		return;
-	}
-
-	dev = &stream->isys->adev->auxdev.dev;
+	struct ipu6_isys_stream *stream, *safe;
 
-	spin_lock_irqsave(&stream->isys->streams_lock, flags);
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-		if (&stream->isys->streams[i] == stream) {
-			if (stream->isys->streams_ref_count[i] > 0)
-				stream->isys->streams_ref_count[i]--;
-			else
-				dev_warn(dev, "invalid stream %d\n", i);
-
-			break;
-		}
+	list_for_each_entry_safe(stream, safe, &csi2->streams, csi2_entry) {
+		list_del(&stream->csi2_entry);
+		ida_free(&csi2->isys->streams, stream->stream_handle);
+		kfree(stream);
 	}
-	spin_unlock_irqrestore(&stream->isys->streams_lock, flags);
 }
 
-static struct ipu6_isys_stream *
-ipu6_isys_get_stream(struct ipu6_isys_video *av, struct ipu6_isys_subdev *asd)
+int ipu6_isys_alloc_start_streams_firmware(struct ipu6_isys_csi2 *csi2,
+					   struct v4l2_subdev_state *csi2_state,
+					   struct v4l2_mbus_frame_desc *desc)
 {
-	struct ipu6_isys_stream *stream = NULL;
-	struct ipu6_isys *isys = av->isys;
-	unsigned long flags;
-	unsigned int i;
-	u8 vc = av->vc;
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct v4l2_subdev_route *route;
+	int ret;
 
-	if (!isys)
-		return NULL;
+	for_each_active_route(&csi2_state->routing, route) {
+		struct media_pad *vdev_pad =
+			media_pad_remote_pad_first(&csi2->asd.pad[route->source_pad]);
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
+		struct ipu6_isys_stream *stream;
 
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-		if (isys->streams_ref_count[i] && isys->streams[i].vc == vc &&
-		    isys->streams[i].asd == asd) {
-			isys->streams_ref_count[i]++;
-			stream = &isys->streams[i];
+		for (unsigned int i = 0; i < desc->num_entries; i++) {
+			if (desc->entry[i].stream != route->sink_stream)
+				continue;
+
+			entry = &desc->entry[i];
 			break;
 		}
-	}
 
-	if (!stream) {
-		for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-			if (!isys->streams_ref_count[i]) {
-				isys->streams_ref_count[i]++;
-				stream = &isys->streams[i];
-				stream->vc = vc;
-				stream->asd = asd;
-				break;
-			}
+		if (!entry) {
+			dev_dbg(dev, "cannot find stream %u in frame desc\n",
+				route->sink_stream);
+			ret = -EINVAL;
+			goto err_free_streams;
 		}
-	}
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
 
-	return stream;
-}
+		list_for_each_entry(stream, &csi2->streams, csi2_entry)
+			if (stream->vc == entry->bus.csi2.vc)
+				break;
 
-struct ipu6_isys_stream *
-ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle)
-{
-	unsigned long flags;
-	struct ipu6_isys_stream *stream = NULL;
+		if (list_entry_is_head(stream, &csi2->streams, csi2_entry)) {
+			unsigned long flags;
 
-	if (!isys)
-		return NULL;
+			stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+			if (!stream) {
+				ret = -ENOMEM;
+				goto err_free_streams;
+			}
 
-	if (stream_handle >= IPU6_ISYS_MAX_STREAMS) {
-		dev_err(&isys->adev->auxdev.dev,
-			"stream_handle %d is invalid\n", stream_handle);
-		return NULL;
-	}
+			ret = ida_alloc_max(&csi2->isys->streams,
+					    IPU6_ISYS_MAX_STREAMS - 1,
+					    GFP_KERNEL);
+			if (ret < 0) {
+				kfree(stream);
+				goto err_free_streams;
+			}
 
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	if (isys->streams_ref_count[stream_handle] > 0) {
-		isys->streams_ref_count[stream_handle]++;
-		stream = &isys->streams[stream_handle];
-	}
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
+			stream->stream_handle = ret;
+			mutex_init(&stream->mutex);
+			init_completion(&stream->stream_open_completion);
+			init_completion(&stream->stream_close_completion);
+			init_completion(&stream->stream_start_completion);
+			init_completion(&stream->stream_stop_completion);
+			INIT_LIST_HEAD(&stream->queues);
+			stream->isys = csi2->asd.isys;
+			stream->asd = &csi2->asd;
+			stream->vc = entry->bus.csi2.vc;
+
+			scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
+				stream->isys->streams_by_handle[stream->stream_handle] =
+					stream;
+				csi2->streams_by_vc[stream->vc] = stream;
+			}
 
-	return stream;
-}
+			list_add(&stream->csi2_entry, &csi2->streams);
+		}
 
-struct ipu6_isys_stream *
-ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc)
-{
-	struct ipu6_isys_stream *stream = NULL;
-	unsigned long flags;
-	unsigned int i;
+		struct ipu6_isys_video *av =
+			container_of_const(vdev_pad, struct ipu6_isys_video,
+					   pad);
+		struct ipu6_isys_queue *aq = &av->aq;
 
-	if (!isys)
-		return NULL;
+		list_add(&aq->node, &stream->queues);
 
-	if (source < 0) {
-		dev_err(&isys->adev->auxdev.dev,
-			"query stream with invalid port number\n");
-		return NULL;
+		stream->nr_output_pins++;
+		av->stream = stream;
 	}
 
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-		if (!isys->streams_ref_count[i])
-			continue;
+	ret = call_on_streams(csi2, ipu6_isys_start_stream_firmware,
+			      ipu6_isys_stop_streaming_firmware, NULL, desc);
 
-		if (isys->streams[i].stream_source == source &&
-		    isys->streams[i].vc == vc) {
-			stream = &isys->streams[i];
-			isys->streams_ref_count[i]++;
-			break;
-		}
-	}
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
+	if (!ret)
+		return 0;
+
+err_free_streams:
+	ipu6_isys_free_streams_firmware(csi2);
+	ipu6_isys_free_streams_firmware(csi2);
+
+	return ret;
+}
+
+void ipu6_isys_stop_streams_firmware(struct ipu6_isys_csi2 *csi2)
+{
+	call_on_streams(csi2, ipu6_isys_stop_streaming_firmware, NULL, NULL,
+			NULL);
+}
 
-	return stream;
+void ipu6_isys_close_streams_firmware(struct ipu6_isys_csi2 *csi2)
+{
+	call_on_streams(csi2, ipu6_isys_close_streaming_firmware, NULL, NULL,
+			NULL);
 }
 
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
@@ -1000,71 +1034,6 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 		pm_runtime_put(&isys->adev->auxdev.dev);
 }
 
-int ipu6_isys_setup_video(struct ipu6_isys_video *av,
-			  struct media_pad *remote_pad,
-			  struct media_pad *source_pad)
-{
-	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc_entry entry;
-	struct v4l2_subdev_route *route = NULL;
-	struct v4l2_subdev_route *r;
-	struct v4l2_subdev_state *state;
-	struct v4l2_subdev *remote_sd =
-		media_entity_to_v4l2_subdev(remote_pad->entity);
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(remote_sd);
-	int ret = -EINVAL;
-
-	/* Find the root */
-	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
-	for_each_active_route(&state->routing, r)
-		if (r->source_pad == remote_pad->index)
-			route = r;
-
-	if (!route) {
-		v4l2_subdev_unlock_state(state);
-		dev_dbg(dev, "Failed to find route\n");
-		return -ENODEV;
-	}
-	av->source_stream = route->sink_stream;
-	v4l2_subdev_unlock_state(state);
-
-	ret = ipu6_isys_csi2_get_remote_desc(av->source_stream,
-					     to_ipu6_isys_csi2(asd),
-					     source_pad->entity, &entry);
-	if (ret == -ENOIOCTLCMD) {
-		av->vc = 0;
-		av->dt = ipu6_isys_mbus_code_to_mipi(pfmt->code);
-	} else if (!ret) {
-		dev_dbg(dev, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
-			entry.stream, entry.length, entry.bus.csi2.vc,
-			entry.bus.csi2.dt);
-
-		av->vc = entry.bus.csi2.vc;
-		av->dt = entry.bus.csi2.dt;
-	} else {
-		dev_err(dev, "failed to get remote frame desc\n");
-		return ret;
-	}
-
-	pipeline = video_device_pipeline(&av->vdev);
-	ret = video_device_pipeline_alloc_start(&av->vdev);
-	if (ret < 0) {
-		dev_dbg(dev, "media pipeline start failed\n");
-		return ret;
-	}
-
-	av->stream = ipu6_isys_get_stream(av, asd);
-	if (!av->stream) {
-		video_device_pipeline_stop(&av->vdev);
-		dev_err(dev, "no available stream for firmware\n");
-		return -EINVAL;
-	}
-
-	return !pipeline;
-}
-
 /*
  * Do everything that's needed to initialise things related to video
  * buffer queue, video node, and the related media entity. The caller
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index e2a3bc482004..bf837efc8ae4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -46,12 +46,13 @@ struct ipu6_isys_stream {
 	atomic_t sequence;
 	unsigned int seq_index;
 	struct sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
-	int stream_source;
 	int stream_handle;
 	unsigned int nr_output_pins;
 	struct ipu6_isys_subdev *asd;
-
 	struct list_head queues;
+	struct list_head csi2_entry;
+	struct list_head isys_entry;
+
 	struct completion stream_open_completion;
 	struct completion stream_close_completion;
 	struct completion stream_start_completion;
@@ -79,6 +80,7 @@ struct ipu6_isys_video {
 	u32 source_stream;
 	u8 vc;
 	u8 dt;
+	u8 sink_stream;
 };
 
 #define ipu6_isys_queue_to_video(__aq) \
@@ -89,11 +91,12 @@ extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
 
 const struct ipu6_isys_pixelformat *
 ipu6_isys_get_isys_format(u32 pixelformat, u32 code);
-int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av);
-void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av);
-void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av);
-int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity);
+void ipu6_isys_free_streams_firmware(struct ipu6_isys_csi2 *csi2);
+int ipu6_isys_alloc_start_streams_firmware(struct ipu6_isys_csi2 *csi2,
+					   struct v4l2_subdev_state *state,
+					   struct v4l2_mbus_frame_desc *desc);
+void ipu6_isys_stop_streams_firmware(struct ipu6_isys_csi2 *csi2);
+void ipu6_isys_close_streams_firmware(struct ipu6_isys_csi2 *csi2);
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state);
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
@@ -102,7 +105,6 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_pad *source_pad);
 int ipu6_isys_video_init(struct ipu6_isys_video *av);
 void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
-void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
 struct ipu6_isys_stream *
 ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle);
 struct ipu6_isys_stream *
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 04058252ac01..d7e69195c84d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -162,23 +162,6 @@ isys_complete_ext_device_registration(struct ipu6_isys *isys,
 	return ret;
 }
 
-static void isys_stream_init(struct ipu6_isys *isys)
-{
-	u32 i;
-
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-		mutex_init(&isys->streams[i].mutex);
-		init_completion(&isys->streams[i].stream_open_completion);
-		init_completion(&isys->streams[i].stream_close_completion);
-		init_completion(&isys->streams[i].stream_start_completion);
-		init_completion(&isys->streams[i].stream_stop_completion);
-		INIT_LIST_HEAD(&isys->streams[i].queues);
-		isys->streams[i].isys = isys;
-		isys->streams[i].stream_handle = i;
-		isys->streams[i].vc = INVALID_VC_ID;
-	}
-}
-
 static void isys_csi2_unregister_subdevices(struct ipu6_isys *isys)
 {
 	const struct ipu6_isys_internal_csi2_pdata *csi2 =
@@ -344,21 +327,15 @@ static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 	source = csi2->asd.source;
 	for (i = 0; i < NR_OF_CSI2_VC; i++) {
 		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
-			stream = ipu6_isys_query_stream_by_source(csi2->isys,
-								  source, i);
-			if (stream) {
+			stream = csi2->streams_by_vc[i];
+			if (stream)
 				ipu6_isys_csi2_sof_event_by_stream(stream);
-				ipu6_isys_put_stream(stream);
-			}
 		}
 
 		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
-			stream = ipu6_isys_query_stream_by_source(csi2->isys,
-								  source, i);
-			if (stream) {
+			stream = csi2->streams_by_vc[i];
+			if (stream)
 				ipu6_isys_csi2_eof_event_by_stream(stream);
-				ipu6_isys_put_stream(stream);
-			}
 		}
 	}
 }
@@ -1011,7 +988,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	struct ipu6_device *isp = adev->isp;
 	const struct firmware *fw;
 	struct ipu6_isys *isys;
-	unsigned int i;
 	int ret;
 
 	if (!isp->bus_ready_to_probe)
@@ -1052,7 +1028,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	dev_set_drvdata(&auxdev->dev, isys);
 
-	isys_stream_init(isys);
+	ida_init(&isys->streams);
 
 	if (!isp->secure_mode) {
 		fw = isp->cpd_fw;
@@ -1097,9 +1073,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (!isp->secure_mode)
 		release_firmware(adev->fw);
 
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
-		mutex_destroy(&isys->streams[i].mutex);
-
 	mutex_destroy(&isys->mutex);
 	mutex_destroy(&isys->stream_mutex);
 
@@ -1111,7 +1084,8 @@ static void isys_remove(struct auxiliary_device *auxdev)
 	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
 	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
 	struct ipu6_device *isp = adev->isp;
-	unsigned int i;
+
+	ida_destroy(&isys->streams);
 
 	free_fw_msg_bufs(isys);
 
@@ -1126,9 +1100,6 @@ static void isys_remove(struct auxiliary_device *auxdev)
 		release_firmware(adev->fw);
 	}
 
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
-		mutex_destroy(&isys->streams[i].mutex);
-
 	mutex_destroy(&isys->stream_mutex);
 	mutex_destroy(&isys->mutex);
 }
@@ -1209,7 +1180,8 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 		goto leave;
 	}
 
-	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_handle);
+	stream = resp->stream_handle < IPU6_ISYS_MAX_STREAMS ?
+		isys->streams_by_handle[resp->stream_handle] : NULL;
 	if (!stream) {
 		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
 			resp->stream_handle);
@@ -1288,7 +1260,6 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 		break;
 	}
 
-	ipu6_isys_put_stream(stream);
 leave:
 	ipu6_fw_isys_put_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
 	return 0;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 0689b4485c7f..8a5086439f21 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -4,6 +4,7 @@
 #ifndef IPU6_ISYS_H
 #define IPU6_ISYS_H
 
+#include <linux/idr.h>
 #include <linux/irqreturn.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -102,8 +103,8 @@ struct ipu6_isys {
 	u32 isr_csi2_bits;
 	u32 csi2_rx_ctrl_cached;
 	spinlock_t streams_lock;
-	struct ipu6_isys_stream streams[IPU6_ISYS_MAX_STREAMS];
-	int streams_ref_count[IPU6_ISYS_MAX_STREAMS];
+	struct ipu6_isys_stream *streams_by_handle[IPU6_ISYS_MAX_STREAMS];
+	struct completion stream_completion;
 	void *fwcom;
 	u32 phy_termcal_val;
 	bool need_reset;
@@ -131,6 +132,7 @@ struct ipu6_isys {
 	struct list_head framebuflist;
 	struct list_head framebuflist_fw;
 	struct v4l2_async_notifier notifier;
+	struct ida streams;
 };
 
 struct isys_fw_msgs {
-- 
2.47.3


