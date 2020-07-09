Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB78F219F9C
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 14:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGIMHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 08:07:07 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:39074 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgGIMHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 08:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1594296427; x=1625832427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nMXHAEiiHgSyP1gAXee7wbBvM3umUxrAW5Djn1qOTmo=;
  b=GgK/XsGdI1/7t3zP/qfWhtUm2FkC5yAMbFz256hdw7X0aNR/j5c80EPs
   J2Jy+ktfPvWggWqI5FrludWs2lBF5bkC7JUCN0mBwx1W7+aQcfXjW09KM
   jgAubtDjhRIiwfbMiFvTlhiGUexUXzhxMvgLqnzoKTCHfbunhkkyRnjQR
   ejMzDbXX3iojuIi/nG3MkezKTylqp/2k/iRcBxuxKTkV84Mm5GNro7agk
   XRgj3g9+/0PsGtBMjXzT7/LkivuoJdhEAy1J9H/B36EXPyjfVwRfVCs+s
   ho50cR5irH1nZXFN+3dSM0iwtB5OKoBKG6/HYvo6sNoKGN6kd/QOuZZu9
   A==;
IronPort-SDR: zOtJlZVehELzb7drAJcSub/6wfazWuco71VPtOB6UqKCuDwSTngRPcK3kGJkBPd29TFe9J2Wj5
 8cb7/lR3JQX0ENT3SoKBHN1pVbETiBIVgiq3bJs3Tp6A702sVsgEPlKhZu4zDF2XEFMIFXtMri
 VzQWFxtbrzNYniYzkYAOiVfk2rLwbi3tsI7cG+vULvYKUbyNnDngZQ7N+FEc3RrtbuDzqNkyLT
 nrZer/5P84mvb2AL1Ia7wnLrxre37e3rs/mgSAcFolPNlFSTob9USX2Fs+/RGlTK+f3nmJJ4Jd
 6lg=
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; 
   d="scan'208";a="82409225"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2020 05:07:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 9 Jul 2020 05:07:05 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 9 Jul 2020 05:06:38 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: atmel: atmel-isc: rework component offsets
Date:   Thu, 9 Jul 2020 15:06:45 +0300
Message-ID: <20200709120645.104796-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The component offsets were computed in a negative way: they were
subtracted from the actual color component value.
So, a higher offset was reducing the component value.
This is not really desirable, as the offset is a 2's complements
number with 1 bit for sign and 12 value bits, so we would like to be able
to also add to the component, not only subtract.
The reported number in v4l2 is fine, a range from -4095 to +4095.
However when configuring a negative value for the offset, this would in fact
not function, because with the old code, the number was subtracted from the
max value. By setting something negative, it was overflowing in fact.
Reworked the component offsets by placing the real value as the v4l2 ctrls.

Now, the values are the real number that is added or subtracted from
the component.
The negative values received from v4l2 are already in 2's complements, so
there is no need for conversion.
This actually simplifies a lot the computation procedure, eliminating the
need for the macros that convert from v4l2 values to ISC values and
viceversa.
Also the ZERO_VAL is eliminated, as 0 is now 0, as it's supposed to be.

Example after this change:

 # v4l2-ctl --set-ctrl=red_component_offset=-150 -L

User Controls

                     brightness 0x00980900 (int)    : min=-1024 max=1023 step=1 default=0 value=0 flags=slider
                       contrast 0x00980901 (int)    : min=-2048 max=2047 step=1 default=16 value=20 flags=slider
        white_balance_automatic 0x0098090c (bool)   : default=1 value=0 flags=update
               do_white_balance 0x0098090d (button) : flags=inactive, write-only, execute-on-write
                          gamma 0x00980910 (int)    : min=0 max=3 step=1 default=3 value=3 flags=slider
             red_component_gain 0x009819c0 (int)    : min=0 max=8191 step=1 default=512 value=512 flags=slider
            blue_component_gain 0x009819c1 (int)    : min=0 max=8191 step=1 default=512 value=512 flags=slider
       green_red_component_gain 0x009819c2 (int)    : min=0 max=8191 step=1 default=512 value=512 flags=slider
      green_blue_component_gain 0x009819c3 (int)    : min=0 max=8191 step=1 default=512 value=512 flags=slider
           red_component_offset 0x009819c4 (int)    : min=-4095 max=4095 step=1 default=0 value=-150 flags=slider
          blue_component_offset 0x009819c5 (int)    : min=-4095 max=4095 step=1 default=0 value=0 flags=slider
     green_red_component_offset 0x009819c6 (int)    : min=-4095 max=4095 step=1 default=0 value=0 flags=slider
    green_blue_component_offset 0x009819c7 (int)    : min=-4095 max=4095 step=1 default=0 value=0 flags=slider

The auto white balance algorithm is unchanged, but the obtained value to
'subtract' is now converted to negative and saved as a v4l2 control and
displayed properly.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 60 ++++++++-----------
 drivers/media/platform/atmel/atmel-isc-regs.h |  2 -
 drivers/media/platform/atmel/atmel-isc.h      |  2 +-
 3 files changed, 25 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index a6e9797a0ec9..fe3ec8d0eaee 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -225,9 +225,6 @@ const u32 isc_gamma_table[GAMMA_MAX + 1][GAMMA_ENTRIES] = {
 	(((mbus_code) == MEDIA_BUS_FMT_Y10_1X10) | \
 	(((mbus_code) == MEDIA_BUS_FMT_Y8_1X8)))
 
-#define ISC_CTRL_ISC_TO_V4L2(x) ((x) == ISC_WB_O_ZERO_VAL ? 0 : (x))
-#define ISC_CTRL_V4L2_TO_ISC(x) ((x) ? (x) : ISC_WB_O_ZERO_VAL)
-
 static inline void isc_update_v4l2_ctrls(struct isc_device *isc)
 {
 	struct isc_ctrls *ctrls = &isc->ctrls;
@@ -238,14 +235,10 @@ static inline void isc_update_v4l2_ctrls(struct isc_device *isc)
 	v4l2_ctrl_s_ctrl(isc->gr_gain_ctrl, ctrls->gain[ISC_HIS_CFG_MODE_GR]);
 	v4l2_ctrl_s_ctrl(isc->gb_gain_ctrl, ctrls->gain[ISC_HIS_CFG_MODE_GB]);
 
-	v4l2_ctrl_s_ctrl(isc->r_off_ctrl,
-			 ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_R]));
-	v4l2_ctrl_s_ctrl(isc->b_off_ctrl,
-			 ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_B]));
-	v4l2_ctrl_s_ctrl(isc->gr_off_ctrl,
-			 ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_GR]));
-	v4l2_ctrl_s_ctrl(isc->gb_off_ctrl,
-			 ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_GB]));
+	v4l2_ctrl_s_ctrl(isc->r_off_ctrl, ctrls->offset[ISC_HIS_CFG_MODE_R]);
+	v4l2_ctrl_s_ctrl(isc->b_off_ctrl, ctrls->offset[ISC_HIS_CFG_MODE_B]);
+	v4l2_ctrl_s_ctrl(isc->gr_off_ctrl, ctrls->offset[ISC_HIS_CFG_MODE_GR]);
+	v4l2_ctrl_s_ctrl(isc->gb_off_ctrl, ctrls->offset[ISC_HIS_CFG_MODE_GB]);
 }
 
 static inline void isc_update_awb_ctrls(struct isc_device *isc)
@@ -255,11 +248,11 @@ static inline void isc_update_awb_ctrls(struct isc_device *isc)
 	/* In here we set our actual hw pipeline config */
 
 	regmap_write(isc->regmap, ISC_WB_O_RGR,
-		     (ISC_WB_O_ZERO_VAL - (ctrls->offset[ISC_HIS_CFG_MODE_R])) |
-		     ((ISC_WB_O_ZERO_VAL - ctrls->offset[ISC_HIS_CFG_MODE_GR]) << 16));
+		     ((ctrls->offset[ISC_HIS_CFG_MODE_R])) |
+		     ((ctrls->offset[ISC_HIS_CFG_MODE_GR]) << 16));
 	regmap_write(isc->regmap, ISC_WB_O_BGB,
-		     (ISC_WB_O_ZERO_VAL - (ctrls->offset[ISC_HIS_CFG_MODE_B])) |
-		     ((ISC_WB_O_ZERO_VAL - ctrls->offset[ISC_HIS_CFG_MODE_GB]) << 16));
+		     ((ctrls->offset[ISC_HIS_CFG_MODE_B])) |
+		     ((ctrls->offset[ISC_HIS_CFG_MODE_GB]) << 16));
 	regmap_write(isc->regmap, ISC_WB_G_RGR,
 		     ctrls->gain[ISC_HIS_CFG_MODE_R] |
 		     (ctrls->gain[ISC_HIS_CFG_MODE_GR] << 16));
@@ -275,12 +268,8 @@ static inline void isc_reset_awb_ctrls(struct isc_device *isc)
 	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
 		/* gains have a fixed point at 9 decimals */
 		isc->ctrls.gain[c] = 1 << 9;
-		/* offsets are in 2's complements, the value
-		 * will be substracted from ISC_WB_O_ZERO_VAL to obtain
-		 * 2's complement of a value between 0 and
-		 * ISC_WB_O_ZERO_VAL >> 1
-		 */
-		isc->ctrls.offset[c] = ISC_WB_O_ZERO_VAL;
+		/* offsets are in 2's complements */
+		isc->ctrls.offset[c] = 0;
 	}
 }
 
@@ -1774,9 +1763,12 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		 */
 		ctrls->offset[c] = (offset[c] - 1) << 3;
 
-		/* the offset is then taken and converted to 2's complements */
-		if (!ctrls->offset[c])
-			ctrls->offset[c] = ISC_WB_O_ZERO_VAL;
+		/*
+		 * the offset is then taken and converted to 2's complements,
+		 * and must be negative, as we subtract this value from the
+		 * color components
+		 */
+		ctrls->offset[c] = -ctrls->offset[c];
 
 		/*
 		 * the stretch gain is the total number of histogram bins
@@ -1938,17 +1930,13 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 			ctrls->gain[ISC_HIS_CFG_MODE_GB] = isc->gb_gain_ctrl->val;
 
 		if (ctrl->cluster[ISC_CTRL_R_OFF]->is_new)
-			ctrls->offset[ISC_HIS_CFG_MODE_R] =
-				ISC_CTRL_V4L2_TO_ISC(isc->r_off_ctrl->val);
+			ctrls->offset[ISC_HIS_CFG_MODE_R] = isc->r_off_ctrl->val;
 		if (ctrl->cluster[ISC_CTRL_B_OFF]->is_new)
-			ctrls->offset[ISC_HIS_CFG_MODE_B] =
-				ISC_CTRL_V4L2_TO_ISC(isc->b_off_ctrl->val);
+			ctrls->offset[ISC_HIS_CFG_MODE_B] = isc->b_off_ctrl->val;
 		if (ctrl->cluster[ISC_CTRL_GR_OFF]->is_new)
-			ctrls->offset[ISC_HIS_CFG_MODE_GR] =
-				ISC_CTRL_V4L2_TO_ISC(isc->gr_off_ctrl->val);
+			ctrls->offset[ISC_HIS_CFG_MODE_GR] = isc->gr_off_ctrl->val;
 		if (ctrl->cluster[ISC_CTRL_GB_OFF]->is_new)
-			ctrls->offset[ISC_HIS_CFG_MODE_GB] =
-				ISC_CTRL_V4L2_TO_ISC(isc->gb_off_ctrl->val);
+			ctrls->offset[ISC_HIS_CFG_MODE_GB] = isc->gb_off_ctrl->val;
 
 		isc_update_awb_ctrls(isc);
 
@@ -2010,13 +1998,13 @@ static int isc_g_volatile_awb_ctrl(struct v4l2_ctrl *ctrl)
 					ctrls->gain[ISC_HIS_CFG_MODE_GB];
 
 		ctrl->cluster[ISC_CTRL_R_OFF]->val =
-			ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_R]);
+			ctrls->offset[ISC_HIS_CFG_MODE_R];
 		ctrl->cluster[ISC_CTRL_B_OFF]->val =
-			ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_B]);
+			ctrls->offset[ISC_HIS_CFG_MODE_B];
 		ctrl->cluster[ISC_CTRL_GR_OFF]->val =
-			ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_GR]);
+			ctrls->offset[ISC_HIS_CFG_MODE_GR];
 		ctrl->cluster[ISC_CTRL_GB_OFF]->val =
-			ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_GB]);
+			ctrls->offset[ISC_HIS_CFG_MODE_GB];
 		break;
 	}
 	return 0;
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index c1283fb21bf6..f1e160ed4351 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -108,8 +108,6 @@
 /* ISC White Balance Gain for B, GB Register */
 #define ISC_WB_G_BGB	0x0000006c
 
-#define ISC_WB_O_ZERO_VAL	(1 << 13)
-
 /* ISC Color Filter Array Control Register */
 #define ISC_CFA_CTRL    0x00000070
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index fc56a745c7d1..24b784b893d6 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -133,7 +133,7 @@ struct isc_ctrls {
 
 	/* one for each component : GR, R, GB, B */
 	u32 gain[HIST_BAYER];
-	u32 offset[HIST_BAYER];
+	s32 offset[HIST_BAYER];
 
 	u32 hist_entry[HIST_ENTRIES];
 	u32 hist_count[HIST_BAYER];
-- 
2.25.1

