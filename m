Return-Path: <linux-media+bounces-52299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6De6JUDphWkLIQQAu9opvQ
	(envelope-from <linux-media+bounces-52299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D99FDF57
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43910305F205
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248003D9034;
	Fri,  6 Feb 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqZMEb1S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F23D6697
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383625; cv=none; b=RUO2V82FyW7kTqywC/xyZ7HR633M3hK+5ue6RYFQyvtxoXOMyBjEzb6TsDPAC2uLoodei9nzj7ZD9rlPzkt6DGGf873S0zZYKCKgiqw61WeWU9RWPeNWi9z7aBJjvryyOdwRG0bKPOJxyfc6mG1P57Q1s+Lcniz/qgDEgeBTY2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383625; c=relaxed/simple;
	bh=2upWEUvJa/LO4gyFi2gWj0Y2xExSO/u/ZehXHayO3TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQC5uBIaCLyuI1GM1wnto7QkV0CMlws6e2gzYjHktJA/AncerYsVBinADaGysxb8KyXbarOozDbKThY8EqebH07Pm2z01P8DfknC1vDMHJ0AtDHeFSwdecvJo7hxPvAOCqrFZTlOWgLqxsERqG9i8EOd5+xWYnrXajt1wJz2T1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqZMEb1S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770383625; x=1801919625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2upWEUvJa/LO4gyFi2gWj0Y2xExSO/u/ZehXHayO3TI=;
  b=BqZMEb1STIpmzNIgnKMMTgCFXMPWGnF5i8vUORpR+fETOWQrYtOCiyRN
   Y9Xxa8pQeycj/FbqLIx/Fkn2vuNPLzH4G9yRZ80RfcC/1yLDlXsBYiMdl
   nxSqb9alarK6pP6xSdEV4dSIvWcly2lzoflPrG4fP20vmEzF7U8p66DJp
   NKxgRBGolW7uQhAJMHh3s24jXAnZjragG3k99TWmH0yh/23sHlV7MzsDl
   EngWxDfxw21zDdF1byY7X4vhRNvXMiwsoN6DkzKrYOHbZtKQEA9EDt1Mu
   YbdIVPWETZB8sTglxhbDU6oVC9c9y3Jz+2V64JAsxk0y2ESAuC+OZweoC
   w==;
X-CSE-ConnectionGUID: DaOxFMeyTcOZ/9+N9UnmAg==
X-CSE-MsgGUID: RY3roaZrRuqYLjtt2wtPtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75441223"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75441223"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:44 -0800
X-CSE-ConnectionGUID: dpLEmA2bTIGCsEr/NqcB8w==
X-CSE-MsgGUID: AUDS9EAJRhORVmAckHvuTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215391297"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:38 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8575E121EA2;
	Fri, 06 Feb 2026 15:13:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1voLeL-00000005Tse-1cR7;
	Fri, 06 Feb 2026 15:13:29 +0200
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
Subject: [PATCH 10/13] media: v4l2-subdev: Move subdev client capabilities into a new struct
Date: Fri,  6 Feb 2026 15:13:27 +0200
Message-ID: <20260206131329.1306429-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
References: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-52299-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20D99FDF57
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


