Return-Path: <linux-media+bounces-43832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74EBC10C9
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 12:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 905B918911A3
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8872B2D8789;
	Tue,  7 Oct 2025 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7Gj59T+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FC0230BCC
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759834269; cv=none; b=qd6nyeeUz5SJfFpYsmxb9J83tdv5ytXRb5dNICi4DieqOufANCqbfjoWz8l03Bp1Clai5wJEUxIpc5+N9wjipYLGNXE8HQWv7G4uXJdmZyrgf+HzML68QXDo7DXKEKHQC1v00Z269Za1JaoUFauNZGqSs4wltTCZnL73lLbs7J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759834269; c=relaxed/simple;
	bh=WMFv49FTR7J4KezskKA/pfZcpNRMZ+fIXAc0O75aC00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRDkeAAtB5Zr4X8LVZaBcbCOkGgcbI7XxUSJkqjbT+RuP4i4I5IbzO36t2APc11ejiMiAF6McEwGyF8PnPcWIWSE56rG6Vdr6qh2BMnSPJz6lYB89fonsG8nvdjW3QsBZ+cAb/5eUP8dYnwIi3g1OssLMVrSiDN0D209zJeSdBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7Gj59T+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-782bfd0a977so5272416b3a.3
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759834266; x=1760439066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTEKwB63KRhEq/DGo0zhOnst1wucWk4g1/MdUkIfUWc=;
        b=V7Gj59T+nHDkPK8EN+G/Lpa74bhPApX0Cjyf8UPHOiBbQ/2EXwifdLzsRP05MeXRo7
         Fnf3C6k2o3vjCjxVxYyIWV//eoHZviUu/htxkQ8BXXk6bfMUpucNJzTNq+TAj/6Xy3jn
         BQmAyFGsBlXa+o//s8rIgQYo2IWicJ6WzYmBfj61k0hFypd9kR1nGDiWi6emVfIaDtCG
         9SALg3ZoNvqT127I0ymWagHzdQosJ8gpeTHfngYK/H9EyNwRSod0x++o+mbIOkgCeuav
         XRKd/Y+U+yWY7WYlo4qZ0WxcRboZCISgSgouW8PAJBliIiVvsXXxBBYVuRGgmQYoG4lg
         wADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759834266; x=1760439066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTEKwB63KRhEq/DGo0zhOnst1wucWk4g1/MdUkIfUWc=;
        b=CQSSlo/8AqYU0V3BmyOmJ5acZdeD4bd7zpgv3yAynXRBap9ZPsZOr70OYueffY6gvZ
         NhsAPYkIpwgtMW6UTM9BKtwsMzmUTmKBBwzmtHEIFVo9PVbBobyhbquK89hdfusoSpw7
         JBbkyqbkyIkzJRRolGRmhyDAy9GlxrgQZio49AjT1icjPNeNehekhvzciqUAacgBL9uf
         2x+C2h28LFI3QofvFrlZJXSX2lLThBAKTLFR1LQ0G9CKGg84Qm19sP3m6JUX5kh2hXzR
         KK0yxHcEAs5+rEkptaXCQXXsAJiXdwXYYEoUOFlasfTtrFYp0g1NSZOEUrnjVRLF46m7
         +6UA==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZkjcxYF7FLc23lKet8/gxot73KLsn0RPKrXXvz4SRUuog0/HVVgmbSz02c1DD95G2T3DOFeJ1ORhHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPPsenxrTKfVnmZr3njNcuNJWXtF+IsEUUdWD86FmXjHHGssDa
	5KI58dypr224o3Lqziefm45oEUbWYtEVPzrxc2ncfcjHeQxsjyUCGOwFOx9PFhFZS8vf88sew4N
	k397jjH8OtAS5G1JLPwVMge3HLZcEfKE=
X-Gm-Gg: ASbGnct8GtyUBfMrsxtikZocqouDhsiY1BlJfJwOQ6zHLZG0EC+0kIFMRy7AiXhK1N+
	9oyP6jfSds2m75oc+t13iZVC3MeV9jEAVpF8n/DB/aURoUs+4zZu/05OL9wdPKPPsTdqx3lrMA6
	Y38p1A4LEuRmvX72j1MyrVgm6rszxd5V5ly3JZDAskVtDcmzpeCGfS+d7sp8HtHB7fnjDz38KRw
	jpCF1Yhjeohp/E46i+E6U6YOWIJf/e6eFNBvVHkS5gulJi5f4hiJt32fHpHdIZaTJg1/BmFjf1Y
	lfepzAl/b/2aN4x3ZQ==
X-Google-Smtp-Source: AGHT+IFom2dGM5sld/4yLOXQtA5IRjQEqmpbg1uF0gPNwQKLwyidJ91yICqTHTAgatieRNiOiiAV4Ie6v1Giq+OAEmk=
X-Received: by 2002:a05:6a20:3941:b0:2fe:d5:4e80 with SMTP id
 adf61e73a8af0-32b620b181dmr23563053637.37.1759834265653; Tue, 07 Oct 2025
 03:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913105252.26886-1-opensource206@gmail.com>
 <CAKPKb882DgYB2fZXRDU_y1Xqz6GtFEErvzzET9eOAm=db0ns1g@mail.gmail.com> <873C85C5-2BCB-4631-BA18-919CE448A7CE@collabora.com>
In-Reply-To: <873C85C5-2BCB-4631-BA18-919CE448A7CE@collabora.com>
From: opensource india <opensource206@gmail.com>
Date: Tue, 7 Oct 2025 16:20:54 +0530
X-Gm-Features: AS18NWBJt0wWIycj1rLQ12Ilg09Ig2SzbOfgvj4F0Tkn2zxjoJ_mGhprGTgEd2c
Message-ID: <CAKPKb88VHwGp-iLMa=zZy3Czq8S8wUd9Zzkicvd4er9OiLg6UQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: v4l2-ctrls: add full AV1 profile validation in validate_av1_sequence()
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, ribalda@chromium.org, 
	laurent.pinchart@ideasonboard.com, yunkec@google.com, 
	sakari.ailus@linux.intel.com, james.cowgill@blaize.com, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2025 at 2:27=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi, I=E2=80=99ll review this in the coming weeks.

Hi Daneil, did you get a chance to review this?

> > On 27 Sep 2025, at 06:51, opensource india <opensource206@gmail.com> wr=
ote:
> >
> > On Sat, Sep 13, 2025 at 4:23=E2=80=AFPM Pavan Bobba <opensource206@gmai=
l.com> wrote:
> >>
> >> Complete the "TODO: PROFILES" by enforcing profile-specific and
> >> monochrome constraints as defined by the AV1 specification
> >> (Section 5.5.2, "Color config syntax").
> >>
> >> The validator now checks:
> >>
> >> - Flags: reject any unknown bits set in sequence->flags
> >> - Profile range: only profiles 0..2 are valid
> >> - Profile 0: 8/10-bit only, subsampling must be 4:2:0 (sx=3D1, sy=3D1)=
,
> >>   monochrome allowed
> >> - Profile 1: 8/10-bit only, subsampling must be 4:4:4 (sx=3D0, sy=3D0)=
,
> >>   monochrome forbidden
> >> - Profile 2:
> >>    * 8/10-bit: only 4:2:2 allowed (sx=3D1, sy=3D0)
> >>    * 12-bit: 4:4:4 (sx=3D0, sy=3D0), 4:2:2 (sx=3D1, sy=3D0), or 4:2:0 =
(sx=3D1, sy=3D1)
> >>      allowed
> >> - Monochrome path (all profiles except 1): forces subsampling_x=3D1,
> >>   subsampling_y=3D1, separate_uv_delta_q=3D0
> >>
> >> These checks prevent userspace from providing invalid AV1 sequence
> >> headers that would otherwise be accepted, leading to undefined driver
> >> or hardware behavior.
>
> Mauro,
>
> A reminder that I have been warning about this for quite a while [0], whi=
ch
> includes mentioning that patches like this, although welcome, do not solv=
e the
> root issue completely.
>
> I keep working on what I believe to be the solution [1][2]. I would appre=
ciate if
> we could restart this discussion.
>
> [0]: https://lwn.net/Articles/970565/
> [1]: https://lore.kernel.org/linux-media/20250818-v4l2-v1-0-6887e772aac2@=
collabora.com/
> [2]: https://lwn.net/Articles/963966/
>

