Return-Path: <linux-media+bounces-35272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B872AE04BD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3704A39CA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708AB253F31;
	Thu, 19 Jun 2025 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzNcWNIB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1125392C
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334337; cv=none; b=TNmGTpkYa0Pkdua5KN7c8qXY35BHbXtWeOq7dthq0A9M48SuUW9ei1g0u2TV1WZ+atqLYmx0CXmYXkjtpNCZxHjqFGYv0aN6ylGDHgtT8TJDbbmPuS3ZeIY//fobPhHgNgBrJeWzQWBR7zyeopWZ3lJYyY7uR2LSpJR0vxOe95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334337; c=relaxed/simple;
	bh=oI60rt2rHfPsLycCfWogIrSBUuR8qCpEU+bJ5DxQxms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k4bV+JWv83R0BF3HMNsPFq3EqPs6lqmZQDELW4cKKRhyrsfyA33Ws85xAKvJH/X7KLg2IK1NwRwn8YsgFTINlPTWZu1isCzdoq+L+EKklk4Ckn69eY3IZKtTX6bTWe8DhCKvrkSBZe5lLya8eXUt9uWlZBj5Da6rA5XMKMc1sK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzNcWNIB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334337; x=1781870337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oI60rt2rHfPsLycCfWogIrSBUuR8qCpEU+bJ5DxQxms=;
  b=jzNcWNIBuCylsxOk37rEn0AC9+oAvRSYISG3N3Uid4BwvrzWw2uKOLMe
   sNlnSTRlYRCm8nEdT+Lk0XmE8nL0gC7CnPItG2C1fuuHCgWuEBqh6cTY3
   mBrLca7YOG4mj9Zib0djTgZdSUYfRJ+51Z90AuIMYBmBl8NrKPiRnOsnP
   0qDyY+HsLvvY9/jkg22o2obdHRGnp+OsLSJ+TspxoRgDB5ZDgCedPELbe
   a+lUmDLTPfRxygOcinedlNZg4/b931uDTksmAXMimrjPcMHPrJn0WX062
   exaD/vWsQKpJHU5dFVBWjacA8WopleQNHBjkEWillFE6btmR+VdRSTCUW
   A==;
X-CSE-ConnectionGUID: uLv7QWJlSyCu4jK/HxzkRg==
X-CSE-MsgGUID: DobppIA6TQmPpKtjpdhOwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014854"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:55 -0700
X-CSE-ConnectionGUID: 7GoQ0oqOTSaCmCRyMtvWlw==
X-CSE-MsgGUID: 006JdNuOTzuAe4DfwBuAaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192204"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B6ADF1204C3;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AI8-2K;
	Thu, 19 Jun 2025 14:58:36 +0300
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
Subject: [PATCH v10 07/64] media: ccs: Move ccs_validate_csi_data_format up
Date: Thu, 19 Jun 2025 14:57:39 +0300
Message-Id: <20250619115836.1946016-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
2.39.5


