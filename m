Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03012F2832
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 07:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbhALGFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 01:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbhALGFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 01:05:49 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EF4C061575
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 22:05:08 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id v26so954542eds.13
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 22:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D6bELGUJvHwAug6B4ju9CfL6sACFKa7D5Sn8crQlhpc=;
        b=V38c9JIQKVLHILnG3PzwHK6iWLJVIqGUwVebu8CvtbmitgPJesR/mraPNOlRziVx3A
         6U72sqz9ntXcbPp7j04BBmMDRZZZqwdnxK7aTExzH5roZUDvXP0nD+JtbjXl3n5emKYP
         xLaAnrZiis68427ri1LsijwhC5YFGuMi8izgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D6bELGUJvHwAug6B4ju9CfL6sACFKa7D5Sn8crQlhpc=;
        b=J5GVk8GGlYxv5Kw5YZNL5P1VR6Wx75/7yRBceBHXOgjhs7bqETg17PkZLh1+rLoNbx
         VT3hvng9//dui8gVy3hiuhQeGihrJ0ZE9/GWoYryU4z0/eTTTGQOPLkyUXZNJPN3afvp
         FcQ+xYPJpItjPgrShHS7Zw7RqynI5elbMQp+KxtWNrJoH/BrPIM434PBATOplCCybij3
         IoGobKE99R4YCmwLDl9z9NFuAID+E1u2Jfq2NrL5r8XOI4HRKI2EmUeVnnchPT9DABeh
         PWPy3hd8VlrxFqJwf1lFSaNhk59GMkr+uoQTB9sFwbj/lAK26jRzuV0s0HKJt3a/qBjs
         fn8g==
X-Gm-Message-State: AOAM531mqpvYTyvT9kHqCvhdB+xQ7mUJQ94G09MoWyhvbsXMCyYgg6do
        hggj0CZFLEhjG3rJe1vspuV81ywios3UqA==
X-Google-Smtp-Source: ABdhPJyzqCfYdc7XJgMWttd35hDPzguczL4jrFMc0iIrf5y4Hw9UCQGqTbLmqjgNl+VqStQZ77cdgw==
X-Received: by 2002:a05:6402:31bb:: with SMTP id dj27mr96204edb.285.1610431507264;
        Mon, 11 Jan 2021 22:05:07 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id v25sm201140ejw.21.2021.01.11.22.05.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 22:05:06 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 3so918411wmg.4
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 22:05:05 -0800 (PST)
X-Received: by 2002:a1c:c308:: with SMTP id t8mr1899553wmf.22.1610431505145;
 Mon, 11 Jan 2021 22:05:05 -0800 (PST)
MIME-Version: 1.0
References: <3342088.iIbC2pHGDl@diego>
In-Reply-To: <3342088.iIbC2pHGDl@diego>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 12 Jan 2021 15:04:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AywuBVXSEdfoYTMofmhEXPVzehPm0pgTSfBrFD9s6aQg@mail.gmail.com>
Message-ID: <CAAFQd5AywuBVXSEdfoYTMofmhEXPVzehPm0pgTSfBrFD9s6aQg@mail.gmail.com>
Subject: Re: rkisp in mainline (destaging) vs. rk3326/px30 uapi differences
To:     Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        "Kever.Yang" <kever.yang@rock-chips.com>,
        Eddie Cai <eddie.cai@rock-chips.com>,
        Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        christoph.muellner@theobroma-systems.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

On Fri, Jan 8, 2021 at 5:48 AM Heiko Stuebner
<heiko.stuebner@theobroma-systems.com> wrote:
>
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
>
> ----
>
> The rkisp on the px30 (v12) has some changes compared to the rk3399 (v10).
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

FWIW, another open source user of the driver is the Rockchip HAL for
Chrome OS. [1]
The link points to an unmerged version that is updated for the
upstream driver, which we want to transition to, as per the stack of
patches at [2].
For example, RKISP1_CIF_ISP_HIST_BIN_N_MAX (which
CIFISP_HIST_BIN_N_MAX was renamed to) seems to be referenced in [3].

[1] https://chromium.googlesource.com/chromiumos/platform2/+/5c055d6ae727e347c1a9fd8acad061e427b1e4ff/camera/hal/rockchip/
[2] https://chromium-review.googlesource.com/c/chromiumos/platform2/+/2521601/
[3] https://chromium.googlesource.com/chromiumos/platform2/+/5c055d6ae727e347c1a9fd8acad061e427b1e4ff/camera/hal/rockchip/psl/rkisp1/workers/StatisticsWorker.cpp#220

Best regards,
Tomasz

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
>  #define CIFISP_CTK_COEFF_MAX            0x100
>  #define CIFISP_CTK_OFFSET_MAX           0x800
>
> -#define CIFISP_AE_MEAN_MAX              25
> -#define CIFISP_HIST_BIN_N_MAX           16
> +#define CIFISP_AE_MEAN_MAX              81
> +#define CIFISP_HIST_BIN_N_MAX           32
>  #define CIFISP_AFM_MAX_WINDOWS          3
>  #define CIFISP_DEGAMMA_CURVE_SIZE       17
>
> @@ -69,7 +69,7 @@
>   * Gamma out
>   */
>  /* Maximum number of color samples supported */
> -#define CIFISP_GAMMA_OUT_MAX_SAMPLES       17
> +#define CIFISP_GAMMA_OUT_MAX_SAMPLES       34
>
>
>
