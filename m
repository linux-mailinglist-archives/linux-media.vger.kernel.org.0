Return-Path: <linux-media+bounces-5389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 003BB859951
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 21:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C7521F21322
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 20:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDD373194;
	Sun, 18 Feb 2024 20:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GLHUPIK1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161D673191
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 20:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289040; cv=none; b=rNFwVVbG7JtIRyLLAFdbCGFd6cVHWONqYlwiCJt/pml5F+Gwjrc1Q8TICMg67wT30lBuYn8bGb80D31mHPRCgScVSRA/e+9MgooU48cLVSx2GwPJc5qctXaWPyYVshNi77EX9QaBX1z8hWaCSBzk4xauVwRye42tNwwpepv29f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289040; c=relaxed/simple;
	bh=OC0mQkPUdulodtG7ZPltjjVGbNlALjHSu3YZQme0GXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5xEsJzrYk0L04ownRKg2qvdEjXaxAgbUcPOnH8oe5EXUAq5nZJAUv7c+5x2K7+j00Ub2BsgROvx4e5V6ZwUwsSbWECp07QOa607CARE/wEEmCpa2f3jPaUtAXRY3naTo0zoe7uKg++ZhdfHxeoL44xlFlsiz+cQVbdU77eloqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GLHUPIK1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCCA91C42;
	Sun, 18 Feb 2024 21:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708289029;
	bh=OC0mQkPUdulodtG7ZPltjjVGbNlALjHSu3YZQme0GXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLHUPIK1Njczz3Qwc8S9SotaQ0+0H+UoeQh2x4NMd3iF0SbJ3dH4BRN3PkdGjgW6g
	 38c2SEzAR5isMbfI+iWTwfH/6ensd8noX2UEXutDs/YIuZH7yMjcEc9H2jYILqvJMe
	 JagBN3yfE+C/+vScVrfIO63yiV9/XSIYYFkHpa58=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Helen Koike <helen.koike@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v13 06/12] media: rkisp1: Add version enum for i.MX8MP ISP
Date: Sun, 18 Feb 2024 22:43:44 +0200
Message-ID: <20240218204350.10916-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
References: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

The NXP i.MX8MP integrates an ISP8000Nano from VeriSilicon, which is a
derivative of the ISP found in earlier Rockchip SoCs. It isn't clear at
which exact point the two product lines have diverged, and there is no
public information regarding the version numbering scheme of the
ISP8000Nano. Nonetheless, this ISP is close enough to the V10 found in
the RK3399 to be supported by the same driver.

Add an entry for the ISP found in the NXP i.MX8MP to the version enum.
Given the lack of information on the version numbering scheme, and on
whether or not the version in the i.MX8MP is identical to other
ISP8000Nano versions or has been customized for the i.MX8MP, depart from
the number-based versions and name this new version V_IMX8MP.

Update comments for the other versions and for relevant parameters
blocks to clearly indicate the size of grids and histogram for the
different versions.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v12:

- Update comments

New in v12:

- Split out from "media: rkisp1: Add match data for i.MX8MP ISP"
- Changed the version enum name
---
 include/uapi/linux/rkisp1-config.h | 50 ++++++++++++++++--------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 730673ecc63d..6eeaf8bf2362 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -175,16 +175,21 @@
 /**
  * enum rkisp1_cif_isp_version - ISP variants
  *
- * @RKISP1_V10: used at least in rk3288 and rk3399
- * @RKISP1_V11: declared in the original vendor code, but not used
- * @RKISP1_V12: used at least in rk3326 and px30
- * @RKISP1_V13: used at least in rk1808
+ * @RKISP1_V10: Used at least in RK3288 and RK3399.
+ * @RKISP1_V11: Declared in the original vendor code, but not used. Same number
+ *	of entries in grids and histogram as v10.
+ * @RKISP1_V12: Used at least in RK3326 and PX30.
+ * @RKISP1_V13: Used at least in RK1808. Same number of entries in grids and
+ *	histogram as v12.
+ * @RKISP1_V_IMX8MP: Used in at least i.MX8MP. Same number of entries in grids
+ *	and histogram as v10.
  */
 enum rkisp1_cif_isp_version {
 	RKISP1_V10 = 10,
 	RKISP1_V11,
 	RKISP1_V12,
 	RKISP1_V13,
+	RKISP1_V_IMX8MP,
 };
 
 enum rkisp1_cif_isp_histogram_mode {
@@ -584,10 +589,9 @@ enum rkisp1_cif_isp_goc_mode {
  * as is reported by the hw_revision field of the struct media_device_info
  * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
  *
- * Versions <= V11 have RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10
- * entries, versions >= V12 have RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12
- * entries. RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES is equal to the maximum
- * of the two.
+ * V10 has RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10 entries, V12 has
+ * RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12 entries.
+ * RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES is equal to the maximum of the two.
  */
 struct rkisp1_cif_isp_goc_config {
 	__u32 mode;
@@ -607,10 +611,10 @@ struct rkisp1_cif_isp_goc_config {
  * as is reported by the hw_revision field of the struct media_device_info
  * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
  *
- * Versions <= V11 have RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10
- * entries, versions >= V12 have RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12
- * entries. RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE is equal to the maximum
- * of the two.
+ * V10 has RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10 entries, V12 has
+ * RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12 entries.
+ * RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE is equal to the maximum of the
+ * two.
  */
 struct rkisp1_cif_isp_hst_config {
 	__u32 mode;
@@ -902,9 +906,9 @@ struct rkisp1_cif_isp_bls_meas_val {
  * as is reported by the hw_revision field of the struct media_device_info
  * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
  *
- * Versions <= V11 have RKISP1_CIF_ISP_AE_MEAN_MAX_V10 entries,
- * versions >= V12 have RKISP1_CIF_ISP_AE_MEAN_MAX_V12 entries.
- * RKISP1_CIF_ISP_AE_MEAN_MAX is equal to the maximum of the two.
+ * V10 has RKISP1_CIF_ISP_AE_MEAN_MAX_V10 entries, V12 has
+ * RKISP1_CIF_ISP_AE_MEAN_MAX_V12 entries. RKISP1_CIF_ISP_AE_MEAN_MAX is equal
+ * to the maximum of the two.
  *
  * Image is divided into 5x5 blocks on V10 and 9x9 blocks on V12.
  */
@@ -944,21 +948,21 @@ struct rkisp1_cif_isp_af_stat {
  *	       integer part.
  *
  * The window of the measurements area is divided to 5x5 sub-windows for
- * V10/V11 and to 9x9 sub-windows for V12. The histogram is then computed for
- * each sub-window independently and the final result is a weighted average of
- * the histogram measurements on all sub-windows. The window of the
- * measurements area and the weight of each sub-window are configurable using
+ * V10 and to 9x9 sub-windows for V12. The histogram is then computed for each
+ * sub-window independently and the final result is a weighted average of the
+ * histogram measurements on all sub-windows. The window of the measurements
+ * area and the weight of each sub-window are configurable using
  * struct @rkisp1_cif_isp_hst_config.
  *
- * The histogram contains 16 bins in V10/V11 and 32 bins in V12/V13.
+ * The histogram contains 16 bins in V10 and 32 bins in V12.
  *
  * The number of entries of @hist_bins depends on the hardware revision
  * as is reported by the hw_revision field of the struct media_device_info
  * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
  *
- * Versions <= V11 have RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10 entries,
- * versions >= V12 have RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12 entries.
- * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
+ * V10 has RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10 entries, V12 has
+ * RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12 entries. RKISP1_CIF_ISP_HIST_BIN_N_MAX is
+ * equal to the maximum of the two.
  */
 struct rkisp1_cif_isp_hist_stat {
 	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
-- 
Regards,

Laurent Pinchart


