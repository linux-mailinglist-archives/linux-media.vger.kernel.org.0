Return-Path: <linux-media+bounces-31128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A2CA9E435
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 20:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5981748A0
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 18:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B621DED51;
	Sun, 27 Apr 2025 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+viG7vp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21932F29;
	Sun, 27 Apr 2025 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745779827; cv=none; b=KSuAN1O/lQpbfiGuSLg27rgIvKi4rPo0KrdxAR2LfR7EP0WOFh6KDZcFTktH8lUk2bUs5j8BkAnojY8LWnH6BCpveHvY4+MhTRpoXQGLu2NWPDyE2g6hFuIPDZ4AMqAKVhE1nNRGgoWP6LJQKEV24n8Jc23vqa/9sSYGt/X7i9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745779827; c=relaxed/simple;
	bh=I3xuFXt5Jj66LY0ieOjSSpS2eBFpMUcO0f0tu2IQwNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EB5AsKpFWOULtwh6YAAv+iNyIKoCIExJDvbUrcLOoinVhmou/o5Bg+Bmwsy/MkO1dHGXkF5tFEIlnun1E7c2IyLLhxqtFxKL7LGi0jkXuybMso8pUx5TW3J6//jhv2t0J7juzCrgzuFkyUJjvSHiowriad28BbiWhlA6hWI78TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+viG7vp; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so6423132a12.2;
        Sun, 27 Apr 2025 11:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745779824; x=1746384624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG6MHc3a2VUtIWj154wVgDP9/hF7FkmZltXaB4/sLdE=;
        b=D+viG7vpZElrYxQxkDVqoie5yjXYMi8be0uLcLGOB9NMHlewM+9TG6sTLk0GE/JtoV
         HfT/DxeUe+I4WgtzYpjRPRkTkCLXH53hHazEKVF1T4ZHbuWbp2NAIukn4CbX9FZh19iV
         /DrBmDCoNnVCGgdGYhGqB3B0Vq98u4ERCzbYB0KEXPNkuGZA5t2Sp7+Jmj++bgOolbdw
         1Ufbw08mkGM7JDTc1BL8NWk/lPZiYXbNL9THF+laQ/tg/6CDOT/Vwqa8mxpO96PKHV9L
         kE4qFNe7zhNROFrzKqcHwShitkQKlMKbjqHAbwXFUfxWWemntlZcugz4HFFsFLhB1n0B
         q2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745779824; x=1746384624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cG6MHc3a2VUtIWj154wVgDP9/hF7FkmZltXaB4/sLdE=;
        b=Rq2/8C2yvpT9EC7Ig4kgrvoBtckBjqEeZUC6JUJPtD0vk5PhZCaJrQMEiRB+IRC8y2
         XA7Hu1VnBTzFyGh/w6k3jmOzKPkorzZ1MNOeVTRn1ayR2hSolyWJe//2RzPCqq7r8j2V
         K5bUNU2ADA3w8B9+iFQw4SnlgUi2ziGHpCLcaLSTUJh8/7lZOEjKzcJaZP93mIXmtg0y
         afzTMxz+BMoxlBrizPHsCbqWCX70Taw8ePT5tKhueEWJF2pTeK7pusXXj3s0xv+82FGg
         dTvJ0h1TLSIyftNyJ5QPtREPX6P022rLSWx0MJ4PMk3maOHW4QQuAHxJM+4zKm4JP/yy
         VBjg==
X-Forwarded-Encrypted: i=1; AJvYcCUwHVzUPoNgYqKEUB4tEYj6U+1Lh2fktVk+pvSX68DSTXxwA5JvYIblfrkHmnhHVexyv4KfGo1I/TMFBw4=@vger.kernel.org, AJvYcCXyZP1IHOcchpzJJCV7oXqN6z6tDjrlwGHOR6AuYlgSmmN6fquPnh2cdP6vAHyhQNwGXvesxEst6Wrqcbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBeorMSCe5FLHcdOagUc3cEmC4vJz8Ki1kHHwodmsavblMnFct
	WCBipInwmaeecFzuiWH8tYadVD6HtAFsCITQ/fEIwBccW8RftYWBoHP95DH8JbeUmQqtlaF3ust
	R1LNKJVznUIpoNcWvLpISecPi9cETcpAZFpk=
X-Gm-Gg: ASbGncsiGfCj9mN8bI70DI2H6qJmSI63GXhoVteRSQmG7iwNmmXtjCBkAr7JM7P/XIr
	/s5RwhPvK5p6TGU3klXXX/1o9lPc5b0KiycYaqoemc3GQ6mdaqqsS5FNzieZ4H5xXAmTBeWkEqT
	QP1Y2LyPjYFJIItlbWf72C3g==
X-Google-Smtp-Source: AGHT+IGXcSryY3fXByf2LyHOw80flv5HrSHJTdGaUoWDDYi8Amodzfn5asdEf4HaqXmAPZ2RrGYYXbwz49KZ88pmefs=
X-Received: by 2002:a17:907:3e95:b0:ac3:ccf7:3a11 with SMTP id
 a640c23a62f3a-ace84a91569mr470061066b.44.1745779823869; Sun, 27 Apr 2025
 11:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75Vef0DuupHr9CAaU9qnDEw6O6KRPaO51uzrKXPwvfAiiJA@mail.gmail.com>
 <20250427142422.88271-1-thomas.andreatta2000@gmail.com>
In-Reply-To: <20250427142422.88271-1-thomas.andreatta2000@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 27 Apr 2025 21:49:46 +0300
X-Gm-Features: ATxdqUEJhliYiQB6aCRYVM7ikC-437G9ygeHb8m6Cgdj6g6vop90rulgwHnUQ4c
Message-ID: <CAHp75Vc_S7XAbHT+2secR1Re1ewkdX1d6YdYSN6UdvsoVkLViw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Staging: media: atomisp: style corrections
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: andy@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	thomas.andreatta2000@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 5:24=E2=80=AFPM Thomas Andreatta
<thomasandreatta2000@gmail.com> wrote:
> On Sun, Apr 27, 2025 at 12:41:34PM +0300, Andy Shevchenko wrote:
> > On Sat, Apr 26, 2025 at 11:15 PM Thomas Andreatta
> > <thomasandreatta2000@gmail.com> wrote:

> > > Corrected consistent spacing around '*' and braces positions
> >
> > Missed period.
> > And what is the correct spacing and why?
>
> I agree that the spacing looks weird and I questioned it too, but the scr=
ipt
> checkpatch.pl highlights as error:
> `sh_css.c:336: ERROR: need consistent spacing around '*' (ctx:WxV)`
> `sh_css.c:338: ERROR: need consistent spacing around '*' (ctx:WxV)`
>
> Should this be ignored because the script tries its best and it becomes c=
ommon
> sense that the suggested spacing is "wrong"?

checkpatch sometimes gives false positives. Need to use common sense.

...

> > >  static unsigned int get_crop_lines_for_bayer_order(const struct
> > > -       ia_css_stream_config *config);
> > > +       ia_css_stream_config * config);
> > >  static unsigned int get_crop_columns_for_bayer_order(const struct
> > > -       ia_css_stream_config *config);
> > > +       ia_css_stream_config * config);
> >
> > No, this makes it the opposite. Please, read Coding Style if it sheds
> > a light on this. In any case the kernel style is to avoid spacing
> > between asterisk and name.
>
> Understood. I'll resubmit with the correct spacing.

Looking again at the above I think the best formatting should be like this:

static unsigned int
get_crop_columns_for_bayer_order(const struct ia_css_stream_config *config)=
;

But looking even closer it seems that these are forward declarations
for the internal functions. The question here is can we rearrange the
functions that we can remove these forward declarations completely?

--=20
With Best Regards,
Andy Shevchenko

