Return-Path: <linux-media+bounces-48970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE308CC6A48
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 09:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA0023010FC0
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4391333ADB2;
	Wed, 17 Dec 2025 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QV9sp9wF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FB93191D2
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765961081; cv=none; b=PWHeQ3Me0IuvRBziGZ8B25DDoDltlI9xhveag2zEfC8+SJkt22+uh2aPJGLC9GaE5ivkCVu+k0NLa5pIjPIENIzJMgLpHuIO8Cg8drp2U6SLBUYO50u9YA36Cco0w7wdtSIURus6iRfK7xikd8da3hHQaN2LCdN3rv1NAs23GI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765961081; c=relaxed/simple;
	bh=1Jr7xX3Sbp15Z+kohZTOOD6OZW3uCpERg2ETOxedQdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uo4yAVDfvkIifRNervt/kDpe8nJohHHtRPVAivsy1ZqYXDT7QMqkAWH+t5AofxCgLg/8znl/3w/cCTkc348ZLdiHpRBFR/bc6xIMprKz/Z4bpxfTS9nAGX/YjRCIX/2+QNJmpbMRwgYdaRM2PCtG/efvUD5PxnGO4EpY++OXGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QV9sp9wF; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b5c81bd953so618362285a.1
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 00:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765961078; x=1766565878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Jr7xX3Sbp15Z+kohZTOOD6OZW3uCpERg2ETOxedQdY=;
        b=QV9sp9wFg7o4lKJjw7JkuDhmgQyZVS/0R1OZN9dQh1E01O5KuNJBgogYa/oLLfoTgL
         n75CMoxiaQnnm3WgEROI92KK4A1cHon6pYRHlld2mDtLrYUfJDn5BwNC3DtXhedBow9g
         R+7FzlfckBrMAsp4rxA4oKS7varNC1maHj5vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765961078; x=1766565878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Jr7xX3Sbp15Z+kohZTOOD6OZW3uCpERg2ETOxedQdY=;
        b=SSisnbZP+3ZYWsfBKgpQRocg+s2JkCtcnUEcc+rTkogs1vfg10FeAK8sKnWncrA69a
         h+9aUWDzWgRX0hNIVlOX4hWIn7maVWQFVmpub2texywg5u4yQP4cxMFQBNd4aQqP1Hfx
         btfVTiA5asRmtH6eqwmnVbMt9PqXKtP1vzs31AWWKdwsDeBe5VPuSqF6yIUYHkP01LpS
         mIyvnt1K8e4oN3KtfajjC8E8v52xkFil1GDihQKmwi/tIQ/BrmqObhm1prf++mt9Ad0w
         fT0/VphxQhts8+pFurbSwZi/8jR7GTgklAZmao7QaSYBMSTloBlCSm1gSBccFtHV9Bud
         mcXA==
X-Forwarded-Encrypted: i=1; AJvYcCWI79uNKYS8Jv6BNHDissBLfF1O6X57UIqsRUdoGIgP6mi5ghMgk1MAcIjxed2gCGV+QMdDl3HdO5FrGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSiqEDgfplivHuzRnIKCkpKf/rdMaAjpoE0AGnncjR02qP1oae
	DoBOM8FDk2kB2e+U+M7HoyLwTNzWRdIFEEOeSgpLQsYHV+cWGuoohmk+rew3K9hfIrBwGDMQuxj
	nB0+z4A==
X-Gm-Gg: AY/fxX5qGud/djDB8cl19U9g9tcfCpuFxaRn+TLsakSiVlA6mCwMqxdD8S6U2hc2p7E
	e8n0lHuHP6CNwriak+8s5D4/l6CwcnYGkgNUtW6dRjddZZy/hLOVMmjVl04CU4OvlCbQ4bGTIO5
	Z4qbc7KV7B2wxjXHCssy5Mo7niHjXlNfOK5Q95+HYuKlfhRirCWiYxG2iDQULhivGQggZyXiElj
	LjzRJdFS/s4yFZqWLAa5sYkSFaE0nZZU/M1SnL9pX6tz7cnS21nVOkWy7cUnywAWbCQhdHS6sYt
	ECQTJBnY8yyLLvURwD8wX1/9DOAQqM9XXRKM+8RPEC/yubhY/eUZY7kkcT3e/hPHdOFxT1OBrzn
	dPeKe4cUDoEaP5MlS8IsUBVqIHzQJ1gGD5GrxrkMcjPI+T9axp1iA6QsWv/bFgcOIN6wpqAd1rD
	2GGkfJk9LJchrZvsMwq8YP+YQGAekOGSKdi+lOq3G8QOXn6EbSvw==
X-Google-Smtp-Source: AGHT+IExZ9c0FyG2r8jgFzcTpuCQnIXOO7K/3lJmSbMfNmNpaNks9rRezblmUY2C6Pxu8NSRqpJO0w==
X-Received: by 2002:a05:620a:828b:b0:8bb:a346:8c89 with SMTP id af79cd13be357-8bba3468e96mr1345843385a.56.1765961078299;
        Wed, 17 Dec 2025 00:44:38 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-889a85eaac7sm89318136d6.45.2025.12.17.00.44.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 00:44:36 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee243b98caso245351cf.1
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 00:44:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJCSPfDp4fiNVIxF0RZt50jFsSeNHe8ZjpDbDsqeJrt4wtiLWjSISSULHmF2wub3qAdkaJxXEfSpVlXw==@vger.kernel.org
X-Received: by 2002:ac8:59d2:0:b0:4f1:83e4:73be with SMTP id
 d75a77b69052e-4f3546aae97mr6217211cf.15.1765961076220; Wed, 17 Dec 2025
 00:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
 <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org> <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
 <CAO5uPHPKLxySgwWUi6w0Nm-PbDSPkN=OySbLK8wNKwXdp3p1Rg@mail.gmail.com> <e265d412260226be67df3bfb0dd05bb74e36d551.camel@ndufresne.ca>
In-Reply-To: <e265d412260226be67df3bfb0dd05bb74e36d551.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 17 Dec 2025 17:44:18 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AWD7UL-pvJoWWh1j7Z-qKzfu7RANygc=saqK-+fX0PjA@mail.gmail.com>
X-Gm-Features: AQt7F2pb8397KhFynPkOLg3wQfcK2zLr2hZyBW1GK-ZPi1yr1x5SDTCrsV0yzSk
Message-ID: <CAAFQd5AWD7UL-pvJoWWh1j7Z-qKzfu7RANygc=saqK-+fX0PjA@mail.gmail.com>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Hirokazu Honda <hiroh@chromium.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,


On Tue, Dec 16, 2025 at 5:56=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi Hirokazu, Hans,
>
> Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 15:15 -0800, Hirokazu Honda a =
=C3=A9crit :
> > Thanks Hans for your quick response.
> > And I apologize for my late reply.
> >
> > > So that's were I am: I'm not opposed to supporting this feature, but =
I
> > > feel that struct v4l2_buffer has reached end-of-life, and that it is
> > > time for a modern replacement.
> >
> > I got it.
> > I will discuss in my team if I can contribute to v4l2_buffer_ext work
> > or sponsor that work next year or in 2027.
>
> I share Hans feeling in regard to trying to force partial support for
> data_offset into some space left of v4l2_buffer. This brought me thinking=
 that
> doing that, or even v4l2_buffer_ext as last proposed was not the right so=
lution
> to modernize the old V4L2 framework. In fact, I believe that v4l2_buffer_=
ext
> would simply replicate the MPLANE disaster, leaving another permanent sca=
r in
> the API. Just to state simply, MPLANE have lead to duplication of every m=
ulti-
> plane pixel formats, solving some plane alignment issue in multi-allocati=
on
> cases, but leaving behind the common single allocation case.
>
> For me, the most central issue in V4L2 is that the memory allocation/impo=
rtation
> is bound to the operation queues. That brings all sort of issues such
>
> - We can't queue twice the same frame
> - We can't mix external buffer with device allocated buffer
> - All buffers must have the exact same stride
> - Application is responsible for caching which memory goes to which v4l2_=
buffer
> - Attempting to import a buffer requires a free spot in the queue
>
> This adds on top of the v4l2_buffer structure limitation we have been tar=
geting
> so far. With the growth of modern standard API (think Vulkan Video notabl=
y), it
> becomes apparent that the model is too inflexible. This inability to sepa=
rate
> memory allocation and importation from operations creates a lot of comple=
xity in
> user-space, leading to complicated bugs.

I more than agree with that.

>
> I've been quite about it, since until now I didn't have a solution in min=
d, but
> I recently come with some ideas. I'll will try develop these ideas, at le=
ast in
> prose for now and come up with an RFC, hopefully somewhere beginning of J=
anuary
> 2026. That my proposal is accepted or not isn't quite relevant. But hopef=
ully it
> will be a starter to go go beyond just fixing what we see. In fact, this =
next
> step is for me doing to be quite decisive if I continue doing codecs in V=
4L2 or
> not in the long run. But I'm sure this is not just about video codecs.

Looking forward to it. Thanks a lot for looking into it!

Best,
Tomasz

