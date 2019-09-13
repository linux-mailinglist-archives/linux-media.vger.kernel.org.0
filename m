Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCD8B1A83
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 11:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387914AbfIMJLu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 05:11:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:55592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387785AbfIMJLu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 05:11:50 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B3F320717;
        Fri, 13 Sep 2019 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568365910;
        bh=p8ElB8Aq/U3hjyZXMGOgnjC0h/U5HmudSOrfDOExeHQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EzPOzQImqLu7IKPdWDOO5mwe1aks2dtIVoOmsrQIUoCpiDCzu+d6we1r+52KzTPpB
         vTcoXiq8naAAUDFDVIgLfkGkP8GuRYfZQ6Vo98NuYWTGVOB1fc9lUWkbcUeOKif66j
         rfgduUXVR2Od3qSE4P4sZplhFxQ/tujy/R9c5bQg=
Date:   Fri, 13 Sep 2019 11:11:47 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Message-ID: <20190913091147.42nsldzxwzfjoiak@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-6-jernej.skrabec@siol.net>
 <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
 <4613446.95M5L3lKvs@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="42vjgwlldb7pcwy6"
Content-Disposition: inline
In-Reply-To: <4613446.95M5L3lKvs@jernej-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--42vjgwlldb7pcwy6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 12, 2019 at 10:43:28PM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 12. september 2019 ob 22:26:47 CEST je Maxime Ripard na=
pisal(a):
> > > +	clk_set_rate(dev->mod_clk, 300000000);

I just realized I missed this too. If you really need the rate to be
fixed, and if the controller cannot operate properly at any other
frequency, you probably want to use clk_set_rate_exclusive there.

Maxime
--42vjgwlldb7pcwy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXXtdUwAKCRDj7w1vZxhR
xZY3AQDJluLkTUto07z1kgxJ+9CJnbEOdksi1vAG8DSbW/o52wEAyBtJ8MHD4t8T
GgYWgCtcAKeCFH1IT/6EICEM21kyTQw=
=aoHD
-----END PGP SIGNATURE-----

--42vjgwlldb7pcwy6--
