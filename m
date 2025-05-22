Return-Path: <linux-media+bounces-33129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B9AC0D10
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05D31BC3462
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC84228C00A;
	Thu, 22 May 2025 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObjMY9jM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277413010C;
	Thu, 22 May 2025 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921325; cv=none; b=hl2KcusOtZ/zOwa+WOBdzcB9ctYSiouRlMp6jYVMexQLf3gXo4UEXXf4spevXdPHK4DraQsotm46PbpACsaapupd1Ho+6JmyL+FXMZoJQyISy2QReO9A5iBlo4WBs+CbNwUfqFO6f6FmnGQkJeSpGvIGWZrKbyAK/4k/fF8WrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921325; c=relaxed/simple;
	bh=aefwlKfamE6DcffrjNWnfeFHK+8y3ocMVzuWPfH954s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMj2D4hxNYvCZjO7RdJIipkar00R0E8woF7RADw4C3hNxW/g7dIuuGmUQ/c68hbhMDya58wGwmTgVya52cqxzK2G4SdpyAT/bAXnccZwLBqaWHQZ21wfYSNilZYRgetFgKj5SOwU97S/LfJbddRTzFtKZhCBOYnHwtwGnN/46JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObjMY9jM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF16C4CEED;
	Thu, 22 May 2025 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747921324;
	bh=aefwlKfamE6DcffrjNWnfeFHK+8y3ocMVzuWPfH954s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObjMY9jM8+iR0WfaQGVtqUs8mWYuWJLr19dnGRpII49sMuQT0btj1FoAvJsQNfIT0
	 0GH+iILZyxixLeDBM1bjjRpV3Szg3hMtglKlC9VE+PdJ+BWB1OMPKGAeyEdwFtfCmx
	 2EU4RIebtM5oLlIrL+RJHEXTX+45JcNdxJ6B+Ja5UBEkiz5wV1F9UT/tNSCjazYv0X
	 6wDeSwFBTwrS2LDGMBkOA/Z+we1vvKq3g9yrKjujeCE2L0eGvky1NAM41DeYx+Kxul
	 WE3JIjr1cOhpr35d3hawVY/xNrAZ88LfnUHHxAa8yWFSE4mM1sAls6nm3JnMJwCiOL
	 aznOAGZ/eoVrQ==
Date: Thu, 22 May 2025 15:41:59 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
Message-ID: <aC8pp1tOUkikGPKx@pollux>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
 <aC8fpEXYWZ9Oy41J@pollux>
 <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>

On Thu, May 22, 2025 at 03:09:49PM +0200, Christian König wrote:
> On 5/22/25 14:59, Danilo Krummrich wrote:
> > On Thu, May 22, 2025 at 02:34:33PM +0200, Christian König wrote:
> >> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.
> > 
> > As you write below, in certain cases it is valid to call this from drivers, so
> > it's not unreasonable to have it as part of the public API.
> 
> The question is from which drivers?

Well, any driver that uses it to check its own fences, as you say below.

> >> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
> >>
> >> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.
> > 
> > In general, I like the  __dma_fence_is_signaled() helper, because this way we
> > can document in which cases it is allowed to be used, i.e. the ones you descibe
> > above.
> > 
> > test_bit() can be called by anyone and there is no documentation comment
> > explaining that it is only allowed under certain conditions.
> 
> That's a rather good argument.
> 
> > Having the __dma_fence_is_signaled() helper properly documented could get you
> > rid of having to explain in which case the test_bit() dance is allowed to do
> > over and over again. :-)
> 
> That's an even better argument. 
> 
> > I also think the name is good, since the '__' prefix already implies that there
> > are some restrictions on the use of this helper.
> 
> I'm still hesitating. Adding something to the API always made it usable by everybody.

You can't prevent that, the test_bit() dance can be done by anyone, but you can
document it properly with this helper. :-)

