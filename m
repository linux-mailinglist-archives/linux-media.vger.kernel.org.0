Return-Path: <linux-media+bounces-47276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47CC6941F
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A5864F007E
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D8E3559EB;
	Tue, 18 Nov 2025 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HcL1kECp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6BC3559C9;
	Tue, 18 Nov 2025 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467431; cv=none; b=m2mRMNij3EKNMbNeqmytGAFC+LoURStJDadBiuZakbKDatKWrcXkCOKyEqVPSTmZ36S28ruKfJVCKrWC1Sf0MHepGl8BmQ2AVNoCACEyeSLxOR7SGNqG877HSJ4Xruvui9fCDS7KHsOgMTOo+lzU6cZROBqYM/CgXXGZ81s/IHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467431; c=relaxed/simple;
	bh=x2cu8j6UmAda2SDhN/5Ft0ZGyqR6SbTVxeJ1Zvms/kQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f784d6fyyaAENwtdVodYHol37cvUuQwGs+BFJildtXYnKmGtG3rMih5dfo9z2YGo+XUMLMm4Qr8+Cba/pth9EIUgATNcCu792+7QqOgNP5UMPfJJsSbx6scrdsw25yHHwuSzSOHfC7ACNUr/9eyyLyena1tSbfxxGb4kf0+gRRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HcL1kECp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41ED31FE4;
	Tue, 18 Nov 2025 13:01:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467303;
	bh=x2cu8j6UmAda2SDhN/5Ft0ZGyqR6SbTVxeJ1Zvms/kQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HcL1kECpJBokdF+kWBr5iClnZzpRX5DUy3rX2llxHCiQF/QFy6hez7EZ0Xf/jmX/A
	 fucGJEZDcS1c7oJJjvG1T/SQKfkbB/RVVxJ4oZBunH5gJEwUByi5nLC5ipI2qg4XHu
	 9489h5zUmowtKNYWSL1p4idIemDsyNFgXzgsa764=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:32:57 +0530
Subject: [PATCH v2 04/16] media: i2c: ov5647: Sensor should report RAW
 color space
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-4-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=3YyHwvwXP2TLRC7CnMo5LWgSE/bL4N04rQIJqEJyl3A=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGB9KlnbI3BxXGKWLVte73j4/8SW5shQTrvfY
 oROzt/jg26JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgfQAKCRBD3pH5JJpx
 RZ95D/4wPs3SLa6LOUhJRjYprVp4nGg6HV15zYA4gkUi1nwYbL1pOyYBIZXF/Yh0ygjntvlbbaG
 ySkgrDY/y+cQzfq5tRZQge5c3Ik4AH0hzWChdwQ+9Ze7DxWwS8cKvicXnBIeyDENYUn9ucU9cQp
 rHpi5XUaeR8SPkJBYmSR9oy1iJ4eQcG4Oo3Mrcp95acDFxt/lk2c07CoqV2TZdbNkQwXmAMn8Lo
 9s/ZlSb3PTXoBUkSOBAm3hZbYJvuNYN31b8OOmAQXIlIKjgm+H/3548/rd/8Wa942xAbs8XNxzj
 FbVP0lzJf9htlKG8e8cCRki56OSE3qlBfKlqzfybf3F4NseARr75rNZHxRPu0OXVzfCd3YhCZZT
 ReKkCUYm+8THy+po/XXcd9TuJHiXNz2FMn7BNlvj9uU0nRuXWM15n6lyryhgkXGMCZ3AfYCpZQK
 MTI2wQlHRRvbHcIJhre7fMsRont6h5BLEnFntAN4t1s1DswHwXJbmq++syucJ3aNUUsTxwiS7/q
 mafly/AMmVaRVp138Z3E4BoJfnDlNDyg/S0x8ZEcFk7K9cYEv7SJmsrn0St2LwRdTkbwIHTPCP7
 YMffO8miI5+TereZj6yuqD0dO/j2Z403CwCAP68H5rv0ZVpLEudEtHSD8cwf1zlPrgLfqYvQlow
 LsSLuUasO3ZXJVA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

As this sensor captures RAW bayer frames, the colorspace should be
V4L2_COLORSPACE_RAW instead of SRGB.

Fixes: a8df5af695a1 ("media: ov5647: Add SGGBR10_1X10 modes")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 191954497e3dba4b1de4094b2ea1328a6e287003..c0f1121b025e5592d6fd4d5fd23e4262dde2d84c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -508,7 +508,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 2592,
 			.height		= 1944
@@ -529,7 +529,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1920,
 			.height		= 1080
@@ -550,7 +550,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1296,
 			.height		= 972
@@ -571,7 +571,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 640,
 			.height		= 480

-- 
2.51.1


