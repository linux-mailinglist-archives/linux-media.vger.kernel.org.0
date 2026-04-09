Return-Path: <linux-media+bounces-58393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCkBG3kJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B213CF542
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFBC33051BDD
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6201C3385B9;
	Thu,  9 Apr 2026 20:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDypaPqE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D7339B2D
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765715; cv=none; b=kK4HC8Y4Ap7rhKwQMcjEMQWsx2hgNhPtrKQtfmhZQp4+0kC/iZ5302RRJbDkDGc9fQE0D+kFewk/04CwFY65z8Mf9CSWDsrfJ8cT70MpzZgU4G1opYX+X2RtZ1O/64aQL6kqqjsiv+kd4fQhCo/lpkh3bLhMIWsBsi/M2Gflnpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765715; c=relaxed/simple;
	bh=YIa6US+EetUk+0awvaXbwcGm0XQHDgeCJ5nfnv5LNUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gihaPDxzoxJ75vD3geUjf/eS/CGnMms33DXVRtaqyhbYXbFi3VEE8xQz/OApJxMAxtTIeL3QlN0VtAOUu5E+KiyVapZnfDaI2ycrHwOxboZZq2/kbUdQ2bYfHpj74rPTzSc5JlZJNR3s49PBOpIeOxGKZdZ8LqVdHehxZTDiIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RDypaPqE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765714; x=1807301714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YIa6US+EetUk+0awvaXbwcGm0XQHDgeCJ5nfnv5LNUo=;
  b=RDypaPqETRSCKRCM2jT1ja/KLdurY8G+kkCvLwvpCF4/DXRdl5lkf9di
   MovF3iToUUWK0VfdrJE5LPpPAoDIyZdQYmMen10rFR6eNqcvRNRZeeSql
   vzME+/w4Vf9NMEO3bwaIw6ynplF/WGbQ7KmkpcsbENus19v536Ck/Dnxj
   w9pSGt7TH0OWpydHN/J+qyey4oQ2pE6bsdAouz6iuVf6tlNrJLBA3lXxO
   umGeUs54F0yo6RqVZzC78X43CyS1jmbkz5uElHHKlzh6CKQ1l2k0GRLRT
   KgDmK7PJ/btGBDq3BpQDGUN5GOH0Y1GM6AqqFMyR4CzDFA9BpaHMmCcKc
   w==;
X-CSE-ConnectionGUID: TtBom2sjSseRjb1npXg7lw==
X-CSE-MsgGUID: lETVZyLnQyqJbIWfFsz4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408744"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: O0yi4gYpSROzyqW/hrcW3A==
X-CSE-MsgGUID: i9q+0jmsStKd1qa1XZlsEg==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3418D121DB4;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045pE-2p5A;
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
Subject: [PATCH v12 67/86] media: ipu6: Move streaming control to CSI-2 receiver driver
Date: Thu,  9 Apr 2026 23:14:42 +0300
Message-ID: <20260409201501.975242-68-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58393-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8B213CF542
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the streaming control out of the video nodes to the CSI-2 receiver
driver which is better positioned to consider stream configuration and so
when to actually start and stop streaming.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 40 ++++++++--
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 43 ++++-------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  2 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 22 ++++--
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  2 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 73 ++++++-------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  6 +-
 7 files changed, 96 insertions(+), 92 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index e01a8518c15a..93ae5f767cc0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -23,6 +23,7 @@
 #include "ipu6-isys.h"
 #include "ipu6-isys-csi2.h"
 #include "ipu6-isys-subdev.h"
+#include "ipu6-isys-video.h"
 #include "ipu6-platform-isys-csi2-reg.h"
 
 static const u32 csi2_supported_codes[] = {
@@ -354,10 +355,19 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_isys_csi2_timing timing = { };
 	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
+	struct media_pad *remote_pad,
+		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
+	struct ipu6_isys_video *av =
+		container_of_const(vdev_pad, struct ipu6_isys_video, pad);
 	u64 sink_streams;
 	int ret;
 
+	ret = ipu6_isys_start_stream_firmware(av);
+	if (ret) {
+		dev_err(sd->dev, "start stream of firmware failed\n");
+		return ret;
+	}
+
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
@@ -367,28 +377,38 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 	if (ret)
-		return ret;
+		goto err_stop_stream_firmware;
 
 	ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
 	if (ret)
-		return ret;
+		goto err_stop_stream_firmware;
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
 					 sink_streams);
-	if (ret) {
-		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
-		return ret;
-	}
+	if (ret)
+		goto err_stop_stream_csi2;
 
 	return 0;
+
+err_stop_stream_csi2:
+	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+
+err_stop_stream_firmware:
+	ipu6_isys_stop_streaming_firmware(av);
+	ipu6_isys_close_streaming_firmware(av);
+
+	return ret;
 }
 
 static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_state *state,
 					  u32 pad, u64 streams_mask)
 {
+	struct media_pad *remote_pad,
+		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
+	struct ipu6_isys_video *av =
+		container_of_const(vdev_pad, struct ipu6_isys_video, pad);
 	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
 	u64 sink_streams;
 
 	sink_streams =
@@ -398,10 +418,14 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
+	ipu6_isys_stop_streaming_firmware(av);
+
 	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
+	ipu6_isys_close_streaming_firmware(av);
+
 	return 0;
 }
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index fabaed63df0c..7f24b113338c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -21,6 +21,7 @@
 #include "ipu6-dma.h"
 #include "ipu6-fw-isys.h"
 #include "ipu6-isys.h"
+#include "ipu6-isys-queue.h"
 #include "ipu6-isys-video.h"
 
 static int ipu6_isys_buf_init(struct vb2_buffer *vb)
@@ -191,8 +192,8 @@ static void flush_firmware_streamon_fail(struct ipu6_isys_stream *stream)
  * that contains one entry from each video buffer queue. If a buffer can't be
  * obtained from every queue, the buffers are returned back to the queue.
  */
-static int buffer_list_get(struct ipu6_isys_stream *stream,
-			   struct ipu6_isys_buffer_list *bl)
+int ipu6_isys_buffer_list_get(struct ipu6_isys_stream *stream,
+			      struct ipu6_isys_buffer_list *bl)
 {
 	struct device *dev = &stream->isys->adev->auxdev.dev;
 	struct ipu6_isys_queue *aq;
@@ -286,29 +287,26 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 }
 
 /* Start streaming for real. The buffer list must be available. */
-static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
-				  struct ipu6_isys_buffer_list *bl)
+static int ipu6_isys_stream_start(struct ipu6_isys_video *av)
 {
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &stream->isys->adev->auxdev.dev;
-	struct ipu6_isys_buffer_list __bl;
+	struct ipu6_isys_buffer_list bl;
 	int ret;
 
 	guard(mutex)(&stream->isys->stream_mutex);
-	ret = ipu6_isys_video_set_streaming(av, 1, bl);
+	ret = ipu6_isys_video_set_streaming(av, 1);
 	if (ret)
-		goto out_requeue;
+		return ret;
 
 	stream->streaming = 1;
 
-	bl = &__bl;
-
 	do {
 		struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 		struct isys_fw_msgs *msg;
 		u16 send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE;
 
-		ret = buffer_list_get(stream, bl);
+		ret = ipu6_isys_buffer_list_get(stream, &bl);
 		if (ret < 0)
 			break;
 
@@ -317,11 +315,11 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 			return -ENOMEM;
 
 		buf = &msg->fw_msg.frame;
-		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
+		ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
 		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
 						 stream->nr_output_pins);
-		ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE,
-					    0);
+		ipu6_isys_buffer_list_queue(&bl,
+					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 		ret = ipu6_fw_isys_complex_cmd(stream->isys,
 					       stream->stream_handle, buf,
 					       msg->dma_addr, sizeof(*buf),
@@ -330,9 +328,8 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 
 	return 0;
 
-out_requeue:
-	if (bl && bl->nbufs)
-		ipu6_isys_buffer_list_queue(bl,
+	if (bl.nbufs)
+		ipu6_isys_buffer_list_queue(&bl,
 					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,
 					    VB2_BUF_STATE_QUEUED);
 	flush_firmware_streamon_fail(stream);
@@ -384,7 +381,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	 * (above). Let's see whether all queues in the pipeline would
 	 * have a buffer.
 	 */
-	ret = buffer_list_get(stream, &bl);
+	ret = ipu6_isys_buffer_list_get(stream, &bl);
 	if (ret < 0) {
 		dev_dbg(dev, "No buffers available\n");
 		goto out;
@@ -536,7 +533,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct ipu6_isys_buffer_list __bl, *bl = NULL;
 	struct ipu6_isys_stream *stream;
 	struct media_pad *source_pad, *remote_pad;
 	int nr_queues, ret;
@@ -597,14 +593,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	if (stream->nr_streaming != stream->nr_queues)
 		goto out;
 
-	bl = &__bl;
-	ret = buffer_list_get(stream, bl);
-	if (ret < 0) {
-		dev_warn(dev, "no buffer available, DRIVER BUG?\n");
-		goto out;
-	}
-
-	ret = ipu6_isys_stream_start(av, bl);
+	ret = ipu6_isys_stream_start(av);
 	if (ret)
 		goto out_stream_start;
 
@@ -643,7 +632,7 @@ static void stop_streaming(struct vb2_queue *q)
 
 	mutex_lock(&av->isys->stream_mutex);
 	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
-		ipu6_isys_video_set_streaming(av, 0, NULL);
+		ipu6_isys_video_set_streaming(av, 0);
 	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index dec1fed44dd2..f2e887dad861 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -60,6 +60,8 @@ struct ipu6_isys_buffer_list {
 void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
 				 unsigned long op_flags,
 				 enum vb2_buffer_state state);
+int ipu6_isys_buffer_list_get(struct ipu6_isys_stream *stream,
+			      struct ipu6_isys_buffer_list *bl);
 void
 ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 			      struct ipu6_isys_stream *stream,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 2ae15343bc0f..5dd2c2995d01 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -269,17 +269,13 @@ static int subdev_set_routing(struct v4l2_subdev *sd,
 	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
 }
 
-u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
+u32 __ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev_state *state,
+					  u32 pad)
 {
-	struct v4l2_subdev_state *state;
 	struct v4l2_subdev_route *routes;
 	unsigned int i;
 	u32 source_stream = 0;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	if (!state)
-		return 0;
-
 	routes = state->routing.routes;
 	for (i = 0; i < state->routing.num_routes; i++) {
 		if (routes[i].source_pad == pad) {
@@ -288,6 +284,20 @@ u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
 		}
 	}
 
+	return source_stream;
+}
+
+u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
+{
+	struct v4l2_subdev_state *state;
+	u32 source_stream = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return 0;
+
+	source_stream = __ipu6_isys_get_src_stream_by_src_pad(state, pad);
+
 	v4l2_subdev_unlock_state(state);
 
 	return source_stream;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index d4f76d513dc6..b892d96992af 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -38,6 +38,8 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum
 				    *code);
+u32 __ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev_state *state,
+					  u32 pad);
 u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
 int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 284002ab1e77..b6f2ef0822a7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -477,7 +477,7 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	int output_pins;
 	u32 src_stream;
 
-	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
+	src_stream = __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->index);
 	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
 	v4l2_crop = *v4l2_subdev_state_get_crop(state, src_pad->index, src_stream);
 
@@ -525,11 +525,11 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	return 0;
 }
 
-static int start_stream_firmware(struct ipu6_isys_video *av,
-				 struct ipu6_isys_buffer_list *bl)
+int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av)
 {
 	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
+	struct ipu6_isys_buffer_list bl;
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct isys_fw_msgs *msg = NULL;
@@ -537,6 +537,12 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	int ret, retout, tout;
 	u16 send_type;
 
+	ret = ipu6_isys_buffer_list_get(stream, &bl);
+	if (ret < 0) {
+		dev_warn(dev, "no buffer available, DRIVER BUG?\n");
+		return ret;
+	}
+
 	msg = ipu6_get_fw_msg_buf(stream);
 	if (!msg)
 		return -ENOMEM;
@@ -592,33 +598,21 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	}
 	dev_dbg(dev, "start stream: open complete\n");
 
-	if (bl) {
-		msg = ipu6_get_fw_msg_buf(stream);
-		if (!msg) {
-			ret = -ENOMEM;
-			goto out_put_stream_opened;
-		}
-		buf = &msg->fw_msg.frame;
-		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
-		ipu6_isys_buffer_list_queue(bl,
-					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+	msg = ipu6_get_fw_msg_buf(stream);
+	if (!msg) {
+		ret = -ENOMEM;
+		goto out_put_stream_opened;
 	}
+	buf = &msg->fw_msg.frame;
+	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
+	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 
 	reinit_completion(&stream->stream_start_completion);
 
-	if (bl) {
-		send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE;
-		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
-						 stream_cfg->nof_output_pins);
-		ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle,
-					       buf, msg->dma_addr,
-					       sizeof(*buf), send_type);
-	} else {
-		send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START;
-		ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
-					      send_type);
-	}
-
+	send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE;
+	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream_cfg->nof_output_pins);
+	ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle, buf,
+				       msg->dma_addr, sizeof(*buf), send_type);
 	if (ret < 0) {
 		dev_err(dev, "can't start streaming (%d)\n", ret);
 		goto out_stream_close;
@@ -666,7 +660,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	return ret;
 }
 
-static void stop_streaming_firmware(struct ipu6_isys_video *av)
+void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av)
 {
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct ipu6_isys_stream *stream = av->stream;
@@ -692,7 +686,7 @@ static void stop_streaming_firmware(struct ipu6_isys_video *av)
 		dev_dbg(dev, "stop stream: complete\n");
 }
 
-static void close_streaming_firmware(struct ipu6_isys_video *av)
+void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av)
 {
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &av->isys->adev->auxdev.dev;
@@ -990,8 +984,7 @@ static u64 get_stream_mask_by_pipeline(struct ipu6_isys_video *__av)
 	return stream_mask;
 }
 
-int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
-				  struct ipu6_isys_buffer_list *bl)
+int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
 {
 	struct v4l2_subdev_krouting *routing;
 	struct ipu6_isys_stream *stream = av->stream;
@@ -1021,8 +1014,6 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 	stream_mask = get_stream_mask_by_pipeline(av);
 	if (!state) {
-		stop_streaming_firmware(av);
-
 		/* stop sub-device which connects with video */
 		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
 			sd->name, r_pad->index, stream_mask);
@@ -1031,34 +1022,18 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 		if (ret)
 			dev_err(dev, "stream off %s failed with %d\n", sd->name,
 				ret);
-
-		close_streaming_firmware(av);
 	} else {
-		ret = start_stream_firmware(av, bl);
-		if (ret) {
-			dev_err(dev, "start stream of firmware failed\n");
-			return ret;
-		}
-
 		/* start sub-device which connects with video */
 		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
 			r_pad->index, stream_mask);
 		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
-		if (ret) {
+		if (ret)
 			dev_err(dev, "stream on %s failed with %d\n", sd->name,
 				ret);
-			goto out_media_entity_stop_streaming_firmware;
-		}
 	}
 
 	av->streaming = state;
 
-	return 0;
-
-out_media_entity_stop_streaming_firmware:
-	stop_streaming_firmware(av);
-	close_streaming_firmware(av);
-
 	return ret;
 }
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 2ff53315d7b9..72d413026d3e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -104,11 +104,13 @@ extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
 
 const struct ipu6_isys_pixelformat *
 ipu6_isys_get_isys_format(u32 pixelformat, u32 code);
+int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av);
+void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av);
+void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av);
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 				   struct media_entity *source_entity,
 				   int nr_queues);
-int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
-				  struct ipu6_isys_buffer_list *bl);
+int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state);
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
-- 
2.47.3


