Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28CE011440F
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 16:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729871AbfLEPvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 10:51:18 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36529 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLEPvS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 10:51:18 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so4241802wru.3
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 07:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hqk732DASvKhf2WML2uIRMYkZ0MH2kXngVlW9J9XbT0=;
        b=keeTt6l9p4RiViea21o3Ym+sVClyOVlIXERoaiM764Nw8ERrP10Nmwqk4vdoQlVKB7
         Jw4F6JoagBbIhllF5rL/ijCTWd4ysIjbvzYLdmPEDYBE+1pkmNIxM38cyuKJSsZEKKkC
         crDqNovqSUksWCbMShsQUuzOkL6zKGlxuRQf749DkrImBU6EJUfxp6uQtr+iQPIFj9dF
         THbMHKMRyaQ7NYBk0GUOyFikJW28bq0Eb8I+wpMTLelRSJz6QnNDdWkRZDI6lY32vaZI
         iubOvM6y1SJ3bUeQj0/C4rI9kkjkOBM1fPEgtIjHZhGxmfiISWiHw9QENWiIxx2My7iQ
         iAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hqk732DASvKhf2WML2uIRMYkZ0MH2kXngVlW9J9XbT0=;
        b=aw37cHLBwpUZEZg1O/Nq6zXtQkvCSCrScvapmxvZw/iOjmSPHEd1ZX3h+nz0ji3FDY
         jClJk1a4bE8drl+zP4z1tfmcfdCC/rjkggwkyeFXl3k1wNzICvDt0umDqFhGz59XHU29
         O8zRia2Yy9RbUG6f52BfntJfnjdykF1d+7emRwiWMNZQen/gGfaSJixFwnqKyBGax5ij
         g7+0qruyqFA7zlTlFZjY9xlZnAPzmWxaQXqCsYfCpJERrY6b0bx6qOOWDiBbWDDm+ajR
         JHQ4UpEcrT6JSIJE7nUeWVUb5KJoAStrBHzEoSVACiMDisnY3TXeBDgfpPuogxritwPl
         FuPQ==
X-Gm-Message-State: APjAAAVW9PMwD48G0WumjgfZtSXLxdQfFft3rDqQrZ3aekDvSkXnjqj2
        AMsY+UZQrdUIUhc8yswH9OA=
X-Google-Smtp-Source: APXvYqyYNI/Iqvef/isLiabMHdyM4U4tRTb7QCIYp8t0Z+YThXI2bYmaodgFVZDFXv/v95Ow4HY7pg==
X-Received: by 2002:adf:a141:: with SMTP id r1mr11163450wrr.285.1575561075675;
        Thu, 05 Dec 2019 07:51:15 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id g69sm264905wmg.13.2019.12.05.07.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 07:51:14 -0800 (PST)
Date:   Thu, 5 Dec 2019 16:51:11 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Match on dma_buf|fence|resv anywhere
Message-ID: <20191205155111.GA1914185@ulmo>
References: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 10:51:05PM +0100, Daniel Vetter wrote:
> I've spent a bit too much time reviewing all kinds of users all over
> the kernel for this buffer sharing infrastructure. And some of it is
> at least questionable.
>=20
> Make sure we at least see when this stuff flies by.
>=20
> Acked-by: Dave Airlie <airlied@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3pJ20ACgkQ3SOs138+
s6FuIw/+MiBzMpaE+4A0DS+8Maw2eXygpbNzHbXbT/CqB0Q7kcibeSIUV+xnhWPY
cnxtNxlZWtErROiGrXS2Roj5PYGftBPJVbCpxr4kMjsbVjtKq+iNbuPhfkChvihU
CEP5jHrHzmAQ4vRcVycHHZinm5ABoo+TuBeV7ZXJf1p6ZDDJXRFIBTpA/BxiBwOZ
ONIiq23FNnob0Zk/0r9XvQLyslRpK6FjYRdNO1V8l8OWrI0hQQqmx0kBpIppnxGE
swt90Ak5Vf3pSq2zrNfoVS7QAcuw0/2munEnOiA936SeiKLtEb8CX/j7GmDrXsOl
A2A0Jjhi3WWbxqq6UO1WYxyCSwmWY3WEtLzPd5F7+Henuztpygivh2d3xYCEO+jn
X0jE7Vnp4s2Tgv71Ack2aC/7HzX3WH7BtG//HCs6BF5TCKD9liA3nz+qMBI/ZPaP
6bQJWSJeQsJkEg6md3e2ZC14IOe6Y6UlKKkpwU8yDpY4xyY0IAjAepGh8gdmofVX
JT+O9UbdOmC4Sn5aIw/TdSz2U7mmwaY/+NcgbYlQSsZGtIqS8ASEIcXflC7M/lbG
lkog8ih1RRQ6Xcwhi6s+Tiyn4J6fUVnOaqwwvMxJYhXs7Z+s0KtgzlwGHwpq4ugL
MkKmiO6Ur5Xv5LfotkD39OY6HGy+Nw1XSbtrsPXPXLH70GvEjig=
=Spok
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
