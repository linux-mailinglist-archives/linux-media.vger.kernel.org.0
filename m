Return-Path: <linux-media+bounces-33131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EECEAC0D50
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6821D7B6F4D
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9097E28C2A9;
	Thu, 22 May 2025 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCEI14UI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF328B3F7;
	Thu, 22 May 2025 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921810; cv=none; b=mh9d0acTk0mJLsai4+++QnAzLvCEjYV0iK0uRstS/v25YrOmqApKJupp/J+mJbaMMk8KW9ttUEirAY593GcC7LKEc+E6Fz9F5Ky+j7xowx18/vFoeBf1hS9bSdk84p3wnyggjrgCl1SiWjDfpi1p2iV+skd4gpV2ByS8mVe6CCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921810; c=relaxed/simple;
	bh=ktheC8UrqvazeBtNepLrvQqF9eDTiWiVXke3rVgh9vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAXmLRrCgZOh30tY97QDADgUq4LNWI2XKZNAa+mdov8Z9i7zGX8lOwHQvPJ42p0qefhNbZGu/N8Q0wTi8DHIRG6PQ1Pl8OYhckwMLKjsBWQ5ExwrfggFaOKEUOE2nISzC87ncU3Yluxylmq339dJaRadls8bKJrrjRYEl9tK4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCEI14UI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B238C4CEE4;
	Thu, 22 May 2025 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747921809;
	bh=ktheC8UrqvazeBtNepLrvQqF9eDTiWiVXke3rVgh9vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCEI14UIkH/IO/X9oU9p5cjgx2Au6n8zDfWPWZeMznx02//mHz1Kd5F5Gm7642Jrt
	 OYhUlzxB2Wf+re6OM3zIj00XcwvAq2elObtX3IwmcIKa/r+bpBoOu651q2jHxzwQQ/
	 PJq+X6sONf5ygxiibdx8fPHY1/dHdTTjVwsTIfBPdhWxvP2YKZXogSFfDPTxGvA2RA
	 Y3LtLbypAKGmaVDBEqTsFWSZE2NdHu3P7pYplEXSUpWhNeRxcmsnKpT9PG0QqNhn07
	 3B8lK+Pt0UBbzd6UiEAUYuC8Kfhl726PBJLkn7l0RzTpdqOXMLs9vJfE54RcRLY0/9
	 9z6otqMAX86oQ==
Date: Thu, 22 May 2025 15:50:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
Message-ID: <aC8rjBuqzst-SHMD@pollux>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
 <e5d74c0be68d641171271cdff2e71ec5eb312377.camel@mailbox.org>
 <aac87a7e-5a45-4b54-a43b-cb92c5df669c@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aac87a7e-5a45-4b54-a43b-cb92c5df669c@amd.com>

On Thu, May 22, 2025 at 03:05:02PM +0200, Christian König wrote:
> E.g. when you don't know the implementation side use the defined API and don't mess with the internals. If you do know the implementation side then it's valid that you check the internals.

I assume you meant this as "bothering with the internals of you *own* fence is
fine, but not with foreign ones".

And if the driver messes with the internals of its own fence code that's fine,
but in this case we talk about the generic dma_fence implementation, i.e. an
internal flag of the dma_fence implementation.

In general, a driver should *never* bother with implementation details of a
generic component, regardless whether the author knows the internal details.
Things are *always* prone to change and then this may result into subtle bugs.

