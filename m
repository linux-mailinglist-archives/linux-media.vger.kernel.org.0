Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDBE59D1E1
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 09:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240571AbiHWHTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 03:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240547AbiHWHTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 03:19:39 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753BD61D9A
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 00:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1661239178; x=1692775178;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pmYO8cCS7jam5hLD1pcOkLgWHVnYxYIOLBwAZfW2TlM=;
  b=iesxVC+d1PYv4HhgLdvI45NTvB/wU9aWingM7hM2OgWGVhrCQukOowN1
   vgJOSmNHyIa2YWiglOpjZxNiy6za/XQFBsJcdkxThoXqAZ1hZbvfLxvK7
   VKXHpo/XwWm5eDrqYwkGwuG2pRJCnnIiZpLqnfr5023WfWN6K+0i1eina
   lzWy5hiLZwkGR3IvumDJzaPM+HQU+Vn60VkBI/KqY7E+EV/mLq0zZBDb3
   eS7Acfndy2FtBk6uUGUX+YA3KdWWawt0RynzOaZBfnvROrj6Wa4vA7MTB
   A30RZH2j743xwdYrWD7OlyOtCyToKEgYAZOyViGNuQXTEsYL4a1RLOs5N
   g==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654552800"; 
   d="scan'208";a="25746067"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Aug 2022 09:19:36 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 23 Aug 2022 09:19:36 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 23 Aug 2022 09:19:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1661239176; x=1692775176;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=pmYO8cCS7jam5hLD1pcOkLgWHVnYxYIOLBwAZfW2TlM=;
  b=BrXSNqFX10uBu/fTCeQfwk6zL8rg+xHXbQBqWOgwXqGJkeoSyTFOlNBK
   zD30z4COJVR2jiwczU4V9U/myiyXSo0b6t6Cb/XrpUXxOQ+FBeZ+Vq/7P
   erLvPxHNce2M4DZwQIuKToVYbKTyVXwbvFChk/Pr90vZlni2MozrS1Ao9
   njlY8tSA9WGngnImSxEyPoNiSMKN+XpoKjN2EYIInXx+Gbez7NVOxwoyH
   iCqs1XvZtPmLE2T7et2FNfuDjps/X491JTYYVWnvOBdyO2iyfVOguAiZ5
   314/H09lD5W3VSb8I3YF6BXD+djO5w9WsdqsTlC8en2Y/VGxhQ4/oDBuQ
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654552800"; 
   d="scan'208";a="25746066"
Subject: Re: Re: Re: Re: [PATCH 07/19] media: i2c: imx290: Support variable-sized
 registers
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Aug 2022 09:19:36 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6C98B280056;
        Tue, 23 Aug 2022 09:19:36 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Date:   Tue, 23 Aug 2022 09:19:36 +0200
Message-ID: <2761166.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YwRAqFwgPy6rmuD7@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <YwQog5af3QY32Ywn@pendragon.ideasonboard.com> <YwRAqFwgPy6rmuD7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

Am Dienstag, 23. August 2022, 04:51:20 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> On Tue, Aug 23, 2022 at 04:08:20AM +0300, Laurent Pinchart wrote:
> > On Mon, Jul 25, 2022 at 08:49:40AM +0200, Alexander Stein wrote:
> > > Am Sonntag, 24. Juli 2022, 01:06:29 CEST schrieb Laurent Pinchart:
> > > > On Fri, Jul 22, 2022 at 05:37:53PM +0300, Sakari Ailus wrote:
> > > > > On Thu, Jul 21, 2022 at 01:43:54PM +0200, Alexander Stein wrote:
> > > > > ...
> > > > >=20
> > > > > > Nice the following snippet does the trick already:
> > > > > > ---8<---
> > > > > > --- a/drivers/media/i2c/imx290.c
> > > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > > @@ -221,6 +221,7 @@ static const struct imx290_pixfmt
> > > > > > imx290_formats[] =3D
> > > > > > {
> > > > > >=20
> > > > > >  static const struct regmap_config imx290_regmap_config =3D {
> > > > > > =20
> > > > > >         .reg_bits =3D 16,
> > > > > >         .val_bits =3D 8,
> > > > > >=20
> > > > > > +       .use_single_read =3D true,
> > > > > >=20
> > > > > >  };
> > > > > > =20
> > > > > >  static const char * const imx290_test_pattern_menu[] =3D {
> > > > > >=20
> > > > > > ---8<---
> > > > > >=20
> > > > > > As this affects the VC OV9281 as well, any suggestions for a
> > > > > > common
> > > > > > property?
> > > > >=20
> > > > > If there's a 1:1 I=B2C mux in there between the host and the sens=
or,
> > > > > should
> > > > > it be in DT as well? I'm not entirely certain it's necessary.
> > > >=20
> > > > The microcontroller also the sensor clock and power supplies, so it
> > > > has
> > > > to be modelled in DT in any case. I was trying to avoid exposing it=
 as
> > > > an I2C mux, but maybe we'll have to bite the bullet...
> > >=20
> > > What is the benefit about exposing a I2C mux? The needed regmap config
> > > option is configured completely independent to this.
> >=20
> > If the I2C mux in the camera module messes up I2C transfers, the related
> > quirks need to be handled somewhere, and a specific mux driver device in
> > DT could be a good place to report that. There may be other options
> > though.

=46rom a logical point of view, a i2c mux seems to be correct, but in the e=
nd=20
this quirk is handled by regmap which parses device specific properties.
Adding a (mux) bus property which is applied to all devices seems to be a=20
hassle, IMHO.
Taking Sakari's suggestion of 'single-octet-read' property where in the DT=
=20
bindings this should be added?

> > > > I've implement support for two camera modules from Vision Components
> > > > but
> > > > haven't submitted patches yet. See [1] and [2] for DT examples and =
[3]
> > > > for the driver that handles the microcontroller.
> > > >=20
> > > > Note that one purpose of the microcontroller is to configure the
> > > > sensor
> > > > automatically. It can be queried through I2C for a list of supported
> > > > modes, and it can also reconfigure the sensor fully when a mode is
> > > > selected. This is meant to enable development of a single driver th=
at
> > > > will cover all modules, regardless of which camera sensor it
> > > > integrates.
> > > > I'm not sure what words you will use to voice your opinion on this
> > > > design, but I think I already agree :-)
> > > >=20
> > > > [1]
> > > > https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/de=
v/
> > > > isp/next/arch/arm64/boot/dts/freescale/imx8mp-maivin-csi1-imx296.dts
> > > > [2]
> > > > https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/de=
v/
> > > > isp/next/arch/arm64/boot/dts/freescale/imx8mp-maivin-csi1-imx327.dts
> > > > [3]
> > > > https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/de=
v/
> > > > isp/next/drivers/media/i2c/vc-mipi.c> > >=20
> > > > > The property could be called e.g. "single-octet-read". I think th=
is
> > > > > should
> > > > > probably be documented in I=B2C bindings (or even regmap).
> > > >=20
> > > > I like the idea of making it a DT property global to all I2C device=
s.
> > > > It
> > > > should ideally be parsed by the I2C core or by regmap.
> > >=20
> > > I agree with adding this as a regmap option, like 'big-endian' &
> > > friends, but not so much for I2C core. IMHO the core should only be
> > > interested in handling messages and transfers. Setting up those
> > > correctly is a matter for drivers (which in turn use regmap).
> >=20
> > I don't want to polute a large number of sensor drivers because of
> > questionable design decisions of a particular module vendor. This type
> > of quirk needs to be handled outside of the sensor driver.
>=20
> Given that the chip ID is only read to print it to the kernel log, and
> that an incorrectly read ID will not prevent the driver from probing or
> affect its behaviour in any way, would you object to merging this patch,
> with the single read issue to support the Vision Components module being
> handled later ?

No objection here. This problem is and should stay outside of the sensor=20
driver. VC platform integration is an additional step.

Best regards,
Alexander



