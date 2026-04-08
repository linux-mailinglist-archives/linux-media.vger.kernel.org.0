Return-Path: <linux-media+bounces-58267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAxlFiJ31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:41:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F43BE5A0
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1996F306B40F
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB993AE185;
	Wed,  8 Apr 2026 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsupchRc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A539E3D75C9
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662832; cv=none; b=HjTBM1pqaVShjnmGdu6a6UdSmV+8JIKfe3ylQzs3p9iU/J6IHk2uw6n/cLCV2XM8F28dPBHhsRuANAVRFpAdglqCuX0/HvVzw+EoAoDgv+HFeJdtJSJLUG89ZWeji22K6KtjZXLsjdkW6dhV32HJOHFLEROPJj6ro4Cne5hYymA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662832; c=relaxed/simple;
	bh=7ABJ2Ki7srfiQp3SqKRcsqAxLFiZ+S9j+uwF6+JAoPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ge8ck9kZHqTg5tOWIPiWbktRxZSD2poATgMWVkOfYpsBRQNVoeJsizOQ0HuF73h7IlxoH8buttLHlnaBkNHyy3xPl//Pj6fOG/ozpe38kTz1LtWtqlScClz0I58Lf9MJQqrGQRvQ1QsDrGZ48EdDCRMR9JtdA77WOWwkIQgAjv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsupchRc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662829; x=1807198829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7ABJ2Ki7srfiQp3SqKRcsqAxLFiZ+S9j+uwF6+JAoPg=;
  b=PsupchRchfrRLf1LZYnd85I5JrQ8LF8eEKuiS7R0vk/C7Du3T2Ea07mf
   IGdSEtuCF2ycX2BLcpJEarq6npo9H7UifG3LXEGumqZUIiNPtXZvbBJ1Y
   ghYm8h6rZqY72OkcU8QZwkLALVdhW/kajW1qxhlrQoixB+0AYXD9r1fLp
   T06s29V1SUuf1ZC79S39Wtu9KIPE55zB4EqlU/OxzbhgxG2kge1zwQ/Lh
   XUQ2mTKYdoyw8KQmKgE9FjpVq3HUAl2x/oYxkQ3r97gfhwNHZesQEsPL6
   NnaYjaVG+8lEh1ccoY51En76g32AAP2gLoSoA0MaDunx73MDKVUvSiD9h
   Q==;
X-CSE-ConnectionGUID: qXJuxHitRW+ysvnNlennUg==
X-CSE-MsgGUID: QQzZ5/1QRDO2GJvhxkn7YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038555"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038555"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:02 -0700
X-CSE-ConnectionGUID: rPJV3lA7R+mDaitE6ikKPg==
X-CSE-MsgGUID: Vq+xiRvAQgO3zO6WUA1cTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740404"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4CC65122125;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044Dy-34B8;
	Wed, 08 Apr 2026 18:39:39 +0300
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v4 26/29] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
Date: Wed,  8 Apr 2026 18:39:35 +0300
Message-ID: <20260408153939.969381-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58267-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sel.stream:url];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.937];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C43F43BE5A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
set_fmt, get_selection and set_selection sub-device pad ops. The client
info struct will soon be used to differentiate UAPI based on client
capabilities.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 72 +++++++++++++++++++--------
 include/media/v4l2-subdev.h           |  9 +++-
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index eaa408832c6b..7723e37a0ff5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -246,19 +246,21 @@ static inline int check_format(struct v4l2_subdev *sd,
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
@@ -309,19 +311,21 @@ static inline int check_selection(struct v4l2_subdev *sd,
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
@@ -524,6 +528,21 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 			v4l2_subdev_unlock_state(state);                   \
 		return ret;                                                \
 	}
+#define DEFINE_CI_STATE_WRAPPER(f, arg_type)                               \
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
 
@@ -535,15 +554,24 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 		return call_##f(sd, state, arg);                     \
 	}
 
+#define DEFINE_CI_STATE_WRAPPER(f, arg_type)                            \
+	static int call_##f##_state(struct v4l2_subdev *sd,          \
+				    const struct v4l2_subdev_client_info *ci, \
+				    struct v4l2_subdev_state *state, \
+				    arg_type *arg)                   \
+	{                                                            \
+		return call_##f(sd, ci, state, arg);		     \
+	}
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
-DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
-DEFINE_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
+DEFINE_CI_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
+DEFINE_CI_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
 DEFINE_STATE_WRAPPER(enum_mbus_code, struct v4l2_subdev_mbus_code_enum);
 DEFINE_STATE_WRAPPER(enum_frame_size, struct v4l2_subdev_frame_size_enum);
 DEFINE_STATE_WRAPPER(enum_frame_interval, struct v4l2_subdev_frame_interval_enum);
-DEFINE_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
-DEFINE_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
+DEFINE_CI_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
+DEFINE_CI_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
 
 static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.get_fmt		= call_get_fmt_state,
@@ -805,7 +833,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
+		return v4l2_subdev_call(sd, pad, get_fmt, &subdev_fh->ci, state,
+					format);
 	}
 
 	case VIDIOC_SUBDEV_S_FMT: {
@@ -819,7 +848,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
+		return v4l2_subdev_call(sd, pad, set_fmt, &subdev_fh->ci, state,
+					format);
 	}
 
 	case VIDIOC_SUBDEV_G_CROP: {
@@ -836,8 +866,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		sel.stream = crop->stream;
 		sel.target = V4L2_SEL_TGT_CROP;
 
-		rval = v4l2_subdev_call(
-			sd, pad, get_selection, state, &sel);
+		rval = v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
+					state, &sel);
 
 		crop->rect = sel.r;
 
@@ -862,8 +892,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		sel.target = V4L2_SEL_TGT_CROP;
 		sel.r = crop->rect;
 
-		rval = v4l2_subdev_call(
-			sd, pad, set_selection, state, &sel);
+		rval = v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
+					state, &sel);
 
 		crop->rect = sel.r;
 
@@ -933,8 +963,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			sel->stream = 0;
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
-		return v4l2_subdev_call(
-			sd, pad, get_selection, state, sel);
+		return v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
+					state, sel);
 	}
 
 	case VIDIOC_SUBDEV_S_SELECTION: {
@@ -947,8 +977,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			sel->stream = 0;
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
-		return v4l2_subdev_call(
-			sd, pad, set_selection, state, sel);
+		return v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
+					state, sel);
 	}
 
 	case VIDIOC_G_EDID: {
@@ -1343,7 +1373,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
 	else
 		state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	ret = v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, state, fmt);
 
 	if (!states_locked && state)
 		v4l2_subdev_unlock_state(state);
@@ -1924,7 +1954,9 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
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
index e0861acc638d..1ce1c18f84a9 100644
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


