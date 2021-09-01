Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629753FD6AC
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 11:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243615AbhIAJWe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 05:22:34 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39999 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243617AbhIAJWd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 05:22:33 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id E18475C00C8;
        Wed,  1 Sep 2021 05:21:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 01 Sep 2021 05:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=SMV9oK/iCgz0tHOqUaBZ0W1wgga
        nshV5eQDf3FNQoRI=; b=s5qPyu1F7jbu6K8fJ9c9ACUyz8kcB+Xbwt6AIIQyW/w
        Iok/NurG/pnB1rT1IDogrXs1NzuWKfvN5lbnn1U2nDQ4qmN5iNEhWPTXl9ys/e+x
        8FN7XmDFetuMfq3nQkYZGNuvZApVCtNsEGXxH5Z44EHfunSg+oXj2VnZsyRFTT+N
        ef+0wHrA2WvHw+iOiYWhCoBRWrkASW5a4VleBggZU+hNSdxAwh2ezN8o2yA6Tkux
        QIj9YArDCC2t1yVl0RRO0nGSzjfWxH/SFVd3KzCzapzPeg0R3NCCjp8T07yI9Mj/
        4qIp9LW0dwiK2EnX8uwmfwAPdPQANkvji6TV41pQnBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SMV9oK
        /iCgz0tHOqUaBZ0W1wgganshV5eQDf3FNQoRI=; b=w0VhMPOFQIM0LmxPrcInDI
        ZRbfujw3ORTPWL3m1VJbXIxuQRNim6yqw6zmYo3VWzKLWk8r4FQs77XHESM86oI4
        Uy9N1HRh5YdRMreSKv8z2aFl3GyfrZv5QsexdoDvGlG64us4VEGW5y7oQpgpme5B
        XupaO3P+u8Ztws9TgUruxZ4Zx9GQs7qycJ452JxJSrh5vUgeces8l0WqPKCM2YPE
        ZXBN9KfuXRDjFUHDu+m/AYG78YXJhe/66JKG3NAfrcQdX1DyDfNd0MWm5rgeBMQf
        tKrg+t8WOtBVH9iUdtXUOwHELvoEURHdV5RIyzwUNHNwqaJPcIIt3GnA1/uK+n3A
        ==
X-ME-Sender: <xms:IEYvYWZi2x9wCzP6eZVmQ7vGWUpYpitUuqQoR-mhTsehfUqz7WickA>
    <xme:IEYvYZalzhxSrOoPq5xB_GU7_fDbSiYsrttuMNMIRnCtvCtKZkwhFD3WQ2zb4XTWD
    Ro-32MX9UJzePjPq30>
X-ME-Received: <xmr:IEYvYQ-daZ52iogv_OjtnVDCXwPod3lMFi9AywmVTJWxbYD3hQzuh8YBLxq0BlwJDV3UHA0A30E0qblyTxxSJorK24d28Gc-uLsU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IEYvYYrFymat351ET0_42yqZ1VejR7sJAD6BsmLzn7Hp8OypUo4b6w>
    <xmx:IEYvYRrcS_UTk2R01t4gDl--jHtKVxx0Hhk7mzuG9ZJaSqDUizuyjw>
    <xmx:IEYvYWSv6o3_Zkedr6HfzBAYG1aiC_vGr-XKztc6JzmNjtMzi1LuGA>
    <xmx:IEYvYY2SCG_Qrs1vmG9Uphs_0UeMXGrRA1UddM3Z1A613TnuAMJHTA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:21:35 -0400 (EDT)
Date:   Wed, 1 Sep 2021 11:21:34 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cadence: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210901092134.ehda5vimesuow3x2@gilmour>
References: <20210901051421.5372-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ydu7rbnigvhmycoi"
Content-Disposition: inline
In-Reply-To: <20210901051421.5372-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ydu7rbnigvhmycoi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 01:14:20PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--ydu7rbnigvhmycoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYS9GHgAKCRDj7w1vZxhR
xRGzAQD/+LRl+k0p/9tU1VLegXW97pYjGw5PTk0YMo9yrMrwjgD/XaRvvIwhrIwm
5nsBK3iDiZ9ilAs4wZdm3XCKIqEqiwU=
=chgT
-----END PGP SIGNATURE-----

--ydu7rbnigvhmycoi--
