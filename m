Return-Path: <linux-media+bounces-19255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC6B994D5E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 176641F2417E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358991DED6F;
	Tue,  8 Oct 2024 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Otmsx2rr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8B1DE8A0;
	Tue,  8 Oct 2024 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392681; cv=none; b=RDXxCTnOt3Bri6OstvgNTPiZKKjA7hswksrIMJtHo7DxoRz/uFVkrJyr9a7n/GjUthGIi+Tkl2t+0aBXiXGecH4PwMVtgc6i9po/K6kBTwRyxdjgrN87/bgkpP3v2vzvI7QYf2oLtXAGTI2dodQYFXNe8w+b9QLOEpJ99t282L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392681; c=relaxed/simple;
	bh=CiHFkYMfmlhH7C61SxzU1s41M8D5uRdtrYwZ3UI1/nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CM1EHD0oaZvE2yNhikdrKLP+l7m4R5eOaa20ggGmbHxxQ9vESHXXRBSBZ/rlidyVV6niXftWbZ+04hcb1aESocuDy8iSxVwHMBFqzsSp4tCWq8JUfBM0pmlxtfTKEG/skMMTRnUSJA3v2Cpcp0Ur+THqtf4z0Yz3/J1sh9uKAOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Otmsx2rr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153D2C4CECC;
	Tue,  8 Oct 2024 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728392681;
	bh=CiHFkYMfmlhH7C61SxzU1s41M8D5uRdtrYwZ3UI1/nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Otmsx2rrnevrNJz4cLf+Z+32OY2h9DjQBorQoXCcf6lSUhC69whxs27/7VaNcxKNL
	 AaoirpV4LLKVHGxjAn2x57uW1MRbG57TudgY2BNrquGlkdVt0LNLcfzAD4qlin78Hh
	 YIeC3z0165JBStl/rD4zo/dKDqZjXAOUuYolq++WUeSBbfYXVMDmAJQUhlMKrekPf4
	 /aUR+lVLP+H4wURm1VOCkSyBWrfadgbdrn3Ec4g1JhENfW7X4p/1DLudFetk9pMqHZ
	 j1COlC8q+ltFHaUSBCxGFaaL2UxjYnhaNsn3jCEJiclSyUiGEPYPyMupVBjgs/r/Hy
	 zmvDqrk1A2Lxw==
Date: Tue, 8 Oct 2024 09:04:39 -0400
From: Sasha Levin <sashal@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Lijo Lazar <lijo.lazar@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
	airlied@gmail.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
	mario.limonciello@amd.com, Hawking.Zhang@amd.com, le.ma@amd.com,
	hamza.mahfooz@amd.com, andrealmeid@igalia.com,
	victorchengchi.lu@amd.com, sunil.khatri@amd.com,
	chenxb_99091@126.com, victor.skvortsov@amd.com, Jun.Ma2@amd.com,
	Yunxiang.Li@amd.com, Felix.Kuehling@amd.com,
	Arunpravin.PaneerSelvam@amd.com, tvrtko.ursulin@igalia.com,
	pierre-eric.pelloux-prayer@amd.com, Wang.Beyond@amd.com,
	shashank.sharma@amd.com, zhenguo.yin@amd.com, jesse.zhang@amd.com,
	Philip.Yang@amd.com, rajneesh.bhardwaj@amd.com, Tim.Huang@amd.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH AUTOSEL 6.11 72/76] drm/amdgpu: nuke the VM PD/PT shadow
 handling
Message-ID: <ZwUt5zNpjTMzweM9@sashalap>
References: <20241004181828.3669209-1-sashal@kernel.org>
 <20241004181828.3669209-72-sashal@kernel.org>
 <bc1f6bc0-6512-48e0-9f97-c607b34e9ab1@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc1f6bc0-6512-48e0-9f97-c607b34e9ab1@amd.com>

On Tue, Oct 08, 2024 at 08:46:01AM +0200, Christian König wrote:
>Hi Sasha,
>
>Am 04.10.24 um 20:17 schrieb Sasha Levin:
>>From: Christian König <christian.koenig@amd.com>
>>
>>[ Upstream commit 7181faaa4703705939580abffaf9cb5d6b50dbb7 ]
>>
>>This was only used as workaround for recovering the page tables after
>>VRAM was lost and is no longer necessary after the function
>>amdgpu_vm_bo_reset_state_machine() started to do the same.
>>
>>Compute never used shadows either, so the only proplematic case left is
>>SVM and that is most likely not recoverable in any way when VRAM is
>>lost.
>
>why is that backported to older kernels? It's basically just removing 
>an old and now unused feature.
>
>Lijo pointed out a related bug fixed by removing the feature, but that 
>only happens extremely rarely and in my view doesn't really justify a 
>backport.

I'll drop it then, thanks!

-- 
Thanks,
Sasha

