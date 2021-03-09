Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFFA332545
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 13:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCIMRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 07:17:45 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56389 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230395AbhCIMRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 07:17:15 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JbIUl7irhqY4WJbIXleHsh; Tue, 09 Mar 2021 13:17:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615292233; bh=oGY2hk7GKycUN0C/+zLdXcj2rAWwAElZP6to07kB1MY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CD7dcNiOgsVebOJuL9piK4FGSyksW7ccMCp/Bp4PZ/56kQSkwnaRDZNR/tdFAn0Xo
         UGrSH1lpMzJakSD2GCFDLpIct2LERnbHczAk7rdeUCh7xMecsTrbEaV1vT6WU+Pl63
         VS2IhcpNXe0JTx2dzWluNT2jtIOyWodgojf9Vs+vWk4cQn9DGWAd77lJPTqqGGId86
         522S2SxQgV8HfgKDTWyEMsNiQrxDguaAc3OZIN208k0OVPc26F2TxE+O886RSYPWFD
         mgEPDrRwkdkcFkWvladnNyI8qmVFD5Zv1U5OVKjgkqePSqQmC2CzVf7kV8HJ3Unlsl
         0RepfBQoLiGFg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/i2c: fix kerneldoc issues for media i2c headers
Message-ID: <20bf9c0a-292e-7d34-6a40-819fbd930bfa@xs4all.nl>
Date:   Tue, 9 Mar 2021 13:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG+UFAzH84aRPPd9q3StKM2fHjVQzmv8uFg26PMG79T2G6U5c1Zrl+C4flOay6SAkgcL68qDqZQXv0kyiGbNTsIKKLmVHidelbK2h7OLV5ElJklzqdsN
 3JWKHveXjqcI/zY2YJ416dcyMMaJr0ibBuzURBZsa2C6qp0N2xjdRj2A4rpokOb3qq89dUMuCKn5n+wEMdqALF/DgzoBwMUBAAk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes these kernel-doc warnings:

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI1A' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI1B' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI1C' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI2A' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI2B' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI2C' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI3A' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI3B' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI3C' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_CVBS_VI4A' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI2A_VI1A' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI2B_VI1B' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI2C_VI1C' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI2A_VI3A' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI2B_VI3B' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI2C_VI3C' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI4A_VI1A' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI4A_VI1B' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI4A_VI1C' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI4A_VI3A' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI4A_VI3B' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_SVIDEO_VI4A_VI3C' not described in enum 'tvp514x_input'

include/media/i2c/tvp514x.h:70: warning: Enum value 'INPUT_INVALID' not described in enum 'tvp514x_input'
include/media/i2c/tvp514x.h:82: warning: Enum value 'OUTPUT_10BIT_422_EMBEDDED_SYNC' not described in enum 'tvp514x_output'
include/media/i2c/tvp514x.h:82: warning: Enum value 'OUTPUT_20BIT_422_SEPERATE_SYNC' not described in enum 'tvp514x_output'
include/media/i2c/tvp514x.h:82: warning: Enum value 'OUTPUT_10BIT_422_SEPERATE_SYNC' not described in enum 'tvp514x_output'
include/media/i2c/tvp514x.h:82: warning: Enum value 'OUTPUT_INVALID' not described in enum 'tvp514x_output'
include/media/i2c/adv7343.h:38: warning: cannot understand function prototype: 'struct adv7343_power_mode '
include/media/i2c/s5k4ecgx.h:31: warning: expecting prototype for struct ss5k4ecgx_platform_data. Prototype was for struct
s5k4ecgx_platform_data instead
include/media/i2c/mt9t112.h:21: warning: cannot understand function prototype: 'struct mt9t112_platform_data '
include/media/i2c/noon010pc30.h:13: warning: Cannot understand  * @clk_rate: the clock frequency in Hz
include/media/i2c/s5k6aa.h:45: warning: Function parameter or member 'bus_type' not described in 's5k6aa_platform_data'
include/media/i2c/tw9910.h:19: warning: cannot understand function prototype: 'enum tw9910_mpout_pin '
include/media/i2c/tw9910.h:36: warning: cannot understand function prototype: 'struct tw9910_video_info '
include/media/i2c/ov772x.h:53: warning: cannot understand function prototype: 'struct ov772x_camera_info '
include/media/i2c/s5c73m3.h:53: warning: Function parameter or member 'bus_type' not described in 's5c73m3_platform_data'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Function parameter or member 'post_streamoff' not described in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Function parameter or member 'flags' not described in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-data.h:144: warning: expecting prototype for struct ccs_pdaf_pix_loc_block_desc. Prototype was for struct
ccs_pdaf_pix_loc_pixel_desc instead
drivers/media/i2c/tvp514x_regs.h:272: warning: Function parameter or member 'token' not described in 'tvp514x_reg'
drivers/media/i2c/tvp514x_regs.h:272: warning: Function parameter or member 'reg' not described in 'tvp514x_reg'
drivers/media/i2c/tvp514x_regs.h:272: warning: Function parameter or member 'val' not described in 'tvp514x_reg'
drivers/media/i2c/m5mols/m5mols.h:69: warning: Function parameter or member 'brightness' not described in 'm5mols_exif'
drivers/media/i2c/m5mols/m5mols.h:147: error: Cannot parse struct or union!
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_AIN0' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_AIN1' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_AIN2' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_AIN3' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_AIN4' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_AIN5' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_AIN6' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_AIN7' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_HDMI' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_TTL' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_TXA' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_TXB' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:65: warning: Enum value 'ADV748X_PORT_MAX' not described in enum 'adv748x_ports'
drivers/media/i2c/adv748x/adv748x.h:199: warning: Function parameter or member 'i2c_clients' not described in 'adv748x_state'
drivers/media/i2c/adv748x/adv748x.h:199: warning: Function parameter or member 'regmap' not described in 'adv748x_state'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 56256c1e8b0d..31bac06d46b5 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -42,8 +42,8 @@ enum adv748x_page {
 	ADV748X_PAGE_EOR,		/* End Mark */
 };

-/**
- * enum adv748x_ports - Device tree port number definitions
+/*
+ * Device tree port number definitions
  *
  * The ADV748X ports define the mapping between subdevices
  * and the device tree specification
@@ -173,9 +173,9 @@ struct adv748x_afe {
  *
  * @endpoints:		parsed device node endpoints for each port
  *
- * @i2c_addresses	I2C Page addresses
- * @i2c_clients		I2C clients for the page accesses
- * @regmap		regmap configuration pages.
+ * @i2c_addresses:	I2C Page addresses
+ * @i2c_clients:	I2C clients for the page accesses
+ * @regmap:		regmap configuration pages.
  *
  * @hdmi:		state of HDMI receiver context
  * @afe:		state of AFE receiver context
diff --git a/drivers/media/i2c/m5mols/m5mols.h b/drivers/media/i2c/m5mols/m5mols.h
index 4023906d273d..60c102fa7df5 100644
--- a/drivers/media/i2c/m5mols/m5mols.h
+++ b/drivers/media/i2c/m5mols/m5mols.h
@@ -50,6 +50,7 @@ struct m5mols_resolution {
  * @exposure_time: exposure time register value
  * @shutter_speed: speed of the shutter register value
  * @aperture: aperture register value
+ * @brightness: brightness register value
  * @exposure_bias: it calls also EV bias
  * @iso_speed: ISO register value
  * @flash: status register value of the flash
@@ -126,6 +127,8 @@ struct m5mols_scenemode {
 	u8 wdr;
 };

+#define VERSION_STRING_SIZE	22
+
 /**
  * struct m5mols_version - firmware version information
  * @customer:	customer information
@@ -144,7 +147,6 @@ struct m5mols_scenemode {
  * about manufacturer and the vendor of the sensor's packaging. The least
  * significant 2 bytes of the string indicate packaging manufacturer.
  */
-#define VERSION_STRING_SIZE	22
 struct m5mols_version {
 	u8	customer;
 	u8	project;
diff --git a/drivers/media/i2c/tvp514x_regs.h b/drivers/media/i2c/tvp514x_regs.h
index cc236c968f67..b452725d5cfb 100644
--- a/drivers/media/i2c/tvp514x_regs.h
+++ b/drivers/media/i2c/tvp514x_regs.h
@@ -261,9 +261,9 @@
 #define TOK_SKIP                        (3)     /* token to skip a register */
 /**
  * struct tvp514x_reg - Structure for TVP5146/47 register initialization values
- * @token - Token: TOK_WRITE, TOK_TERM etc..
- * @reg - Register offset
- * @val - Register Value for TOK_WRITE or delay in ms for TOK_DELAY
+ * @token: Token: TOK_WRITE, TOK_TERM etc..
+ * @reg: Register offset
+ * @val: Register Value for TOK_WRITE or delay in ms for TOK_DELAY
  */
 struct tvp514x_reg {
 	u8 token;
diff --git a/include/media/i2c/adv7343.h b/include/media/i2c/adv7343.h
index e4142b1ef8cd..b8937035c5d3 100644
--- a/include/media/i2c/adv7343.h
+++ b/include/media/i2c/adv7343.h
@@ -21,7 +21,7 @@
 #define ADV7343_SVIDEO_ID	(2)

 /**
- * adv7343_power_mode - power mode configuration.
+ * struct adv7343_power_mode - power mode configuration.
  * @sleep_mode: on enable the current consumption is reduced to micro ampere
  *		level. All DACs and the internal PLL circuit are disabled.
  *		Registers can be read from and written in sleep mode.
diff --git a/include/media/i2c/mt9t112.h b/include/media/i2c/mt9t112.h
index cc80d5cc2104..e678b6ae8e2f 100644
--- a/include/media/i2c/mt9t112.h
+++ b/include/media/i2c/mt9t112.h
@@ -14,7 +14,7 @@ struct mt9t112_pll_divider {
 };

 /**
- * mt9t112_platform_data -	mt9t112 driver interface
+ * struct mt9t112_platform_data - mt9t112 driver interface
  * @flags:			Sensor media bus configuration.
  * @divider:			Sensor PLL configuration
  */
diff --git a/include/media/i2c/noon010pc30.h b/include/media/i2c/noon010pc30.h
index a035d2d9a564..d1b2e06a1de0 100644
--- a/include/media/i2c/noon010pc30.h
+++ b/include/media/i2c/noon010pc30.h
@@ -10,6 +10,7 @@
 #define NOON010PC30_H

 /**
+ * struct noon010pc30_platform_data - platform data
  * @clk_rate: the clock frequency in Hz
  * @gpio_nreset: GPIO driving nRESET pin
  * @gpio_nstby: GPIO driving nSTBY pin
diff --git a/include/media/i2c/ov772x.h b/include/media/i2c/ov772x.h
index a1702d420087..26f363ea4001 100644
--- a/include/media/i2c/ov772x.h
+++ b/include/media/i2c/ov772x.h
@@ -46,7 +46,7 @@ struct ov772x_edge_ctrl {
 }

 /**
- * ov772x_camera_info -	ov772x driver interface structure
+ * struct ov772x_camera_info -	ov772x driver interface structure
  * @flags:		Sensor configuration flags
  * @edgectrl:		Sensor edge control
  */
diff --git a/include/media/i2c/s5c73m3.h b/include/media/i2c/s5c73m3.h
index ccb9e5448762..a51f1025ba1c 100644
--- a/include/media/i2c/s5c73m3.h
+++ b/include/media/i2c/s5c73m3.h
@@ -35,6 +35,7 @@ struct s5c73m3_gpio {
  * @mclk_frequency: sensor's master clock frequency in Hz
  * @gpio_reset:  GPIO driving RESET pin
  * @gpio_stby:   GPIO driving STBY pin
+ * @bus_type:    bus type
  * @nlanes:      maximum number of MIPI-CSI lanes used
  * @horiz_flip:  default horizontal image flip value, non zero to enable
  * @vert_flip:   default vertical image flip value, non zero to enable
diff --git a/include/media/i2c/s5k4ecgx.h b/include/media/i2c/s5k4ecgx.h
index fccb7be8ed8f..92202eb35249 100644
--- a/include/media/i2c/s5k4ecgx.h
+++ b/include/media/i2c/s5k4ecgx.h
@@ -11,7 +11,7 @@

 /**
  * struct s5k4ecgx_gpio - data structure describing a GPIO
- * @gpio : GPIO number
+ * @gpio: GPIO number
  * @level: indicates active state of the @gpio
  */
 struct s5k4ecgx_gpio {
@@ -20,9 +20,9 @@ struct s5k4ecgx_gpio {
 };

 /**
- * struct ss5k4ecgx_platform_data- s5k4ecgx driver platform data
+ * struct s5k4ecgx_platform_data - s5k4ecgx driver platform data
  * @gpio_reset:	 GPIO driving RESET pin
- * @gpio_stby :	 GPIO driving STBY pin
+ * @gpio_stby:	 GPIO driving STBY pin
  */

 struct s5k4ecgx_platform_data {
diff --git a/include/media/i2c/s5k6aa.h b/include/media/i2c/s5k6aa.h
index fd78e85e8b78..eb3444d8b731 100644
--- a/include/media/i2c/s5k6aa.h
+++ b/include/media/i2c/s5k6aa.h
@@ -28,6 +28,7 @@ struct s5k6aa_gpio {
  * @mclk_frequency: sensor's master clock frequency in Hz
  * @gpio_reset:  GPIO driving RESET pin
  * @gpio_stby:   GPIO driving STBY pin
+ * @bus_type:    bus type
  * @nlanes:      maximum number of MIPI-CSI lanes used
  * @horiz_flip:  default horizontal image flip value, non zero to enable
  * @vert_flip:   default vertical image flip value, non zero to enable
diff --git a/include/media/i2c/tvp514x.h b/include/media/i2c/tvp514x.h
index 0c1bb04bdbcb..837efff0a6a0 100644
--- a/include/media/i2c/tvp514x.h
+++ b/include/media/i2c/tvp514x.h
@@ -29,10 +29,7 @@
 #define PAL_NUM_ACTIVE_PIXELS		(720)
 #define PAL_NUM_ACTIVE_LINES		(576)

-/**
- * enum tvp514x_input - enum for different decoder input pin
- *		configuration.
- */
+/* enum for different decoder input pin configuration */
 enum tvp514x_input {
 	/*
 	 * CVBS input selection
@@ -69,11 +66,7 @@ enum tvp514x_input {
 	INPUT_INVALID
 };

-/**
- * enum tvp514x_output - enum for output format
- *			supported.
- *
- */
+/* enum for output format supported. */
 enum tvp514x_output {
 	OUTPUT_10BIT_422_EMBEDDED_SYNC = 0,
 	OUTPUT_20BIT_422_SEPERATE_SYNC,
diff --git a/include/media/i2c/tw9910.h b/include/media/i2c/tw9910.h
index 92d31bd1afe6..77da94f909e3 100644
--- a/include/media/i2c/tw9910.h
+++ b/include/media/i2c/tw9910.h
@@ -13,9 +13,7 @@
 #ifndef __TW9910_H__
 #define __TW9910_H__

-/**
- * tw9910_mpout_pin - MPOUT (multi-purpose output) pin functions
- */
+/* MPOUT (multi-purpose output) pin functions */
 enum tw9910_mpout_pin {
 	TW9910_MPO_VLOSS,
 	TW9910_MPO_HLOCK,
@@ -28,10 +26,10 @@ enum tw9910_mpout_pin {
 };

 /**
- * tw9910_video_info -	tw9910 driver interface structure
+ * struct tw9910_video_info - tw9910 driver interface structure
  * @buswidth:		Parallel data bus width (8 or 16).
  * @mpout:		Selected function of MPOUT (multi-purpose output) pin.
- *			See &enum tw9910_mpout_pin
+ *			See enum tw9910_mpout_pin
  */
 struct tw9910_video_info {
 	unsigned long		buswidth;
