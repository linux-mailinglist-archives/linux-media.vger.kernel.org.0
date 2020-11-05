Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3721D2A83EF
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 17:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbgKEQsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 11:48:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgKEQsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 11:48:46 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03731C0613CF;
        Thu,  5 Nov 2020 08:48:45 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id e18so2250479edy.6;
        Thu, 05 Nov 2020 08:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yX39kTh1HHCiE7a4ozj9S+V+l033SuDnzUBvvzJ5DSA=;
        b=qh8F9+Bv/qy6tDCwwb+PEaXxyVWA7Xq2gVdU1smCegVmFklmD+gxgnUaRGmQ0LODVr
         qkTIu7Wtw41lEWjrAiDZJwMwW3H9dXGEvkrVKsnpztVYnkSDHtmSN7nCOa5Xw7DuDU76
         kYrut4EaLB+TcqA3ukK1Ait/cG9RFUoNe6j6/G2K8guZNGpQj8n5HmE101VfTFgB8Ul+
         VOlhsdytM53K874JOG4FmneJAL+sErho7nMYAd9Bv8sODNEjbZaTGXHFAzyJM9+Pp7nV
         ASFaFZjPP3wvQ7VXrcinAw3Cjt3oqvQrhBpl0hphQVGfL0c29ZboNG8h+EuZHVy5fPqp
         1AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yX39kTh1HHCiE7a4ozj9S+V+l033SuDnzUBvvzJ5DSA=;
        b=MIjE74AJ96krtpZeblAHxxsmSF6+EE3vJmxUTVYIYVg2Zsf/YG7K0YlwgQ3aYl2nqU
         mctUHA5a3XhkbZaIrksUBqkL/ugHeuI5oS0Gr+pRiCQ0SuCOeysUbExkJ+Gw67BUNr7G
         bhXcrY1M+VM6PEubuAaEmRlyJvdH8yqITHZF+zfjv6kWc2gfu3LtvgUIT+76NjokGBDo
         Jy/56S4fWfz4q7/2TE958Mg9cy5LKDgjhsUpIRA2qpVyIEHPJUnKeIUTPVcyeegkBkfa
         gjr0CGPNl4MjW8NC8dhubZlCyfXS0f8ohYBb9M5nLzMw+RIm8fFRVKTf4ztNZrDEw7/h
         gLQA==
X-Gm-Message-State: AOAM532cxg0wcopPeWWqL3Olj/ge0SOgXRb6t84VGZebFKi754+B4sW1
        VJpMkHFHf7Hm2t00ljg/fCo=
X-Google-Smtp-Source: ABdhPJyiERgZeAUS31dkT4tl4RNTxwY6ZlLP3JkbXUfS5vHH5jSTMFA1rjwEXqQlBo5vKebs0Q+I/g==
X-Received: by 2002:a50:e041:: with SMTP id g1mr3548640edl.385.1604594923722;
        Thu, 05 Nov 2020 08:48:43 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s20sm1222145edw.26.2020.11.05.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 08:48:42 -0800 (PST)
Date:   Thu, 5 Nov 2020 17:48:41 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        David Francis <David.Francis@amd.com>,
        dri-devel@lists.freedesktop.org,
        Fabio Estevam <festevam@gmail.com>,
        Gareth Hughes <gareth@valinux.com>,
        Huang Rui <ray.huang@amd.com>, Jason Yan <yanaijie@huawei.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jingoo Han <jg1.han@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linaro-mm-sig@lists.linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
Message-ID: <20201105164841.GH485884@ulmo>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fd5uyaI9j6xoeUBo"
Content-Disposition: inline
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fd5uyaI9j6xoeUBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=3D1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>=20
> There are 5000 warnings to work through.
>=20
> It will take a couple more sets.
>=20
> Lee Jones (19):
>   gpu: host1x: bus: Add missing description for 'driver'
>   gpu: ipu-v3: ipu-di: Strip out 2 unused 'di_sync_config' entries
>   gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as __always_unused
>   gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot issues
>   gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as always_unused
>   gpu: drm: scheduler: sched_main: Provide missing description for
>     'sched' paramter
>   gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc
>     headers
>   gpu: drm: omapdrm: dss: dsi: Rework and remove a few unused variables
>   gpu: drm: selftests: test-drm_framebuffer: Remove set but unused
>     variable 'fb'
>   gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of
>     kernel-doc abuses
>   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
>   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
>     'analogix_dp_write_byte_to_dpcd'
>   gpu: drm: ttm: ttm_tt: Demote kernel-doc header format abuses
>   gpu: drm: selftests: test-drm_dp_mst_helper: Place 'struct
>     drm_dp_sideband_msg_req_body' onto the heap
>   gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
>   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
>     kernel-doc header
>   gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc
>     misdemeanours
>   gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
>   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
>     'analogix_dp_start_aux_transaction'

As commented on the other patches, the subject prefixes on most of these
look wrong, but it's generally a nice cleanup.

Thanks!
Thierry

--fd5uyaI9j6xoeUBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+kLOkACgkQ3SOs138+
s6HE2A/+PdAvZ2+F78DJkdsaNjJu085jUQleXGtXuqh1lQ+yUWWTHYiXOdmLAaru
GaEmINYkOF2LvdLY5vIwyX+TY2lp9PYd0oo4UHBKei3IrhrHzGM+f1mHxvDfp2fF
ENihVfG/CNzk1RUnCensuwsBl/NHC/yepie9ykDBthaD5cfAaMpcFxw+KIHErtBh
I0T8UHO2bbqaU8Oz3r0My3Owk4H/1sNgZ7GBvqKQeWveHpz2FenHke0ZI6tXre2J
zj1vtgcRPNl6cE3aBxlSd8uIhdjAjGK/iShwI1N868ESy4w4ahGOMdX4i+BRlRL4
bObmEnqqPIl7n7NxvBvCBZFJQ19RMtkhcAtBT/IbYSiEN4AOS/TFq9iGxXefgNbU
I3BfMXl4aFQMhIDYHxG97bSr4Njec7KZf1cfTPRaCpcluulvb2geKvwDdDrhtKZW
LQQjv0hq4l9EDHGMOq5QdyIL9ay13S+ctmBzUN/b5N4YdSyDw9Ixt141zH9Eygdm
L+BzflS3sGx9roS0adeanIYgqMLV558yzqnC+pg9yaaR/AtaredjWs9+hnpT3XVC
JltHngRXupmBTRe4i0+YGYrlHFFWTtR+TuWOH4tSHUl5oL5/DL9yjtGLvlB6lNbC
ohT4UGDQZ8lITaiToRQyBOAh54Zc485krb7QAPVT0HOfLPenxF8=
=euSt
-----END PGP SIGNATURE-----

--fd5uyaI9j6xoeUBo--
