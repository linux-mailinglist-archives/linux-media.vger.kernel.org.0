Return-Path: <linux-media+bounces-34136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF62ACF155
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 15:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56AF8170346
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 13:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D42D272E69;
	Thu,  5 Jun 2025 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EXDv2no9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15092221278
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131670; cv=none; b=SGI/g502FCafei7cUsjcDYa/k8u6P5C6HUUsJdDMVLGca9H6Zsey68osoa7uyoLNAYeaoT67tWB0Pw61BsWtDsAVlajRicIjh5R8oSrIysdYOEgSMJ2YFmJBj/RExslLUf0645qLEQDYhnQ+3NLSVmSeXqOt7kjE0/QyW5+oj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131670; c=relaxed/simple;
	bh=+TOBFkAERJovCN5kqbGCMdlrzlQGvFhW8DZwkD+Uyws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2Ap71X15/j/lr96mUeBMNhJX4EFSgVrW8AUw3wrUfNNkAJ/NNC1bA7u1b+RiP8R1xM1P4JVoITQ9O1bDqozCUSqsSgYK6BQd0SJbKB/wSsmzDMiPN/jFYaF8pzEDbwp64Rp/6Yibb3f/Ck/xH2MYcHw7iSN9CpTC1j7t1wHJH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EXDv2no9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1319848e87.0
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749131666; x=1749736466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xDQqNGuaaJASa3A7hK13+SLre4swqicpLuA/hv4iDJo=;
        b=EXDv2no9ySdhAK7wB4vwso4qaFfn8vgqu8CCLCmhywewJXv+EHjJmB0nTnof7sV+5K
         WfZu6yVn38m+rS8itB/tDGNZo2Bkc3KIvsuGmQ6U1aAeyeMfJ8/maMvXTCUOBNOmrvSm
         B3s9bf7IA/yMdKPCDYiUCwemFHKrRX4/vV71E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131666; x=1749736466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDQqNGuaaJASa3A7hK13+SLre4swqicpLuA/hv4iDJo=;
        b=RCjYRmbRpAeIqEVC8NNwKBWc8BtglMN325DxFN+8EZOyLktYj1fopgq56YFYOTK5zP
         3gr3zpLSYA/r2rRNrO3AD5V7zqnJPIjjPO4bRxDNttgHJrCMdEJ/gGK5ELErcyh4++tD
         obAt8Jzy4lQxEGnE4Ht9XCjJX59QfdRKKxyoUNnoTTnRc/LXaXUbQyEmSq/SdgHJ19/W
         MNi4CWHEOQyRsonSrM0VGmIVY/gRbfU8q48TNlIo7LLGBvZAKKeHWPpGPbMY6ugnlaqb
         qsp6QPt/3DoRpeokQePsLzmDXK1rA1tIW5Ut61lrqFZv64IQA/XIMF2mL/9PAQ4kjJ9t
         uH9g==
X-Forwarded-Encrypted: i=1; AJvYcCW88GsmVwyJrkdzrWqojz8FTxdCtaJJMm7cLLNEbpikOAojMtQeSu0cCkL0gClXvW5hs1F8zJYaa+IcQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0iVdAnobUt0Z9m9iBX1ip15n6p5aHyVG4frA+P84VuLoIoWYW
	Cod4wYXjTNDMHseO4yPRlZ7F3J/PzJckGEcZ4xonP47HQHtiRdFB73KCP8IcoXuJ5YctmdJMQFY
	FigM=
X-Gm-Gg: ASbGncuSIp8ihmwdATuwQXV7ZxRW1woGhLCL9RRuWboe+9mNW/fYv+W246wRERk0oMO
	ralYePSfb8pZChSsIQ3iWpP1NWiz2i+gIfZtUJP9gK1hwusJguEy3w3fbb3fk+IH0mAElHh99Rf
	QRL5LmwlFED7iyobS8fjx03LBwNFgko8+PhAXhXcFQ55tVPd0rIJtYvP90R0zK0OxIuP6goTcje
	R/hQEDa1GYvCsa/C4TkUJ8LEAVwGKM/dhL0qalToUkP2Ltnd2ERQWpl2qFwNr17JYZR6f99FLiH
	nmi90oKphfIG43nBHwlyUCKeRNgfK/rwwTJodHU6H1P0Ii2rMbe/F+o3BJbV4HKG3qcNntF6xSe
	58iJDyUIggGXbZNaTZ9BnsgHL
X-Google-Smtp-Source: AGHT+IFpL39/KITLNBTG4knu5KnruRHE0xNUfgVxnaF6z8JmMVUSTxmsZI5ao4HBBQk2OBGJbxcLTg==
X-Received: by 2002:a05:6512:138a:b0:553:3892:5ec6 with SMTP id 2adb3069b0e04-55356bfb1c3mr2445924e87.35.1749131665711;
        Thu, 05 Jun 2025 06:54:25 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337937734sm2615590e87.223.2025.06.05.06.54.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:54:25 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1319831e87.0
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 06:54:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG3zBn6NcsXRZsSF5mReYCqewnYQd+sg7j0KdSYuMmHuQB9pLfgSf1BrROhEs72O8r6OtlXeM8wp9qUg==@vger.kernel.org
X-Received: by 2002:a05:6512:2353:b0:553:3178:2928 with SMTP id
 2adb3069b0e04-55356ae9f39mr2321670e87.16.1749131664631; Thu, 05 Jun 2025
 06:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-prefix-v1-1-450aff98308a@chromium.org>
 <20250605124635.GC29935@pendragon.ideasonboard.com> <CANiDSCs4B8ovA2jipUiDr3tC3SSCpJOownohx-X+UvD+2W2w9g@mail.gmail.com>
 <20250605131700.GA25847@pendragon.ideasonboard.com>
In-Reply-To: <20250605131700.GA25847@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Jun 2025 15:54:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCv9jpbXc-Oyv92a4ddjyNxrDZOzz3WdFYqMgBjwyKzg5Q@mail.gmail.com>
X-Gm-Features: AX0GCFvCB5ZTwiZ8OOsxMGXf1yz8-kFgKh2ihLwI0GjKmCbo6skbCyWdFvpL4Vk
Message-ID: <CANiDSCv9jpbXc-Oyv92a4ddjyNxrDZOzz3WdFYqMgBjwyKzg5Q@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] CONTRIBUTE: Add simple contribution instructions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Jun 2025 at 15:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jun 05, 2025 at 02:54:33PM +0200, Ricardo Ribalda wrote:
> > On Thu, 5 Jun 2025 at 14:46, Laurent Pinchart wrote:
> > > On Thu, Jun 05, 2025 at 12:09:57PM +0000, Ricardo Ribalda wrote:
> > > > In the media summit we discussed the need of a special prefix for
> > > > v4l-utils. This helps patchwork and media-ci.
> > > >
> > > > Create a new file with a brief introductions on how to contribute and
> > > > make the `v4l-utils` official.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >
> > > I think this is a good idea. I don't know how we'll get users to
> > > actually use the prefix, but documenting it is a necessary first step.
> >
> > I can add a comment in the media-ci email. Something like:
> >
> > I could not apply your series. Maybe it is for v4l-utils, if so,
> > please check  http://XXXX/CONTRIBUTE.md
>
> Sounds good. Then we can complain that people don't read instructions
> :-)
>
> > > > ---
> > > >  CONTRIBUTE.md | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..19a2c5814b45462f3cfeea921e277f8da00ccbd1
> > > > --- /dev/null
> > > > +++ b/CONTRIBUTE.md
> > > > @@ -0,0 +1,19 @@
> > > > +## Repository
> > > > +
> > > > +v4l-utils official repository is hosted at https://git.linuxtv.org/v4l-utils.git
> > > > +
> > > > +## Contributions
> > > > +
> > > > +Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
> > > > +using the prefix `[PATCH v4l-utils]`.
> > >
> > > Nitpicking, I was thinking of '[v4l-utils] [PATCH]' as that's what I
> > > used previously. Looking at the list archives, both (and more) have been
> > > used. I don't object to using '[PATCH v4l-utils]' if that's easier for
> >
> > This seems to be prefered by b4.... and who does not love b4 :P?
> >
> > > tools.
> > >
> > > I have this in my .git/config for v4l-utils:
> > >
> > > [format]
> > >         subjectPrefix = "v4l-utils] [PATCH"
> > >
> > > With your proposal, this would be
> > >
> > > [format]
> > >         subjectPrefix = "PATCH v4l-utils"
> > >
> > > In either case, let's document this in addition to the b4 configuration.
> >
> > Something like this?:
> >
> > diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
> > index 19a2c581..708939df 100644
> > --- a/CONTRIBUTE.md
> > +++ b/CONTRIBUTE.md
> > @@ -5,7 +5,11 @@ v4l-utils official repository is hosted at
> > https://git.linuxtv.org/v4l-utils.git
> >  ## Contributions
> >
> >  Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
> > -using the prefix `[PATCH v4l-utils]`.
> > +using the prefix `[PATCH v4l-utils]`. E.g:
> > +
> > +```
> > +git config set format.subjectPrefix "PATCH v4l-utils"
> > +```
>
> OK. Please check that setting both format.subjectPrefix and
> b4.send-prefixes will not add the prefix twice when using b4.

Tried with `b4 send -d` and it looks good to me, but we will know for
sure when I send the v2.
>
> >  ## b4 config
> >
> > > > +
> > > > +## b4 config
> > > > +
> > > > +If you use b4[1] for your contributor workflow you can use these options:
> > > > +
> > > > +```
> > > > +git config set b4.send-series-cc linux-media@vger.kernel.org
> > > > +git config set b4.send-prefixes v4l-utils
> > > > +```
> > > > +
> > > > +[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html
> > > >
> > > > ---
> > > > base-commit: 0d4e8e2d4e2d9d87863222e03fd3a6a4a3ff3d86
> > > > change-id: 20250605-prefix-a1a47dbdaa75
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

