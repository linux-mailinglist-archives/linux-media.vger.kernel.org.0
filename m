Return-Path: <linux-media+bounces-58406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PKmG/cI2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F63CF40B
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8A813012A92
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A41533D6D2;
	Thu,  9 Apr 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHcxgrPP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CDF3368AB
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765724; cv=none; b=DQRjlGP/in2ivE9Tu0b54Bll9gYsXtk8CaqLSlJjmfZgUVgkzRRYRisX6g7RIiI+mNexT79QEKWHTQPdqYDCoz46EmHeqR4ircPIjcKrPPVSOa46+pVZV5vMni0HRa9RvDOyZrtg+frHJy5h7h0M/e3XOEfFEHnd7yFS7mDncr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765724; c=relaxed/simple;
	bh=q236kfDg1SuG2WQW/HZDuxA5/zkr8x5WrVyzQLM2MgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cgs2w7V2xJoQQhI7cZRMQThhEp4vbPeDUttcA+CRNX1Oqj5Y6Mqt/TUcJOi8/mQ4y9ILgVK5lSGTB9JapKBqMkAXXWg1hHk1kfF4hBm9srnULJ33kGpGeoDkU29g74r2CcySGtLIf53VvutpzB98uOhvg9ew93HwXl4sGPt8xtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHcxgrPP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765723; x=1807301723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q236kfDg1SuG2WQW/HZDuxA5/zkr8x5WrVyzQLM2MgE=;
  b=LHcxgrPP2U+sWnBj8mgCDzk1+lsGTd/cjXQv7yNC7KWIxRqfvAvYOpto
   S6xaNCRGQkLUZEARMqkQ48p2h7ZAlLwLD3vQkaxYyKDn26uaCzT2s8Hq6
   WYRRu6Fe8pOjGdCT385IZENQn2r3UzcuCvKZJhnqKuFNr2QaN6NGTtXoU
   hcND0Sn5rFlfGhqBIo8POXPhKFTu+6LgX/c87Td5oV/xIRwhkz+loNAT2
   wkR0ThwLEjHiMjMvH0aZgPBbabV2rKFmEFP26h1MtrjWW18VGSFZEGQxX
   ueBWZ8DSM7TYJ45B4CrKNjDvvoYGAidX/9m5hiMNPW9A63a/FWn/s1M0t
   w==;
X-CSE-ConnectionGUID: Jf+957tpQ5mouyzw+cURuw==
X-CSE-MsgGUID: AJtjf5nzTsm6GYmCcVz/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408922"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:16 -0700
X-CSE-ConnectionGUID: 4MvF2F2qQROApjEUEdb4Fw==
X-CSE-MsgGUID: sw1cbT/HSyS1eK7UexR0RQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 81E7E122142;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045ql-49En;
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
Subject: [PATCH v12 86/86] media: bcm2835-unicam: Support generic raw formats
Date: Thu,  9 Apr 2026 23:15:01 +0300
Message-ID: <20260409201501.975242-87-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58406-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A37F63CF40B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for 8-bit unpacked and 10-, 12- and 14-bit packed generic raw
formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/broadcom/bcm2835-unicam.c  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 38afdf5a32ba..74a6c4820a67 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -452,6 +452,33 @@ static const struct unicam_format_info unicam_image_formats[] = {
 		.csi_dt		= MIPI_CSI2_DT_RAW14,
 		.unpack		= UNICAM_PUM_UNPACK14,
 	}, {
+	/* Generic raw formats */
+		.fourcc		= V4L2_PIX_FMT_RAW_8,
+		.code		= MEDIA_BUS_FMT_RAW_8,
+		.depth		= 8,
+		.csi_dt		= MIPI_CSI2_DT_RAW8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RAW_CSI2_10,
+		.unpacked_fourcc = V4L2_PIX_FMT_RAW_16,
+		.code		= MEDIA_BUS_FMT_RAW_10,
+		.depth		= 10,
+		.csi_dt		= MIPI_CSI2_DT_RAW10,
+		.unpack		= UNICAM_PUM_UNPACK10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RAW_CSI2_12,
+		.unpacked_fourcc = V4L2_PIX_FMT_RAW_16,
+		.code		= MEDIA_BUS_FMT_RAW_12,
+		.depth		= 12,
+		.csi_dt		= MIPI_CSI2_DT_RAW12,
+		.unpack		= UNICAM_PUM_UNPACK12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RAW_CSI2_14,
+		.unpacked_fourcc = V4L2_PIX_FMT_RAW_16,
+		.code		= MEDIA_BUS_FMT_RAW_14,
+		.depth		= 14,
+		.csi_dt		= MIPI_CSI2_DT_RAW14,
+		.unpack		= UNICAM_PUM_UNPACK14,
+	}, {
 	/* 16 bit Bayer formats could be supported. */
 
 	/* Greyscale formats */
-- 
2.47.3


