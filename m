Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C512EE728
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 21:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbhAGUsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 15:48:14 -0500
Received: from vegas.theobroma-systems.com ([144.76.126.164]:36973 "EHLO
        mail.theobroma-systems.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727183AbhAGUsO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 15:48:14 -0500
X-Greylist: delayed 1410 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Jan 2021 15:48:13 EST
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]:38212 helo=diego.localnet)
        by mail.theobroma-systems.com with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <heiko.stuebner@theobroma-systems.com>)
        id 1kxbp8-0006oE-Iw; Thu, 07 Jan 2021 21:23:58 +0100
From:   Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kever.yang@rock-chips.com, Eddie Cai <eddie.cai@rock-chips.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org,
        christoph.muellner@theobroma-systems.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: rkisp in mainline (destaging) vs. rk3326/px30 uapi differences
Date:   Thu, 07 Jan 2021 21:23:56 +0100
Message-ID: <3342088.iIbC2pHGDl@diego>
Organization: Theobroma Systems
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

the rkisp driver in the mainline Linux kernel moved out of staging with
5.11-rc1, so the uapi will be fixed after 5.11 proper is released.

The rkisp driver currently only supports the rk3399 and while working
on porting the support for rk3326/px30 I noticed discrepancies.

Hence it would be somewhat urgent to clarify this, as later it will get
really cumbersome.

----

The rkisp on the px30 (v12) has some changes compared to the rk3399 (v10).
Some sub-blocks moved around or seem to have been replaced with newer
variants and the gist of changes can be seen in [0] with the important
part being the uapi changes [1] and those values also exist in mainline.


See functions in that patch:
- isp_goc_config_v12()
- rkisp1_stats_get_aec_meas_v12()
- rkisp1_stats_get_hst_meas_v12()

Looking at the code, the register locations are different, for gammas and
the histogram the actual amount of raw registers is the same, while the
"aec" seems to use 25 registers on V10 while 21 registers on V12. Though
their content gets split into multiple values in that v12 variant.


As somehow expected the whole thing is pretty undocumented and I
have no clue what these "bins" or "gammas" mean and why the amount of
entries now differs and how this relates to userspace at all.

Also looking through libcamera as the one open user of the driver,
the whole rkisp1_cif_isp_isp_other_cfg (containing the gamma config)
as well as the rkisp1_cif_isp_stat struct (for ae and histogram)
don't seem to be used so far.

Hence I also added some Rockchip people in the hope of getting
a bit of clarification ;-) .


Ideas on how to proceed?

Thanks
Heiko


[0] https://github.com/rockchip-linux/kernel/commit/2ff670508e8fdfefd67318e885effb8cee4a0f4c
[1]
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index b471f01a8459..fbeb6b5dba03 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -32,8 +32,8 @@
 #define CIFISP_CTK_COEFF_MAX            0x100
 #define CIFISP_CTK_OFFSET_MAX           0x800
 
-#define CIFISP_AE_MEAN_MAX              25
-#define CIFISP_HIST_BIN_N_MAX           16
+#define CIFISP_AE_MEAN_MAX              81
+#define CIFISP_HIST_BIN_N_MAX           32
 #define CIFISP_AFM_MAX_WINDOWS          3
 #define CIFISP_DEGAMMA_CURVE_SIZE       17
 
@@ -69,7 +69,7 @@
  * Gamma out
  */
 /* Maximum number of color samples supported */
-#define CIFISP_GAMMA_OUT_MAX_SAMPLES       17
+#define CIFISP_GAMMA_OUT_MAX_SAMPLES       34



