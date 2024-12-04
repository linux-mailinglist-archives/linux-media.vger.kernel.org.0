Return-Path: <linux-media+bounces-22616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE59E3B61
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1874B39B4D
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C291CEADA;
	Wed,  4 Dec 2024 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmqS0heq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1371BAED6;
	Wed,  4 Dec 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733318422; cv=none; b=D+sRtSxNdSzQlCCXsDhoez4ili+pLy3+j/bjLHbNaTNYl2plmmiebBhqQalXsVFh6dQagWUZGzyDYNx/7B5PyoLkoFLM4JQpx/EVo4QH3Gm9hsh7yHjNdYAGBeg42ZAmBc5iaOAEEK05y/++4DNf+aIUY1+c6gDthLjL6oTsjSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733318422; c=relaxed/simple;
	bh=K6QgkrCW9p4a5nV9AQL6NCsWLRReMfGSEo1wLC6V9dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFAhNTXwNQyMucOPwGkOMMjsev+2pIhymsOwsypd41kP9BkFojoZ8hHm3kBUjpkq9XZcUcZFN4tL5xnWJYuxFFt2W5znyvhG5OoMGGTruiG9+lNChyfMOpDsUBIYnBhHp0s84uNQv+t1yc5xgMbh/pqjXbNZPfitA4TR13riPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmqS0heq; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6648e25e3so361210885a.2;
        Wed, 04 Dec 2024 05:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733318419; x=1733923219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhybzS6XmwGoo1Mv8T/GZCRWnnv9rmIzvBCr8dzxC3E=;
        b=kmqS0heqf/cYxeRANrLU0k3oeISZKPkl/EQvrRFe673ZuBoSUXrd9AL5YUj/K/y8B4
         +b756Dfq9yMGGaCYg2YBgM1pqQwo5Gi8q2ogjOu3LP3nflEro5ceKqn/MGbCFGuiQG2D
         wuaaPFPIopfg/vlPU56QpVNZd3M/rX2pM8uF3j4MIJz1zOMZ4PSe3VXP6VgRNIsrTLZ5
         DRDWxb9Mc1wYOBDch96vrVkRtpdse7aJ17liy3rCMh64Mf3OUYRb9wC5kjRQR6kiodsP
         aZgBKKoUPjAHH9uKOhxl+nsbKZ2JX9snyqGoBiMXex0wXi0FazdkPPEEQ+lR7zxnEh3S
         lm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733318419; x=1733923219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhybzS6XmwGoo1Mv8T/GZCRWnnv9rmIzvBCr8dzxC3E=;
        b=OpusvoBVXS2GlKJDsjS8WuBJ5DGrRz5VC9ZOqz++8YCaXMbjEopcPSH8jvEeujKpuy
         3zGmtWLoz2R2TpfM+JK5gq+NNgvS3yYzvSTOlOzonB9pRxmbOmvPpTjRaETW5DH/MqgR
         u82neNwOsFh1dR0smq7I8xARLkRZzAf0TIS3YQCeynx0VIOqHtZWktytuysggHUy2Sjo
         NtoaomxVbnO1HkWuJ74LCZ71Vh4MKOGnGaejlNImp3lDz9FN5yqGLfhXppQSlKPtWZk0
         0bhH4/jZo1UI9xG12sQiMeS7eRStbCdz5SWiU8Id9EJUYFG6aVoJy9qXp3IAgDuijH42
         4+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUfYyikfPj84tYg5SpwprA7B6KucwF9HNWgmloJb0F7urIBNXrUua20Fq4e3A+OdOyG82+fLoiRPOaCZaM=@vger.kernel.org, AJvYcCX/9d1h523Hvf+OwL4ChEjIleRYwQrxlr2FfCrxhh2B4fzFQEZsmQUNUbtRaHceSZsZQMz29G6avsvkJe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPKBNisvU5WmDwGBTW5W0obKZiqXtjbs6215gAjN65Ih4Spgx
	FwocsYhusTNqa4g1TreA72TRCDEL4SE3I36NGs2yB/Wb6/d6WQ+LQMnross5k53UPCIHC/JNboP
	4EFF1AiTWNsLPk9a+dvX6gFQxyNo=
X-Gm-Gg: ASbGncsAywhS0O2BsVzHS/6QlpsCfMcYZGJxiUBEs1EwxnWEjsbR3UWgxywe1Uc/oje
	5VDnL1C9iaQAWLH8QcticbFakjfUQd6d9hdnt1TMGl3Kd1jydGbbu4vc0pn9bIA==
X-Google-Smtp-Source: AGHT+IF6dDkypmXQvYc9+7y43bamRzr2Y1zTcUH87cj5STyjJHOiNCE/ZtVpAjLhyAjlxd7XA7e4dZisukIv4dHbJhQ=
X-Received: by 2002:a05:620a:4898:b0:7b1:43e2:712b with SMTP id
 af79cd13be357-7b6a5d2ae0fmr749900385a.11.1733318419279; Wed, 04 Dec 2024
 05:20:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
 <f74d32eba4c1799fe7fd407a3889a3de91fb09f2.1733218348.git.mchehab+huawei@kernel.org>
 <57ed2ba7-ebe8-433f-bb52-914a020ca468@xs4all.nl> <20241204135127.7b295c19@foz.lan>
In-Reply-To: <20241204135127.7b295c19@foz.lan>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 4 Dec 2024 14:20:03 +0100
Message-ID: <CAPybu_1QjvP-Lc+7DHm8WWR+pb761HgYxSCj9+K_8D_-cWp5jg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] docs: media: profile: make it clearer about
 maintainership duties
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 2:16=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Wed, 4 Dec 2024 13:11:45 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>
> > On 12/3/24 10:35, Mauro Carvalho Chehab wrote:
> > > During the review of the media committer's profile, it was noticed
> > > that the responsibility for timely review patches was not clear:
> > > such review is expected that all developers listed at MAINTAINERS
> > > with the "M:" tag (e.g. "maintainers" on its broad sense).
> > >
> > > This is orthogonal of being a media committer or not. Such duty
> > > is implied at:
> > >
> > >     Documentation/admin-guide/reporting-issues.rst
> > >
> > > and at the MAINTAINERS header, when it says that even when the
> > > status is "odd fixes", the patches will flow in.
> > >
> > > So, let make it explicit at the maintainer-entry-profile that
> > > maintainers need to do timely reviews.
> > >
> > > Also, while right now our focus is on granting committer rights to
> > > maintainers, the media-committer model may evolve in the future to
> > > accept other committers that don't have such duties.
> > >
> > > So, make it clear at the media-committer.rst that the duties
> > > related to reviewing patches from others are for the drivers
> > > they are maintainers as well.
> > >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  Documentation/driver-api/media/maintainer-entry-profile.rst | 5 ++++=
+
> > >  Documentation/driver-api/media/media-committer.rst          | 6 +++-=
--
> > >  2 files changed, 8 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.=
rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > index fa28059f7b3f..87b71f89b1df 100644
> > > --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > @@ -173,6 +173,11 @@ b. Committers' workflow: patches are handled by =
media committers::
> > >  On both workflows, all patches shall be properly reviewed at
> > >  linux-media@vger.kernel.org (LMML) before being merged at media-comm=
itters.git.
> > >
> > > +Such patches will be reviewed timely by the maintainers and reviewer=
s as
> > > +listed in the MAINTAINERS file. The subsystem maintainers will follo=
w one of
> > > +the above workflows, e. g. they will either send a pull request or m=
erge
> > > +patches directly at the media-committers tree.
> > > +
> > >  When patches are picked by patchwork and when merged at media-commit=
ters,
> > >  CI bots will check for errors and may provide e-mail feedback about
> > >  patch problems. When this happens, the patch submitter must fix them=
, or
> > > diff --git a/Documentation/driver-api/media/media-committer.rst b/Doc=
umentation/driver-api/media/media-committer.rst
> > > index 3d0987a8a93b..0bc038a0fdcc 100644
> > > --- a/Documentation/driver-api/media/media-committer.rst
> > > +++ b/Documentation/driver-api/media/media-committer.rst
> > > @@ -90,9 +90,9 @@ be a part of their maintenance tasks.
> > >  Due to that, to become a committer or a core committer, a consensus =
between
> > >  all subsystem maintainers is required, as they all need to trust a d=
eveloper
> > >  well enough to be delegated the responsibility to maintain part of t=
he code
> > > -and to properly review patches from third parties, in a timely manne=
r and
> > > -keeping the status of the reviewed code at https://patchwork.linuxtv=
.org
> > > -updated.
> > > +and to properly review patches from third parties for the drivers th=
at they
> > > +maintain in a timely manner and keeping the status of the patches at
> > > +https://patchwork.linuxtv.org updated.
> > >
> > >  .. Note::
> > >
> >
> > Looks OK to me, but I thought this was supposed to be folded into the 3=
/5 and 4/5 patches?
>
> I'll fold it once you and Ricardo gives the same review/Sob as marked on =
3/5 and 4/5.
>
>
> Thanks,
> Mauro
>


--=20
Ricardo Ribalda

