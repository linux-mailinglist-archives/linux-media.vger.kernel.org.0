Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E91442F50F
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 16:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237269AbhJOOUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 10:20:31 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:56807 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237359AbhJOOU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 10:20:29 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id E8497580CF8;
        Fri, 15 Oct 2021 10:18:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 15 Oct 2021 10:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=2Pydx4B0wCZH7JQOFF9GBsc/2F8
        +/LhIG+iiOimz+hs=; b=AJWPxaoupeZvWHi1yBc3LVIEZWJFfCi53OSP8v8JJ+d
        88Y8jC1zszwXgk9Qz5neTy3YNWX7vmbCHO7Tgm39eC+vjsvWIRxkY9C0KngGC3I3
        2vv3eiyuQOrBzdM+cbHhcvETiRRw19yY5wskqqSuz36gOiNgXwi2zlN9kk+XpaEg
        wbWSla0JWtZCVamvtv+BK7thxj0j0MPXfK6gTZBHdngDwFNgSS2D1jIHQ1Yah3Hi
        PJJPKvCrP/JLWsCwQTkEiZ9ZWNAXBmeJrhUgVYy9QgdWIuLuKEXMMt9X1+bhWUfK
        7/8hZYt6R2fgBK5Y6mQ+AJLoVVQPjA3hSkVKsz+eB4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2Pydx4
        B0wCZH7JQOFF9GBsc/2F8+/LhIG+iiOimz+hs=; b=QQ47+82kgeMbwQpajBLKTN
        ZfPDd54jdcQJWFLWS5GehP8SHZk8jgYxpb4a1vero8m423+GYEv+Gq5QioHQTsRq
        J/UhdwDhfFiQGYRbb7Hr+iiNYjD92J3L7ae8n+6GiwUT3VQT3g+eI6kekVATLnAZ
        JZnAekU4YDIt8pldAxfltZyesIDyI4YBKbopi6GunWGoNmLu+V8on3fW1j0/ojv3
        x2mqldPTcbAmQMNoeL7VBWmXF2jetn429PW7VpHhDPyThEWWFE8JReFwJTU114oQ
        9mOFIu+rwhfbPHoFmys/RvH78Utwv/SS41neSclY6TG0/J7IUe3edHXV1qEPM7Mg
        ==
X-ME-Sender: <xms:rY1pYTG-K4VdvnPOqqVMreTM0w3W-zNcVTNQbPH_wzSMtPFb6Z9sjQ>
    <xme:rY1pYQUdohtLQmby6tieFNbmb--im1f15KCkxy9xvX8vsAj9Vo6BFNHtWBnW77e15
    puo4iv6sOihzC70_Fs>
X-ME-Received: <xmr:rY1pYVIxFXh7mI0N25-H_HFTGFegBZsJAmUVfWw9RDUvLDXH0luxOc16QXlUdtux_Fr_YGX2rU5A6S-G5Mj3cIHlx8E0JrHvFvNZUrQx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleeiudeileekueetkeeuffeugeeguddthefhhefftdffffeguedugffggfet
    lefhnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rY1pYREY0QNhlF6u-r1YyVfkDzPY4QP5lyHQMINiylTjBtgYjrZ50g>
    <xmx:rY1pYZVJlqW5OYGkGABh6lI-Sm318RMctTQeGbUIOrTGC2I_GSXZGg>
    <xmx:rY1pYcPOWxPlcBaztCt8f7wNREebpee-plT1ykAbJ5XyY1n05rgORQ>
    <xmx:rY1pYRRfEP9Cj77MnXKh5PRAAsP-fDwywh3fEr4ZsSpBRRVFFQIxWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 10:18:20 -0400 (EDT)
Date:   Fri, 15 Oct 2021 16:18:18 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: media: Convert OV5640 binding to a schema
Message-ID: <20211015141818.n5unxbpqxcknste6@gilmour>
References: <20211015072830.8580-1-maxime@cerno.tech>
 <1634305980.862848.1429889.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sj2tugj32k4abq3u"
Content-Disposition: inline
In-Reply-To: <1634305980.862848.1429889.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sj2tugj32k4abq3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 15, 2021 at 08:53:00AM -0500, Rob Herring wrote:
> On Fri, 15 Oct 2021 09:28:30 +0200, Maxime Ripard wrote:
> > The Omnivision OV5640 is supported by Linux thanks to its device tree
> > binding.
> >=20
> > Now that we have the DT validation in place, let's convert the device
> > tree bindings for that driver over to a YAML schema.
> >=20
> > Cc: linux-media@vger.kernel.org
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Steve Longerbeam <slongerbeam@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> >=20
> > Changes from v2:
> >   - Fix whitespace error
> >   - Changed schema referenced for the port validation
> > ---
> >  .../devicetree/bindings/media/i2c/ov5640.txt  |  92 -----------
> >  .../bindings/media/i2c/ovti,ov5640.yaml       | 154 ++++++++++++++++++
> >  2 files changed, 154 insertions(+), 92 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.=
txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov=
5640.yaml
> >=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a/ti,cal.example.dt.yaml: camera-sensor@3c: 'AVDD-supply' is a required pro=
perty
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree=
/bindings/media/i2c/ovti,ov5640.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a/ti,cal.example.dt.yaml: camera-sensor@3c: 'DVDD-supply' is a required pro=
perty
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree=
/bindings/media/i2c/ovti,ov5640.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a/ti,cal.example.dt.yaml: camera-sensor@3c: 'DOVDD-supply' is a required pr=
operty
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree=
/bindings/media/i2c/ovti,ov5640.yaml
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/patch/1541399
>=20
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.

This warning can be ignored, it's fixed already in
e978d5271f7138b6d7c1dd90fe1b5492bc594b8b, which is part of linux-next
already and has been merged by Rob.

Maxime


--sj2tugj32k4abq3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYWmNqgAKCRDj7w1vZxhR
xQCUAP4jilBF6RKMIOaVPH1RsEyw+9jbqvgbR4WpsVLUYSQYiAEAxUOuH9hBqThl
nnf4+8MWGeica/31IIs4oHHY4HwtIwc=
=ix8c
-----END PGP SIGNATURE-----

--sj2tugj32k4abq3u--
