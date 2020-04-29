Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C2F1BD78F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 10:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgD2IsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 04:48:18 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:37593 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726345AbgD2IsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 04:48:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id ABC72A2A;
        Wed, 29 Apr 2020 04:48:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 29 Apr 2020 04:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=wcrdqsNcPwVtovwXtckouIEc10K
        wvG5XzJ9jmHmMR34=; b=v0bP8FVPnComujsnhBi5tEXFAwqf6NMgtounAvPFAi3
        VDOVQdR0rzz9K3lMc+L4TQG8rFhoAamxcdtTtiVN8lRVrdQs0FurxA7xTo/dH0O0
        kgXFuge6ZLGyI5dsEzC24rRkIvpGFs2wa2o2PMD1Q4GvP1I+PpKdtxk+y/kNBzda
        MsL+y8ofFxDMzpn0aJ9BCpiyQhgodRb7/iHbmRxs1NFKmTQQ1YW0W4XgDdK++6F3
        FLUFQMb6+5LEDa5E4sBXh2S3txZRWF66gGjpb1JG91QU+LjOY14BTBFgfc8ZGZqv
        ReeNg+6ei0U2JqzwCRbtAenPUOy4Zq56HrYubdQR1Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wcrdqs
        NcPwVtovwXtckouIEc10KwvG5XzJ9jmHmMR34=; b=AbdbpevHQg58Vp9/JksvML
        JpFVc8LZovfA77OxghfwCmjKJfw9GNKxAQncq6+G58jgydC28HgNSRnjd7FgbaGS
        FIEboQoEDMxncUwJplGy+VcQ0P3zevmmgFSoayXvSjkznnpm9Spy9MpqHeleAjMj
        amNiBwbb7uXhSEX5aLRVAD7oMHCUkgmbRVrm7N/ZtAXnxgluzF1ue7rkwfy5zYUI
        gxebSyAz40Fosc6/xyn2eEldByg7eoEANXpguuOhK6IV0zbt3TmIuj94MKnhlqsN
        3D6Ry/PBj6xd8LEJzjaXUvRdz5wRP7XCTeQDXYmEk+vUoo+4p+72bXlqznjc0tVg
        ==
X-ME-Sender: <xms:Tz-pXoecD_ubgJ3FLfTu_KsnOwwNurdSojjIIQ0TW8TggrsZLg8bjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Tz-pXh1ockIj6T_SsmIrFJQjUQ00pQm7slOLEVCcBpq6rZiDOmoDNg>
    <xmx:Tz-pXptpxUoZ6U8rhPDyQ69rumqvs_mTNaclL_sL3tSyZX8XctUJIQ>
    <xmx:Tz-pXl8elV62J6lm6MKMuzW1pvi25wmBNz9kmyaT7RrVJqpMg0U8UQ>
    <xmx:UD-pXnzMOUhezOMD7dDNNdz_yLo4hg5xzBtVT2bNvpSxJQW_dEnpbNS72gc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1874A3065EE9;
        Wed, 29 Apr 2020 04:48:15 -0400 (EDT)
Date:   Wed, 29 Apr 2020 10:48:13 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v8 v5 1/3] media: dt-bindings: ov8856: Document YAML
 bindings
Message-ID: <20200429084813.j3pxcbzdmeywqym4@gilmour.lan>
References: <20200428180718.1609826-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zpihnrmips3hshsi"
Content-Disposition: inline
In-Reply-To: <20200428180718.1609826-1-robert.foss@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zpihnrmips3hshsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 08:07:16PM +0200, Robert Foss wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
>=20
> This patch adds documentation of device tree in YAML schema for the
> OV8856 CMOS image sensor.
>=20
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--zpihnrmips3hshsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqk/TQAKCRDj7w1vZxhR
xZpoAP42DgPROuzDTF5EuqRDWfCvMVhdg1sOirg+0fkdipMlpAD+Pb10jAPRj/tA
6bO2fdjmT1kcv5cAiQMmOGG+H4zeMQc=
=zN+J
-----END PGP SIGNATURE-----

--zpihnrmips3hshsi--
