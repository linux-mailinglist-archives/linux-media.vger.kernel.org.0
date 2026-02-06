Return-Path: <linux-media+bounces-52295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFFjBSnphWkLIQQAu9opvQ
	(envelope-from <linux-media+bounces-52295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9BFFDF39
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB9F43044D13
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165DD3D525E;
	Fri,  6 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQ0egt82"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E42A3AEF4B
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383624; cv=none; b=N8zg+d+YY91CKNDzOkqzmYrLcDbD55kEhMmoxea52819r1kIwxDikNAKl49nVY3cDaq983HggXfKaI19FmBCe1XviNGiUb58DhRssQeGjqFQuK3W9bWKo7IG0LSwFyvs3O5LNMyP9HFLtX6P9YuaLDxVTE9hfw8+n/Wh/DOX1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383624; c=relaxed/simple;
	bh=phab9fO5+Mo0iZhGBUwtYFPVDrgGzN+whznSDhQfo9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3yu4QDF+VZr0zqyN9xu8m8X4yWLAMXn2tUR+c+CgTb8Tvuaws7pwlnvfOVETw6Som3jHbXJUc2fMdjKCl0w/hTqM6PRC0VIrnQLv4SUsrPT5TeUtoqrWpHOFhjceWjGXgemhaRtoQG8AMnI9X2/AbOWM6Epk4Q6X73jg4JpIgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQ0egt82; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770383624; x=1801919624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=phab9fO5+Mo0iZhGBUwtYFPVDrgGzN+whznSDhQfo9Q=;
  b=DQ0egt820Mz9czmm++10JsVE2caBmW97mTwN/LtWf9n5Pepm5eacQg8h
   YZZRRgRNUJC+udIe5UaSReC7CU6kdzayxDUhnwxdPygbGQgQVzFKfBOkE
   ERJR/eQIG2+0Zcl3/mheAJ4xLPPjLUGILnrD1mkL4wO8TzVKl4EQ8HF83
   VyQR6iuVH4jDjK7dT0M2VsH4H8KN/KQ5cYp6cisdKBKXrWgIZsyb4JoVj
   7qlFkPbWn41IsrvB7KmNSdtO+VavuSRhbowJoIi/BGTwrBzxtU4RUf5ej
   J3zZzfLcrlL6dorR5SB9xWtSwYj3gbZP5PBGDy/Gxiew+Yf+2VsqIrAu6
   A==;
X-CSE-ConnectionGUID: uPpiCOycRAWYtS5ssH6KYA==
X-CSE-MsgGUID: PYHqEU7/TEiYG3ga4IhBtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75441192"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75441192"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:44 -0800
X-CSE-ConnectionGUID: v/t/TjzmQ0K5X1qE1FG2IQ==
X-CSE-MsgGUID: BStWDmQpR5O4/YWbf5GFLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215391290"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:38 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8DAF4121EC2;
	Fri, 06 Feb 2026 15:13:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1voLeL-00000005Tsm-1kdq;
	Fri, 06 Feb 2026 15:13:29 +0200
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
Subject: [PATCH 12/13] media: i2c: Perform client info changes to i2c drivers
Date: Fri,  6 Feb 2026 15:13:29 +0200
Message-ID: <20260206131329.1306429-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
References: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-52295-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA9BFFDF39
X-Rspamd-Action: no action

Perform client info argument related changes to two i2c drivers (s5k5baf
and tc358743). These changes are not done by Coccinelle scripts in the
following patch and will be squashed to the previous patch eventually.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/s5k5baf.c  | 1 +
 drivers/media/i2c/tc358743.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index d1d00eca8708..a580b7e63302 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1463,6 +1463,7 @@ static bool s5k5baf_cmp_rect(const struct v4l2_rect *r1,
 }
 
 static int s5k5baf_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index a0ca19359c43..59f509aa1939 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1822,7 +1822,7 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
 	struct tc358743_state *state = to_state(sd);
 
 	u32 code = format->format.code; /* is overwritten by get_fmt */
-	int ret = tc358743_get_fmt(sd, sd_state, format);
+	int ret = tc358743_get_fmt(sd, ci, sd_state, format);
 
 	if (code == MEDIA_BUS_FMT_RGB888_1X24 ||
 	    code == MEDIA_BUS_FMT_UYVY8_1X16)
-- 
2.47.3


