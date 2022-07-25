Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB6DB57F99C
	for <lists+linux-media@lfdr.de>; Mon, 25 Jul 2022 08:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbiGYGtq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 02:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiGYGtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 02:49:45 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF25BC08
        for <linux-media@vger.kernel.org>; Sun, 24 Jul 2022 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658731784; x=1690267784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cX9NUo7jfSmNegrtn5viBq7kMv6hgKvrseYKFNCwvDg=;
  b=aylLMwjfgwqVIRJIehx+8VDOT7ocsOQnWfyVGjWD2N+ix41iijDW+TIq
   NJKiVqKDhIujwo3n77xmDkMjWHKNWPezaR/4xtFHY3nu6vClwcY9yGnVU
   J8Hf8QBB/8XjUvqE/hqKonuG3fLfHXLlY7ZLhjsSsrlorbUCXfeEY+nBr
   kloaccBr85/pw9fwj9MutfOltTcJrTOtA5G+j71EBB/DVyDKcOPOOpkRV
   cHnD4n9xr6cXUSAAl8ngR+NjAo7ZM82UxpMiQytP8bOdRodMJ4oE8DxrP
   bFekRDUHP4shg4qWBXlxVtJhjTyDv8sDeaZQshZc5qLY6Z44yEyg6V1jf
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654552800"; 
   d="scan'208";a="25228214"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 25 Jul 2022 08:49:42 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 25 Jul 2022 08:49:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 25 Jul 2022 08:49:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658731782; x=1690267782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cX9NUo7jfSmNegrtn5viBq7kMv6hgKvrseYKFNCwvDg=;
  b=q+oqPsrR14yGCr985K0w8qDdS/+A/FMF5FtWAeE3NyQWwPT3a80zLbuI
   N5h9+sbNDWWYtGMLiosXuZlXSyVPtQyEoxPVgUryHn6h4c5em/ackjvi5
   n0Fc7tFtYNLyPOeQBxramCbdDNMv9mZN5/d6G9auume5nTn9JKBXQe/Sl
   dV4eNXdZXV9EZ85vcPuOXawnn1Q65yf8bKlsYpoKFnnVjp8Vw/F13vEyw
   fwYyrCQSnj841EHv9ablh61bhQVZQD/7qLZ+l8S83JHet2kHbRpMv/ISI
   WmEffI0wn4Sks2Op0RtggiZhzWgKogCgYONUvMU9Mw41lu8IeUIsBXeV3
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654552800"; 
   d="scan'208";a="25228213"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Jul 2022 08:49:42 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8D19F280056;
        Mon, 25 Jul 2022 08:49:42 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: Re: Re: [PATCH 07/19] media: i2c: imx290: Support variable-sized registers
Date:   Mon, 25 Jul 2022 08:49:40 +0200
Message-ID: <4728760.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Ytx+9f3y99EpQ5z5@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <Ytq2Qb04baTNy+I4@valkosipuli.retiisi.eu> <Ytx+9f3y99EpQ5z5@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent & Sakari,

Am Sonntag, 24. Juli 2022, 01:06:29 CEST schrieb Laurent Pinchart:
> Hi Sakari,
>=20
> On Fri, Jul 22, 2022 at 05:37:53PM +0300, Sakari Ailus wrote:
> > Hi Alexander,
> >=20
> > On Thu, Jul 21, 2022 at 01:43:54PM +0200, Alexander Stein wrote:
> > ...
> >=20
> > > Nice the following snippet does the trick already:
> > > ---8<---
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -221,6 +221,7 @@ static const struct imx290_pixfmt imx290_formats[=
] =3D
> > > {
> > >=20
> > >  static const struct regmap_config imx290_regmap_config =3D {
> > > =20
> > >         .reg_bits =3D 16,
> > >         .val_bits =3D 8,
> > >=20
> > > +       .use_single_read =3D true,
> > >=20
> > >  };
> > > =20
> > >  static const char * const imx290_test_pattern_menu[] =3D {
> > >=20
> > > ---8<---
> > >=20
> > > As this affects the VC OV9281 as well, any suggestions for a common
> > > property?>=20
> > If there's a 1:1 I=B2C mux in there between the host and the sensor, sh=
ould
> > it be in DT as well? I'm not entirely certain it's necessary.
>=20
> The microcontroller also the sensor clock and power supplies, so it has
> to be modelled in DT in any case. I was trying to avoid exposing it as
> an I2C mux, but maybe we'll have to bite the bullet...

What is the benefit about exposing a I2C mux? The needed regmap config opti=
on=20
is configured completely independent to this.

> I've implement support for two camera modules from Vision Components but
> haven't submitted patches yet. See [1] and [2] for DT examples and [3]
> for the driver that handles the microcontroller.
>=20
> Note that one purpose of the microcontroller is to configure the sensor
> automatically. It can be queried through I2C for a list of supported
> modes, and it can also reconfigure the sensor fully when a mode is
> selected. This is meant to enable development of a single driver that
> will cover all modules, regardless of which camera sensor it integrates.
> I'm not sure what words you will use to voice your opinion on this
> design, but I think I already agree :-)
>=20
> [1]
> https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/=
ne
> xt/arch/arm64/boot/dts/freescale/imx8mp-maivin-csi1-imx296.dts [2]
> https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/=
ne
> xt/arch/arm64/boot/dts/freescale/imx8mp-maivin-csi1-imx327.dts [3]
> https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/=
ne
> xt/drivers/media/i2c/vc-mipi.c
> > The property could be called e.g. "single-octet-read". I think this sho=
uld
> > probably be documented in I=B2C bindings (or even regmap).
>=20
> I like the idea of making it a DT property global to all I2C devices. It
> should ideally be parsed by the I2C core or by regmap.

I agree with adding this as a regmap option, like 'big-endian' & friends, b=
ut=20
not so much for I2C core. IMHO the core should only be interested in handli=
ng=20
messages and transfers. Setting up those correctly is a matter for drivers=
=20
(which in turn use regmap).

Best regards,
Alexander



