Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C71181001DC
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 10:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfKRJzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 04:55:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:54582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726646AbfKRJzi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 04:55:38 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8677120692;
        Mon, 18 Nov 2019 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574070938;
        bh=DIT4h24G/XHhTR0V9nAo1RhonfMX1ZEVQmD6dY0og4Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ROf1nmI0zKFPdl/tXp8JrcbFEB2obv4ynnmFI+5z780WzdjP2DEd4Y3fWN30oxeWR
         8ScaNzVxGCgYVpEHi9k17DricDuPHfa/HJ2AVrKG/YSbtcxZFTx+553rBotMoh4odk
         pU6aecTIAP7oL3l+zoUrfN5G1EImR1phIKxI7hpY=
Date:   Mon, 18 Nov 2019 10:55:34 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sunxi: dts: tanix-tx6: Add rc map
Message-ID: <20191118095534.GB4345@gilmour.lan>
References: <20191117130058.1341989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Vs1U1/ga4WSC1iHQ"
Content-Disposition: inline
In-Reply-To: <20191117130058.1341989-1-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Vs1U1/ga4WSC1iHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 17, 2019 at 02:00:56PM +0100, Jernej Skrabec wrote:
> This series adds "rc-tanix-tx5max" to rc bindings and to Tanix TX6 dts.
>
> Superseeds https://lore.kernel.org/patchwork/patch/1143781/

Queued for 5.6, thanks!
Maxime

--Vs1U1/ga4WSC1iHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdJqlgAKCRDj7w1vZxhR
xfg6AP4y1Y62dxMfySco9JASTErxFp505K961dKhOrNOQvIkOwD9FZZee0XDQ3Gp
xxLthCBiNpCdk0CmqA5rcOkXsvcV7QE=
=pilQ
-----END PGP SIGNATURE-----

--Vs1U1/ga4WSC1iHQ--
