Return-Path: <linux-media+bounces-35977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E56AE9EFC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 427B156234D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A452E62A7;
	Thu, 26 Jun 2025 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwoygrZA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0E2E54B9
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945024; cv=none; b=WKRQHt1mpQuQp7ubRRcRUirFt3jpalJeiGKTwlTGOIZ2LUUt9z3izNxRzYLSwYIt3l2C8krhzJjL8axX5qm5lUXaJxAazkfsK0762Y2MGbZh3NmIDZALUNuDGH/UauOM2hUfTwEHZg/db1wDNBeDVYoWXXzUp6yX9933Sjro9Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945024; c=relaxed/simple;
	bh=NqNmgHfk9sqKAbuofZm7DTIlXdXTn2/eZmmofBYfhZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tr/apuKK18JmOe5ugCVRF1UDpW6oa8mwCO29METTSudVFbenEWUBl/APEHJO/QSTcvlmRCYnXTjhArdhLM88hTdDttNffRjFNEK7DJJlr916saEcFtEC7zF4F3eDul3hAVyDHc5SW/bsvpxvzD+U544/ZlSj5eNthTXPOgpYX0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwoygrZA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945022; x=1782481022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NqNmgHfk9sqKAbuofZm7DTIlXdXTn2/eZmmofBYfhZg=;
  b=KwoygrZAyS0ymDh+KyYX7Kh8oz1F36EDtc7UEaKelLebp1oUC8dmPWT5
   XfKkWLZvjPED9MRMDzmtAg9OLxhH/FfXbU7AmVkNEyjFXxUVD1RW0/tsw
   9RwmPiLHd52V1UzgBFIXuJpNK0qciOZWuGNh9cR1+gz9LvjaTAoG+F5gZ
   A7Dg+Hikb1LX2Ug7gF3M3eLf3Pq47xmvHehjm07KzwJpdfhR7w0WOJVe/
   3K5epMWTZnDHQjdfWz0vkYlYoKNq3DYpoH7F26tH+HgdxHl61+8D2U+xL
   D6VerMcLnQwWZBneIlITK55t929WrvmH8VDHYe1Feh0j5Oh5uCt45Rb3W
   A==;
X-CSE-ConnectionGUID: NjuDQTF4SkSKphrHCT/X0g==
X-CSE-MsgGUID: oGiHmpdTR4mQlGRN4JMIFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921602"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:02 -0700
X-CSE-ConnectionGUID: YP9tHctQSWmecfnnpat8jw==
X-CSE-MsgGUID: T43eoZ9GQjWkDe8Ysx7Hnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049514"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:55 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	matthias.fend@emfend.at,
	mchehab@kernel.org,
	mehdi.djait@linux.intel.com,
	michael.riesch@collabora.com,
	naush@raspberrypi.com,
	nicholas@rothemail.net,
	nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com,
	pavel@kernel.org,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 19/48] media: i2c: mt9m111: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:10 +0200
Message-ID: <9d2ebb80f16edeb1668a3c70cc42220e27880e68.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_clk_get() fails on ACPI-based platforms, where firmware does not
provide a direct reference to the clock producer.

Replace devm_clk_get() with the new v4l2 helper
devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
platforms to retrieve a reference to the clock producer from firmware.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/mt9m111.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 9aa5dcda3805..05dcf37c6f01 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1279,9 +1279,10 @@ static int mt9m111_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	mt9m111->clk = devm_clk_get(&client->dev, "mclk");
+	mt9m111->clk = devm_v4l2_sensor_clk_get(&client->dev, "mclk");
 	if (IS_ERR(mt9m111->clk))
-		return PTR_ERR(mt9m111->clk);
+		return dev_err_probe(&client->dev, PTR_ERR(mt9m111->clk),
+				     "failed to get mclk\n");
 
 	mt9m111->regulator = devm_regulator_get(&client->dev, "vdd");
 	if (IS_ERR(mt9m111->regulator)) {
-- 
2.49.0


