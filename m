Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29ECF2AB3D2
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 10:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729176AbgKIJnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 04:43:10 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33657 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729119AbgKIJnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 04:43:09 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1456D580195;
        Mon,  9 Nov 2020 04:43:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 09 Nov 2020 04:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=lmiqVPfBRO9HsD4eiakrDCNXKqB
        n8TEbx/O27OWVDLI=; b=mypyW2SRGaFWVqh9eIwS+6XSviN7iSg5vBD0DujP08f
        NTMwnLh+7qpBOyAYunecocrgYA+ZD83xDOK8186OMOoFQ+Xb0nOs2zQyXlkxhlw6
        HPv8vT2JZq1TKs+X9DjJJUUqPy0aDbbd3pVpyIuUbMaFmpDcu9YttXA0ME5BnQU+
        NcaufGiE2apM4uhQXjANLBhcteDxGlRwLTkXGVsU/zW13YivuK5ePcX7SSPvnSiC
        kKmx6Y/c5qCfRB6yCY5NEzOLq4M2cUyL8aw1cmhpEM7yYILzhXH2Mca48y8YDMTT
        EKe976E321k4CFGyXoCKSvuRwNw03gU6RZDx6NzuRbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lmiqVP
        fBRO9HsD4eiakrDCNXKqBn8TEbx/O27OWVDLI=; b=H7qY1QFWL2E1stPQpyP9eg
        AAJ4inT9BR8xe2fI1/fkS8WJi0i6ZctMYo+URIun6SRJm2+L4WN/fxQqwdjgfDPt
        ygQ9aQNUbTllTVupPO7i8IqlrkLimVvKL4ZTPQk8aBq3f9DnNR2zi95Te3Iw+Kad
        7hwMUljwZ6V/YSmI7p2I8dPUgAQYYjexVXkrIaXnYF6RIzR8o6iiJI//IyDqQbAW
        zlG6aJJEq2h648P35sUz05qDSNox7LNPkaAyka7Ab/YwvSWwmrltpi1ZSwVMz76C
        rgmGmYuvrqlNJKZEk0tutQTo7iwFqKEjmZnDm+Q7AQosE729qDxk192LxCSTf/VQ
        ==
X-ME-Sender: <xms:KQ-pXwe_i8dNiJZAY4tlnzKs9XbqOj8MBM7z25Mxwdov2thimc9DLg>
    <xme:KQ-pXyO8ivi7WZ8BAwODuMeesd9QLkTkBWKTaIn0WyOYT9lYWpAF-L9znw6Jvor15
    cieyRFDbpVwMEIUN8E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudduhedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KQ-pXxjlvTmOlgd9bjlnbeGUPVWLSCvcZhonXSR4YQ4KX-CI1c81Ow>
    <xmx:KQ-pX1-HsXhn-od1yaHQFkk1IpgBnrmnLSb9H6eruasLpI3dYiJP3w>
    <xmx:KQ-pX8vBDU1Pcsf3hAEUlTyz0uO8CENMf2hwZwyqRlIqjkqsQvmEtw>
    <xmx:LA-pX8FUnd_DscCKNzgrRd-uO6wlsVUSe8fyyt0RSAgNhH-tifm-HA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0230C3280065;
        Mon,  9 Nov 2020 04:43:04 -0500 (EST)
Date:   Mon, 9 Nov 2020 10:43:03 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Christoph Hellwig <hch@lst.de>, Hans Verkuil <hverkuil@xs4all.nl>,
        wens@kernel.org
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/7] sunxi: Remove the calls to dma_direct_set_offset
Message-ID: <20201109094303.llqsxqoxjagiqa55@gilmour.lan>
References: <20201106151411.321743-1-maxime@cerno.tech>
 <20201106160737.GA31913@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ukr2zryovmvm4axa"
Content-Disposition: inline
In-Reply-To: <20201106160737.GA31913@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ukr2zryovmvm4axa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christoph, Chen-Yu, Hans,

On Fri, Nov 06, 2020 at 05:07:37PM +0100, Christoph Hellwig wrote:
> Thanks,
>=20
> this looks good to me:
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>=20
> Can you include this patch at the end of your series to that it gets
> picked up with the other patches?

I guess the easiest to avoid bisection issues would be to merge all this
through drm-misc, would that work for you?

Maxime

--ukr2zryovmvm4axa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6kPJwAKCRDj7w1vZxhR
xVdNAQDHWf5opH2Wk5MBiU7aGQjw4usXGRwBxWeeBmmVLm8FsQEA8Y3/aoi85/VG
utrIfztWYorSmqfL/yhtZhR8bdeSEwg=
=ZXtW
-----END PGP SIGNATURE-----

--ukr2zryovmvm4axa--
