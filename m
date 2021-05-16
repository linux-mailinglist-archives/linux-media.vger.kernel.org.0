Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A76382163
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 00:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhEPWBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 18:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhEPWBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 18:01:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A5AC061573
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 15:00:03 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id t206so2530887wmf.0
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=zSEPvwQkZnY3YAtbVukYOBSePKw7pWbvP3CC27b5no4=;
        b=DSPP4VS/7QCUvCQQhcrvRfN7G9cfE6L8tLFlEG2AutYGq+j/NgTnG+87McHw2fGD4d
         J+Ydo6Wf/3FryFjlNII5SnkrOGQiSgTfCyKmV95eE/RI2za6Wi/VCSAyrGtCpYlycFOz
         Fs0vY89BVneaLOMkJDaWrYtKJ7YCE0lanKzXTqsPYrf9zOpF7Od9dpuiN9YP860HMRJD
         n6s7B0USO5WXgdlyg2wNL7Yzzdie8XccNt4z0763637kyYOrwchcrF0yUzWWGtBc9RWa
         ptArPjJFoKsLL/OUE3Azeifjr/6WgoBXoGvFX4pZKcPdfkVShIcvWetysUwYYqmzSu1h
         ZPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=zSEPvwQkZnY3YAtbVukYOBSePKw7pWbvP3CC27b5no4=;
        b=ZqwVVQwelUClg3YRiVUk2GzLGXML+3VkFZeqRDbAT3cpOvNF5S+Rg/UKIFgZscgLh+
         lLfD1aSOY6UA1zArc3uf+FaPSLAEXxzUC4S9ly5PHHDz2CjIQHOcuCJXFo6tmIpSEsZK
         vl4Ko10h2X3zvik4RipJjcI5DB3AEsIXZWPxBiV1ncoqCHYDbI5S4GQV0r4w8d3vP8a9
         cH/fvMaoUsRF1M38TE2o/Mx/F6lrVhhlq5E6JYQHzxm52TWcrM1/NqeZWgENN5Uc4PuS
         MEF50ij1kIfzTZ0z1Cmm4RV2Et/Y/aD0NaVnbjpScXMLeT45mratQlOVLs8Z4nCHXeKf
         o18g==
X-Gm-Message-State: AOAM533ZjYuMcLVEQ9cFIDaO/9MRwZAcfc3BLexTkRNT+w8dTaQdXnmZ
        F16RSkIsqCqfVZWct9GSs0wHSw==
X-Google-Smtp-Source: ABdhPJxIGCCDXUBmHAif+GCCFQk9oRh9h6RY6dLzNjz8lUkeaNXo0JYPNGgc1r+yhsGg+J3wxEsJ5Q==
X-Received: by 2002:a1c:b7c4:: with SMTP id h187mr59808449wmf.178.1621202402048;
        Sun, 16 May 2021 15:00:02 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id u6sm12049417wml.6.2021.05.16.15.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:00:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Sun, 16 May 2021 23:00:00 +0100
Message-Id: <CBF0AD8YPF2S.5BDYYAWX4POX@arch-thunder>
Cc:     "Rui Miguel Silva" <rmfrfs@gmail.com>, <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>, <linux-imx@nxp.com>,
        "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Marek Vasut" <marex@denx.de>,
        "Frieder Schrempf" <frieder.schrempf@kontron.de>,
        "Marco Felsch" <m.felsch@pengutronix.de>,
        "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        "Tim Harvey" <tharvey@gateworks.com>
Subject: Re: [PATCH v2 22/25] media: imx: imx7_mipi_csis: Move PHY control
 to dedicated functions
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
 <20210516014441.5508-23-laurent.pinchart@ideasonboard.com>
 <YKCBBc9XEYCbb1kv@pendragon.ideasonboard.com>
In-Reply-To: <YKCBBc9XEYCbb1kv@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Sun May 16, 2021 at 3:18 AM WEST, Laurent Pinchart wrote:

> On Sun, May 16, 2021 at 04:44:38AM +0300, Laurent Pinchart wrote:
> > Move the PHY regulator and reset handling to dedicated functions. This
> > groups all related code together, and prepares for i.MX8 support that
> > doesn't require control of the PHY regulator and reset.
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>
> My apologies, this is a new patch in v2, and Rui hasn't acked it. I'll
> thus wait for acks and reviews before sending a pull request.

Looks good. Thanks for the heads up.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
>
> > ---
> >  drivers/staging/media/imx/imx7-mipi-csis.c | 64 +++++++++++++---------
> >  1 file changed, 38 insertions(+), 26 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/stagi=
ng/media/imx/imx7-mipi-csis.c
> > index 6e235c86e0aa..a8da8d6ddb7d 100644
> > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > @@ -457,25 +457,6 @@ static void mipi_csis_sw_reset(struct csi_state *s=
tate)
> >  	usleep_range(10, 20);
> >  }
> > =20
> > -static int mipi_csis_phy_init(struct csi_state *state)
> > -{
> > -	state->mipi_phy_regulator =3D devm_regulator_get(state->dev, "phy");
> > -	if (IS_ERR(state->mipi_phy_regulator))
> > -		return PTR_ERR(state->mipi_phy_regulator);
> > -
> > -	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
> > -				     1000000);
> > -}
> > -
> > -static void mipi_csis_phy_reset(struct csi_state *state)
> > -{
> > -	reset_control_assert(state->mrst);
> > -
> > -	msleep(20);
> > -
> > -	reset_control_deassert(state->mrst);
> > -}
> > -
> >  static void mipi_csis_system_enable(struct csi_state *state, int on)
> >  {
> >  	u32 val, mask;
> > @@ -679,6 +660,42 @@ static irqreturn_t mipi_csis_irq_handler(int irq, =
void *dev_id)
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > +/* -------------------------------------------------------------------=
----------
> > + * PHY regulator and reset
> > + */
> > +
> > +static int mipi_csis_phy_enable(struct csi_state *state)
> > +{
> > +	return regulator_enable(state->mipi_phy_regulator);
> > +}
> > +
> > +static int mipi_csis_phy_disable(struct csi_state *state)
> > +{
> > +	return regulator_disable(state->mipi_phy_regulator);
> > +}
> > +
> > +static void mipi_csis_phy_reset(struct csi_state *state)
> > +{
> > +	reset_control_assert(state->mrst);
> > +	msleep(20);
> > +	reset_control_deassert(state->mrst);
> > +}
> > +
> > +static int mipi_csis_phy_init(struct csi_state *state)
> > +{
> > +	/* Get MIPI PHY reset and regulator. */
> > +	state->mrst =3D devm_reset_control_get_exclusive(state->dev, NULL);
> > +	if (IS_ERR(state->mrst))
> > +		return PTR_ERR(state->mrst);
> > +
> > +	state->mipi_phy_regulator =3D devm_regulator_get(state->dev, "phy");
> > +	if (IS_ERR(state->mipi_phy_regulator))
> > +		return PTR_ERR(state->mipi_phy_regulator);
> > +
> > +	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
> > +				     1000000);
> > +}
> > +
> >  /* -------------------------------------------------------------------=
----------
> >   * Debug
> >   */
> > @@ -1178,7 +1195,7 @@ static int mipi_csis_pm_suspend(struct device *de=
v, bool runtime)
> >  	mutex_lock(&state->lock);
> >  	if (state->state & ST_POWERED) {
> >  		mipi_csis_stop_stream(state);
> > -		ret =3D regulator_disable(state->mipi_phy_regulator);
> > +		ret =3D mipi_csis_phy_disable(state);
> >  		if (ret)
> >  			goto unlock;
> >  		mipi_csis_clk_disable(state);
> > @@ -1204,7 +1221,7 @@ static int mipi_csis_pm_resume(struct device *dev=
, bool runtime)
> >  		goto unlock;
> > =20
> >  	if (!(state->state & ST_POWERED)) {
> > -		ret =3D regulator_enable(state->mipi_phy_regulator);
> > +		ret =3D mipi_csis_phy_enable(state);
> >  		if (ret)
> >  			goto unlock;
> > =20
> > @@ -1288,11 +1305,6 @@ static int mipi_csis_parse_dt(struct csi_state *=
state)
> >  				 &state->clk_frequency))
> >  		state->clk_frequency =3D DEFAULT_SCLK_CSIS_FREQ;
> > =20
> > -	/* Get MIPI PHY resets */
> > -	state->mrst =3D devm_reset_control_get_exclusive(state->dev, NULL);
> > -	if (IS_ERR(state->mrst))
> > -		return PTR_ERR(state->mrst);
> > -
> >  	return 0;
> >  }
> > =20
>
> --=20
> Regards,
>
> Laurent Pinchart



