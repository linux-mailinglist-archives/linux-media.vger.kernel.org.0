Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB77254909
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 17:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgH0PTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 11:19:38 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:33093 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726087AbgH0PTW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 11:19:22 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id ED74F13F4;
        Thu, 27 Aug 2020 11:19:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 27 Aug 2020 11:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=RSXeFCAVyCX3aYLKYMbZeZXSxmS
        Xwn7LT8+Wx3RjWNM=; b=F8l8Ojj/TBni6VehwfbAMamic7/vSaOKl9W9TvxXbrW
        e4ejSCQ9KLMcnK/I0mLTuObu0fREP+CxjmF1mYNl7yS06CMy1KpPjZ2TlnR/JuRX
        2t8W50rpAzn7rUN97jVHjoIG2UQii2X0aRSs6iS/2XzQXTHbqbH6U+uS7Jbx1k77
        yWZEvEPYyCwfTTa8dOIsal4jv5qwyRN01D6QXLmqGUfcoa41IRxVI9g0ZnAcld8Z
        WkC1QaGEQJSq6euvS+HTfHZMKzCgMoas15qg1G4UNPy0DF48zQx4yYybxG6VqIrR
        qGgIbD102niACW1O9JMkbxvYRhHMEwGbOfldHKBxhDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RSXeFC
        AVyCX3aYLKYMbZeZXSxmSXwn7LT8+Wx3RjWNM=; b=TMmC2MtisUEs2n3TsVlool
        qSh5Hb7qu6Cqn+vZ0sRyS7lRMj9IDL2eyeK3BgWuiBLb5p+L94ji9sCItqMFte49
        UHqB/G0g9Qo2HLhJhTF4FxrO/AccnQF4Sq6y9dj/Br3+aKzeBaxn4RlHeMkHaLb/
        QNwujHuojLpdLXHzmdFdJvLYdOkwfaqAwXyo2N0Niy1cCHZIn+8rb67PCMF64agt
        rmVckLie86XWn6bbYB8Mfb32yNvQFGyVxzSjkXb+/sqfuWNod+42+Em/tKlZ+HlB
        1xoUQTS9SfhwrGpKN2CXkQxxzBTggOm3o3F7AnWVa9PMEppaAHyQd0j164DJE+7Q
        ==
X-ME-Sender: <xms:9M5HX7WZa9MJa905TVKH1aLcR44o_72vl5e7CE7zBTQpSAGN4jcCUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9M5HXzksu6H9NLU-JHpE44gvTZN1HLK8hg0nSDsMv-p_LtYsnOSlaQ>
    <xmx:9M5HX3ZiWTAtHlbHOd0W_wztoEK37pGB9Ftz1nRWolT11nn7eEwKkw>
    <xmx:9M5HX2VcMEImMZCM96eQHANOo-yedsRERAeDh6FQys9rrYlffrjZJg>
    <xmx:9c5HX37UnQ4oOxPRjuIjQ-AQSVCndrkQ6_M4hxZwjhjNE5tstWiCgyxys8s>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DD7673280068;
        Thu, 27 Aug 2020 11:19:15 -0400 (EDT)
Date:   Thu, 27 Aug 2020 17:19:14 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, paul.kocialkowski@bootlin.com, mchehab@kernel.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/5] ARM: dts: sun8i: r40: Enable video decoder
Message-ID: <20200827151914.copcle3xjn3ek6p4@gilmour.lan>
References: <20200825173523.1289379-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iuvgwm6rpxeewgp5"
Content-Disposition: inline
In-Reply-To: <20200825173523.1289379-1-jernej.skrabec@siol.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--iuvgwm6rpxeewgp5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 07:35:18PM +0200, Jernej Skrabec wrote:
> Allwinner R40 SoC contains video engine very similar to that in A33.
>=20
> First two patches add system controller nodes and the rest of them
> add support for Cedrus VPU.
>=20
> Please take a look.

Applied all 5 patches, thanks

Maxime

--iuvgwm6rpxeewgp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0fO8gAKCRDj7w1vZxhR
xV5NAQDF9g6AIv8B7pmqugf0GI/8cUs9e7lyAcm+Rz+TGwFkWgD/VEcDH7+c5LKz
fF+auOAaw4kec1ruj6+uGhxwKyBSYAU=
=FNIg
-----END PGP SIGNATURE-----

--iuvgwm6rpxeewgp5--
