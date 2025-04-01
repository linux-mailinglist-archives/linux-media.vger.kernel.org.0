Return-Path: <linux-media+bounces-29147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA56A77BEF
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E5243A7711
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 13:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E508203704;
	Tue,  1 Apr 2025 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Nys/RrGN"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3E21EB5FC;
	Tue,  1 Apr 2025 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513622; cv=pass; b=eZGt8dX88LQpVjpWQfCh0MYZfSzQOYBJ+Fkn9AR7V0ZFELh0KUOsawPyu69eXp3Fr37mdllg2fPvwuWvliKSrhs68JDPmIa/6gqzFi1zqD5CmGctxKYIqpD+nId7S+c+TbpJc+foVjccjbvb+pft3F7FvGIzzBslf8vGNWd94gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513622; c=relaxed/simple;
	bh=936t3Y62g/caIH2Gp0NwrIIseCHFNvnPEZQOPCayFj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3zH7Fa4LAG8HM7Z4ssXvBFULJImzm8ePc4oWPi7NPvhcLhwti3KK2R9oRAZOADQbj30Jl6c09pkYoilm104ZKBBXeXBSPeVUiGlT/684DKqi8XjuXBvE6GnNHU/gu2FnP7sGqPnqM7Th8eLC08pSyWDEYLVCLspmfAST2iFca4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Nys/RrGN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743513601; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vhf4ybQ9c+7td8sHscT0FqIyJF59/rLNs7j36dqudh8vVG/H+3KvyZ6I1jZxWRM8ifv0ytukTpKo+P31wUbeFuFDAg2gWoHs+K13PKxAJh9kEGOE4ZhHXXfCTTHC5cemijXkANMRnl4M5miQb1PqV3/6sJmhCLrx/A2k9Y//Bdk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743513601; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HlqcrObXVb8wnKz6QZRhhTpIu3g5AsMKBRmqEwnSzLo=; 
	b=HVqwWD3ocgVhPwjckDnO381DAvC5mpzPjOWQHFMaFocxD2IS8U2KiSvjat6LcsBV/nBTR68KItxalyDo4M8ujvLwOBjSTBiCkwZR+HhvvsQwTqK5Zld8ZPHXjEjZhbqYe5ROECpNfQEZqvbTKtC7JqqxdTRyvOeN6TllT3r6Dak=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743513601;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HlqcrObXVb8wnKz6QZRhhTpIu3g5AsMKBRmqEwnSzLo=;
	b=Nys/RrGNtw5ZpaKk+0t2PWkYx0HxvUjJspY90Jib1wV9UvDp9yP2DXlUjFxvi85A
	ZvV5WKfDrxgyqpp3jALEsxinQYhJ35Xe0oT7IpdUZimnl3Lg4w2m+n7N30RXN6LZZkh
	SJD0z/SNTtttpiF/J6079YbqMaLG+We49BRNwTSU=
Received: by mx.zohomail.com with SMTPS id 174351359953037.89471879433961;
	Tue, 1 Apr 2025 06:19:59 -0700 (PDT)
Message-ID: <3fea4b5b-c4d1-4ac8-b351-692baad81a75@collabora.com>
Date: Tue, 1 Apr 2025 16:19:55 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline
 syncobjs
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250331212333.16029-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250331212333.16029-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/1/25 00:23, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add support for exporting a dma_fence fd for a specific point on a
> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> syncobj support, as it needs a way to turn a point on a timeline back
> into a dma_fence fd.  It also closes an odd omission from the syncobj
> UAPI.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805
> 
> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> v3: Add unstaged uabi header hunk
> v4: Also handle IMPORT_SYNC_FILE case
> v5: Address comments from Dmitry
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 45 +++++++++++++++++++++++++++--------
>  include/uapi/drm/drm.h        |  4 ++++
>  2 files changed, 39 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

