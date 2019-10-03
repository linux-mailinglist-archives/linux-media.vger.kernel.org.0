Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F66C9DCE
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730165AbfJCLv6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:51:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:35796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfJCLv5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 07:51:57 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C283F215EA;
        Thu,  3 Oct 2019 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570103517;
        bh=gh2BwGChFgakU2b0Nn81nUTVrkAdKDXGZpJ4cMB1VM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vdRXrRY18lwTNPL/y9J3Ef9MtoUxJKfG7fmE8fGIKEmTJwfJgZg9XqdaEirRiSA7m
         jJGvAiJG+M24eY4h79ygx5XcyBA6YdhlxUebj78LxuLisK8hmiFGAvZbLraxmzkfiy
         mwPt9B8wLzyBWOxnSpuFkGW23MvVWm0YcPCQs+wQ=
Date:   Thu, 3 Oct 2019 13:51:54 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: media: Fixup Allwinner A10 CSI
 binding
Message-ID: <20191003115154.6f2jgj3dnqsved2y@gilmour>
References: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nmzxrjrlzz4yd5h2"
Content-Disposition: inline
In-Reply-To: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--nmzxrjrlzz4yd5h2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Oct 03, 2019 at 04:52:24PM +0530, Amit Kucheria wrote:
> This new binding fails dt_binding_check due to a typo. Fix it up.
>
> linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
> make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
> make[2]: *** Waiting for unfinished jobs....
> linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
> make[1]: *** [dt_binding_check] Error 2
>
> Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Thanks for your patch.

It has already been submitted though:
https://lore.kernel.org/linux-arm-kernel/1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com/

I'm not sure why it hasn't been applied yet though :/

Maxime
>

--nmzxrjrlzz4yd5h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZXg2gAKCRDj7w1vZxhR
xS0OAP0SU5JvkUNzuu7h9+tNkONFA7iQwgl1sR9AZpJjgOiFJAEAoJeO4CR/ZOBa
0Vu6m/HmNJojnOFoY2ILvkflVt+Zlwg=
=RF+5
-----END PGP SIGNATURE-----

--nmzxrjrlzz4yd5h2--
