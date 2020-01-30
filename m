Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 057C414DA8A
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 13:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgA3MVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 07:21:02 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34380 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgA3MVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 07:21:01 -0500
Received: by mail-wr1-f67.google.com with SMTP id t2so3823155wrr.1;
        Thu, 30 Jan 2020 04:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=39kKGSsq/ObIawmRn5Y1+axiVM/RiW/k7k81hkLQRko=;
        b=oo5DZEdTb3XjAOtMywZUicFSjYM+vuNT+aYsFJ5fHdEK0MvAU8ag7x5JNILJr07qNI
         0sGA7fXgaAhgD0kNkPT9V+DoHZkeDYuuhjrd8bHButpUvM1XzVnyQHZ72ByCxDk7XGIT
         PtkoPEpf0dM7iKsWCL5gmgffZf0Say7AdBWqt3FzX5ez/lbjm2xznyP6m3XEXAl9rK7v
         o0dy/uznwHToU1ACefu1SctXFI73OackEEGD6wKH/Ft63JUMHjdoq/gROTb6deg17r28
         iF+xvK4ZyewjQdBzfTNJGflEpkFJXqxF6yMKYYJ6qIzL82LBWeI7UWMdDVD0kZN+JJ1o
         tiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=39kKGSsq/ObIawmRn5Y1+axiVM/RiW/k7k81hkLQRko=;
        b=l6wqIi7pVzedJ2jBkp6FrDj39qzCjrPLNAoeFogunjxlL5m2DsUFGY3H0vXOhbWsEG
         UutVnAlPq3ui85YFtMjBw2aNJ7/dXxG9/UmBj2bDiuVmo5goMQ2FEt50TplsIabN+8fJ
         Ntic+TNVzs2t4KURUziUG762EiGfGyj/2xBNvaUFiNtNTB/GEZufNBsW1FoT/fTPS3OX
         dp4a4ZapBMiivF4B4mSVXMHCN/Rk8CQrg6h5vA6zZ1JlEP+0hYqYpCVvwGiyUrIEIrvA
         HSTi4FE95wsYgH2Ifq/A+yBzHu1zuiKmLBOZ19rMGBBSazmFOFaTtaRitJ2JiyUaRoUG
         L9SQ==
X-Gm-Message-State: APjAAAXKPZ41uHcxllt6Dt+ZM3H24AkDych8KDpeSn6AuB5PjOAA6zct
        BagC4sDZX/khTivyvkY7ggN5ITSG
X-Google-Smtp-Source: APXvYqyxv03XTlw/35Gt0k++PPZwBCYXIg/xJFHtkjG8IrqT3QT85s5kM89Y38/s+l0sWBR5FrZ0WQ==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr5424825wrs.187.1580386859077;
        Thu, 30 Jan 2020 04:20:59 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id o129sm6081097wmb.1.2020.01.30.04.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 04:20:57 -0800 (PST)
Date:   Thu, 30 Jan 2020 13:20:55 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input
 driver for Tegra210
Message-ID: <20200130122055.GA2584455@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <20200129111340.GF2479935@ulmo>
 <070f9a4c-1919-f3f6-fef3-ed0a84cf5776@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <070f9a4c-1919-f3f6-fef3-ed0a84cf5776@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 09:23:38AM -0800, Sowjanya Komatineni wrote:
>=20
> On 1/29/20 3:13 AM, Thierry Reding wrote:
> > On Tue, Jan 28, 2020 at 10:23:20AM -0800, Sowjanya Komatineni wrote:
[...]
> > > diff --git a/drivers/staging/media/tegra/host1x-video.c b/drivers/sta=
ging/media/tegra/host1x-video.c
[...]
> > > +	media_device_init(&cam->media_dev);
> > > +	ret =3D media_device_register(&cam->media_dev);
> > > +	if (ret < 0) {
> > > +		dev_err(cam->dev, "failed to register media device: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	cam->v4l2_dev.mdev =3D &cam->media_dev;
> > > +	ret =3D v4l2_device_register(cam->dev, &cam->v4l2_dev);
> > > +	if (ret < 0) {
> > > +		dev_err(cam->dev, "V4L2 device registration failed: %d\n", ret);
> > > +		goto register_error;
> > > +	}
> > > +
> > > +	dev_set_drvdata(&dev->dev, cam);
> > > +
> > > +	ret =3D host1x_device_init(dev);
> > > +	if (ret < 0)
> > > +		goto dev_exit;
> > > +
> > > +	return 0;
> > > +
> > > +dev_exit:
> > > +	host1x_device_exit(dev);
> > There should be no need to call host1x_device_exit() when
> > host1x_device_init() failed because the latter already takes care of
> > undoing whatever it did already.
> >=20
> host1x_device_init can fail if any of its client ops init fails.
>=20
> So, calling host1x_device_exit here to undo the things done in other
> successful client init ops.

host1x_device_init() already takes care of undoing what it did on
failure. Also, it makes sure to only undo what had already been done,
rather than tear down every client, even if it hadn't been initialized
yet when the failure happened. The latter is what would happen if you
called host1x_device_exit() to cleanup at this point.

Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4yyiQACgkQ3SOs138+
s6Egvw/+Nt0LgFzPcflJKTBtvEJ+MNiUId+X2Lhb9zZ6HgVKJ2WZqabYUUydRq7a
RePVuSe28Q9GPY7XIBS5qLsaglkrI4TqELRyOFzBwrhFGg14XQbeMGs84IDTLfd+
okiQvOORTCHDzhYfyYU1Fn62+IVzAV5hXsMfYDKo1U43JgocUfwDlateRn7E47HI
T/sQbQ7/AlxY+9pWPy+pBErXZ+PxbbHnotTlM1pCYO3aQIueOJwUo3PpXiUg1oSa
DtFxxh4Ez8dfOpb5JEU35/URi2yUNlFGuuAb6d7rAVwQXm9bcIdUZcnwd7ICUSD8
qiZo88c/s9qb8niupzp4kWP1oq6ddk0QWQ+tin3Pk5mtp3+6OXZLzwYYnYBI+UXm
y4tcfSLc5jMn9VpLg3aH5cZjPGBg6Iv3Elku0+iIZQLBO48A1YRd5g1+uDjl2D/g
3Ee0mA/zX6XcjAj0OJm/tM14mNgQTrORC3xZ1uY/4iYrvFPaP/yO+4ijaxo5bWhX
qsJmfubdA5Uz9Fp3TLkiBsXuiJ/3yJV3NCG6Ci86nFhGBBjsbYBYite+k2O3sPNU
s8T6yjyIPnSF1eJPZpr0BUVgR2FMc8saU3Hyy38qpTDGbAREiMHidYG2u7FigvAS
NV5GHdLs4DAUf58P5f2EVPmVVVqzhxgC4kUaaP1HHGvJGJUVflc=
=kfTx
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
