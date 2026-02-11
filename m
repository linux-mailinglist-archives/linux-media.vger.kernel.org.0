Return-Path: <linux-media+bounces-52590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHhhE15HjGkHkgAAu9opvQ
	(envelope-from <linux-media+bounces-52590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:09:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C72C41228D7
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4732E305042D
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9892C354AE2;
	Wed, 11 Feb 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2lzEeFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566E354AEE
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800978; cv=none; b=O7cwEZoUM0dXrhjBOO6Ks0WOy9+1maCZoBMrDXz2f+j/LkM4/y3OSu+4JSEzHEtNCqbFX8/eINv5peBlOz+TJEIwjo3Z6lUKCippJEUHIODHcDku3N6MysRg42nwGDGTNqye6irqW4rysm4tGYgTWe/cwlQVDTPMCVQKYEvzRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800978; c=relaxed/simple;
	bh=2upWEUvJa/LO4gyFi2gWj0Y2xExSO/u/ZehXHayO3TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha73KYgCKypqlPDr/03/oiGOsIJnMlSB9LObIDM3Fqb+9KjLSA42AyugCkkHXW1YNcSaOYmouqQ0mICS8vssn6ly+KoJgj0dEx9BCiohiGDbxDoxvsfAsrD8Uy0/uC03cQFu2f1EgFthhKnJ3dgs6kuEM6zXnwsFhCxegB5qtRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2lzEeFK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770800976; x=1802336976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2upWEUvJa/LO4gyFi2gWj0Y2xExSO/u/ZehXHayO3TI=;
  b=F2lzEeFKxLam89U1fBFoZrr/E2zFFNpXUwzM/BdAy7giiKGis1wm8dXf
   UMF6mKhY3PwhUGBJwISwwh2z61mE5M/zW8ybcWYmrNyWgCx2fOLB1L+LB
   67kLNziNvhxcy6TE5dUJtF2w4g95+PXZZFE8TrJz5T2VYSQQAq9rVSXVg
   SIxvsB3VuvFECi8UCCuoGF4p/hXgnH97U8C9XXQJL2prLbuuUZYqKfhNK
   7wJjSJce4IDtNDD9emli6H+iHoQgoVAPkq70vxD1Kj5cWfCj55UjmkiDC
   tg78VEfn4MESecFqSRfjczrAwDCKRXaGfDzlkAOer6w8m99mSfzNOoudF
   Q==;
X-CSE-ConnectionGUID: Rkw7+Hm/RPWTIVmn6oRsng==
X-CSE-MsgGUID: ZYPOC43XReumsH4KyfOs+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72019053"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72019053"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:33 -0800
X-CSE-ConnectionGUID: w3rBcxkSTFC/16/ekyCUVA==
X-CSE-MsgGUID: 9nzJ8RyNTee/DC3fKIDQ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212222864"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:24 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C5AF3121D54;
	Wed, 11 Feb 2026 11:09:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vq6Do-00000007laO-2m3R;
	Wed, 11 Feb 2026 11:09:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v2 10/14] media: v4l2-subdev: Move subdev client capabilities into a new struct
Date: Wed, 11 Feb 2026 11:09:16 +0200
Message-ID: <20260211090920.1851141-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52590-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C72C41228D7
X-Rspamd-Action: no action

Add struct v4l2_subdev_client_info to hold sub-device client capability
bits that used to be stored in the client_caps field of struct
v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
pad operation callbacks for capability information. The main reason why
this is a new struct instead of a u64 field is that modifying the callback
arguments requires touching almost every sub-device driver and that is
desirable to avoid in the future, should more than the client capability bits
need to be known to the callbacks.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
 include/media/v4l2-subdev.h           | 12 ++++++++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 8a433d074587..79fb4643182a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -611,7 +611,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (!(subdev_fh->client_caps &
+		if (!(subdev_fh->ci.client_caps &
 		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
 			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
@@ -651,7 +651,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
 	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
-	bool client_supports_streams = subdev_fh->client_caps &
+	bool client_supports_streams = subdev_fh->ci.client_caps &
 				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 	int rval;
 
@@ -1124,7 +1124,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-		client_cap->capabilities = subdev_fh->client_caps;
+		client_cap->capabilities = subdev_fh->ci.client_caps;
 
 		return 0;
 	}
@@ -1144,7 +1144,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
 					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
 
-		subdev_fh->client_caps = client_cap->capabilities;
+		subdev_fh->ci.client_caps = client_cap->capabilities;
 
 		return 0;
 	}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index de2684b15b96..c9fe99ea7841 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -734,6 +734,14 @@ struct v4l2_subdev_state {
 	struct v4l2_subdev_stream_configs stream_configs;
 };
 
+/**
+ * struct v4l2_subdev_client_info - Sub-device client information
+ * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
+ */
+struct v4l2_subdev_client_info {
+	u64 client_caps;
+};
+
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
@@ -1129,14 +1137,14 @@ struct v4l2_subdev {
  * @vfh: pointer to &struct v4l2_fh
  * @state: pointer to &struct v4l2_subdev_state
  * @owner: module pointer to the owner of this file handle
- * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
+ * @ci: sub-device client info related to this file handle
  */
 struct v4l2_subdev_fh {
 	struct v4l2_fh vfh;
 	struct module *owner;
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	struct v4l2_subdev_state *state;
-	u64 client_caps;
+	struct v4l2_subdev_client_info ci;
 #endif
 };
 
-- 
2.47.3


