Return-Path: <linux-media+bounces-30822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D740A993A1
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1100B9A28E1
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948702C1E00;
	Wed, 23 Apr 2025 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLMyk4ov"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDACB296147;
	Wed, 23 Apr 2025 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422020; cv=none; b=cIUx8pp14dzmSkhJ3CTGEZ6/0ov127hoTJSgsOqs527n6/aCfwpCzBj3EpVN2Nrd8g9+WtElcaWk6SXL4HIsdV2Tw+wKXYcK852s1m5CgFT/QKOlPZwxw68M0wAzekz+KFJMibpwgtz1E6ll8iHbxY+zQtfJgbKRIXVKB5ZAufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422020; c=relaxed/simple;
	bh=lO+TrxuIb8Dy0/8E6PYSbjeBwOYaCJV2GGaMPYsU5oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ipi3ywcj6eGxlk3oyahBcqEN4Y0CdQjS/AenzmeEu21taeD3UY+bEpxchi06EaZcn6dNvI1z3vMr97auHQ19zdoAJ3dZG9HU0b26tjhcA7HePEimHWDOqpVJngTd7tYGaxLicy5uy48GaL9xNowGcpoeN6kL2QnCLlbXzbSEJ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLMyk4ov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16321C4CEE2;
	Wed, 23 Apr 2025 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745422019;
	bh=lO+TrxuIb8Dy0/8E6PYSbjeBwOYaCJV2GGaMPYsU5oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLMyk4ovvXWER9mNZf1ieA699sUZI46fWIpuZWmWqPqsziinmCqndo9+MDQTGY2My
	 gvJ2bvC48nSVr3Nu85zh7Z3vkYUXffDWlHqDB8WoK8nXy6KuDkwQVmjKW0FobAFmQO
	 tHpZExpdlztQ07oXgeabM1VMf1LpYXvTlVA+8O4bNzw9aS2tX88CHJnKHzLdltZdUX
	 ie/F6ljsTbByRMzy1t0EEW0M8VeoSt/DYKYLgBuO4sN+dLiVTn1+8bGlxA0gFByp0i
	 xYljWJfIzHopoUojhfy/L+/d/Tt/o5UPqdn14N8LxB3TxcFwmpBdxJwKR2kWc4lB7y
	 hHjGh/minC5uw==
Date: Wed, 23 Apr 2025 17:26:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 2/2] drm/nouveau: nouveau_fence: Standardize list
 iterations
Message-ID: <aAkGvpIL7KiRH-iO@pollux>
References: <20250415121900.55719-2-phasta@kernel.org>
 <20250415121900.55719-4-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415121900.55719-4-phasta@kernel.org>

On Tue, Apr 15, 2025 at 02:19:01PM +0200, Philipp Stanner wrote:
> nouveau_fence.c iterates over lists in a non-canonical way. Since the
> operations done are just basic for-each-loops, they should be written in
> the standard form.
> 
> Use for_each_safe() instead of the custom loop iterations.

Please use list_for_each_entry_safe() instead.

You only need resend this patch, I will pick patch 1 for -fixes; this one goes
into -next.

- Danilo

