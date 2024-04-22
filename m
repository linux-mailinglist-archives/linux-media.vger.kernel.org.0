Return-Path: <linux-media+bounces-9852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DE8AC92D
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 11:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4881C21305
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 09:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CE984A49;
	Mon, 22 Apr 2024 09:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DpfVDwzM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8BC5579A
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713779042; cv=none; b=AibkuCpHgUAh0NYZrmvDsVTpGUtvb8lah2aK10AQIYuT+X+j9ow0Jab47TFTf669KwpbgRsS860cI1X3/VVjPyM6OL20Ws0VhZV5UjsGv0N+WxMmidviYXW57bRTVOUXxkJ9LtU4Ysfip3DqtiExNctDL8TWP4gdmLSdP5bw8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713779042; c=relaxed/simple;
	bh=qU7j2eKzRzGdXHdu+v41VpmFqjyLjtsDGOhen0o7tWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nrogxqd1h3tFlDo4+71l4gi5undLoiQpt4H8M7Vl5rxg24G/b+/vFmZXyc6jg4E6AihFbsIaRAs7hV8dy2PyYTKN/isTwDwiS33ksbKZzRzeNAz1iqTYljDRPeM8Uh1fUZGALLW0AfXoe4YYvycbPGlH9ecVXCnQ5DDpSTIkG1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DpfVDwzM; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-69b4043b7b3so25731186d6.1
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 02:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713779039; x=1714383839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9VxCHy7J40of+JwGi5IlPyBYxiLpWTy7yUQsIy5MFME=;
        b=DpfVDwzMCRs96pKN/ZLYJz3tnxkVXAjGlxlPbL7i+c3cuKO/VvW5j4+tuKCRzi7qoQ
         xokFm8H/oGXJNmYdPh37bLtDFPUMuQAKicPQWtIFXEFqk1uxkU4Wj+POBiH9nYfvR2jE
         SwD6Qq6By/xCMY1u8DZJ4SI53DnEz6Ts5DatE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713779039; x=1714383839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VxCHy7J40of+JwGi5IlPyBYxiLpWTy7yUQsIy5MFME=;
        b=qqMgJnQYqwv1utuOxBHRI0sG83J/Dm+WG/oqM4CALGuR2h8H1La/d9aLfhDHrLgf0e
         lZDWqEd0FcO9b1+uj3xc1FimYTEf9E1/nMiMbBVydKaSwcvrbyxS9gOzh69+HbDxFW6y
         q+rFT4qjfsoiFy9I6C6B7efx+qWqUulDYieb9FG+zcK/fDteyMzcgEbAW0Qfw6ySRr5b
         6MKYfaCVGZXfRA5qgHfE1CgqUVx1RIYb1fIeHHascGilYCNz5lV8/HcfoAgfapw80NqR
         wxn6ts8SQPzRWPkfvhiDOd7ZiGEEaS4DpjGg9zu6oy9nwCC8Q4PLQZhqoljJUFCnV8hR
         5RPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2jWjcAzM6MDeJR9Mh/Y8bEU+9z0vc476zZmbtQF/UNDKSvzL432M+AeAwuh/MHo4pbm8B6sPJkH6h+uM/zkufayXhTgJxDz/glss=
X-Gm-Message-State: AOJu0YyrmsfdkUGOmiR9mAcMlLvUpIvEcnq+v9SZiF+HXDZu0cCmFD/x
	i9brGHX4yu0WD1FrP2xCH4qDsawqRq9VozaRCoWn9AjrDD5tFfB8dKj2HU8aeGl0DBhMbYrLJeX
	h0Q==
X-Google-Smtp-Source: AGHT+IERMYVCq+KJRUpMBPtd+duEO0sczf0xRhgsV6FoqUnuI+W/0uEheOnbxKptnRC9E7kdhOCOIA==
X-Received: by 2002:a05:6214:226:b0:69b:2446:2f14 with SMTP id j6-20020a056214022600b0069b24462f14mr9588784qvt.26.1713779039551;
        Mon, 22 Apr 2024 02:43:59 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id l26-20020a0c979a000000b0069b21f13c52sm4142669qvd.113.2024.04.22.02.43.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 02:43:58 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-69b4043b7b3so25731036d6.1
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 02:43:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAkF4dLdRbcsfcphX+2GzJlKB8731mMw8VHuYQmz9Orcba5SEM7hrLC96xva9+HwtllC7xkvue7Yywmsr2ySjv3nkR8UtgCMjPCUo=
X-Received: by 2002:a0c:fe0d:0:b0:6a0:826b:cdea with SMTP id
 x13-20020a0cfe0d000000b006a0826bcdeamr1640823qvr.47.1713779037993; Mon, 22
 Apr 2024 02:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ab56c444-418a-423d-8528-cf04d5d458ef@moroto.mountain>
 <CANiDSCvGc2hv-6+THH28vE6uaTL+go7144hSYafkhp21uaM1Cg@mail.gmail.com> <f17042fd-890a-4a1e-b51e-6aead9986128@moroto.mountain>
In-Reply-To: <f17042fd-890a-4a1e-b51e-6aead9986128@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 17:43:44 +0800
X-Gmail-Original-Message-ID: <CANiDSCvmWnYVib4OqqE+tZuBmGVTOo0ULo57VXwY1ekzT3T2NQ@mail.gmail.com>
Message-ID: <CANiDSCvmWnYVib4OqqE+tZuBmGVTOo0ULo57VXwY1ekzT3T2NQ@mail.gmail.com>
Subject: Re: [PATCH] media: stk1160: fix some bounds checking in stk1160_copy_video()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <elezegarcia@gmail.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Mon, 22 Apr 2024 at 17:30, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Wed, Apr 17, 2024 at 08:48:23PM +0200, Ricardo Ribalda wrote:
> > Hi Dan
> >
> > On Wed, 17 Apr 2024 at 19:51, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > The subtract in this condition is reversed.  The ->length is the length
> > > of the buffer.  The ->bytesused is how many bytes we have copied thus
> > > far.  When the condition is reversed that means the result of the
> > > subtraction is always negative but since it's unsigned then the result
> > > is a very high positive value.  That means the overflow check is never
> > > true.
> > >
> > > Fixes: 9cb2173e6ea8 ("[media] media: Add stk1160 new driver (easycap replacement)")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > > This patch is untested, I just spotted it in review.
> > >
> > > When this bug is fixed, the two checks for negative values of "lencopy"
> > > could be removed.  I wrote a version of this patch which removed the
> > > checks, but in the end I decided to leave the checks.  They're harmless.
> > >
> > >  drivers/media/usb/stk1160/stk1160-video.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> > > index 366f0e4a5dc0..bfb97ea352e7 100644
> > > --- a/drivers/media/usb/stk1160/stk1160-video.c
> > > +++ b/drivers/media/usb/stk1160/stk1160-video.c
> > > @@ -139,8 +139,8 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
> > >          * Check if we have enough space left in the buffer.
> > >          * In that case, we force loop exit after copy.
> > >          */
> > > -       if (lencopy > buf->bytesused - buf->length) {
> > > -               lencopy = buf->bytesused - buf->length;
> > > +       if (lencopy > buf->length - buf->bytesused) {
> > > +               lencopy = buf->length - buf->bytesused;
> > >                 remain = lencopy;
> > >         }
> >
> > I think it is a bit more complicated than bytesused.
> >
> > bytesused does not take into consideration the actual position where
> > it is going to write.
> >
> > What we really want to check is if
> >
> > offset = dst - buf->mem;
> > if (offset + lencopy > buf->length) {
> >   lencopy = buf->length - offset;
> >   remain = lencopy;
> > }
> >
>
> You're right...  There is a comment explaining why we multiply the
> number of lines written by two, but it doesn't really clarify anything
> for me:
>
>         /* Multiply linesdone by two, to take account of the other field */
>
> What's the "other field"?

I guess it p[0].


Looks like the device sends first the data for the even lines, and
then the data for the odd lines (or the other way around).
And we are descrambling the data in the kernel

The code uses p[0] to figure out if it is the beginning of a block of
odds/evens, and if it is odd or even

if (p[0] == 0xc0 || p[0] == 0x80) {
/* We set next packet parity and
* continue to get next one
*/
dev->isoc_ctl.buf->odd = *p & 0x40;
dev->isoc_ctl.buf->pos = 0;
continue;
}



>
> I kind of suspect that the stk1160_buffer_done() might be wrong as well.
>
>         vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->bytesused);
>                                                    ^^^^^^^^^^^^^^
>
> We're calculating the space left based on ->pos which can be reset to
> zero in stk1160_process_isoc().  But ->bytesused isn't reset, so
> potentially we could end up in a situation where ->bytesused is greater
> than the ->length of the buffer.  Should stk1160_process_isoc() set
> ->bytesused to zero as well?

I do not think so. bytes->used is len(odd) + len(even). If you reset
bytesused then you are only returning 1/2 the size


>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda

