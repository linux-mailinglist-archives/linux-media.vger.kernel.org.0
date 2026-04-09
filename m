Return-Path: <linux-media+bounces-58386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFbXEeAI2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 910663CF3E6
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A460E300D57C
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4919F261B8D;
	Thu,  9 Apr 2026 20:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1uObbO8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56213635E
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765711; cv=none; b=NzXqnUX9tWZC1GWlf+1zyrGTUMJuF5zh9XrbYkOqR/iwRBm2fkYcyozj7Go/Z6YtbQh2twxs9IcosQFfdKnUPoiwq4bOQXJh4Kbl1OswqtSTW9QAGSzDQ+FuAXCNk0DXcFhqw+HfNqUCYEPbzLFfQBlH7PrWAGdI0rea/hvoTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765711; c=relaxed/simple;
	bh=ZHt5cecpWuZYbS8uwamLVIUKFZtf0Kcz/FzaCHf5zEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhgRE6jb9WDYXbGTjgIzAdUf4c+hdxPa+5IREiNIqIIQgpSd9QHjXkU3Zr9zvv9l0ndmOtDcFzMRO57dmChvdsvIWzhdJpGIZimz6eQ2JoYBdOOV4X3QjKGBO7EGdk0zICIFO6coR+WL5U4sQZPebdIqqe1EluZ5slOUNsIuAnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1uObbO8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765710; x=1807301710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZHt5cecpWuZYbS8uwamLVIUKFZtf0Kcz/FzaCHf5zEk=;
  b=k1uObbO8XLVFILnLRoNi0fhH4oDwj7Hs6JgSqVxLSjsj4hzBGN0vmxJ1
   Djq7p+sq0VmQlHzjgVdqBQbXUWyv9XPTWuKhztMnesg9yixzwEiFslenG
   d9Uc8ir/9fkAfqUioQrHiG/AEci7Oh3PLw6ZMl6gXzBbQ9tllMckQX2aO
   tGni3CFMYLF5D072AFP3tbG69UXM7fnDkI+P3dT7hflInO9mI5usY6SCT
   vexjx3gxItGJacaaC1OzldYEmVlvpLj2hFdL4yOIcKyt69XZwedTPddrW
   p2EIHaogtObIv8ILq6SB6tP+f8Nj7tT7oGIw86EWlVWwrNXAs0r70qzTX
   A==;
X-CSE-ConnectionGUID: jJI9zDQPTbuofqXkKLQXow==
X-CSE-MsgGUID: lLL7CGYOSP6aozwp8vDNKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408654"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408654"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:09 -0700
X-CSE-ConnectionGUID: dJBqUG9ISWSeBPEFbW8eHQ==
X-CSE-MsgGUID: LkH7UH4sRcSfu0wgugE/yg==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 36EC3121DC9;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045pJ-2skg;
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
Subject: [PATCH v12 68/86] media: ipu6: Stream number on CSI-2 receiver source pads is always 0
Date: Thu,  9 Apr 2026 23:14:43 +0300
Message-ID: <20260409201501.975242-69-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58386-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 910663CF3E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The stream number on the video nodes' single pad is always 0, thus the
stream number of the CSI-2 receivers' source pads is also 0. Remove the
complexity that is there to come up with 0.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 49 ++-----------------
 1 file changed, 5 insertions(+), 44 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index b6f2ef0822a7..164000985c0d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -967,66 +967,27 @@ ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc)
 	return stream;
 }
 
-static u64 get_stream_mask_by_pipeline(struct ipu6_isys_video *__av)
-{
-	struct media_pipeline *pipeline =
-		media_entity_pipeline(&__av->vdev.entity);
-	unsigned int i;
-	u64 stream_mask = 0;
-
-	for (i = 0; i < NR_OF_CSI2_SRC_PADS; i++) {
-		struct ipu6_isys_video *av = &__av->csi2->av[i];
-
-		if (pipeline == media_entity_pipeline(&av->vdev.entity))
-			stream_mask |= BIT_ULL(av->source_stream);
-	}
-
-	return stream_mask;
-}
-
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
 {
-	struct v4l2_subdev_krouting *routing;
-	struct ipu6_isys_stream *stream = av->stream;
-	struct v4l2_subdev_state *subdev_state;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct v4l2_subdev *sd;
 	struct media_pad *r_pad;
-	u32 sink_pad, sink_stream;
-	u64 r_stream;
-	u64 stream_mask = 0;
 	int ret = 0;
 
-	dev_dbg(dev, "set stream: %d\n", state);
-
-	sd = &stream->asd->sd;
+	sd = &av->stream->asd->sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
-	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
-
-	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
-	routing = &subdev_state->routing;
-	ret = v4l2_subdev_routing_find_opposite_end(routing, r_pad->index,
-						    r_stream, &sink_pad,
-						    &sink_stream);
-	v4l2_subdev_unlock_state(subdev_state);
-	if (ret)
-		return ret;
 
-	stream_mask = get_stream_mask_by_pipeline(av);
 	if (!state) {
 		/* stop sub-device which connects with video */
-		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
-			sd->name, r_pad->index, stream_mask);
-		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
-						  stream_mask);
+		dev_dbg(dev, "stream off %s pad:%d\n", sd->name, r_pad->index);
+		ret = v4l2_subdev_disable_streams(sd, r_pad->index, 1);
 		if (ret)
 			dev_err(dev, "stream off %s failed with %d\n", sd->name,
 				ret);
 	} else {
 		/* start sub-device which connects with video */
-		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
-			r_pad->index, stream_mask);
-		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
+		dev_dbg(dev, "stream on %s pad %d\n", sd->name, r_pad->index);
+		ret = v4l2_subdev_enable_streams(sd, r_pad->index, 1);
 		if (ret)
 			dev_err(dev, "stream on %s failed with %d\n", sd->name,
 				ret);
-- 
2.47.3


