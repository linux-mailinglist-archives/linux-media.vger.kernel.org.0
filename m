Return-Path: <linux-media+bounces-22387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC629DF1FE
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 17:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCF6A281583
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 16:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD691A0BFD;
	Sat, 30 Nov 2024 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NtEtkTYy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1931E884
	for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732984424; cv=none; b=ryg+NuHGgmOc7/o+1VMgX6HcCct59mLM6Qy+ltSQhltI7vEQfI49cswRc7XxXv75w1UN6vOHpaipOYSx4WOfbcoUysch53Il0lxY0M/uYgE5f54jk6wgd9hmMvMtVHgczfHJUWapDSBPCvS23vYPpBWs8T4/v/vKtO005PCg5jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732984424; c=relaxed/simple;
	bh=By/KKrb1K5ZZ6MykfSGMEk7BNFbgx30ZD8C4jEZ+dlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STsBJJlfQIqSwhf9EiN0QUfDO5+SBnipWA+JalJGtPKS5Ze7p/IRb2rQPs0ik9ocm/sNPt1xcYDtPuUV9f+ZQb51fCARvtQjCiz1AgTlFYozs59USRntQ3EfbA2gQ346ag1vjlwATg3XzyQwkH6/Dq9gWJN9b2EuluRxOJiEyJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NtEtkTYy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7252b7326f4so2446837b3a.2
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 08:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732984421; x=1733589221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdLbKGX5nJEtwzgIbPzQLbGOc73ZlKkd2neK2K/meyk=;
        b=NtEtkTYyW2SCPLuGim7U8hQbvwFfP1QB2KHM+oBX3GewMK6iRlqu/QdOb1Q+X2yTXl
         EVwhdiMtIyHg5q7WfK0o+9IYHIbpAGNA6ne2NO0iHAIfllS/Yq19nUfTvR1ZCe8Gt2eS
         tgN/jCkLSgf+OP8odO+hP7oU1RSoq+d14MwVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732984421; x=1733589221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdLbKGX5nJEtwzgIbPzQLbGOc73ZlKkd2neK2K/meyk=;
        b=VKKXAEal3QXO7jrkrq+RvKqatUPGkfs6GtO2AAnyVZWcMGAvYrg2m4n9p5i344RSHm
         qhyR/obCe9KbN07vOo/BZp8zEqqpcJz0n55o4ki7A5vxfku0OKprXNAAGgdi/5m5cvBH
         ocBkPJjBXS3PsgBc6c0KYdezz+5UutAhH5Kk3+joKM9Nzt//Q0ckRTYUAFSntOeYbKH9
         HHlzsoxEk0vjz+KHWQakNTU5vp945ZPyVxqR9H2PGlRvXnCRBlwyZ8JJzKTlz8HBYt4o
         XV0a3wPZQzUqpIAGwC/4aaJPGM065yZqitkB5C2AVQecLtaXn47O87K36OdLqTK2OJKc
         mINg==
X-Forwarded-Encrypted: i=1; AJvYcCVNten0la+peO6H+Q5twFkMMENTQOEt/HIdEEV+8WPW7dHBFSPSAHotwKKx1e32ykNOTRPkbpnUZqAxGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPbC5fl+EHYZI72825K9ErA0TYlg8OQ+qv/zmCiIcS7O1ol4RF
	37WfUPcJ+0uHlYzsI5UfBX1mDgO4fOykZT0SvqAH+e69DVXsI8ZHAFDvH68nGcs/mWLlzlJUuYw
	=
X-Gm-Gg: ASbGnctAQvwZZH9Zmv7oACl+PVm7v60k4puiy4y6VthfnmLO0fkLxzu3gh7R52Tj/Jy
	WIeRkBU3tV1LKf1Ndu6iCvKtNiln7HHQn9S/A51zUcrB8LSP9Bd5jhHdDczQBNUIGmTnyHCgkPp
	QnOX6E4GLAEx8zI7LdI1U06sN7jfx3xQZu0ELDwWqQoYcrFv3hFqZCA/IKFmSW6pnn6HAA9WhOa
	VqOey6boYqapR6CH4GfL9aetnYfjiIDpmmGs3UOqu3so2dVGDweZLT70RCKsqL2CtS9V0X4P6BU
	PXpXqy3e5n/B
X-Google-Smtp-Source: AGHT+IH9l4yc6qJhr/gZ3ful94859HkQ3m2U5M54NH3ZermI0mzLPSs44Oif8PWpvJjbUd92APZ3Zw==
X-Received: by 2002:a05:6a00:3a1c:b0:71e:14c:8d31 with SMTP id d2e1a72fcca58-7253013e41dmr19152650b3a.16.1732984420970;
        Sat, 30 Nov 2024 08:33:40 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c39f36asm4916731a12.72.2024.11.30.08.33.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 08:33:39 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso323673a91.1
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 08:33:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVV3D+reYMkionm5FeGMJiFj2D5qgL5IH7cjtTfIPRoz1kogJ5OMEFlcy81CUH0RlK5kXy0+MZqTr2RpA==@vger.kernel.org
X-Received: by 2002:a17:90b:3d8f:b0:2ee:5bc9:75c7 with SMTP id
 98e67ed59e1d1-2ee5bc97923mr8849284a91.5.1732984418489; Sat, 30 Nov 2024
 08:33:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1732872169.git.mchehab+huawei@kernel.org>
 <99e1b9df713827ce2e6c21073276c97030071a07.1732872169.git.mchehab+huawei@kernel.org>
 <CAPybu_2O9GVNCroLoFPGgrhs_UB97p6ng1dHgtVwbGhyr9LruA@mail.gmail.com> <20241130134221.5629bf57@foz.lan>
In-Reply-To: <20241130134221.5629bf57@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 30 Nov 2024 17:33:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCt1=7TT8VN86V5w05gG3-m7MmQMxyBcKPSa-42f9kiVgw@mail.gmail.com>
Message-ID: <CANiDSCt1=7TT8VN86V5w05gG3-m7MmQMxyBcKPSa-42f9kiVgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: media: update maintainer-entry-profile for multi-committers
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 30 Nov 2024 at 13:42, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 29 Nov 2024 16:09:41 +0100
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> escreveu:
>
> > Thanks for putting this together.
> >
> > I have marked some minor nits here and there. You can put my
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Thanks!
>
> > The only thing that is not a nit: is changing responsible with
> > contributor. But if we agree on the meaning (and I think that we do)
> > we can always improve this doc later.
>
> See the comments below with regards to your nits.
>
> > On Fri, Nov 29, 2024 at 12:15=E2=80=AFPM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
>
> > > +In the media subsystem, there are experienced developers who can pus=
h
> > > +patches directly to the development tree. These developers are calle=
d
> > > +Media committers and are divided into the following categories:
> > > +
> > > +- Committers: responsible for one or more drivers within the media s=
ubsystem.
> > > +  They can push changes to the tree that do not affect the core or A=
BI.
> >
> > Can we say contributor instead of responsible? For me responsible
> > means maintainer.
>
> Works for me.
>
> > I would like to land patches that have been properly reviewed to the
> > committers tree for areas that I do not maintiain:
> >
> > For example:
> > - Laurent has reviewed a uvc patch that I want to land asap to avoid
> > conflicts with other patchsets that I am working with.
> > - I want to land a patch for a ci breakage that has been reviewed by
> > another person, it is trivial, and none has a bad comment about it.
> > - I want to land a fix for a driver that has been properly reviewed by
> > the maintainer and none has a bad comment about it.
>
> Makes sense. Yet, for the first example you would need to coordinate
> with the uvc maintainers to avoid conflicts at the trees they would
> be using.

Sure, coordination with the maintainer is expected.

>
> > > +Media development workflow
> > > +++++++++++++++++++++++++++
> > > +
> > > +All changes for the media subsystem must be sent first as e-mails to=
 the
> > > +media mailing list, following the process documented at
> > > +Documentation/process/index.rst.
> > > +
> > > +It means that patches shall be submitted as plain text only via e-ma=
il to:
> > > +
> > > +  `https://subspace.kernel.org/vger.kernel.org.html <linux-media@vge=
r.kernel.org>`_
> >
> > nit: Maybe this is a better url? https://lore.kernel.org/linux-media/
>
> As this is focused on upcoming contributors, placing the place that conta=
ins
> the subscription link sounds better to me. There, it has links for
> subscribe, unsubscribe, post and archive (which already links to lore).
>
> IMO, works better for newbies.
>
> > > +
> > > +Emails with HTML will be automatically rejected by the mail server.
> > > +
> > > +It could be wise to also copy the media committer(s). You should use
> > nit: How does someone know who the committers are? I think sending to
> > the ML and to ./get_maintainers.pl is enough
>
> Yes, but that's what it is written...
> >
> >
> > > +``scripts/get_maintainers.pl`` to identify whom else needs to be cop=
ied.
>
> here ^
>
> > > +Please always copy driver's authors and maintainers.
> > > +
> > > +Such patches need to be based against a public branch or tag as foll=
ows:
> > > +
> > > +1. Patches for new features need to be based at the ``next`` branch =
of
> > > +   media.git tree;
> > > +
> > > +2. Fixes against an already released kernel should preferably be aga=
inst
> > > +   the latest released Kernel. If they require a previously-applied
> > > +   change at media.git tree, they need to be against its ``fixes`` b=
ranch.
> >
> > 2. Fixes against an already released kernel should preferably be agains=
t
> >    the ``fixes`` branch of the media.git tree;
>
> The better is to have such fixes against the latest released one, as
> this would mean that such patch will apply cleanly at least at the
> latest -stable.

They will apply cleanly to the latest stable, but not to our tree.
I prefer that the author to fix the conflict in coordination with the
stable team than us. If they do not respond in good time, we can step
in.

>
> Usually, conflicts are unlikely on such cases, but, when they happen,
> committers can easily solve it.
>
> As stable will be copied on both versions, that hopefully make their
> work easier, as they can just use the version without conflicts.
>
> As a notice, usually stable people doesn't solve conflicts, if they
> have a high number of patches: they send-emails requesting us and/or
> the author to do it.
>
> > > +3. Fixes for issues not present at the latest released kernel should
> > > +   preferably be against the latest -rc1 Kernel. If they require a
> > > +   previously-applied change at media.git tree, they need to be agai=
nst
> > > +   its ``fixes`` branch.
> >
> > Can we get rid of this third type? It is a bit confusing.  My mental mo=
del is:
> > - Things for the next kernel version: next
> > - Things for this kernel version: fixes
> >
> > We will make sure to close the next tree when needed, and that fixes
> > and next are upreved accordingly.
>
> Not all people reporting patches to us will be doing against the
> media tree for stuff that are on upstream. That's perfectly fine.
> Also, it is an usual practice to have patches against -rc kernels.
> This is specially true for developers working on distros: they just
> test Linus -rc during their rolling release kernels.
>
> See, for instance:
>         https://bodhi.fedoraproject.org/updates/?packages=3Dkernel
>
> So, we need to be prepared to receive patches aiming an upcoming
> release on the top of a -rc release.
>
> Maybe we can tell, instead:
>
> 3. Fixes for issues not present at the latest released kernel shall
>    be either against a -rc kernel for an upcoming release or
>    against the ``fixes`` branch of the media.git tree.
>
> That's said, it is uncommon to have conflicts there, but sometimes
> they happen.
>
> When they happen, they're trivial enough for the committers to
> handle it.

What about. Assuming Linus would have released 6.13.rc1 today

1) New features (that will land in 6.14) =3D> media.git/next

2) Fixes for 6.13.rcX =3D> media.git/fixes

3) Fixes for <=3D 6.12  =3D>  media.git/fixes . If the patch conflicts in
stable, the author will send the patches

Only 1) can be done by committers.
2) and 3) are coordinated via You and Hans.

Note that if we make the fixes branch up to date with the latest rc,
it will make everyone's life easier. Do you see many conflicts when
you uprev it?

If you like this approach I can help with the wording. If you do not
like it, we can discuss it later and add a follow-up patch.

Also I think that providing an example will make the description more
clear... but that could be me :)

>
> > > +Once a patch is submitted, it may follow either one of the following
> > > +workflows:
> > > +
> > > +a. Pull request workflow: patches are handled by subsystem maintaine=
rs::
> > > +
> > > +     +------+   +---------+   +-------+   +-----------------------+ =
  +---------+
> > > +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-=
->|media.git|
> > > +     +------+   |picks it |   |request|   |in media-committers.git| =
  +---------+
> > > +                +---------+   +-------+   +-----------------------+
> > > +
> > > +   For this workflow, pull requests can be generated by a committer,
> > > +   a previous committer, subsystem maintainers or by a couple of tru=
sted
> >
> > I guess you mean a trusted long-time contributor, not a couple.
> > can you send a PR from two people?
>
> "a couple of" means "a few", not "a couple" ;-)
>
> but yeah, "a trusted long-time contributor" works better.

nit: for this workflow, pull requests can be generated by a committer:
subsystem maintainers or trusted long-time contributors.

(previous committers already belong to  long-time contributors)
I could even suggest removing the word trusted. Whatever you prefer.

>
> >
> > > +   long-time contributors. If you are not in such group, please don'=
t submit
> > > +   pull requests, as they will likely be ignored.
> > s/be ignored/not processed/.
> >
> > Sounds a bit better :).
>
> Agreed.
>
> > Maybe you could even say: not processed, and the author notified.
>
> You meant changing it to:
>
>         please don't submit pull requests, as they will
>         not be processed, and the author notified.
>
> right? What do you mean by "and the author notified"?
> "and the author will not be notified"?

they will not be processed, and the author will be notified.

>
> > > +b. Committers' workflow: patches are handled by media committers::
> > > +
> > > +     +------+   +---------+   +--------------------+   +-----------+=
   +---------+
> > > +     |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|=
-->|media.git|
> > > +     +------+   |picks it |   |media-committers.git|   |approval   |=
   +---------+
> > > +                +---------+   +--------------------+   +-----------+
> > > +
> > > +On both workflows, all patches shall be properly reviewed at
> > > +linux-media@vger.kernel.org before being merged at media-committers.=
git.
> > > +
> > > +When patches are picked by patchwork and when merged at media-commit=
ters,
> > > +CI bots will check for errors and may provide e-mail feedback about
> > > +patch problems. When this happens, the patch submitter must fix them
> > > +and send another version of the patch.
> >
> > must fix them, or explain why the errors are false positives.
>
> Ok.
>
> Thanks,
> Mauro

Thanks :)



--=20
Ricardo Ribalda

