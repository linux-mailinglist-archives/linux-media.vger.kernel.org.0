Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FB12F109B
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 11:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbhAKKxs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 05:53:48 -0500
Received: from vegas.theobroma-systems.com ([144.76.126.164]:45003 "EHLO
        mail.theobroma-systems.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729570AbhAKKxs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 05:53:48 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]:45822 helo=diego.localnet)
        by mail.theobroma-systems.com with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <heiko.stuebner@theobroma-systems.com>)
        id 1kyuoo-0004Gw-AU; Mon, 11 Jan 2021 11:53:02 +0100
From:   Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kever.yang@rock-chips.com, Eddie Cai <eddie.cai@rock-chips.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org,
        christoph.muellner@theobroma-systems.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Collabora Kernel ML <kernel@collabora.com>
Subject: Re: rkisp in mainline (destaging) vs. rk3326/px30 uapi differences
Date:   Mon, 11 Jan 2021 11:53:00 +0100
Message-ID: <1704014.3VsfAaAtOV@diego>
Organization: Theobroma Systems
In-Reply-To: <X/kFJ+bguDHuiSac@pendragon.ideasonboard.com>
References: <3342088.iIbC2pHGDl@diego> <d0ec7f72-799e-ec53-a917-755fde323e95@collabora.com> <X/kFJ+bguDHuiSac@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Am Samstag, 9. Januar 2021, 02:21:43 CET schrieb Laurent Pinchart:
> On Fri, Jan 08, 2021 at 04:21:49PM +0100, Dafna Hirschfeld wrote:
> > Am 08.01.21 um 13:05 schrieb Heiko Stuebner:
> > > Am Freitag, 8. Januar 2021, 12:17:43 CET schrieb Dafna Hirschfeld:
> > >> Am 07.01.21 um 21:23 schrieb Heiko Stuebner:
> > >>> the rkisp driver in the mainline Linux kernel moved out of staging with
> > >>> 5.11-rc1, so the uapi will be fixed after 5.11 proper is released.
> > >>>
> > >>> The rkisp driver currently only supports the rk3399 and while working
> > >>> on porting the support for rk3326/px30 I noticed discrepancies.
> > >>>
> > >>> Hence it would be somewhat urgent to clarify this, as later it will get
> > >>> really cumbersome.
> > >>
> > >> I see that we are now on 5.11-rc2 so that gives us about 4-5 weeks,
> > >>
> > >>>
> > >>> ----
> > >>>
> > >>> The rkisp on the px30 (v12) has some changes compared to the rk3399 (v10).
> > >>
> > >> How do you know that the isp of rk3399 is v10 ? I looked at the RK3399 TRM
> > >> and the datasheet for the isp and could not find this information.
> > > 
> > > That's from Rockchip's upstream sources where they introduced the new code.
> > > There're some (if v12) conditionals in there ;-) .
> > > 
> > >>> Some sub-blocks moved around or seem to have been replaced with newer
> > >>> variants and the gist of changes can be seen in [0] with the important
> > >>> part being the uapi changes [1] and those values also exist in mainline.
> > >>>
> > >>>
> > >>> See functions in that patch:
> > >>> - isp_goc_config_v12()
> > >>> - rkisp1_stats_get_aec_meas_v12()
> > >>> - rkisp1_stats_get_hst_meas_v12()
> > >>>
> > >>> Looking at the code, the register locations are different, for gammas and
> > >>> the histogram the actual amount of raw registers is the same, while the
> > >>> "aec" seems to use 25 registers on V10 while 21 registers on V12. Though
> > >>> their content gets split into multiple values in that v12 variant.
> > >>>
> > >>>
> > >>> As somehow expected the whole thing is pretty undocumented and I
> > >>> have no clue what these "bins" or "gammas" mean and why the amount of
> > >>> entries now differs and how this relates to userspace at all.
> > >>>
> > >>> Also looking through libcamera as the one open user of the driver,
> > >>> the whole rkisp1_cif_isp_isp_other_cfg (containing the gamma config)
> > >>> as well as the rkisp1_cif_isp_stat struct (for ae and histogram)
> > >>> don't seem to be used so far.
> > >>
> > >> yes, that's a shame. There is a simple implementation using the ae in
> > >> stuct rkisp1_cif_isp_stat in src/ipa/rkisp1.c
> > > 
> > > Thanks for pointing me to that :-)
> > > 
> > >>> Hence I also added some Rockchip people in the hope of getting
> > >>> a bit of clarification ;-) .
> > >>>
> > >>> Ideas on how to proceed?
> > >>>
> > >>> Thanks
> > >>> Heiko
> > >>>
> > >>>
> > >>> [0] https://github.com/rockchip-linux/kernel/commit/2ff670508e8fdfefd67318e885effb8cee4a0f4c
> > >>> [1]
> > >>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > >>> index b471f01a8459..fbeb6b5dba03 100644
> > >>> --- a/include/uapi/linux/rkisp1-config.h
> > >>> +++ b/include/uapi/linux/rkisp1-config.h
> > >>> @@ -32,8 +32,8 @@
> > >>>    #define CIFISP_CTK_COEFF_MAX            0x100
> > >>>    #define CIFISP_CTK_OFFSET_MAX           0x800
> > >>>    
> > >>> -#define CIFISP_AE_MEAN_MAX              25
> > >>> -#define CIFISP_HIST_BIN_N_MAX           16
> > >>> +#define CIFISP_AE_MEAN_MAX              81
> > >>> +#define CIFISP_HIST_BIN_N_MAX           32
> > >>>    #define CIFISP_AFM_MAX_WINDOWS          3
> > >>>    #define CIFISP_DEGAMMA_CURVE_SIZE       17
> > >>>    
> > >>> @@ -69,7 +69,7 @@
> > >>>     * Gamma out
> > >>>     */
> > >>>    /* Maximum number of color samples supported */
> > >>> -#define CIFISP_GAMMA_OUT_MAX_SAMPLES       17
> > >>> +#define CIFISP_GAMMA_OUT_MAX_SAMPLES       34
> > >>
> > >> I see that in that code you use the old names of the registers.
> > >> The names are different in the current version of the driver,
> > >> in the media tree: git://linuxtv.org/media_tree.git
> > >> Also, I guess that instead of changing the values you should
> > >> add a separated define, something like:
> > >>
> > >> -#define CIFISP_GAMMA_OUT_MAX_SAMPLES       17
> > >> +#define CIFISP_GAMMA_OUT_MAX_SAMPLES_V10       17
> > >> +#define CIFISP_GAMMA_OUT_MAX_SAMPLES_v12       34
> > > 
> > > Just for clarity, that is Rockchip's commit in their vendor kernel.
> > > I'm just using that as base to get the changes needed for mainline :-) .
> > > 
> > > The main issue I see is that these max-values directly influence the sizes
> > > of arrays inside the uapi - where the "v12" seems to need bigger arrays
> > > on first glance.
> > > ^^^ which is essentially the part I'm mostly worried about
> > 
> > Oh, ok, I thought it's your code.
> > So maybe we should change the uapi to look like:
> > 
> > /* v10 is the isp version for rk3399 */
> > #define CIFISP_GAMMA_OUT_MAX_SAMPLES_V10       17
> > /* v12 is the isp version for rk3326/px30 */
> > #define CIFISP_GAMMA_OUT_MAX_SAMPLES_v12       34
> > #define CIFISP_GAMMA_OUT_MAX_SAMPLES       CIFISP_GAMMA_OUT_MAX_SAMPLES_v12
> > 
> > This way we inform userspace how many samples are supported according to the
> > version.
> > I don't know if there are other versions with higher maximum,
> > 
> > What do you think?
> 
> This makes sense to me. Userspace will need to know how many samples are
> actually present in the array, so corresponding macros should be defined
> in the header.

ok, though as it seems to have been discussed on irc, we'll also need a
version field to indicate the IP version.


> > > The vendor-code only used the MAX-constants for the uapi to get the
> > > biggest size needed and then defines the real per-version maximums
> > > inside the driver, see
> > > https://github.com/rockchip-linux/kernel/commit/2ff670508e8fdfefd67318e885effb8cee4a0f4c#diff-961dbaed00164098bb082b01d6c9446501cfcef808cf5a71bf18405067fb5426R378
> > > 
> > > and for the auto-exposure:
> > > https://github.com/rockchip-linux/kernel/commit/2ff670508e8fdfefd67318e885effb8cee4a0f4c#diff-961dbaed00164098bb082b01d6c9446501cfcef808cf5a71bf18405067fb5426R265
> > > >> Thanks for working on that, hope we could still fix this in 5.11,
> > >>
> > >> I don't have a rk3326/px30 hardware so I can't test your patches.
> > >> Do you have a hardware to test it?
> > > 
> > > Yep, I'm working on a px30-evb and thankfully the driver for the camera
> > > on it is also already part of mainline.
> > > 
> > >> I suggest that you send a patchset to the mailing list then I can
> > >> review it and test it on rk3399. Unfortunately there is indeed no way
> > >> to thoroughly test the params/stats since there is no userspace for that.
> > > 
> > >  From looking at the currently newest version [0] it looks like these
> > > new max values seem to have stayed the same, so one solution might be
> > > to just make the uapi structures bigger to these new max values and
> > > hope for the best?
> 
> This is one option, the other option would be to make the array size
> dynamic by turning them into pointers. That leads to additional
> complications though, so given that the extra memory consumed for the
> largest array is reasonable, simply increasing the array size may be the
> best option. Do we expect other ISP versions in the future with
> differences that would require other changes to the userspace API ? How
> about v1 to v9 and v11, do they exist ?

I do believe the version indication is v10 for v1.0 and so on.

Looking at the vendor tree, I see versions:

- V10: rk3288 + rk3399
- V10_1: rk3368 (only supports MP streams - whatever these are)
- V11: unused
- V12: rk3326 / px30
- V13: rk1808
- V20: rk3568 and probably following

gamma_out, hist_grid_size, ae_mean_max, hist_bin
v10:  17, 28, 25, 16
v12: 34, 81, 81, 32
v13: same as v12

Looking at the general change for V20 [0] it really looks like a big rework
of the ISP block happenend with 100K of new register definitions and there
are of course no chips nor boards on the market yet at all, so part of me
would expect this to need a separate userspace when the time comes.


Heiko

[0] https://github.com/rockchip-linux/kernel/commit/e631e47fe7012d165f185009f224d52a81b0f74f



