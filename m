Return-Path: <linux-media+bounces-46011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ECAC2034F
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 14:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842FE3BE777
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 13:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F078E3557F5;
	Thu, 30 Oct 2025 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rm+r7BYV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BAD34E777
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761830424; cv=none; b=enK4tVRX50GrVagFUbFlBdLFMaO53GgqhI9WL/WlqWZteKz2UrK/Ba/7V7SQhWQFAOXpHT/9GtoTW3pgQycKwBuPrAsMe4CdFSLTQsy2v5qLncCFOqDmT2oPV/vIvjSoO3S4Rnl2Xw1ZqxdSGeO2HvQ8qBo2xxYTXnixIefJvqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761830424; c=relaxed/simple;
	bh=QNwPRdq9FIL873zVet9y61mF8EJEgCNNPAw1BBEXg9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brINTlnNpIEa/kpPcRDJNVa/jVzh++y5vLGlXlJ9307AnMRfHvtR/bWCNcp8dOLLdM5LuYtsP+dddFUBIKgav34Yd0YiDQiBeBGI9T0PCYqXvM4qvkt+UnCi20Xgb8sJ/E4EHF8Tj1/jk3OPbZPmqUFF1oKZzbhTdUeSmkOuG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rm+r7BYV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A52C4CEF1;
	Thu, 30 Oct 2025 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761830423;
	bh=QNwPRdq9FIL873zVet9y61mF8EJEgCNNPAw1BBEXg9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rm+r7BYVaObM4PlNZcsOzVslm+n1VLDkrmjrCoqvNpJIiDH+7osesTV6r5aZ5cJUc
	 1XSPUKZEjyRy65Svl4jjtm0ZXjTPvk1Ksq0yF791oAOsHcwOXyusHc1H+orZ3zPbee
	 pJuh2utJsawRli+gLSrwSZBsoTdQBUdOFOVHQfjRvndCdzzxwoCX09MYT4INJggMnT
	 4Nh2THR5JgSDzXa3x/M8RloLxV/DmWs/e2wvhJA5bQsnkaVbatUeD36UngDRXjjIXa
	 A3iZqfg4sMoARZA3U4pBuiXt+PonuXKyeUH+S2DXb/JzJYGMTfYchiTwEnvchwKHpV
	 TM1dBO8UdWbqw==
Date: Thu, 30 Oct 2025 14:20:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, 
	Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Message-ID: <vce4mknkfnycv44vrtz6dlkjylyv2ixgvfzsky6veqau4rsczk@4chlio3vhmhq>
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <Z8Bf9HRqOg7B3W79@ashyti-mobl2.lan>
 <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>

Hi Christian,

I'm now jumping into this discussion as there have been several
patches from Nitin, Janusz and in igt as well.

On Thu, Feb 27, 2025 at 03:11:39PM +0100, Christian König wrote:
> Am 27.02.25 um 13:52 schrieb Andi Shyti:
> > On Wed, Feb 26, 2025 at 09:25:34PM +0530, Nitin Gote wrote:
> >> Give the scheduler a chance to breath by calling cond_resched()
> >> as some of the loops may take some time on old machines (like apl/bsw/pnv),
> >> and so catch the attention of the watchdogs.
> >>
> >> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> >> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > This patch goes beyond the intel-gfx domain so that you need to
> > add some people in Cc. By running checkpatch, you should add:
> >
> > Sumit Semwal <sumit.semwal@linaro.org> (maintainer:DMA BUFFER SHARING FRAMEWORK)
> > "Christian König" <christian.koenig@amd.com> (maintainer:DMA BUFFER SHARING FRAMEWORK)
> > linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
> > dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK)
> >
> > I added them now, but you might still be asked to resend.
> >
> > Said that, at a first glance, I don't have anything against this
> > patch.
> 
> There has been some push to deprecate cond_resched() cause it is almost always not appropriate.

Yes, there have been ideas and patches, but so far I haven't seen
anything concrete to deprecate cond_resched() and so far I see it
used normally. Or am I missing something?

> Saying that if I'm not completely mistaken that here is also not 100% correct usage.
> 
> Question is why is the test taking 26 (busy?) seconds to complete? That sounds really long even for a very old CPU.
> 
> Do we maybe have an udelay() here which should have been an usleep() or similar?

mmhhh... it doesn't look right, sleeps and cond_resched() are
different kind of beasts, I wouldn't like random sleeps added, as
you explained in Nitin's second patch.

Thanks,
Andi

