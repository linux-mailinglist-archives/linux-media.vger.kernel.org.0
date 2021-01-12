Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DD82F283A
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 07:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731616AbhALGLN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 01:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730825AbhALGLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 01:11:12 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5F5C061575
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 22:10:32 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id lt17so1862268ejb.3
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 22:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LZtLMTGWFXFplDrbtMxzukn1R3pQI6SD4aa/b5f4KFM=;
        b=O4V2kF2U67ZFEKflA+KKX8sLe7pwB5r0CqfIPXMWkLKcVbOBRTYv/wRbgjVmM7jFZi
         gspUD5ccoN2RIC6XOAeVQDDYQ2ydoLzO/nvBqK8D1HhMFIXfq+U1Fm3qvbFmuIQqJ8HD
         EFJALk3SiIZE1N2vBRGEX5GWFPEMCpqYzf3KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZtLMTGWFXFplDrbtMxzukn1R3pQI6SD4aa/b5f4KFM=;
        b=QXTyVJGWpwNj7l97NsnwdJmmv42hcOrJd4tI1/6qObzmiG+/59SeKRk8POpvEzm3yo
         KjmRjQI/ocqKZJ9VAp6gYUV67XvksHcgnlnWxw+jMmsC2zb5leqE5GXP1ajvOOuHJfa8
         LWFKRABlV4YjyFvIJY2eQMZfVmelJbg4+tj9ohgUMTLi+BFsAtLijyb37EEY/FZ0Xrlb
         d9d+QN3uOZ1UsPpZ1320auweleO7GSsmql2BtuQJl4wT1WIubS2GF6dQtvwH6/pDibT1
         v086RBYvyQwpzWkfb/rbudSN4RbAHtK51Ojt5hjGntUMQ0mDsI3MS2QUFn+tQ0+Nmobx
         J7+A==
X-Gm-Message-State: AOAM53284WS3iokSnGnOvo8WwsfYDEJb0b573dI40kKu5uWfGkLmlkmw
        poLK6PZ4SMirRurWS9Y0IDJuMX1AB36IKQ==
X-Google-Smtp-Source: ABdhPJykCA9qU5hq5R/MZ/Ep6FoKMiJMrsZ9LKgQawRNwdZNqQCXIIMIWUB+jJyuEx/v2MhxrLZ1yQ==
X-Received: by 2002:a17:907:2108:: with SMTP id qn8mr2080613ejb.127.1610431830572;
        Mon, 11 Jan 2021 22:10:30 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id t8sm741355eju.69.2021.01.11.22.10.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 22:10:29 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id a12so1164678wrv.8
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 22:10:29 -0800 (PST)
X-Received: by 2002:a5d:6209:: with SMTP id y9mr2404615wru.197.1610431828984;
 Mon, 11 Jan 2021 22:10:28 -0800 (PST)
MIME-Version: 1.0
References: <3342088.iIbC2pHGDl@diego> <1704014.3VsfAaAtOV@diego>
 <X/ww2Bfvr8WE/Yz6@pendragon.ideasonboard.com> <15789743.geO5KgaWL5@diego>
In-Reply-To: <15789743.geO5KgaWL5@diego>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 12 Jan 2021 15:10:16 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DpMYK2HG5_8BBf3qYJ_MDGnS-O8k32LiYvT2jvR0x9xQ@mail.gmail.com>
Message-ID: <CAAFQd5DpMYK2HG5_8BBf3qYJ_MDGnS-O8k32LiYvT2jvR0x9xQ@mail.gmail.com>
Subject: Re: rkisp in mainline (destaging) vs. rk3326/px30 uapi differences
To:     Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        "Kever.Yang" <kever.yang@rock-chips.com>,
        Eddie Cai <eddie.cai@rock-chips.com>,
        Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        christoph.muellner@theobroma-systems.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 12:05 AM Heiko Stuebner
<heiko.stuebner@theobroma-systems.com> wrote:
>
> Hi Laurent,
>
> Am Montag, 11. Januar 2021, 12:04:56 CET schrieb Laurent Pinchart:
> > On Mon, Jan 11, 2021 at 11:53:00AM +0100, Heiko Stuebner wrote:
> > > Am Samstag, 9. Januar 2021, 02:21:43 CET schrieb Laurent Pinchart:
> > > > On Fri, Jan 08, 2021 at 04:21:49PM +0100, Dafna Hirschfeld wrote:
> > > > > Am 08.01.21 um 13:05 schrieb Heiko Stuebner:
> > > > > > Am Freitag, 8. Januar 2021, 12:17:43 CET schrieb Dafna Hirschfeld:
> > > > > >> Am 07.01.21 um 21:23 schrieb Heiko Stuebner:
> > > > > >>> the rkisp driver in the mainline Linux kernel moved out of staging with
> > > > > >>> 5.11-rc1, so the uapi will be fixed after 5.11 proper is released.
> > > > > >>>
> > > > > >>> The rkisp driver currently only supports the rk3399 and while working
> > > > > >>> on porting the support for rk3326/px30 I noticed discrepancies.
> > > > > >>>
> > > > > >>> Hence it would be somewhat urgent to clarify this, as later it will get
> > > > > >>> really cumbersome.
> > > > > >>
> > > > > >> I see that we are now on 5.11-rc2 so that gives us about 4-5 weeks,
> > > > > >>
> > > > > >>>
> > > > > >>> ----
> > > > > >>>
> > > > > >>> The rkisp on the px30 (v12) has some changes compared to the rk3399 (v10).
> > > > > >>
> > > > > >> How do you know that the isp of rk3399 is v10 ? I looked at the RK3399 TRM
> > > > > >> and the datasheet for the isp and could not find this information.
> > > > > >
> > > > > > That's from Rockchip's upstream sources where they introduced the new code.
> > > > > > There're some (if v12) conditionals in there ;-) .
> > > > > >
> > > > > >>> Some sub-blocks moved around or seem to have been replaced with newer
> > > > > >>> variants and the gist of changes can be seen in [0] with the important
> > > > > >>> part being the uapi changes [1] and those values also exist in mainline.
> > > > > >>>
> > > > > >>>
> > > > > >>> See functions in that patch:
> > > > > >>> - isp_goc_config_v12()
> > > > > >>> - rkisp1_stats_get_aec_meas_v12()
> > > > > >>> - rkisp1_stats_get_hst_meas_v12()
> > > > > >>>
> > > > > >>> Looking at the code, the register locations are different, for gammas and
> > > > > >>> the histogram the actual amount of raw registers is the same, while the
> > > > > >>> "aec" seems to use 25 registers on V10 while 21 registers on V12. Though
> > > > > >>> their content gets split into multiple values in that v12 variant.
> > > > > >>>
> > > > > >>>
> > > > > >>> As somehow expected the whole thing is pretty undocumented and I
> > > > > >>> have no clue what these "bins" or "gammas" mean and why the amount of
> > > > > >>> entries now differs and how this relates to userspace at all.
> > > > > >>>
> > > > > >>> Also looking through libcamera as the one open user of the driver,
> > > > > >>> the whole rkisp1_cif_isp_isp_other_cfg (containing the gamma config)
> > > > > >>> as well as the rkisp1_cif_isp_stat struct (for ae and histogram)
> > > > > >>> don't seem to be used so far.
> > > > > >>
> > > > > >> yes, that's a shame. There is a simple implementation using the ae in
> > > > > >> stuct rkisp1_cif_isp_stat in src/ipa/rkisp1.c
> > > > > >
> > > > > > Thanks for pointing me to that :-)
> > > > > >
> > > > > >>> Hence I also added some Rockchip people in the hope of getting
> > > > > >>> a bit of clarification ;-) .
> > > > > >>>
> > > > > >>> Ideas on how to proceed?
> > > > > >>>
> > > > > >>> Thanks
> > > > > >>> Heiko
> > > > > >>>
> > > > > >>>
> > > > > >>> [0] https://github.com/rockchip-linux/kernel/commit/2ff670508e8fdfefd67318e885effb8cee4a0f4c
> > > > > >>> [1]
> > > > > >>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > > > > >>> index b471f01a8459..fbeb6b5dba03 100644
> > > > > >>> --- a/include/uapi/linux/rkisp1-config.h
> > > > > >>> +++ b/include/uapi/linux/rkisp1-config.h
> > > > > >>> @@ -32,8 +32,8 @@
> > > > > >>>    #define CIFISP_CTK_COEFF_MAX            0x100
> > > > > >>>    #define CIFISP_CTK_OFFSET_MAX           0x800
> > > > > >>>
> > > > > >>> -#define CIFISP_AE_MEAN_MAX              25
> > > > > >>> -#define CIFISP_HIST_BIN_N_MAX           16
> > > > > >>> +#define CIFISP_AE_MEAN_MAX              81
> > > > > >>> +#define CIFISP_HIST_BIN_N_MAX           32
> > > > > >>>    #define CIFISP_AFM_MAX_WINDOWS          3
> > > > > >>>    #define CIFISP_DEGAMMA_CURVE_SIZE       17
> > > > > >>>
> > > > > >>> @@ -69,7 +69,7 @@
> > > > > >>>     * Gamma out
> > > > > >>>     */
> > > > > >>>    /* Maximum number of color samples supported */
> > > > > >>> -#define CIFISP_GAMMA_OUT_MAX_SAMPLES       17
> > > > > >>> +#define CIFISP_GAMMA_OUT_MAX_SAMPLES       34
> > > > > >>
> > > > > >> I see that in that code you use the old names of the registers.
> > > > > >> The names are different in the current version of the driver,
> > > > > >> in the media tree: git://linuxtv.org/media_tree.git
> > > > > >> Also, I guess that instead of changing the values you should
> > > > > >> add a separated define, something like:
> > > > > >>
> > > > > >> -#define CIFISP_GAMMA_OUT_MAX_SAMPLES       17
> > > > > >> +#define CIFISP_GAMMA_OUT_MAX_SAMPLES_V10       17
> > > > > >> +#define CIFISP_GAMMA_OUT_MAX_SAMPLES_v12       34
> > > > > >
> > > > > > Just for clarity, that is Rockchip's commit in their vendor kernel.
> > > > > > I'm just using that as base to get the changes needed for mainline :-) .
> > > > > >
> > > > > > The main issue I see is that these max-values directly influence the sizes
> > > > > > of arrays inside the uapi - where the "v12" seems to need bigger arrays
> > > > > > on first glance.
> > > > > > ^^^ which is essentially the part I'm mostly worried about
> > > > >
> > > > > Oh, ok, I thought it's your code.
> > > > > So maybe we should change the uapi to look like:
> > > > >
> > > > > /* v10 is the isp version for rk3399 */
> > > > > #define CIFISP_GAMMA_OUT_MAX_SAMPLES_V10       17
> > > > > /* v12 is the isp version for rk3326/px30 */
> > > > > #define CIFISP_GAMMA_OUT_MAX_SAMPLES_v12       34
> > > > > #define CIFISP_GAMMA_OUT_MAX_SAMPLES       CIFISP_GAMMA_OUT_MAX_SAMPLES_v12
> > > > >
> > > > > This way we inform userspace how many samples are supported according to the
> > > > > version.
> > > > > I don't know if there are other versions with higher maximum,
> > > > >
> > > > > What do you think?
> > > >
> > > > This makes sense to me. Userspace will need to know how many samples are
> > > > actually present in the array, so corresponding macros should be defined
> > > > in the header.
> > >
> > > ok, though as it seems to have been discussed on irc, we'll also need a
> > > version field to indicate the IP version.
> >
> > In the statistics buffer that could be done, but in the params buffer it
> > won't help userspace figure out what version of the IP is in use as
> > params are filled by the application, not the kernel. I think reporting
> > the IP version through the media controller API should be enough,
> > possibly in media_device_info.hw_revision, and/or in the model string.
>
> hw_revision sounds like the ideal place :-)
>
> and I've added a line doing that, thanks for the pointer.
>

One problem with that approach is that we would still need to change
those arrays in the existing UAPI structs. That might be fine for now,
since they still reside under staging/, but even then it would be
cumbersome for existing users, such as Chrome OS.

I think we can still adjust our userspace in Chrome OS, but once we
move out of staging, such changes wouldn't be possible. In that case,
I think there would be two options left:
 - Create a new FourCC and introduce a new structure for the new hardware,
 - Extend the existing structure at the end to allow the userspace
retain the existing layout.

Best regards,
Tomasz

>
> > > > > > The vendor-code only used the MAX-constants for the uapi to get the
> > > > > > biggest size needed and then defines the real per-version maximums
> > > > > > inside the driver, see
> > > > > > https://github.com/rockchip-linux/kernel/commit/2ff670508e8fdfefd67318e885effb8cee4a0f4c#diff-961dbaed00164098bb082b01d6c9446501cfcef808cf5a71bf18405067fb5426R378
> > > > > >
> > > > > > and for the auto-exposure:
> > > > > > https://github.com/rockchip-linux/kernel/commit/2ff670508e8fdfefd67318e885effb8cee4a0f4c#diff-961dbaed00164098bb082b01d6c9446501cfcef808cf5a71bf18405067fb5426R265
> > > > > > >> Thanks for working on that, hope we could still fix this in 5.11,
> > > > > >>
> > > > > >> I don't have a rk3326/px30 hardware so I can't test your patches.
> > > > > >> Do you have a hardware to test it?
> > > > > >
> > > > > > Yep, I'm working on a px30-evb and thankfully the driver for the camera
> > > > > > on it is also already part of mainline.
> > > > > >
> > > > > >> I suggest that you send a patchset to the mailing list then I can
> > > > > >> review it and test it on rk3399. Unfortunately there is indeed no way
> > > > > >> to thoroughly test the params/stats since there is no userspace for that.
> > > > > >
> > > > > >  From looking at the currently newest version [0] it looks like these
> > > > > > new max values seem to have stayed the same, so one solution might be
> > > > > > to just make the uapi structures bigger to these new max values and
> > > > > > hope for the best?
> > > >
> > > > This is one option, the other option would be to make the array size
> > > > dynamic by turning them into pointers. That leads to additional
> > > > complications though, so given that the extra memory consumed for the
> > > > largest array is reasonable, simply increasing the array size may be the
> > > > best option. Do we expect other ISP versions in the future with
> > > > differences that would require other changes to the userspace API ? How
> > > > about v1 to v9 and v11, do they exist ?
> > >
> > > I do believe the version indication is v10 for v1.0 and so on.
> > >
> > > Looking at the vendor tree, I see versions:
> > >
> > > - V10: rk3288 + rk3399
> > > - V10_1: rk3368 (only supports MP streams - whatever these are)
> > > - V11: unused
> > > - V12: rk3326 / px30
> > > - V13: rk1808
> > > - V20: rk3568 and probably following
> > >
> > > gamma_out, hist_grid_size, ae_mean_max, hist_bin
> > > v10:  17, 28, 25, 16
> > > v12: 34, 81, 81, 32
> > > v13: same as v12
> >
> > Are v10 and v12 software versions introduced by rockchip, or is there a
> > version reported in the hardware registers ?
>
> The version designations are introduced by Rockchip - living in the
> dt-compatible-based match-data.
>
> Looking at the registers in the regs header, I sadly didn't see any
> version-registers - though V12 moved a number of registers arond
> and introduced new ones (for the data sources requiring these
> bigger arrays)
>
>
> > > Looking at the general change for V20 [0] it really looks like a big rework
> > > of the ISP block happenend with 100K of new register definitions and there
> > > are of course no chips nor boards on the market yet at all, so part of me
> > > would expect this to need a separate userspace when the time comes.
> >
> > Is it an evoluation of the IP core, or something completely different ?
> > It may even make sense to have a separate kernel driver.
>
> From my short glance it seems to share a lot of the basic parts for capture
> etc with small evolutions ... but the stats and params parts seem to have
> gotten a major evolution.
>
> I guess we'll cross that bridge after the chips are actually available ;-) .
> Rockchip pushed that code into their public repo only last week after all.
>
>
> Heiko
>
>
