Return-Path: <linux-media+bounces-20656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5AD9B80C5
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 18:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 570FB1F22286
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 17:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0F41BE841;
	Thu, 31 Oct 2024 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="E8a8972Y"
X-Original-To: linux-media@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14491BD4F7;
	Thu, 31 Oct 2024 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730394135; cv=none; b=I4wwkY5QRBDTB3WpDLBGAue5YiZ+2EUSE+yzM+pF2DGSAfw7xXtPuhgbquBFArX2dnyKCeS8Lpy3Rsbn70IV1OVxTcrLZ/a6z06HQVR8EPzf1riQZV97Cwdy4GzQ+dWNUkLpVv+wmQsdIDISjP3kQcGfAW/myibLbfkDF8kTV2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730394135; c=relaxed/simple;
	bh=J5VQu9y0He6Nsl6UqD66J//QQXMmkn2CUXH2/0hff34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cElK4gh8jM8+5I1HwWSCCgrGFCl75vkkjIMQFqtdvW8GpcRp34khJH5GewNo2VBTM96YyyDPSyVjUhHEXA76509bAy5dbnETtxNEbspF2KDVCYes3gDAOmgegwluj8ETCCkg+pbFLOWRGR676YOkIw/zae4vPF9LyrHjmcsalDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=E8a8972Y; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y4xQj4LTzRUb6k8q83bQHFdOmJxhlDsQ0EsOYpsUkYk=; b=E8a8972YeGazZOviobvyl1aKy0
	SdLewCT/1uHVFuozbDWhamizbykPXeYdnnbDpVpu0BU256FY0a5MKYWaggghGzOLTlp5mLqiSR0Ot
	mcnVNraZNV4s6oGzmqjxSt6uNcyuECUff+ae4WNaelT5zcc9waIb4gL56jCDYgo5BzAMlN2zPcupk
	SkVtwVx7h6XBjdO/hsorXwM+1nnuAr//By3gKEtopOBEinMZsuepTrSMb+q8zFl5qNQ0PGR/C1Tuq
	aWuuoKC6P46bweKjKk2sISaAJAvZRkOK7bHZJis8amdHPA+HIMcgIl1w0W49QD6npUTwjB+jbrzTY
	MiPRF0lg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YYe-00000009qHi-3YWC;
	Thu, 31 Oct 2024 17:02:04 +0000
Date: Thu, 31 Oct 2024 17:02:04 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Maxime Ripard <mripard@redhat.com>
Cc: metux <metux@gmx.de>, Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: Requirements to merge new heaps in the kernel
Message-ID: <20241031170204.GL1350452@ZenIV>
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
 <35deac48-4220-4889-833d-1b57b417e968@gmx.de>
 <20241031-bouncy-cute-shrimp-cd2530@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-bouncy-cute-shrimp-cd2530@houat>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Oct 31, 2024 at 05:45:23PM +0100, Maxime Ripard wrote:
> On Wed, Oct 30, 2024 at 12:16:22PM +0100, metux wrote:
> > On 22.10.24 10:38, Maxime Ripard wrote:
> > > I'm still interested in merging a carve-out driver[1], since it seems to be
> > > in every vendor BSP and got asked again last week.
> > > 
> > > I remember from our discussion that for new heap types to be merged, we
> > > needed a kernel use-case. Looking back, I'm not entirely sure how one
> > > can provide that given that heaps are essentially facilities for
> > > user-space.
> > 
> > For those who didn't follow your work, could you please give a short
> > intro what's that all about ?
> > 
> > If I understand you correctly, you'd like the infrastructure of
> > kmalloc() et al for things / memory regions that aren't the usual heap,
> > right ?
> 
> No, not really. The discussion is about dma-buf heaps. They allow to
> allocate buffers suitable for DMA from userspace. It might or might not
> from the system memory, at the heap driver discretion.

I'm afraid you've misinterpreted that - our hexapedal friend had just
	* noticed that excessive crossposting can get it banned
	* got itself a new address
	* posted a solitary ping as the first test
	* followed that by testing the ability to cross-post (posting you'd
been replying to, contents on chatGPT level)
	* proceeded to use its shiny new address for more of the chorus
whinge exercise they'd been holding with several other similar fellows
(or sock puppets, for all I know).

Just ignore the wanker - it wasn't trying to get any information other
than "will the posting get through" anyway.

