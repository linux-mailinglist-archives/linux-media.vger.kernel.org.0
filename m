Return-Path: <linux-media+bounces-66216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IZHoMJsKRWqu5goAu9opvQ
	(envelope-from <linux-media+bounces-66216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 14:39:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0D6ED738
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 14:39:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=d0e70VyJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66216-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66216-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCBED30624FD
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 12:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14247492535;
	Wed,  1 Jul 2026 12:23:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D8949251B
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:23:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908607; cv=none; b=t2wr03iFxGeEcGdlo77NjJwmvF/329UKDEjnkN/3o/qjeh1Xm4HcrlhamZn5GIfmSAUOvIZujFKk/mENMfkqY0dqGxqdjwtBPKkyFMJNNMjQTZJ9WVyH5gDn4P047MNvU6CKisc70mv7yGWGy9EL9dfss/uTxR4INKnU4fhbB7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908607; c=relaxed/simple;
	bh=vLzaOwU+fejM0i0cz7d8k2RMjFxUGfxEDAuAsppsl5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAkgxUsj94P8auf/qBWdh05XftQeKWMkuZnNGbgUZH+2rhz+B+7/7n3IxX1xNTdW/CXRjBRqZwF7ewI1gujlF41NgarsdZ5yPpIWlQAQx7jBoeNgVZGIURFzCO7VKIe82rYVuSDBpRkjsLCthI3Q30hiqYWpgBCT8/7Th+3YBt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0e70VyJ; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908606; x=1814444606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vLzaOwU+fejM0i0cz7d8k2RMjFxUGfxEDAuAsppsl5s=;
  b=d0e70VyJXs92BM6zIxOTeuqtk3qP3ns66VGwtc4Sj5vQnT09USxXOuzt
   bMjcTVIYEa/8a+BseeQexen66VYUibqptukQMSfau685yMkSwVgTdi7C1
   kMQthcOE0dtro1TCVraqSHdTS9u2Tu4JDz/eM1pIho1kNYWd49wWdpF19
   I5bAa/FQbjqqWJ413iwekQEModFGVlaSUiGrsYx6lxixwcCXMj3zhdImH
   /DNadHuGMTZJhbNDiIugCAKJwnRwktBV3KZ+cQXFeXShcZOFms7hZ3tWS
   0JGNEDhoI8lW6OlucRlP/e917+7Pfh9p9ZWC4DjdWlCzT9cWYk6Jkk4zR
   g==;
X-CSE-ConnectionGUID: gX9AFdC1RbqRoKV+iP1dpw==
X-CSE-MsgGUID: a9Pxh9ovRNiTPuNbJDCWGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94239214"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94239214"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:21 -0700
X-CSE-ConnectionGUID: SoEGgC45SWSSEgMGdJZXtw==
X-CSE-MsgGUID: bbkRWulmR5+cDKt/PbfKyQ==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F2BEA121CE4;
	Wed, 01 Jul 2026 15:23:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1weu1S-00000007Fl9-36PO;
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
Subject: [PATCH v6 13/16] media: v4l2-subdev: Add v4l2_subdev_call_ci_state_{active,try}
Date: Wed,  1 Jul 2026 15:26:30 +0300
Message-ID: <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66216-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44B0D6ED738

Add v4l2_subdev_call_ci_state_active(), and
v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
take struct v4l2_subdev_client_info pointer as an argument. These ops
cannot be called using v4l2_subdev_call_state_active() or
v4l2_subdev_call_state_try() as the client_info argument precedes the
state argument.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 95 +++++++++++++++++++++++++++++--------
 1 file changed, 74 insertions(+), 21 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e08615179e7b..056eaa949786 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1964,6 +1964,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
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
@@ -1982,22 +1998,13 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
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
 
 /**
- * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
- *				takes state as a parameter, passing the
- *				subdev a newly allocated try state.
+ * v4l2_subdev_call_ci_state_active - call an operation of a v4l2_subdev which
+ *				      takes state as a parameter, passing the
+ *				      subdev its active state.
  *
  * @sd: pointer to the &struct v4l2_subdev
  * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
@@ -2007,13 +2014,14 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
  *     each element at &struct v4l2_subdev_ops.
  * @args: arguments for @f.
  *
- * This is similar to v4l2_subdev_call_state_active(), except that as this
- * version allocates a new state, this is only usable for
- * V4L2_SUBDEV_FORMAT_TRY use cases.
- *
- * Note: only legacy non-MC drivers may need this macro.
+ * This macro is just as v4l2_subdev_call_state_active(), with the exception
+ * that it passes NULL as the client info to sub-device ops that need it
+ * (currently pad ops set_fmt, get_selection and set_selection).
  */
-#define v4l2_subdev_call_state_try(sd, o, f, args...)                         \
+#define v4l2_subdev_call_ci_state_active(sd, o, f, args...)		\
+	__v4l2_subdev_call_state_active(v4l2_subdev_call, sd, o, f, ##args)
+
+#define __v4l2_subdev_call_state_try(call, sd, o, f, args...)		      \
 	({                                                                    \
 		int __result;                                                 \
 		static struct lock_class_key __key;                           \
@@ -2025,13 +2033,58 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 			__result = PTR_ERR(state);                            \
 		} else {                                                      \
 			v4l2_subdev_lock_state(state);                        \
-			__result = v4l2_subdev_call(sd, o, f, state, ##args); \
+			__result = call(sd, o, f, NULL, state, ##args);	      \
 			v4l2_subdev_unlock_state(state);                      \
 			__v4l2_subdev_state_free(state);                      \
 		}                                                             \
 		__result;                                                     \
 	})
 
+/**
+ * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
+ *				takes state as a parameter, passing the
+ *				subdev a newly allocated try state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This is similar to v4l2_subdev_call_state_active(), except that as this
+ * version allocates a new state, this is only usable for
+ * V4L2_SUBDEV_FORMAT_TRY use cases.
+ *
+ * Note: only legacy non-MC drivers may need this macro.
+ */
+#define v4l2_subdev_call_state_try(sd, o, f, args...)			      \
+	__v4l2_subdev_call_state_try(v4l2_subdev_call_drop_fourth, sd, o, f,  \
+				     ##args);
+
+/**
+ * v4l2_subdev_call_ci_state_try - call an operation of a v4l2_subdev which
+ *				   takes state as a parameter, passing the
+ *				   subdev a newly allocated try state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This is similar to v4l2_subdev_call_state_try(), with the exception
+ * that it passes NULL as the client info to sub-device ops that need it
+ * (currently pad ops set_fmt, get_selection and set_selection).
+ *
+ * Note: only legacy non-MC drivers may need this macro.
+ */
+#define v4l2_subdev_call_ci_state_try(sd, o, f, args...)		     \
+	__v4l2_subdev_call_state_try(v4l2_subdev_call, sd, o, f, ##args);
+
 /**
  * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
  *
-- 
2.47.3


