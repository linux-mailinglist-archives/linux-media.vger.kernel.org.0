Return-Path: <linux-media+bounces-1004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFE57F892F
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 09:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 123CBB21306
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 08:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E14944B;
	Sat, 25 Nov 2023 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHzxbxUY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FDCDB;
	Sat, 25 Nov 2023 00:22:12 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6c4eaa5202aso2535761b3a.1;
        Sat, 25 Nov 2023 00:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700900532; x=1701505332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXAMT1m/Mn+bDDg8lCVh+2sMt2ufqIKuHwMzy74xes8=;
        b=iHzxbxUYCaJf9UxQflyjp1LehTgiKwq2qfRukvaqrx0MnsDxrT3x2Hy27gMjGo8kBO
         wDQ67EKvc+CLxMlj92NExqDyObcNy5/38CyyBCD89SPtG3dNwWz5JEqBb6vHjm2unsv2
         kIs9H2xcQRCnDo7QHKPq6uzSqZfNRhOWDb+vGx7yj4ifj+DRvCBw/5QUMlw7ccHc9hmS
         jhpRUPSydFXCPFcYY8AgdIw9OemJeOITyyUD97eXrPoyZp0exPGKBhTyVU6CsaRhcnHR
         4m3zF12ITm43Vk+g3QuwW4KI0l8rucROtIesetgUG6/AT0D+g2r1D6lu7BVnil/7mI4S
         Mv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700900532; x=1701505332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXAMT1m/Mn+bDDg8lCVh+2sMt2ufqIKuHwMzy74xes8=;
        b=lS8C9MSEPjStTnPCPuckcWDUe1baljTaTGem1c2y7DQ3EJ2OMPbEkUlycynNNwFEFV
         jDtMrX93TQKTQKORZOI2x6RRocdZLxB4I6zpOZrr2PtpgxUOuc2szdsQsmbgBYODdfPv
         8+InsiKh48ltiSE71TMgFTBcrJ1cl11++AuxBSDhpsWrruEb0OM23T/Xx2/xpF89t6i5
         LYq1wWdk1d4EidjYE2qLJbs0dZATqdzUyQWXWl+dqM0GLSZPYZDX0BGxmwYMevsjgxAb
         NQRpGE2AZ9Wdfi8GrkJ5B8c41UpdSL/+G4mOO/LMohv/p4j0n2uYi16O8ifLLh+hX9Qf
         Bcpg==
X-Gm-Message-State: AOJu0YxGSnPPzIpeSX+lY8Dt8/1GsqzP650md3WWOyGRd3Rk/hrMNMCP
	2EBviyOplSx71IScrBB7nPmYn27a/+8aVvwEQAI=
X-Google-Smtp-Source: AGHT+IGIERX2T7/D9zdX3uAWBmI3HkeyREbrc0bFp4tUviYv26xYWhn+7W1oa8oyCvK0VLx70DDaHtjBNsFax/WpcLg=
X-Received: by 2002:a05:6a20:8421:b0:185:876f:4f4d with SMTP id
 c33-20020a056a20842100b00185876f4f4dmr8211221pzd.32.1700900532019; Sat, 25
 Nov 2023 00:22:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125073738.649948-1-ghanshyam1898@gmail.com> <2023112554-bagginess-banker-089e@gregkh>
In-Reply-To: <2023112554-bagginess-banker-089e@gregkh>
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date: Sat, 25 Nov 2023 13:51:35 +0530
Message-ID: <CAG-BmocpXo5GY7KSh-nnw7Z6ExkMGKxetoeSdbyNjrqFCGJLQA@mail.gmail.com>
Subject: Re: [PATCH V3] media: stk1160: Fixed high volume of stk1160_dbg messages
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	Phillip Potter <phil@philpotter.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 1:18=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Nov 25, 2023 at 01:07:38PM +0530, Ghanshyam Agrawal wrote:
> > The function stk1160_dbg gets called too many times, which causes
> > the output to get flooded with messages. Since stk1160_dbg uses
> > printk, it is now replaced with printk_ratelimited directly.
> >
> > Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > ---
> > V3:
> > Fixed the issue with my patch needing previous versions being applied
> > first.
> >
> > Used printk_ratelimited instead of dev_warn_ratelimited because
> > of compiler error "incompatible pointer type".
> >
> > V2:
> > To add KERN_WARNING in printk_ratelimited, and later as per warning by
> > the checkpatch script, replaced  printk_ratelimited with
> > dev_warn_ratelimited.
> >
> > V1:
> > The function stk1160_dbg gets called too many times, which causes
> > the output to get flooded with messages. Since stk1160_dbg uses
> > printk, it is now replaced with dev_warn_ratelimited.
> >
> >  drivers/media/usb/stk1160/stk1160-video.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/=
usb/stk1160/stk1160-video.c
> > index 4e966f6bf608..98417fa31d70 100644
> > --- a/drivers/media/usb/stk1160/stk1160-video.c
> > +++ b/drivers/media/usb/stk1160/stk1160-video.c
> > @@ -107,8 +107,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *sr=
c, int len)
> >
> >       /*
> >        * TODO: These stk1160_dbg are very spammy!
> > -      * We should 1) check why we are getting them
> > -      * and 2) add ratelimit.
> > +      * We should check why we are getting them.
> >        *
> >        * UPDATE: One of the reasons (the only one?) for getting these
> >        * is incorrect standard (mismatch between expected and configure=
d).
> > @@ -151,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *sr=
c, int len)
> >
> >       /* Let the bug hunt begin! sanity checks! */
> >       if (lencopy < 0) {
> > -             stk1160_dbg("copy skipped: negative lencopy\n");
> > +             printk_ratelimited(KERN_WARNING "copy skipped: negative l=
encopy\n");
>
> You changed a debug message level to a KERN_WARNING level?  That feels
> like a step backwards.
>
> thanks,
>
> greg k-h

Hi Greg,

Thanks for your response. The log level should indeed be DEBUG
as it was earlier.

I only wanted to add a rate limit there because it was printing too
many log messages as mentioned in the todo. Shall I update the
log level  to DEBUG and resend the patch? Thank you very much
again.

Regards,
Ghanshyam Agrawal

