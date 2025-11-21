Return-Path: <linux-media+bounces-47596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DEAC7ADE1
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 17:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51AE9355393
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 16:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DA828851C;
	Fri, 21 Nov 2025 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="C0ooVgC/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B427FD72
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742688; cv=none; b=QOKyP9V6owTA2D2DGDsci60Bg/UT4JCar9f8SlmJuiNGPeduFjYLtjrVkt41pWoRN2Pskdh3c+UtBzsG/7GZE7cFvGzaRm3N7Ru02AmJkd20JWhNsNs1+XqXiY0w7yISlM1dfVE3HRyiPCcgo+IJrniQDtXKHrG7zwXxzZSsIwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742688; c=relaxed/simple;
	bh=6py1dqT8GxLDvJnA5WiGZg/8+Z7X5FMOZ5r/HL6YHZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaABOllnuU1fHyglR1NWVTYPd8gpSVT+kexqXzy502rv2CtCEYlNnqYJzFVeXpIWDhAGgw9o4GoiYRAsMOf+KSGnO3H0f/fAcn4ZwI9YwZynlwcvDnvOp3Csouk4C98Ks2KeBA9lfa0f8u9qsRredoWfQhSaGm4rQ0ryQR5KZVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=C0ooVgC/; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bb2447d11ceso1336955a12.0
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 08:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1763742685; x=1764347485; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fx0DiEnkJFjgul/WUUyf7NbyyaeBwblyjOIh4DCm1HE=;
        b=C0ooVgC/BYMWtXZNbluy3tmBCjy7YXFQzsdZKPEMiJjyZZJL8zZX7JuYy5CZmQPTQe
         rA1/ZZZ4LVbDl6Z5ohD9N7XzZ6xcemqcK8vc8UkvgH0dSl2Zry8ZkCvLKHXTE7So4IKR
         UBNC7uvICE5qIOPhDfghbNMqQv+eUBSgCgvmDBL2nbvM57Sn6YYR4YeaWNgc2PPvJvWa
         FgAUzm9D49hWJn58TMBfj2C6ZE8R0I2sUTzYod1sn6qKKu/fVjbtnYOxZr/ootijfxuH
         Mei1iRoP1AYmIxQfcg7HSfUH8u4S3NjqGVXtmRnd6bJpqT/KXHbblhcaaKtNU2WgNifI
         uKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763742685; x=1764347485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx0DiEnkJFjgul/WUUyf7NbyyaeBwblyjOIh4DCm1HE=;
        b=KcQ7zW0+EsBlkCdpVZek4Q+0ZWpN6fKNFEP/D4pGEo4mVgzBoB5tiAw/HACDwTp36w
         Fu6uWaklqopN1Y7gIido8coI3SVAPCjlMY0UYoXtVCdKe5YdQksvFZTQulRr2gp1Rwdd
         gIeUcoC4I+QkxH/nxfmRyY24GUaRypoFdp5cO6U434bWxQXFMJqp4GNuMTHmtdZhQK/Y
         OabEVf4gn0mEhz4Hb7WJ2vA7fSg+Slwc9NdN5ZinQOmYyedXgnT9PaJpnNKNRWCIQD7q
         buw+iDvTVOrm8GPtbplJakKZd4T0HM+a9TBqJXCRKrnkunG1CgzAd2LjrnsKQ1FxfEuO
         tOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMNAowHZ7y2Lk1UUdB1zJYjvot0/bPbjPK1HPZXcLIgsGL1s6gaSNdLtcCKGbyUhYTmv2AC1P4hicT5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6WRU4zcdhAOzjEIw/t+MOZ0f3p98EGSb+McmyeHSLL4dJBr9w
	1xKtbl6iIGgUoa+GS/BlpORsqQU/ad9SLj6dexHhSs2Kzbrp+0I2Zf2B7SrlW7xUPgkh
X-Gm-Gg: ASbGncuxERFHL6UxBesFef9OtiU5a6IUCaOy4RkHkPxy6WGed04TzHMzhaoI2peJiDz
	RjFLKdrvh/78Tw0ETzLkoo5Qvzft1mhqK4XiivGOr89rRD+tCYFo18OKy3e0rAT5JXyBRqSopRX
	UmpvYgTyrJiGMiIj4NQdMb5JRFOs5RSK0+JPENqRqCqGhppi2SCEpn3yzL3X+WadNencQBpFhB9
	V1AQSgwJ3SV+Pe1oDS+RiyHH9abPbvmSLifPN8tXA/wd0tNxsSCQwA23CerynIaeoU60i/9hapy
	A/+PED2rm3id+i2ZJBln9kgD/uiSdAZcSiWOzPZbJZNABF/9sULO+VBhFulQrdjwWdCEBUQlLJI
	i7Q7Q39QzlVigLRZzOXxQg0HK/CFUsiv3w2HN/dXrvvjL0OWmZh0VBLjfc2Avh5SjlMcVkEh8wK
	GlFHzj9LUSubp3bQ==
X-Google-Smtp-Source: AGHT+IElanE00Dp6OUV4mIIxGsVmOC6pij3YXx0ACP+dY9foi+9GIvLWVBK2u+K86plBPQAIbhA7Og==
X-Received: by 2002:a05:693c:2d92:b0:2a4:3592:c604 with SMTP id 5a478bee46e88-2a71927d865mr1372137eec.21.1763742684078;
        Fri, 21 Nov 2025 08:31:24 -0800 (PST)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm30845966eec.2.2025.11.21.08.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:31:23 -0800 (PST)
Date: Fri, 21 Nov 2025 08:31:20 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, richard.gong@amd.com, anson.tsao@amd.com
Subject: Re: [PATCH v5 0/7] Add AMD ISP4 driver
Message-ID: <aSCT2AuwZeiuP7N9@sultan-box>
References: <d9afc6db-fd8a-4069-a8a8-1e2d74c1db3a@amd.com>
 <aRQyAdyiQjhsC11h@sultan-box>
 <aRQ5aA4Gus4iCVLp@sultan-box>
 <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com>
 <aRwhuNmPRlPGxIia@sultan-box>
 <8288a5b3-6e56-4c9a-a772-99ca36bb7c52@amd.com>
 <aSAg1MUVZtDlCC96@sultan-box>
 <546a8d8e-514b-4f6b-bf46-1ec0c9974e7e@amd.com>
 <aSCHlvWMYEdRb2ey@sultan-box>
 <ccb0a045-fc00-49bc-9441-09d5a0b9aa51@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ccb0a045-fc00-49bc-9441-09d5a0b9aa51@amd.com>

On Fri, Nov 21, 2025 at 09:46:41AM -0600, Mario Limonciello wrote:
>=20
>=20
> On 11/21/2025 9:39 AM, Sultan Alsawaf wrote:
> > On Fri, Nov 21, 2025 at 08:32:34AM -0600, Mario Limonciello wrote:
> > >=20
> > >=20
> > > On 11/21/2025 2:20 AM, Sultan Alsawaf wrote:
> > > > On Wed, Nov 19, 2025 at 06:14:17PM +0800, Du, Bin wrote:
> > > > >=20
> > > > >=20
> > > > > On 11/18/2025 3:35 PM, Sultan Alsawaf wrote:
> > > > > > On Wed, Nov 12, 2025 at 06:21:33PM +0800, Du, Bin wrote:
> > > > > > >=20
> > > > > > >=20
> > > > > > > On 11/12/2025 3:38 PM, Sultan Alsawaf wrote:
> > > > > > > > On Tue, Nov 11, 2025 at 11:06:41PM -0800, Sultan Alsawaf wr=
ote:
> > > > > > > > > On Wed, Nov 12, 2025 at 02:32:51PM +0800, Du, Bin wrote:
> > > > > > > > > > Thanks Sultan for your information.
> > > > > > > > > >=20
> > > > > > > > > > On 11/12/2025 9:21 AM, Sultan Alsawaf wrote:
> > > > > > > > > > > On Tue, Nov 11, 2025 at 03:33:42PM -0800, Sultan Alsa=
waf wrote:
> > > > > > > > > > > > On Tue, Nov 11, 2025 at 05:58:10PM +0800, Du, Bin w=
rote:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > On 11/11/2025 5:05 PM, Sultan Alsawaf wrote:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > > On Mon, Nov 10, 2025 at 05:46:28PM +0800, Du, B=
in wrote:
> > > > > > > > > > > > > > > Thank you, Sultan, for your time, big effort,=
 and constant support.
> > > > > > > > > > > > > > > Apologies for my delayed reply for being occu=
pied a little with other
> > > > > > > > > > > > > > > matters.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > On 11/10/2025 4:33 PM, Sultan Alsawaf wrote:
> > > > > > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > On Wed, Nov 05, 2025 at 01:25:58AM -0800, S=
ultan Alsawaf wrote:
> > > > > > > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > To expedite review, I've attached a patch=
 containing a bunch of fixes I've made
> > > > > > > > > > > > > > > > > on top of v5. Most of my changes should b=
e self-explanatory; feel free to ask
> > > > > > > > > > > > > > > > > further about specific changes if you hav=
e any questions.
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > I haven't had a chance to review all of t=
he v4 -> v5 changes yet, but I figured
> > > > > > > > > > > > > > > > > I should send what I've got so far.
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > FYI, there is a regression in isp4if_dequ=
eue_buffer() where the bufq lock isn't
> > > > > > > > > > > > > > > > > protecting the list_del() anymore. I also=
 checked the compiler output when using
> > > > > > > > > > > > > > > > > guard() versus scoped_guard() in that fun=
ction and there is no difference:
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > >          sha1sum:
> > > > > > > > > > > > > > > > >          5652a0306da22ea741d80a9e03a787d0=
f71758a8  isp4_interface.o // guard()
> > > > > > > > > > > > > > > > >          5652a0306da22ea741d80a9e03a787d0=
f71758a8  isp4_interface.o // scoped_guard()
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > So guard() should be used there again, wh=
ich I've done in my patch.
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > I also have a few questions:
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > 1. Does ISP FW provide a register interfa=
ce to disable the IRQ? If so, it is
> > > > > > > > > > > > > > > > >           faster to use that than using d=
isable_irq_nosync() to disable the IRQ from
> > > > > > > > > > > > > > > > >           the CPU's side.
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > 2. When the IRQ is re-enabled in isp4sd_f=
w_resp_func(), is there anything
> > > > > > > > > > > > > > > > >           beforehand to mask all pending =
interrupts from the ISP so that there isn't a
> > > > > > > > > > > > > > > > >           bunch of stale interrupts firin=
g as soon the IRQ is re-enabled?
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > 3. Is there any risk of deadlock due to t=
he stream kthread racing with the ISP
> > > > > > > > > > > > > > > > >           when the ISP posts a new respon=
se _after_ the kthread determines there are no
> > > > > > > > > > > > > > > > >           more new responses but _before_=
 the enable_irq() in isp4sd_fw_resp_func()?
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > 4. Why are some lines much longer than be=
fore? It seems inconsistent that now
> > > > > > > > > > > > > > > > >           there is a mix of several lines=
 wrapped to 80 cols and many lines going
> > > > > > > > > > > > > > > > >           beyond 80 cols. And there are m=
ultiple places where code is wrapped before
> > > > > > > > > > > > > > > > >           reaching 80 cols even with lots=
 of room left, specifically for cases where it
> > > > > > > > > > > > > > > > >           wouldn't hurt readability to pu=
t more characters onto each line.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > I've attached a new, complete patch of chan=
ges to apply on top of v5. You may
> > > > > > > > > > > > > > > > ignore the incomplete patch from my previou=
s email and use the new one instead.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > I made many changes and also answered quest=
ions 1-3 myself.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > Please apply this on top of v5 and let me k=
now if you have any questions.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > Sure, will review, apply and test your patch =
accordingly. Your contribution
> > > > > > > > > > > > > > > is greatly appreciated, will let you know if =
there is any question or
> > > > > > > > > > > > > > > problem.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > BTW, I noticed a strange regression in v5 e=
ven without any of my changes: every
> > > > > > > > > > > > > > > > time you use cheese after using it one time=
, the video will freeze after 30-60
> > > > > > > > > > > > > > > > seconds with this message printed to dmesg:
> > > > > > > > > > > > > > > >          [ 2032.716559] amd_isp_capture amd=
_isp_capture: -><- fail respid unknown respid(0x30002)
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > And the video never unfreezes. I haven't fo=
und the cause for the regression yet;
> > > > > > > > > > > > > > > > can you try to reproduce it?
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > Really weird, we don't see this issue either =
in dev or QA test. Is it 100%
> > > > > > > > > > > > > > > reproducible and any other fail or err in the=
 log?
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Yes, it's 100% reproducible. There's no other m=
essage in dmesg, only that one.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Sometimes there is a stop stream error when I c=
lose cheese after it froze:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >         [  656.540307] amd_isp_capture amd_isp_=
capture: fail to disable stream
> > > > > > > > > > > > > >         [  657.046633] amd_isp_capture amd_isp_=
capture: fail to stop steam
> > > > > > > > > > > > > >         [  657.047224] amd_isp_capture amd_isp_=
capture: disabling streaming failed (-110)
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > When I revert to v4 I cannot reproduce it at al=
l. It seems to be something in
> > > > > > > > > > > > > > v4 -> v5 that is not fixed by any of my changes.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Hi Sultan, could you please try following modific=
ations on top of v5 to see
> > > > > > > > > > > > > if it helps?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4=
_fw_cmd_resp.h
> > > > > > > > > > > > > b/drivers/media/platform/amd/isp4/isp4_fw_cmd_res=
p.h
> > > > > > > > > > > > > index 39c2265121f9..d571b3873edb 100644
> > > > > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd=
_resp.h
> > > > > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd=
_resp.h
> > > > > > > > > > > > > @@ -97,7 +97,7 @@
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > #define ADDR_SPACE_TYPE_GPU_VA          4
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > -#define FW_MEMORY_POOL_SIZE             (200 * 1=
024 * 1024)
> > > > > > > > > > > > > +#define FW_MEMORY_POOL_SIZE             (100 * 1=
024 * 1024)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > /*
> > > > > > > > > > > > >        * standard ISP mipicsi=3D>isp
> > > > > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4=
_subdev.c
> > > > > > > > > > > > > b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > > > > index 248d10076ae8..acbc80aa709e 100644
> > > > > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_subdev=
=2Ec
> > > > > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_subdev=
=2Ec
> > > > > > > > > > > > > @@ -697,7 +697,7 @@ static int isp4sd_stop_resp_p=
roc_threads(struct
> > > > > > > > > > > > > isp4_subdev *isp_subdev)
> > > > > > > > > > > > >              return 0;
> > > > > > > > > > > > > }
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > -static int isp4sd_pwroff_and_deinit(struct isp4_=
subdev *isp_subdev)
> > > > > > > > > > > > > +static int isp4sd_pwroff_and_deinit(struct isp4_=
subdev *isp_subdev, bool
> > > > > > > > > > > > > irq_enabled)
> > > > > > > > > > > > > {
> > > > > > > > > > > > >              struct isp4sd_sensor_info *sensor_in=
fo =3D &isp_subdev->sensor_info;
> > > > > > > > > > > > >              unsigned int perf_state =3D ISP4SD_P=
ERFORMANCE_STATE_LOW;
> > > > > > > > > > > > > @@ -716,8 +716,9 @@ static int isp4sd_pwroff_and_=
deinit(struct isp4_subdev
> > > > > > > > > > > > > *isp_subdev)
> > > > > > > > > > > > >                      return 0;
> > > > > > > > > > > > >              }
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > -       for (int i =3D 0; i < ISP4SD_MAX_FW_RESP_=
STREAM_NUM; i++)
> > > > > > > > > > > > > -               disable_irq(isp_subdev->irq[i]);
> > > > > > > > > > > > > +       if (irq_enabled)
> > > > > > > > > > > > > +               for (int i =3D 0; i < ISP4SD_MAX_=
FW_RESP_STREAM_NUM; i++)
> > > > > > > > > > > > > +                       disable_irq(isp_subdev->i=
rq[i]);
> > > > > > > > > > > > >=20
> > > > > > > > > > > > >              isp4sd_stop_resp_proc_threads(isp_su=
bdev);
> > > > > > > > > > > > >              dev_dbg(dev, "isp_subdev stop resp p=
roc streads suc");
> > > > > > > > > > > > > @@ -813,7 +814,7 @@ static int isp4sd_pwron_and_i=
nit(struct isp4_subdev
> > > > > > > > > > > > > *isp_subdev)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > >              return 0;
> > > > > > > > > > > > > err_unlock_and_close:
> > > > > > > > > > > > > -       isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > > > > +       isp4sd_pwroff_and_deinit(isp_subdev, fals=
e);
> > > > > > > > > > > > >              return -EINVAL;
> > > > > > > > > > > > > }
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > @@ -985,7 +986,7 @@ static int isp4sd_set_power(s=
truct v4l2_subdev *sd, int
> > > > > > > > > > > > > on)
> > > > > > > > > > > > >              if (on)
> > > > > > > > > > > > >                      return isp4sd_pwron_and_init=
(isp_subdev);
> > > > > > > > > > > > >              else
> > > > > > > > > > > > > -               return isp4sd_pwroff_and_deinit(i=
sp_subdev);
> > > > > > > > > > > > > +               return isp4sd_pwroff_and_deinit(i=
sp_subdev, true);
> > > > > > > > > > > > > }
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > static const struct v4l2_subdev_core_ops isp4sd_c=
ore_ops =3D {
> > > > > > > > > > > >=20
> > > > > > > > > > > > No difference sadly; same symptoms as before. FYI, =
your email client broke the
> > > > > > > > > > > > patch formatting so I couldn't apply it; it hard wr=
apped some lines to 80 cols,
> > > > > > > > > > > > replaced tabs with spaces, and removed leading spac=
es on each context line, so I
> > > > > > > > > > > > had to apply it manually. To confirm I applied it c=
orrectly, here is my diff:
> > > > > > > > > > > >=20
> > > > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_f=
w_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > > > index 39c2265121f9..d571b3873edb 100644
> > > > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_r=
esp.h
> > > > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_r=
esp.h
> > > > > > > > > > > > @@ -97,7 +97,7 @@
> > > > > > > > > > > >       #define ADDR_SPACE_TYPE_GPU_VA          4
> > > > > > > > > > > > -#define FW_MEMORY_POOL_SIZE             (200 * 102=
4 * 1024)
> > > > > > > > > > > > +#define FW_MEMORY_POOL_SIZE             (100 * 102=
4 * 1024)
> > > > > > > > > > > >       /*
> > > > > > > > > > > >        * standard ISP mipicsi=3D>isp
> > > > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_s=
ubdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > > > index 4bd2ebf0f694..500ef0af8a41 100644
> > > > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > > > @@ -669,7 +669,7 @@ static int isp4sd_stop_resp_pro=
c_threads(struct isp4_subdev *isp_subdev)
> > > > > > > > > > > >       	return 0;
> > > > > > > > > > > >       }
> > > > > > > > > > > > -static int isp4sd_pwroff_and_deinit(struct isp4_su=
bdev *isp_subdev)
> > > > > > > > > > > > +static int isp4sd_pwroff_and_deinit(struct isp4_su=
bdev *isp_subdev, bool irq_enabled)
> > > > > > > > > > > >       {
> > > > > > > > > > > >       	struct isp4sd_sensor_info *sensor_info =3D &=
isp_subdev->sensor_info;
> > > > > > > > > > > >       	unsigned int perf_state =3D ISP4SD_PERFORMAN=
CE_STATE_LOW;
> > > > > > > > > > > > @@ -688,8 +688,9 @@ static int isp4sd_pwroff_and_de=
init(struct isp4_subdev *isp_subdev)
> > > > > > > > > > > >       		return 0;
> > > > > > > > > > > >       	}
> > > > > > > > > > > > -	for (int i =3D 0; i < ISP4SD_MAX_FW_RESP_STREAM_N=
UM; i++)
> > > > > > > > > > > > -		disable_irq(isp_subdev->irq[i]);
> > > > > > > > > > > > +	if (irq_enabled)
> > > > > > > > > > > > +		for (int i =3D 0; i < ISP4SD_MAX_FW_RESP_STREAM_=
NUM; i++)
> > > > > > > > > > > > +			disable_irq(isp_subdev->irq[i]);
> > > > > > > > > > > >       	isp4sd_stop_resp_proc_threads(isp_subdev);
> > > > > > > > > > > >       	dev_dbg(dev, "isp_subdev stop resp proc stre=
ads suc");
> > > > > > > > > > > > @@ -785,7 +786,7 @@ static int isp4sd_pwron_and_ini=
t(struct isp4_subdev *isp_subdev)
> > > > > > > > > > > >       	return 0;
> > > > > > > > > > > >       err_unlock_and_close:
> > > > > > > > > > > > -	isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > > > +	isp4sd_pwroff_and_deinit(isp_subdev, false);
> > > > > > > > > > > >       	return -EINVAL;
> > > > > > > > > > > >       }
> > > > > > > > > > > > @@ -957,7 +958,7 @@ static int isp4sd_set_power(str=
uct v4l2_subdev *sd, int on)
> > > > > > > > > > > >       	if (on)
> > > > > > > > > > > >       		return isp4sd_pwron_and_init(isp_subdev);
> > > > > > > > > > > >       	else
> > > > > > > > > > > > -		return isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > > > +		return isp4sd_pwroff_and_deinit(isp_subdev, true=
);
> > > > > > > > > > > >       }
> > > > > > > > > > > >       static const struct v4l2_subdev_core_ops isp4=
sd_core_ops =3D {
> > > > > > > > > > > >=20
> > > > > > > > > > > > > On the other hand, please also add the patch in a=
mdgpu which sets *bo to
> > > > > > > > > > > > > NULL in isp_kernel_buffer_alloc() which you menti=
oned in another thread.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Yep, I have been doing all v5 testing with that pat=
ch applied.
> > > > > > > > > > > >=20
> > > > > > > > > > > > BTW, I have verified the IRQ changes are not the ca=
use for the regression; I
> > > > > > > > > > > > tested with IRQs kept enabled all the time and the =
issue still occurs.
> > > > > > > > > > > >=20
> > > > > > > > > > > > I did observe that ISP stops sending interrupts whe=
n the video stream freezes.
> > > > > > > > > > > > And, if I replicate the bug enough times, it seems =
to permanently break FW until
> > > > > > > > > > > > a full machine reboot. Reloading amd_capture with t=
he v4 driver doesn't recover
> > > > > > > > > > > > the ISP when this happens.
> > > > > > > > > > > >=20
> > > > > > > > > > > > As an improvement to the driver, can we do a hard r=
eset of ISP on driver probe?
> > > > > > > > > > > > I am assuming hardware doesn't need too long to set=
tle after hard reset, maybe
> > > > > > > > > > > > a few hundred milliseconds? This would ensure ISP F=
W is always in a working
> > > > > > > > > > > > state when the driver is loaded.
> > > > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > Actually, each time the camera is activated, the ISP dr=
iver powers on the
> > > > > > > > > > ISP and initiates its firmware from the beginning; when=
 the camera is
> > > > > > > > > > closed, the ISP is powered off..
> > > > > > > > >=20
> > > > > > > > > Hmm, well I am able to put the ISP in a completely unusab=
le state that doesn't
> > > > > > > > > recover when I unload and reload amd_capture. Or maybe it=
 is the sensor that is
> > > > > > > > > stuck in a broken state?
> > > > > > > >=20
> > > > > > > > Here is the log output when I try to start cheese after unl=
oading and reloading
> > > > > > > > amd_capture, where the ISP is in the broken state that requ=
ires rebooting the
> > > > > > > > laptop (annotated with notes of what I saw/did at each poin=
t in time):
> > > > > > > >=20
> > > > > > > > =3D=3D> opened cheese
> > > > > > > > =3D=3D> cheese froze after a few seconds
> > > > > > > > =3D=3D> closed cheese
> > > > > > > >       [   34.570823] amd_isp_capture amd_isp_capture: fail =
to disable stream
> > > > > > > >       [   35.077503] amd_isp_capture amd_isp_capture: fail =
to stop steam
> > > > > > > >       [   35.077525] amd_isp_capture amd_isp_capture: disab=
ling streaming failed (-110)
> > > > > > > > =3D=3D> unloaded amd_capture
> > > > > > > > =3D=3D> loaded amd_capture
> > > > > > > > =3D=3D> opened cheese
> > > > > > > >       [  308.039721] amd_isp_capture amd_isp_capture: ISP C=
CPU FW boot failed
> > > > > > > >       [  308.043961] amd_isp_capture amd_isp_capture: fail =
to start isp_subdev interface
> > > > > > > >       [  308.044188] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044194] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044196] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044197] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044198] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044198] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044199] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044200] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044200] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044201] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.044202] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.065226] amd_isp_capture amd_isp_capture: power=
 up isp fail -22
> > > > > > > >       [  308.174814] amd_isp_capture amd_isp_capture: ISP C=
CPU FW boot failed
> > > > > > > >       [  308.177807] amd_isp_capture amd_isp_capture: fail =
to start isp_subdev interface
> > > > > > > >       [  308.178036] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178043] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178044] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178045] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178046] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178047] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178048] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178048] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178049] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178050] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.178050] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.198776] amd_isp_capture amd_isp_capture: power=
 up isp fail -22
> > > > > > > >       [  308.306835] amd_isp_capture amd_isp_capture: ISP C=
CPU FW boot failed
> > > > > > > >       [  308.311533] amd_isp_capture amd_isp_capture: fail =
to start isp_subdev interface
> > > > > > > >       [  308.311723] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311723] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311724] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311725] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311725] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311726] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311726] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311726] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311727] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311727] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.311727] amd_isp_capture amd_isp_capture: inval=
id mem_info
> > > > > > > >       [  308.335281] amd_isp_capture amd_isp_capture: power=
 up isp fail -22
> > > > > > > >=20
> > > > > > >=20
> > > > > > > Thanks Sultan for the detailed info, I agree with you, tend t=
o believe it
> > > > > > > may related to the sensor, I will follow up with the FW team =
to investigate
> > > > > > > further.
> > > > > > >=20
> > > > > > > > > > > > Thanks,
> > > > > > > > > > > > Sultan
> > > > > > > > > > >=20
> > > > > > > > > > > A small update: I reproduced the issue on v4, but it =
took several more cycles of
> > > > > > > > > > > closing/opening cheese and waiting 30s compared to v5.
> > > > > > > > > > >=20
> > > > > > > > > > > Right now my best guess is that this is a timing issu=
e with respect to FW that
> > > > > > > > > > > was exposed by the v5 changes. v5 introduced slight c=
hanges in code timing, like
> > > > > > > > > > > with the mutex locks getting replaced by spin locks.
> > > > > > > > > > >=20
> > > > > > > > > > > I'll try to insert mdelays to see if I can expose the=
 issue that way on v4.
> > > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > Could you kindly provide the FW used?
> > > > > > > > >=20
> > > > > > > > >       commit a89515d3ff79f12099f7a51b0f4932b881b7720e
> > > > > > > > >       Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > > > > > > >       Date:   Thu Aug 21 15:40:45 2025 -0400
> > > > > > > > >=20
> > > > > > > > >           amdgpu: Update ISP FW for isp v4.1.1
> > > > > > > > >           From internal git commit:
> > > > > > > > >           24557b7326e539183b3bc44cf8e1496c74d383d6
> > > > > > > > >           Signed-off-by: Pratap Nirujogi <pratap.nirujogi=
@amd.com>
> > > > > > > > >=20
> > > > > > > > > Sultan
> > > > > > > >=20
> > > > > > > > Sultan
> > > > > > >=20
> > > > > > > --=20
> > > > > > > Regards,
> > > > > > > Bin
> > > > > > >=20
> > > > > >=20
> > > > > > Thanks, Bin. I looked deeper at the code and didn't find any re=
ason the issue
> > > > > > could be due to the driver. Also, the problem happens outside o=
f cheese for me
> > > > > > (like in Chromium with Zoom meetings), so v5 of the driver is p=
retty much
> > > > > > unusable for me until this issue is fixed. :(
> > > > > >=20
> > > > >=20
> > > > > Oh, really sad to hear that :(, there must be some difference bet=
ween our
> > > > > platforms because we still can't reproduce the issue you mentione=
d, to help
> > > > > on this, would you share more info like your Ubuntu version, Kern=
el
> > > > > version/source, ISP driver version, BIOS version, .config used to=
 build the
> > > > > kernel, FW: commit a89515d3ff79f12099f7a51b0f4932b881b7720e.
> > > > > Just wondering, if possible, could you provide the kernel image e=
ither so we
> > > > > can directly test on it. Also, the HW is not broken, right?
> > > >=20
> > > > I figured out why you cannot reproduce the issue. You need to pass =
amd_iommu=3Doff
> > > > on the kernel command line to trigger the issue.
> > > >=20
> > > > The reason I am using amd_iommu=3Doff is because this laptop otherw=
ise doesn't
> > > > ever wake from suspend under Linux once it reaches the S0i3 state. =
The keyboard,
> > > > power button, and lid do not respond to wake up the laptop from sus=
pend. This
> > > > happens 100% of the time once S0i3 is reached, and occurs on the OE=
M Ubuntu
> > > > image from HP as well. The only fix I have found is to pass amd_iom=
mu=3Doff, which
> > > > other owners of this laptop also found fixes the issue.
> > >=20
> > > You're the first report I've heard of this.
> > >=20
> > > Are you using storage encryption or a storage password of any kind (s=
oftware
> > > or hardware) by chance?
> > >=20
> > > If you are can you please describe it?
> > >=20
> > > Also can you generate a report using amd-s2idle?  I don't think it's =
going
> > > to flag anything but I would like to confirm.
> >=20
> > The issue is mentioned on a Reddit post [1]. A specific comment mentions
> > amd_iommu=3Doff fixing the issue [2], which is where I got the idea to =
do that.
> >=20
> > You will find conflicting reports about this issue online, with some pe=
ople
> > saying it doesn't happen anymore after some kernel update [3], and othe=
rs saying
> > it worked until something updated [4].
> >=20
> > The reason for all the conflicting reports online is because this issue=
 only
> > occurs when S0i3 is reached, and I suspect that no one realized there's=
 a delay
> > before S0i3 is entered. Reaching S0i3 appears to take at least 60 secon=
ds
> > *after* suspending the laptop. If S0i3 isn't entered, then you *can* wa=
ke the
> > laptop but there will always be this message indicating S0i3 wasn't hit:
> >    [  107.428836] amd_pmc AMDI000B:00: Last suspend didn't reach deepes=
t state
> >=20
>=20
> It shouldn't take 60 seconds to enter s0i3.  It should be ~5 seconds. So =
are
> you saying that if you have IOMMU enabled and interrupt the suspend around
> 20 seconds later you get that you didn't reach deepest sleep state, and if
> you wait longer it hangs?
>=20
> > I am using LUKS1 encryption on my storage (software encryption). Howeve=
r, I'm
> > not sure any of my configuration info is relevant because I reproduced =
the issue
> > from a live USB using HP's OEM Ubuntu image [5], with nothing else phys=
ically
> > plugged into the laptop and not connected to anything over WiFi or Blue=
tooth.
>=20
> Is the SSD a SED?  Anything for storage password set in BIOS?
>=20
> >=20
> > I had the thought of generating a report using amd-s2idle a couple mont=
hs ago...
> > except I have no way to wake the machine from suspend at all. I have to=
 hold the
> > the power button to do a hard shutdown. I tried using no_console_suspen=
d but of
> > course userspace processes are frozen so systemd couldn't record anythi=
ng for
> > me. I tried UART over USB and connected the output to another laptop bu=
t it
> > would only work for a few seconds right after booting up the laptop (co=
uld've
> > just been because I was using PL2303 serial converters, which aren't so=
 great).
> >=20
> > I have also tried several different combinations of settings toggled on=
/off in
> > the BIOS setup menu, as well as resetting to the factory default values=
, without
> > any change in behavior.
> >=20
> > I'm at a loss on how I can retrieve some debug info for this issue. :/
>=20
> You are on the latest BIOS presumably, right?
>=20
> If you schedule a suspend with amd-s2idle for ~10 seconds, does it reprod=
uce
> too?

Oh my God, I ran `amd-s2idle test` and got this:

  =E2=9D=8C IOMMU is misconfigured: missing MSFT0201 ACPI device
  [...]
  =F0=9F=9A=AB Your system does not meet s2idle prerequisites!
  =F0=9F=97=A3 Explanations for your system
  =F0=9F=9A=A6 Device MSFT0201 missing from ACPI tables
  The ACPI device MSFT0201 is required for suspend to work when the IOMMU i=
s enabled. Please check your BIOS settings and if configured correctly, rep=
ort a bug to your system vendor.
  For more information on this failure see:https://gitlab.freedesktop.org/d=
rm/amd/-/issues/3738#note_2667140

So then I reenabled Pluton in the BIOS and waking from suspend works now!!!

This had slipped past my test with BIOS settings reset to factory defaults
because the BIOS has a separate button to reset *security settings* to fact=
ory
defaults. And Pluton is one of those security settings.

When I had Pluton disabled, it always took at least 60 seconds to enter S0i=
3,
measured on a stopwatch. Now S0i3 entry takes much less time as you say.

Well, that fixes a bunch of struggles I had with this laptop. :) Thank you!

Also, since I have your attention on S0i3, there is always this warning spl=
at
printed on resume from S0i3, both with and without IOMMU enabled:

  [  366.694362] ------------[ cut here ]------------
  [  366.694367] amdgpu 0000:c3:00.0: SMU uninitialized but power ungate re=
quested for 16!
  [  366.694427] WARNING: CPU: 12 PID: 3122 at drivers/gpu/drm/amd/amdgpu/.=
=2E/pm/swsmu/amdgpu_smu.c:398 smu_dpm_set_power_gate+0x1d7/0x1f0 [amdgpu]
  [  366.694640] Modules linked in: ccm hid_sensor_gyro_3d hid_sensor_prox =
hid_sensor_trigger industrialio_triggered_buffer kfifo_buf hid_sensor_iio_c=
ommon industrialio hid_sensor_hub rfcomm snd_seq_dummy snd_hrtimer snd_seq =
snd_seq_device amd_capture videobuf2_memops videobuf2_v4l2 videobuf2_common=
 videodev mc pinctrl_amdisp i2c_designware_amdisp uhid cmac algif_hash algi=
f_skcipher af_alg bnep uinput nls_iso8859_1 vfat fat snd_acp_legacy_mach jo=
ydev snd_acp_mach mousedev intel_rapl_msr snd_soc_nau8821 snd_hda_scodec_cs=
35l56_spi intel_rapl_common snd_acp3x_rn amdgpu snd_acp70 snd_ctl_led snd_a=
cp_i2s snd_acp_pdm snd_soc_dmic snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_a=
cp63 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_hda_codec_alc269 snd_sof=
_amd_renoir snd_hda_scodec_component snd_sof_amd_acp snd_sof_pci snd_hda_co=
dec_realtek_lib snd_sof_xtensa_dsp snd_hda_codec_generic snd_sof snd_sof_ut=
ils snd_pci_ps snd_soc_acpi_amd_match snd_amd_sdw_acpi soundwire_amd soundw=
ire_generic_allocation mt7925e soundwire_bus
  [  366.694715]  snd_hda_codec_atihdmi mt7925_common snd_soc_sdca snd_hda_=
codec_hdmi mt792x_lib snd_soc_core mt76_connac_lib snd_compress drm_panel_b=
acklight_quirks amdxcp btusb ac97_bus drm_buddy snd_hda_intel mt76 snd_pcm_=
dmaengine btrtl drm_exec snd_rpl_pci_acp6x drm_suballoc_helper snd_hda_code=
c btintel drm_ttm_helper btbcm mac80211 snd_hda_scodec_cs35l56_i2c snd_acp_=
pci snd_hda_core ttm btmtk ucsi_acpi snd_hda_scodec_cs35l56 snd_amd_acpi_ma=
ch libarc4 snd_intel_dspcfg snd_hda_cirrus_scodec i2c_algo_bit typec_ucsi s=
nd_acp_legacy_common spd5118 snd_intel_sdw_acpi bluetooth drm_display_helpe=
r snd_soc_cs35l56_shared snd_pci_acp6x snd_hwdep snd_soc_cs_amp_lib typec h=
p_wmi cfg80211 cs_dsp cec kvm_amd snd_pci_acp5x snd_pcm hid_multitouch ecdh=
_generic roles sp5100_tco sparse_keymap wmi_bmof amd_pmf kvm snd_timer snd_=
rn_pci_acp3x i2c_hid_acpi snd_acp_config video amdtee serial_multi_instanti=
ate i2c_hid irqbypass i2c_piix4 snd snd_soc_acpi amdxdna snd_pci_acp3x soun=
dcore amd_sfh platform_profile wmi i2c_smbus rfkill
  [  366.694807]  wireless_hotkey thunderbolt amd_pmc gpu_sched rapl mac_hi=
d i2c_dev sg crypto_user loop nfnetlink ip_tables x_tables dm_crypt encrypt=
ed_keys trusted asn1_encoder tee dm_mod polyval_clmulni ghash_clmulni_intel=
 aesni_intel nvme nvme_core serio_raw nvme_keyring ccp nvme_auth
  [  366.694840] CPU: 12 UID: 0 PID: 3122 Comm: kworker/u129:47 Tainted: G =
       W           6.17.7 #1 PREEMPT=20
  [  366.694846] Tainted: [W]=3DWARN
  [  366.694848] Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile Workst=
ation PC/8D01, BIOS X89 Ver. 01.03.02 06/18/2025
  [  366.694852] Workqueue: async async_run_entry_fn
  [  366.694867] RIP: 0010:smu_dpm_set_power_gate+0x1d7/0x1f0 [amdgpu]
  [  366.694974] Code: 85 ed 75 03 48 8b 2f 89 74 24 04 e8 f3 85 da cb 44 8=
b 44 24 04 48 89 d9 48 89 ea 48 89 c6 48 c7 c7 48 80 fc c1 e8 c9 0d 63 cb <=
0f> 0b b8 a1 ff ff ff e9 a1 fe ff ff e9 3b b3 3b 00 e9 36 b3 3b 00
  [  366.694977] RSP: 0018:ffff8fad27387ce8 EFLAGS: 00010246
  [  366.694981] RAX: 0000000000000000 RBX: ffffffffc2006846 RCX: 000000000=
0000027
  [  366.694984] RDX: ffff8fcbde51abc8 RSI: 0000000000000001 RDI: ffff8fcbd=
e51abc0
  [  366.694985] RBP: ffff8fad016afc80 R08: 0000000000000000 R09: 00000000f=
fffdfff
  [  366.694986] R10: ffffffff8e6d5da0 R11: ffff8fad27387b88 R12: ffff8fad2=
5a80000
  [  366.694987] R13: ffff8fad25a96680 R14: 0000000000000001 R15: ffffffffc=
1e7ce80
  [  366.694989] FS:  0000000000000000(0000) GS:ffff8fcc4fe73000(0000) knlG=
S:0000000000000000
  [  366.694990] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [  366.694992] CR2: 00007f58f6956408 CR3: 0000000116015000 CR4: 000000000=
0f50ef0
  [  366.694993] PKRU: 55555554
  [  366.694995] Call Trace:
  [  366.695003]  <TASK>
  [  366.695007]  amdgpu_dpm_set_powergating_by_smu+0xf1/0x110 [amdgpu]
  [  366.695136]  _genpd_power_on+0x83/0x120
  [  366.695149]  genpd_sync_power_on.part.0+0x66/0xc0
  [  366.695154]  genpd_finish_resume+0x6f/0xd0
  [  366.695157]  ? genpd_thaw_noirq+0x10/0x10
  [  366.695159]  dpm_run_callback.isra.0+0x28/0x90
  [  366.695166]  device_resume_noirq+0xc7/0x210
  [  366.695169]  async_resume_noirq+0x1c/0x30
  [  366.695171]  async_run_entry_fn+0x1f/0xa0
  [  366.695175]  process_one_work+0x173/0x270
  [  366.695183]  worker_thread+0x2d7/0x410
  [  366.695188]  ? rescuer_thread+0x4e0/0x4e0
  [  366.695191]  kthread+0xe6/0x1e0
  [  366.695196]  ? kthread_queue_delayed_work+0x80/0x80
  [  366.695199]  ? kthread_queue_delayed_work+0x80/0x80
  [  366.695202]  ret_from_fork+0xf0/0x110
  [  366.695211]  ? kthread_queue_delayed_work+0x80/0x80
  [  366.695214]  ? kthread_queue_delayed_work+0x80/0x80
  [  366.695217]  ret_from_fork_asm+0x11/0x20
  [  366.695224]  </TASK>
  [  366.695225] ---[ end trace 0000000000000000 ]---


> >=20
> > [1] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/hp_zbook_ultra=
_g1a_ubuntu_fully_working_now_or/
> > [2] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/comment/nd4cld=
p/
> > [3] https://forum.level1techs.com/t/the-ultimate-arch-secureboot-guide-=
for-ryzen-ai-max-ft-hp-g1a-128gb-8060s-monster-laptop/230652#hibernate-susp=
end-and-kernel-versions-16
> > [4] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/comment/nd1xbt=
d/
> > [5] https://ftp.hp.com/pub/softpaq/sp158501-159000/stella-noble-oem-24.=
04b-20250422-107.iso
> >=20
> > Sultan
>=20

Sultan

