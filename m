Return-Path: <linux-media+bounces-58397-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGphLZQJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58397-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E43CF587
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9269305A8B1
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7E123535E;
	Thu,  9 Apr 2026 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Emq7E5jV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEC733AD9C
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765717; cv=none; b=HhA5gPsuXzxpubuOWY7nCLqF5Iv5iRCvQlxyJK1WkiLyfDgtDwBHGm8MBjTYvnYWAi8usl+tHXGSbD2Wu94rNP67JsiqJYeKjYe45r/pxgWOQcsp94lz5+MAfsIpVektzF5A8XpmCL8tQZoazp0xZB/qgxdEqZWpPazv1Lj8VDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765717; c=relaxed/simple;
	bh=3U3pAtnij25RtMXSC0+p5ERrDmHCjTnzZTS2H0KuUgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tA18ACiuQXWQwKzufMnlT7Z+mO2N4WyaZak/TEVR6+nXDS10LN9VS5R/9i4hBH7pNJPfywolPNZEpsK1Fzt8Oyxzyxi/IMboQGWIud6bcA9x7j44U2O1htxAyW0v8gU2/6zQQxjHgastG8vk/X1Rsb757OFd9xHiTKTOrym8ca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Emq7E5jV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765716; x=1807301716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3U3pAtnij25RtMXSC0+p5ERrDmHCjTnzZTS2H0KuUgY=;
  b=Emq7E5jVmsGNtS6qumIWpPGw/YD9B9cd7z69hZALekMwwnm1xp1E5rSW
   BdIsqxFhgkewczeFEmoRyWh4fyYN8/DCL7fOIlb1J0HwbuMEqWw+NrXt7
   0T8Wo+kpkDz3wBTgrnMKoqhXTFPaJuA7uH+zySd6D5kK8xoDdLalIjyCa
   Fu5F8BJ7Fk/DDPaM8CaokRNgF3IAwdk/Bt9gTf8KNOaesN3udDRB2R7Cc
   vCcXeTV2mQ8cG3t9GKklEsmcJDoVMIAWvioWtkGsCPmhgCzAFLWc1yDN0
   c1CjzLmTN5HAZhTWzkkjg5JuqWYDfY0VHgeV96gbOsJ+jjk37hv1K10t4
   A==;
X-CSE-ConnectionGUID: BOIthvpjRMmyyizWwQm/dQ==
X-CSE-MsgGUID: k6suCHjYQkC54ujM3fDd0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408799"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: H12kaWxdQ8SrZhBhI7bl+w==
X-CSE-MsgGUID: YGcpE+LuQq286U5As8XW3w==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 57625122034;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045py-3R2J;
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
Subject: [PATCH v12 76/86] media: ipu6: Remove nr_queues and nr_streaming fields in ipu6_isys_stream
Date: Thu,  9 Apr 2026 23:14:51 +0300
Message-ID: <20260409201501.975242-77-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58397-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F1E43CF587
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

nr_queues and nr_streaming fields were being used to determine whether
streaming was to be started in the upstream sub-device. As we store the
streaming state in the CSI-2 sub-device, there's no longer need for that.
Drop these fields.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  5 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  1 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 24 +++++++++----------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 19 ++++-----------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  7 ++----
 5 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index f37e25063d6d..c2f4ea444e8e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -432,6 +432,8 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_stop_stream_csi2;
 
+	csi2->streaming = true;
+
 	return 0;
 
 err_stop_stream_csi2:
@@ -452,6 +454,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 					  u32 pad, u64 streams_mask)
 {
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(asd);
 	struct media_pad *remote_pad,
 		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
 	struct ipu6_isys_video *av =
@@ -479,6 +482,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_close_streaming_firmware(av);
 
+	csi2->streaming = false;
+
 out_del_csi2_entry:
 	list_del(&av->csi2_entry);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index bcddd5626531..9178638edd37 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -44,6 +44,7 @@ struct ipu6_isys_csi2 {
 	u32 receiver_errors;
 	unsigned int nlanes;
 	unsigned int port;
+	bool streaming;
 };
 
 struct ipu6_isys_csi2_timing {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 7df13d330667..b7c7ccae0452 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -296,6 +296,9 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av)
 	if (ret)
 		return ret;
 
+	if (!av->csi2->streaming)
+		return 0;
+
 	do {
 		struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 		struct isys_fw_msgs *msg;
@@ -343,6 +346,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 	struct ipu6_isys_stream *stream = av->stream;
+	struct ipu6_isys_csi2 *csi2;
 	struct ipu6_isys_buffer_list bl;
 	struct isys_fw_msgs *msg;
 	unsigned long flags;
@@ -366,7 +370,8 @@ static void buf_queue(struct vb2_buffer *vb)
 
 	mutex_lock(&stream->mutex);
 
-	if (stream->nr_streaming != stream->nr_queues) {
+	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	if (!csi2->streaming) {
 		dev_dbg(dev, "not streaming yet, adding to incoming\n");
 		goto out;
 	}
@@ -530,7 +535,8 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct ipu6_isys_stream *stream;
 	struct media_pad *source_pad, *remote_pad;
-	int nr_queues, ret;
+	bool first;
+	int ret;
 
 	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
 		av->vdev.name, ipu6_isys_get_frame_width(av),
@@ -550,11 +556,12 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out_return_buffers;
 	}
 
-	ret = ipu6_isys_setup_video(av, remote_pad, source_pad, &nr_queues);
+	ret = ipu6_isys_setup_video(av, remote_pad, source_pad);
 	if (ret < 0) {
 		dev_dbg(dev, "failed to setup video\n");
 		goto out_return_buffers;
 	}
+	first = ret;
 
 	ret = ipu6_isys_link_fmt_validate(aq);
 	if (ret) {
@@ -570,17 +577,12 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 
 	stream = av->stream;
 	mutex_lock(&stream->mutex);
-	if (!stream->nr_streaming) {
-		ret = ipu6_isys_video_prepare_stream(av, source_pad->entity,
-						     nr_queues);
+	if (first) {
+		ret = ipu6_isys_video_prepare_stream(av, source_pad->entity);
 		if (ret)
 			goto out_fw_close;
 	}
 
-	stream->nr_streaming++;
-	dev_dbg(dev, "queue %u of %u\n", stream->nr_streaming,
-		stream->nr_queues);
-
 	list_add(&aq->node, &stream->queues);
 	ipu6_isys_configure_stream_watermark(av, source_pad->entity);
 	ipu6_isys_update_stream_watermark(av, true);
@@ -596,7 +598,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 out_stream_start:
 	ipu6_isys_update_stream_watermark(av, false);
 	list_del(&aq->node);
-	stream->nr_streaming--;
 
 out_fw_close:
 	mutex_unlock(&stream->mutex);
@@ -626,7 +627,6 @@ static void stop_streaming(struct vb2_queue *q)
 	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
-	stream->nr_streaming--;
 	mutex_unlock(&stream->mutex);
 
 	ipu6_isys_stream_cleanup(av);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 1165d5bc693b..9d0ed47df280 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -714,16 +714,11 @@ void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av)
 }
 
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity,
-				   int nr_queues)
+				   struct media_entity *source_entity)
 {
 	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_csi2 *csi2;
 
-	if (WARN_ON(stream->nr_streaming))
-		return -EINVAL;
-
-	stream->nr_queues = nr_queues;
 	atomic_set(&stream->sequence, 0);
 
 	stream->seq_index = 0;
@@ -1099,7 +1094,7 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_pad *remote_pad,
-			  struct media_pad *source_pad, int *nr_queues)
+			  struct media_pad *source_pad)
 {
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
@@ -1113,16 +1108,11 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(remote_sd);
 	int ret = -EINVAL;
 
-	*nr_queues = 0;
-
 	/* Find the root */
 	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
-	for_each_active_route(&state->routing, r) {
-		(*nr_queues)++;
-
+	for_each_active_route(&state->routing, r)
 		if (r->source_pad == remote_pad->index)
 			route = r;
-	}
 
 	if (!route) {
 		v4l2_subdev_unlock_state(state);
@@ -1150,6 +1140,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 		return ret;
 	}
 
+	pipeline = video_device_pipeline(&av->vdev);
 	ret = video_device_pipeline_alloc_start(&av->vdev);
 	if (ret < 0) {
 		dev_dbg(dev, "media pipeline start failed\n");
@@ -1163,7 +1154,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 		return -EINVAL;
 	}
 
-	return 0;
+	return !pipeline;
 }
 
 /*
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index c1d10a9f44f2..5dd70175a857 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -51,8 +51,6 @@ struct ipu6_isys_stream {
 	unsigned int nr_output_pins;
 	struct ipu6_isys_subdev *asd;
 
-	int nr_queues;	/* Number of capture queues */
-	int nr_streaming;
 	struct list_head queues;
 	struct completion stream_open_completion;
 	struct completion stream_close_completion;
@@ -106,14 +104,13 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av);
 void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av);
 void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av);
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity,
-				   int nr_queues);
+				   struct media_entity *source_entity);
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state);
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_pad *remote_pad,
-			  struct media_pad *source_pad, int *nr_queues);
+			  struct media_pad *source_pad);
 int ipu6_isys_video_init(struct ipu6_isys_video *av);
 void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
 void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
-- 
2.47.3


