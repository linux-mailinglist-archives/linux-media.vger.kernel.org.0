Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5462D2B8DC8
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 09:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgKSImU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 03:42:20 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46041 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726358AbgKSImU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 03:42:20 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id AC71B5800F5;
        Thu, 19 Nov 2020 03:42:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 19 Nov 2020 03:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=5DqwnmNe5MZ1oBWo8rYgCJvgNX/
        nBUSLLMd4qJKLVwo=; b=QMvJsxuS+F230z5kmRQhjhxPWJN3BwS5U5NDc+s6xel
        uve9cUDM9e2DtwJM4HSQG1nKnq5Rkdgr7cY8y2vAE/cEkUGj8XOa3ASIs4z9aJkL
        YYHCBVE7R0laK3vo67NItzCK1nDWVSC4qU01mLTSLLzDGL0yJPs8GLM46pHYi8/3
        Wf3L2XNps2W9dvMEpuM7V5Z06F6Tb3SJSDGbymFdsMpSfgj6+Ny/deGVpZl2xXCm
        53SZGr85emNDDI86qLdLL7JaF+XbkiBz8PDcz8tgt5JpSoprB/Qo+nglwBZ4MwhO
        17V+8w3dHl3/a9uWSmtmziP+MTLY36piPpkbkU+layw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5Dqwnm
        Ne5MZ1oBWo8rYgCJvgNX/nBUSLLMd4qJKLVwo=; b=XM+viXwm8de4uydp9rVcYE
        Dv4fOMl3pEKGARRtkgPmDU76FI+NdnJHwtpW0btAFHNpd+T7RNRWTXGiRwrwvuqW
        coIC4mY5/9PiJnimz0V9WJe17tqKeDgbcw8NuAifOqdJZgMn0SJ5MFVpNEjLWi8f
        AGEjoYfEkCD74Zc45slkrG3k2sylT8Hcm3uXO907n7mC4ZaejiZJ0/jBNCeKRp1+
        EoteZSXRxC7XlAlhk3zA6U0TRA8WdbcghyT07icgNJSIYdaGJBkNDwx/3IvvGm9R
        Z+db4YjhcLNsXZ7OnDWWObQYKRz2gzC7ZoE8GLD75xiKjngLH+TqkOZJupc1sF4A
        ==
X-ME-Sender: <xms:6S-2X9xQcg1gPCZ_ylxT_8PP1xmff6hWLyNRBgwMwVP_KmF0r4vUvA>
    <xme:6S-2X9QxGAngEQKHOU-dMheqXI4YLjvl8BQBRcuNahSUlodFnHqrQilPqT6Uv6n7N
    uaPO5fuOhthAOZFbcM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefiedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
    gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeike
    drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6S-2X3UH4loHGjFMH6yAk6vQU4SS7v6LQuCzDtr2auC1xTlPvXCniw>
    <xmx:6S-2X_i2r1_uw_W0bFd6G5-IH6FV3HousApy6PkQkl2l3W0HHu5AZA>
    <xmx:6S-2X_B7F5XEw3h6CwQ_4hbOvf2KsTeaUvpQnFquw_lLb3Zq3ANauw>
    <xmx:6i-2X3YzK6YtDeJ81cm3LvWYBMbSFGDzLYt1skFBYLCUSMHCfzGOfg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E12C5328005D;
        Thu, 19 Nov 2020 03:42:16 -0500 (EST)
Date:   Thu, 19 Nov 2020 09:42:15 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, wens@kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
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
Message-ID: <20201119084215.pnzypitnyfgxsgrg@gilmour.lan>
References: <20201106151411.321743-1-maxime@cerno.tech>
 <20201106160737.GA31913@lst.de>
 <20201109094303.llqsxqoxjagiqa55@gilmour.lan>
 <20201119075959.GA15942@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7dwjhxt6inc72kiy"
Content-Disposition: inline
In-Reply-To: <20201119075959.GA15942@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--7dwjhxt6inc72kiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Thu, Nov 19, 2020 at 08:59:59AM +0100, Christoph Hellwig wrote:
> On Mon, Nov 09, 2020 at 10:43:03AM +0100, Maxime Ripard wrote:
> > Hi Christoph, Chen-Yu, Hans,
> >=20
> > On Fri, Nov 06, 2020 at 05:07:37PM +0100, Christoph Hellwig wrote:
> > > Thanks,
> > >=20
> > > this looks good to me:
> > >=20
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > >=20
> > > Can you include this patch at the end of your series to that it gets
> > > picked up with the other patches?
> >=20
> > I guess the easiest to avoid bisection issues would be to merge all this
> > through drm-misc, would that work for you?
>=20
> Is this going to get picked up in drm-misc?  I don't see it in linux-next
> so far.

After some discussion with Arnd and Daniel, this will go through
arm-soc, and I sent the PR here:
https://lore.kernel.org/linux-arm-kernel/20201118091303.wa5npxyop3cdsczb@gi=
lmour.lan/

It hasn't been merged yet though

Maxime

--7dwjhxt6inc72kiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7Yv5wAKCRDj7w1vZxhR
xS5FAQCYXp84yiCjK6DzHMXuvqUyjuQ2zW50D8gIbktS+6dxsgD8CZD6PR2bxjbU
MvZ5WHoaGibeUb5SbiM7G0oySMAPyAg=
=FD/c
-----END PGP SIGNATURE-----

--7dwjhxt6inc72kiy--
