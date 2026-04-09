Return-Path: <linux-media+bounces-58436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH0AF0wJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9652C3CF4D0
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A602A30359EA
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D52634A3DB;
	Thu,  9 Apr 2026 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCtWqF79"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFDD342523
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765735; cv=none; b=iACH0vHY1IbLqMPDskAZkciV1sBIH83bOa44H4y16CP+11JHs+1gOMqgvnLuHBXp9/QOY4NGAsw4iAZq3APezK4I6UU1RqQONFz/Y9/kaSf7fhOoeWS0PZYs7MXrTSobQGBiqMjv4pZHHbU0bUMVeHrFlVFlgc/Nkdyj9IvN1ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765735; c=relaxed/simple;
	bh=XE2jaSktc+PbpgidHQ+xG0/AcM9uG8YWR5uuFb3cV9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQPxcSkpwmwENspRxAAn5aXyP3Ge2EOcKyLXSG4oeQ6W6K503EfC0L/OXTpgYdVDF3NptxKjnebP7Ex3TJmV699og1YQQ5yqOXFb4xKJnq52a1ipt0YGH6nSAjTmCI6I0VF1QmF4AuOQX339iAcJhV1nh9l8Aw7/cKJ7SJhjCMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCtWqF79; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765734; x=1807301734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XE2jaSktc+PbpgidHQ+xG0/AcM9uG8YWR5uuFb3cV9I=;
  b=UCtWqF79QQu7NNnNIJm6WSsD9zM6B5I/aQK+9xsKnh+6MdtR6PFMbfG/
   Xd0B+hk32NIt4s1NzRrV2v45AJAgct8/guB9tzyJAv9jXyNzhCtOGJlTJ
   rn5DVLpNQfwsoDDuqoznET90qIML1H6lmtqX/yLqqLV8Wkc7ZIQbODfjF
   kznPD01dWelYLG0+m1rr7EiyClCkPKw0lsCcPnZnnkflGKj8kdmIHYWH3
   VWEEgcR3NvrM31QY5xy0UKA1FvvvEz0hwob+ruRkHFqKMm+1W6AbChe6w
   RsXK9sC+uGqmz1WUp79b0oipuK326DrpXwjjzV6F9KMZ7Y1ZNDQZ+MiA9
   g==;
X-CSE-ConnectionGUID: detptdXlSMO/BvmaOUphlw==
X-CSE-MsgGUID: 3rytf+NoRFu0NnV8sbBCqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176508"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176508"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: +TP5x4T5Qqudo4ULDaAqfw==
X-CSE-MsgGUID: x85LY+LVRauJTZMN9XNTOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047534"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B97871228F7;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mz-0hJG;
	Thu, 09 Apr 2026 23:15:02 +0300
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
Subject: [PATCH v12 36/86] media: v4l2-ctrl: Improve v4l2_ctrl_g_ctrl{,int64} documentation
Date: Thu,  9 Apr 2026 23:14:11 +0300
Message-ID: <20260409201501.975242-37-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58436-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9652C3CF4D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Improve documentation of v4l2_ctrl_g_ctrl() and v4l2_ctrl_g_ctrl_int64()
by documenting what the function returns on error (i.e. 0).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-ctrls.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 327976b14d50..183683b6add8 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1105,6 +1105,8 @@ const s64 *v4l2_ctrl_get_int_menu(u32 id, u32 *len);
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for integer type controls only.
+ *
+ * Returns: the value of the control or 0 on error.
  */
 s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl);
 
@@ -1156,6 +1158,8 @@ static inline int v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for 64-bit integer type controls only.
+ *
+ * Returns: the value of the control or 0 on error.
  */
 s64 v4l2_ctrl_g_ctrl_int64(struct v4l2_ctrl *ctrl);
 
-- 
2.47.3


