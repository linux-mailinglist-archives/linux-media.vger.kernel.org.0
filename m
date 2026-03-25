Return-Path: <linux-media+bounces-56997-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEZJKRrAw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56997-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:59:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 474D6323681
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87B4E303056C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8733C9EEC;
	Wed, 25 Mar 2026 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ekm+OFd3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301162750ED
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436337; cv=none; b=pYyUPbUPSVPm+yF7zuOiGJMFlOMuAbsihDx5IKtHUM1a5XsJUj/8VqzPyGT+vQor4J2UgU5C9rCx645BAwgO82vVWrE/vMNdfAAcsDmd24UejasksF9rdzt6JFFX5Q7v/SucZjos4Ywf71qvWBtQ5ObkcLratw5ap8DVT18zekM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436337; c=relaxed/simple;
	bh=qlnzrVFJXPklcfXfsyOcQohCOmIgv591p2rXZX5Vft8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WqReBbHHXd+yJi1pgMfPGqkdm9+S0sFzj22ZmEgNLVQS6faFtv9AsyPBvuOxTM0MRHHQWCWkEmec1lPd0TZVmI7bK597o+XdbGJl23VZ1/KFiGjek1h8tdyYSqKVybI9KGubbit7m7Q91p2Cg8mYAOecC65RKnbNMJ0mZ93tkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ekm+OFd3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436334; x=1805972334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qlnzrVFJXPklcfXfsyOcQohCOmIgv591p2rXZX5Vft8=;
  b=Ekm+OFd342NMSIThbq1Bid9Kn42rWj8vLy1T37sEM5wiO30OTJsAejvq
   rnBdAP/QbZXubYscfbELRJpes2Sy59mpHdIwkpszKv1HNUqx/K0jADUJx
   yPQIZ31/HJRahC+GcRHnh2Zi1pbJRRPbx7w95ZxJ5E79/WFOxrPLqwUPg
   KRHwEY3h1VecgChz5fJWYffJJC2lxGKVHyFHHlTdajWiDSeuiVzr/0ifd
   gKk/tyQQOgyMB7KT27NYOKdNQORPCMxjf6yQBO+Q7EeSN3BfL4CKySp6j
   leYQFB6cUHh4C26wuAElUuV5O04pfstycM3Uap87g9Fb/vRFYWkReM3oU
   w==;
X-CSE-ConnectionGUID: o0REjQn7Rk6dPMP4G0YJew==
X-CSE-MsgGUID: TiTXtZ6XQGmSX2VQKJX2eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496489"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496489"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:50 -0700
X-CSE-ConnectionGUID: X+Wtw1cKTq6ixy44ruKOCw==
X-CSE-MsgGUID: xNGYNBqYTpGkuLMA/mdbxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763544"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:43 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BE4C61224DD;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wB5-0s79;
	Wed, 25 Mar 2026 12:58:19 +0200
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
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 19/22] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
Date: Wed, 25 Mar 2026 12:58:16 +0200
Message-ID: <20260325105818.1176816-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
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
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56997-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sel.target:url];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 474D6323681
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
index f437bd0e528f..04a5cb2ad3e3 100644
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
 
@@ -534,15 +553,24 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -804,7 +832,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
+		return v4l2_subdev_call(sd, pad, get_fmt, &subdev_fh->ci, state,
+					format);
 	}
 
 	case VIDIOC_SUBDEV_S_FMT: {
@@ -818,7 +847,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
+		return v4l2_subdev_call(sd, pad, set_fmt, &subdev_fh->ci, state,
+					format);
 	}
 
 	case VIDIOC_SUBDEV_G_CROP: {
@@ -835,8 +865,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		sel.stream = crop->stream;
 		sel.target = V4L2_SEL_TGT_CROP;
 
-		rval = v4l2_subdev_call(
-			sd, pad, get_selection, state, &sel);
+		rval = v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
+					state, &sel);
 
 		crop->rect = sel.r;
 
@@ -861,8 +891,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		sel.target = V4L2_SEL_TGT_CROP;
 		sel.r = crop->rect;
 
-		rval = v4l2_subdev_call(
-			sd, pad, set_selection, state, &sel);
+		rval = v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
+					state, &sel);
 
 		crop->rect = sel.r;
 
@@ -932,8 +962,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			sel->stream = 0;
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
-		return v4l2_subdev_call(
-			sd, pad, get_selection, state, sel);
+		return v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
+					state, sel);
 	}
 
 	case VIDIOC_SUBDEV_S_SELECTION: {
@@ -946,8 +976,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			sel->stream = 0;
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
-		return v4l2_subdev_call(
-			sd, pad, set_selection, state, sel);
+		return v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
+					state, sel);
 	}
 
 	case VIDIOC_G_EDID: {
@@ -1342,7 +1372,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
 	else
 		state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	ret = v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, state, fmt);
 
 	if (!states_locked && state)
 		v4l2_subdev_unlock_state(state);
@@ -1923,7 +1953,9 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
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
index 6106e4409575..9706bc22d64d 100644
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


