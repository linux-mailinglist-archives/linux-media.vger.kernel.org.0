Return-Path: <linux-media+bounces-787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D0A7F4502
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 12:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D00EB210C5
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1F9584E2;
	Wed, 22 Nov 2023 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2TadWeB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B301BB
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:40:11 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cf5ceadfd8so190655ad.0
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700653211; x=1701258011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Lluk3sxaDufWvRRHog2K6boAXw3L6t6DxADVDkrIhI=;
        b=V2TadWeB3dFTClHliXaf/QTxmNpe00DBBFLjWe9rNTX+1PxBv3ECQZ22Hqf3ojF8Mb
         /oqydbjbLsM8YX5uM/alPM4xrb0QIE/rRwmd6gKqLkkQcdk7QnEw5IFyfy1LdAFNUUDH
         NY3x7a/BDIaRsJgPhdDjTbANsCWSkarfMlgi0TzdTjHrFVivyp0WOHZstJ6422Mf82BE
         WghhsifdXHcKyLi9HpzJMeH7wc62RIJ4b32IokBoycAQbmP6SEhfk573t8xsJzXza5mz
         8LzLIpR0q28/UBRd3TaxOITYiYR4IXssjNQLyr/A9sWesqafX+SnNhODmTRTE9Mlc7L8
         pj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700653211; x=1701258011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Lluk3sxaDufWvRRHog2K6boAXw3L6t6DxADVDkrIhI=;
        b=mJnECH5jglUpcZgubhBw5YNaMtMrndePxFWRqKPicJZpdSMWosEDHr8sun7AqqvTiV
         xZkEUBXDgbRHjG1aIW5YRdHoH095iS4tK4RdEXFErmCJKiQHiAsYtI5Ta22RkakLa5O5
         lUkr8Y5pftYx2aMMjT2Buy7k6+RX71fEcZCPw8rNTeqY+BZ1wt2TgVy31m4BAgz/+Avt
         x7c/An6OMm529llzf3ybIHIsc4611KDJ3regMNG+VosqVFx2wqm4FMlay0I+KaIlM3sp
         t0dtd7UQGpVF3rVCxoEUYk0AmNxm17LlJg33N7G/ikzuy7PyWXW5lBMvxveALHbrgAak
         4MJw==
X-Gm-Message-State: AOJu0YyKbH3pkB3THrn9WVsCqaBYX1ub+mSfik4R3Icyo2TUUMXB549b
	uYiuwJ8aDer9SidNmDCe+kfq1xCXqYOHoWMrhzgraw==
X-Google-Smtp-Source: AGHT+IHJxduaYetIEC6/naZ4h7Q74HCwny7yIKJCmAYpFQsBgE3tvaa7aw/0dNY9WbXigs0npyfK6618r1P9K4U7GnI=
X-Received: by 2002:a17:902:f7c6:b0:1cf:5c9b:bb69 with SMTP id
 h6-20020a170902f7c600b001cf5c9bbb69mr173637plw.11.1700653210859; Wed, 22 Nov
 2023 03:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0000000000003ee3610599d20096@google.com> <0000000000002a1fec060ab0120c@google.com>
 <20231121214541.GB3909@pendragon.ideasonboard.com>
In-Reply-To: <20231121214541.GB3909@pendragon.ideasonboard.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 22 Nov 2023 12:39:58 +0100
Message-ID: <CANp29Y5DNhTA8Oi1B2Kdmog-6tbuSL8mz66P7=dHR0hEgGAZnQ@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>, 
	andreyknvl@google.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for reporting the problem!

Syzbot looked at the last ~1.5 years of commit history to find the
commit, which is almost always enough, but not in this particular
case.

I've filed https://github.com/google/syzkaller/issues/4347 to fix the
syzbot code.

--=20
Aleksandr

On Tue, Nov 21, 2023 at 10:45=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Nov 21, 2023 at 01:13:15PM -0800, syzbot wrote:
> > This bug is marked as fixed by commit:
> > media: uvcvideo: Avoid cyclic entity chains due to malformed USB descri=
ptors
> >
> > But I can't find it in the tested trees[1] for more than 90 days.
> > Is it a correct commit? Please update it by replying:
> >
> > #syz fix: exact-commit-title
>
> What logic does syzbot use to try and find the commit upstream ? There's
> a commit with the exact same subject, what was missing to find it
> automatically ?
>
> > Until then the bug is still considered open and new crashes with
> > the same signature are ignored.
> >
> > Kernel: Linux
> > Dashboard link: https://syzkaller.appspot.com/bug?extid=3D0b0095300dfeb=
8a83dc8
> >
> > ---
> > [1] I expect the commit to be present in:
> >
> > 1. for-kernelci branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> >
> > 2. master branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
> >
> > 3. master branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git
> >
> > 4. main branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> >
> > The full list of 9 trees can be found at
> > https://syzkaller.appspot.com/upstream/repos
>
> --
> Regards,
>
> Laurent Pinchart

