Return-Path: <linux-media+bounces-52587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGImNYJHjGkHkgAAu9opvQ
	(envelope-from <linux-media+bounces-52587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:10:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD521228F4
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6815E3055DD8
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CB1352F88;
	Wed, 11 Feb 2026 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fT2aQbkD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E5354AD4
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800976; cv=none; b=JFnIvNMl72KTZ0lJBqr5ZWnZBCSgy3U2FiMrvCDSip9XNHrqalhDGnI7uLQ9kDZL0DupMypzcaC9ga//pROn/gvvDKJoqAMIxsRUtcWTupivMqzL804kjxEHI5fZVi0r8Wae0tYx7fD8vui7mxQevyK5T858VrNLiyroXFZP/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800976; c=relaxed/simple;
	bh=B85jHD4wx7Kvu+IP+/42lW/E6wWsYYRigfJ4suOVatw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgPiLPfu0+C8VdU6esJoZsSaaVQLHDzO4YYj0DauNyqzAJ9oAYWL/Z1s6XQGo9cbVrtgql0fYzMsqayqdfGXHSHDXaB1Is+CPK4HOIF/y0t38QIJ+yEaJEHirSPPdCXoht9JPwmcZKZb8AULMtsbos1lNZ3SuZNKGvNggZdG+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fT2aQbkD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770800975; x=1802336975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B85jHD4wx7Kvu+IP+/42lW/E6wWsYYRigfJ4suOVatw=;
  b=fT2aQbkDQT0tmOvdZZkWYn4k9nLzYptmQKvkGfldJZN2gYOmoqqnU0Fa
   YCsJxCghbq45pIJqv71nWMjjmYvjQVcxpLlP7ohR41u5g7w6ry7TZQb7i
   8eTCBuIXAsdMOzMw2jsblZCxHP1vrn4iSusUAv+q9tBMqloLcwyCrTEnI
   mhvIoWc29LrBQjwQ8EbdO2J9wVq4MKb6lRBpvJOTceTA3zFSRyj9Fc0bE
   3CmJ5UWUR+yyfBKcnIWiQ5323sWXHCWxVDa1lYCm/6rwKQDjdQgraBhHS
   gKn2Lk54hEqtC3VIysyQM9c6EoWIWfpG3IE+WgBbNkqyANwG6Q/FkRtuZ
   Q==;
X-CSE-ConnectionGUID: K2Mc1kSjSceBHMreWNq/XA==
X-CSE-MsgGUID: mHiRgjEdQXCwUXEykL7keQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72019032"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72019032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:32 -0800
X-CSE-ConnectionGUID: DR5hW469QbSI2m13HIe5Xw==
X-CSE-MsgGUID: h4SE5X3VRVmF9xXRiyDr5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212222863"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:24 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3082121D6E;
	Wed, 11 Feb 2026 11:09:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vq6Do-00000007laW-2uVf;
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
Subject: [PATCH v2 12/14] media: v4l2-subdev: Add v4l2_subdev_call_ci_active_state
Date: Wed, 11 Feb 2026 11:09:18 +0200
Message-ID: <20260211090920.1851141-13-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52587-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BD521228F4
X-Rspamd-Action: no action

Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
take struct v4l2_subdev_client_info pointer as an argument.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 49 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 20cf0560c7f9..b22b05534447 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1912,6 +1912,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		__result;						\
 	})
 
+#define v4l2_subdev_call_waive_fourth(first, second, third, fourth, rest...) \
+	v4l2_subdev_call(first, second, third, ##rest)
+
+#define __v4l2_subdev_call_state_active(call, sd, o, f, args...) \
+	({								\
+		int __result;						\
+		struct v4l2_subdev_state *state;			\
+		state = v4l2_subdev_get_unlocked_active_state(sd);	\
+		if (state)						\
+			v4l2_subdev_lock_state(state);			\
+		__result = call(sd, o, f, NULL, state, ##args);		\
+		if (state)						\
+			v4l2_subdev_unlock_state(state);		\
+		__result;						\
+	})
+
 /**
  * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
  *				   takes state as a parameter, passing the
@@ -1930,17 +1946,28 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
  * active state, lock it before calling the op and unlock it after the call.
  */
 #define v4l2_subdev_call_state_active(sd, o, f, args...)		\
-	({								\
-		int __result;						\
-		struct v4l2_subdev_state *state;			\
-		state = v4l2_subdev_get_unlocked_active_state(sd);	\
-		if (state)						\
-			v4l2_subdev_lock_state(state);			\
-		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
-		if (state)						\
-			v4l2_subdev_unlock_state(state);		\
-		__result;						\
-	})
+	__v4l2_subdev_call_state_active(v4l2_subdev_call_waive_fourth,	\
+					sd, o, f, ##args)
+
+/**
+ * v4l2_subdev_call_ci_state_active - call an operation of a v4l2_subdev which
+ *				      takes state as a parameter, passing the
+ *				      subdev its active state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This macro is just as v4l2_subdev_call_state_active(), with the exception
+ * that it passes NULL as the client info to sub-device ops that need it
+ * (currently pad ops get_fmt, set_fmt, get_selection and set_selection).
+ */
+#define v4l2_subdev_call_ci_state_active(sd, o, f, args...)		\
+	__v4l2_subdev_call_state_active(v4l2_subdev_call, sd, o, f, ##args)
 
 /**
  * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
-- 
2.47.3


