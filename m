Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74AF21C61E7
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 22:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgEEUW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 16:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726593AbgEEUW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 16:22:27 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E319C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 13:22:26 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e26so26067wmk.5
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mqp0opob5dHMsbM+wVeQvxjL23WYmCWYmgdBF45oVMg=;
        b=Tc2T7XB0Jmr807zQPLiFQRUShPWPZPItzr1iqaihpvl6BrlpMHIxvJRCh60f/+iCyP
         /WDXtmGZpMcGv+bxiTL+UB5+1hcWnj7LTowCRIDsGUGNttCjwFJ6oHiKNLEz/fXto6Z8
         4pIjo0izT7/fDzVvkv1ijpVT8IkvFubQGazW7IbQru2NvHozjgGr9d6r16iaO9gOLvYf
         o1OmzlM7JnNXaVZWk+obJsyeKoksPOJN7DKHqMxUli9eR5DJAQDIRfwkA92dP7eIo5c/
         NyCWkNRaCpiPKJs7N4zRgUfKrflMjm4vrl73o+fUP+DYdo9xHApH4O3Hwc/i8cNDRALB
         gp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mqp0opob5dHMsbM+wVeQvxjL23WYmCWYmgdBF45oVMg=;
        b=dBzIPt14eGEFirEIg05S+/kMulekMqmzF83VH0R5GDgXlsAIc3u6fXLaLt9zAiplV+
         STBosbObZJP/ZEWQ9CzoS/melOIR6d0d7pwCJOE/4JzrVhY+vBs4a/VCrPuMtW4GXeS3
         6CJk0+lb/K79NjBzHpzuCP0PWO8eMoIlzCt0s+iJxhvfxfyDhxwSro0YMnsi/WEygw5Z
         GGy40xXCf+zFvVFl2ZkSTUQapHyA7hoVwKQKdPiY/koxj2fgmvM1Hjg4dpqh/S2hizEX
         kERd8xIi4TEkHjztsgDzOVJAfqHL4UMO0oedhRhc26MuqQ8SAB2+NG/MpPi1IFCjmn0d
         h0eg==
X-Gm-Message-State: AGi0PuZx5ZtvzTujZ2Lab7Hj+oW0C3WPNDkK8jVg6oi0v2+DhEHzVKKw
        LzNsUhct/2/issl/99AZu9U=
X-Google-Smtp-Source: APiQypIE+yNFr/Zz2jWA1pN15iQxo5r31cmUmhRIIjIPt/yJnour2rEfiaFS1FzUWxC70bhDkSm0Fg==
X-Received: by 2002:a05:600c:2284:: with SMTP id 4mr372001wmf.97.1588710144261;
        Tue, 05 May 2020 13:22:24 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id o129sm5781836wme.16.2020.05.05.13.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 13:22:22 -0700 (PDT)
Date:   Tue, 5 May 2020 22:22:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL FOR v5.8] Add Tegra210 Video input driver
Message-ID: <20200505202220.GA1972539@ulmo>
References: <c95abf33-bfd4-489f-2c20-536e76b848ce@xs4all.nl>
 <20200505141735.53526ede@coco.lan>
 <fa23e434-6a04-aa11-ad0d-ca546914a328@xs4all.nl>
 <20200505161555.2c4ddfcc@coco.lan>
 <3c9e6a28-fc6e-0e4d-b7a0-57e3f2e1b206@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <3c9e6a28-fc6e-0e4d-b7a0-57e3f2e1b206@xs4all.nl>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2020 at 04:26:04PM +0200, Hans Verkuil wrote:
> On 05/05/2020 16:15, Mauro Carvalho Chehab wrote:
> > Em Tue, 5 May 2020 14:24:22 +0200
> > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >=20
> >> On 05/05/2020 14:17, Mauro Carvalho Chehab wrote:
> >>> Em Tue, 5 May 2020 10:33:00 +0200
> >>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >>>  =20
> >>>> The following changes since commit e51759f56d314d28c25be7606b03791f0=
48e44c7:
> >>>>
> >>>>   media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_s=
td_compound (2020-04-29 12:04:58 +0200)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra
> >>>>
> >>>> for you to fetch changes up to 0bba0154ded02babccd59e21c6a27c5ad7d50=
faf:
> >>>>
> >>>>   MAINTAINERS: Add Tegra Video driver section (2020-05-05 10:26:05 +=
0200)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Tag branch
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Sowjanya Komatineni (2):
> >>>>       media: tegra: Add Tegra210 Video input driver
> >>>>       MAINTAINERS: Add Tegra Video driver section =20
> >>>
> >>>
> >>> As pointed by checkpatch:
> >>>
> >>> 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-docum=
ented -- check ./Documentation/devicetree/bindings/
> >>> 	#628: FILE: drivers/staging/media/tegra-video/csi.c:521:
> >>> 	+	{ .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_s=
oc },
> >>>
> >>> 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-docum=
ented -- check ./Documentation/devicetree/bindings/
> >>> 	#3238: FILE: drivers/staging/media/tegra-video/video.c:106:
> >>> 	+	{ .compatible =3D "nvidia,tegra210-csi", },
> >>>
> >>> and double-checked with:
> >>>
> >>> 	$ git grep "nvidia,tegra210-csi"
> >>> 	drivers/staging/media/tegra-video/csi.c:        { .compatible =3D "n=
vidia,tegra210-csi", .data =3D &tegra210_csi_soc },
> >>> 	drivers/staging/media/tegra-video/video.c:      { .compatible =3D "n=
vidia,tegra210-csi", },
> >>>
> >>> The DT specs for this driver are missing. I even checked at linux-nex=
t:
> >>> there's no DT bindings for this. =20
> >>
> >> Sorry, I should have mentioned this in the cover letter: the binding f=
ile
> >> is here: https://patchwork.linuxtv.org/patch/63576/
> >>
> >> But it will be merged via the tegra subsystem (Thierry Reding) since i=
t is
> >> part of the display bindings, not media bindings. Also, Thierry was pl=
anning
> >> to convert it to yaml, so he offered to merge it instead.
> >=20
> > Ok. Please re-send the pull request (or just mark it as New on patchwor=
k)=20
> > once the bindings arrive linux-next.
>=20
> It's still marked as New in patchwork :-) (https://patchwork.linuxtv.org/=
patch/63596/)
>=20
> >=20
> > Alternatively, I don't mind if those patches would also be merged via
> > Tegra's tree, together with the bindings. On such case, feel free to=20
> > add, for both patches:
> >=20
> > Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Mauro, do you mind if I turn that into an Acked-by? I think the ARM SoC
maintainers may prefer that as being more of an explicit statement than
Reviewed-by: that it's fine to take this through ARM SoC.

>=20
> Thierry, let us know what you want to do. It might not be a bad idea to m=
erge
> the whole series through your tree, as Mauro suggested. It keeps everythi=
ng
> together.

I can do that. For ARM SoC I typically create a for-X.Y/dt-bindings
branch where I collect device tree bindings patches that don't have
a better place anywhere else, so I'll probably stick the DT binding
update into that branch and then I can base a for-5.8/media branch
on top of that to resolve the checkpatch warnings.

Actually, once I have that I could even just send a PR to Mauro to
take this through the media tree since the dependencies should all
be resolved. But with an Acked-by I'm sure the ARM SoC maintainers
won't mind picking this up.

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6xyvYACgkQ3SOs138+
s6H6dRAAqbONlTQV02Gic3Gonz8C3jt6csuWQB4OC2+wa0BeoKQmAOKd1v3kYLpI
HfnJn5ONJ3JHMQVFHSllu/7UwpMWjkbMVDC/Wu9MJcNUKoqrijgvsSXHlg+y/qbc
EqfnokqQG8aMyDMO4twV82zcOIgLAP4C2DJEkxspOsP5zUjDkb4BrNojjPhe48M+
MopZq7pkVLDnklR17V2BD8REy1uIMNVqumOoMP8oq4DXNgrAlDbgp6foaGP0Z7gR
lPJE85bTuj7aMXtGvPadcWDz1QLDJq/OyTRHJsTo0wnB98Z2f6kop9+AQw397HP/
bwYSOQ9SWGl8G10xxbgI/Y3QjpRbicl5MOV2q45kf0JA4efyYNW9whHiz6nNdnYZ
yskaHJW+0HfjBqxtOzMKSLhZbwe2Eei2JbswIzRXr9un3IjdSd6aRn7SZrD+NMSH
kCnkGyXjU4yckePNOscWq/PyA90HuqlTCCY6Ieo9P9bYbavZNXEz/f0pupT/tA+0
g9o/AOLSMZBJxm/uUAxVne/s3+JsYNLn5/KRphkQOb7JFN/n1HDYj8clbz5ViV+A
aO94Q1OXXwZk6Lkic0Z3csZkbN3GiQF+hZ5hrsa3woqlUEVhSNMCJVhseuwOqaDM
Dr2Jg/pzdBGrrbqZp9pv036zDNxuZWAp55Crw6C03JWr1WIh/+Y=
=1ZVm
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
