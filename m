Return-Path: <linux-media+bounces-40937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEEBB33BD7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A7A1B27853
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF122D6418;
	Mon, 25 Aug 2025 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD0wH09V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CAF2D59E9
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115490; cv=none; b=Zp3NSm2Pp0JY/ArnC9s3Q2V3PazwyVAgGwS/xvLZt5qwh7mRa9M1xYhd5zgNjFu29flu9ubcEjUJrQQrNsB2jLtX+b92PePnLy23FH8UrDTntIUY5kXhIT3/vaUmjr2DJMsypT3o1xinsqxfplhOIS2rlLq3ZQH0/loyRZIrQ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115490; c=relaxed/simple;
	bh=yGSb5RtTsy31lhtwLlwfvK8Rrqyj83T9KD5q6TpOpKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3oTEj+qzZYBgdXglYW2WoasOZu278EmnPBQN68hYVw4lsg/m7RQL/rBcx4IcsAM5IG/6vwlYnAmqxiM0T5q8Ci/7nPSP4WhqRQp9nz2+Psqe6QveGzRdNFVXXzOtia3rYnz6jpy3IP3bYyBDGIRZdNW8IAZfleKc7O7ciIi56Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SD0wH09V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115489; x=1787651489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yGSb5RtTsy31lhtwLlwfvK8Rrqyj83T9KD5q6TpOpKA=;
  b=SD0wH09VBjunWAHLhPs1p1tjZJTNbaiAgMq75VGOHBqrSwMfxHlpcSUx
   MR+BSnUNfcMJoLNyjANm5sITM9P0+twKTIHtfD7kxE0zZqG+wUuedbgA2
   S89OBH+wa5gs3ClmjJPdUHSOYNV/i79F5KfqCb0Upi6zWUA9/nmn8UOk7
   uxuLP41etBUvwW8MDwseccdsHRqGB/h0SORUnFLBeuzihUG4+nS2QlZvj
   qZhUJHw3ETKdtJ0Agvd48vsnhI2jY4eEAKzMCrZmp7tvdY8y98XrjqNd4
   wxXVYVwHqbp89B1BiL0Pz+w58APChHCZq+rcopVKG0xI34N2Qe9Ow3Tut
   Q==;
X-CSE-ConnectionGUID: qGpE7SoHRjWzU0SWJiocng==
X-CSE-MsgGUID: ZnoI5nOlSBGufPX0bDEZ0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695833"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695833"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:27 -0700
X-CSE-ConnectionGUID: ST02KL44R3mHrdTEkwvdGw==
X-CSE-MsgGUID: 8nZVN6hzR8WcxSeBhpTWMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195419"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2B9E1121F7B;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005adv-0bUO;
	Mon, 25 Aug 2025 12:51:08 +0300
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
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 09/66] media: ccs: Move ccs_validate_csi_data_format up
Date: Mon, 25 Aug 2025 12:50:10 +0300
Message-ID: <20250825095107.1332313-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_validate_csi_data_format() will soon be needed elsewhere, above its
current location. Move it up.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1aa5a06d7cde..6cf60e1758b4 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1981,6 +1981,20 @@ static int ccs_post_streamoff(struct v4l2_subdev *subdev)
 	return pm_runtime_put(&client->dev);
 }
 
+static const struct ccs_csi_data_format
+*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
+		if (sensor->mbus_frame_fmts & (1 << i) &&
+		    ccs_csi_data_formats[i].code == code)
+			return &ccs_csi_data_formats[i];
+	}
+
+	return sensor->csi_format;
+}
+
 static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
@@ -2116,20 +2130,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 	}
 }
 
-static const struct ccs_csi_data_format
-*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
-		if (sensor->mbus_frame_fmts & (1 << i) &&
-		    ccs_csi_data_formats[i].code == code)
-			return &ccs_csi_data_formats[i];
-	}
-
-	return sensor->csi_format;
-}
-
 static int ccs_set_format_source(struct v4l2_subdev *subdev,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
-- 
2.47.2


