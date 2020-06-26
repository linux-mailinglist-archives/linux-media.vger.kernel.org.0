Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2443120AD7B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 09:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgFZHo4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 03:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbgFZHo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 03:44:56 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2D6C08C5C1;
        Fri, 26 Jun 2020 00:44:55 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id rk21so8446967ejb.2;
        Fri, 26 Jun 2020 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kU/B1sJTuCokA2IOHzhwK6lGdLVmn0o+3nqsLQjCX/w=;
        b=uqOwG7jfmszvkBS98WHWlb+ErrJ3rplWAe1N+tZ70V6gaxZaIssqgJplr0HsImtDW7
         MS5sqzqzd3Zvuw1kFVHQH/ZuVjoxvGMhrdsarRePzpj0V1HRWsZmmQaoMFuHswB5t8Ql
         Y1WoO6E2ReOoLvnNjpH/CEe7yJS/MVMjnywLFKXCHcg5M7ey8FpGBHoNgBlJekFHuCSy
         V1lUpAE0379jXn2j8iinYJu6oQufioWv97KjuopapfQ3gd1edf28x8yFldi+a7+F3k3I
         m2AAQS1TMRoFfhxa+0ERvEnLPVPa+q+Afv4rQjSMrlSoMI6zy5BZ3T9FFCpvkfmnIsiJ
         tt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kU/B1sJTuCokA2IOHzhwK6lGdLVmn0o+3nqsLQjCX/w=;
        b=fM0GLK+kOUtZ8Gcrv+hixWRmBK3fAh48QU1ZYU35uC08UIbCIX68ZSez2f4K8HEmLZ
         DvEHVNVEaS3g0iv1pj1djNAxo3Av7Fhw2TECvybApuDGXQuz8OCZBOR2zoulhzxDdLZ4
         VgbHWOJyYMoJaZOx+qCPzpyo5LE9xB/7g26eZlqp0HjhQ5DzS/yUf/7Il4ws/gYwaqHb
         9YDbej3Z/dXE7XglyfzrBwI5rlzUmwAIdixl8Jsqd5VWhmftfvoPqYujbVEXQJ4VaWfa
         pbr8jJqphg+4KNpgwxHr6VRw9N0vIm0n5O+MKSkn+XyHwGpGPQiKjuGdAChBBa1qAZjy
         qazA==
X-Gm-Message-State: AOAM530IaMS8VgUAntFF4O20RRIRxQLRT7/KSssRAlh+OCaKlQ5ShTuM
        /Yzy08L46lcs9msIPPPw4+E=
X-Google-Smtp-Source: ABdhPJwgDELHR/pkSZSgsSrSDw8660GOT3i9Uqby79Mu8x0hhTO7jsPXBWxdQfzdQdyjsShYWq3dIw==
X-Received: by 2002:a17:906:1c05:: with SMTP id k5mr1400352ejg.320.1593157494786;
        Fri, 26 Jun 2020 00:44:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gs6sm4815776ejb.93.2020.06.26.00.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:44:53 -0700 (PDT)
Date:   Fri, 26 Jun 2020 09:44:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: staging: tegra-vde: Runtime PM is always
 available on Tegra
Message-ID: <20200626074452.GC3109062@ulmo>
References: <20200624150847.22672-1-digetx@gmail.com>
 <20200624150847.22672-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline
In-Reply-To: <20200624150847.22672-3-digetx@gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 06:08:45PM +0300, Dmitry Osipenko wrote:
> Runtime PM is always available on Tegra nowadays since commit 40b2bb1b132a
> ("ARM: tegra: enforce PM requirement"), hence the case of unavailable RPM
> doesn't need to be handled.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 16 ----------------
>  1 file changed, 16 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl71p3QACgkQ3SOs138+
s6G0vQ//dpkQN0nsvPYnk0HeH8sLhO6u9BWqfrWsCUM8ZM7Jr+G08Q7YjDLcF72K
awBVBLgjK0ZkBXmMoT64J57xHfC7O9747zPiPedoCntFPjYTC5cLXVW61LRLrZFD
aGRLXJ50YQCf5bshtmRfK+PVL2bcXvjV2fJUP+MremfE24OALFW3IkFP13BPhxVs
d2fYwTly8qqAu6eG4vj5b4wzd0u1d5Zq0qVIxE2kwb26jY+8qtLZz8Fm0d1P1jYV
FBen5xgv1x2G1KKedLyHakMXh3EjziF5SARiuM3KqpOtf3jQc3niXfxuK2ocLb43
PvpaMmCpKP9QPPcWPANtLdHb6tIpTKdvzhqSmoKKyZ1mfsr4P9Wou8V0j/csTP5q
vn4DuAaZp3ub76f84RSBb3aPen6Xtx1tALh0eONWFiuKDzKdbEDKxrO19t5eD3Fx
zSPijXgN4kxRMyDgiHIbUNMMdoF69fhO9lTB0zgl35AFM8YV3G5MozNtl8pB/ZSk
21BaDXvsHvPIuI6glZGVvSSDPDRpEz/DAu7MNOeMkOSy5vNz3mOHDhAL1gMVeU4d
KcRkYSlDnfyHizQIMTXzfsgnTazFFBx8UaKwhsKEP83xJpCeULZehO2vKib9xKJm
m4ig+UbpWnkync+LRXUGBph3gDX8yvoTaRjotANmfK8upi0VBu0=
=8Q9h
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
