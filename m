Return-Path: <linux-media+bounces-26755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D19DA4156D
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 07:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2493717335D
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 06:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5AC1DFD89;
	Mon, 24 Feb 2025 06:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PBEqBgS3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900DF1D8A12
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740378872; cv=none; b=jPFMiYrkQkTD5mtfpPY+li4vGlzmJUhjzOpU/nOsGfhbqYl3nPPW1a76PN7RG5LoHlrGUjhXPu2JeJMCRWiSUz/+djlSq+S4T6m9fS1dwpiZ9KAGuuUlrKQzFnKNA51klqy9Mdx5R3lzqWPAOIDgOGvNiYGHJDyTBbjqsjPOr28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740378872; c=relaxed/simple;
	bh=fQDRfw3EhrfUd3Fny4Nab7kzxfYkmF1PMtyrdiyxXes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/O1z/uyFfEU7hSjehLsixiQmYkl5LAlW+lqZhinEK8HQEnCIl3nK9uR7JHJ7dIGIcTYuqhTCPj/uLCVXq82kf/bV8bDLzDSWAFORAyqTxNs0qlarINqcwmEdlgb+HJmm5xLuuJnanHxLWvEOs7Kb6fGwn4SjGDpY9g4vwf8h4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PBEqBgS3; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30a69c1a8d3so12198781fa.3
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 22:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740378868; x=1740983668; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDmIbBVBrmOqaPqtm3OIVdTs+1YkPggGmmD9ociAVJQ=;
        b=PBEqBgS3YR41UqftH4NkXcKxWKThvVldMJUUckucV8R5jFl8z9Ib/PROfOljIeZE47
         XMaH7wGtwY2fCfhSutNBjtLMKu6HnzKLE9IpJgBVlFIC2Od7DIhx4522fOA4xw7zwLA6
         KIziMosLwMCAoqbHCxQI1zpbuq5sUtkfHIB9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740378868; x=1740983668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDmIbBVBrmOqaPqtm3OIVdTs+1YkPggGmmD9ociAVJQ=;
        b=qAj0nnSMHla6zNxK1+CZxxip+QD8kFeF2DGoWhZuWk7CHe+7mCRMIvRamameXwcl7w
         8sGtXNcW6sm5IFh57+l8BsAWkYJMhb3aagPtmf8+AtzoEFm/ep4LZgp2b2ShC20d8Xmy
         fmp69HikMq64cXvfZ3YMQ9tHX1kQyS4cIoFwDO2QTt0hZuHC8jok0UVDXzj6/SIHfcLm
         AoJc+mlLq8pneRZ1IUBzE8IvbNSoY3X7XhOY0hC3iOAZLFi/7Sp+b5N49YjxUsAMzsyv
         GojjlqSMGcGzkvTyr4ePnFbLk9noKfKu0A1YxxOIU+enm4sl8oz+YScoSjsz0k2EVhRj
         kEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkxf3JtQkmeZARbSOewMZ6cj0G7UfpkASneq68clbYKMsts/YOKr0a6HQRKjfb8Tnt59xvABjrZDTarw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylNyOy5T0HDA5QeSmwGdL1SMQ4sGW+RG1iGgOcGzVL8a3AUTV/
	QPtAiYZ9iJoMTbfCVyUBlyAyt47kv+DxmKWwDImM00xmebbP+CuxLROo9jIudBANf2Zwu9x+4XG
	XYw==
X-Gm-Gg: ASbGncs8Pe6pmcrGB0rPgzaolmodj5q3cNfuEI1lFuGp6uVvlpXGbdq/X9itnoIrDTN
	mVs86zk8ey0T0buZcWiKhymskpKcL9e9drsixYuwEw5lD1tJ52wpbWXsxRsExEXvuF3XYZq0xmS
	G5yoL6bV8BJsi46zvsExrliOaQbzBvO2Y7wQ4iMoRFXSz12O9Qj2D4HcxLAI74jmc01lx8OjC5W
	U5f+8Q4CEC+MPaJOvLi1B9APKgo35Sh/ASM39PC+sjSeQD+NIvddMnTCNg38o40PPCrsE8xMvXQ
	K0ZfQI6vAwhXNKYRl+G3ckS1XR2OMsJ3iz+2RfRPy0A1G7duDqyu+Co6+yQJCdJH
X-Google-Smtp-Source: AGHT+IF/818YVfqc873EVnPn1wOefE0OchN0IcbqW7VFRzKxDRaNTT8+u4hazAv+sgDAVsxFVjRXxA==
X-Received: by 2002:a2e:83d0:0:b0:309:2627:8adc with SMTP id 38308e7fff4ca-30a5985d8ebmr33408681fa.8.1740378868493;
        Sun, 23 Feb 2025 22:34:28 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2a9190f7sm25018771fa.19.2025.02.23.22.34.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 22:34:22 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-545fed4642aso3988077e87.0
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 22:34:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvU+wrk89dRdFeX62FRsgmbZYMtYbHckNMkmoixrlwKPSlD+SB3AlRJejABua0LgSTKY1adSoszcA9fw==@vger.kernel.org
X-Received: by 2002:a05:6512:3ca5:b0:545:2ee6:84a8 with SMTP id
 2adb3069b0e04-54838ee76c0mr4652920e87.14.1740378861858; Sun, 23 Feb 2025
 22:34:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
 <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org> <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
 <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl> <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
 <2025022426-lilly-next-72e0@gregkh>
In-Reply-To: <2025022426-lilly-next-72e0@gregkh>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 07:34:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCvr5Fz2CE7Vx5gk_r=JFHwpT-w=7GGgZ-MN8FkjQyp+yA@mail.gmail.com>
X-Gm-Features: AWEUYZneujeUqRzowTHsCuBd_481VOXalvBfDTLy1Zv-JKeySU-2ECz97LHUiDc
Message-ID: <CANiDSCvr5Fz2CE7Vx5gk_r=JFHwpT-w=7GGgZ-MN8FkjQyp+yA@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
To: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, sashal@kernel.or
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2025 at 06:52, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Feb 23, 2025 at 07:34:30PM +0100, Ricardo Ribalda wrote:
> > On Fri, 21 Feb 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > >
> > > On 21/02/2025 10:04, Hans Verkuil wrote:
> > > > Hi Ricardo,
> > > >
> > > > On 21/01/2025 22:14, Ricardo Ribalda wrote:
> > > >> When we obtain a reference to of a platform_device, we need to release
> > > >> it via put_device.
> > > >>
> > > >> Found by cocci:
> > > >> ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > > >> ./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > > >> ./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > > >> ./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > > >
> > > > This driver uses this construct:
> > > >
> > > >                 struct device *ece_dev __free(put_device) = &ece_pdev->dev;
> > > >
> > > > to automatically call put_device. So this patch would 'put' the device twice.
> > > >
> > > > Does cocci understand constructs like this? If I hadn't looked closely at the
> > > > code first, I would just have merged it.
> > >
> > > Oh wait, now that I am reading the following patches I see that it was those later
> > > patches that add the __free code.
> > >
> > > This is far too confusing. Please post a v2 that just combines the 'fix references'
> > > and 'use cleanup.h macros' in a single patch. It makes no sense to have this two-phase
> > > approach.
> >
> > I believe this is discouraged.
> >
> > cleanup.h macros does not exist in old kernel versions, so makes it
> > impossible to backport the fix to them.
>
> That's not a problem, fix things properly in the main tree and let the
> stable/lts kernels work it out on their own.
>
> > This is an example of other series following this policy:
> > https://lore.kernel.org/lkml/173608125422.1253657.3732758016133408588.stgit@devnote2/
> >
> > They also mention the same here:
> > https://hackerbikepacker.com/kernel-auto-cleanup-1 .... I am pretty
> > sure that I read the policy in a more official location... but I
> > cannot find it right now :)
>
> No, it is NOT official policy at all.  Otherwise you would be saying
> that no one could use these new functions for 6 years just because of
> really old kernels still living around somewhere.  That's not how kernel
> development works, thankfully.

No, I am not saying that we cannot use cleanup.h for 6 years.

What I am saying is that first we fix the errors without it, and then
we move to cleanup.h. All in the same series:
1/2 Fix reference handling (cc: stable)
2/2 Use cleanup.h

That way the fix (1/2) can be applied without changes to all the
stable trees, and 2/2 can be ignored by them.

The alternative is a patch that cannot be applied to stable and either
you, the author or the maintainer have to backport to stable
(basically implementing 1/2).  So no, we do not save work by just
posting a cleanup.h version of the fix to the mailing list.

The even better alternative is that cleanup.h is backported to all the
stable trees.


Anyway, it is up to you and Sasha to decide. I will repost the series
only using cleanup.h

Best regards!


>
> thanks,
>
> greg k-h



-- 
Ricardo Ribalda

