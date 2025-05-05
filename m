Return-Path: <linux-media+bounces-31708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC37AA92B8
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 14:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9FD418924AA
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 12:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E2B2288CC;
	Mon,  5 May 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OejpTdsh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75B514B96E
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447026; cv=none; b=kPJ7Hkmt0vyVyBOaQzSvnyojCNAbEIrfXZ7aCGJ+y1qwWzkI6E/6d5mI2rF2Os50KsPk5RaNv+Lig1mFNGJTPwodqKDS3syPSh/bhO/cmuz9nH8LeuSCL32vptd8IN9VvsaGOpJbTk4Xxk+korxcenQHej4Y4iWHnbWnmWM2Tis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447026; c=relaxed/simple;
	bh=oP9fIyi/ZJxItCF/dI1oyp5m8Q0CLdAn/YIPFOSqRMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWhrlxX3ZC23DfvmU5BnMbrXycKBWsUOQoPW7z7cjQk5zxtfBdZlntnQZSIR/8nnF1U1zyfiSYNu4Z/J3ikFJYPwbdCHIJMz5K9OJQNZ+FGpyw2I2jzzQqi9Q6+YI+bwmoPbNFRrWdPfhDlRDwvhI4E5by+/SZ7dWSvAEodgK48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OejpTdsh; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-731e277a6b0so2242882a34.1
        for <linux-media@vger.kernel.org>; Mon, 05 May 2025 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746447024; x=1747051824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xf1P+9z9XiJdCaUpuTBjGVfwsl02CsdlqTVjlTuR+ug=;
        b=OejpTdshwnQA5CzKzb0f4ie9nxW1nTGSECcCU1k76XuQkmELEwYrJG7jLFMLNnV3c4
         M+Xou+OsUlAAfiaokCvf14qgZ+5zu1pxapeyXOIATDK3IJIm5Npko6ihxy3VkUdBT4GG
         8iICQwITJkflPYf/pqTLhlZYCIHNZJUQUUov7CyfNFTUl/1DcLtPBy0ptPt2KrE+IxWe
         9WEnFfltHKpWmKyKI5XqMPMoLu4K4Bh9vQI5sgQlxO0FMdIahZUV9klaKvzNw7xJxOSM
         de1YcD1oJlEsibHSpNfcv+dqcrzo7BZWcRb7O4jSWW1O9c0ix/jQd0sztALzIQ4/GG5O
         O4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447024; x=1747051824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xf1P+9z9XiJdCaUpuTBjGVfwsl02CsdlqTVjlTuR+ug=;
        b=TiLHs6/otbGGxKObWTODYLqAMTen/qUpssNN29MS3DMBKS9pfVPYk0RzixaKInbw8t
         /59KuZ8HkwEYBm25TrOWJORs6HLecDa1qkU3UegA0TKxKPWZzJ+OFI6VbdQ5dDITI95l
         rdv9NumEk/pxQge0p6F7fKJfiXDWzcWxeLSKyN7WrPJsJ4tLIpDcMSbHig+Oxh2E/Mtb
         ushFyKuNnoFL0P0DuKMQi28mdrd6Ak7QKBJWhEbDw/K93ehzU92bUX+OVaxUjn7ByHUI
         Wr9rB+Ol3j4yui4hAAUGm45Vxha/0v+ARTHaBZFSYmPbqbeSlfW88RBWIvKYx9rnX3EI
         pUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVye3RQq2cKarGUSWcMaiU33+50fNGMSVovGWznpA79gq3FAYHI2lO3Qph2T0ghrMbIgeOMM/rOiiYsYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHIdh+l/3w5BCkgtUCSewvB0x8p1tEoKS/wysihTKCOaFEkP5N
	US7ZLx4Nwh2mhKeBDrySTKsc393tdKLFF26AIqlqLjnJBoYSO0iLDR1k/I/AF1AqQHJwsgSTvlz
	KYGSMRlPbh/Ahb00rxQ/Sfk+aXmCR81YEtbauQQ==
X-Gm-Gg: ASbGnctsw9k6xp+yiCDbv1R0vCw7oJpOIpjNPi1qZnOfo0vFu/Cp/dY9l2lSXioHYg2
	PL6615W1ulXBym6obnvQ2367OfpLWHi1/7d6Fdz3T2RoIhjslNM2wlNOhYvwoe1IldP0w+enSED
	FwnmMm1zhUBb95Vsg3gbUeXeY=
X-Google-Smtp-Source: AGHT+IGrfUH9MPAdQwNS2twFxhlagwaLPCfCXznz+rgBdFwPjZ3ioiuEo3A9Gk0YdclatuJ1Za+bseaIMHaboEvs7gU=
X-Received: by 2002:a05:6870:7196:b0:2d5:230f:b352 with SMTP id
 586e51a60fabf-2dae8619680mr3755206fac.27.1746447023762; Mon, 05 May 2025
 05:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-2-jens.wiklander@linaro.org> <6236d3cb-fbf2-4a41-a84a-276aa8079b9a@arm.com>
In-Reply-To: <6236d3cb-fbf2-4a41-a84a-276aa8079b9a@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 14:10:11 +0200
X-Gm-Features: ATxdqUFEAD2cD1D5jQOZdhIhdxiPr-7TKi7md7xZJRysmAHd6QQOFGSu_VWfcD0
Message-ID: <CAHUa44EhdHZofZHRWQ8SJUn4OcAuMwzxxdfjhLQuXQXx4KEaUA@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from
 parent device
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 3:36=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > If a parent device is supplied to tee_device_alloc(), copy the dma_mask
> > field into the new device. This avoids future warnings when mapping a
> > DMA-buf for the device.
>
> That also sounds dodgy. If the parent device is the hardware device
> physically performing the DMA, then that is the device which should be
> passed to the DMA API. Trying to copy random bits of one device's
> configuration to another device and hoping it will work is not robust -
> not only is DMA-relevant information all over the place, including in
> archdata and/or bus/IOMMU driver-private data, but it can also opens up
> a whole can of subtle lifecycle issues...

We have a reference to the parent device until the teedev goes away.
The dma_maks needed by tee_shm_register_fd() in
https://lore.kernel.org/lkml/20250502100049.1746335-9-jens.wiklander@linaro=
.org/
to be able to extract the PA from a DMA-buf allocated from another DMA
heap. We can drop this patch and support for unrelated DMA heaps in
tee_shm_register_fd() without losing critical features from the patch
set if we can't handle dma_mask in this way.

>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
> > ---
> >   drivers/tee/tee_core.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index d113679b1e2d..685afcaa3ea1 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct te=
e_desc *teedesc,
> >       teedev->dev.class =3D &tee_class;
> >       teedev->dev.release =3D tee_release_device;
> >       teedev->dev.parent =3D dev;
> > +     if (dev)
> > +             teedev->dev.dma_mask =3D dev->dma_mask;
>
> ...for instance, I don't see any obvious guarantee that "dev" can't go
> away during the lifetime of "teedev" and leave this pointer dangling.

A successful call to tee_device_alloc() must be followed by a call to
tee_device_register() or tee_device_unregister(). The former calls
cdev_device_add(), which results in a call to device_add() and an
increased reference to teedev->dev.parent, "dev" in question.

Thanks,
Jens

>
> Thanks,
> Robin.
>
> >
> >       teedev->dev.devt =3D MKDEV(MAJOR(tee_devt), teedev->id);
> >

