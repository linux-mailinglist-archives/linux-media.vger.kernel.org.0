Return-Path: <linux-media+bounces-52586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Mv3GXxHjGkHkgAAu9opvQ
	(envelope-from <linux-media+bounces-52586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:10:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4471228ED
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5FB1304DEA7
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FAE354AE2;
	Wed, 11 Feb 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zumt5Imf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D4527EFFA
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800975; cv=none; b=PqqrM3Zc/trdiNh70X0A5TzjKDYiRxKH4wSQt6t53Q54cr6VfS2Sgvl4KxQmn58MlA5Jj+AXxuYfxT6NSc+0XM1aFLKEahNGUGohAn42ObWN6ZNLU7+ul3CoTZAzJRiDSWTxa8YYJMwn4g7z/g1743IbJIqdtnfb94b13NC41oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800975; c=relaxed/simple;
	bh=sl3pIcd/Woe35+gcwLxFbutcD7NkqaAbjWxBx8yYfFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdNQYlmrf3psqEnKRQIgOqILlpdlxocxcMKwkWiDcYmSvnO4RTSdviLBtaYV7zupl+Gqu1hjG3IVg+fzi1ThUEUH7kaqx9cjY2o9ChzvF5MHtM8er4w2K79xRpXkqvqR0/k0LgPj623tYB/uea8PpE3mwd/yzC2hcNn0KCZfNgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zumt5Imf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770800974; x=1802336974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sl3pIcd/Woe35+gcwLxFbutcD7NkqaAbjWxBx8yYfFE=;
  b=Zumt5ImfwHdfwt76tgx0elAb6/G2uNx9uDsHKW1S0H01biwo3kxmLAOy
   x5dZrYCihZzlLBAIoVTXrlqHXRRYKxwPIgFmn200B/lgnfrXxLxw4sqWf
   21TR8f3PEWDku/I3or8md+LwGJxSf8qOQ0H7/ngx2MgL5mt41bgHhCmI9
   DP4wlns1yE6VCKVMga6G7oX9C7LYcFvj2C5QZ+5qHwaEG99cwsm1BgEqz
   MciFvYQxYH02ClDAGLw2CDbsHzAVnPwuBaMbqFXja6oK5h9ru/tDym8OF
   Y/gWSiGpXfCY+nfgiezZLORq4IwYe92wCGSYF+Oz1Zb/TSpdMEVtx52xz
   A==;
X-CSE-ConnectionGUID: UCk1QmnpTta9bYQ4HQwWkg==
X-CSE-MsgGUID: EiVPIVs+RsGAsPBzjl3Spg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72019017"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72019017"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:32 -0800
X-CSE-ConnectionGUID: PAsfopF3RJe8frLs8th7GQ==
X-CSE-MsgGUID: hqXwI0FGSxG9Bb04O0BKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212222859"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:24 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D08C0121D6C;
	Wed, 11 Feb 2026 11:09:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vq6Do-00000007laS-2qTZ;
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
Subject: [PATCH v2 11/14] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
Date: Wed, 11 Feb 2026 11:09:17 +0200
Message-ID: <20260211090920.1851141-12-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52586-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sel.target:url,sel.stream:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA4471228ED
X-Rspamd-Action: no action

Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
set_fmt, get_selection and set_selection sub-device pad ops. The client
info struct will soon be used to differentiate UAPI based on client
capabilities.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 63 ++++++++++++++++++---------
 include/media/v4l2-subdev.h           |  9 +++-
 2 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 79fb4643182a..76ab70a99e86 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -245,19 +245,21 @@ static inline int check_format(struct v4l2_subdev *sd,
 }
 
 static int call_get_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
 	return check_format(sd, state, format) ? :
-	       sd->ops->pad->get_fmt(sd, state, format);
+		sd->ops->pad->get_fmt(sd, ci, state, format);
 }
 
 static int call_set_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
 	return check_format(sd, state, format) ? :
-	       sd->ops->pad->set_fmt(sd, state, format);
+		sd->ops->pad->set_fmt(sd, ci, state, format);
 }
 
 static int call_enum_mbus_code(struct v4l2_subdev *sd,
@@ -308,19 +310,21 @@ static inline int check_selection(struct v4l2_subdev *sd,
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
 	return check_selection(sd, state, sel) ? :
-	       sd->ops->pad->get_selection(sd, state, sel);
+		sd->ops->pad->get_selection(sd, ci, state, sel);
 }
 
 static int call_set_selection(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
 	return check_selection(sd, state, sel) ? :
-	       sd->ops->pad->set_selection(sd, state, sel);
+		sd->ops->pad->set_selection(sd, ci, state, sel);
 }
 
 static inline int check_frame_interval(struct v4l2_subdev *sd,
@@ -523,6 +527,21 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 			v4l2_subdev_unlock_state(state);                   \
 		return ret;                                                \
 	}
+#define DEFINE_STATE_WRAPPER_CI(f, arg_type)                               \
+	static int call_##f##_state(struct v4l2_subdev *sd,		   \
+				    const struct v4l2_subdev_client_info *ci, \
+				    struct v4l2_subdev_state *_state,      \
+				    arg_type *arg) \
+	{                                                                  \
+		struct v4l2_subdev_state *state = _state;                  \
+		int ret;                                                   \
+		if (!_state)                                               \
+			state = v4l2_subdev_lock_and_get_active_state(sd); \
+		ret = call_##f(sd, ci, state, arg);			   \
+		if (!_state && state)                                      \
+			v4l2_subdev_unlock_state(state);                   \
+		return ret;                                                \
+	}
 
 #else /* CONFIG_MEDIA_CONTROLLER */
 
@@ -536,13 +555,13 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
-DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
-DEFINE_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
+DEFINE_STATE_WRAPPER_CI(get_fmt, struct v4l2_subdev_format);
+DEFINE_STATE_WRAPPER_CI(set_fmt, struct v4l2_subdev_format);
 DEFINE_STATE_WRAPPER(enum_mbus_code, struct v4l2_subdev_mbus_code_enum);
 DEFINE_STATE_WRAPPER(enum_frame_size, struct v4l2_subdev_frame_size_enum);
 DEFINE_STATE_WRAPPER(enum_frame_interval, struct v4l2_subdev_frame_interval_enum);
-DEFINE_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
-DEFINE_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
+DEFINE_STATE_WRAPPER_CI(get_selection, struct v4l2_subdev_selection);
+DEFINE_STATE_WRAPPER_CI(set_selection, struct v4l2_subdev_selection);
 
 static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.get_fmt		= call_get_fmt_state,
@@ -804,7 +823,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
+		return v4l2_subdev_call(sd, pad, get_fmt, &subdev_fh->ci, state,
+					format);
 	}
 
 	case VIDIOC_SUBDEV_S_FMT: {
@@ -818,7 +838,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
+		return v4l2_subdev_call(sd, pad, set_fmt, &subdev_fh->ci, state,
+					format);
 	}
 
 	case VIDIOC_SUBDEV_G_CROP: {
@@ -835,8 +856,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		sel.stream = crop->stream;
 		sel.target = V4L2_SEL_TGT_CROP;
 
-		rval = v4l2_subdev_call(
-			sd, pad, get_selection, state, &sel);
+		rval = v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
+					state, &sel);
 
 		crop->rect = sel.r;
 
@@ -861,8 +882,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		sel.target = V4L2_SEL_TGT_CROP;
 		sel.r = crop->rect;
 
-		rval = v4l2_subdev_call(
-			sd, pad, set_selection, state, &sel);
+		rval = v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
+					state, &sel);
 
 		crop->rect = sel.r;
 
@@ -932,8 +953,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			sel->stream = 0;
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
-		return v4l2_subdev_call(
-			sd, pad, get_selection, state, sel);
+		return v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
+					state, sel);
 	}
 
 	case VIDIOC_SUBDEV_S_SELECTION: {
@@ -946,8 +967,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			sel->stream = 0;
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
-		return v4l2_subdev_call(
-			sd, pad, set_selection, state, sel);
+		return v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
+					state, sel);
 	}
 
 	case VIDIOC_G_EDID: {
@@ -1348,7 +1369,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
 	else
 		state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	ret = v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, state, fmt);
 
 	if (!states_locked && state)
 		v4l2_subdev_unlock_state(state);
@@ -1931,7 +1952,9 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
 	return 0;
 }
 
-int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+int v4l2_subdev_get_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
+			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c9fe99ea7841..20cf0560c7f9 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -850,15 +850,19 @@ struct v4l2_subdev_pad_ops {
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_frame_interval_enum *fie);
 	int (*get_fmt)(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *state,
 		       struct v4l2_subdev_format *format);
 	int (*set_fmt)(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *state,
 		       struct v4l2_subdev_format *format);
 	int (*get_selection)(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel);
 	int (*set_selection)(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel);
 	int (*get_frame_interval)(struct v4l2_subdev *sd,
@@ -1461,6 +1465,7 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
  * @sd: subdevice
  * @state: subdevice state
  * @format: pointer to &struct v4l2_subdev_format
+ * @ci: pointer to sub-device client information, including client capabilities
  *
  * Fill @format->format field based on the information in the @format struct.
  *
@@ -1470,7 +1475,9 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
  *
  * Returns 0 on success, error value otherwise.
  */
-int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+int v4l2_subdev_get_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
+			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format);
 
 /**
-- 
2.47.3


