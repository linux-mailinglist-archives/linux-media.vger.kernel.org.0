Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648222A2C98
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 15:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgKBOUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 09:20:35 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43655 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726228AbgKBOSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 09:18:43 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id B0D30EA1;
        Mon,  2 Nov 2020 09:18:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 02 Nov 2020 09:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=0J+Fof+2UzXfo4XbpeTWRmJHnwd
        Jb+SdD0W2rbcDMEM=; b=cFEJqd0foMqU5yTfyDfkuLtmylYLrYHNQPIJUXA9BBB
        jrD9PvfuIZ/0Gyte44YKqNZ1mDAzVeWGxwJQRDc3wvI1/UdbBcMbC01gO5eUK2ok
        0bqCN+3VXwUmjoMFHRUsP8IfIdnAaFlridMuQKzahhdmtsiga85FagqChdCFGyQj
        dPi0W8GIn56VjQBmp112SVh91iKbKa/0m18N8w7ZWdbPXIj88EN2cB1eDdxynMS6
        HsidWMneYpevACHuE4raM/2O6zJ6fyRCsrGscRIX0nwLA+qaMonkkVAIZWRy3/qx
        Epre9ptGSigtj9/Z7Vu1dm3jcU8bzyh8+mHOoiSPgIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0J+Fof
        +2UzXfo4XbpeTWRmJHnwdJb+SdD0W2rbcDMEM=; b=lu7la2A5HqroArYMl6+13u
        zrZgTbt+4KWCInab4lU4fC3aQ3Khlnr8/XZ71CYkmpglTvI5gnU7gHJFt2h3UVrT
        jhdMYBadH3dp0d3khKJYDvbIcHhVartmv9RID6Y6Z0pEnXae6bofc2ymGVwgYutJ
        jpmaS1UQw3XgdyvOe3Wn8eH0ky5KtHEPaOZ19JIMXQeKh4oHXI6tRrjXXrJrKVW6
        YPnoqiLT5IQ/mAZKrVgN2yv1vbjQACFQad1i43M4DVaBJrTuKBCBWYF37AbGaJAS
        kViKMA0oYDce4z+2252SPSwyGL+9JaI7AOjyHjcVEBcYOpxGB2gukbrk/hHxcw9g
        ==
X-ME-Sender: <xms:QRWgX5sqhlcWTIjhhrZRVQhjGjPHU_xL8o1c-P6UFlFtdguSAHBvVQ>
    <xme:QRWgXyeCQcdSgsvYNA1lj1UkqjYd7UVYGZYm9cuakjwFa96gqXV4tY9iijU22MiAj
    pYLYeqOG4u6ccq59-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QRWgX8zMJ3d7tQlIML2qA9_tjXaUh4j7dn2_Afsjsfd4nHLUmj5p1A>
    <xmx:QRWgXwPn5Ha8XDMbOIwFfFJTDLmxBOUMOuU2dNChFfvReGVibl4msA>
    <xmx:QRWgX5_SChTgNelL4WcWcC_QMwXYSsV6D8Gav7vjW2z2oGCHwSD1tQ>
    <xmx:QhWgX1ZipmndOhK5WGur2Ls9APqdwjEx6v5Kv4Ac_mz-r88csq7t7w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id BC839328005D;
        Mon,  2 Nov 2020 09:18:40 -0500 (EST)
Date:   Mon, 2 Nov 2020 15:18:38 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     paul.kocialkowski@bootlin.com, mchehab@kernel.org, wens@csie.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH -next] media: cedrus: fix reference leak in
 cedrus_start_streaming
Message-ID: <20201102141838.7oicqkeqy7vy3ki3@gilmour.lan>
References: <20201102142622.140001-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iwerxiu77bwtbbop"
Content-Disposition: inline
In-Reply-To: <20201102142622.140001-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--iwerxiu77bwtbbop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 10:26:22PM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to pm_runtime_put_noidle will result in
> reference leak in cedrus_start_streaming. We should fix it.
>=20
> Fixes: d5aecd289babf ("media: cedrus: Implement runtime PM")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Shouldn't we fix pm_runtime_get_sync instead then? It seems that most of
the callers get this wrong, and that's definitely non-obvious.

Maxime

--iwerxiu77bwtbbop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6AVPgAKCRDj7w1vZxhR
xc8yAQDyxx8eKyHeme5xPWzAq1llV7HnIhAEIKVmbZWo5Fr+fwD/R67eEuzTDgqH
d501yUMJwaT4Ub1OAKf/fY7KGFizmgw=
=ubmD
-----END PGP SIGNATURE-----

--iwerxiu77bwtbbop--
