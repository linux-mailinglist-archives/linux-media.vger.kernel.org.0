Return-Path: <linux-media+bounces-58396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGy1FOQI2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E92D93CF3ED
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04E683024571
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9DA33ADA3;
	Thu,  9 Apr 2026 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aX1AgJbz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB63368AB
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765717; cv=none; b=iICCoyJxALH5HfeMEZutB+0WaCI7498brFLvzGtEX146D3WYT8LWFxvxKK9Xq4mAHEFCTqrIQVYG7wjgP7ednHq3U85dNU8Y0jo3GOTz8r84MKHJM77ghDrwuj/r45xXy+Ap5mAHQEgUt4qYryGdNlt/g18YOLIr/qKGFfkKHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765717; c=relaxed/simple;
	bh=mh8GWOTVHWR164mnbRolvsiRel3N3/ci6+THyTN+P+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrMG57KE+lLLTK6S2jyUGNSfUu9ubAQJOLJ83CvAKO0uqx43tfS0mfC827VTTCYhy5zW+rAtZ14GFvPGglJ4qewGs6vC61ImM56YjKEe5eH9EwKRkxmu2977zi4nkasoHYwjqdUTVsUZh3uPfWfxD7cDnsyT+upuA3tkdQPZP6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aX1AgJbz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765716; x=1807301716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mh8GWOTVHWR164mnbRolvsiRel3N3/ci6+THyTN+P+g=;
  b=aX1AgJbz/wwZNVl1itPFDJbzXTjj8OfjzXUTwA2bqonBCo5+4rYLIbj0
   +3GR7VEPw6QTHvO8edPa+1CMGYceQssQMrkGmXGwqAG9qIayJMA/v965K
   8CQIDqSUYmt38BPeyNjfMU1LZP4BJUyEvosgfuIBrTQa2T16q0V2nPbC4
   hepBPRG3W5OJXoBa8EHzcF7fkqEhMgBgYvs6ksTMHHPGhDOv5pzF3iZqa
   OR9Uwm2s96PCnFtZWQ9io851IYof2lQRjgudLn/J8Bkawu3Fzsnttg2EE
   B+6Ih+X4Awph/cmPN28n/rjmLJVJLJuwTiA9bZSMvvz1JsyqKAUkFvc/q
   w==;
X-CSE-ConnectionGUID: zjRmI+jmQUSBxwxIHDENRQ==
X-CSE-MsgGUID: 6PWeALbhSBmFDf2Id/L4hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408780"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408780"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: 0YDbZJlFSTufdlO1xXqj/Q==
X-CSE-MsgGUID: eeiGQZINTOGC1vZWqvxRng==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4F834121FEE;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045po-3HyA;
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
Subject: [PATCH v12 74/86] media: ipu6: Start streaming once all queues have started, stop when not
Date: Thu,  9 Apr 2026 23:14:49 +0300
Message-ID: <20260409201501.975242-75-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58396-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: E92D93CF3ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Start streaming once all buffer queues connected via enabled routes have
been set streaming, similarly stop when the first queue is stopped.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 45 +++++++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  7 +--
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 04825cdce7c0..8deafe38be5d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/minmax.h>
 #include <linux/sprintf.h>
+#include <linux/string_choices.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
@@ -347,6 +348,42 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, bool enable)
+{
+	u32 streams_enabled = 0, nodes_streaming = 0;
+	struct v4l2_subdev_route *route;
+
+	for_each_active_route(&state->routing, route) {
+		struct media_pad *video_pad =
+			media_pad_remote_pad_unique(&asd->sd.entity.pads[route->source_pad]);
+		struct ipu6_isys_video *av = !video_pad ? NULL :
+			container_of_const(video_pad,
+					   struct ipu6_isys_video, pad);
+
+		if (!av) {
+			dev_dbg(asd->sd.dev,
+				"can't find source pad for \"%s\":%u\n",
+				asd->sd.entity.name, route->source_pad);
+			return false;
+		}
+
+		streams_enabled++;
+		if (av->streaming || (enable && pad == route->source_pad))
+			nodes_streaming++;
+	}
+
+	if (streams_enabled == nodes_streaming) {
+		dev_dbg(asd->sd.dev,
+			"changing streaming state to %s on \"%s\":%u\n",
+			str_enabled_disabled(enable), asd->sd.entity.name, pad);
+		return true;
+	}
+
+	return false;
+}
+
 static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 					 struct v4l2_subdev_state *state,
 					 u32 pad, u64 streams_mask)
@@ -364,6 +401,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	list_add(&av->csi2_entry, &csi2->av_head);
 
+	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, true))
+		return 0;
+
 	ret = ipu6_isys_start_stream_firmware(av);
 	if (ret) {
 		dev_err(sd->dev, "start stream of firmware failed\n");
@@ -409,6 +449,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_state *state,
 					  u32 pad, u64 streams_mask)
 {
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct media_pad *remote_pad,
 		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
 	struct ipu6_isys_video *av =
@@ -416,6 +457,9 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	struct v4l2_subdev *remote_sd;
 	u64 sink_streams;
 
+	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, false))
+		goto out_del_csi2_entry;
+
 	sink_streams =
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
@@ -431,6 +475,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_close_streaming_firmware(av);
 
+out_del_csi2_entry:
 	list_del(&av->csi2_entry);
 
 	return 0;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 13d759b27ca0..7df13d330667 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -585,14 +585,10 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	ipu6_isys_configure_stream_watermark(av, source_pad->entity);
 	ipu6_isys_update_stream_watermark(av, true);
 
-	if (stream->nr_streaming != stream->nr_queues)
-		goto out;
-
 	ret = ipu6_isys_stream_start(av);
 	if (ret)
 		goto out_stream_start;
 
-out:
 	mutex_unlock(&stream->mutex);
 
 	return 0;
@@ -626,8 +622,7 @@ static void stop_streaming(struct vb2_queue *q)
 	ipu6_isys_update_stream_watermark(av, false);
 
 	mutex_lock(&av->isys->stream_mutex);
-	if (stream->nr_streaming == stream->nr_queues)
-		ipu6_isys_video_set_streaming(av, 0);
+	ipu6_isys_video_set_streaming(av, 0);
 	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
-- 
2.47.3


