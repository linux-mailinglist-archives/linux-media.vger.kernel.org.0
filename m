Return-Path: <linux-media+bounces-42179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6CB51457
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60FE21C80BA8
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACB031985F;
	Wed, 10 Sep 2025 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgRYyRXN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D530597D;
	Wed, 10 Sep 2025 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501230; cv=none; b=f2v8L3t6GkziobFZQe3GYOR+f1tLvJHj4lQGKV108D9gmmMszwjQMD+z5bOD3+Q7wXEb7f3Qvd5SJWKMIcAsuk/B1bqr8uiv5OgakPMl73huBjmPjLaGZSdAvAGJiWvx0N129lN4KLtcHYDqrURQBFxoaY1zcdjI7O3ykbpL6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501230; c=relaxed/simple;
	bh=9D9vsMYDlsFwjhD/PO30n7L36/x3ogr3ovaKTqebsLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtMGtXZxsBjj82PngaRQfAkk7KLdKEJfbFP+7tD7eYTOUrpVCMj0N4WhX7EDgXk7J28O1ArmKGpdyBzhcqxGKYzKrEmN5NitCDsI2AaHXLXVF8E/WnWwb911gazlJUZA/YC7/U650o9MwgAr04yZJrMXJs+Cf/j5b0r8iM0xjCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgRYyRXN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E141C4CEFB;
	Wed, 10 Sep 2025 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757501230;
	bh=9D9vsMYDlsFwjhD/PO30n7L36/x3ogr3ovaKTqebsLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SgRYyRXN0RnWKgUNz+ma0gjDUyYj2Li2seICIcEvyx1zF0ApvftJCmnQMKS7UxrDT
	 TVPXx+y3hr3OWs29Mr4CsLnYOyqHTd53/D+D/R78UB+Esi4dIrRR5SCWwg0fE/DLss
	 8Yk6F/dCuK5hY6KecNewxpdxRW3bUZYL0hX4cKHUjUBlQ1oJMQ+BNd7s5wcw8Wys/g
	 OoFiDKgMjvZG8eE1JBtnQhMEMmMyjnBqp0gCVJkdUkIotfw5avGDFErNkU4ZaSlmIh
	 Nm1ZDM5j0aQeshAApMGnU/FLB3xRlRuHEe8s/k+ZdtLvdEu+W0dRzUo0Bvn4zehS9i
	 galSgWfogCxHQ==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/1] media: v4l2-subdev / pdx86: int3472: Use "privacy" as con_id for the privacy LED
Date: Wed, 10 Sep 2025 12:47:02 +0200
Message-ID: <20250910104702.7470-2-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910104702.7470-1-hansg@kernel.org>
References: <20250910104702.7470-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During DT-binding review for extending the V4L2 camera sensor privacy LED
support to systems using devicetree, it has come up that having a "-led"
suffix for the LED name / con_id is undesirable since it already is clear
that it is a LED.

Drop the "-led" suffix from the con_id in both the lookup table in
the int3472 code, as well as from the con_id led_get() argument in
the v4l2-subdev code.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c    | 2 +-
 drivers/platform/x86/intel/int3472/led.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 113eb74eb7c1..babcc1120354 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2602,7 +2602,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
 int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
 {
 #if IS_REACHABLE(CONFIG_LEDS_CLASS)
-	sd->privacy_led = led_get(sd->dev, "privacy-led");
+	sd->privacy_led = led_get(sd->dev, "privacy");
 	if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
 		return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led),
 				     "getting privacy LED\n");
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index f1d6d7b0cb75..b1d84b968112 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -43,7 +43,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
 
 	int3472->pled.lookup.provider = int3472->pled.name;
 	int3472->pled.lookup.dev_id = int3472->sensor_name;
-	int3472->pled.lookup.con_id = "privacy-led";
+	int3472->pled.lookup.con_id = "privacy";
 	led_add_lookup(&int3472->pled.lookup);
 
 	return 0;
-- 
2.51.0


