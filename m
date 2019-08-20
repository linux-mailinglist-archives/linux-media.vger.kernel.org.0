Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D501995B99
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 11:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729862AbfHTJud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 05:50:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:58722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728842AbfHTJuc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 05:50:32 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E705222DA7;
        Tue, 20 Aug 2019 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566294631;
        bh=xAjbNh3jm1ba4AhcLUZNLmJZ2TdxmfxVs39tcWlM78Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0EXoISDTEiqwhkhpbtk5VfIHEy45qg61TQnHaT/HD1JvT418X54lFE5BvAiCLQjFC
         hNgJfLXMKpVSrkA43VEjSiKgypNwWRv+jpE4uJtcFp2vTNwqlBK819bLRG4DNN2VW6
         vQRVyIzXd4QqfZD2CDtD49H91AWPFlXzS5YQXxIA=
Date:   Tue, 20 Aug 2019 11:50:28 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: Add YAML schemas for the
 generic RC bindings
Message-ID: <20190820095028.l74sfvipwjjla6kq@flea>
References: <20190819182619.29065-1-mripard@kernel.org>
 <20190820081525.celdosrgcvwoq6e7@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ftcnfstprcqph37g"
Content-Disposition: inline
In-Reply-To: <20190820081525.celdosrgcvwoq6e7@gofer.mess.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ftcnfstprcqph37g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

On Tue, Aug 20, 2019 at 09:15:26AM +0100, Sean Young wrote:
> On Mon, Aug 19, 2019 at 08:26:18PM +0200, Maxime Ripard wrote:
> > From: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > The RC controllers have a bunch of generic properties that are needed in a
> > device tree. Add a YAML schemas for those.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> For the series (both 1/2 and 2.2):
>
> Reviewed-by: Sean Young <sean@mess.org>
>
> How's tree should this go through?

Either yours or Rob's, I guess?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ftcnfstprcqph37g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVvCZAAKCRDj7w1vZxhR
xTFAAQDl8xXvQIXa8WbCZaFxnwrmvUt5UqA7/9ObYafNNiYcpQEAt15seL7rf1IE
lBtjtxdyX5TG4nk1wDwD7edVTHVeaQ4=
=TAb7
-----END PGP SIGNATURE-----

--ftcnfstprcqph37g--
