Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE02285AE3
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgJGIqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:14 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57070 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728000AbgJGIqL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:11 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 581D5634CDF
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 063/106] ccs-pll: Document the structs in the header as well as the function
Date:   Wed,  7 Oct 2020 11:45:14 +0300
Message-Id: <20201007084557.25843-54-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CCS pll is used by the CCS driver at the moment, but documenting the
interface makes sense. It's non-trivial and the calculator could be used
elsewhere.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.h | 88 +++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 1d908b23c934..e01359f61476 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -20,6 +20,16 @@
 #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			(1 << 0)
 #define CCS_PLL_FLAG_NO_OP_CLOCKS				(1 << 1)
 
+/**
+ * struct ccs_pll_branch_fr - CCS PLL configuration (front)
+ *
+ * A single branch front-end of the CCS PLL tree.
+ *
+ * @pre_pll_clk_div: Pre-PLL clock divisor
+ * @pll_multiplier: PLL multiplier
+ * @pll_ip_freq_hz: PLL input clock frequency
+ * @pll_op_freq_hz: PLL output clock frequency
+ */
 struct ccs_pll_branch_fr {
 	uint16_t pre_pll_clk_div;
 	uint16_t pll_multiplier;
@@ -27,6 +37,16 @@ struct ccs_pll_branch_fr {
 	uint32_t pll_op_clk_freq_hz;
 };
 
+/**
+ * struct ccs_pll_branch_bk - CCS PLL configuration (back)
+ *
+ * A single branch back-end of the CCS PLL tree.
+ *
+ * @sys_clk_div: System clock divider
+ * @pix_clk_div: Pixel clock divider
+ * @sys_clk_freq_hz: System clock frequency
+ * @pix_clk_freq_hz: Pixel clock frequency
+ */
 struct ccs_pll_branch_bk {
 	uint16_t sys_clk_div;
 	uint16_t pix_clk_div;
@@ -34,6 +54,29 @@ struct ccs_pll_branch_bk {
 	uint32_t pix_clk_freq_hz;
 };
 
+/**
+ * struct ccs_pll - Full CCS PLL configuration
+ *
+ * All information required to calculate CCS PLL configuration.
+ *
+ * @bus_type: Type of the data bus, CCS_PLL_BUS_TYPE_* (input)
+ * @csi2.lanes: The number of the CSI-2 data lanes (input)
+ * @binning_vertical: Vertical binning factor (input)
+ * @binning_horizontal: Horizontal binning factor (input)
+ * @scale_m: Downscaling factor, M component, [16, max] (input)
+ * @scale_n: Downscaling factor, N component, typically 16 (input)
+ * @bits_per_pixel: Bits per pixel on the output data bus (input)
+ * @flags: CCS_PLL_FLAG_* (input)
+ * @link_freq: Chosen link frequency (input)
+ * @ext_clk_freq_hz: External clock frequency, i.e. the sensor's input clock
+ *		     (input)
+ * @vt_fr: Video timing front-end configuration (output)
+ * @vt_bk: Video timing back-end configuration (output)
+ * @op_bk: Operational timing back-end configuration (output)
+ * @pixel_rate_csi: Pixel rate on the output data bus (output)
+ * @pixel_rate_pixel_array: Nominal pixel rate in the sensor's pixel array
+ *			    (output)
+ */
 struct ccs_pll {
 	/* input values */
 	uint8_t bus_type;
@@ -58,6 +101,18 @@ struct ccs_pll {
 	uint32_t pixel_rate_pixel_array;
 };
 
+/**
+ * struct ccs_pll_branch_limits_fr - CCS PLL front-end limits
+ *
+ * @min_pre_pll_clk_div: Minimum pre-PLL clock divider
+ * @max_pre_pll_clk_div: Maximum pre-PLL clock divider
+ * @min_pll_ip_freq_hz: Minimum PLL input clock frequency
+ * @max_pll_ip_freq_hz: Maximum PLL input clock frequency
+ * @min_pll_multiplier: Minimum PLL multiplier
+ * @max_pll_multiplier: Maximum PLL multiplier
+ * @min_pll_op_freq_hz: Minimum PLL output clock frequency
+ * @max_pll_op_freq_hz: Maximum PLL output clock frequency
+ */
 struct ccs_pll_branch_limits_fr {
 	uint16_t min_pre_pll_clk_div;
 	uint16_t max_pre_pll_clk_div;
@@ -69,6 +124,18 @@ struct ccs_pll_branch_limits_fr {
 	uint32_t max_pll_op_clk_freq_hz;
 };
 
+/**
+ * struct ccs_pll_branch_limits_bk - CCS PLL back-end limits
+ *
+ * @min_sys_clk_div: Minimum system clock divider
+ * @max_sys_clk_div: Maximum system clock divider
+ * @min_sys_clk_freq_hz: Minimum system clock frequency
+ * @max_sys_clk_freq_hz: Maximum system clock frequency
+ * @min_pix_clk_div: Minimum pixel clock divider
+ * @max_pix_clk_div: Maximum pixel clock divider
+ * @min_pix_clk_freq_hz: Minimum pixel clock frequency
+ * @max_pix_clk_freq_hz: Maximum pixel clock frequency
+ */
 struct ccs_pll_branch_limits_bk {
 	uint16_t min_sys_clk_div;
 	uint16_t max_sys_clk_div;
@@ -80,6 +147,17 @@ struct ccs_pll_branch_limits_bk {
 	uint32_t max_pix_clk_freq_hz;
 };
 
+/**
+ * struct ccs_pll_limits - CCS PLL limits
+ *
+ * @min_ext_clk_freq_hz: Minimum external clock frequency
+ * @max_ext_clk_freq_hz: Maximum external clock frequency
+ * @vt_fr: Video timing front-end limits
+ * @vt_bk: Video timing back-end limits
+ * @op_bk: Operational timing back-end limits
+ * @min_line_length_pck_bin: Minimum line length in pixels, with binning
+ * @min_line_length_pck: Minimum line length in pixels without binning
+ */
 struct ccs_pll_limits {
 	/* Strict PLL limits */
 	uint32_t min_ext_clk_freq_hz;
@@ -96,6 +174,16 @@ struct ccs_pll_limits {
 
 struct device;
 
+/**
+ * ccs_pll_calculate - Calculate CCS PLL configuration based on input parameters
+ *
+ * @dev: Device pointer, used for printing messages
+ * @limits: Limits specific to the sensor
+ * @pll: Given PLL configuration
+ *
+ * Calculate the CCS PLL configuration based on the limits as well as given
+ * device specific, system specific or user configured input data.
+ */
 int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 		      struct ccs_pll *pll);
 
-- 
2.27.0

