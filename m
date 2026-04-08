Return-Path: <linux-media+bounces-58264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PL7Hfx21mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46D3BE54F
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 877023024907
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC273D6CC8;
	Wed,  8 Apr 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bb0OXNAR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC76F3D47A5
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662828; cv=none; b=Q1rQGx+IVAF3CKefCKE7UbAalTSav3EBBsXO3C+2WPmyQGKzq+6nnORyPWU8BxTp/QEqsTuyJi/1qleY519HijHTuNdjfSKl3+9igJTCmXeOvaGDxSLbALFcn0N7ofhHtFZqH2fvKB6zG5/ORsJbPNHBFrC96lqzh/55KK3hVKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662828; c=relaxed/simple;
	bh=4qwME4bFcW63izNidqlxsL7O/G8cgz8uOodADpThi2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=conCICNtBajmXcCewkm1Xg6t+Hh16pxzO+BjhoIY6U26C+PDvh2S2OcrqLBnvPv3yrTlc8NaFLeY8YSz4ZoUCxTuZBk/A0CVL52oeC4FvV+WceROzNXarbByxngXR5TW1ZSxFLlRiWucJSv1cwNxvtPsI6cRrLVH9KFsFkJhWic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bb0OXNAR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662828; x=1807198828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qwME4bFcW63izNidqlxsL7O/G8cgz8uOodADpThi2A=;
  b=Bb0OXNAR4pZ1TJHV15k30PJCjZTq8GgFWdJjKHmUvDFUSr9PCSLLmtza
   CmtTFK3wc9XORAVy75a5zSr39JAlG/U9c+2OaTUCdghZcFkXkZeC5VH2/
   LQ7npuyPhL4Nsu+kU70RzGEPZTEnRVfx0twdLIxFd94UCuhGBmbw371Kq
   nQmixBGfAvTR2F1DYZLDZNpRvpY4peCOqbsJ11vfacC0eG+au9aiZMUni
   4Aj0CoxPOOvNRYXq+7eG8sBf90InxPcb6BU5X7EVmr7Bl81PDF5wV8lF0
   DtpI5TqHwWMsRF178jxXHMuDaoNIiUL4A3HZyLy3/qJTjyFtvRZDlklVJ
   w==;
X-CSE-ConnectionGUID: YVYj8G/NRyWmjTesFfefvA==
X-CSE-MsgGUID: GHQ369JiRIKDf3MmXnqvdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038529"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038529"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:02 -0700
X-CSE-ConnectionGUID: ICocAxI0RsWz0ak/6fDEJA==
X-CSE-MsgGUID: fPRdbPPhRe+2XpwYUvMLMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740401"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 54DD612229E;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044E6-3DHd;
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
Subject: [PATCH v4 28/29] media: v4l2-subdev: Perform client info changes to i2c drivers
Date: Wed,  8 Apr 2026 18:39:37 +0300
Message-ID: <20260408153939.969381-29-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58264-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.942];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C46D3BE54F
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


