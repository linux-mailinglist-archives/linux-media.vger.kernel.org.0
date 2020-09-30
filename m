Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3E927EBA3
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgI3PAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:00:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:56168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgI3PAI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:00:08 -0400
Received: from coco.lan (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A867A206FC;
        Wed, 30 Sep 2020 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601478008;
        bh=Sxh+FI37+2ux5jAceo5NPyG5hWeX5gRZPEctlMAdq4s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XR6e6LPi2Ru6CUjRCGvZ+CdlH/3IrrEmIxRQ477dP0n/9N/4Z4Y/pTFEzjo63D8F2
         pRJSDxkdqly8zBbJ7HnhI4gr7PHQUq8jTQRXR/oDkeq8lq6c/Iyp1RCzk+9Ck79ZY4
         2QUt7Kr1Zgtgm4ZniytrX0p2kQXcl80NEpzkNPP8=
Date:   Wed, 30 Sep 2020 17:00:04 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp doesn't compile
Message-ID: <20200930170004.77f0c68b@coco.lan>
In-Reply-To: <CAHp75Vfx+GUkSmCFD5BRLThkWwLcZDx=9p4yody29p+kqd525g@mail.gmail.com>
References: <CAHp75Vfx+GUkSmCFD5BRLThkWwLcZDx=9p4yody29p+kqd525g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Em Wed, 30 Sep 2020 16:51:10 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> Hi, Mauro.
>=20
> What is the status of AtomISP? It's already been a few days that it
> doesn't compile in Linux Next.
>=20
>=20
>   CC [M]  drivers/staging/media/atomisp/pci/sh_css.o
> .../drivers/staging/media/atomisp/pci/sh_css.c: In function =E2=80=98star=
t_binary=E2=80=99:
> .../drivers/staging/media/atomisp/pci/sh_css.c:1384:6: error: =E2=80=98st=
ream=E2=80=99
> undeclared (first use in this function); did you mean =E2=80=98strim=E2=
=80=99?
> 1384 |  if (stream->reconfigure_css_rx) {
>      |      ^~~~~~
>      |      strim
> .../drivers/staging/media/atomisp/pci/sh_css.c:1384:6: note: each
> undeclared identifier is reported only once for each function it
> appears in
> .../drivers/staging/media/atomisp/pci/sh_css.c: In function
> =E2=80=98load_preview_binaries=E2=80=99:
> .../drivers/staging/media/atomisp/pci/sh_css.c:2967:38: error:
> =E2=80=98continuous=E2=80=99 undeclared (first use in this function)
> 2967 |   need_isp_copy_binary =3D !online && !continuous;
>      |                                      ^~~~~~~~~~
>=20
> ...
>=20

Sorry, a cleanup patch removed a temporary var for ISP2400. Just sent
a fixup patch.



Thanks,
Mauro
