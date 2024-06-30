Return-Path: <linux-media+bounces-14417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE591D208
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 16:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DF4B281357
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 14:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CFE152175;
	Sun, 30 Jun 2024 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="asgJImnB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63DB1527AA;
	Sun, 30 Jun 2024 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719757121; cv=none; b=V+2gVkVPQCUzUxHhhEIH55KaC8owRPOOzuKmANWRhHpcotfprGBgysYM2CZeZbhYhAv7Jvy/5Rjx1rAzLwkCR2r7G25QRE79YkF0cWyCVUfzWYxBJ6i0WzmR57gcfPuGhOIKESt/CCKkYXj34vdDYjdAgKNUWW9la4zN8V8wnUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719757121; c=relaxed/simple;
	bh=C5kmeLYb0jLUF+nLwczQud+TEQ399CKGeKxIRRFHAhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJfYA8LhHt76rWUWDvr6SOkF8FYUGPEvRWYB18SvvFSRevPF+AkMrUMBouz9i2nk36Ngj0XmVCiQUTUYne/+btXmyWsdML4ibX08BhJK8tlX6bPq7uLFa8cvwrOfTCIa47RtgWKmSZwvHgpjs1S3tMDo4dWmqFJcp+D0SZ4UUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=asgJImnB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-36-175-nat.elisa-mobile.fi [85.76.36.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E2E666F;
	Sun, 30 Jun 2024 16:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719757087;
	bh=C5kmeLYb0jLUF+nLwczQud+TEQ399CKGeKxIRRFHAhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=asgJImnBIDIT0cvfD1Mx/fycNtsPMBTqKukwcRf2PDN9yRDHcXPXil9SNSAZ5deyz
	 EBa5qTaPwxZMz2KUCrDW9WuMnCWr4awQSQSBsbR9m2WNjcVcysgt2Y+48UO1lus7Nb
	 f5YXe+tI3X5nEb6LnNZKz7HKlX8So64n4RjPyUE8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH/RFC v1 3/9] media: i2c: ar0144: Add support for the parallel interface
Date: Sun, 30 Jun 2024 17:17:53 +0300
Message-ID: <20240630141802.15830-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic support for the parallel interface. This hasn't been tested
due to the lack of a test platform, and will thus likely not work out of
the box.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0144.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index b0e738a28de6..d231459d7218 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -10,7 +10,8 @@
  * - Use grouped parameter hold to update controls atomically
  * - Expose debug information through debugfs (FRAME_COUNT, FRAME_STATUS, ...)
  * - Make MIPI D-PHY timings configurable
- * - Support the parallel interface
+ * - Program additional parallel interface parameters (slew rates, polarities,
+ *   ...)
  * - Expose additional controls (in particular the temperature sensor and the
  *   on-chip black level correction)
  */
@@ -298,6 +299,8 @@
 #define AR0144_MIN_CSI2_LINK_FREQ		150000000U
 #define AR0144_MAX_CSI2_LINK_FREQ		384000000U
 
+#define AR0144_MAX_PARALLEL_LINK_FREQ		74250000U
+
 /*
  * The pixel array contains 1300x820 optically transparent pixels, with 6 dummy
  * pixels on each side that can't be read out. The active size is 1288x808.
@@ -464,6 +467,12 @@ static int ar0144_configure_pll(struct ar0144 *sensor)
 	return ret;
 }
 
+static int ar0144_configure_parallel(struct ar0144 *sensor,
+				     const struct ar0144_format_info *info)
+{
+	return cci_write(sensor->regmap, AR0144_SERIAL_FORMAT, 0x0200, NULL);
+}
+
 static int ar0144_configure_mipi(struct ar0144 *sensor,
 				 const struct ar0144_format_info *info)
 {
@@ -550,13 +559,19 @@ static int ar0144_start_streaming(struct ar0144 *sensor,
 	if (ret)
 		return ret;
 
-	ret = ar0144_configure_mipi(sensor, info);
+	if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL)
+		ret = ar0144_configure_parallel(sensor, info);
+	else
+		ret = ar0144_configure_mipi(sensor, info);
 
 	/*
 	 * We're all set, start streaming. Mask bad frames and keep read-only
 	 * registers locked.
 	 */
 	val = AR0144_MASK_BAD | AR0144_LOCK_REG | AR0144_STREAM | 0x2010;
+	if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL)
+		val |= AR0144_SMIA_SERIALIZER_DIS | AR0144_PARALLEL_EN
+		    |  AR0144_DRIVE_PINS;
 	cci_write(sensor->regmap, AR0144_RESET_REGISTER, val, &ret);
 
 	return ret;
@@ -581,6 +596,10 @@ static int ar0144_stop_streaming(struct ar0144 *sensor)
 	 * Initiate the transition to standby by clearing the STREAM bit. Don't
 	 * clear the bits that affect the output interface yet.
 	 */
+	if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL)
+		val |= AR0144_SMIA_SERIALIZER_DIS | AR0144_PARALLEL_EN
+		    |  AR0144_DRIVE_PINS;
+
 	ret = cci_write(sensor->regmap, AR0144_RESET_REGISTER, reset_bits, NULL);
 	if (ret)
 		return ret;
@@ -1268,6 +1287,10 @@ static int ar0144_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 	default:
 		cfg->bus.mipi_csi2 = sensor->bus_cfg.bus.mipi_csi2;
 		break;
+
+	case V4L2_MBUS_PARALLEL:
+		cfg->bus.parallel = sensor->bus_cfg.bus.parallel;
+		break;
 	}
 
 	return 0;
@@ -1607,6 +1630,10 @@ static int ar0144_parse_dt(struct ar0144 *sensor)
 		}
 		break;
 
+	case V4L2_MBUS_PARALLEL:
+		nlanes = ep->bus.parallel.bus_width ? : 12;
+		break;
+
 	default:
 		dev_err(sensor->dev, "Unsupported bus type %u\n", ep->bus_type);
 		goto error;
-- 
Regards,

Laurent Pinchart


