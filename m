Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C775C1CD5A8
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 11:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgEKJtT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 05:49:19 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50167 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728209AbgEKJtS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 05:49:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 16EDC580127;
        Mon, 11 May 2020 05:49:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 11 May 2020 05:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=AFDLytZLwrAWtNS6DftLVcVEIvL
        2Q1JHb78PJuPzU/M=; b=Uvm5+q5OsZm2v0RMLRdSFFCJo7uBUm6w9n26rAXCE+B
        f7fuiytA91+yrBL92MjnHgURaATHNuP6+l9ph1omHb5SKDpMCMH4PinGNSzSDzR5
        7p/0UtSDpXs15ibFeRX7gDFcOmk44bbNLsXwFFy0TxhWCk/T5DJGJwjgnPc1Ds9L
        bdtg4wdBizph2hQ3GvNT2pGESoN6kv749kiFNRpsj4HSmddVlAowVueSvPpY1CHQ
        W62rABcYmdpaOqJmXx+dyNsVBaybCRIusPE0Buzp3vFJtWvVTN637mA4Cwpz5ZOu
        OtlvsQXd6Ukb8w77TUW67IazNoRzHAbsicrXkbXIaOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AFDLyt
        ZLwrAWtNS6DftLVcVEIvL2Q1JHb78PJuPzU/M=; b=ckkifgXt+nysktk4wv6UV6
        1gbPDRcIH2cD3SJ8roY9Y6hEddLlw+JW1MM7JgKdkmi2tWecPdoHssB7VWpaUbjI
        XmZdkswIvB2KqkZxzb+NVbrtKfywS5CrFEqCZ3mWLrf17cMGFN+kJX+8qc00InmS
        eOY4pkSeWKiJEVqBPvb8grtgH6YGoRMKoZ3EgZe+fQVjRq5H62fx5b2AVSmDG0Hy
        520cbYNJn2v0LgU932TL27NbPDbj2tvoiMzr/Exuq2j+lwdJ9A9Eoud4V3NSOLd5
        iIthU6k/5cwscP2sdALnb9DC4AncuypWH8ODQDIzEMTHo4bZK6r30hwJkmq2IBNA
        ==
X-ME-Sender: <xms:mh-5XqruMGqX-eu2ARjQhmI5xCT7GS__lszJB6LLkuJmcB_GRebGVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledtgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mh-5XoUcdSeueLFnBPD-uw5IlFrUgKX8oHEcpRcfPf0Dp3eVEl6xtA>
    <xmx:mh-5Xq0okQc7pvI4nbMsz10hkUPpuEoh-AhCdE4hmlDPZG7_vd7ZLg>
    <xmx:mh-5XlsDJCCL641W3VBXHe3o_A2KbVYymUGjW4ayScl2SdkUQdxozg>
    <xmx:nR-5Xn4bRiNIsYfFIbrgL2QYKPtVSj2XizXlI7Qrpn4qYhibzd4Htg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A216F328005A;
        Mon, 11 May 2020 05:49:14 -0400 (EDT)
Date:   Mon, 11 May 2020 11:49:13 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-sunxi@googlegroups.com,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v2 2/2] media: cedrus: Implement runtime PM
Message-ID: <20200511094913.g6mcaq7gmg23zjar@gilmour.lan>
References: <20200422040410.6251-1-samuel@sholland.org>
 <20200422040410.6251-2-samuel@sholland.org>
 <CAAEAJfBdRVZwvEZNU_Hu4eutOO5HJzLLU2HJ2OcP=L+pBZfiTg@mail.gmail.com>
 <e3bba831-f835-d35b-58a3-c4b6b22c8949@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7huedradtlhh76dw"
Content-Disposition: inline
In-Reply-To: <e3bba831-f835-d35b-58a3-c4b6b22c8949@sholland.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--7huedradtlhh76dw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2020 at 03:03:55PM -0500, Samuel Holland wrote:
> On 5/5/20 7:53 AM, Ezequiel Garcia wrote:
> > On Wed, 22 Apr 2020 at 01:00, Samuel Holland <samuel@sholland.org> wrot=
e:
> >>
> >> This allows the VE clocks and PLL_VE to be disabled most of the time.
> >> A runtime PM reference is held while streaming.
> >>
> >> Originally-by: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>
> >=20
> > Originally-by is not documented, perhaps just go with Signed-off-by,
> > as Jernej suggested.
> >=20
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>
> >> v2: moved PM reference to cedrus_{start,stop}_streaming, based on an
> >>     earlier patch by Jernej Skrabec. Removes the need for autosuspend.
> >>     I tested this with running 2x v4l2-request-test in parallel.
> >>
> >> ---
> >>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
> >>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 106 ++++++++++++------
> >>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
> >>  .../staging/media/sunxi/cedrus/cedrus_video.c |  33 ++++--
> >>  4 files changed, 104 insertions(+), 45 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus.c
> >> index 05a85517ff60..bc27f9430eeb 100644
> >> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> >> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> >> @@ -16,6 +16,7 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of.h>
> >> +#include <linux/pm.h>
> >>
> >>  #include <media/v4l2-device.h>
> >>  #include <media/v4l2-ioctl.h>
> >> @@ -551,12 +552,18 @@ static const struct of_device_id cedrus_dt_match=
[] =3D {
> >>  };
> >>  MODULE_DEVICE_TABLE(of, cedrus_dt_match);
> >>
> >> +static const struct dev_pm_ops cedrus_dev_pm_ops =3D {
> >> +       SET_RUNTIME_PM_OPS(cedrus_hw_suspend,
> >> +                          cedrus_hw_resume, NULL)
> >> +};
> >> +
> >>  static struct platform_driver cedrus_driver =3D {
> >>         .probe          =3D cedrus_probe,
> >>         .remove         =3D cedrus_remove,
> >>         .driver         =3D {
> >>                 .name           =3D CEDRUS_NAME,
> >>                 .of_match_table =3D of_match_ptr(cedrus_dt_match),
> >> +               .pm             =3D &cedrus_dev_pm_ops,
> >>         },
> >>  };
> >>  module_platform_driver(cedrus_driver);
> >> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_hw.c
> >> index daf5f244f93b..1744e6fcc999 100644
> >> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> >> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> >> @@ -19,6 +19,7 @@
> >>  #include <linux/dma-mapping.h>
> >>  #include <linux/interrupt.h>
> >>  #include <linux/clk.h>
> >> +#include <linux/pm_runtime.h>
> >>  #include <linux/regmap.h>
> >>  #include <linux/reset.h>
> >>  #include <linux/soc/sunxi/sunxi_sram.h>
> >> @@ -140,6 +141,64 @@ static irqreturn_t cedrus_irq(int irq, void *data)
> >>         return IRQ_HANDLED;
> >>  }
> >>
> >> +int cedrus_hw_suspend(struct device *device)
> >> +{
> >> +       struct cedrus_dev *dev =3D dev_get_drvdata(device);
> >> +
> >> +       reset_control_assert(dev->rstc);
> >> +
> >> +       clk_disable_unprepare(dev->ram_clk);
> >> +       clk_disable_unprepare(dev->mod_clk);
> >> +       clk_disable_unprepare(dev->ahb_clk);
> >> +
> >=20
> > You can use clk_bulk API here.
>=20
> Since this change is already tested, I'd prefer to do that as a separate
> patch.

Given that those three clocks are also pretty different from a semantic poi=
nt of
view, I'm not sure it's wise to switch to the bulk API anyway.

Maxime

--7huedradtlhh76dw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXrkfmQAKCRDj7w1vZxhR
xUgWAP475V+7CuCjiCo2hfLc1qvsVn92Yy/nTm4A9bJS8+oKvwD/eNmxqGe8EaXn
wGIEJR5YrOpOK0VckZQzMe2av1+1UAw=
=ZpSw
-----END PGP SIGNATURE-----

--7huedradtlhh76dw--
