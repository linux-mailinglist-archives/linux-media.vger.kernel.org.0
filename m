Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7818E14F106
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2020 18:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgAaRD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jan 2020 12:03:59 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37281 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgAaRD7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jan 2020 12:03:59 -0500
Received: by mail-wm1-f65.google.com with SMTP id f129so9541264wmf.2;
        Fri, 31 Jan 2020 09:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=58F7zyT4Gt8Jv+HIWHjnYuoDy/DyWZFGCw8VU7lvAUI=;
        b=l32bXeBl3PPZjg3H/2Ky2j/j4vSJ9lz/G9I8SI76KfLLU3PWEC4FZRy1XjQ0F+jmEx
         S8DAzO9koGaDWoUNUdv9FJ5sxEHb+7BpBU4vX3QvmDFvpagykw5UEO26F6rL5HDcUexy
         yjHyFCoomOgJvGDVxacccLRIyrpB07mtO2njMUYrZAYcA1yKAP0NPLFBswpVChpyqHXL
         HO0CBpHww3WRHeaG+4UcF2c39BmKJWoscB4KVptCHL/0OJSSZX/DrPgCuW5ldlc+Kk1S
         Rg4/2Xn7Y4ryg+lq8C5ga1kkpCPLUfTkPBeqXy03+kHzzTcy8G4doKb+P9+UG4x62bqJ
         +y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=58F7zyT4Gt8Jv+HIWHjnYuoDy/DyWZFGCw8VU7lvAUI=;
        b=Q5GOVW1oaolkBxsPmJGPeGHCbGjN/2HhlLo6DU/RNmNfTfQrwk0tH7Ar1dbhCE4uty
         JwaJwMKFMJGFxiKcEp2tPyap1ODuBMcadWN7hYD1NlQTk1xSNcrd7Hf3OHBa4Nbff/Ws
         Cq/Lx6YVFPxX+Yslc43HYlfgZK9eCE6fR2ifMmVL2xvr11rMwRI4BEVToFAdNPhUtny1
         jOai7azw7Ac4Ujo8k8gdBXgv5GGKfczZBJlSWr+/nX82uz4AYBXjUqHudiMz46bhPwIE
         72vuUXzQVCXnGqOFyB8cbUXEpmEEqSFVO6EJ738KmDsd2rwHCtK/IiswCGOKd6kEMwUb
         e53A==
X-Gm-Message-State: APjAAAWPOp++FCFcuMs7Nl+CN/HLAOkRYvEBD6DtN9oL1sTg/5DF3Kwz
        gtrhwBvgPSI+zKi2lzWXdMlT9f0m
X-Google-Smtp-Source: APXvYqy+KseS2b2EjbjXlyeRAfgSRMvISe6YqiG8AORffphYfX9BHb+/oyqC2D2eyQhH1ZOhER+AOw==
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr4007414wmk.68.1580490234575;
        Fri, 31 Jan 2020 09:03:54 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id n1sm12324520wrw.52.2020.01.31.09.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 09:03:52 -0800 (PST)
Date:   Fri, 31 Jan 2020 18:03:51 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        frankc@nvidia.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
Message-ID: <20200131170351.GA3444092@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
 <20200130154246.GA2904678@ulmo>
 <8654e6fd-c403-6e68-e5cf-09297b5d8b5d@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <8654e6fd-c403-6e68-e5cf-09297b5d8b5d@xs4all.nl>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 03:29:52PM +0100, Hans Verkuil wrote:
> On 1/30/20 4:42 PM, Thierry Reding wrote:
> > On Thu, Jan 30, 2020 at 03:41:50PM +0100, Hans Verkuil wrote:
> >> Hi Sowjanya,
> >>
> >> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
> >>> This series adds Tegra210 VI and CSI driver for built-in test pattern
> >>> generator (TPG) capture.
> >>>
> >>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
> >>> CSI port is one-to-one mapped to VI channel for video capture.
> >>>
> >>> This series has TPG support only where it creates hard media links
> >>> between CSI subdevice and VI video device without device graphs.
> >>>
> >>> v4l2-compliance results are available below the patch diff.
> >>>
> >>> [v0]:	Includes,
> >>> 	- Adds CSI TPG clock to Tegra210 clock driver
> >>> 	- Host1x video driver with VI and CSI clients.
> >>> 	- Support for Tegra210 only.
> >>> 	- VI CSI TPG support with hard media links in driver.
> >>> 	- Video formats supported by Tegra210 VI
> >>> 	- CSI TPG supported video formats
> >>
> >> I'm trying to compile this patch series using the media_tree master
> >> branch (https://git.linuxtv.org//media_tree.git), but it fails:
> >>
> >> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98tegr=
a_channel_queue_setup=E2=80=99:
> >> drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused var=
iable =E2=80=98count=E2=80=99 [-Wunused-variable]
> >>    71 |  unsigned int count =3D *nbuffers;
> >>       |               ^~~~~
> >> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98tegr=
a_channel_init=E2=80=99:
> >> drivers/staging/media/tegra/tegra-channel.c:518:55: error: =E2=80=98st=
ruct host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>   518 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
> >>       |                                                       ^
> >> make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegra/=
tegra-channel.o] Error 1
> >> make[4]: *** Waiting for unfinished jobs....
> >> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_=
tpg_graph_init=E2=80=99:
> >> drivers/staging/media/tegra/tegra-vi.c:157:55: error: =E2=80=98struct =
host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>   157 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
> >>       |                                                       ^
> >> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_=
init=E2=80=99:
> >> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_cs=
i_init=E2=80=99:
> >> drivers/staging/media/tegra/tegra-vi.c:213:51: error: =E2=80=98struct =
host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>   213 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
> >>       |                                                   ^~
> >> drivers/staging/media/tegra/tegra-csi.c:259:51: error: =E2=80=98struct=
 host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>   259 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
> >>       |                                                   ^~
> >> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_=
exit=E2=80=99:
> >> drivers/staging/media/tegra/tegra-vi.c:246:51: error: =E2=80=98struct =
host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>   246 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
> >>       |                                                   ^~
> >> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_cs=
i_exit=E2=80=99:
> >> drivers/staging/media/tegra/tegra-csi.c:286:51: error: =E2=80=98struct=
 host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>   286 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
> >>       |                                                   ^~
> >>
> >> And indeed, struct host1x_client as defined in include/linux/host1x.h =
doesn't
> >> have a 'host' field.
> >>
> >> Does this series depend on another patch that's not yet in mainline?
> >=20
> > Sowjanya's been working on top of linux-next, so, yes, this patch
> > depends on a change that's been merged into the DRM tree for v5.6-rc1.
> >=20
> > Thierry
> >=20
>=20
> Is there a specific linux-next tag that works? I tried next-20200131 but =
that
> failed to boot. Same problem with the mainline repo since the host1x patc=
hes
> were merged yesterday. It compiles fine, but the boot just stops. Or am I
> missing some kernel config that is now important to have?

linux-next and mainline are currently regressing on Tegra210 (and some
Tegra124) boards. I just sent out a series that fixes the regression for
me:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D156215

Please test if this works for you. If so, I'll send this to Dave as soon
as possible.

Thierry

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl40XfcACgkQ3SOs138+
s6GDmRAAgJOr7xCKB+TlGwZKa3pkGAekUaHfnLt4Dck14FCS4/nKcKtnfl2BhC6S
vDFUljkoNey/1GrYDgW7CXJqkHce4E88HAO9kevpUOp77WYIQ6POh11X4Bvra/KT
tGqjepiQ2MTVZP6J0XDD8XOYevyNmjbQxG8jEBwrHetZ3S8+ptCVEbFm29MHTcSI
A4VHFRBObnxiuk3ITVx0UX98TbMy/2PElfD8OaCEq/r6qgl11WzukKxk1VMd8DAb
lT6zg2ndwDwq2uK7lIIPg3hSPyRg5bxa5MVpUlb9UA+pwGD04x5P2lxvYIOFs/wl
+FLMEiM352WunWcOOJBIYLokppzNPHN9ItKDMTZS6nDQi87EV6vqAY/NvOOhK3QL
8Inuj+EHMtxajemhBFmqN1KU2gGGy+SDmYjbWXqLmLcrSbY48fNn5L6n/FdtSWGa
UTDePIgG7u1tAJVnpySXc3GM9ch4JAgt37ww3Z8Z8orIdo7BowD/yko+VcIVJuH5
lvvfu6zcNZOUhBTeSHd45an+twZdpdSIPdaXHNDcQUSWNIE+42lSeXFBMNMN/qGe
AK3axSiGjfCsD/CAT/wBtlUftBxTFenfstGd82HMpxxfG//E8FpD/t/vzE2WM3z6
75Ns1wysRwLAR9Rc9uY+zgSQT8iDv8OHDkVIpN16F+L9bKkFk4Y=
=VUdt
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
