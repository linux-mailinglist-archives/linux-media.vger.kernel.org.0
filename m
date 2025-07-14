Return-Path: <linux-media+bounces-37666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB44B042B3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53B23AB74C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF90725BF1B;
	Mon, 14 Jul 2025 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IgpuA3kn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683B25F784;
	Mon, 14 Jul 2025 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505635; cv=none; b=RD3PDWQNbDqCPI1Zb0Er8+aWGsbEdovCSNBtLxJOPE1jdIQYU/XmYBxbvJDOoAdNeJuNlMguiHBYDdNezBi00SAK+wAIw46fd/TH4jmWHGLS6wsYdn+27eF5EEes9sWLjon2OMqvzx/MH66eiaU6+M0DDKQKYeIHKGaSDCrK9io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505635; c=relaxed/simple;
	bh=LafKDtuf7H/0IBehRJTQAMxK30vklDEYOVtSBZNG6Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKJiNyEC/DykbjLuH/+KZ0B0ddxh681AMqJ43f9aLRseAEwpfGUjZenvX1Xthe4Mc4DilOI3eb+j1hZYYMj5oUdOxSLtI129gyg5raq7bl4hOEPewDp/A0e5vEJ9ssZ8uHhBKyeNdr56CcM6lW+vqCFAjoIO3UK591mbJEFKGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IgpuA3kn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 571C05304;
	Mon, 14 Jul 2025 17:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505581;
	bh=LafKDtuf7H/0IBehRJTQAMxK30vklDEYOVtSBZNG6Fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IgpuA3kn3gOwXcOOfCkCwuA4qQtfv3NbRc6ouOZv39Qlm7UwVU++e/uWBbPTJfqWV
	 neuR2j151IlZKzwVeACw+MiuqzanWCkSqiv6bfUg+4ltHTXJlgEq360L0thG72WvCl
	 gJbkRG6K7lv+hUWis2KgNpnP/KZgrEUemNwUq6ds=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:39 +0100
Subject: [PATCH v11 13/19] media: uapi: Add 3a stats buffer for mali-c55
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-13-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9092;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=LafKDtuf7H/0IBehRJTQAMxK30vklDEYOVtSBZNG6Fc=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0Ca5Ndl7vU1pbjN6YLklv9BzVTy/UGvKUwZ
 BCCsVpQK5+JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAgAKCRDISVd6bEV1
 MqL4D/9WHOfllQWN3+hZaC5Y0XxFXSQSkriuWTY0d4Dx1JZwT6S9AumSZjpgRSVuZnoNA9YdwZl
 Z2QOazJo7BpVd/FvoUkWzgKgf3T8aAD+95JReY6/FByhEsCikl6BI8VVxioDjtZaHlHOL/g/dJ2
 dlyXGqqo9++VRJDGnx/auhnRVyCF0wjLLQK4Ldog3qfwKl9aqGuOTaq2v/sEChExfA4jOy+ANHf
 tt184gpg19mAoheV2lUKp11vJPBUttLUN66X7rg8aWWe36+d5BShb+AZJ5lrnBKuyu62Cg8/viz
 jL5dS7jfevunCjUkIUykVoeJGOcHXVDYa5Y1VW10mJvmzsDVH8dDl04vNBKHB8eL2ioiFw2UmtY
 CwvbN0EZRRly+BdAeyPMvHVWoqFtDr1ru53tV5i/ZZh4+avHc3OqkRH0I5F1i9POCc8lI70Ikh3
 FkGQAhKSAcUYh1TLkcVOyHlTJnsdpY3bjf9QijlC8jlaw/OI0+IHgtserexPgZ4afbmDF4w0mRo
 Bjp/VixWmDOO0TuRdCTLdI6RkyCpYyUTbvoFWlmU+DvP/Z9ISHbIBX6DUiokN4BupuqWdi2Zk+h
 lVvRM+KakouIrQzfjrodxk0GaFQlPvyor1LEk0Suo/ZroaysDhm9jhQOGfc4BRyCSEF8YPfzOfn
 zE6GK72GrS5tsqQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Describe the format of the 3A statistics buffers in the userspace API
header for the mali-c55 ISP.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- New patch

Changes in v5:

	- New patch
---
 MAINTAINERS                                    |   1 +
 include/uapi/linux/media/arm/mali-c55-config.h | 170 +++++++++++++++++++++++++
 2 files changed, 171 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d0b268ed7588fbffb767cd962df6b0e31a9b842..87255112240dbce86bca8d9a6683015ce12a3bce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2039,6 +2039,7 @@ F:	Documentation/admin-guide/media/mali-c55.rst
 F:	Documentation/devicetree/bindings/media/arm,mali-c55.yaml
 F:	Documentation/userspace-api/media/drivers/mali-c55.rst
 F:	drivers/media/platform/arm/mali-c55/
+F:	include/uapi/linux/media/arm/mali-c55-config.h
 
 ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
index 2bd60a0d78786be368c2e51b1a0a63fd2a5f690b..8d31764140a0ef6aa8b0c771a4ed7565c9c96670 100644
--- a/include/uapi/linux/media/arm/mali-c55-config.h
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -8,6 +8,7 @@
 #ifndef __UAPI_MALI_C55_CONFIG_H
 #define __UAPI_MALI_C55_CONFIG_H
 
+#include <linux/types.h>
 #include <linux/v4l2-controls.h>
 
 #define V4L2_CID_MALI_C55_CAPABILITIES		(V4L2_CID_USER_MALI_C55_BASE + 0x0)
@@ -23,4 +24,173 @@
 #define MALI_C55_GPS_FRSCALER_FITTED		BIT(9)
 #define MALI_C55_GPS_DS_PIPE_FITTED		BIT(10)
 
+/*
+ * Frames are split into zones of almost equal width and height - a zone is a
+ * rectangular tile of a frame. The metering blocks within the ISP collect
+ * aggregated statistics per zone. A maximum of 15x15 zones can be configured,
+ * and so the statistics buffer within the hardware is sized to accommodate
+ * that.
+ *
+ * The utilised number of zones is runtime configurable.
+ */
+#define MALI_C55_MAX_ZONES	(15 * 15)
+
+/**
+ * struct mali_c55_ae_1024bin_hist - Auto Exposure 1024-bin histogram statistics
+ *
+ * @bins:	1024 element array of 16-bit pixel counts.
+ *
+ * The 1024-bin histogram module collects image-global but zone-weighted
+ * intensity distributions of pixels in fixed-width bins. The modules can be
+ * configured into different "plane modes" which affect the contents of the
+ * collected statistics. In plane mode 0, pixel intensities are taken regardless
+ * of colour plane into a single 1024-bin histogram with a bin width of 4. In
+ * plane mode 1, four 256-bin histograms with a bin width of 16 are collected -
+ * one for each CFA colour plane. In plane modes 4, 5, 6 and 7 two 512-bin
+ * histograms with a bin width of 8 are collected - in each mode one of the
+ * colour planes is collected into the first histogram and all the others are
+ * combined into the second. The histograms are stored consecutively in the bins
+ * array.
+ *
+ * The 16-bit pixel counts are stored as a 4-bit exponent in the most
+ * significant bits followed by a 12-bit mantissa. Conversion to a usable
+ * format can be done according to the following pseudo-code::
+ *
+ *	if (e == 0) {
+ *		bin = m * 2;
+ *	} else {
+ *		bin = (m + 4096) * 2^e
+ *	}
+ *
+ * where
+ *	e is the exponent value in range 0..15
+ *	m is the mantissa value in range 0..4095
+ *
+ * The pixels used in calculating the statistics can be masked using three
+ * methods:
+ *
+ * 1. Pixels can be skipped in X and Y directions independently.
+ * 2. Minimum/Maximum intensities can be configured
+ * 3. Zones can be differentially weighted, including 0 weighted to mask them
+ *
+ * The data for this histogram can be collected from different tap points in the
+ * ISP depending on configuration - after the white balance or digital gain
+ * blocks, or immediately after the input crossbar.
+ */
+struct mali_c55_ae_1024bin_hist {
+	__u16 bins[1024];
+} __attribute__((packed));
+
+/**
+ * struct mali_c55_ae_5bin_hist - Auto Exposure 5-bin histogram statistics
+ *
+ * @hist0:	16-bit normalised pixel count for the 0th intensity bin
+ * @hist1:	16-bit normalised pixel count for the 1st intensity bin
+ * @hist3:	16-bit normalised pixel count for the 3rd intensity bin
+ * @hist4:	16-bit normalised pixel count for the 4th intensity bin
+ *
+ * The ISP generates a 5-bin histogram of normalised pixel counts within bins of
+ * pixel intensity for each of 225 possible zones within a frame. The centre bin
+ * of the histogram for each zone is not available from the hardware and must be
+ * calculated by subtracting the values of hist0, hist1, hist3 and hist4 from
+ * 0xffff as in the following equation:
+ *
+ *	hist2 = 0xffff - (hist0 + hist1 + hist3 + hist4)
+ */
+struct mali_c55_ae_5bin_hist {
+	__u16 hist0;
+	__u16 hist1;
+	__u16 hist3;
+	__u16 hist4;
+} __attribute__((packed));
+
+/**
+ * struct mali_c55_awb_average_ratios - Auto White Balance colour ratios
+ *
+ * @avg_rg_gr:	Average R/G or G/R ratio in Q4.8 format.
+ * @avg_bg_br:	Average B/G or B/R ratio in Q4.8 format.
+ * @num_pixels:	The number of pixels used in the AWB calculation
+ *
+ * The ISP calculates and collects average colour ratios for each zone in an
+ * image and stores them in Q4.8 format (the lowest 8 bits are fractional, with
+ * bits [11:8] representing the integer). The exact ratios collected (either
+ * R/G, B/G or G/R, B/R) are configurable through the parameters buffer. The
+ * value of the 4 high bits is undefined.
+ */
+struct mali_c55_awb_average_ratios {
+	__u16 avg_rg_gr;
+	__u16 avg_bg_br;
+	__u32 num_pixels;
+} __attribute__((packed));
+
+/**
+ * struct mali_c55_af_statistics - Auto Focus edge and intensity statistics
+ *
+ * @intensity_stats:	Packed mantissa and exponent value for pixel intensity
+ * @edge_stats:		Packed mantissa and exponent values for edge intensity
+ *
+ * The ISP collects the squared sum of pixel intensities for each zone within a
+ * configurable Region of Interest on the frame. Additionally, the same data are
+ * collected after being passed through a bandpass filter which removes high and
+ * low frequency components - these are referred to as the edge statistics.
+ *
+ * The intensity and edge statistics for a zone can be used to calculate the
+ * contrast information for a zone
+ *
+ *	C = E2 / I2
+ *
+ * Where I2 is the intensity statistic for a zone and E2 is the edge statistic
+ * for that zone. Optimum focus is reached when C is at its maximum.
+ *
+ * The intensity and edge statistics are stored packed into a non-standard 16
+ * bit floating point format, where the 7 most significant bits represent the
+ * exponent and the 9 least significant bits the mantissa. This format can be
+ * unpacked with the following pseudocode::
+ *
+ *	if (e == 0) {
+ *		x = m;
+ *	} else {
+ *		x = 2^e-1 * (m + 2^9)
+ *	}
+ *
+ * where
+ *	e is the exponent value in range 0..127
+ *	m is the mantissa value in range 0..511
+ */
+struct mali_c55_af_statistics {
+	__u16 intensity_stats;
+	__u16 edge_stats;
+} __attribute__((packed));
+
+/**
+ * struct mali_c55_stats_buffer - 3A statistics for the mali-c55 ISP
+ *
+ * @ae_1024bin_hist:		1024-bin frame-global pixel intensity histogram
+ * @iridix_1024bin_hist:	Post-Iridix block 1024-bin histogram
+ * @ae_5bin_hists:		5-bin pixel intensity histograms for AEC
+ * @reserved1:			Undefined buffer space
+ * @awb_ratios:			Color balance ratios for Auto White Balance
+ * @reserved2:			Undefined buffer space
+ * @af_statistics:		Pixel intensity statistics for Auto Focus
+ * @reserved3:			Undefined buffer space
+ *
+ * This struct describes the metering statistics space in the Mali-C55 ISP's
+ * hardware in its entirety. The space between each defined area is marked as
+ * "unknown" and may not be 0, but should not be used. The @ae_5bin_hists,
+ * @awb_ratios and @af_statistics members are arrays of statistics per-zone.
+ * The zones are arranged in the array in raster order starting from the top
+ * left corner of the image.
+ */
+
+struct mali_c55_stats_buffer {
+	struct mali_c55_ae_1024bin_hist ae_1024bin_hist;
+	struct mali_c55_ae_1024bin_hist iridix_1024bin_hist;
+	struct mali_c55_ae_5bin_hist ae_5bin_hists[MALI_C55_MAX_ZONES];
+	__u32 reserved1[14];
+	struct mali_c55_awb_average_ratios awb_ratios[MALI_C55_MAX_ZONES];
+	__u32 reserved2[14];
+	struct mali_c55_af_statistics af_statistics[MALI_C55_MAX_ZONES];
+	__u32 reserved3[15];
+} __attribute__((packed));
+
 #endif /* __UAPI_MALI_C55_CONFIG_H */

-- 
2.34.1


