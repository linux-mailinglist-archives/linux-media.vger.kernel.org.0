Return-Path: <linux-media+bounces-29280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E769A79BC2
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 08:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4A1170120
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 06:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FBD19F421;
	Thu,  3 Apr 2025 06:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwjBgjq4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457C746E;
	Thu,  3 Apr 2025 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660459; cv=none; b=NeKSEXk4nci6GTNNePgWqTrKRQiQSsCkgVfr+MinS9ORVf/aDqgWaq+1Hkj8kiER0diHELBA3O6w1QVcJwezPFHxxfkGoS1Zi/a/z4oppgwU7vOgdB7VqZaw7ykwJZCLGmFPMnFxYApMRmg21GS74KKxiBXe2UFWCBXnJU+XPMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660459; c=relaxed/simple;
	bh=XZfW8Qfq7tJ+JELoDYv5ETSuD7d87c5jDCiqNfZKaQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoLb/pUcPxXBy1pFIwFZ0z1U7d8DIUEZVpZR9uHQh821V2rH+L8mTOnTU9AvQliyDLeLHB9LPS15fW3Hd4g4BswdmRcsxKYCK5c0+XOE015AQV7Rbbi98a57hyetY9AfSeDWoXrrlolDh/6ZDDhFyiWV1EsMdbbVxnTe1FR3vro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwjBgjq4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac25d2b2354so85997566b.1;
        Wed, 02 Apr 2025 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743660456; x=1744265256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y1chSLTgq4by+/iKzl7cqrc4OIVMXRZ18Ndod/oVA4=;
        b=EwjBgjq4WnT7bRLdrAq34LMP6NOa+mM9xuFpW1UUtwZq+cptRrc7fTLcKQwLcMNmK1
         pr7L8OSzIfSgNn1yYkeS23CGsYgiWxtiD9AFhr6GWm69/7k7IvjMhLkGWu29S0ouDLJb
         //RfBTTIgoTO8YjyZnqZQaaE/ChKJzlUHNmVK3HsLN87CYZuLN0ib1xgDcmI4tnh/egg
         NfJNK0m6dznUNSeLUSBlDMfjG5gO7zQx3njt6jcziKP3oGPW9IdewEEc6rhAaEgWGa/D
         XHCX416Tfxz6tHyIN27zXbgEmAJh+h/MvJM38sdEItU1IAw7aOwaofeDSCGLT792rpwp
         DDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743660456; x=1744265256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y1chSLTgq4by+/iKzl7cqrc4OIVMXRZ18Ndod/oVA4=;
        b=NeR8CL6IIMeiYDA+xMacLSOBbk9upweqlZ8C73abQHzm7OotErwk+A0RnNDKPPYOJn
         ouD61zBueBDKyMGx5sRrvdW+FQum95laklfsgmfXmCXq/X71MKVqVNfOMMw5I8L44AtL
         Oqr3YJh+2KM1qXsiBP9GA38b4AVpaxo2cKypgirxQ8Yve8+3eXD/7o9F3LtCW6XeKrX9
         FlmuwOQVxOe6ZjO+wqY/V1VDxYDCc91tenspTsHBKldbeKwoRNl9oJQj6VXbbdztcpLs
         DD3uWvrI3E/WeBfodzlqh0wlJzxikhxLOUS871K9HmZeh2EQnso0VgTqKOqAy9Yy/6sv
         SNRA==
X-Forwarded-Encrypted: i=1; AJvYcCUL1Nutt0G8G2ROoNb3fhW1b3Mo27rBxzbT/A3fJ5+UfGom6Q83N5SoKU8GC5eH6wygZf2KKUwTGyjdnUM=@vger.kernel.org, AJvYcCXWbQUcDDL2jONNlQKkoP8uWNHW6qJfaT2YaYPVDhiWKcfxeIuApnHz0D5ML+gBjoq5exQH0KQW6XapiBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Viq9DcppeoknBShucuBfonP3FTrnI0sMYaRRCUQjM6hEUsWN
	e6jKgYH2ZkLySuxzaV2C099n+NmS3yLzamK0zaCIplh5LZEIfIGVewm8I5UrIaUSnHpop3+ge1j
	2ro+Bgs2ED0HpAGwQE693muMDRRM=
X-Gm-Gg: ASbGncss5OxpNVzHbWOHjSOUyBasYJyDDBKTIUeqJQ4BldT/GAguvOoMAwrqvpMEDFZ
	f1OFxlT+YSaTqB20MeJDCFJrGlAKRBQpHqm6nIRnxkfZrPBs9jPXZUpAGGA7MPTrbRmnrvthtsv
	DOM9UZqeRR4LmNSTRTgaAc3ghvr8u1cDAyki8=
X-Google-Smtp-Source: AGHT+IEf6my0Oevy7HxSEvSBLIVZB6UUtRLQAMtnvT9ULs0ZmHL4HufuJOz3Xwan6rPv7/6qdLH2tQeyB4bomKzEbiI=
X-Received: by 2002:a17:906:7955:b0:ac1:e00c:a566 with SMTP id
 a640c23a62f3a-ac738bbe6e9mr1868178566b.45.1743660456051; Wed, 02 Apr 2025
 23:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com> <20250310-eccentric-wonderful-puffin-ddbb26@houat>
 <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com> <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
In-Reply-To: <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 3 Apr 2025 16:07:24 +1000
X-Gm-Features: AQ5f1JqIs6baj7zESBDpkv7pR6DzQLKEPOII2QRNAbnnHufJyGkPQs5rKDbOWPQ
Message-ID: <CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Apr 2025 at 21:03, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 31.03.25 um 22:43 schrieb Dave Airlie:
> > On Tue, 11 Mar 2025 at 00:26, Maxime Ripard <mripard@kernel.org> wrote:
> >> Hi,
> >>
> >> On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian K=C3=B6nig wrote:
> >>> [Adding Ben since we are currently in the middle of a discussion
> >>> regarding exactly that problem]
> >>>
> >>> Just for my understanding before I deep dive into the code: This uses
> >>> a separate dmem cgroup and does not account against memcg, don't it?
> >> Yes. The main rationale being that it doesn't always make sense to
> >> register against memcg: a lot of devices are going to allocate from
> >> dedicated chunks of memory that are either carved out from the main
> >> memory allocator, or not under Linux supervision at all.
> >>
> >> And if there's no way to make it consistent across drivers, it's not t=
he
> >> right tool.
> >>
> > While I agree on that, if a user can cause a device driver to allocate
> > memory that is also memory that memcg accounts, then we have to
> > interface with memcg to account that memory.
>
> This assumes that memcg should be in control of device driver allocated m=
emory. Which in some cases is intentionally not done.
>
> E.g. a server application which allocates buffers on behalves of clients =
gets a nice deny of service problem if we suddenly start to account those b=
uffers.

Yes we definitely need the ability to transfer an allocation between
cgroups for this case.

>
> That was one of the reasons why my OOM killer improvement patches never l=
anded (e.g. you could trivially kill X/Wayland or systemd with that).
>
> > The pathological case would be a single application wanting to use 90%
> > of RAM for device allocations, freeing it all, then using 90% of RAM
> > for normal usage. How to create a policy that would allow that with
> > dmem and memcg is difficult, since if you say you can do 90% on both
> > then the user can easily OOM the system.
>
> Yeah, completely agree.
>
> That's why the GTT size limit we already have per device and the global 5=
0% TTM limit doesn't work as expected. People also didn't liked those limit=
s and because of that we even have flags to circumvent them, see AMDGPU_GEM=
_CREATE_PREEMPTIBLE and  TTM_TT_FLAG_EXTERNAL.
>
> Another problem is when and to which process we account things when evict=
ion happens? For example process A wants to use VRAM that process B current=
ly occupies. In this case we would give both processes a mix of VRAM and sy=
stem memory, but how do we account that?
>
> If we account to process B then it can be that process A fails because of=
 process Bs memcg limit. This creates a situation which is absolutely not t=
raceable for a system administrator.
>
> But process A never asked for system memory in the first place, so we can=
't account the memory to it either or otherwise we make the process respons=
ible for things it didn't do.
>
> There are good argument for all solutions and there are a couple of block=
s which rule out one solution or another for a certain use case. To summari=
ze I think the whole situation is a complete mess.
>
> Maybe there is not this one solution and we need to make it somehow confi=
gurable?

My feeling is that we can't solve the VRAM eviction problem super
effectively, but it's also probably not going to be a major common
case, I don't think we should double account memcg/dmem just in case
we have to evict all of a users dmem at some point, maybe if there was
some kind of soft memcg limit we could add as an accounting but not
enforced overhead it might be useful to track evictions, but yes we
can't have A allocating memory causing B to fall over because we evict
memory into it's memcg space and it fails to allocate the next time it
tries, or having A fail in that case.

For the UMA GPU case where there is no device memory or eviction
problem, perhaps a configurable option to just say account memory in
memcg for all allocations done by this process, and state yes you can
work around it with allocation servers or whatever but the behaviour
for well behaved things is at least somewhat defined.

Dave.

