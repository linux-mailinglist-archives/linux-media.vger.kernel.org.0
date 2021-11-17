Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51DA454C12
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 18:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239471AbhKQRjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 12:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbhKQRjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 12:39:52 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F58FC061570;
        Wed, 17 Nov 2021 09:36:53 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso5435722wms.3;
        Wed, 17 Nov 2021 09:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=B37VhRVH10DOHJycHWYpGnJNBeThOeAwxJtJbpn+pOA=;
        b=aY8ibj+wSmOT66sGlmL064kCsv5vmrnIi4bh6qKJtinz/VT3fxoXM3Xvc0qkiRjYTt
         CU6ePRO2eyppOw6kC2csU/UbjpsyfCqqDzCAKWBSXEyPIl25SxAUpDgX8MQ324gdK0Ci
         ZcQdqss+mj+0SfysJyA8nXbWG1tGZeEbSDQW6sGNQKZ0i8QRleUjTGNffCnsSERjIeTI
         cmqEoHCK2hBO95ZGZManQ9Xn4mrEcFEUpkK/e6uTyPQxBuB8d+8j1zv9gMvYXEhdQb3v
         Hor/0/KqUrFxsnEHSSf9cxMNZERgbLPebls5toNW9rYgAmex6hx+ZsV8rDk6lNp5nUuN
         /PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=B37VhRVH10DOHJycHWYpGnJNBeThOeAwxJtJbpn+pOA=;
        b=IQBrydCEDnLFCiOraFESQi4xM1RfcfK/06CLajlDs5QN4JB1LylpW28k5/F5anjF8g
         ECyiMMw+nZ4BNcwW4kirizesrNnDEvvf45iZZnbShWp+ck7BcGkpp/V3703vw2QVb4PF
         bpAMYT7HsniLzNixgk5iH3o3t3+OGYrIqXjyzKVCsamKC90c2cuLfPqgYJNc4g9aFzgm
         OMMxCATh39qCf/Rr/UaoheeCh6B2cH5yV8GQ/pARFLHrCst3at/fp+6uh3QL1BWtJsr+
         RP/q7wvAq/40mhQF819LmkBIA2Gfi8JM0U/5BEpq1UNcS4PrBdYREWbJABKex4pOUAJW
         YhrQ==
X-Gm-Message-State: AOAM531ORoA6aIqi2jBV7LLjYr/GqGnxi1lWsOzMSPT+nswgAV5ia8wf
        qUL2JsMG0zOM748GqHdwraA=
X-Google-Smtp-Source: ABdhPJytf89XaaxDLsXJ/Dwa6PPoNM34lhDNxYFolzEEHjbvSdqx3GRCciK9+Peogg4gD9Twa/+rfw==
X-Received: by 2002:a05:600c:1e8d:: with SMTP id be13mr1638199wmb.79.1637170611869;
        Wed, 17 Nov 2021 09:36:51 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id w4sm448173wrs.88.2021.11.17.09.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 09:36:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 17 Nov 2021 17:36:49 +0000
Message-Id: <CFS8JN8RKHL1.HM7182TDYAR0@arch-thunder>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        <mchehab@kernel.org>, <robh@kernel.org>, <shawnguo@kernel.org>,
        <kernel@pengutronix.de>, <kernel@puri.sm>, <linux-imx@nxp.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: imx: imx7-media-csi: add support for imx8mq
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <20211117092710.3084034-1-martin.kepplinger@puri.sm>
 <CFS51AQQ7SCD.7FK8RLAWLXRH@arch-thunder>
 <YZU5C0E3WBd7VLS2@pendragon.ideasonboard.com>
In-Reply-To: <YZU5C0E3WBd7VLS2@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Wed Nov 17, 2021 at 5:16 PM WET, Laurent Pinchart wrote:

> On Wed, Nov 17, 2021 at 02:51:48PM +0000, Rui Miguel Silva wrote:
> > Hi Martin,
> > Thanks for the patch.
> >=20
> > On Wed Nov 17, 2021 at 9:27 AM WET, Martin Kepplinger wrote:
> >=20
> > > Modeled after the NXP driver mx6s_capture.c that this driver is based=
 on,
> > > imx8mq needs different settings for the baseaddr_switch mechanism. De=
fine
> > > the needed bits and set that for imx8mq.
> > >
> > > Without these settings, the system will "sometimes" hang completely w=
hen
> > > starting to stream (the interrupt will never be called).
>
> Do we know why ? Are all the bits that you set required ?
>
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > ---
> > >  drivers/staging/media/imx/imx7-media-csi.c | 34 ++++++++++++++++++++=
--
> > >  1 file changed, 32 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/sta=
ging/media/imx/imx7-media-csi.c
> > > index 2288dadb2683..8619cf2fc694 100644
> > > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/interrupt.h>
> > >  #include <linux/mfd/syscon.h>
> > >  #include <linux/module.h>
> > > +#include <linux/of_device.h>
> > >  #include <linux/of_graph.h>
> > >  #include <linux/pinctrl/consumer.h>
> > >  #include <linux/platform_device.h>
> > > @@ -122,6 +123,10 @@
> > >  #define BIT_DATA_FROM_MIPI		BIT(22)
> > >  #define BIT_MIPI_YU_SWAP		BIT(21)
> > >  #define BIT_MIPI_DOUBLE_CMPNT		BIT(20)
> > > +#define BIT_MASK_OPTION_FIRST_FRAME	(0 << 18)
> > > +#define BIT_MASK_OPTION_CSI_EN		(1 << 18)
> > > +#define BIT_MASK_OPTION_SECOND_FRAME	(2 << 18)
> > > +#define BIT_MASK_OPTION_ON_DATA		(3 << 18)
> > >  #define BIT_BASEADDR_CHG_ERR_EN		BIT(9)
> > >  #define BIT_BASEADDR_SWITCH_SEL		BIT(5)
> > >  #define BIT_BASEADDR_SWITCH_EN		BIT(4)
> > > @@ -154,6 +159,12 @@
> > >  #define CSI_CSICR18			0x48
> > >  #define CSI_CSICR19			0x4c
> > > =20
> > > +enum imx_soc {
> > > +	IMX6UL =3D 0,
> > > +	IMX7,
> > > +	IMX8MQ,
> >=20
> > maybe instead of this enum we could use a bool in structure...
>
> An enum would be more extensible, but we shouldn't define different
> values for IMX6UL and IMX7 if they're compatible. Maybe an enum
> imx_csi_model with two values (IMX_CSI_IMX7 and IMX_CSI_IMX8MQ ?).

If there are only 2 possible values, for now, I think a enum would be
overkill. But do not have a strong feeling about it. So, an enum it is
more extensible and ok too, but with the IMX_CSI or even better=20
IMX7_CSI prefix.

>
> Are there other SoCs in the i.MX8 family that require this ? The BSP
> driver sets the baseaddr switch mechanism for i.MX8MM too, but it seems
> to work fine without it.
>
> > >+};
> > > +
> > >  struct imx7_csi {
> > >  	struct device *dev;
> > >  	struct v4l2_subdev sd;
> > > @@ -189,6 +200,8 @@ struct imx7_csi {
> > >  	bool is_csi2;
> > > =20
> > >  	struct completion last_eof_completion;
> > > +
> > > +	enum imx_soc type;
> >=20
> > here, bool is_imx8mq?
> >=20
> > >  };
> > > =20
> > >  static struct imx7_csi *
> > > @@ -537,6 +550,16 @@ static void imx7_csi_deinit(struct imx7_csi *csi=
,
> > >  	clk_disable_unprepare(csi->mclk);
> > >  }
> > > =20
> > > +static void imx8mq_baseaddr_switch(struct imx7_csi *csi)
> >=20
> > I think this function needs a better name. First add the imx7_csi
> > prefix that all functions have, and also you are setting it specific
> > to second frame and the function should not be specific to imx8.
> >=20
> > maybe something:
> >=20
> > imx7_csi_write_on_second_frame_enable, maybe?
> >=20
> > > +{
> > > +	u32 cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
> > > +
> > > +	cr18 |=3D BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> > > +		BIT_BASEADDR_CHG_ERR_EN;
> > > +	cr18 |=3D BIT_MASK_OPTION_SECOND_FRAME;
> > > +	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
> > > +}
> > > +
> > >  static void imx7_csi_enable(struct imx7_csi *csi)
> > >  {
> > >  	/* Clear the Rx FIFO and reflash the DMA controller. */
> > > @@ -551,7 +574,11 @@ static void imx7_csi_enable(struct imx7_csi *csi=
)
> > > =20
> > >  	/* Enable the RxFIFO DMA and the CSI. */
> > >  	imx7_csi_dmareq_rff_enable(csi);
> > > +
> >=20
> > unrelated new line.
> >=20
> > >  	imx7_csi_hw_enable(csi);
> > > +
> > > +	if (csi->type =3D=3D IMX8MQ)
> > > +		imx8mq_baseaddr_switch(csi);
> >=20
> > change this to new types and names?
> >=20
> > >  }
> > > =20
> > >  static void imx7_csi_disable(struct imx7_csi *csi)
> > > @@ -1155,6 +1182,8 @@ static int imx7_csi_probe(struct platform_devic=
e *pdev)
> > >  	if (IS_ERR(csi->regbase))
> > >  		return PTR_ERR(csi->regbase);
> > > =20
> > > +	csi->type =3D (enum imx_soc)of_device_get_match_data(&pdev->dev);
> >=20
> > here something:
> >         csi->is_imx8mq =3D of_device_is_compatible(np, "fsl,imx8mq-csi"=
);
> >
> > > +
> > >  	spin_lock_init(&csi->irqlock);
> > >  	mutex_init(&csi->lock);
> > > =20
> > > @@ -1249,8 +1278,9 @@ static int imx7_csi_remove(struct platform_devi=
ce *pdev)
> > >  }
> > > =20
> > >  static const struct of_device_id imx7_csi_of_match[] =3D {
> > > -	{ .compatible =3D "fsl,imx7-csi" },
> > > -	{ .compatible =3D "fsl,imx6ul-csi" },
> > > +	{ .compatible =3D "fsl,imx8mq-csi", .data =3D (void *)IMX8MQ },
> >=20
> > and with the above you should not need to add the data field here.
>
> I like match data personally (especially if we keep a device model
> enum). This is exactly what match data has been designed for, to avoid
> is_compatible() checks.

agree.

Many thanks Laurent,
------
Cheers,
     Rui
>
> > > +	{ .compatible =3D "fsl,imx7-csi", .data =3D (void *)IMX7 },
> > > +	{ .compatible =3D "fsl,imx6ul-csi", .data =3D (void *)IMX6UL },
> > >  	{ },
> > >  };
> > >  MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
>
> --=20
> Regards,
>
> Laurent Pinchart



