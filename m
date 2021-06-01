Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE95C397024
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 11:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhFAJSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 05:18:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:42132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233490AbhFAJSC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 05:18:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4F5461364;
        Tue,  1 Jun 2021 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622538981;
        bh=0nW2fOpq2ezCwVo5mmVLW6vQG5WukzXuD7aVL1WrmYE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PqoJyqytAQYeEr5s3kmkKvNYpEywH6eymOtKLtB64dI3YXggrBhrIZ0mjx5tbXuiM
         RXwFqFHB3n1msX+NAfsOxJauvSFkkgDijS5nn61BR4Dy9qEVRAtFiHlklKEXXWUAOV
         uSBE6beaRnwTCH8G4hJpIsFjHSUcjq/rQ8oaZr8xZF2HPtyUB1OvGwPJJYyb82Ous2
         ZMPDuDkxstJsKTcEY3FBwJb6dzx95hHo9Q3i02+jQ+ydcSg/uXv7UpMSJPMTOpsvyz
         VHTp1jRt1foetHsHJQNUssg6MvQXlo8cutZz7ToJOLXM6cKJ79F0haT4DXOjlzwSVO
         JzZNuHhpuyq9A==
Date:   Tue, 1 Jun 2021 11:16:17 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] media: av7110_v4l: Fix build error
Message-ID: <20210601111617.5856e175@coco.lan>
In-Reply-To: <20200909133844.6812-1-yuehaibing@huawei.com>
References: <20200909133844.6812-1-yuehaibing@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 9 Sep 2020 21:38:44 +0800
YueHaibing <yuehaibing@huawei.com> escreveu:

> drivers/media/pci/ttpci/av7110_v4l.c: In function =E2=80=98vidioc_s_frequ=
ency=E2=80=99:
> drivers/media/pci/ttpci/av7110_v4l.c:163:11: error: SSE register return w=
ith SSE disabled
>   if (freq < 16U * 168.25)
>       ~~~~~^~~~~~~~~~~~~~
> Get rid of float pointing math to fix this.

Out of curiosity: what compiler are you using? This sounds to be a compiler
issue, as compiler should be optimizing the code by doing the math evaluati=
on
at compile time instead of doing it during runtime.

>=20
> Fixes: 13c129066845 ("media: av7110_v4l: avoid a typecast")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/media/pci/ttpci/av7110_v4l.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/media/pci/ttp=
ci/av7110_v4l.c
> index 6d9c908be713..ba745b161cba 100644
> --- a/drivers/media/pci/ttpci/av7110_v4l.c
> +++ b/drivers/media/pci/ttpci/av7110_v4l.c
> @@ -160,9 +160,9 @@ static int ves1820_set_tv_freq(struct saa7146_dev *de=
v, u32 freq)
>  	buf[1] =3D div & 0xff;
>  	buf[2] =3D 0x8e;
> =20
> -	if (freq < 16U * 168.25)
> +	if (freq < (16 * 16825) / 100)
>  		config =3D 0xa0;
> -	else if (freq < 16U * 447.25)
> +	else if (freq < (16 * 44725) / 100)
>  		config =3D 0x90;
>  	else
>  		config =3D 0x30;



Thanks,
Mauro
