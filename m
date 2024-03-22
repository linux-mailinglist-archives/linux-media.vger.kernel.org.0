Return-Path: <linux-media+bounces-7636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCDD886E7B
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 15:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 481BF1F222E3
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 14:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D701A47A70;
	Fri, 22 Mar 2024 14:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GEPdN/g0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0944C89
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711117619; cv=none; b=nAQpPi2xfzBlaWCCvvRgQK5PPwr+85DS/jU/Vup0a6Q2zCGGiR3c1kgZVE1mXZIxqRCroEoTc0UXftJBnmnQxtm3mRBONDSblIaakM+EYX0BD+ZvNhZKKKAAHSfIYnMde5x58IV0Hf53Tv3Il2qafwk+rlDAk00cA9aDiLZ9FNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711117619; c=relaxed/simple;
	bh=XKmE4GGCnJAJ2FT1o/SNODogJpU5VPlXFcs/cGXSd1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3QC0BqMqsjCfM00Ps8h2ctiTm8Vm81rvFTJZvzqvIHnso2oazwWhWnHipm1cfw8CgiXx2QLho29pwutpLippLFDcIy3cQccMG8X6Ez6jlixsMG1GwD4jIPN+1xXEZdPgnr2RDkJwOkyoTklDKwEEtDvCBUAQ3pdhmwp96DtUvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GEPdN/g0; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-789f1b59a28so142519185a.3
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711117616; x=1711722416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BtKM6YzSssBOA8wzP4FAf2/h79Yzs7wpPMofYXSEwM=;
        b=GEPdN/g0NjsLmbVSXQ4vYS4oYb7WvwdWv2v28NTmGsR3vGsqivvfDXhD6+RHhSpPWJ
         4W/Eo8C1/B0y7/LSgW5ff9voZfPhsEifzqu8gDIhrZsWy2acsWZ+PdsVKO2YjfJI8owE
         tAVYBH3Ml0Tfw3Its3t56meZzDIZZ1TdNZ/WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711117616; x=1711722416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BtKM6YzSssBOA8wzP4FAf2/h79Yzs7wpPMofYXSEwM=;
        b=VI+vQp37cNHyVJvmwOYlh5m3tghuwQjkpdISgc5fjzZntblG2qvWgUsImW0A5iEa0C
         XXAyAqttO4kQAntGjSOKkCsauC4XvZeNr5m45NVKgd0LS1RpPCafDXpbzghFWb6E3UXd
         vpEe7EZEM/xCbwRvNEs1I9LUnKdqsnuEhSeQJfEzbPXwNoilMef/5cUUxenMdlg6wH9a
         EILyKoLfBJf3Vft6d/sGSpQ+rDymT2135u69hJAdT7GVgFZfJ4WLXypJLCTLpShNV0XP
         7BRoUva4QO1OQN3BiSPdz+PAq06CrqHfZEw4rs4kH6znWAmvbwDExh7oCBJX17vieRFs
         jTow==
X-Forwarded-Encrypted: i=1; AJvYcCUzhiMAAbRbfAul1m4xNKvGpshj4nQD74S62FSMalml+b/a7IIm8ds1F0TCeyb8GzeejMtNFY9hR7M31kj9CLJ6luNjevZwQ9jcK4Q=
X-Gm-Message-State: AOJu0YxUhZIwCwGn1tbtAOQKeAdQ2rB05QK+QKg5Bi5gKTvLE0I5Mh3s
	omDZ4arCQjJNdsR5G2SqibO9iUqzZkWl6lxZm3pnYU5/zzkevm257tUFDolDRWHwK/mJCM2n3y4
	=
X-Google-Smtp-Source: AGHT+IHWDx0hDk235jLo6l78Y0i9IOvuN8+EE87ABwHwG8I4MS28S4WNHkTGjUKRNqxQGWYAbC8O3w==
X-Received: by 2002:a05:620a:4093:b0:78a:4276:3a0f with SMTP id f19-20020a05620a409300b0078a42763a0fmr398880qko.57.1711117616153;
        Fri, 22 Mar 2024 07:26:56 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id x17-20020a05620a099100b00789ed8823f5sm806053qkx.0.2024.03.22.07.26.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 07:26:55 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-68f41af71ebso17474276d6.1
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 07:26:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKoimrpieGG8vZt5zl3Re9psT06h9JppA8DPsbrtiuHncCJnPxpRxVtqZRcdiclxBM8hCeJ0b4Ngohk+LbvEmrt/+zpp6Hsp6NlnY=
X-Received: by 2002:a05:6214:f01:b0:691:59ad:ff46 with SMTP id
 gw1-20020a0562140f0100b0069159adff46mr3034248qvb.30.1711117615005; Fri, 22
 Mar 2024 07:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230501-uvc-align-v1-1-0f713e4b84c3@chromium.org> <20240322115606.GA31979@pendragon.ideasonboard.com>
In-Reply-To: <20240322115606.GA31979@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Mar 2024 15:26:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCuB0jABPPsoj0RxJ2UbV1UD0i5WwnubySDB0p7LocNJDQ@mail.gmail.com>
Message-ID: <CANiDSCuB0jABPPsoj0RxJ2UbV1UD0i5WwnubySDB0p7LocNJDQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Explicit alignment of uvc_frame and uvc_format
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 22 Mar 2024 at 12:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, May 01, 2023 at 04:49:31PM +0200, Ricardo Ribalda wrote:
> > Struct uvc_frame and uvc_format are packaged together on
> > streaming->formats on a sigle allocation.
>
> s/sigle/single/
>
> >
> > This is working fine because both structures have a field with a
> > pointer, but it will stop working when the sizeof() of any of those
> > structs is not a muliple of the sizeof(void*).
> >
> > Make that aligment contract explicit.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > This is better than 3 allocations, and do not have any performance
> > penalty.
> > ---
> >  drivers/media/usb/uvc/uvcvideo.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9a596c8d894a..03e8a543c8e6 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -252,7 +252,7 @@ struct uvc_frame {
> >       u8  bFrameIntervalType;
> >       u32 dwDefaultFrameInterval;
> >       u32 *dwFrameInterval;
> > -};
> > +} __aligned(sizeof(void *)); /* uvc_frame is packed on streaming->formats. */
>
> Don't we need u32 alignment here, not void * alignment, given that
> uvc_frame is followed by an array of u32 ?

Let me make sure that I explain myself :)

I made a small program in compiler explorer:
https://godbolt.org/z/7s9z8WTsx that shows the error that I want to
avoid

When we have a structure like this:

struct n_foo_bar {
   int n;
   struct foo *foo;
   struct bar *bar;
};

We expect that *foo and *bar point to memory addresses with the right
cpu alignment for each struct. Otherwise accessing foo and bar could
be slow or simply not work.

In the driver we are doing something like this to allocate the structure:

int size
struct n_foo_bar *out;

size = n*sizeof(struct foo)+n*sizeof(struct bar) +sizeof(struct n_foo_bar);
out = malloc(size);
if (!out)
  return out;

out->foo=(void *)(out)+sizeof(struct n_foo_bar);
out->bar=(void *)(out->foo)+n*sizeof(struct foo);

But that only works if sizeof(struct foo) is a multiple of the
alignment required by struct bar. We are "lucky" now because we have a
pointer in each struct and that gives us a void* padding. ... but if
we ever remove that pointer from the structure we will be in a bad
position.

With the  __aligned(sizeof(void *)); I want to explicitly say:

"Ey, this struct is embedded in another struct and they are allocated
contiguously"

Does it make more sense now?

>
> >
> >  struct uvc_format {
> >       u8 type;
> > @@ -266,7 +266,7 @@ struct uvc_format {
> >
> >       unsigned int nframes;
> >       struct uvc_frame *frame;
> > -};
> > +} __aligned(sizeof(void *)); /* uvc_format is packed on streaming->formats. */
>
> Same here, technically we need to ensure that the following uvc_frame
> will be aligned. void * alignment will give us that now, but that's not
> the actual constraint.
>
> Wouldn't it be better to handle the alignment constraints explicitly
> when allocating the memory ? It's not that uvc_frame and uvc_format have
> intrinsic alignment constraints, the constraints are only needed because
> of the way memory is allocated.
>
> >
> >  struct uvc_streaming_header {
> >       u8 bNumFormats;
> >
> > ---
> > base-commit: 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
> > change-id: 20230501-uvc-align-6ff202b68dab
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

