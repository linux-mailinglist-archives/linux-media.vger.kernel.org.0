Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EC99FEAD
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 11:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfH1JiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 05:38:25 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44359 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfH1JiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 05:38:25 -0400
Received: by mail-ed1-f65.google.com with SMTP id a21so2227585edt.11;
        Wed, 28 Aug 2019 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=flt9IxTDXpAAINorBs+AmhNQPGibX4knZjBXudoTqJ4=;
        b=mHCK2iBPcn4RtNqJIa+r3p4rW5ZGIZOZvbTBwUB3Rmirj/XeHZinLNpDMorcZRMk1n
         VS9CVZ6FmYUTjw9dlo5SJ5r2jpYufzwgYIFxtkiNCQ+4C7TRGeOj7jb7p2a9Klzo+HZC
         w84j1JjGM9b0NJJ1KKKwBxQFeSw51ULZx+inQhieR6vZFbBbWfBxcAyh5pMVQzJFcgZo
         IMbJ5AnDJDOYBEpRsXnPfkwV2ESCRS0UxYBzfwXpJhRfRAYIPJssFuY03qL33u3Vx1l4
         g9Ny+1jNBQ8S9IuMMb3R8rRoaXS9IhA+FjWZ44n8lYeIXd1PRnzYWB46lbDq3LeX3I9F
         2aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=flt9IxTDXpAAINorBs+AmhNQPGibX4knZjBXudoTqJ4=;
        b=F3cjbKQi3B7LGrNSnPrf+AjhUpeOMJiRZz1QI3JjlgmA+EzyRscqs6sq99E2WfiA/v
         7QI5mDPgryY2XlKwIZf8Cph9Znt3eM/kE3PzrYBonvsTbetuapzYday8epDm3mx7539x
         5lBKOSBOpJyzQRSqYdD/EBUVOKEbtnEcmG6VFPuV5pOj6AJleYBP0ft2atFBpVGLwBpf
         EgR/mESYN4TrfyijEFekA1hKFDQtSVZvgO4BqS3/KdZ7tryhgbnjnJAb01RgFElrSEzT
         /MwQXNIHQedkUepfu+xdgAufs9NC4985gxUHL9pboz/ooejIPNjhAbj9EezGvF+iQTSz
         pRXg==
X-Gm-Message-State: APjAAAXcfIjAIuv3AZWuEmGfC6Vo2NmFY9zF24tDMuoKBl7Jdk+QuVUQ
        5Z9VMg8yFM4siEpcRFw08JPyNug+
X-Google-Smtp-Source: APXvYqxRLGxga0d1nTuNK8TzJOX1G7Yg77gfwljepMJBzvd+Kbne+6dSBmtKBoGGAAZDPD+0b4iOMQ==
X-Received: by 2002:a50:ea8d:: with SMTP id d13mr2949950edo.83.1566985102474;
        Wed, 28 Aug 2019 02:38:22 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id gs21sm303630ejb.40.2019.08.28.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:38:21 -0700 (PDT)
Date:   Wed, 28 Aug 2019 11:38:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
Message-ID: <20190828093820.GE2917@ulmo>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
 <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline
In-Reply-To: <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 10:09:30AM +0200, Hans Verkuil wrote:
> Thierry,
>=20
> Can you review this patch?
>=20
> Thanks!
>=20
> 	Hans

Did you want me to pick this up into the drm/tegra tree? Or do you want
to pick it up into your tree?

We're just past the DRM subsystem deadline, so it'll have to wait until
the next cycle if we go that way. If you're in a hurry you may want to
pick it up yourself, in which case:

Acked-by: Thierry Reding <treding@nvidia.com>

> On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
> > Use the new cec_notifier_conn_(un)register() functions to
> > (un)register the notifier for the HDMI connector, and fill in
> > the cec_connector_info.
> >=20
> > Changes since v4:
> > 	- only create a CEC notifier for HDMI connectors
> >=20
> > Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> > Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
> >  1 file changed, 21 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/out=
put.c
> > index bdcaa4c7168cf..34373734ff689 100644
> > --- a/drivers/gpu/drm/tegra/output.c
> > +++ b/drivers/gpu/drm/tegra/output.c
> > @@ -70,6 +70,11 @@ tegra_output_connector_detect(struct drm_connector *=
connector, bool force)
> > =20
> >  void tegra_output_connector_destroy(struct drm_connector *connector)
> >  {
> > +	struct tegra_output *output =3D connector_to_output(connector);
> > +
> > +	if (output->cec)
> > +		cec_notifier_conn_unregister(output->cec);
> > +
> >  	drm_connector_unregister(connector);
> >  	drm_connector_cleanup(connector);
> >  }
> > @@ -163,18 +168,11 @@ int tegra_output_probe(struct tegra_output *outpu=
t)
> >  		disable_irq(output->hpd_irq);
> >  	}
> > =20
> > -	output->cec =3D cec_notifier_get(output->dev);
> > -	if (!output->cec)
> > -		return -ENOMEM;
> > -
> >  	return 0;
> >  }
> > =20
> >  void tegra_output_remove(struct tegra_output *output)
> >  {
> > -	if (output->cec)
> > -		cec_notifier_put(output->cec);
> > -
> >  	if (output->hpd_gpio)
> >  		free_irq(output->hpd_irq, output);
> > =20
> > @@ -184,6 +182,7 @@ void tegra_output_remove(struct tegra_output *outpu=
t)
> > =20
> >  int tegra_output_init(struct drm_device *drm, struct tegra_output *out=
put)
> >  {
> > +	int connector_type;
> >  	int err;
> > =20
> >  	if (output->panel) {
> > @@ -199,6 +198,21 @@ int tegra_output_init(struct drm_device *drm, stru=
ct tegra_output *output)
> >  	if (output->hpd_gpio)
> >  		enable_irq(output->hpd_irq);
> > =20
> > +	connector_type =3D output->connector.connector_type;
> > +	/*
> > +	 * Create a CEC notifier for HDMI connector.
> > +	 */
> > +	if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > +	    connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
> > +		struct cec_connector_info conn_info;
> > +
> > +		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
> > +		output->cec =3D cec_notifier_conn_register(output->dev, NULL,
> > +							 &conn_info);
> > +		if (!output->cec)
> > +			return -ENOMEM;
> > +	}
> > +
> >  	return 0;
> >  }
> > =20
> >=20
>=20

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1mS4wACgkQ3SOs138+
s6Hukw/8DvWhMV7uYDCsZIDHgnNF+l4WXu+x1XIy9XFt57KVfkbBW6YyYhAos1rx
4JSvHvWIdlB1AdTJacEqnxYynrMmfDrBNikG+0kFuUUwIeOdT+wRuOODFzGg7gZC
OvN+cADPyEDP0XyPZjv29B5+heSJnnLV6ziIENuVQaJA3QECOyx+K1hBheCLUXjE
fBUH9B6CpuGHvYtAqNu5i10kkL5sGIG/xjnHresWTHxrxwDHEIVBeryREjPdaYV7
fpafk17crGKST65cyIU0Be7h6WPEzCuybE5653TI4qM71ISJvhEsPnWY4ZSHBZXk
QWaKd8FtIuSuh6T/zkhzkfCBRAMyD3hluP2lPKOQLrw/oZqRTtyu4hyTFhxAIema
OeQeVY7aQyawoT3bSfWvhruPZ4r0wDxXCu0j2eD3so2AgGYBz/5WadYsCoZxGOS0
hzQayaCick670ZmDPJV/CiyzybkDN21gKpRzp/0+DXB837yCBlCK34bU76b9rd0e
J4Gy5wy32ja6KK2TxqiHBuPKyASjadwW5dYxDH2iNnSJxWbg82z15/ZBaUpYeIvF
mDhLxA6Cz49/iFXDsfTZcUpVf5JTADqNYYa0Yy1kBjFNXw/pwvgvp6wL0N5x20eL
mItPhPmbflgIE0KJvBp0S0h/sgJ4dxUTjPsEVFKD2KFLn7xbYJY=
=2whG
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
