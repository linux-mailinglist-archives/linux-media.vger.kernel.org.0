Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947852D978B
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407879AbgLNLkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:40:06 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:48725 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405769AbgLNLkD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:40:03 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6835658050A;
        Mon, 14 Dec 2020 06:39:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 14 Dec 2020 06:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=h4tM2jXirOMSD1zihxUdk1ovjF7
        7z3fxMQ6d0RdoD6U=; b=dnK/868K+AwJSo/XNIzQU3gx7WvJii+Kqa+LkfMPs3c
        k2c93fyxmID2AQ9fldvzOrSMt8Z+iZ8/1InI2Z5GzAGwROKnb7ntgDuVAWOT63Pi
        s99kRahpymSFdJJeUdk64Cy42AH80JsC32dcH8umMQxgxfnHdFlVOsj6ZkpwoBda
        0PGtwrqSKemuaDtCzZ16QyI4BNeLk+5PKIXtFckdujss5RPOI/dn4DeKUYAMMoRF
        NXJCIOMyCVXwMnaNc2bJs2LPhFF6fIYoLL3Qaln8fXwh+NQDLSmHq/J6bDV0lC45
        ZZm5i7lRmcwnwrpiki7w4ocQCM0VUteiqzl/GPbBg0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=h4tM2j
        XirOMSD1zihxUdk1ovjF77z3fxMQ6d0RdoD6U=; b=oihxjcjdoq3Jzfhaj+oXBh
        iaGzQXVDw4Zr+3Y0EZMEiAo4BG4KHr+3knuM1Xvs3ofwsWxXhlPgELTaiDhLYrpt
        06NeFUrmbP943F74mDf11H+pPXJJ3skA2g9YT60WI/5nwyvg7RRbSRFAZRDpuFVS
        XPmg6KuNNPDaxysf7dfjWIBMjOpvWLv9Glb5HCzAURmC1Gj9bOog4JC3IGPo6ScF
        77ZH0h8QdGVcJXD7Mz1pD8HzT/Bk6r4ALL8jOOJ93wtkOCEjy/PWjXFVG9DArpWK
        Q29bUpwm8whZklbpkL13xc1ib8/VztcmO9N43KifVvk5JvzmE/fTD0ErSlfAf8og
        ==
X-ME-Sender: <xms:2U7XX17PrusISI2vTBDlszYpD73ByMV7lO5aDvjOOvLDNqzNac7bbQ>
    <xme:2U7XXy7bWl6za7LBTLLMsJm4u6HQprgH98JLa-sXv1vbbrnWseBc4HXoj4SjIs4hy
    IjHfux80LiakpDJ5_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2U7XX8f-Yrf0UDyuPgz811tNXopvYhY5bSb75X8XWRSLTkwq_u8PBA>
    <xmx:2U7XX-KwZLxn1UhudSfy2gEn66zk_foLQeRyf8scz2J7dIBE0ggPUw>
    <xmx:2U7XX5IgZvZfLb_QSTZh-FJeNuT4abvYf-MTohbv7i3wUf87jY4uPA>
    <xmx:207XXyiNkmiAohPwgcoqt3e7CETdME3A2QVJeinyzxqStxG9_RkUaA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E40A7108005C;
        Mon, 14 Dec 2020 06:39:04 -0500 (EST)
Date:   Mon, 14 Dec 2020 12:39:04 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH v3 09/15] media: sunxi: Add support for the A31 MIPI
 CSI-2 controller
Message-ID: <20201214113904.v6j7z3yrvjv74dcd@gilmour>
References: <20201211155708.154710-1-paul.kocialkowski@bootlin.com>
 <20201211155708.154710-10-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wl35bqlaasqbg43y"
Content-Disposition: inline
In-Reply-To: <20201211155708.154710-10-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--wl35bqlaasqbg43y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 11, 2020 at 04:57:02PM +0100, Paul Kocialkowski wrote:
> +#define sun6i_mipi_csi2_subdev_video(subdev) \
> +	container_of(subdev, struct sun6i_mipi_csi2_video, subdev)
> +
> +#define sun6i_mipi_csi2_video_dev(video) \
> +	container_of(video, struct sun6i_mipi_csi2_dev, video)

Isn't it a bit unsafe?

The second subdev and video here is not the variable passed in the macro
but the field in the structure, so any attempt at using those two macros
with anything but a variable named subdev or video will result in a
compilation issue?

Maxime

--wl35bqlaasqbg43y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9dO1wAKCRDj7w1vZxhR
xb8UAQCe9ql3Nxn0nlTSWUSqxoplbpYkA5kmXzAwghQIyaX20wD+LX4lxWJ1O67c
MOXxx+Pku4au4HcY56vDu0LAhVu1ZQc=
=6qDt
-----END PGP SIGNATURE-----

--wl35bqlaasqbg43y--
