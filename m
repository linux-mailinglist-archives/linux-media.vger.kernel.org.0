Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A968E112C81
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 14:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbfLDNXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 08:23:50 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41661 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbfLDNXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 08:23:49 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1981D1C000E;
        Wed,  4 Dec 2019 13:23:46 +0000 (UTC)
Date:   Wed, 4 Dec 2019 14:25:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org, adam.ford@logicpd.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] media: ov5640: Fix check for PLL1 exceeding max
 allowed rate
Message-ID: <20191204132557.pl6rwfprtcwewato@uno.localdomain>
References: <20191204130907.19799-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pfnkt6rdap5wnatk"
Content-Disposition: inline
In-Reply-To: <20191204130907.19799-1-aford173@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--pfnkt6rdap5wnatk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Adam,

On Wed, Dec 04, 2019 at 07:09:07AM -0600, Adam Ford wrote:
> The PLL calculation routine checks the wrong variable name 'rate'
> when it should be called '_rate' when checking to see whether or
> not the PLL1 output frequency exceeds 1GHz.
>
> This patch changes it to the correct variable '_rate'
>
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Why have you dropped the fixes tag you had in v1?

Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")

I'm not the one who collects patches, so maybe wait for Sakari or Hans
to tell you if you need to resend or not :)

Thanks
   j

> ---
> V2:  No code change.  Only change commit description to be less confusing.
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 5e495c833d32..bb968e764f31 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -874,7 +874,7 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
>  			 * We have reached the maximum allowed PLL1 output,
>  			 * increase sysdiv.
>  			 */
> -			if (!rate)
> +			if (!_rate)
>  				break;
>
>  			/*
> --
> 2.20.1
>

--pfnkt6rdap5wnatk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3ns+UACgkQcjQGjxah
Vjx7YQ//Sg6XzeO8UFJxAJwhfAJEh3cA00oW7HjzsxIlwH3LeNSYNjALQXhFKfhX
pDFmF9tkj8ybix0dqaGRgB9KYbokIRIyEWhjoBDOqWkxXOrkYeZFG9l4dyGMpggg
+4B5v280dkpL3y9y1rgJEUaXJZe5P2q4t1LEElfhxuOirrfzrWFYg1WaDEPmynwF
Zlt+zpsT0brKbouqN/okbaJmnqhnYvdIHfL2fWNOJJaokZLVKNGSBorZ3DdD6jFL
MJ6yRy3pPbP9EsQzOGrE1FMd2LQRSCInzi7kIiwcszaTs1/1Bu2guS+F41NpT2pW
L57uxvasgHoB/7C4OTq7XQuhJ9PYWP10kp3EvH1/joS3YSJUybkEUaqN3PvmkuKn
uEmzBFU/Km7lSJ8pfdforEgvczhpGkeZvP5QvdZQ4uH4S3RT5mgZuCiVHlDPYf6h
LSEw3XARKz7fyhiug+EfjrFViYuMHXCw5HVkCjbPn+ELyRefeJ4mWH9x8tIQOwqN
rSZCWndQhQp6/QUzUH3uMvZPXZfhCXk33njwoN0uMsm7EGLNmjDqCQblz39VYe7w
tMWQBN2V5gbZiX2V4Eq215Q5On6tlwEHTqdcJvQFRjNjGgBTC72dp9Kcyp48i1yy
GVBf9l1/DWAkO1EuCFvDWW0gAKK7JThzWjaQVD7l/F2Zmsn54Q8=
=9DB8
-----END PGP SIGNATURE-----

--pfnkt6rdap5wnatk--
