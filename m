Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57561B3165
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 22:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgDUUqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 16:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726024AbgDUUqw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 16:46:52 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A914AC0610D5;
        Tue, 21 Apr 2020 13:46:50 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u16so5049943wmc.5;
        Tue, 21 Apr 2020 13:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q6uPC1CnCPTFfr9RZtZjgLS8wz+TR/yHxAxpCEB2ABE=;
        b=WGSXQ+29Ak7SWw6XyBBOxnAH68o34jNmWGCdSwuAEY1YdHxy2Q3GaOntJ+kdFb1tT+
         Ng0Loh1AGdVwX8vf+w0CPN1iJ9oDCZOiZ17bnvVlgzouMijVA50KnBn8C649htQ6HmZ5
         18BsCfiUMLQ4c/0vTBDNjJFIKQBW+uSXjgW8reGxf8AlwwVq87VRKZbVMrUXoVv5MW7E
         ghslZfoXi7gxJZr+q7L73S4SWZEilk/3OKKUjAD9bLfgqSndZ51bQWuVyGAfAn89GhIA
         yTLjp0wJNhJN0/DusDeUZC5K8w93pqZnSGkw8BG01cYYINHMF4QQ6rsnn08fIHxPc9KH
         4wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q6uPC1CnCPTFfr9RZtZjgLS8wz+TR/yHxAxpCEB2ABE=;
        b=X/Vz7CTsxnRSXpgrCZuOCgxsy7Y42sF/Fa/4nO41O8tNMKdK1YyAdblQtS1xLFZlws
         YrpH2DamVYvOiRAFskcfCKs7fQK0DW1m3/4Fsz8byC7QN8xfN5F1SgS0lljh2JnTUo1m
         bRQmI7eSUENS+fDNxJpJo5UjL0CYQ/1tNJ6VurasCqoKIWr58/z+PcUONik/ROvhedSy
         NfHAKXDDuuK2OnG+OYZmuQNvi/C1HZOJfAzcIhAQjs19OpXz2Nnb4DHSlnzpzZH9zvo3
         IjGbqaWetAIxrXhN/JqqVoeYK+FAh9HCYq7A60/AQPfT/y5WsicddPzfRaA2v0pg0JDp
         XkNA==
X-Gm-Message-State: AGi0PuYGiZqpLLqQit7LrHsEo6HRFXZVkqoNACty3ijoKsYGfVLo8sLn
        ldMaOZH7ChZjHUiKF0yrE4w=
X-Google-Smtp-Source: APiQypJpQe3wpc763YuNJO0Sx0DlrTQK3dxcxLZhIl4oN7YF3FMeSKlRhIhE/z2gMyKgA2LNdg+fhg==
X-Received: by 2002:a05:600c:2218:: with SMTP id z24mr6646985wml.82.1587502009392;
        Tue, 21 Apr 2020 13:46:49 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id k184sm4990111wmf.9.2020.04.21.13.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 13:46:47 -0700 (PDT)
Date:   Tue, 21 Apr 2020 22:46:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com,
        sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v8 5/9] dt-binding: tegra: Add VI and CSI bindings
Message-ID: <20200421204646.GA3233341@ulmo>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <1587427874-3291-6-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <1587427874-3291-6-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 05:11:10PM -0700, Sowjanya Komatineni wrote:
> Tegra contains VI controller which can support up to 6 MIPI CSI
> camera sensors.
>=20
> Each Tegra CSI port from CSI unit can be one-to-one mapper to
> VI channel and can capture from an external camera sensor or
> from built-in test pattern generator.
>=20
> This patch adds dt-bindings for Tegra VI and CSI.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        | 73 ++++++++++++++++=
++----
>  1 file changed, 60 insertions(+), 13 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fW7MACgkQ3SOs138+
s6GcPQ/9FNBtMbNYeZe7HR8tmPr1TQ7xTJ21ncNt7vGdlFWn0F7TXycPiWu86+V6
Zc2pIGZjSk2uhHKbvYUvA9IXkAY0mxtzZrJeXIU+vAADOjAc6+rYYKcf0zuRr28g
AAgcnaAZPIsxWCdIM/G4l+Bir8kw82HGIpK45J2m4aWmgBF9c1vMVO4yzj5FALzj
F7nqa2Iiufghax5P7n/9yKWLeQroDPqsrWCWqVh9ILOn52l/qIDfRPAsEjuoCy3s
FaDQQQRRSoyYTRg8iNLF6t2H8yI89Suyia4ZcN+YzuhwtEc/DlSvIWFW9BVgyXxH
N6AdkZzFID0me3ij0xAGJWD2bmUlhQVPMPAJZq52t6vdH+0k9WReRUuBp1D0P7nC
FYuwttry5BJiXXceFOR29KKAe2qO3IMl3/cpLvcDVPSbMi38Zyd3VvhNbvFD+fn+
hTa3S+5xLhbQxLZsSDnaPA1Phl4EGGNSWo08Nn5mwU+H/oCO11i/Luy4+usaYgor
lfa9//chWihgxUnpa0fN4nUdgmaRWxymLiJL3bY8twgvEWlzn7cbtf6EacXY5Yzt
jUE+kPSEAYy0jjuWANsQJUe2BQiLHIRJEEQSt6EsSgLmV2P+5utoIuAjUQWAiF1V
fE8pGGlhXJza9q7fbW62lHW/c7agPohXsRsq59UytdnjJtnzTz0=
=FTJX
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
