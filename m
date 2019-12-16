Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5B1120084
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 10:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfLPJCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 04:02:31 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39467 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726818AbfLPJCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 04:02:31 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 59F9D220E4;
        Mon, 16 Dec 2019 04:02:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 16 Dec 2019 04:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=PokdvDG1nIQ/VMznTA7Po0YeHU3
        1cRXWMuqHfQ3NJtg=; b=YJSTGTO4Tm5092gDSitpZ2D9YojwZmjpYQ4yf17WeaO
        S62neg2L+plGl78oORgNkUhdvAcnTUI78kAtBN5vmlOcBTBdOACbS55QMWs3277X
        oEvmsdeWirzh+FyxVrKfeea+pmRSPRScQGvoXjbWFquIhkV3vPfd5h/LZmz0jFI+
        dJeWiiBO+hpc7ieJCAcEiY91lmhM0ginH4bE3qgquYk9QlWRyHEFHywF4coSIwD8
        Dq9nWBVMvNnvTLSuqwirjBXNXhpP5dO+4J1uktdS9IdbOX2g9/wl1nuuOMqAhIWz
        kNGsCU0ogni6rvsUMSKDJzL9jt2Pbz8ZAuRkLxxR0RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PokdvD
        G1nIQ/VMznTA7Po0YeHU31cRXWMuqHfQ3NJtg=; b=COi/sBQnSthKVUVXnORwE3
        IIiNa3F9ZM630Nrca7TW7BqNOJrW6RREmN5/s11eBYP4Ixd0EopdkOAFFAODJ3N9
        6onFhrHDD0P0ZkzkCb2LW3ujbUepshk9VHvYrq6iaRs63CZ8rzRALudJ+QbhP8Ao
        pdVjND1Zgs3P93rH+P4YTmRmYC1pf2ZBfaPH4EdeRoGZ3MIBqDhcRv+tBTHZxciR
        mh/JH9GidEsKebWvExmvACpx7sm43gwA/UDTuRki2UZ08hQY/1M8UuKAtnBXz6SQ
        kFKYqZNKPKkLoDljTuxKNGGn5VvPoZP/pUSbY7UsZ7SRdBrK/v50OPnmtP4YLSNg
        ==
X-ME-Sender: <xms:JEj3XfO3DgPMWtkL0_tEqDpOSL3xmPJpJYXwChYdwvgeTsEuAVlqKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
    dtrdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegt
    vghrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:JEj3XS_aAcYxVdfoixy9pTNkh9pOkfOZhCyEI8dE8ASSDpMb5ouHBg>
    <xmx:JEj3XbDW5p1eeMEya66DYNNbWka8n2oswKd0aNKEJIehGg04Vi3EkA>
    <xmx:JEj3XSAQ0q1gaQSuE-mmcb6TV9JsOuAxBfBeT0rCLJHat8_SzQ1h1g>
    <xmx:JUj3XQ70tQjv19i7LTUiFBLM026EyZbjzFx8Zjsz9eQy-UkZJORuvA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DF7EC8005C;
        Mon, 16 Dec 2019 04:02:27 -0500 (EST)
Date:   Mon, 16 Dec 2019 10:02:25 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: media: Convert Allwinner hardware codec to
 a schema
Message-ID: <20191216090225.4lll6kpqbrba7ldf@gilmour.lan>
References: <20191213074055.26193-1-maxime@cerno.tech>
 <CAL_JsqLxGe9sWrTdZhuT69o_LBxQTi6TxcbT28WdC1gsPw5+fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m6uvfkvcj5remb43"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLxGe9sWrTdZhuT69o_LBxQTi6TxcbT28WdC1gsPw5+fQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--m6uvfkvcj5remb43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Fri, Dec 13, 2019 at 09:25:51AM -0600, Rob Herring wrote:
> On Fri, Dec 13, 2019 at 1:41 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The Allwinner SoCs have a hardware video codec that is supported in Linux,
> > with a matching Device Tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device tree
> > bindings for that controller over to a YAML schemas.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../allwinner,sun4i-a10-video-engine.yaml     | 83 +++++++++++++++++++
> >  .../devicetree/bindings/media/cedrus.txt      | 57 -------------
> >  2 files changed, 83 insertions(+), 57 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/cedrus.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> > new file mode 100644
> > index 000000000000..47c8513555b2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: GPL-2.0+
>
> Do you have rights to change the license (adding '+' aka '-or-later')?
> If so, please add BSD-2-Clause. I don't have any other comments, so
> just confirm and I can change it when applying.

That's a mistake, sorry. I'm not the original author, so I can't
change that license...

Maxime

--m6uvfkvcj5remb43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdIHAAKCRDj7w1vZxhR
xQt4AP4/p/4KNTdKVqnOZrFTUx14YJGw+5ype+Zlt96KJY2C/AEAnAjDE6yL/asL
hMgtOPL6fesvTr+8PmH7F+3mUWVRqww=
=bz4j
-----END PGP SIGNATURE-----

--m6uvfkvcj5remb43--
