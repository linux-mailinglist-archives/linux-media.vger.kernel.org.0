Return-Path: <linux-media+bounces-56995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ds8OhPAw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:59:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A0323673
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F2B030439CF
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2735F3C9440;
	Wed, 25 Mar 2026 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcRfi06w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED33C454E
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436334; cv=none; b=t0zmBKqx7o2NKOnRUIBnkHmoPoF/1kKBDZvMdPWwkcDeqUJ1kZ2hDUwRWVLLPrU/6aKUpxMwWbBuBCgry7hJ3gnXHiHhsaJUxVmeyUDy/RU3KJj3kexTv0YORNH9ot9JucoWrjbmv+BdUSJ2qdNsNUcY9PAAZ8sdxguPDg3OpXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436334; c=relaxed/simple;
	bh=4qwME4bFcW63izNidqlxsL7O/G8cgz8uOodADpThi2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y31Rc2NVyg70AcxThkWsH3pvLUr03FMB2bKSP1Z+g8RJrNAQSKg+FRVxfYofECMjBVC1dFS6ihhd2p4idIWFTUBhWZWM/Jiz09MBUyA2Hd4y21EGAcHPYvrMCFM1S2jJ0V0Sq/A65NcfS5uTHbVJWNlSU2Dz8RJ5YYWqEGu1Y1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcRfi06w; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436332; x=1805972332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qwME4bFcW63izNidqlxsL7O/G8cgz8uOodADpThi2A=;
  b=UcRfi06wkHl+SNcaS3FWS7lPA1z3te+ts4zQw9OCcXAbgKtL80JBI4WJ
   SlARs53JszKfijo5tKHLjyzaxaHIcKy+qDKaBISmQgJlOO05QYJNAPA9v
   T0p2+Vd5L5ToR9sYtWcBxB768lCpQZNsBn41c9aG3niEzz/JFvgflmFAQ
   qJPpgHh1IdZ9ZB08O5h81Y/RZRS3aaIzynL56pBPdO6cHbuTPKcwx0Mcp
   LZlS/JxVOnY8EKqsQZH3Q4Ccx8ykkwXNMn8KN33HUdoxhe2bTgqYjaD0U
   ESZoN+SzdfIhjx1lou3YWHwh8YJFVyBEHtiHgvbgu+SX2tuWMcKKrM0q1
   g==;
X-CSE-ConnectionGUID: QfESrrgSSKSGYuX/2KOweQ==
X-CSE-MsgGUID: u/T+JfFdT6+n7I/EQyckVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496467"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:50 -0700
X-CSE-ConnectionGUID: fnEtqUMWStmQHUvALtEZ/A==
X-CSE-MsgGUID: PiuDwIAdRoKPgGupxzbgQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763538"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:43 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C6DAE122542;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wBD-10sd;
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
Subject: [PATCH v3 21/22] media: v4l2-subdev: Perform client info changes to i2c drivers
Date: Wed, 25 Mar 2026 12:58:18 +0200
Message-ID: <20260325105818.1176816-23-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-56995-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B06A0323673
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Perform client info argument related changes to two i2c drivers (s5k5baf
and tc358743). These changes are not done by Coccinelle scripts in the
following patch and will be squashed to the previous patch eventually.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/og01a1b.c                     | 2 +-
 drivers/media/i2c/s5k5baf.c                     | 1 +
 drivers/media/i2c/tc358743.c                    | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 1675f0460969..1d109ca75d76 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -763,7 +763,7 @@ static int og01a1b_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	og01a1b_set_format(sd, state, &fmt);
+	og01a1b_set_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
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
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index 35069099c364..d4f76d513dc6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -31,6 +31,7 @@ bool ipu6_isys_is_bayer_format(u32 code);
 u32 ipu6_isys_convert_bayer_order(u32 code, int x, int y);
 
 int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *fmt);
 int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-- 
2.47.3


