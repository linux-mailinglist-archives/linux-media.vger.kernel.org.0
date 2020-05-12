Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F111CFFEC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 22:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgELUzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 16:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgELUzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 16:55:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F29C061A0C;
        Tue, 12 May 2020 13:55:47 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j5so17647043wrq.2;
        Tue, 12 May 2020 13:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jp7GeaNDAqJlfR+e7XcP59HTgpKh1bKvuvHK4VwDL+w=;
        b=SSp/+IVS9LX8TzdmNCCnRSFDbWo5oj4ZQO4HcQHbGJgm2HVL1XWTOf5iO16yrIyQRL
         YSlbbfKgJ6dkIGjMLs3Dw288SYAGvQCsiuHsqH6+qMLStAJC4Eb364VyI9+5vtmv0Uxo
         anCMszzM1P00E6yNHV1qciKp8DM00tyL+bPsrFQ/oATilaTOxbd3rY+gQePmEL2b86HL
         1Wjr0F52LHwseLTT5lZRaOEE6ehaObnZs5CGwpf1miC3AwdkVlZ3v6A+5HCHe/Z7+5Yk
         YGxQvwfdsg24yd/QO+rhz7zo/z3B8rLyC3Eu8fsfmLl/G+SEwjnvZGhJOsUsL1QmvnES
         AvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jp7GeaNDAqJlfR+e7XcP59HTgpKh1bKvuvHK4VwDL+w=;
        b=VMnlhE4gMZ5KWOulMfg9DaxYL82y8/daW5hGE7RHuY4cxpjHhxwrYMVA3VVXak03jW
         avHw+B1CBCsDwQYuvQlapB0YgWWN/n2t8hNUBChjghaKT+WtxHgMOUfGhvUrGJF/tbO6
         13dl6YTQsp7a5EapnbLFf+R+QGqCp+q79bl5P5pB7AEOtlwrNSrUb2po+BnSEzUkrDiT
         faV+RD7h5L8d706vPl2APXJruOZj+uBV0Z3bk23N757jhPQ+ORzUbA9Jf4J9E6WFoRTY
         W1A3hEC9uCjH/yWq9WWXNwEOcK3Vhut2jATAWfN3/sw3HcGWv4QEXt8P3prcFlRM88no
         XrDQ==
X-Gm-Message-State: AGi0PuYvCpM8xyenDZUDcWAWSb5L/8neynJYgewCIcyuGJTmrqjkU9Ej
        /tjkDvA7GHzyS7orVrVsYZ0=
X-Google-Smtp-Source: APiQypIeT6aWn9V2z4if5f7/8c3cKK3rSrS1h05YMd/NU6FK/dfa9eaAksPaqw0t49JKBUlPPndKvQ==
X-Received: by 2002:a05:6000:1ca:: with SMTP id t10mr26855242wrx.230.1589316946050;
        Tue, 12 May 2020 13:55:46 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id g25sm32389123wmh.24.2020.05.12.13.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:55:44 -0700 (PDT)
Date:   Tue, 12 May 2020 22:55:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Samuel Zou <zou_wei@huawei.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, skomatineni@nvidia.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: tegra: Make tegra210_video_formats static
Message-ID: <20200512205543.GC3864641@ulmo>
References: <1589196015-8945-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline
In-Reply-To: <1589196015-8945-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 07:20:15PM +0800, Samuel Zou wrote:
> Fix the following sparse warning:
>=20
> drivers/staging/media/tegra-video/tegra210.c:589:33: warning: symbol 'teg=
ra210_video_formats' was not declared.
>=20
> The tegra210_video_formats has only call site within tegra210.c
> It should be static
>=20
> Fixes: 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>
> ---
>  drivers/staging/media/tegra-video/tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl67DU0ACgkQ3SOs138+
s6FvtA//e37GxkMc9E73ef/XZuzCXW0aTZUMH7NhzcWq6QuuXjKXb7wa77NAvMRh
q+n5FaU2nK0cKhI6zdW9qmwF2pN6TKIAXeK5HSFfkUs+COwC8EwZT7REVBtMo3/T
VAxyTWE/oZt6rgG+uPbmI5ahCy3zzsr20Z5+jk9YcdXZT92ZGa/hiDBV294OS/gx
CCG1GXcbQWO98xw8EyZCRYIYfSRLTRVNq1nNjie95z99dJhEZ4/KNxnGBDBI6hzW
zqIyiwSrlijNZvVcWaa+lWJ+ldrlxb54wbPhDRihe5y9moFzyxJevnCvQ8gXcix/
SnxdqHWT++FP/6vaWpwtrwzcLqNg9D28sk1t/tkevBJX9FQ2mP3TZEn6JT0qKTK8
+cqr16CNkC3myhPuznf6P/SdRrAw1gRT58+dwiEvXYeugUVgBQ/d+D1Q8fZlbBW0
Tuq+hUDOSIeIWRNEMxjgwC4fTtUwOYMFvcbFUOO0+dCismX/dcxbhKcNZdxiqd9b
fhoEfRxcJtFHoGAXF/4ThTDM5QXF+CnODkbpupWN8aQmN6lOAckpe9CIXgLlDTqu
MBHhaSksQGsmoZ0h5e536irVvwPnVC35sDB8hx6sqpd5qW/1NTkUWWFEwYV6dk4I
at7p0W9nfOMGz6D3HdMg2s2M8kCDOpSyqSTojBwIUFCPIPHV7vo=
=/sE0
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
