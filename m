Return-Path: <linux-media+bounces-66214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bsenMKULRWoT5woAu9opvQ
	(envelope-from <linux-media+bounces-66214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 14:44:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A526ED7FB
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 14:44:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="S83JLo/T";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66214-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66214-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E75F7322BBA6
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 12:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278F9492524;
	Wed,  1 Jul 2026 12:23:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047964921B6
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:23:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908606; cv=none; b=E63ISSWcrsWrAb3d+eKsqeHFB1vvbqv5KifztSOuael5cqOni/gcqIAjM97rA1JsopJKAbsEyr5JB9IOKk9Ypbp6hYKJAC9RVbOiarxw97Oqhmtoyy0zlxw9O8vT+dQACQrOHmTfyi/xamkxM+uZXFKi/jed4Y1Z3VDFshaQTPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908606; c=relaxed/simple;
	bh=xvKlt5KN0tziedy9Cgq8n56FCbhLk+R4w8cRJs21pz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TU2mzeGmcJXEJT2+vprdcyfCLEu3XEnL5T74WU6Q+mtOIGInyk1tP20kke5yIO1me2OJUnrvqCRjQ1kFVOewcmZZYZd4CnPanVHSz2in8k87bg/UNSQhm0vjK4mcsddNVnRicnM3GzE44ZnQpF3LBSMX+yyk8QUlxj08OkhYyVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S83JLo/T; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908605; x=1814444605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xvKlt5KN0tziedy9Cgq8n56FCbhLk+R4w8cRJs21pz0=;
  b=S83JLo/TSp1UxwkW30q+4/6Vt1E0BiBHKV1SwgjwkSWaZu7JJyO/qllU
   BDqubs6K15gExaHDH+QF1bEH5DNuaEvZx3FJeZ2z1F/HnL7TpdFo+k4o+
   r4SffM+gf7iUDDchgblEYGsuldcJmHPICrY0nt/atKNyNzs48UlAMtoQc
   EBMKnSM7LR/J87W3RBm/njwHKHjWtDiV+JSeqi1WDASWhQEq89YQustxL
   Qg7sRbcD5Naxunc09GTm81PyEutr1rlIQJGY24mv3DTfm+0wo4dKwCZ38
   Et+QxiHqws/2KVfj5girJQq+K3k0+llUsnwjSYhttUPMvSgb83nlDY7JV
   w==;
X-CSE-ConnectionGUID: hDGMQYrkTAerKzhARTr4aw==
X-CSE-MsgGUID: ox4/bQK9QjKLUHv8o54ZNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94239187"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94239187"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:21 -0700
X-CSE-ConnectionGUID: 7o9dKoTwRiWGmO4v3A5t9A==
X-CSE-MsgGUID: d7pPUaCDTySsW+dTEqFHyg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E0CA4121C40;
	Wed, 01 Jul 2026 15:23:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1weu1S-00000007Fkp-2mRw;
	Wed, 01 Jul 2026 15:26:34 +0300
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
Subject: [PATCH v6 08/16] media: v4l2-subdev: Move op check to sub-device op wrappers
Date: Wed,  1 Jul 2026 15:26:25 +0300
Message-ID: <20260701122634.1728782-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66214-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32A526ED7FB

In anticipation of performing work for sub-device operation when the
driver doesn't implement one, move the check of operation existence to the
wrapper itself.

No functional change intended.

Many drivers implement set_fmt() pad op that simply returns the format
just as get_fmt() would do, usually because the driver only supports a
single one. The arguments to set_fmt() and get_fmt() are about to get
differentiated so call get_fmt() always if set_fmt() isn't supported by
the driver. This avoids changing drivers now and allows removing
boilerplate code from existing drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 117 ++++++++++++++++++--------
 include/media/v4l2-subdev.h           |   6 +-
 2 files changed, 84 insertions(+), 39 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 070a9e607fe3..86be4d51c9a5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -244,20 +244,24 @@ static inline int check_format(struct v4l2_subdev *sd,
 	       check_state(sd, state, format->which, format->pad, format->stream);
 }
 
+#define do_subdev_call(sd, check, o, f, args...)	\
+	(!(sd)->ops->o->f ? -ENOIOCTLCMD : (check) ? :	\
+	 (sd)->ops->o->f(sd, ##args))
+
 static int call_get_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, state, format) ? :
-	       sd->ops->pad->get_fmt(sd, state, format);
+	return do_subdev_call(sd, check_format(sd, state, format), pad, get_fmt,
+			      state, format);
 }
 
 static int call_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, state, format) ? :
-	       sd->ops->pad->set_fmt(sd, state, format);
+	return do_subdev_call(sd, check_format(sd, state, format), pad, set_fmt,
+			      state, format);
 }
 
 static int call_enum_mbus_code(struct v4l2_subdev *sd,
@@ -267,9 +271,20 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 	if (!code)
 		return -EINVAL;
 
-	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
-	       check_state(sd, state, code->which, code->pad, code->stream) ? :
-	       sd->ops->pad->enum_mbus_code(sd, state, code);
+	/*
+	 * FIXME: Convert the check below to use the ternary operator once
+	 * smatch can handle it.
+	 */
+	return do_subdev_call(sd,
+			      ({
+				      int ret = check_which(code->which);
+				      if (!ret)
+					      ret = check_pad(sd, code->pad);
+				      if (!ret)
+					      ret = check_state(sd, state, code->which,
+								code->pad, code->stream);
+				      ret;
+			      }), pad, enum_mbus_code, state, code);
 }
 
 static int call_enum_frame_size(struct v4l2_subdev *sd,
@@ -279,9 +294,20 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 	if (!fse)
 		return -EINVAL;
 
-	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
-	       check_state(sd, state, fse->which, fse->pad, fse->stream) ? :
-	       sd->ops->pad->enum_frame_size(sd, state, fse);
+	/*
+	 * FIXME: Convert the check below to use the ternary operator once
+	 * smatch can handle it.
+	 */
+	return do_subdev_call(sd,
+			      ({
+				      int ret = check_which(fse->which);
+				      if (!ret)
+					      ret = check_pad(sd, fse->pad);
+				      if (!ret)
+					      ret = check_state(sd, state, fse->which,
+								fse->pad, fse->stream);
+				      ret;
+			      }), pad, enum_frame_size, state, fse);
 }
 
 static int call_enum_frame_interval(struct v4l2_subdev *sd,
@@ -291,9 +317,20 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 	if (!fie)
 		return -EINVAL;
 
-	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
-	       check_state(sd, state, fie->which, fie->pad, fie->stream) ? :
-	       sd->ops->pad->enum_frame_interval(sd, state, fie);
+	/*
+	 * FIXME: Convert the check below to use the ternary operator once
+	 * smatch can handle it.
+	 */
+	return do_subdev_call(sd,
+			      ({
+				      int ret = check_which(fie->which);
+				      if (!ret)
+					      ret = check_pad(sd, fie->pad);
+				      if (!ret)
+					      ret = check_state(sd, state, fie->which,
+								fie->pad, fie->stream);
+				      ret;
+			      }), pad, enum_frame_interval, state, fie);
 }
 
 static inline int check_selection(struct v4l2_subdev *sd,
@@ -311,16 +348,16 @@ static int call_get_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, state, sel) ? :
-	       sd->ops->pad->get_selection(sd, state, sel);
+	return do_subdev_call(sd, check_selection(sd, state, sel),
+			      pad, get_selection, state, sel);
 }
 
 static int call_set_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, state, sel) ? :
-	       sd->ops->pad->set_selection(sd, state, sel);
+	return do_subdev_call(sd, check_selection(sd, state, sel),
+			      pad, set_selection, state, sel);
 }
 
 static inline int check_frame_interval(struct v4l2_subdev *sd,
@@ -338,16 +375,16 @@ static int call_get_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_frame_interval *fi)
 {
-	return check_frame_interval(sd, state, fi) ? :
-	       sd->ops->pad->get_frame_interval(sd, state, fi);
+	return do_subdev_call(sd, check_frame_interval(sd, state, fi),
+			      pad, get_frame_interval, state, fi);
 }
 
 static int call_set_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_frame_interval *fi)
 {
-	return check_frame_interval(sd, state, fi) ? :
-	       sd->ops->pad->set_frame_interval(sd, state, fi);
+	return do_subdev_call(sd, check_frame_interval(sd, state, fi),
+			      pad, set_frame_interval, state, fi);
 }
 
 static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
@@ -361,6 +398,9 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EOPNOTSUPP;
 #endif
 
+	if (!sd->ops->pad->get_frame_desc)
+		return -ENOIOCTLCMD;
+
 	memset(fd, 0, sizeof(*fd));
 
 	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
@@ -405,12 +445,12 @@ static inline int check_edid(struct v4l2_subdev *sd,
 
 static int call_get_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 {
-	return check_edid(sd, edid) ? : sd->ops->pad->get_edid(sd, edid);
+	return do_subdev_call(sd, check_edid(sd, edid), pad, get_edid, edid);
 }
 
 static int call_set_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 {
-	return check_edid(sd, edid) ? : sd->ops->pad->set_edid(sd, edid);
+	return do_subdev_call(sd, check_edid(sd, edid), pad, set_edid, edid);
 }
 
 static int call_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
@@ -419,8 +459,8 @@ static int call_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 	if (!timings)
 		return -EINVAL;
 
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->s_dv_timings(sd, pad, timings);
+	return do_subdev_call(sd, check_pad(sd, pad),
+			      pad, s_dv_timings, pad, timings);
 }
 
 static int call_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
@@ -429,8 +469,8 @@ static int call_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 	if (!timings)
 		return -EINVAL;
 
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->g_dv_timings(sd, pad, timings);
+	return do_subdev_call(sd,  check_pad(sd, pad),
+			      pad, g_dv_timings, pad, timings);
 }
 
 static int call_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
@@ -439,8 +479,8 @@ static int call_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 	if (!timings)
 		return -EINVAL;
 
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->query_dv_timings(sd, pad, timings);
+	return do_subdev_call(sd, check_pad(sd, pad),
+			      pad, query_dv_timings, pad, timings);
 }
 
 static int call_dv_timings_cap(struct v4l2_subdev *sd,
@@ -449,8 +489,8 @@ static int call_dv_timings_cap(struct v4l2_subdev *sd,
 	if (!cap)
 		return -EINVAL;
 
-	return check_pad(sd, cap->pad) ? :
-	       sd->ops->pad->dv_timings_cap(sd, cap);
+	return do_subdev_call(sd, check_pad(sd, cap->pad),
+			      pad, dv_timings_cap, cap);
 }
 
 static int call_enum_dv_timings(struct v4l2_subdev *sd,
@@ -459,8 +499,8 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
 	if (!dvt)
 		return -EINVAL;
 
-	return check_pad(sd, dvt->pad) ? :
-	       sd->ops->pad->enum_dv_timings(sd, dvt);
+	return do_subdev_call(sd, check_pad(sd, dvt->pad),
+			      pad, enum_dv_timings, dvt);
 }
 
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
@@ -468,14 +508,17 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 {
 	memset(config, 0, sizeof(*config));
 
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->get_mbus_config(sd, pad, config);
+	return do_subdev_call(sd, check_pad(sd, pad), pad, get_mbus_config,
+			      pad, config);
 }
 
 static int call_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	int ret;
 
+	if (!sd->ops->video->s_stream)
+		return -ENOIOCTLCMD;
+
 	/*
 	 * The .s_stream() operation must never be called to start or stop an
 	 * already started or stopped subdev. Catch offenders but don't return
@@ -509,7 +552,7 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
  * wrapper handles the case where the caller does not provide the called
  * subdev's state. This should be removed when all the callers are fixed.
  */
-#define DEFINE_STATE_WRAPPER(f, arg_type)                                  \
+#define DEFINE_STATE_WRAPPER(f, arg_type)				   \
 	static int call_##f##_state(struct v4l2_subdev *sd,                \
 				    struct v4l2_subdev_state *_state,      \
 				    arg_type *arg)                         \
@@ -526,7 +569,7 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 
 #else /* CONFIG_MEDIA_CONTROLLER */
 
-#define DEFINE_STATE_WRAPPER(f, arg_type)                            \
+#define DEFINE_STATE_WRAPPER(f, arg_type)			     \
 	static int call_##f##_state(struct v4l2_subdev *sd,          \
 				    struct v4l2_subdev_state *state, \
 				    arg_type *arg)                   \
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b797923738b6..e08615179e7b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1951,14 +1951,16 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		int __result;						\
 		if (!__sd)						\
 			__result = -ENODEV;				\
-		else if (!(__sd->ops->o && __sd->ops->o->f))		\
+		else if (!__sd->ops->o)					\
 			__result = -ENOIOCTLCMD;			\
 		else if (v4l2_subdev_call_wrappers.o &&			\
 			 v4l2_subdev_call_wrappers.o->f)		\
 			__result = v4l2_subdev_call_wrappers.o->f(	\
 							__sd, ##args);	\
-		else							\
+		else if (__sd->ops->o->f)				\
 			__result = __sd->ops->o->f(__sd, ##args);	\
+		else							\
+			__result = -ENOIOCTLCMD;			\
 		__result;						\
 	})
 
-- 
2.47.3


