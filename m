Return-Path: <linux-media+bounces-58265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBktMBt31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:41:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA83BE592
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 653AF3069708
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFEB3D7D69;
	Wed,  8 Apr 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOslbwsw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957B3D7D60
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662829; cv=none; b=Kxgrru9o2vkWkItMDy8UvncNLlZu02IShetKohdRefhRwwsmnyMIJiVfihLNKfjxTZTBrqIEbVVgs9m9ygPvFq/5trKXBOqWu5Qwx9aTsQl/MTfqQrDNhJxK+VIHQOlACQtuDjkcHFxqF0msdjJn6nVW/H0ae1y61s+UMwcdJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662829; c=relaxed/simple;
	bh=76Ypjive7Y+eFqg6f5Al3Kw5AcHO32NDyXaa01fmwo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjAzs2WZyUURSfe0xSCnldBC42zu/hgeWsLEc6qztAJWP1QRp3xhQ4Z1KnwVMCPeDBgaGl8r3T9InK8HGfufHZ2yzBjaht+KwGVYxd0LqFwfV7upIsXql2DEoFLRtFAgeinC42pY9v5s0BW+9EUyZa2W5SeWEBRovyQ5+wAmXnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOslbwsw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662828; x=1807198828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=76Ypjive7Y+eFqg6f5Al3Kw5AcHO32NDyXaa01fmwo8=;
  b=jOslbwswhYOPM4TWrtbNEKx3S8cM8EnHHTLyqMzCI69yURSkLwWm1O1M
   D9INbuIs2d7LYsdzarsGLdc7I5GgTx/AiV2i+FzNCjyQyNfVsGnayaE8U
   yId9UiedaTACcsIVxaNpijEpCAfGWSb+WmJGA7Cqdu/cj0nqegVZxZ4qR
   JrUJ/wKAsl76CdWLYizNWbBfzE3Pl0MD+JAre4+9GTErvdSG6ycNteiDB
   o8K/uhdyrN+emorPorCUjG8hnGNpZqwv7jyHDqsIJisMQlx4oJvUdXp5+
   LL99fjMICi0WhH9Peg2ENKPGXjuvPEo5UNxTNpnTshsNXEG3Q6+XgjhRp
   g==;
X-CSE-ConnectionGUID: WwhEuGrjSlOsSr8fuwv2mg==
X-CSE-MsgGUID: ko66nBUjT0K5/ZE64MOIwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038548"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038548"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:02 -0700
X-CSE-ConnectionGUID: 0k5naFKtT5eTXmg14ImOrQ==
X-CSE-MsgGUID: u7SZj9gnRG+LxUhydHCe1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740400"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 53714122145;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044E2-38K6;
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
Subject: [PATCH v4 27/29] media: v4l2-subdev: Add v4l2_subdev_call_ci_active_state
Date: Wed,  8 Apr 2026 18:39:36 +0300
Message-ID: <20260408153939.969381-28-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58265-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.926];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37BA83BE592
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
take struct v4l2_subdev_client_info pointer as an argument.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 49 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1ce1c18f84a9..9b0e091c30c1 100644
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


