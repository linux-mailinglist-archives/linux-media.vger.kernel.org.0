Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFEAD622C
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 14:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731881AbfJNMRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 08:17:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42265 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727948AbfJNMRY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 08:17:24 -0400
Received: by mail-wr1-f66.google.com with SMTP id n14so19422637wrw.9;
        Mon, 14 Oct 2019 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dQgT5H/Xc9q+3AtDVp2JNpLmcY62zJNWlUUwGtmQ0Wo=;
        b=JWn/gz6zswsVuo5VIsfT3FXmgtFAz/Uqwy63Qq/Ua2Vd92gl5Iy9jzykSzF2aV4Lhi
         2tooIsOVGIw2mrcgajZiU3L41ihUA7yDWsBBdjtnYaedrQC6yoZ6eIXFnyQ5fZRo+qm7
         X+y+YW7Oea7C7ZOesXyDyQA5sVQFToRwhs4MjcfMzM4w4Zc5VTi80JHh0OkOYKTw/A9A
         jWQShjNFBkRQWuEKjiDwzFqV9pdRTql9HP0YEvYII8M2M0f1X35eo6DMZCChf3hYEX7L
         5MAVhVtmsJeFaML+hOAoh+ZdM1sUIOAcL2L/HYad2XoVI9ipraBxCz+XyPA25Lrc4tBj
         +cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dQgT5H/Xc9q+3AtDVp2JNpLmcY62zJNWlUUwGtmQ0Wo=;
        b=l2zREVgTPGZRG3d0SCADYUB8zoEQNlRP+6uQD+M53Y/k6+RyTYhE5NUtp9LhGcGJgC
         zm4oiR34oR8AO7n2CAl2h3FmezboLWhMQ6Do9GM4sV/uRoyOC1OExqdfaU9/XIF0qcet
         Qk0TPaLnzyIqxdsxRhCJH7PYXjH48JQJnaLkhB1XJ1b735c6aOgTm8vABS37TR2dJ9rV
         Xtxl8yRdVJ4WH8wtzgREDwYwpzEoI9v3vE/XrOM6vHNebYbWSr2EfzwnnJRILm1F7OTC
         9RcDgPM9QI8XY8JRMiUoYklSwazJcpwo+qZYl1saYFLkW6NQCEgh7duee4K4Gag0KKWO
         rVlw==
X-Gm-Message-State: APjAAAXYeD7KOnpQIBAubkvOk6zZVvK2WQeMsDGYw9Sie/zbvluRoljy
        Oiw/KiPDkHaHWniS9MznorA=
X-Google-Smtp-Source: APXvYqzetdo3YCN8COK0mky4NkK9+49LZYZHk+TML/4W+y8fO3M80yj+cto3H+SDIORaGJrSA+Getw==
X-Received: by 2002:adf:ea07:: with SMTP id q7mr8912608wrm.102.1571055442619;
        Mon, 14 Oct 2019 05:17:22 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id b130sm28589013wmh.12.2019.10.14.05.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:17:20 -0700 (PDT)
Date:   Mon, 14 Oct 2019 14:17:19 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
Message-ID: <20191014121719.GB422231@ulmo>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <20190814104520.6001-8-darekm@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 12:45:05PM +0200, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
>=20
> Changes since v4:
> 	- only create a CEC notifier for HDMI connectors
>=20
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2kZ08ACgkQ3SOs138+
s6HRvA/9FCMG8xuBzW58WQPgv7upIyoGmbyjXMcB+GZHiu/ziLojFw2/6AHUVgWv
vUdbN79pMwLpJ/6fyDlltaeB6y9U4KSJ1B8+0CzAivrc454O/AflNVE/Eq+GNvWY
bZSicV3BhRfZcQ99FpApoX/RR+RWqJgSCw7FGRFPnV6zODoHzTrceTABesfyajku
uG15X+iKJn+BLWnXBGUCzJAVOmDARdUipNrGZX+sz0YlWTEw7RHMrKWyErmjy0AE
HUUsxB5jLFZu5oBii2NangwZCb4vyGsFSmxHYeUzKVeg1bSymdvN9tPbDARY3084
KWbqqQ52vZD2dNDWQbzWAKWyFYffjBT88FdfZVM1RGTlR//6cFk3takN7xoKCHjv
E2zXdDb9jj8dhoJZrEUN/D9XB18jsDMU88+5zpsmNTTd0kBhzbNg1bqhoYCXyfsj
wRsTfHhicnPWBPEUyLhukyWiAqYDoOzCkPylPMe+YRte+n3ENh+BqUAGkwW9gyZJ
x7efFoQs4mCeEFcNl5A4a/DHaqH5q9FY3+193To/+lHXsH9vMFlner04WTp0UTa3
Vk6xW57T9XvbY/dLcA80HLQWcObfsIgLPRinUhs/ZKTIrvEhZImWIKQqX+vqYLkQ
3Tri2+gUpeODIShnLlTJ8T7LEMB9FfxuLVy10DsX4faZW/WiF9M=
=igMm
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
