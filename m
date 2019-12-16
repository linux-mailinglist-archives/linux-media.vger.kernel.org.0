Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54D9212026F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 11:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfLPK31 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 05:29:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:48086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbfLPK30 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:26 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD8D9206CB;
        Mon, 16 Dec 2019 10:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576492166;
        bh=h4X6AHfGqH1fcCYhsVZLrhBRQ9DB10RQK53ZRJEGw10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IvVcuSHVLYGMmXZVmzWjp42//mldx+pzhw6/n2ye4z+xgib3qOgAuff+SDPb42z/R
         wfXre21OOpLxB2OAOi4I2vyhOQHvnESfd1wKswN24x4L31iE3E04U4ynLnDGD25sbv
         V042YBfc8kD87odpp3NQW1egVmAu9toKR/kAdgAU=
Date:   Mon, 16 Dec 2019 11:29:23 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 09/14] ARM: dts: sun8i: r40: Add I2C pinmux options
Message-ID: <20191216102923.nezpk2cqastyfpsd@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-10-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6lkmrciahlk4lydl"
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-10-wens@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6lkmrciahlk4lydl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:59:19AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The R40 has five I2C controllers. Currently only I2C0 has its pinmux
> option defined.
>
> Add the options for the remaining four, and set them as the default,
> since each controller has only one possible pinmux configuration.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--6lkmrciahlk4lydl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdcgwAKCRDj7w1vZxhR
xaLdAP9tc7Nm4GYFEAyZVooyptZNGjG4NOL1T9S7EiBgQ3Pz1AEAtO6crXWEEVFr
ich4eYyroylJ+xW31k+yFo8klXVkSwg=
=rMnm
-----END PGP SIGNATURE-----

--6lkmrciahlk4lydl--
