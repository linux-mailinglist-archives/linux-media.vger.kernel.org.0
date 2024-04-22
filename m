Return-Path: <linux-media+bounces-9868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B628ACF99
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 16:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 289AA28425E
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 14:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C978152169;
	Mon, 22 Apr 2024 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hCQ73Vhb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA5136988
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713796801; cv=none; b=ZxzedGjVRezgAWRn+tht9xYWeA8aSxnDPu7vRS1GWLsnzqv4CezY4T9N5Q+v1hRdSDwUaVwuB4prFmIgeWN5mM7kvK0kXdy+4s/Gkeo8rPvusS35gNbXZTrEz+9T/QgTCNtpE8nEGPm7hXLnlPnhZ59CSWWwWYXI922okqaipSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713796801; c=relaxed/simple;
	bh=CmrfAGE8+PWDqHNf4q0R+xV3Sihym/OZTAep1aho/Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=af6zkIWuAzEufuxyNCGs937DOg26+qYBjiFquFeQGcskegq5wZcKvAQiEgOxqJL5i3yxSdsyvVMWHV+RHwfX9xBYGrpeDxodf1hv6RdrpivGntyuKkicDsLjxx4Z3TU1Er/FbiVGSMqTk71T+tFZhl+klZ8l/aDvbysF9nbMswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hCQ73Vhb; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78edc3e7cd9so299858385a.1
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713796798; x=1714401598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lO7+CAKZ03CjsGbLxspLPlTA+srzrioL1UHFdc2MiwY=;
        b=hCQ73Vhb3CjsyV11UZA39MybVrUw45TNdjAK7OM1e/c1neQA1/23A/+Sx7ITNK1GTx
         H6jm1XwAVWbe1C4BGpGApfxTSNV3rsehteWHIgqYcxx9df8DPLQNHZjTcd9MPSxPqFqj
         jqVjROez7AcRIRn6VkP2dqar0/FTL5O7rH1ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713796798; x=1714401598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO7+CAKZ03CjsGbLxspLPlTA+srzrioL1UHFdc2MiwY=;
        b=aNIEQnHPv897Fr5pFouFbhzHNUMsVWzb538X1SxecNWzBPD07r14YlmQsNolEtvd5f
         K26nr1pEvfrGxqp2FoI5FJl+4u8RHzQDonCaG8ZE/ONMYZzBuFXgVVfao4LVanVyBC9l
         JSDQPhFZaYiNRa/8mSLOaHfX68l4DGOidptJ3Wjs88S0sOU9MLkyIFPZ1iyApVd8F4+w
         VUEKsKvcyxMXk7taBCmdOwI3RnlGj/J0DJOjdtjNu70DU4tHIiGFVyVmRqwTkbi/iDB5
         hw2j7WuNcf5XlIsvhAiID8RtWG0ZC0usQQyQ46H4udrGfzaWRiznnWvXSWudWD/VsTF/
         NbKA==
X-Forwarded-Encrypted: i=1; AJvYcCXqF4ia+J+lNZgjFhNC6dbT0qjTenbr7chCr2JSZoJADDpeFPvQNMT6tc0YuKrrGqfQU6nlMpU67FoyzgFwXrkWp+x0ZwUjT/5lOaw=
X-Gm-Message-State: AOJu0YyhXmL12bgkzQ7ErJQPANhvtzjE5Chp8JZdOKs3lOYSFAAjU8Aq
	m1IbwbMT5E666/sPfmIXAnkTaLK1Ie8TXjHLZZHssWSZaEN40BGr6uG5QQpORhIoorIzQsoWFS4
	F5Q==
X-Google-Smtp-Source: AGHT+IFVY0ELscb3hnAYuoKrwETswQY2EGcM48g675qJ1qdRoVdeBB8+3tSTlhg7/MKhnGp1tPCuBg==
X-Received: by 2002:a05:620a:2182:b0:78f:13d3:693e with SMTP id g2-20020a05620a218200b0078f13d3693emr11733790qka.5.1713796797714;
        Mon, 22 Apr 2024 07:39:57 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05620a31a700b0078d66ed5e41sm4312662qkb.131.2024.04.22.07.39.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 07:39:57 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-69b24162dd6so20729406d6.2
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 07:39:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvT74aKruwvlhgCw+Hu8ycrQHtvtEZUX1zSCLwxLeHAutJmJHJ41KUxEHRVuEOwgV66EqNUCDcO4zSw04dPkCsoNT0W/E5tTQMrsU=
X-Received: by 2002:a0c:e991:0:b0:6a0:405f:f29b with SMTP id
 z17-20020a0ce991000000b006a0405ff29bmr10346738qvn.55.1713796795833; Mon, 22
 Apr 2024 07:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e43980df-1ca5-459d-b037-788dd7d9085d@moroto.mountain>
 <CANiDSCtjEPqEstuo92QeVK_rWkW9icsjKWakPyN19ETM+MJuuQ@mail.gmail.com> <f2e9cdcd-46e7-41ab-9d5f-c1237a0a6222@moroto.mountain>
In-Reply-To: <f2e9cdcd-46e7-41ab-9d5f-c1237a0a6222@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 22:39:39 +0800
X-Gmail-Original-Message-ID: <CANiDSCvVZtpkU6KnSYE4v7cTsgsjOb4E5XgK5eGMpRX7wCTQ3A@mail.gmail.com>
Message-ID: <CANiDSCvVZtpkU6KnSYE4v7cTsgsjOb4E5XgK5eGMpRX7wCTQ3A@mail.gmail.com>
Subject: Re: [PATCH v2] media: stk1160: fix bounds checking in stk1160_copy_video()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <elezegarcia@gmail.com>, 
	Ghanshyam Agrawal <ghanshyam1898@gmail.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

Thanks for the patch

On Mon, 22 Apr 2024 at 19:23, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Mon, Apr 22, 2024 at 05:52:36PM +0800, Ricardo Ribalda wrote:
> > Hi Dan
> >
> > On Mon, 22 Apr 2024 at 17:32, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > The subtract in this condition is reversed.  The ->length is the length
> > > of the buffer.  The ->bytesused is how many bytes we have copied thus
> > > far.  When the condition is reversed that means the result of the
> > > subtraction is always negative but since it's unsigned then the result
> > > is a very high positive value.  That means the overflow check is never
> > > true.
> > >
> > > Additionally, the ->bytesused doesn't actually work for this purpose
> > > because we're not writing to "buf->mem + buf->bytesused".  Instead, the
> > > math to calculate the destination where we are writing is a bit
> > > involved.  You calculate the number of full lines already written,
> > > multiply by two, skip a line if necessary so that we start on an odd
> > > numbered line, and add the offset into the line.
> > >
> > > To fix this buffer overflow, just take the actual destination where we
> > > are writing, if the offset is already out of bounds print an error and
> > > return.  Otherwise, write up to buf->length bytes.
> > >
> > > Fixes: 9cb2173e6ea8 ("[media] media: Add stk1160 new driver (easycap replacement)")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > > v2: My first patch just reversed the if statement but that wasn't the
> > > correct fix.
> > >
> > > Ghanshyam Agrawal sent a patch last year to ratelimit the output from
> > > this function because it was spamming dmesg.  This patch should
> > > hopefully fix the issue.  Let me know if there are still problems.
> > >
> > >  drivers/media/usb/stk1160/stk1160-video.c | 20 +++++++++++++++-----
> > >  1 file changed, 15 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> > > index 366f0e4a5dc0..e79c45db60ab 100644
> > > --- a/drivers/media/usb/stk1160/stk1160-video.c
> > > +++ b/drivers/media/usb/stk1160/stk1160-video.c
> > > @@ -99,7 +99,7 @@ void stk1160_buffer_done(struct stk1160 *dev)
> > >  static inline
> > >  void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
> > >  {
> > > -       int linesdone, lineoff, lencopy;
> > > +       int linesdone, lineoff, lencopy, offset;
> > >         int bytesperline = dev->width * 2;
> > >         struct stk1160_buffer *buf = dev->isoc_ctl.buf;
> > >         u8 *dst = buf->mem;
> > > @@ -139,8 +139,13 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
> > >          * Check if we have enough space left in the buffer.
> > >          * In that case, we force loop exit after copy.
> > >          */
> > > -       if (lencopy > buf->bytesused - buf->length) {
> > > -               lencopy = buf->bytesused - buf->length;
> > > +       offset = dst - (u8 *)buf->mem;
> > > +       if (offset > buf->length) {
> > Maybe you want offset >= buf->length.
> >
>
> The difference between > and >= is whether or not we print an error
> message.  In the original code, we didn't print an error message for
> this and I feel like that's the correct behavior
>
> > And remember to add at the beginning of the function
> >
> > if (!len)
> >  return 0;
> >
>
> That's checked in the caller so it's fine.
>
>    260                  /* Empty packet */
>    261                  if (len <= 4)
>    262                          continue;

It is also checked later on:

/* Check if the copy is done */
if (lencopy == 0 || remain == 0)
return;

I meant that we could move that check to the beginning of the funcion

But I agree, the scope of this patch is to fix the error not to
improve the code.

The stubborn part of me still thinks that it is better  offset >=
buf->length. :P
But even without that you can add my

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

I wish we could find someone to test it though.

>
> Generally we don't add duplicate checks.
>
> > And I would have done:
> > len -= 4;
> > src += 4;
> >
> > In the caller function
> >
>
> I don't really think it makes sense to move that into the caller and
> anyway, doing cleanups like this is outside the scope of this patch.
> Really, there is a lot that could be cleaned up here.  People knew there
> was a bug here but they didn't figure out what was causing it.  We could
> delete that code.  Looking at it now, I think that code would actually
> be enough to prevent a buffer overflow, although the correct behavior is
> to write up to the end of the buffer instead of returning early.
> Probably?
>
> To be honest, I'm still concerned there is a read overflow in
> stk1160_buffer_done().  I'd prefer to do
>
>         len = buf->bytesused;
>         if (len > buf->length) {
>                 dev_warn_ratelimited(dev->dev, "buf->bytesused invalid %u\n", len);
>                 len = buf->length;
>         }

After your patch I cannot see when this condition will be hitten...
but it is a cheap check, better safe than sorry.


>         vb2_set_plane_payload(&buf->vb.vb2_buf, 0, len);
>
> regards,
> dan carpenter
>
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index ed261f0241da..f7977b07c066 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -112,16 +112,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>         u8 *dst = buf->mem;
>         int remain;
>
> -       /*
> -        * TODO: These stk1160_dbg are very spammy!
> -        * We should check why we are getting them.
> -        *
> -        * UPDATE: One of the reasons (the only one?) for getting these
> -        * is incorrect standard (mismatch between expected and configured).
> -        * So perhaps, we could add a counter for errors. When the counter
> -        * reaches some value, we simply stop streaming.
> -        */
> -
>         len -= 4;
>         src += 4;
>
> @@ -160,18 +150,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>         if (lencopy == 0 || remain == 0)
>                 return;
>
> -       /* Let the bug hunt begin! sanity checks! */
> -       if (lencopy < 0) {
> -               printk_ratelimited(KERN_DEBUG "copy skipped: negative lencopy\n");
> -               return;
> -       }
> -
> -       if ((unsigned long)dst + lencopy >
> -               (unsigned long)buf->mem + buf->length) {
> -               printk_ratelimited(KERN_WARNING "stk1160: buffer overflow detected\n");
> -               return;
> -       }
> -
>         memcpy(dst, src, lencopy);
>
>         buf->bytesused += lencopy;
> @@ -208,17 +186,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>                 if (lencopy == 0 || remain == 0)
>                         return;
>
> -               if (lencopy < 0) {
> -                       printk_ratelimited(KERN_WARNING "stk1160: negative lencopy detected\n");
> -                       return;
> -               }
> -
> -               if ((unsigned long)dst + lencopy >
> -                       (unsigned long)buf->mem + buf->length) {
> -                       printk_ratelimited(KERN_WARNING "stk1160: buffer overflow detected\n");
> -                       return;
> -               }
> -
>                 memcpy(dst, src, lencopy);
>                 remain -= lencopy;
>


-- 
Ricardo Ribalda

