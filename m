Return-Path: <linux-media+bounces-56994-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C0vHKrBw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56994-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 046BA3237B3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B7BD3101787
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4383C5DA6;
	Wed, 25 Mar 2026 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRScy7Ix"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3603C3C14
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436333; cv=none; b=k+muGOR162WJWD2UHYnagBZkj2EEbZUwQWMvOtGBb+bJKR+0RqiWXgaoF/DSOYObCJrY/9ybrRydIxr5Jh4MzsPuP7JLbXyIRX00u7EbrF3+OQP+BL20oKgDhcmYzhb+oFc02CD3wmcyELBqoAm3QvqmHYRuDa3pl1Dtjxt1GJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436333; c=relaxed/simple;
	bh=fyJS04qVVvuviElqdbYerP70AsDnz2rzizZGdZSRsL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYmg/Qr5BSHT9BCcTcyW2ziWuSBrQbMm7uXwbgn6xiW5gZbEoMGnVVoEO4D5wk+TpMTYaIdpF4xNQJ9/M3eiSu1SALDZtVAsT+zZqAzjLAG0AIQl7nhCK3M+tqbJndDAEscEJ7/K0upVT89ht9Y4FEGLZvaEiS4woo6jop2Fxhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRScy7Ix; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436331; x=1805972331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fyJS04qVVvuviElqdbYerP70AsDnz2rzizZGdZSRsL0=;
  b=JRScy7IxxraP0zqlHgIjAPtEa/xbm82PInFg84UXvi+dE3Xrw2d6ObYx
   wVX7pPJ1RJgKTHkuEMlk1cgEmayft0F4ZQ7CxqezIP4nQpn1m0wHsgLJW
   72iGGKI63VmrDXv4stYE9nRA9gVEoNvTzpn5CAj1MpcnTNE0+u+/sVlNl
   KtMYvSAEmBS0AQ13wSAGoXSO/IMBJd4YPBVjzM/YCCJlakgR2++ZQTjnB
   ug0YrUwOE8kE4RuHzDFajx3mOASu08Af05sdo1c/Hm7ljD+X1NzlXzRDF
   sr24T7bgr8K+zYUYWSGHFyUlI2VAnfneOoRW16kZUiiCyc1vlK3Nv/Rih
   Q==;
X-CSE-ConnectionGUID: rKTBkWVYSfCDSsNNqn6qFg==
X-CSE-MsgGUID: CKEulalHTYq2zfM6UWYSew==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496456"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496456"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:50 -0700
X-CSE-ConnectionGUID: XDjcCTw3T4e3g8OeseAUHQ==
X-CSE-MsgGUID: SMvXne/ASJWvFJy9KBj1xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763534"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:43 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BFE341224E6;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wB9-0via;
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
Subject: [PATCH v3 20/22] media: v4l2-subdev: Add v4l2_subdev_call_ci_active_state
Date: Wed, 25 Mar 2026 12:58:17 +0200
Message-ID: <20260325105818.1176816-22-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56994-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 046BA3237B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
take struct v4l2_subdev_client_info pointer as an argument.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 49 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 9706bc22d64d..97b487b1507a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1968,6 +1968,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		__result;						\
 	})
 
+#define v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \
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
@@ -1986,17 +2002,28 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
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
+	__v4l2_subdev_call_state_active(v4l2_subdev_call_drop_fourth,	\
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


