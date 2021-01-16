Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82452F8D34
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 12:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbhAPL6T convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 16 Jan 2021 06:58:19 -0500
Received: from gloria.sntech.de ([185.11.138.130]:35254 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbhAPL6S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 06:58:18 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l0kD0-0006w3-3q; Sat, 16 Jan 2021 12:57:34 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     helen.koike@collabora.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, Laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org
Subject: Re: [PATCH v4 3/3] media: rockchip: rkisp1: extend uapi array sizes
Date:   Sat, 16 Jan 2021 12:57:33 +0100
Message-ID: <2554499.uZKlY2gecq@diego>
In-Reply-To: <06d42f41-d570-7327-daca-40a52978d4f9@collabora.com>
References: <20210115163829.217131-1-heiko@sntech.de> <1739328.QCnGb9OGeP@diego> <06d42f41-d570-7327-daca-40a52978d4f9@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Am Samstag, 16. Januar 2021, 10:05:39 CET schrieb Dafna Hirschfeld:
> Am 16.01.21 um 00:52 schrieb Heiko Stübner:
> > Am Freitag, 15. Januar 2021, 18:41:06 CET schrieb Dafna Hirschfeld:
> >> Am 15.01.21 um 17:38 schrieb Heiko Stuebner:
> >>> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> >>>
> >>> Later variants of the rkisp1 block use more entries in some arrays:
> >>>
> >>> RKISP1_CIF_ISP_AE_MEAN_MAX                 25 -> 81
> >>> RKISP1_CIF_ISP_HIST_BIN_N_MAX              16 -> 32
> >>> RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17 -> 34
> >>> RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28 -> 81
> >>
> >> I see you didn't change the value for that define.
> > 
> > In the below patch I find
> > 
> > @@ -103,7 +111,9 @@
> > * Histogram calculation
> > */
> > /* Last 3 values unused. */
> > -#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
> > +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10 28
> > +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12 81
> > +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE     RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12
> > 
> > so I'm not sure I understand what you mean except this.
> 
> Opps, I somehow missed that.
> But now since we have 81 entries, it makes no sense to
> define it to 28 for V10 and documenting "Last 3 values unused" (see just above the definition).
> We can set it just to 25, we have 56 (81-25) unused values anyway.

The rkisp1_hst_config() function iterates over its regs-array and accesses
4 weight values in each step and writing them to the register:

static const u32 hist_weight_regs[] = {
	RKISP1_CIF_ISP_HIST_WEIGHT_00TO30_V10, ... weight0-3
	RKISP1_CIF_ISP_HIST_WEIGHT_40TO21_V10, ... weight4-7
	RKISP1_CIF_ISP_HIST_WEIGHT_31TO12_V10, ... weight8-11
	RKISP1_CIF_ISP_HIST_WEIGHT_22TO03_V10, ... weight12-15
	RKISP1_CIF_ISP_HIST_WEIGHT_13TO43_V10, ... weight16-19
	RKISP1_CIF_ISP_HIST_WEIGHT_04TO34_V10, ... weight20-23
	RKISP1_CIF_ISP_HIST_WEIGHT_44_V10, ... weight24-27
};

and yes the last step only uses 1 value to write to the register.
But I guess if we really want to reduce the max value, we should move
that last part into a separate write, so that we don't access parts we claim
to not access ;-)

> >> The usage of it is a bit more complicated.
> >> It is used in function rkisp1_hst_config.
> > 
> > Yeah, though the for-loop iterates over 4*7 entry values, so stays
> > below the RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10 in all cases.
> > 
> > 
> >> Actually the real number of weight values are 25 (5x5) for rk3399,
> >> the last 3 are not used. I think that in order to support both
> >> 5x5 and 9x9 the code in rkisp1-params.c should change. I'll
> >> send a patch fixing it.
> > 
> > If you look at my V12-patch [0] the weight handling is done different there
> > and from the registers, it looks like they exchanges that part of the isp.
> > 
> > [0] https://lore.kernel.org/linux-media/20210108193311.3423236-11-heiko@sntech.de/
> > void rkisp1_hst_config_v12() as a search term
> > 
> > [...]
> 
> Right, there is no need to change the relevant code in rkisp1-param.c when setting the
> RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE to 25.

ok, should we add a 4th patch fixing that and moving the last write out of the loop?


Heiko

> >>> @@ -862,8 +898,16 @@ struct rkisp1_cif_isp_af_stat {
> >>>     *
> >>>     * @hist_bins: measured bin counters
> >>>     *
> >>> - * Measurement window divided into 16 sub-windows, set
> >>> - * with ISP_HIST_XXX
> >>> + * Measurement window divided into 16 sub-windows for V10/V10
> >>> + * and 32 sub-windows for V12/V13, set with ISP_HIST_XXX
> >>
> >> It is actually not windows but histogram bins. Could you change it to:
> >> "The histogram values divided into 16 bins for V10/V11 and 32 bins
> >> for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.
> > 
> > I've changed this like your suggestions and will give a bit of time for
> > the stuff above. But I guess I can send a v5 some time tomorrow?
> > 
> > 
> > Thanks for your input
> > Heiko
> > 
> > 
> 




