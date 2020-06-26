Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A5820AD8A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 09:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgFZHsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 03:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgFZHsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 03:48:22 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC8FC08C5C1;
        Fri, 26 Jun 2020 00:48:22 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id b15so6176690edy.7;
        Fri, 26 Jun 2020 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8ZuBpL+DueJSj3ESdnpMvaqVHDILjG0S2PgRb9yfKf0=;
        b=JsjBhJAgNeURhM0Py1PIcRXRuE04q42TcLg5/ef9+czyB3mSBr9hia7pSc7mm1qjTQ
         +r6bvyODJNEZgoJfjX6jUyVFjzir1Im8jqNrNIBDa0QAfbT6ghdgd4DDrPH/ekSy48/7
         V7mKlGZq6KOVRVkAzs+tkDkzWfHc894J2WulMQ4sW21d03SWgaIC74Ri/2C0mOc69k29
         yteCpAzK0T4J2Vm7uE3/XE62sjl5SJzAp9X3uMyNuH3dQSMK+/TywUcnt0qfkDHuQJqC
         T+9pUF4ERbpuS660WVdVaSdv7hoa/lvXZPQiewzq2LNtDSHlHIYgAKmvlRoP+XEVhO7W
         uISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8ZuBpL+DueJSj3ESdnpMvaqVHDILjG0S2PgRb9yfKf0=;
        b=ql4p8tKwP49ALdVMZeMFCbBS/SU3Em8mdvlO1wte2vxk+ZmAFoy9+b3sZSnDgUduFN
         6FGBndzZ776FXAvLvEioMS+hBjzaCMdaFWUS4myO3S9/La7GPYsPKAi4Pg4cUVuhWCtf
         kjloayfIF0/Bw9bOELBt4tyoUFxxMPTejHDck5BhCWv75ta6q2iG4SfLPTWodjD8YdaK
         q214yPDGTRlOR96qB9vMOHy4pxDWOBltbRAgAZFMrh++sl54aw/zxflDvqZVUlqm5cDs
         RwxMNC3SC3U2RVwlNZKyUTOqwfChk/0OXnj9N67c9rHCGwcHvaNweTF2eJHzVVmkoAGW
         c+9w==
X-Gm-Message-State: AOAM533luGpAqxNqOIkArCD2ehNyF2d+NwWYnOO6bbp5hR46S2d6EPn3
        acpJaY8/4zJW8nCjnROef9M=
X-Google-Smtp-Source: ABdhPJyTPMnA4ZDNUga7Eq86eb1GfwZHTZUs72CRpch7F3Xlk9TokAP7DIwzvavrBSv1H028kYyzzw==
X-Received: by 2002:a05:6402:b6c:: with SMTP id cb12mr2125748edb.116.1593157700838;
        Fri, 26 Jun 2020 00:48:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id lx26sm18372419ejb.112.2020.06.26.00.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:48:19 -0700 (PDT)
Date:   Fri, 26 Jun 2020 09:48:18 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: staging: tegra-vde: Power-cycle hardware
 on probe
Message-ID: <20200626074818.GD3109062@ulmo>
References: <20200624150847.22672-1-digetx@gmail.com>
 <20200624150847.22672-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline
In-Reply-To: <20200624150847.22672-5-digetx@gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 06:08:47PM +0300, Dmitry Osipenko wrote:
> VDE partition is left turned ON after bootloader on most devices, hence
> let's ensure that it's turned OFF in order to lower power leakage while
> hardware is idling by turning it ON and OFF during of the driver's probe.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/medi=
a/tegra-vde/vde.c
> index b64e35b86fb4..3be96c36bf43 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -1068,6 +1068,14 @@ static int tegra_vde_probe(struct platform_device =
*pdev)
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_set_autosuspend_delay(dev, 300);
> =20
> +	/*
> +	 * VDE partition may be left ON after bootloader, hence let's
> +	 * power-cycle it in order to put hardware into a predictable lower
> +	 * power state.
> +	 */
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_put(dev);
> +
>  	return 0;
> =20
>  err_deinit_iommu:

Shouldn't this happen automatically? My understanding is that power
domains are turned on automatically before ->probe() and then unless a
runtime PM reference is taken during ->probe() it will get turned off
again after ->probe()?

Is that not happening? Is auto-suspend perhaps getting in the way
somehow?

Thierry

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl71qEIACgkQ3SOs138+
s6F2BRAAqITs8YO7f90qNTucc+6aVUaPhcOoeLRSA384Hh4M4RfzKwKV1ivLrL4H
VkMWU+BB4N5ABiJxNbLnwuvh6O7y9vg1l7ovi/lg4qHTj96GmdZAuXpEFsqG2VWY
WMUX60Wc3x6vqhJPVnroCRj++WmA74nlzieWnzrR36wF91p7lpisLNjlGY90VrOq
nSatzzNO2Na9BEQnVzGqxYU7OThPB/MHJOviY5X21SXWCluc40tb0Qz4d8pbDUqB
aXQ0uMNrf8kgX0YyARa+R+U8op8R9oRTkgRCf1SHwifbb2dlnjIw2sw27ORyfzr8
h87kcTOlkTZhxehUG7eIHpyIUmgCWpXtBwt+Blww0o28LxW0+yEQHymenMlUNtY6
18mSdMQGO2k6dwgWa2znsETezLrv1lYX2nT6FxZ6niTzYZRPiA2WJ4YTa79h5yDJ
KtbvBz9b2kKzMl6R5084U2P8fh7tZH2oTs3W6n3f/NnA5+eGIBeCKu1wLQrh1M9u
2bTTPOrJOhAQMZiJCq6CJ4Bmr5+X7Cmp5bTkNOiY9lBweTpWcJHAWqgybEHCajEf
0dTnrWm4BVwGmfYUDNsm8rffkO/avUUvYBC21kZr2ATYWkrYQyheooiYC5qNLJFL
lJClO+wrkJuTqWiyB0BdOJ90jHnFMolBZOjTN/Ot7BkPCgWo8uE=
=0TFC
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
