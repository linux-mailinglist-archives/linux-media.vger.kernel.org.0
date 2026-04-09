Return-Path: <linux-media+bounces-58431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOlUDy0K2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C623CF6B7
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A32B3028371
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83137346FB0;
	Thu,  9 Apr 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiS6yw53"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CFE3446A6
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765733; cv=none; b=Ueps2pb7oI58SrYUf2+NDMsxqIde/ec1aM9/25cKAlL/XmtBYNlOvTSxX7Ejax0wTRnHADr0M2Q+3qEuYyWk/AsO91D7fSpEord4+eB52aJFae+vkr9SvvGpke1WjuKz02ft7KnzX6YTU6pbHa636IZb9AegnspsFzOTwdoMhYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765733; c=relaxed/simple;
	bh=bh1OGej4wkJ+GP7BDmK7ahH/MRhI258u7ESCnuvFCW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AuZfKh8TqDhRjKbLSvWs/F/14C9g5rIG8QfdNkxGHMF7/N65ywfC1+Qs8XDETCljI92Z9ARJde5lf4kfB+PoUkCSgrv5JN3T+OWRFQ5/d9u1N+gLOsLIoq0M+qppDomjJVFIkPmTBBjtpHUgVJcn0Lbi8zraOdJRgqiKB8jD76Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiS6yw53; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765733; x=1807301733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bh1OGej4wkJ+GP7BDmK7ahH/MRhI258u7ESCnuvFCW8=;
  b=aiS6yw53JWR4low++elAXLj+KQyM1TO5jcPPqIdXI/QK/1cRmZV9Xnm/
   jZMQQ1Xj9WSGeBjmshTMVo3da4I2bDOBH29kgGYo0QYHCu+RbFPTE4/12
   65uh1eW21gyPLEN33niEWZ4nX6XlaX5w4aV3ARIKu2TIWG/uYUE9PKS/P
   QbKeYROiWyLNMxQRKT62oam3lHua+QMZh3FD5j80z8BpbOSM8Xu66o172
   gowctaaZrKHSMmfxHJUc0SPJttjfV038gWp6aJ3k8+MLMVrqj+KNTDXhM
   Kgu3RasqJeZxECLq6QQDP8I6AJAu4xxjnoPA0iC+n2yZjmRK4+pOwkwnX
   g==;
X-CSE-ConnectionGUID: KS243e0jQ3qU06EMGzCXsA==
X-CSE-MsgGUID: 6PE+2uzzTlaUoSJ9DPFewQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176495"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176495"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: tMZlXI70RSqDW+q5gB/ToQ==
X-CSE-MsgGUID: EG51qYl3SXSwr8uCh0ZZgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047532"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7FA121227A6;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045m9-426k;
	Thu, 09 Apr 2026 23:15:01 +0300
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
Subject: [PATCH v12 23/86] media: v4l2-subdev: Prevent accessing internal pads without STREAMS cap
Date: Thu,  9 Apr 2026 23:13:58 +0300
Message-ID: <20260409201501.975242-24-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58431-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3C623CF6B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The internal pads are expected to be accessed by users that are aware of
streams. Require the V4L2_SUBDEV_CLIENT_CAP_STREAMS client capability to
be set before allowing accessing internal pads from the user space.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 41 ++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7723e37a0ff5..c6d8399c2252 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -234,6 +234,18 @@ static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 	return 0;
 }
 
+static inline int check_caps(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     const struct v4l2_subdev_client_info *ci,
+			     u32 pad)
+{
+	if (sd->entity.pads[pad].flags & MEDIA_PAD_FL_INTERNAL)
+		return ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_STREAMS ?
+			0 : -EINVAL;
+
+	return 0;
+}
+
 static inline int check_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
@@ -245,12 +257,21 @@ static inline int check_format(struct v4l2_subdev *sd,
 	       check_state(sd, state, format->which, format->pad, format->stream);
 }
 
+static inline int check_format_caps(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	return check_format(sd, state, format) ?:
+		check_caps(sd, state, ci, format->pad);
+}
+
 static int call_get_fmt(struct v4l2_subdev *sd,
 			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, state, format) ? :
+	return check_format_caps(sd, ci, state, format) ? :
 		sd->ops->pad->get_fmt(sd, ci, state, format);
 }
 
@@ -259,7 +280,7 @@ static int call_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, state, format) ? :
+	return check_format_caps(sd, ci, state, format) ? :
 		sd->ops->pad->set_fmt(sd, ci, state, format);
 }
 
@@ -310,12 +331,24 @@ static inline int check_selection(struct v4l2_subdev *sd,
 	       check_state(sd, state, sel->which, sel->pad, sel->stream);
 }
 
+static inline int check_selection_caps(struct v4l2_subdev *sd,
+				       const struct v4l2_subdev_client_info *ci,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_selection *sel)
+{
+	if (!sel)
+		return -EINVAL;
+
+	return check_selection(sd, state, sel) ? :
+		check_caps(sd, state, ci, sel->pad);
+}
+
 static int call_get_selection(struct v4l2_subdev *sd,
 			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, state, sel) ? :
+	return check_selection_caps(sd, ci, state, sel) ? :
 		sd->ops->pad->get_selection(sd, ci, state, sel);
 }
 
@@ -324,7 +357,7 @@ static int call_set_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, state, sel) ? :
+	return check_selection_caps(sd, ci, state, sel) ? :
 		sd->ops->pad->set_selection(sd, ci, state, sel);
 }
 
-- 
2.47.3


