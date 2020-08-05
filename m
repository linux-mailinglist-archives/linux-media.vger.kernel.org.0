Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1EE23D0CF
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 21:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgHETxX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 15:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgHEQtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:49:45 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DAFC0A8887;
        Wed,  5 Aug 2020 06:46:09 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f18so4442872wmc.0;
        Wed, 05 Aug 2020 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IvlO0ppqF9UArsb4hIlu04eWVyRDh7e1MY8XEpiuw5k=;
        b=WQcRJ7Z65FK/7+pUqdkKp75OOYNe0WQjFo9Cw5blTqO239cCEwOFQZIYRnZC/dQ95J
         Z+7BGqY7HIIQEtu4h7s6r67mif32DQb+48H4bbOm1WbvK7AZgLVZ0rAuQbs+6/sR6bF7
         ty3+pNDO91++Due/cBCi7Kk//QXrlda/LRsn1wTegLtMxE0XOnHEj4pAf/fWrDg0xkXY
         Jlr2BhQ3MG46ASm/9QD0OxE/3r5+HQlytZAmrxVeyAlRMzqD+BDqps77XKQ+zTq2Slkl
         /yfoB2MKKPs1Myihdi0loj/EiIW4u2FBEo+EIK2xo2jjBLxORl8KKmP7Rzgk3LrvVxuq
         izkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IvlO0ppqF9UArsb4hIlu04eWVyRDh7e1MY8XEpiuw5k=;
        b=kTEmLvkzzrOX8Bf2ItYPoWwIXrw9/kJKF02B6e1vH5MI/F3sY76vG9ezh4I0oYWeLA
         T0LDLyN0rznloltTEgL4Ekh82aIxy0lbSzWWJ22Y0qId4LOOlUpiuSFTAf0oCpYzxQAy
         7/hxDmKTFosy+mBTNkj+A2rT1LorpBiWuRJM9oOKjMMsuZl+XESA0FqHRjd0cY50ExAc
         1bbYMfU4e57ppJ+++wN543IHflannecL3+dYci5YYc8pd2F/NrKv5DZC8hQiK3hGeoNq
         mpHQl7k2S7mtXnbsgQryyAYa40bw1+dlcBSZTrlf4QZcmWCEkbAy6UD7Ig4VUUU/2Gck
         hWfg==
X-Gm-Message-State: AOAM533G0U5lLhQwvViUvkzjB+aeRiGlJXdzAKTioIvpCV9kQBsGd7zI
        qk9dc+mDeirLJeYDkqI2cLE=
X-Google-Smtp-Source: ABdhPJz2VKUWk6KI0JO8VGpsFKkoIikz2P2rKNJOslir2jWvq2D49ff4HvuEEUnMhMtDL4+vNT/IJQ==
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr3556800wmt.26.1596635166313;
        Wed, 05 Aug 2020 06:46:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k126sm3077720wme.17.2020.08.05.06.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:46:02 -0700 (PDT)
Date:   Wed, 5 Aug 2020 15:46:00 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        digetx@gmail.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
Message-ID: <20200805134600.GA3351349@ulmo>
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2020 at 08:42:24AM -0700, Sowjanya Komatineni wrote:
> With the split of MIPI calibration into tegra_mipi_calibrate() and
> tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
> is done.
>=20
> So, this patch skips disabling MIPI clock after triggering start of
> calibration and disables it only after waiting for done status from
> the calibration logic.
>=20
> This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibration=
()
> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
> with their usage.
>=20
> As MIPI clock is left enabled and in case of any failures with CSI input
> streaming tegra_mipi_finish_calibration() will not get invoked.
> So added new API tegra_mipi_cancel_calibration() which disables MIPI clock
> and consumer drivers can call this in such cases.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c |  4 ++--
>  drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
>  include/linux/host1x.h      |  5 +++--
>  3 files changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 3820e8d..a7864e9 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi=
 *dsi)
>  		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
>  	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> =20
> -	err =3D tegra_mipi_calibrate(dsi->mipi);
> +	err =3D tegra_mipi_start_calibration(dsi->mipi);
>  	if (err < 0)
>  		return err;
> =20
> -	return tegra_mipi_wait(dsi->mipi);
> +	return tegra_mipi_finish_calibration(dsi->mipi);
>  }
> =20
>  static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long b=
clk,
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index e606464..b15ab6e 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -293,17 +293,19 @@ int tegra_mipi_disable(struct tegra_mipi_device *de=
v)
>  }
>  EXPORT_SYMBOL(tegra_mipi_disable);
> =20
> -int tegra_mipi_wait(struct tegra_mipi_device *device)
> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
> +{
> +	clk_disable(device->mipi->clk);

Do we need to do anything with the MIPI_CAL_CTRL and MIPI_CAL_STATUS
registers here? We don't clear the START bit in the former when the
calibration has successfully finished, but I suspect that's because
the bit is self-clearing. But I wonder if we still need to clear it
upon cancellation to make sure the calibration does indeed stop.

Thierry

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8quBQACgkQ3SOs138+
s6GBNw/+MTmEubphwcvWa9ieNScL1nFuVHEUP4lHuuvAbR/nUQ/vzMjHwCZsZKfJ
8LACRgG2l/SCkv1ei6v6km7tQHIvpCI1ceJgljHZK6Jfdl8NgAUryJjr6xugZ7SJ
DnAaqtE2j4Nf0Zi79PLxCXaOnU/nqALuYADJ6SOyyENnFwJnGnvHsjbhtvO94yMF
11z6PLDQzsncmWl0SRIVMF0rql+NG+Xb3aJbUeqfXRFzF6SvOd7H7taCt8pD2oJJ
+v+Mx6iqvkWFWeJ7e1IbYP7WhATL8c4kU6CcqKG7F+GW9Hrvh1NNw+R1k5DechLY
b64JrgILrJdsjCfvs9AA68US//oXHTGXHwDhjmHmHPQhLv2eZZ4cPjvjvVACYW9b
hUiwNJ4k1nsztAPewYHFM0ISJ0zGyO5AMKXG0k20EAFx/Tdu28hSUbOdlnWhu0fL
zSslBqdnsfBO1AAFMO5DS/2IbIangcLQWZbnA0RKb61znnLHhpf1RdmCauw0Trnr
ZruwSWQuqTXOgRD7FEqfXhVjjgcPjrHkVYaqpyRwNBKYOo1oHhbzNId34UxHZVa4
EYU2ePiPuO1BQFmJhbetHacampQoymghSlGmf6jCg6BUuN+gIWkJyeeVxyPMSsJJ
BN09B8wtbCeASpRN0fuFt2TgfmRh72SoyFSCi6yVgmEcfX0NfmQ=
=wSg4
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
