Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD882ECD01
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 10:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbhAGJl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 04:41:27 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56049 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726326AbhAGJlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 04:41:25 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id EB4401777;
        Thu,  7 Jan 2021 04:40:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 07 Jan 2021 04:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ybcTpLLw971gG6bm22uSBpkTBJi
        WuhFBQpGPZAtT1gQ=; b=BT+EjLDd6fxDLG25nQwWepRvzsbP/oqezXlb4pwXcPh
        SdbSxV4H6JmSBlhAT3KrrrM2nrzeQIbULBl4R8l+JkN7Ieut7Vb2OkWWXTngRz12
        Xymj8bV2niklzruOcFVMgEkD8oWunVRWr0GXYAabMJ31AbGl8oVN3ZeetIjVUOi/
        O8KFjOpXggw1xiY+7ZNkBKhLQM6XRdr7cuKLwKbnvNpohI+Gm6i1WeM459WyLPlK
        UN4Dt39XcRe3m5JmRIU+oosVf8T9Sl+wa1hmuEkzOq2KJ1H+m9EdHrdl/Jrg7UK1
        2NvM991GWT954kHpA/RRWKs3T4lGLjS0JyeV9UPkkmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ybcTpL
        Lw971gG6bm22uSBpkTBJiWuhFBQpGPZAtT1gQ=; b=FgblouXUXHddn7tEfUtAy7
        Z55r/Kk/9fSIPMp1ltzSnQFWV1W6RracNipCo+y+tSY3ePVuW5AV1nhrAUwZCyL4
        8auoGD8yJ+az6nn/G32+GbqM5WDoW5wiDr80xmpOG6n0fVf0ymFpsabGr1zpSS6x
        8TehjgPDeH7WNhAeDWn7rVbua3AjkvOtzi3547M4syBY4cY5OojVwl1AdwsOHLJU
        ju/Bn7HKxtEvCIoFBBOvRcHudfl24/niEVFemjWCjFBgi/cKAOS7mJzkGUn5ZuW4
        sT0DuUd86YvHv25CdhXCCDpIPDXtJOdN2MsXNzdRUWVIqVGEyK3MW+g02mkNK9Vg
        ==
X-ME-Sender: <xms:Atf2Xw-5AHfjV1_RwmsYdUpnIcC4pBhoU0T0A1jM6Mjms0z8B5upFw>
    <xme:Atf2X4thXDVQ-4q86ypf8oaQAh20vxzbm2bJmEw0xOkVfMGASKQDvfmsD_soQome3
    c1U8atp0ohVXbh3hOU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegvddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Atf2X2DCfCURsdeF7-k4b7jR5MCpOxDBcqVUOSRMIL5-tQzSc1a5nQ>
    <xmx:Atf2XwdvJMJUcXZY9D032uiU25mPXh0Nr4Nb2mXMZjjmf6yvdTph0A>
    <xmx:Atf2X1NU-w2XLUbYlImtoCVLdQGYQlKmo3BepyY9rNx2N4HbBA_jsg>
    <xmx:Atf2X41hTo428NWQv4WvV7T_li-5IDg0N7dnMFDLR1ipn8-JVEFhDQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3066224005E;
        Thu,  7 Jan 2021 04:40:18 -0500 (EST)
Date:   Thu, 7 Jan 2021 10:40:16 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     robh+dt@kernel.org, wens@csie.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] arm64: dts: allwinner: h5: Add deinterlace node
Message-ID: <20210107094016.6km73lb3waek76vu@gilmour>
References: <20210106182523.1325796-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u3wdxctky4ofhyc3"
Content-Disposition: inline
In-Reply-To: <20210106182523.1325796-1-jernej.skrabec@siol.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--u3wdxctky4ofhyc3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 07:25:23PM +0100, Jernej Skrabec wrote:
> Deinterlace core is completely compatible to H3.
>=20
> Add a node for it.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
> Note: I didn't add H5 fallback, since the only reason why this node
> is not in common H3/H5 dtsi is that it's located on different addresses.
>=20
> If anyone feel fallback compatible is needed, I'll add it in next revisio=
n.

Applied, thanks
Maxime

--u3wdxctky4ofhyc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/bXAAAKCRDj7w1vZxhR
xbjsAQDNU//6B/49Rgc+kWpBX2ZwWQCk5xAX2IJBBgkWN7prOAEA9A4Ey8erbT0E
EaQhTs22Y3FhZiA2PP6iaYrWrokThgA=
=aHF6
-----END PGP SIGNATURE-----

--u3wdxctky4ofhyc3--
