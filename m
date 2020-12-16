Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199902DC155
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgLPNc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:32:26 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38303 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726209AbgLPNc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:32:26 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 41B975C01E2;
        Wed, 16 Dec 2020 08:31:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 16 Dec 2020 08:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ekw93FdzSF2s1qfpjDiIGy8uby/
        sFvzW7j4sAmUJEYg=; b=Ga47zo+YQa1qZPG8PcSk4OKj2uv11rbhvRrhCs6aZc8
        btZnQrqgcv501KY4XM4WCohWADU3L30a53ycsoszxtb3lYF/+VOuZWDX5JE7IJFx
        RBsIeTEHqKBkLtJKBuRWf3QD9g/ONPXFZrTt1NHTpiacKKUooCs+Hou8jIHGFBuH
        JOPOW6cjs6Vunh88tDF68Jmr5e9OPCGdQPD6yM4okaaCbNyKHUcnMUDQqhmWrMdL
        Npq5x1HUZcZjG/KVR4MzV+RbZRiKqlkJJOETDF4HZuAEf3TpVTZhXsgF3SipvU4C
        bNnsZ604jsOG6tjeh721DznfdE6VKBoQm1YYjelHm2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ekw93F
        dzSF2s1qfpjDiIGy8uby/sFvzW7j4sAmUJEYg=; b=iGsa9pS0Pf5l3k3dQzdS0E
        bLUrNUiL4G/00dGunmDiK598PbP/9k4ZDGXoWWjOwEIMzTl0IkIsrBeyfFpbmrM9
        uovWrWDzDs/TC7OL3dxUFtxiNlIrfKyac3I1b3yzkTrfF+y5KgmggX8T55Z32Vpj
        CZiw9mauc0IK1pFOQi2qTaShUJrPv5Y/vvLtjjluiuse0zqg+HPIi5f5DGZtZzrD
        hugC8Gt3D6iZdDyX3H/FKg89W+zSrqsqhn88Wor9UGfzzA+bQyky+Heaug0xp4q7
        MBfu24dZkSkHdXIqH7EPWmrQqfL+4fm6CYB/I30RCr8o+VWahbf7SI4Tjq/569QA
        ==
X-ME-Sender: <xms:JwzaX2NTZpZRaaQ8SnQc0-XLbCqLU03r-SY-XF6o1Ion-dXmbZ1iHw>
    <xme:JwzaX0-Ptvl2iqBTeDJ25tIck1vM6nZ9EJ4e1d6t6Ts6BSf86EJJCoZBu6rkcbRt5
    Q40uZ3pWdOw58P4m9M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JwzaX9RWsO1V2NDM5sknuj-yP-XRLUV7IYipg9EEAu5rCI1h6kPS0g>
    <xmx:JwzaX2vcasqlrKYW-_TMy0bfm5agKwUVZE2znraXeU-GGcMvilhC7A>
    <xmx:JwzaX-e_b2oj0dT_clGstvC-ON48IUpSV43WvAI0sDAxodk3jL8s7g>
    <xmx:KAzaX95Nr_sjuxfbosuY4_WPEPTOSFF4OrvP3aa66c5V8URmkhfxoA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1FA7224005B;
        Wed, 16 Dec 2020 08:31:19 -0500 (EST)
Date:   Wed, 16 Dec 2020 14:31:17 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     mchehab@kernel.org, wens@csie.org, jernej.skrabec@siol.net,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media/platform/sunxi: convert comma to semicolon
Message-ID: <20201216133117.7cvw76coipjl7c2a@gilmour>
References: <20201216132212.15152-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xet5grrlfq2wrz4o"
Content-Disposition: inline
In-Reply-To: <20201216132212.15152-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xet5grrlfq2wrz4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 09:22:12PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
>=20
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--xet5grrlfq2wrz4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9oMJQAKCRDj7w1vZxhR
xZycAQCfzzrMzr6V5ubsNMXHINmKWKtrt5+9IFPw07P1JeHEMgEAjh+xRQkE2Nn5
IFqsYL7IbW8Ws3FTVmvdIYRv117YGQE=
=iFpT
-----END PGP SIGNATURE-----

--xet5grrlfq2wrz4o--
