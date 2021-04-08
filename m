Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AF8358048
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 12:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhDHKHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 06:07:53 -0400
Received: from m12-17.163.com ([220.181.12.17]:56796 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229686AbhDHKHw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 06:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=M2OaCHzUbcKFMpkgmL
        SJXouxVjaz/v0tIBcQHByDqNg=; b=LEeDEEcalCLDX+Dz9m8cvZJJl8GxpPx9Ja
        P8wxvlBzQK2hG4/SVSOI1q+29rmeMLxlNXQWxIE16WSUxCUm8rh7bDostyUWYbsI
        5G7nqbDefQStTgAk9FY/zAgIYsToO4c2q9/aWeeMj5ijvOSeekOFGVKtmGFhSjJl
        kH9anTkVc=
Received: from wengjianfeng.ccdomain.com (unknown [218.17.89.92])
        by smtp13 (Coremail) with SMTP id EcCowACXnpbm1W5gaTYSuQ--.57298S2;
        Thu, 08 Apr 2021 18:07:36 +0800 (CST)
From:   samirweng1979 <samirweng1979@163.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        wengjianfeng <wengjianfeng@yulong.com>
Subject: [PATCH] media: dvb-frontends: remove redundant words and fix several typos
Date:   Thu,  8 Apr 2021 18:07:31 +0800
Message-Id: <20210408100731.31168-1-samirweng1979@163.com>
X-Mailer: git-send-email 2.15.0.windows.1
X-CM-TRANSID: EcCowACXnpbm1W5gaTYSuQ--.57298S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFyfJryfCF1DZF4rtr1DZFb_yoW7WF4rpF
        Z7J3s3Kr4UJa4q93WUtrW8Wr909ws5Aryakr18Cw10qw1jvry7XF1jk34qyrW5WFZak34a
        qa4jkrWDWw409FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bjCztUUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: pvdpx25zhqwiqzxzqiywtou0bp/xtbBLAhusV++LHlBKQAAsn
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: wengjianfeng <wengjianfeng@yulong.com>

change 'purpous' to 'purpose'.
change 'frequecy' to 'frequency'.
remove redundant words struct and enum.

Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.h | 35 +++++++++++++++--------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.h b/drivers/media/dvb-frontends/drx39xyj/drxj.h
index d62412f..232b3b0 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.h
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.h
@@ -75,9 +75,9 @@
 		u16 result_len;
 			/*< result length in byte */
 		u16 *parameter;
-			/*< General purpous param */
+			/*< General purpose param */
 		u16 *result;
-			/*< General purpous param */};
+			/*< General purpose param */};
 
 /*============================================================================*/
 /*============================================================================*/
@@ -131,7 +131,7 @@
 		DRXJ_CFG_MAX	/* dummy, never to be used */};
 
 /*
-* /struct enum drxj_cfg_smart_ant_io * smart antenna i/o.
+* /enum drxj_cfg_smart_ant_io * smart antenna i/o.
 */
 enum drxj_cfg_smart_ant_io {
 	DRXJ_SMT_ANT_OUTPUT = 0,
@@ -139,7 +139,7 @@ enum drxj_cfg_smart_ant_io {
 };
 
 /*
-* /struct struct drxj_cfg_smart_ant * Set smart antenna.
+* /struct drxj_cfg_smart_ant * Set smart antenna.
 */
 	struct drxj_cfg_smart_ant {
 		enum drxj_cfg_smart_ant_io io;
@@ -159,7 +159,7 @@ struct drxj_agc_status {
 /* DRXJ_CFG_AGC_RF, DRXJ_CFG_AGC_IF */
 
 /*
-* /struct enum drxj_agc_ctrl_mode * Available AGCs modes in the DRXJ.
+* /enum drxj_agc_ctrl_mode * Available AGCs modes in the DRXJ.
 */
 	enum drxj_agc_ctrl_mode {
 		DRX_AGC_CTRL_AUTO = 0,
@@ -167,7 +167,7 @@ struct drxj_agc_status {
 		DRX_AGC_CTRL_OFF};
 
 /*
-* /struct struct drxj_cfg_agc * Generic interface for all AGCs present on the DRXJ.
+* /struct drxj_cfg_agc * Generic interface for all AGCs present on the DRXJ.
 */
 	struct drxj_cfg_agc {
 		enum drx_standard standard;	/* standard for which these settings apply */
@@ -183,7 +183,7 @@ struct drxj_agc_status {
 /* DRXJ_CFG_PRE_SAW */
 
 /*
-* /struct struct drxj_cfg_pre_saw * Interface to configure pre SAW sense.
+* /struct drxj_cfg_pre_saw * Interface to configure pre SAW sense.
 */
 	struct drxj_cfg_pre_saw {
 		enum drx_standard standard;	/* standard to which these settings apply */
@@ -193,7 +193,7 @@ struct drxj_agc_status {
 /* DRXJ_CFG_AFE_GAIN */
 
 /*
-* /struct struct drxj_cfg_afe_gain * Interface to configure gain of AFE (LNA + PGA).
+* /struct drxj_cfg_afe_gain * Interface to configure gain of AFE (LNA + PGA).
 */
 	struct drxj_cfg_afe_gain {
 		enum drx_standard standard;	/* standard to which these settings apply */
@@ -220,14 +220,14 @@ struct drxj_agc_status {
 	};
 
 /*
-* /struct struct drxj_cfg_vsb_misc * symbol error rate
+* /struct drxj_cfg_vsb_misc * symbol error rate
 */
 	struct drxj_cfg_vsb_misc {
 		u32 symb_error;
 			      /*< symbol error rate sps */};
 
 /*
-* /enum enum drxj_mpeg_output_clock_rate * Mpeg output clock rate.
+* /enum drxj_mpeg_output_clock_rate * Mpeg output clock rate.
 *
 */
 	enum drxj_mpeg_start_width {
@@ -235,7 +235,7 @@ struct drxj_agc_status {
 		DRXJ_MPEG_START_WIDTH_8CLKCYC};
 
 /*
-* /enum enum drxj_mpeg_output_clock_rate * Mpeg output clock rate.
+* /enum drxj_mpeg_output_clock_rate * Mpeg output clock rate.
 *
 */
 	enum drxj_mpeg_output_clock_rate {
@@ -261,7 +261,7 @@ struct drxj_agc_status {
 		enum drxj_mpeg_start_width mpeg_start_width;  /*< set MPEG output start width */};
 
 /*
-* /enum enum drxj_xtal_freq * Supported external crystal reference frequency.
+* /enum drxj_xtal_freq * Supported external crystal reference frequency.
 */
 	enum drxj_xtal_freq {
 		DRXJ_XTAL_FREQ_RSVD,
@@ -270,14 +270,15 @@ struct drxj_agc_status {
 		DRXJ_XTAL_FREQ_4MHZ};
 
 /*
-* /enum enum drxj_xtal_freq * Supported external crystal reference frequency.
+* /enum drxj_xtal_freq * Supported external crystal reference frequency.
 */
 	enum drxji2c_speed {
 		DRXJ_I2C_SPEED_400KBPS,
 		DRXJ_I2C_SPEED_100KBPS};
 
 /*
-* /struct struct drxj_cfg_hw_cfg * Get hw configuration, such as crystal reference frequency, I2C speed, etc...
+* /struct drxj_cfg_hw_cfg * Get hw configuration, such as crystal
+*  reference frequency, I2C speed, etc...
 */
 	struct drxj_cfg_hw_cfg {
 		enum drxj_xtal_freq xtal_freq;
@@ -364,7 +365,7 @@ struct drxj_cfg_oob_misc {
 		DRXJ_SIF_ATTENUATION_9DB};
 
 /*
-* /struct struct drxj_cfg_atv_output * SIF attenuation setting.
+* /struct drxj_cfg_atv_output * SIF attenuation setting.
 *
 */
 struct drxj_cfg_atv_output {
@@ -453,10 +454,10 @@ struct drxj_cfg_atv_output {
 		enum drxuio_mode uio_gpio_mode; /*< current mode of ASEL pin                         */
 		enum drxuio_mode uio_irqn_mode; /*< current mode of IRQN pin                         */
 
-		/* IQM fs frequecy shift and inversion */
+		/* IQM fs frequency shift and inversion */
 		u32 iqm_fs_rate_ofs;	   /*< frequency shifter setting after setchannel      */
 		bool pos_image;	   /*< True: positive image                            */
-		/* IQM RC frequecy shift */
+		/* IQM RC frequency shift */
 		u32 iqm_rc_rate_ofs;	   /*< frequency shifter setting after setchannel      */
 
 		/* ATV configuration */
-- 
1.9.1


