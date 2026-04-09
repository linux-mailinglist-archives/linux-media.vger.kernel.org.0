Return-Path: <linux-media+bounces-58449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPp2H0sK2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D32413CF6FA
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60119309E801
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1A236605D;
	Thu,  9 Apr 2026 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMO1X1qo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4008134E763
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765741; cv=none; b=Tq+FKRqAntqvPGa6xMy1fYMkOvleR7sFuNVk/64LlQqYx7bwM/Gmdw5FwCOjm0T8AimdpTqLtrQlGR6TVhB1uJD1YdbD0zlbmDZ9qmZk0SL0C04+4qeRK/r2yDimVTJ2tq+nFp3kuNY5lZWt54Klv4NkQhuvkTrvkFKGMvxZ8Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765741; c=relaxed/simple;
	bh=/YUBGE9Bhswz0uW+w23hiq0qx0ySX3LDHdsczJ7n5ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WD7IbhzuOMRYf/H1Zuq9DSTG50o1FK1EihFXDf6xhVN3INCo6ngdnIZ0Rm6DbNXz0KUS6eonrSgh05JizulakXX0tMsncguwurAGQ6oZGYfo3r2rmGT0sojIVKTeT28V2wlyDmFpfa2vAQm0nMltCd3PFsnkJxwT620B9XXLv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMO1X1qo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765740; x=1807301740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/YUBGE9Bhswz0uW+w23hiq0qx0ySX3LDHdsczJ7n5ao=;
  b=iMO1X1qo6sKk1MlWqH8IXCmMtEE1CYGAez63bi5BFJeiPHUIJ8zARiDt
   cnN3V/YaAeoc0Fc29couAGmDJaD4RbClnAMHaU18y3sh4+9zgTOK6g9Aa
   3uvAWcswh6eSu5WAHxKFZgtqj4KcuFH4AX4Nx/rDWfoDvwJyGSx00JKsd
   0jZVvmN4D1IUgsrBaZnehgvJq1FzU8ZhLv87aeeuKFDy8pub1aG0FWzG0
   v6lWKkCfN3Mom0rdLYsEjv/i/h/nE81/myR9z2pKcSDvZ6lRtzesJoIrV
   cOk6/YBDDS+zuw6jgzJHb2H2u4BJbEVvD3xE69u9TVpyutaRWpTqNDVbO
   w==;
X-CSE-ConnectionGUID: 09ifGVDESgq27ElfpftXkQ==
X-CSE-MsgGUID: 7i/6nOyKR3WlyPOVDMaYbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176690"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176690"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: DQXXAE2ITAKaixoVahXjdQ==
X-CSE-MsgGUID: fzB0RGW/TJavUoLHUUgmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047627"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C7811122925;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nF-0z9M;
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
Subject: [PATCH v12 40/86] media: v4l2-subdev: Add generic raw formats to v4l2_subdev_get_frame_desc
Date: Thu,  9 Apr 2026 23:14:15 +0300
Message-ID: <20260409201501.975242-41-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58449-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: D32413CF6FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support generic raw formats in v4l2_subdev_get_frame_desc() at bit depths
8, 10, 12 and 14.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index af9024b0f788..e7774402c44d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2804,6 +2804,7 @@ static int get_mipi_dt_for_mbus(u32 code)
 	switch (code) {
 	case MEDIA_BUS_FMT_BGR888_1X24:
 		return MIPI_CSI2_DT_RGB888;
+	case MEDIA_BUS_FMT_RAW_8:
 	case MEDIA_BUS_FMT_Y8_1X8:
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -2811,18 +2812,21 @@ static int get_mipi_dt_for_mbus(u32 code)
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		return MIPI_CSI2_DT_RAW8;
 	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 		return MIPI_CSI2_DT_RAW10;
 	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_RAW_12:
 	case MEDIA_BUS_FMT_SBGGR12_1X12:
 	case MEDIA_BUS_FMT_SGBRG12_1X12:
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 		return MIPI_CSI2_DT_RAW12;
 	case MEDIA_BUS_FMT_Y14_1X14:
+	case MEDIA_BUS_FMT_RAW_14:
 	case MEDIA_BUS_FMT_SBGGR14_1X14:
 	case MEDIA_BUS_FMT_SGBRG14_1X14:
 	case MEDIA_BUS_FMT_SGRBG14_1X14:
-- 
2.47.3


