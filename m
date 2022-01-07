Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C112487578
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 11:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346650AbiAGK1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 05:27:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237286AbiAGK1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 05:27:34 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C3CC061245
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 02:27:34 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id e5so3589695wmq.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jan 2022 02:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=+LcKIxKyxLGjKW6IcRZDxLlFRV5suUXobARkItbe6Kg=;
        b=pco4TT9oYRb0KY0wcUHUnUxy3Cc95Cnpy0GQJwh+pYjLZFgJ+k0FNXYkB9z/MDaHfb
         k092cwUzMIq8ly1Qxes7tR52lK8FzPw/gtGuO86pBWJ2quuq2mR2TaiqkIu00N2uyZIr
         x6hSoP95ZtdoSqo378PpbDVXIdtLv5DFdQk95iWAxn0QMwjPMUQWuVduRXdmkEPDQDwp
         txQjnIhbwCHiz/Oc0ILnmI0HW4RIZMqeUc/QEETZt83ZN8D0AzBiDR1BsX9dhTP35Ekv
         yds/lubR/+wOyErKt53FpV3g6+MlgL/fqm/P8TbHu5dUD+Q1z8AYZ8yyhysGKJb7oHCH
         WJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=+LcKIxKyxLGjKW6IcRZDxLlFRV5suUXobARkItbe6Kg=;
        b=wTRV+cn68Y9LxYZC+LY21lOQ8LUc32HfM0AYN2gTJovdNKxVUodCO1Gfus9Gc6+zSb
         3gbQuk2zC+DegMgFVUNUfW4gsvmHvDoBdTB6jrwu1+Ij66NqBfAf0ivh86YVyy3rYtGT
         fH0ZHZ+5yPUdAPYn5NZK21A1mA6LjQZb51Z1H1+BnWGKi4xqym3S5rC7t2xvpcoDcRJk
         fi0swwAvH2ieUL26RtM0btbX33LdTtpfgUKlAEqhqLfLBKmZlcPRp3ZR9L7OEvxAiCfF
         XYofpOIJMnkLMvPj7iSEop7HNNnHp1Py6ZwlF3KjlxagO9cV8Xm4gKaLrvE+Tpc6ntFM
         CITA==
X-Gm-Message-State: AOAM532XyG6VKtjVwXETlh0wrFQh3IBHqsiseswkI7mxt5yQokjzotQl
        a/dRpciJh7CrAqI0vMr9ndQ=
X-Google-Smtp-Source: ABdhPJzxA93TAQTGMl6p964lIqI36tNB/y35ZP5uryva6Ukg/VS+eHBSfmQsgrtWUFAAShg3Se2J9Q==
X-Received: by 2002:a1c:43c5:: with SMTP id q188mr1189977wma.54.1641551252668;
        Fri, 07 Jan 2022 02:27:32 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id 6sm3508311wmo.42.2022.01.07.02.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:27:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 07 Jan 2022 10:27:31 +0000
Message-Id: <CGZDCQ28LN5P.1C0GI87K2SRRI@arch-thunder>
Cc:     "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_Brunet?= <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 2/3] staging: media: imx: imx7_mipi_csis: Add timings
 override through debugfs
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
References: <20220106172441.7399-1-laurent.pinchart@ideasonboard.com>
 <20220106172441.7399-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220106172441.7399-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
thanks for the patch.

On Thu Jan 6, 2022 at 5:24 PM WET, Laurent Pinchart wrote:

> Add two debugfs files, ths_settle and tclk_settle, to allow overriding
> the corresponding timing parameters for test purpose.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 35 ++++++++++++++++++----
>  1 file changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging=
/media/imx/imx7-mipi-csis.c
> index c9c0089ad816..d7bcfb1a0c52 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -333,7 +333,11 @@ struct csi_state {
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  	struct dentry *debugfs_root;
> -	bool debug;
> +	struct {
> +		bool debug;

I think here would make more sense to call it "enable", I think
state->debug.enable is more readable than state->debug.debug.

Other than this LGTM

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

> +		u32 hs_settle;
> +		u32 clk_settle;
> +	} debug;
>  };
> =20
>  /* ---------------------------------------------------------------------=
--------
> @@ -543,6 +547,18 @@ static int mipi_csis_calculate_params(struct csi_sta=
te *state)
>  	dev_dbg(state->dev, "lane rate %u, Tclk_settle %u, Ths_settle %u\n",
>  		lane_rate, state->clk_settle, state->hs_settle);
> =20
> +	if (state->debug.hs_settle < 0xff) {
> +		dev_dbg(state->dev, "overriding Ths_settle with %u\n",
> +			state->debug.hs_settle);
> +		state->hs_settle =3D state->debug.hs_settle;
> +	}
> +
> +	if (state->debug.clk_settle < 4) {
> +		dev_dbg(state->dev, "overriding Tclk_settle with %u\n",
> +			state->debug.clk_settle);
> +		state->clk_settle =3D state->debug.clk_settle;
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -659,7 +675,7 @@ static irqreturn_t mipi_csis_irq_handler(int irq, voi=
d *dev_id)
>  	spin_lock_irqsave(&state->slock, flags);
> =20
>  	/* Update the event/error counters */
> -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug) {
> +	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug.debug) {
>  		for (i =3D 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
>  			struct mipi_csis_event *event =3D &state->events[i];
> =20
> @@ -749,7 +765,7 @@ static void mipi_csis_log_counters(struct csi_state *=
state, bool non_errors)
>  	spin_lock_irqsave(&state->slock, flags);
> =20
>  	for (i =3D 0; i < num_events; ++i) {
> -		if (state->events[i].counter > 0 || state->debug)
> +		if (state->events[i].counter > 0 || state->debug.debug)
>  			dev_info(state->dev, "%s events: %d\n",
>  				 state->events[i].name,
>  				 state->events[i].counter);
> @@ -801,12 +817,19 @@ DEFINE_SHOW_ATTRIBUTE(mipi_csis_dump_regs);
> =20
>  static void mipi_csis_debugfs_init(struct csi_state *state)
>  {
> +	state->debug.hs_settle =3D UINT_MAX;
> +	state->debug.clk_settle =3D UINT_MAX;
> +
>  	state->debugfs_root =3D debugfs_create_dir(dev_name(state->dev), NULL);
> =20
>  	debugfs_create_bool("debug_enable", 0600, state->debugfs_root,
> -			    &state->debug);
> +			    &state->debug.debug);
>  	debugfs_create_file("dump_regs", 0600, state->debugfs_root, state,
>  			    &mipi_csis_dump_regs_fops);
> +	debugfs_create_u32("tclk_settle", 0600, state->debugfs_root,
> +			   &state->debug.clk_settle);
> +	debugfs_create_u32("ths_settle", 0600, state->debugfs_root,
> +			   &state->debug.hs_settle);
>  }
> =20
>  static void mipi_csis_debugfs_exit(struct csi_state *state)
> @@ -867,7 +890,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd,=
 int enable)
>  			ret =3D 0;
>  		mipi_csis_stop_stream(state);
>  		state->state &=3D ~ST_STREAMING;
> -		if (state->debug)
> +		if (state->debug.debug)
>  			mipi_csis_log_counters(state, true);
>  	}
> =20
> @@ -1064,7 +1087,7 @@ static int mipi_csis_log_status(struct v4l2_subdev =
*sd)
> =20
>  	mutex_lock(&state->lock);
>  	mipi_csis_log_counters(state, true);
> -	if (state->debug && (state->state & ST_POWERED))
> +	if (state->debug.debug && (state->state & ST_POWERED))
>  		mipi_csis_dump_regs(state);
>  	mutex_unlock(&state->lock);
> =20
> --=20
> Regards,
>
> Laurent Pinchart



