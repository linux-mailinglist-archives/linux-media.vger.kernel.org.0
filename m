Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC35D2EF12C
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 12:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbhAHLS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 06:18:28 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50480 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbhAHLS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 06:18:28 -0500
Received: from [IPv6:2003:c7:cf1c:ce00:d1bc:7258:fc49:a047] (p200300c7cf1cce00d1bc7258fc49a047.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:d1bc:7258:fc49:a047])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4EB0B1F4697D;
        Fri,  8 Jan 2021 11:17:46 +0000 (GMT)
Subject: Re: rkisp in mainline (destaging) vs. rk3326/px30 uapi differences
To:     Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        kever.yang@rock-chips.com, Eddie Cai <eddie.cai@rock-chips.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org,
        christoph.muellner@theobroma-systems.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Collabora Kernel ML <kernel@collabora.com>
References: <3342088.iIbC2pHGDl@diego>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a75546bb-8af7-a0ab-fce2-89a6e6b63972@collabora.com>
Date:   Fri, 8 Jan 2021 12:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3342088.iIbC2pHGDl@diego>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am 07.01.21 um 21:23 schrieb Heiko Stuebner:
> Hi,
> 
> the rkisp driver in the mainline Linux kernel moved out of staging with
> 5.11-rc1, so the uapi will be fixed after 5.11 proper is released.
> 
> The rkisp driver currently only supports the rk3399 and while working
> on porting the support for rk3326/px30 I noticed discrepancies.
> 
> Hence it would be somewhat urgent to clarify this, as later it will get
> really cumbersome.

I see that we are now on 5.11-rc2 so that gives us about 4-5 weeks,

> 
> ----
> 
> The rkisp on the px30 (v12) has some changes compared to the rk3399 (v10).

How do you know that the isp of rk3399 is v10 ? I looked at the RK3399 TRM
and the datasheet for the isp and could not find this information.

> Some sub-blocks moved around or seem to have been replaced with newer
> variants and the gist of changes can be seen in [0] with the important
> part being the uapi changes [1] and those values also exist in mainline.
> 
> 
> See functions in that patch:
> - isp_goc_config_v12()
> - rkisp1_stats_get_aec_meas_v12()
> - rkisp1_stats_get_hst_meas_v12()
> 
> Looking at the code, the register locations are different, for gammas and
> the histogram the actual amount of raw registers is the same, while the
> "aec" seems to use 25 registers on V10 while 21 registers on V12. Though
> their content gets split into multiple values in that v12 variant.
> 
> 
> As somehow expected the whole thing is pretty undocumented and I
> have no clue what these "bins" or "gammas" mean and why the amount of
> entries now differs and how this relates to userspace at all.
> 
> Also looking through libcamera as the one open user of the driver,
> the whole rkisp1_cif_isp_isp_other_cfg (containing the gamma config)
> as well as the rkisp1_cif_isp_stat struct (for ae and histogram)
> don't seem to be used so far.

yes, that's a shame. There is a simple implementation using the ae in
stuct rkisp1_cif_isp_stat in src/ipa/rkisp1.c

> 
> Hence I also added some Rockchip people in the hope of getting
> a bit of clarification ;-) .
> 
> 
> Ideas on how to proceed?
> 
> Thanks
> Heiko
> 
> 
> [0] https://github.com/rockchip-linux/kernel/commit/2ff670508e8fdfefd67318e885effb8cee4a0f4c
> [1]
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index b471f01a8459..fbeb6b5dba03 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -32,8 +32,8 @@
>   #define CIFISP_CTK_COEFF_MAX            0x100
>   #define CIFISP_CTK_OFFSET_MAX           0x800
>   
> -#define CIFISP_AE_MEAN_MAX              25
> -#define CIFISP_HIST_BIN_N_MAX           16
> +#define CIFISP_AE_MEAN_MAX              81
> +#define CIFISP_HIST_BIN_N_MAX           32
>   #define CIFISP_AFM_MAX_WINDOWS          3
>   #define CIFISP_DEGAMMA_CURVE_SIZE       17
>   
> @@ -69,7 +69,7 @@
>    * Gamma out
>    */
>   /* Maximum number of color samples supported */
> -#define CIFISP_GAMMA_OUT_MAX_SAMPLES       17
> +#define CIFISP_GAMMA_OUT_MAX_SAMPLES       34

I see that in that code you use the old names of the registers.
The names are different in the current version of the driver,
in the media tree: git://linuxtv.org/media_tree.git
Also, I guess that instead of changing the values you should
add a separated define, something like:

-#define CIFISP_GAMMA_OUT_MAX_SAMPLES       17
+#define CIFISP_GAMMA_OUT_MAX_SAMPLES_V10       17
+#define CIFISP_GAMMA_OUT_MAX_SAMPLES_v12       34


Thanks for working on that, hope we could still fix this in 5.11,

I don't have a rk3326/px30 hardware so I can't test your patches.
Do you have a hardware to test it?
I suggest that you send a patchset to the mailing list then I can
review it and test it on rk3399. Unfortunately there is indeed no way
to thoroughly test the params/stats since there is no userspace for that.

Thanks,
Dafna

> 
> 
> 
