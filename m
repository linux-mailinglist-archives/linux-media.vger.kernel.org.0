Return-Path: <linux-media+bounces-5379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF4B859895
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 19:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E91F1F218E7
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 18:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE00E6D1AB;
	Sun, 18 Feb 2024 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HEpioFX0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F6B1E87F
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708281324; cv=none; b=gPohfoGpvYGrqSU+Sno0GmLSwsrR1tKAo0PESfRLA3DfcAVE6gM4zVMzEK/q3g3NcJWwMEEohtEdiE/Wb2YHuikLL7ABcsAcB/D7S+iGut6B6BpWuIzwqPTExqXA1FS3ZV9uuu9Q0dRe0XZ1Qs0ihwdjAWISQEd9O4JHBAUDa5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708281324; c=relaxed/simple;
	bh=YHyNaXjNM+g1IKfOc8sEiyDiAsxr6dycx6h9AnJ3ZDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecylaZJL+47gRr7GOwfsC0ZyDcTdevqnu0SwC6i72qVpFVNLOUQ0tHlHZjYK72eiQM8DGD+m8t6I+j6I6or3OyypeyYe+6rw05OyC26uou2LAr9UvKUdS4mDm+SyQDZ7jiNDh0COOUwIw36+XlzqnBeCK7ormSb2/nYDOgWzhIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HEpioFX0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADD26480;
	Sun, 18 Feb 2024 19:35:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708281314;
	bh=YHyNaXjNM+g1IKfOc8sEiyDiAsxr6dycx6h9AnJ3ZDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HEpioFX0bmYvQeDmw8VIeOwCrEBn4wV/MIgwgyzGowpJIyQsTqJ5maTmP+MBQ5kfM
	 uppGvpZKs9Nl03mc2OSRRvjhPzKJsGO8oJB5w91j1zR/O1z7by/6AuHvCi3rS6aPIk
	 6IAg1F2oDUJTfTvsH6O8KpixGrUSoLuRuVd74ICU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	aford173@gmail.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>
Subject: [PATCH v12.1 06/12] media: rkisp1: Add version enum for i.MX8MP ISP
Date: Sun, 18 Feb 2024 20:35:22 +0200
Message-ID: <20240218183522.23392-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216095458.2919694-7-paul.elder@ideasonboard.com>
References: <20240216095458.2919694-7-paul.elder@ideasonboard.com>
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


