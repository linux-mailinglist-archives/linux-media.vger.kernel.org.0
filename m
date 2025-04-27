Return-Path: <linux-media+bounces-31134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FAEA9E530
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 01:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E07D3B558A
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 23:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2D120D4F9;
	Sun, 27 Apr 2025 23:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVjBze3i"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4282746A;
	Sun, 27 Apr 2025 23:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745798363; cv=none; b=uAHJCTb17F/ImD25wgli7qpayJ2HWG/dVjwWuumxMSjpiW8s8uJcqluyK2siXih+k5ejxTYlyCcbSJRA4Em6DD+FYD5aSa8Bcg7idMlHoeA3knw2/oBgRFt8a2+yJ6J9Xpu7T3UCG3/Y09gxieguALe1N7DHqkIQq0cK1FHP66A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745798363; c=relaxed/simple;
	bh=nKi5Y2SiC5tgA1MVYV4fNEhrtxgNgfPSqVe2MnMmmSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vwr8EdTcfj5TarSRTlFP81H1bYh1UyUApgHPDPNJ1BFKbcyJIjbVgqzgmVhxUUuxEO3WL31teNO7VgNFU0zffY4y1dl7acs6gTAXNOXHxKmc6q2h0U7qLjUK3sFer1hFoew1l9sOcZeuMkXOYLhFxMglmQpzeOXMlaZcxS/Tg94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVjBze3i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2464C4CEE3;
	Sun, 27 Apr 2025 23:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745798363;
	bh=nKi5Y2SiC5tgA1MVYV4fNEhrtxgNgfPSqVe2MnMmmSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVjBze3irjBqAqcHoP+FTN6a5j06A3tosXjkGZSyBiN6CN2m/ZfJ98yZZXimUQKFg
	 l7/f6EtFP9t2EZyVJx3o86fnmvkkSdZ1fESaG7ALfukpnS6lt9W6HLNYLbWwrvc9Xn
	 uDGhybUUVbVS7k+FtnJU2rh0Qdd1XOtPz4Jx+Wj3xzR3KxhFfiFIt7+7LWbRodctSz
	 m0joEaurwkqTJVel6bisQuLb+hif08oqDIeETVCtzOdjbIUv8rV2nGBapbmxmHM7Gu
	 Qb5AM7wq3Y15K56jPrt3cQLxldRrteYILgeqGM1D3Ien8CGamssyZnRkFaHmapDFQC
	 0juqFNYdmY6cg==
Date: Sun, 27 Apr 2025 19:59:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Pak Nin Lui <pak.lui@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>, simona@ffwll.ch,
	sumit.semwal@linaro.org, Yunxiang.Li@amd.com,
	tvrtko.ursulin@igalia.com, matthew.auld@intel.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] [PATCH AUTOSEL 6.13 15/34] drm/amdgpu: allow
 pinning DMA-bufs into VRAM if all importers can do P2P
Message-ID: <aA7E2ZKr_5rOpmWM@lappy>
References: <20250414132729.679254-1-sashal@kernel.org>
 <20250414132729.679254-15-sashal@kernel.org>
 <CADnq5_OyrpJL3fnbyiueyddkNZ2B-uRO9pyrRVqBTeY5AnepYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OyrpJL3fnbyiueyddkNZ2B-uRO9pyrRVqBTeY5AnepYw@mail.gmail.com>

On Mon, Apr 14, 2025 at 09:48:10AM -0400, Alex Deucher wrote:
>On Mon, Apr 14, 2025 at 9:28 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Christian König <christian.koenig@amd.com>
>>
>> [ Upstream commit f5e7fabd1f5c65b2e077efcdb118cfa67eae7311 ]
>>
>> Try pinning into VRAM to allow P2P with RDMA NICs without ODP
>> support if all attachments can do P2P. If any attachment can't do
>> P2P just pin into GTT instead.
>>
>> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
>> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
>> Tested-by: Pak Nin Lui <pak.lui@amd.com>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This should not go to stable.  It depends on dmem cgroups.

I'll drop it.

-- 
Thanks,
Sasha

