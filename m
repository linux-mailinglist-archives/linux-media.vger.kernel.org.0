Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3C3E891B
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 14:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388208AbfJ2NNP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 09:13:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42538 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfJ2NNP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 09:13:15 -0400
Received: by mail-wr1-f67.google.com with SMTP id a15so1313814wrf.9;
        Tue, 29 Oct 2019 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W8PkCFVnCorrtSWGdVFof9XL+RN29yxwr92wnMWMfsg=;
        b=hqGegw9tshvWHtIQow/p3XWzfwDpwhTwKtAo2Rb6OCl2QBqJbIL0+RMefu+L25Iwei
         5COpMsatmSas6msShGrgSd6fpGg88UIxtJsXZiaUZ/7ie8V1ULHV9vfbtE4vBK6mvOUZ
         PEyIyyEFqVODpZfbqPpBY5WCHZ1uiayo9KypO1Kpi/GxsIqy7WTFYC+CawqmN0ILhFJ7
         kY7opCE36nNS/lae6b0xb8PGXJWo0ouUYyaoCV+2+dUoa3312RePliskFLh+8KZS1l1X
         DPMN030Rrt4fIw6TmYUkmrjvnF7gFQFI+lniAP03n6qz544kZF74GQwg00fTwqdI9nrW
         sxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W8PkCFVnCorrtSWGdVFof9XL+RN29yxwr92wnMWMfsg=;
        b=Z+cylLJWEvO+xVfhTHLsV5R51A+JCH2JnQekCMbNRTwMiqyWjRPHSymi9RKFpexBuW
         /7aNhLtzG/gAqFOa67FRJVzSalPXl5ZEJio28hG9xlgEj3w/d4DrLeJ7m3b/r4JeoUYE
         TlKFS+hTv9pZlzP11zUq3ozjLPwCMxunfXUBePEW4CNVEDYLVWHKU8nTcbu5JNBezQab
         G3knvFcdn8J+f8g3k9KRonPbiRMiYLx9ExZlA7A9Cj5BtDR3hg3cGP0MQRi5xZObiQKZ
         gLtTf3reMqV9PPl08+ZxSou29+jjwHlFX3tUhJQD1hMkGmpQBtz6BKS3E5oRz6uxplMB
         WYew==
X-Gm-Message-State: APjAAAW7LmBpdmH+A5fYvw5H3N6FrT/N3pDSQ+PyZaHUCmuwZ8XA0ipS
        W5gWrZgBB4YuPyCrAEPcjAE=
X-Google-Smtp-Source: APXvYqwTYDiXBly9gOa7PpLH0awe6adhtTX0gOKn67cC5MFmVPVqN4qC0h11nJmzD8pzD22UlVkv4A==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr19946146wrw.167.1572354792114;
        Tue, 29 Oct 2019 06:13:12 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id d20sm1153173wra.4.2019.10.29.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:13:10 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:13:09 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: tegra30: Connect SMMU with Video Decoder
 Engine
Message-ID: <20191029131309.GC508460@ulmo>
References: <20190623170730.5095-1-digetx@gmail.com>
 <20190623170730.5095-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline
In-Reply-To: <20190623170730.5095-2-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:07:24PM +0300, Dmitry Osipenko wrote:
> Enable IOMMU support for the video decoder.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> No changes since v1.
>=20
>  arch/arm/boot/dts/tegra30.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.5/arm/dt, thanks.

Thierry

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24OuUACgkQ3SOs138+
s6FG0xAAgMsJHddh5VUJbI4i15//MpJSJLnwPjTUM0SfXsxqqMQwzkgqGe+AydBq
IoFAAUvBVOxqMjXw0B5/Thy4tMSqd1VM7gdoY6yMWLD5GUnTH+7Ce5IUGl+5bHif
G0Zl9ehYm2LkDEDTKEeYJ81O60iZtHR7IFdCnpwSD52dmxwnKk072UbpBB4XDW+A
K7yseW78aKMPQ6YmuR1q/iA9a6pPoqDifZl+QCPDxP21wq9OHC3K1OJqJCT+B67f
5B4fCugTTNCTsrHplkty95KBJfwDsrZd/nYA7FZJldeYgRTyIKIHQU6fv9dwDn5C
cYRlp6RPITn0NGSrVanvfPAwk3rorQSfXPbw/At8CRttqkOzp2VOWB2PP3cOvtok
1+SudogUvehLHoiPNKCKR1proc5WYYDaRgZyHmMDxzw6PxF62K9/qM0WhgeVvFoG
TW3aaGq8783udERsm8KeKZDKeFk6MHC0Jam+5nCG/aB5cwqLyEivAx09VpddfsrY
/znhxLFRQZGnbrnqD8+rKk0QMTN0XV3TQ1YP3SeQv6hFt67elWqWEzTcQyqW6Tno
Voa3YOX6NdOVefo/JbaskkUMyWUvhQsV311+u2gfkq7Ba+K1ATjFVzGpYz+mywQc
uxwNWBVJJO6BFaGcraonpnQCMx7Sq8dBqncQXAPfL4JAY1HvJhs=
=Qfvc
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
