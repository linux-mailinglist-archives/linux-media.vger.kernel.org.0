Return-Path: <linux-media+bounces-8665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC0898D0C
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 19:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E92F828FD2C
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 17:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE0F12D1ED;
	Thu,  4 Apr 2024 17:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EEVemeH5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A611CAA2
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712250772; cv=none; b=PdLelEnYqzUORmL6zD6n3Dbr8pJxGS1Al5cLvNqlRIVCr51LS5pqrE36Mw9cRa8rANnC3jtQGgN//KimF7zvRZqNyRQo1ZNaeSAWAwkHbDtF/0E176LGEfGnmeuURWTx3pD4q5Y9rVcX7B7Labl3DzvTd8v3VDX+tVl4xs9YO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712250772; c=relaxed/simple;
	bh=q2vSnLkZdK+cF5cwh1lLcPQrmaY/O+d2loT+u8w1Gjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mn+C2yLrhuWhEtFUnsoWtJ8jKG8RhjjVtyCT44OMCvxYGH3Ui66tjMsrGWoj9eXAbbqKBf+AGFm0wj/5J2QGEBSmbZMALkZp6n6lQou5hdIC3rodk9OtEJQi3toGcvhtVrPNWwxSmzAHT/lNHWuNWQZQxaYxYhV5BfHtAQLUJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EEVemeH5; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42f4b66dc9eso5732611cf.2
        for <linux-media@vger.kernel.org>; Thu, 04 Apr 2024 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712250769; x=1712855569; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CrvNXh1BQUyZBtc3CRIqLlUYNYDJkZ5+/l+Xgjsutwo=;
        b=EEVemeH50Z3f8Mw5CK6jPAQd2P3yqCaPJ0r9V9EUcDp7SihhCumnebeli42G0B69Fr
         SBk9o0whnPCdnQCtRUYk9ZeJHVXlUjIr+wq//4xN4zcnbNa97zCFLYp8UAm2JphcTohM
         /2DKYMi22TC4aN0r916C+UDYhIc4GaZ+wqhm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712250769; x=1712855569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrvNXh1BQUyZBtc3CRIqLlUYNYDJkZ5+/l+Xgjsutwo=;
        b=fI7Rhp5C/G/3yLGPXCx44ebq2zq5o63+/0OXdhwLy55lwjlbrfEz6EgV+XyCC/OEsf
         JnDek3DTaPsQmSAghaPNX320A3nWk7tGlHzPo4+DhQOeBio90wzkt2mVOAhnmw0/61vk
         tyAsZqKWSnwpxtfWf1l4WITlJ+ehXcd/Baubgi/WzEIm3M5EQqVxq90LkVfIXl6PHSfY
         FpZS0troNSw5HNk5V4JDpv4J7EczbBJo5P0yR7+7L6f4FbtvsJMq3d7Ke0wJHH0ddnlB
         q/TuyrFhVwepzOs1orpIUIdrzfyBzLZc+EuAvrsEALrpVRk00MokwJL2kNJe/DtixQ75
         u70w==
X-Forwarded-Encrypted: i=1; AJvYcCWI/YCvDDYKwCDUbAelH4n///DMgMA/0gjz8hlvj55BvqkazkIQtkMgZpCkVypBit3p8o26KryCt+/Ptz9f5AJuRiHfZa8pnL+4EiY=
X-Gm-Message-State: AOJu0YwturytfJNNL/nM6I2JIh4jM7alFvI7dgX5EszMsvw792g2oT4u
	QM3yJ6bvLWRbVLKOtlqpXvXRT+TIOeqKzUSrbJgZtlllKnbXlIslblAd7HJWqJAvNFT5PK0lBW+
	7ji52
X-Google-Smtp-Source: AGHT+IFKVELcSsiSx3YyYbTIOdKrmMf1iah0XeNX5zSGJPN912bfbFkouQUr9Wc69kd88YWnNOCvMA==
X-Received: by 2002:a05:622a:2:b0:432:a566:cf71 with SMTP id x2-20020a05622a000200b00432a566cf71mr382158qtw.9.1712250769233;
        Thu, 04 Apr 2024 10:12:49 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id gb7-20020a05622a598700b00434386bf75asm2709844qtb.34.2024.04.04.10.12.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 10:12:48 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-789e2bf854dso65545885a.3
        for <linux-media@vger.kernel.org>; Thu, 04 Apr 2024 10:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVo2gNCcARoGXzkAn0jjY4m4UK0J36DVe4/7itFXXL4RtL0uFgVEOzM+XYNk+w6eoiunMN9/UZgXH18VV/q85AABeA0AD5ozTpR+o4=
X-Received: by 2002:ad4:5949:0:b0:699:39ce:7453 with SMTP id
 eo9-20020ad45949000000b0069939ce7453mr286213qvb.33.1712250767706; Thu, 04 Apr
 2024 10:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230501-uvc-align-v1-1-0f713e4b84c3@chromium.org>
 <20240322115606.GA31979@pendragon.ideasonboard.com> <CANiDSCuB0jABPPsoj0RxJ2UbV1UD0i5WwnubySDB0p7LocNJDQ@mail.gmail.com>
 <20240404010414.GF23803@pendragon.ideasonboard.com>
In-Reply-To: <20240404010414.GF23803@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 4 Apr 2024 19:12:30 +0200
X-Gmail-Original-Message-ID: <CANiDSCtkWtnJT28fzRuo8Tk7U3Z1OyeY0MuM3X26mbUaq9QXAQ@mail.gmail.com>
Message-ID: <CANiDSCtkWtnJT28fzRuo8Tk7U3Z1OyeY0MuM3X26mbUaq9QXAQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Explicit alignment of uvc_frame and uvc_format
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 4 Apr 2024 at 03:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, Mar 22, 2024 at 03:26:39PM +0100, Ricardo Ribalda wrote:
> > On Fri, 22 Mar 2024 at 12:56, Laurent Pinchart wrote:
> > > On Mon, May 01, 2023 at 04:49:31PM +0200, Ricardo Ribalda wrote:
> > > > Struct uvc_frame and uvc_format are packaged together on
> > > > streaming->formats on a sigle allocation.
> > >
> > > s/sigle/single/
> > >
> > > > This is working fine because both structures have a field with a
> > > > pointer, but it will stop working when the sizeof() of any of those
> > > > structs is not a muliple of the sizeof(void*).
> > > >
> > > > Make that aligment contract explicit.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > This is better than 3 allocations, and do not have any performance
> > > > penalty.
> > > > ---
> > > >  drivers/media/usb/uvc/uvcvideo.h | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 9a596c8d894a..03e8a543c8e6 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -252,7 +252,7 @@ struct uvc_frame {
> > > >       u8  bFrameIntervalType;
> > > >       u32 dwDefaultFrameInterval;
> > > >       u32 *dwFrameInterval;
> > > > -};
> > > > +} __aligned(sizeof(void *)); /* uvc_frame is packed on streaming->formats. */
> > >
> > > Don't we need u32 alignment here, not void * alignment, given that
> > > uvc_frame is followed by an array of u32 ?
> >
> > Let me make sure that I explain myself :)
> >
> > I made a small program in compiler explorer:
> > https://godbolt.org/z/7s9z8WTsx that shows the error that I want to
> > avoid
> >
> > When we have a structure like this:
> >
> > struct n_foo_bar {
> >    int n;
> >    struct foo *foo;
> >    struct bar *bar;
> > };
> >
> > We expect that *foo and *bar point to memory addresses with the right
> > cpu alignment for each struct. Otherwise accessing foo and bar could
> > be slow or simply not work.
>
> So far, so good.
>
> > In the driver we are doing something like this to allocate the structure:
> >
> > int size
> > struct n_foo_bar *out;
> >
> > size = n*sizeof(struct foo)+n*sizeof(struct bar) +sizeof(struct n_foo_bar);
> > out = malloc(size);
> > if (!out)
> >   return out;
> >
> > out->foo=(void *)(out)+sizeof(struct n_foo_bar);
> > out->bar=(void *)(out->foo)+n*sizeof(struct foo);
> >
> > But that only works if sizeof(struct foo) is a multiple of the
> > alignment required by struct bar.
>
> The real requirement is a bit more complex, it's sizeof(struct n_foo_bar) +
> sizeof(struct foo) that needs to be a multiple of the alignment required
> by struct bar (and even that is simplified, as it assumes that malloc()
> returns a pointer aligned to the requirements of struct bar, which in
> practice should always be the case).
>

struct n_foo_bar, has two pointers: foo and bar. Because of the
padding, Its sizeof has to be a multiple of sizeof(void *).
We only care about the sizeof(foo).

And malloc has to provide an alignment of at least sizeof(void *),
otherwise the implementation is pretty broken :)

for kmalloc the alignment is ARCH_KMALLOC_MINALIGN


> > We are "lucky" now because we have a
> > pointer in each struct and that gives us a void* padding. ... but if
> > we ever remove that pointer from the structure we will be in a bad
> > position.
>
> We have three levels in uvcvideo. The top-level structure (your
> equivalent of n_foo_bar), struct uvc_format, has a pointer to an array
> of struct uvc_frame. The second level, struct uvc_frame, has a pointer
> to an array of u32. All three are then allocated in one go,
> contiguously.
>
> The largest field in uvc_frame is a pointer, so the alignment
> requirement will be fulfilled if struct uvc_format is aligned to
> sizeof(void *). When it comes to struct uvc_frame, however, its size
> needs to be a multiple of sizeof(u32), not of sizeof(void *).

OK, we might save 2 bytes :), at the cost that we cannot reshuffle the
fields in the top-level struct.

>
> Given that the alignment constraints are not intrinsic to these
> structures, I think it would be better to handle them when allocating
> the memory. Something along the line of

This is what I was trying to avoid, but with the __alignof__ macros it
does not look that bad...

Maybe we should just make 3 allocations instead of having our mini
malloc implementation :)

Let me send a v2

Thanks!

>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f33a01dbb329..cbc40d663e4f 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -687,8 +687,11 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                 goto error;
>         }
>
> -       size = nformats * sizeof(*format) + nframes * sizeof(*frame)
> +       size = nformats * sizeof(*format);
> +       size = ALIGN(size, __alignof__(*frame)) + nframes * sizeof(*frame);
> +       size = ALIGN(size, __alignof__(*interval))
>              + nintervals * sizeof(*interval);
> +
>         format = kzalloc(size, GFP_KERNEL);
>         if (format == NULL) {
>                 ret = -ENOMEM;
>
> plus a corresponding change when calculating the pointers to the frames
> and intervals just after.
>
> > With the  __aligned(sizeof(void *)); I want to explicitly say:
> >
> > "Ey, this struct is embedded in another struct and they are allocated
> > contiguously"
> >
> > Does it make more sense now?
> >
> > > >
> > > >  struct uvc_format {
> > > >       u8 type;
> > > > @@ -266,7 +266,7 @@ struct uvc_format {
> > > >
> > > >       unsigned int nframes;
> > > >       struct uvc_frame *frame;
> > > > -};
> > > > +} __aligned(sizeof(void *)); /* uvc_format is packed on streaming->formats. */
> > >
> > > Same here, technically we need to ensure that the following uvc_frame
> > > will be aligned. void * alignment will give us that now, but that's not
> > > the actual constraint.
> > >
> > > Wouldn't it be better to handle the alignment constraints explicitly
> > > when allocating the memory ? It's not that uvc_frame and uvc_format have
> > > intrinsic alignment constraints, the constraints are only needed because
> > > of the way memory is allocated.
> > >
> > > >
> > > >  struct uvc_streaming_header {
> > > >       u8 bNumFormats;
> > > >
> > > > ---
> > > > base-commit: 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
> > > > change-id: 20230501-uvc-align-6ff202b68dab
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

