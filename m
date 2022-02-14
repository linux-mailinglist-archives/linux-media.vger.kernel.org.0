Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79DDF4B4CDF
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 12:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241940AbiBNLBu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 06:01:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350600AbiBNLBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 06:01:03 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B87B811AB
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 02:28:54 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id i19so7921018wmq.5
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:subject:from
         :to:cc:references:in-reply-to;
        bh=D2GsCZSXYLyBzTyJQdHmKSBWP2WQVnRLA/DkH4BgHkQ=;
        b=pRszNiZClGEGZFPz1pk6/24PR9vgxvwJBvtXvtBhYKxZIW9zn8ioeNdkQ3SX6+Y85q
         EW1LU6PPGlQGHTfuJj5DNxpRfhJvSER1wmPhVAKbc1qN8juatVyZ5S2vd/Di9WISPDDr
         oiQAWBwCh0K4W3P1h/ertGEIYv2TEhD4bKQLKFsvUr17JIsZi0tgqleo41rVgbxXvJcK
         ALbM1aP4gt/Hwxx2U6ttmRn1Es3xZb+lPXBG3w3jydY0oDiE8cb1RQ2FpHddkRQVq8NJ
         l9GPmen2EvlmeqtaWLMZ+0S4pu1EQ4gzY7qvxz2HFbDaQRDHEZ3ZPvZgGNRlZHju12z3
         afAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:subject:from:to:cc:references:in-reply-to;
        bh=D2GsCZSXYLyBzTyJQdHmKSBWP2WQVnRLA/DkH4BgHkQ=;
        b=K31KZUwTF4cEPctVdvC22pVYkO1Dyu07uZIbdeTSGU5LuTq1GNPieTjhmwodWwLdS7
         Gjmw71iZwqLEZsksfHre/+pQoWeNygmImSmqPj4+IE+/hUkHZ4kGPr4SzHejgklCO1a7
         URwFw6+OI7St+CgZJA6Zax9aHC4BxoySe//V9JIa9sezNB3vopfV0qnMDyNrQVlC4wVI
         cO2DW8T9EOqayqXQk9/KMv34JH7F7Jvxv0jayyf+OXdGgN7fgO7GFgiD/0H/FvAQwuYn
         kRDQlph87xu44ZTOnCn0/klGNG6DutYfFQgMEPJmJc1ZAXAbbf3N+GBg/k13eEL3cGyQ
         fymg==
X-Gm-Message-State: AOAM533WWGfj/tpsxLNOVRgM+TROpXg+t6Rxz3ffK6dL0wtIH3B8779J
        nSVuxSMwh04znZ5LUBqlsKY=
X-Google-Smtp-Source: ABdhPJx7qYUimsM7wq37Sr+0Dw1Xx7DQTnWQppErmyEqaqzXHb0aLvmBb45+LX5c8keLT1FPsManPA==
X-Received: by 2002:a05:600c:219a:: with SMTP id e26mr10359622wme.177.1644834533053;
        Mon, 14 Feb 2022 02:28:53 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id t1sm35072033wre.45.2022.02.14.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 02:28:52 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 14 Feb 2022 10:28:51 +0000
Message-Id: <CHVP6G7WQIJT.WVPQU6O1Y4OX@arch-thunder>
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Jacopo Mondi" <jacopo@jmondi.org>
Cc:     <slongerbeam@gmail.com>, <p.zabel@pengutronix.de>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <festevam@gmail.com>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <martin.kepplinger@puri.sm>,
        <xavier.roumegue@oss.nxp.com>, <kernel@pengutronix.de>,
        <linux-imx@nxp.com>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-3-jacopo@jmondi.org>
 <YgbKLDwyV6pYj8Fu@pendragon.ideasonboard.com>
In-Reply-To: <YgbKLDwyV6pYj8Fu@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Fri Feb 11, 2022 at 8:42 PM WET, Laurent Pinchart wrote:

> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, Feb 11, 2022 at 07:02:15PM +0100, Jacopo Mondi wrote:
> > Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.
> >=20
> > The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
> > specify a SoC version number in the driver name.
>
> I'm not against this, but I think we should then rename the symbols in
> the source code too. I don't mind keeping the current name if the rename
> causes too much churn.

I think Jacopo does that in the 3/3 patch in the source and I think he
cover all, since the main symbols namespace is mipi_csis and do not
include imx7 specifically.

Cheers,
   Rui

>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  MAINTAINERS                                                     | 2 +-
> >  .../media/platform/imx/{imx7-mipi-csis.c =3D> imx-mipi-csis.c}    | 0
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename drivers/media/platform/imx/{imx7-mipi-csis.c =3D> imx-mipi-csis=
.c} (100%)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5bdb8c881b0b..7def3b7d56bc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
> >  F:	Documentation/admin-guide/media/imx7.rst
> >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml

> > -F:	drivers/media/platform/imx/imx7-mipi-csis.c
> > +F:	drivers/media/platform/imx/imx-mipi-csis.c
> >  F:	drivers/staging/media/imx/imx7-media-csi.c
> > =20
> >  MEDIA DRIVERS FOR HELENE
> > diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/medi=
a/platform/imx/imx-mipi-csis.c
> > similarity index 100%
> > rename from drivers/media/platform/imx/imx7-mipi-csis.c
> > rename to drivers/media/platform/imx/imx-mipi-csis.c
>
> --=20
> Regards,
>
> Laurent Pinchart



