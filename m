Return-Path: <linux-media+bounces-30835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555FA993D7
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 808647A5934
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA7229C357;
	Wed, 23 Apr 2025 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCcjues8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63329C33B;
	Wed, 23 Apr 2025 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423684; cv=none; b=o30nILoarbxlDKRiemCBKbQs5w5w9UhHY8zQ0j7hQUxVL8NO2hTetvQK0CjksctTG5z2mHLsMt5lEoWSX976F6PlZgZTZgMUz4W0cqgVbCNfFu3HrpequsTsdlGQfbc2j/J3XMAjCzY7nF0gk0O6uTV1QyQdry7Q0gGoQCHP2SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423684; c=relaxed/simple;
	bh=2/x8SZbOSlA6YH843iLZG84F9KDG8XKQ6w0l2NKZKkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9Z2KrgISoa1MqdOwMflixId5TkxYN2bzAqaoUYbxwiel99HD16JPF5zzPnd/anbrvYvmd+mVCLYS/cegfatmieEtAf1UTJQQSI5YJlujNc96oriF6udJFr7l/kz3my1XoGY2X7WPHIjdfP6pWXV4D5GhTJDt9HWAjlH6iqQYfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCcjues8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15318C4CEE8;
	Wed, 23 Apr 2025 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423684;
	bh=2/x8SZbOSlA6YH843iLZG84F9KDG8XKQ6w0l2NKZKkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCcjues89Dcz6KrbPcPOSWWQ1ff5Qdl4u251vVlbGP17nmm6n9ajxNKpxrXUKFrgL
	 9eQLhUZcKiiZL4PcU+PXKwW1rLSts9YQDVpbo6iMuiKMJv8vzrmMyznENXrPQo6F3Y
	 bSAR6WsqINZFni94ESvVRlEVKMjLzOg4ieFoZRNFsJ/t++owpcrjcnhGpsmjjQwwBG
	 cSVBpEVcAHYX6hLb+vasv1mCUYhiuyZP791MqOy408IbkM1z1mhEmURomTJKT6zZrm
	 DA60O74lkXu8qCLPID43bxPadn149jmpgwMaHWnjpHOPE5AfH/0MSW0l6o6DWUjS8I
	 LMR1ZD72Iz7SQ==
Date: Wed, 23 Apr 2025 17:54:38 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fix WARN_ON in
 nouveau_fence_context_kill()
Message-ID: <aAkNPttp4xfkHJp4@pollux>
References: <20250415121900.55719-2-phasta@kernel.org>
 <20250415121900.55719-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415121900.55719-3-phasta@kernel.org>

On Tue, Apr 15, 2025 at 02:19:00PM +0200, Philipp Stanner wrote:
> Nouveau is mostly designed in a way that it's expected that fences only
> ever get signaled through nouveau_fence_signal(). However, in at least
> one other place, nouveau_fence_done(), can signal fences, too. If that
> happens (race) a signaled fence remains in the pending list for a while,
> until it gets removed by nouveau_fence_update().
> 
> Should nouveau_fence_context_kill() run in the meantime, this would be
> a bug because the function would attempt to set an error code on an
> already signaled fence.
> 
> Have nouveau_fence_context_kill() check for a fence being signaled.
> 
> Cc: <stable@vger.kernel.org> # v5.10+
> Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel has been killed")
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-fixes, thanks!

