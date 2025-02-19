Return-Path: <linux-media+bounces-26367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEFA3BFBE
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB603169A12
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8738E1E25EF;
	Wed, 19 Feb 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="GEdv5sNb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DB81DFE36
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739971327; cv=none; b=Kgznho+mLR+Fpw9Rzs1g50I1gOtz7348GXJrxaVo6C6+Asjt4tTyAmtpp8HBpMUicsSSX2PJxFwlaF38deltF/4d8w0Kva/O+joQG195P/lJtFptqbRFSzSRDQHVvqqe91uJ7kgFoGHrYSBOA+Cril/LHuXoy5t1ze50lXRhpkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739971327; c=relaxed/simple;
	bh=YUJnJ8rhFc5+I3E/mQ85kMmP6w34U3tXi31VSVl/cVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmmNcgAdP1ZD5hXXw+Go1NO8EcBMaZx90KGbT0emaxzX1AvQ4EL2UcHyTKiw2GAzlAePyiDk2DHqtuc5SNKr/pWJY2WyCgEz0Aj/Il4CyBR9xYLr8n4KYlkEUpwiq1FWRxpm6dP48KCR8mBWv6rWb6eMU9RQU/mp40wJK79OUew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=GEdv5sNb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4397dff185fso34088625e9.2
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 05:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739971323; x=1740576123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItERCttD4ZqCJ2HvXTOXVmKnbOGbB9MYcRuiAClfxiU=;
        b=GEdv5sNbDi5b8ZzkRcaHABWfsg7coesfr1FjBksAfTWv3wu+XsAJSwsOiipmPG5WCb
         VtE8KXX2Dq7/ZB8enCA21wP4IJzEawxotKD+XXncpunW63WH6t75n1/LFBB/lZMGAioH
         +MD4RJpGBExuALUY3ucPq3OkzLBoA1LnOkQ34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971323; x=1740576123;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItERCttD4ZqCJ2HvXTOXVmKnbOGbB9MYcRuiAClfxiU=;
        b=d5CIQJDe/E7N9ake9MY0SbY6UXmK35eqzQNR2LECzdcrTs+BH1BqU9rbKss84RFX/6
         YjYw1DPVHmcTZtPuDrd/ZLmms86BmnMu7mv8ZaOPugls1aw08IhiO5v/7prUx8HiUJ1n
         Cw7V99GT8mh0syNlacxICx5j2IBe9YJ7kprlrUvCc2ej1hATC3v0E+07N+WTXpmP7xYg
         CShWP/lh8TIPrS8FM0ECK+SKqGnoXyiSP1vkv6kjUb1ob8GfwPtjz9WmnUmzIpYHHtcB
         2T2rny6gsJViSuWSnFf8DBUvS+6MpTcMRapYdtzMjKcLj5Q3LPaQCLfBArnbmHsg2L5d
         Dafg==
X-Forwarded-Encrypted: i=1; AJvYcCX+4P0+TyPK14j1PIFrtW9rA+E21B4mkL36/RXvULosqzL8gS04q0mei6j56LyLQtsahlycV7Eiki+Xnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Itxqj3E+Q/RL1tk+UAKANLkkouapZiB2meMXWljzizB8vgct
	r85XxpI4Q5s1cg+AwGGq60Ar/TcqDTQwnAXx6KcJEUkDa3LUeLOj+6fSs/GUj08=
X-Gm-Gg: ASbGncuiftVIl7eiZKqoBuPNIA/layWLvvbS/TjrJ6cKl4aS9Bu6IqLG6UN+XBtCCjz
	Z3uCQcwT66yfEznYtt8N5h7CGcNoFTnWwkwhza+NPSIRGPnfjn/AQP4YhlIQqZ4OycNyz2rKP+Z
	B/pskDpvdhyFCFnv3OVFpY4vY+oaF3BbkE2qV6MR4KrHDSFaFD95LFss8ZiXwzyeHKjgHyTE0nk
	o6ez+EKXEbpwjGSwyAVhFIVyGn6RMFLNBUrsVGk6W4BIW0gAiqtR+wxTALrJ89t3JBpJcNIYxv+
	Z0dDcJyQh2eTeagXENksE+ryBME=
X-Google-Smtp-Source: AGHT+IFOilwBJ5aoh97zcLA4mj4xU/YMSCmbCjCXU9wojxNHTeliFqqcujswwLdduRHkO4EdT9IN9A==
X-Received: by 2002:a05:600c:1c18:b0:439:6e12:fdb4 with SMTP id 5b1f17b1804b1-43999da3ac7mr40722565e9.14.1739971323224;
        Wed, 19 Feb 2025 05:22:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ef9sm17846401f8f.76.2025.02.19.05.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:22:02 -0800 (PST)
Date: Wed, 19 Feb 2025 14:22:00 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z7Xa-K0aOqcndICH@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Florent Tomasin <florent.tomasin@arm.com>
References: <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
 <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com>
 <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 18, 2025 at 04:22:10PM +0000, Daniel Stone wrote:
> Hi Sumit,
> 
> On Mon, 17 Feb 2025 at 06:13, Sumit Garg <sumit.garg@linaro.org> wrote:
> > On Fri, 14 Feb 2025 at 21:19, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > I would say one heap per-profile.
> >
> > And then it would have a per vendor multiplication factor as each
> > vendor enforces memory restriction in a platform specific manner which
> > won't scale.
> 
> Yes, they do enforce it in a platform-specific manner, but so does
> TEE. There is no one golden set of semantics which is globally
> applicable between all hardware and all products in a useful manner.
> 
> So, if we define protected,secure-video +
> protected,secure-video-record + protected,trusted-ui heap names, we
> have exactly the same number of axes. The only change is from uint32_t
> to string.
> 
> > > > Christian gave an historical background here [1] as to why that hasn't
> > > > worked in the past with DMA heaps given the scalability issues.
> > > >
> > > > [1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532f71@gmail.com/
> > >
> > > Hm, I fail to see where Christian dismiss the dma-heaps solution in
> > > this email. He even says:
> > >
> > > > If the memory is not physically attached to any device, but rather just
> > > memory attached to the CPU or a system wide memory controller then
> > > expose the memory as DMA-heap with specific requirements (e.g. certain
> > > sized pages, contiguous, restricted, encrypted, ...).
> >
> > I am not saying Christian dismissed DMA heaps but rather how
> > scalability is an issue. What we are proposing here is a generic
> > interface via TEE to the firmware/Trusted OS which can perform all the
> > platform specific memory restrictions. This solution will scale across
> > vendors.
> 
> I read something completely different into Christian's mail.
> 
> What Christian is saying is that injecting generic constraint solving
> into the kernel doesn't scale. It's not OK to build out generic
> infrastructure in the kernel which queries a bunch of leaf drivers and
> attempts to somehow come up with something which satisfies
> userspace-provided constraints.

Fully agreeing. The one thing we discussed, but haven't implemented yet,
is that we'd add sysfs links from devices to the dma-heaps they support.
Including allowing for priorities and different use-cases on the same
device. We just haven't gotten there yet.

But even with that it's up to userspace to do the constraint solving, not
the kernel.

> But this isn't the same thing as saying 'dma-heaps is wrong'! Again,
> there is no additional complexity in the kernel between a dma-heap
> which bridges over to TEE, and a TEE userspace interface which also
> bridges over to TEE. Both of them are completely fine according to
> what he's said.
>
> > > Honestly, when I look at dma-heap implementations, they seem
> > > to be trivial shells around existing (more complex) allocators, and the
> > > boiler plate [1] to expose a dma-heap is relatively small. The dma-buf
> > > implementation, you already have, so we're talking about a hundred
> > > lines of code to maintain, which shouldn't be significantly more than
> > > what you have for the new ioctl() to be honest.
> >
> > It will rather be redundant vendor specific code under DMA heaps
> > calling into firmware/Trusted OS to enforce memory restrictions as you
> > can look into Mediatek example [1]. With TEE subsystem managing that
> > it won't be the case as we will provide a common abstraction for the
> > communication with underlying firmware/Trusted OS.
> 
> Yes, it's common for everyone who uses TEE to implement SVP. It's not
> common for the people who do _not_ use TEE to implement SVP. Which
> means that userspace has to type out both, and what we're asking in
> this thread is: why?
> 
> Why should userspace have to support dma-heap allocation for platforms
> supporting SVP via a static DT-defined carveout as well as supporting
> TEE API allocation for platforms supporting SVP via a dynamic
> carveout? What benefit does it bring to have this surfaced as a
> completely separate uAPI?
> 
> > > And I'll insist on what
> > > Daniel said, it's a small price to pay to have a standard interface to
> > > expose to userspace. If dma-heaps are not used for this kind things, I
> > > honestly wonder what they will be used for...
> >
> > Let's try not to forcefully find a use-case for DMA heaps when there
> > is a better alternative available.
> 
> What makes it better? If you could explain very clearly the benefit
> userspace will gain from asking TEE to allocate $n bytes for
> TEE_IOC_UC_SECURE_VIDEO_PLAY, compared to asking dma-heap to allocate
> $n bytes for protected,secure-video, I think that would really help.
> Right now, I don't understand how it would be better in any way
> whatsoever for userspace. And I think your decision to implement it as
> a separate API is based on a misunderstanding of Christian's position.
> 
> > I am still failing to see why you
> > don't consider following as a standardised user-space interface:
> >
> > "When user-space has to work with restricted memory, ask TEE device to
> > allocate it"
> 
> As far as I can tell, having userspace work with the TEE interface
> brings zero benefit (again, please correct me if I'm wrong and explain
> how it's better). The direct cost - call it a disbenefit - it brings
> is that we have to spend a pile of time typing out support for TEE
> allocation in every media/GPU/display driver/application, and when we
> do any kind of negotiation, we have to have one protocol definition
> for TEE and one for non-TEE.
> 
> dma-heaps was created to solve the problem of having too many
> 'allocate $n bytes from $specialplace' uAPIs. The proliferation was
> painful and making it difficult for userspace to do what it needed to
> do. Userspace doesn't _yet_ make full use of it, but the solution is
> to make userspace make full use of it, not to go create entirely
> separate allocation paths for unclear reasons.
> 
> Besides, I'm writing this from a platform that implements SVP not via
> TEE. I've worked on platforms which implement SVP without any TEE,
> where the TEE implementation would be at best a no-op stub, and at
> worst flat-out impossible.
> 
> So that's 'why not TEE as the single uAPI for SVP'. So, again, let's
> please turn this around: _why_ TEE? Who benefits from exposing this as
> completely separate to the more generic uAPI that we specifically
> designed to handle things like this?

Completely concurring on everything said above. TEE exposed through a
dma-buf heap (or maybe special v4l allocation flag for secure video
playback) and then we prime import that on the display side. Maybe also
through drm render drivers for the EGL/VK protected content extensions.
Same for any other hw means to allocate content protected buffers, TEE is
not special here at all.

Anything else needs seriously good justifications why the entire dma-buf
heap design is busted.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

