Return-Path: <linux-media+bounces-9244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F284F8A41CE
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 12:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69DE01F2139B
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 10:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8D22E63B;
	Sun, 14 Apr 2024 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vie64pWk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7E823775
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713090144; cv=none; b=G5Tie/C2Q9BRx5QIjjBWC3/C1cklSZJEM4YxJCVIRBJM1nbUtARmDAIC9ZLE6FjvQoCR66t+Q1Gr/hjBhe+/ATxet3ZqZH8LnXvvP8jceqUkHmyQYdkiJrgeasC6UsXVTD3QMbN1K1DzoCm97sWNjEJUJtesVIr7fGuZJ93Ffgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713090144; c=relaxed/simple;
	bh=d+Uy8iPQnqE2LADkf5oxHA0iCikJqg5sNWF4qykSlG0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6ge72c7LpRM1nWyx1hJ8oW5QqS3Uj7/Tc4rYJD5temZSHXTLBTACGm2DcFao088iCQ/dR21mqOiFjA3o4eQegfI8cXHNsQLH7/HgPbDcta9RaHA2doEZkSMYLGaSU2qWGc/CgNHJw5/TpU3MUpiF1K3Oce12pB1qZZxTt1iMi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vie64pWk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34665dd7610so810423f8f.3
        for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713090140; x=1713694940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvZ6PjWc/Qm/HW2Su6f4lI8v0f5zAQ/AW1yCdaUkeqU=;
        b=Vie64pWkttf1ocuntIZP9F62EDkrpeyr7HImOffvsfpMjXB7ZKz9qeGje/FCk8anbe
         E/bp/WAVdsFuhYDUGUPO8yzn3SV5EpaaXxTYL5fPHxhw6JR+jgXKCZQU35NXb0HBsf+z
         o/vyqInkq5mA8PqRoNvpujSzzkPduwviKR3isGY23erIfWvC3iwkMVLbJd4Xgi0swPT7
         WoST3ig7AIyqrHk3ijuvWmZ+3sqKi/bhm1vPw+4FTu/TF+gtvIlZ9FT0sUSoQktLfjAf
         sXvxhNzEuYoxTQtxqSfMPUjq42iBCDQuAp8f2c6ndsOAYFWl7W4JAi2LU+k9iTLS1zRH
         Y2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713090140; x=1713694940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvZ6PjWc/Qm/HW2Su6f4lI8v0f5zAQ/AW1yCdaUkeqU=;
        b=m4lr/wytaXdX2XFplpalkASGDnLPnsMa/amT1LKfhRNooeGGKdVh7sBqTWjl8bFbXN
         7pSyctaNjFwb/EN7a1AXPOP/AHXBHYKJ8tKc7vQJfXMrusCfjZD57/cDuFVd3S/evZry
         Vt06n7/CrNbxgzG6nkFuHX81+ZcOu0Xf9NCt6ouxIu5vu+UbzgNHZah/2VHT4+838UtM
         PHo+UCHW6DBRT2rxCIDJz0OhV0thyvfUJE0Fijult4RfoAUMquL4v08KIAN78NH5NZ5q
         nMjXlz/5VZMTwWOdsd5Wva6sMOuQ4WNal7X0AIZOq0MY3FG5HNrDmxCnVNqukVwCoopH
         6lYg==
X-Forwarded-Encrypted: i=1; AJvYcCWyDf4VvrYzJ/iGgrva89zbjR178b9cc3lKoWqltyyDIusytUWjHUKjHOOyY38VaF1VIdOAAAuXAWxVa1t7PvesSzg9E89yNQP3yxI=
X-Gm-Message-State: AOJu0YyJWEu5MtQD7tetMNxDe2BYe8GZFe1h3A2s1fptHCk/akglP3pn
	TdvKw10ZtFJgLMIsai3Xxt/WpEgKCEPJ3CjwXV+rFsCBrAL9LI7J
X-Google-Smtp-Source: AGHT+IFOrs1IwxMUP5Vf0XILsSrYi91RA/AYCri784CIe1W/IiRN+JiYjMmL5qxuLVMGiCqSYO/Wyg==
X-Received: by 2002:a5d:6802:0:b0:341:bff9:2e4f with SMTP id w2-20020a5d6802000000b00341bff92e4fmr4698824wru.44.1713090140375;
        Sun, 14 Apr 2024 03:22:20 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-252-50-gprs.simobil.net. [46.123.252.50])
        by smtp.gmail.com with ESMTPSA id h5-20020adff4c5000000b003437a76565asm8753517wrp.25.2024.04.14.03.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 03:22:19 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Matthijs Kooijman <matthijs@stdin.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-media@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bob Beckett <bob.beckett@collabora.com>, linux-sunxi@lists.linux.dev
Subject: Re: media: cedrus: h264: Decoding fails or produces artifacts
Date: Sun, 14 Apr 2024 12:22:18 +0200
Message-ID: <3799689.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <ZhZlRpqkjMukosw4@login.tika.stderr.nl>
References:
 <ZhMNNazVsu8EXqMU@login.tika.stderr.nl>
 <20240410095555.std6q4g223fupkju@basti-XPS-13-9310>
 <ZhZlRpqkjMukosw4@login.tika.stderr.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne sreda, 10. april 2024 ob 12:09:10 CEST je Matthijs Kooijman napisal(a):
> Hi Sebastian,
>=20
> On Wed, Apr 10, 2024 at 11:55:55AM +0200, Sebastian Fricke wrote:
> > Hey Matthijs,
> >=20
> > On 07.04.2024 23:16, Matthijs Kooijman wrote:
> > > Hi,
> > >=20
> > > I've been chasing a decoder bug in the cedrus h264 hardware decoder a=
nd after a
> > > few days have been able to work around it by removing the
> > > DMA_ATTR_NO_KERNEL_MAPPING argument when allocating the neighbour inf=
o dma
> > > buffer (full patch at the end of the mail):
> > >=20
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > @@ -581,7 +581,7 @@ static int cedrus_h264_start(struct cedrus_ctx *c=
tx)
> > >        ctx->codec.h264.neighbor_info_buf =3D
> > >                dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZ=
E,
> > >                                &ctx->codec.h264.neighbor_info_buf_dma,
> > > -                               GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPIN=
G);
> > > +                               GFP_KERNEL, 0);
> > >=20
> > > This does not seem like a proper fix to me (or maybe it is - I do not=
 really
> > > understand the problem yet), but it very effective.
> >=20
> > thanks for the patch, I don't think we can take it as due to, as you
> > highlighted, it relies on unknown side effects. Perhaps if you or
> > someone else in the community can investigate this further and answer
> > some more questions we can move it forward.
> >=20
> > Some questions to help move the discussions along:
> >=20
> > - Does the platform have an IOMMU?
> > - What does the IOMMU driver do when it sees the
> >   DMA_ATTR_NO_KERNEL_MAPPING flag?
> > - On the platform in question do coherent allocations get handled with
> >   cached snooped mappings or uncached?
> > - Does changing that flag affect any cacheablility
> > - Does the codec block expect any particular intialized data in that
> >   buffer?

H3 doesn't have IOMMU. Removing DMA_ATTR_NO_KERNEL_MAPPING doesn't sound
like a good issue since 32-bit ARM platform has very small address space
reserved for virtual memory. While it can be increased, it's not ideal and
I would rather not allocate any addresses which are not used by driver.

It's interesting to see that this helps. AFAIK, only relevant action done by
that flag is to sync caches, which makes sure that data is viewed by CPU.
Maybe driver doesn't wait long enough in some cases? I vaguely remember
that vendor driver is doing something for this, but I'm not sure. I have to
check.

Note, I've observed similar issues on H3 when switching between H264 and
VP8 decoding. They both use same decoding engine. However, I haven't
observed same issue on H6, even if IOMMU is disabled.

Best regards,
Jernej

>=20
> I have no idea about any of these, but I agree that they are good
> questions to ask.
>=20
> I've CC'd linux-sunxi@lists.linux.dev in this mail, maybe someone there
> can answer these questions for the Allwinner H3 platform.
>=20
>=20
> > > The actual problem is that sometimes (about 10%-50%) the first frame
> > > of a h264 stream incorrectly decodes, producing all-zero data in the =
bottom
> > > part of the frame. See attached error-green.png for an example. In so=
me even
> > > more rare cases, more subtle decoding errors would occur, for example=
 a lighter
> > > rectangle in the bottom left dark blue band in error-blue-bar.png, or=
 some
> > > misplaced pixels in the bottom right "noise" area (compare error-nois=
e.png with
> > > error-blue-bar.png to see).
> > >=20
> > > To reproduce:
> > >=20
> > > 	# Create a h264-encoded 320x240 single-frame stream
> > > 	gst-launch-1.0 videotestsrc num-buffers=3D1 ! openh264enc ! filesink=
 location=3Dtest.h264
> > > 	# Decode it again using hardware decoding (repeat until seeing a bro=
ken frame)
> > > 	gst-launch-1.0 filesrc location=3Dtest.h264 ! v4l2slh264dec ! videoc=
onvert ! pngenc ! filesink location=3Dtest.png
> > >=20
> > > I've been testing on an Orange Pi PC with an allwinner H3 running
> > > Armbian 22.04 (based on Ubuntu Jammy), a 6.7.12 kernel (mostly with
> > > Armbian-patched, but also clean mainline) and gstreamer
> > > 1.20.3. The problem also occurred on older kernel versions (tested cl=
ean
> > > mainline down to 6.2 and then a bit earlier, but 6.1 mainline would
> > > not boot for me). I have also observed the problem (or at least the s=
ame
> > > symptom) on the Armbian-patched 6.1 kernel, but there it was extremel=
y unlikely
> > > (saw it once in 700 or so playbacks).
> > >=20
> > > I've seen three variants of this issue:
> > >=20
> > > 1. With the 320x240 test pattern, showing the green area in the frame.
> > >    In this case, the decoder would actually return an error IRQ status
> > >    (VE_H264_STATUS register would be 0x10010003 or 0x70010003, instead
> > >    of the normal 0x60000001, bit 0 is VE_H264_STATUS_SLICE_DECODE_INT,
> > >    bit 1 is VE_H264_STATUS_DECODE_ERR_INT).
> > >=20
> > > 2. With the 320x240 test pattern, showing more subtle decoding errors=
 (as
> > >    shown in attachments).  In these cases, the IRQ status would not i=
ndicate a
> > >    decoding error.
> > >=20
> > > 3. With another test video (1920x1080) that I cannot share, there wou=
ld
> > >    be the same green areas (occasionally also green squares splattered
> > >    around the frame), but *no* decoding error in the IRQ status.
> > >=20
> > > None of these three issues occur anymore with the workaround applied =
(both on
> > > clean 6.7.12 and on top of the Armbian patches), the gstreamer decodi=
ng then
> > > produces bit-for-bit identical results every time (tested hundreds of
> > > decodings).
> > >=20
> > >=20
> > > I have no clue why removing DMA_ATTR_NO_KERNEL_MAPPING from this
> > > allocation helps - I just tried it on a whim when I nothing else seem=
ed
> > > to help. I suspect that mapping the memory into kernel space might ha=
ve
> > > some side effect that helps, but I am not familiar enough with either
> > > the cedrus hardware or the DMA system to tell.
> > >=20
> > > I initially thought there might be an alignment issue and tried
> > > increasing the allocation sizes of all DMA buffers to 256K (which
> > > I think enforces a bigger alignment), but that did not help. The reas=
on
> > > I was looking at memory allocation (and also timing differences, but =
no
> > > luck there) was that bisecting pointed me at commit fec94f8c995 ("med=
ia:
> > > cedrus: h264: Optimize mv col buffer allocation") which seemed to make
> > > the problem 2-4=C3=97 likely to occur (but looking back, I think I mi=
ght have
> > > been bisecting noise there).
> > >=20
> > >=20
> > > I hope you folks can make more sense of this to figure out a proper f=
ix.
> > > For the short term my problem is solved (I'll just apply this patch a=
nd ship
> > > it), so will not be investing more time right now.
> > >=20
> > > If there's anything I can contribute, just let me know (I have done s=
ome tests
> > > with extra debug output added to the kernel, and a testscript for rep=
eatedly
> > > testing the decoding that I could share, and I am happy to test any
> > > patches/hypothesis that you have).
> > >=20
> > > Gr.
> > >=20
> > > Matthijs
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drive=
rs/staging/media/sunxi/cedrus/cedrus_h264.c
> > > index dfb401df138..7cd3b6a5434 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > @@ -581,7 +581,7 @@ static int cedrus_h264_start(struct cedrus_ctx *c=
tx)
> > >        ctx->codec.h264.neighbor_info_buf =3D
> > >                dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZ=
E,
> > >                                &ctx->codec.h264.neighbor_info_buf_dma,
> > > -                               GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPIN=
G);
> > > +                               GFP_KERNEL, 0);
> > >        if (!ctx->codec.h264.neighbor_info_buf) {
> > >                ret =3D -ENOMEM;
> > >                goto err_pic_buf;
> > > @@ -634,7 +634,7 @@ static int cedrus_h264_start(struct cedrus_ctx *c=
tx)
> > >        dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> > >                       ctx->codec.h264.neighbor_info_buf,
> > >                       ctx->codec.h264.neighbor_info_buf_dma,
> > > -                      DMA_ATTR_NO_KERNEL_MAPPING);
> > > +                      0);
> > >=20
> > > err_pic_buf:
> > >        dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> > > @@ -670,7 +670,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *c=
tx)
> > >        dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> > >                       ctx->codec.h264.neighbor_info_buf,
> > >                       ctx->codec.h264.neighbor_info_buf_dma,
> > > -                      DMA_ATTR_NO_KERNEL_MAPPING);
> > > +                      0);
> > >        dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> > >                       ctx->codec.h264.pic_info_buf,
> > >                       ctx->codec.h264.pic_info_buf_dma,
>=20





