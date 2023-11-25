Return-Path: <linux-media+bounces-1001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 179007F88C3
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 08:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71751F20EC1
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 07:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFE763B5;
	Sat, 25 Nov 2023 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar87xtHN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977F119E;
	Fri, 24 Nov 2023 23:13:03 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1957245a12.1;
        Fri, 24 Nov 2023 23:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700896383; x=1701501183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtqF80WLttDzEODiE7Bbxwbs4nxVZwokhMgPSxT4dEQ=;
        b=Ar87xtHNaH5PRnurB85K1IGNMyzXYQ6VT8QUM+0BHDi/8Z5pQCD2qUJkZXQrhl1RsZ
         96ZGgKnHVYwRG0V1G8NYWrR0MZRK4Eu7HP3xYX0ulKKSdoU6rvrJ2h0GnEkUIQqwfREr
         0zhgh8r/hCiuYSnOjxKAbjuOOuhIzmWmzg4GBZKXu7J/VDppB4IaR2nSPpZ9o5/ecRem
         MGhlIlP1HNxnT3RUKg9+GwXd8hy7xoGnb4HzprBUa93JVitshy2vg3qVZYeIbU4ht5iN
         fohqjA58meN4L+t2iP/YXCXcmO7j2WddyC2SOig3/WJqpJ6IM6V3c7qs6UhMC67X0xhY
         c5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700896383; x=1701501183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtqF80WLttDzEODiE7Bbxwbs4nxVZwokhMgPSxT4dEQ=;
        b=bwYZqGbmL8pONjWoIt2O7zfNsUVMPDWb9ILZ1jsAyLqc+7ccf6Nm4lNZwvvnLxdm+/
         +gZjruAo3N/++AqNw6N86qqStCyGcbnLFV0cs1MnuywnoaP4CzJnTMfhYy7U07/a5iDs
         qZFTUNF3CVpDx/N0Ak6abeXCGMUySCoxM+rssoy9dzCLyaRtFWiKn6HVe2lGamGhpqQg
         +fnNAeRlHfv8hQniwoWATUXZ4QwV530Ceax7qAd9OJjkYzLpI48Masa6rjEEU6UJ7fxM
         N8tFDKuQYPxtNCJCeU5M0fuC24B1JHQGt1sOingZxpI0WnfW4oczw1bkqOv1xogb9wgn
         +8zQ==
X-Gm-Message-State: AOJu0YzCy6nkA94ifcp+dmMVXNPcu59L8OFevaVKdRcfjDtrMexOsIY/
	UbJZZqHAGdUdgrABwvY0xnBsdgMGrY8ae+KBH1CUf5alCapQiwZt
X-Google-Smtp-Source: AGHT+IGaNH7fS0iuKiLVJx9efwqeQT0c6EltM7hmQCQVaOg6Ga0b0I2i4sPz23HYXj4pfnwwRDx401MO2Xi0yrlkjfc=
X-Received: by 2002:a17:90b:1d09:b0:280:c98f:2090 with SMTP id
 on9-20020a17090b1d0900b00280c98f2090mr6878396pjb.32.1700896382977; Fri, 24
 Nov 2023 23:13:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122161304.12434-1-ghanshyam1898@gmail.com> <ZWEj5sDUs83qn0pc@equinox>
In-Reply-To: <ZWEj5sDUs83qn0pc@equinox>
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date: Sat, 25 Nov 2023 12:42:26 +0530
Message-ID: <CAG-BmodoZyi50XK-pQ=YPZ-q6BLKCbwSpck7jn=dgRsXVQxUwA@mail.gmail.com>
Subject: Re: [PATCH V2] media: stk1160: Fixed high volume of stk1160_dbg messages
To: Phillip Potter <phil@philpotter.co.uk>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 4:00=E2=80=AFAM Phillip Potter <phil@philpotter.co.=
uk> wrote:
>
> On Wed, Nov 22, 2023 at 09:43:04PM +0530, Ghanshyam Agrawal wrote:
> > The function stk1160_dbg gets called too many times, which causes
> > the output to get flooded with messages. Since stk1160_dbg uses
> > printk, it is now replaced with dev_warn_ratelimited.
> >
> > Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > ---
> > v2:
> > Thanks for your suggestions Phillip. I have updated the TODO comment an=
d
> > used dev_warn_ratelimited for inclusion of kernel warning.
> >
> >  drivers/media/usb/stk1160/stk1160-video.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/=
usb/stk1160/stk1160-video.c
>
> Hi Ghanshyam,
>
> Thank you for the patch, but it is sadly incorrect.
>
> You have created this V2 against a tree including the V1 version of your
> patch. A V2 patch should apply cleanly against the source tree, with no
> previous version first needing to be applied.
>
> On another note, why are you using dev_warn_ratelimited here, and if
> there's a good reason, why not use it for the other callsites in this
> function? (Genuine question here, I've not studied the difference).
>
> Please create a V3, many thanks.
>
> Nacked-by: Phillip Potter <phil@philpotter.co.uk>
>
> Regards,
> Phil

Hi Phillip,

Thank you for taking time to review my patch.

I will fix the issue with my patch needing previous versions being applied
first.

I had used dev_warn_ratelimited because the checkpatch script mentioned
a sequence of priorities to use various logging functions and
dev_warn_ratelimited had higher priority. But now I have found other issues
with using this function here, so I will switch back to printk_ratelimited.

Let me fix the issues and submit a V3 patch. Thanks again for your time
and kind suggestions.

Regards,
Ghanshyam Agrawal

