Return-Path: <linux-media+bounces-37012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 710DFAFB519
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD791AA5B72
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1AD2BDC29;
	Mon,  7 Jul 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KETZBJ2v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCA1C4A0A;
	Mon,  7 Jul 2025 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895961; cv=none; b=OhgiWg7eQPGZpB+HNBVlc8SQ/cSW+cuhASGIHX4ozZrMwssQeOwYfFJhSxbI7NwqqKtUYhRTcDypopdsnheSkgeVZSe5SFv41XIyT9nxPx20rBeUyPyKzqz8arwtUHBW6lT8l8kbBzCxvXDxeUt3miMAi/CLFLj6VWIm/6htCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895961; c=relaxed/simple;
	bh=qBEShQcOVBCT9+1/5YtR3gvw/34cw/qld5Qg4vz6MZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GduxyObpYmhOLlvy621j9KVGzucRumRikWSQ8Hq9enZA5aGjtAk2PXQvBC1mqrDqEsRBai7wKD+tNjTQvFz5GPe37zzArkfezD2y5AZyjQmjb+Hn13vcamg2MegWNJf2WccGvnI5jz2DF1PcfQ1KWRjnJvxovfugPjeHzQX22sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KETZBJ2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DA5C4CEE3;
	Mon,  7 Jul 2025 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895960;
	bh=qBEShQcOVBCT9+1/5YtR3gvw/34cw/qld5Qg4vz6MZ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KETZBJ2vFpvziF6BdYUYQ8slMZxelmN7tj51PMoa6IqADIf38mlncS8xruFhpc3Ek
	 kXh38/FSCZWuPP4F3RfQJl0ss8iWr1MUWUKM8SfGd9hCAjc6jtngoxebzRmq1MbEgy
	 H45wutLE0KwSh+98I+WT3qDh4fNtaYzwqTYXfOlqyVCs/58gS93mVCRs3sRf2eZhWN
	 b4Y344eNve0wvsj1En1VKe1nUPV9vXSgsomNoPcsqOL/y5F7apvfRlxbhrkB8PN0Bf
	 xJmc4XwxJg+eN9kQ4B0JZInbee5wI7j9ORNunH2spm7HbkD2gMRfwi06TjsxJTIwDZ
	 gM/vJmtYM8s6Q==
Message-ID: <41cb0bb2-8459-4051-b826-d231c3cbfdd3@kernel.org>
Date: Mon, 7 Jul 2025 15:45:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/nouveau: Make fence container helper usable
 driver-wide
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-7-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250707134221.34291-7-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/25 3:42 PM, Philipp Stanner wrote:
> In order to implement a new DRM GPU scheduler callback in Nouveau, a
> helper for obtaining a nouveau_fence from a dma_fence is necessary. Such
> a helper exists already inside nouveau_fence.c, called from_fence().
> 
> Make that helper available to other C files with a more precise name.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>

