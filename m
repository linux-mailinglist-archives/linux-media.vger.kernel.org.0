Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61742A26C9
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 10:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgKBJRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 04:17:43 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:53477 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727870AbgKBJRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 04:17:42 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5882E58016F;
        Mon,  2 Nov 2020 04:17:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 02 Nov 2020 04:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=tRRcWPfLlcFd2I7QGyWsS+7dvdI
        OTZe+96Cma1Ta4CQ=; b=cL3G91KomNggWKjP+ee8mXpLK4G1z9pJ8bTx5eXKhis
        GamLNW5oJtfQL0KtTKdk4XkprWZy/NilCX9Oy4p0HgelbPXJ4UUmx/34oIMv0ly1
        LN8unJdsZ05w4OZpPpO1R5o3JqESgXEEXJ7h6bQep0+tWmBwunfBU5E2JKqpCABa
        GwSBhcMVfJaSut73Z493aIU/QumPfhV+8YapZbkfC5sMOVSGvRQkx5yUkhB5ZnLc
        +jpyblW9JgwtPgqgQMSs4u0SWqvE9a582+EMUeAu3/T/KG3ju2Cn4Cn1dlgVGr7R
        q36fwpDgg/WtYNZC+EUYIk5nX9gTB6nKh250LgSG5VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tRRcWP
        fLlcFd2I7QGyWsS+7dvdIOTZe+96Cma1Ta4CQ=; b=l8qcekuw3PsZNepLpODZWn
        LhdpoORDReM4sQkchoftknnU6XmVE/up2/vmwIG3v0gYyejTScLCD1mt5MkfgDyQ
        l9431eQQOP6dbWZdljCqyesRT5DO0nL7bNmI5UfOUB/oECEyR7pN9F8SeECBRNd7
        CWyfsEJ5QQvYCu2W5gH9ay9IJHSkjz2B3XhXJiltRIK+hnvaAN3fbdehd2br5Grg
        ksHwf5gj0R9ttQdkCQRl+R41qnGZxmRIjqC/fV7rVQ5ErtQ0vg5h14nbyC+gph2H
        CYRhLqvU2dCG1yBIs2cTPCp25H7bcd+ZDaVVCVJfs77I3WlW6tSbYe5altqJxvWw
        ==
X-ME-Sender: <xms:s86fX658A0K5A2ZGjNJbX175WWmBJjW4YsGIk5ePGuKNn-wqSnVEIg>
    <xme:s86fXz6G3lmZpysw5zHmrDIm0lYhEOVKeUBriRN5hnKEOHrP6Ce1ys1ejaOD2jQDk
    qpnSZ5XILFBv1zFgsc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:s86fX5c046zh68969VRsxzsJ2VniePom1osuz3j_uGOQykv7jwxuEw>
    <xmx:s86fX3J6FHCE70poP38xr42k2BHuE3xzZwfaz7X7f5h71VYZmCRwbA>
    <xmx:s86fX-JSFhgTZx8GTIyFNN5fTRrVD3kwW-eMi0k0D0uUYqaDmuOGmg>
    <xmx:tc6fXzDZ7JmADY70-TxDUkQx84AW2roweM4r__W7SuSpQDJF2YfQTg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2FC423280060;
        Mon,  2 Nov 2020 04:17:39 -0500 (EST)
Date:   Mon, 2 Nov 2020 10:17:37 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 00/14] Allwinner MIPI CSI-2 support for A31/V3s/A83T
Message-ID: <20201102091737.pszii6znryssyh2e@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <d15d724b-6af7-3e51-1316-7bdde5a42c60@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g7kesbwqqdzmkw7c"
Content-Disposition: inline
In-Reply-To: <d15d724b-6af7-3e51-1316-7bdde5a42c60@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--g7kesbwqqdzmkw7c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

On Fri, Oct 30, 2020 at 07:44:28PM -0300, Helen Koike wrote:
> On thing that is confusing me is the name csi2 with csi (that makes me
> think of csi vesun6i-csirsion one, which is not the case), I would
> rename it to sun6i-video (or maybe it is just me who gets confused).
>
> I know this driver is already upstream and not part of this series,
> but on the other hand it doesn't seem to be used.

It's definitely confusing but CSI is the name of the IP, but it supports
more than just MIPI-CSI :)

Maxime

--g7kesbwqqdzmkw7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5/OsQAKCRDj7w1vZxhR
xf40AP0Yj4OpO5elQY4ecnN07dkmmp1tsjYm1SISQvGp6/ForwD/QpGFBl/5JOHe
7sDR7zxwSn34cDklaiJF3Yw2jWuu6gA=
=ETbw
-----END PGP SIGNATURE-----

--g7kesbwqqdzmkw7c--
