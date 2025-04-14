Return-Path: <linux-media+bounces-30186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8AA885DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36F721907E2B
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3869296D12;
	Mon, 14 Apr 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQCpq0AB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258B2957DB;
	Mon, 14 Apr 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640833; cv=none; b=hBIvFwFMJ62Dh0eJFkk5bIrUkaNEOe5Az/uJxlUS7F+QIX1mgkzGcrs6C5PESIIghnmC7Mo7PRh2GYeRgXV2f6etzKoMmXL39X2wB7ZbEotpj8yUGZK2aJFhjQQ6FjqTd1JNZ1WAHH7Kq51pfqxA+FPe2/xRUz6C66A2N2hmMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640833; c=relaxed/simple;
	bh=JWVti9yDCkyhRv0BTyTqquIhF/3Y9o19PO3iuCETym8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouwZzSNf5FWj5f3hUIxietdOGWT3v/wLfvinXUJhaMSufK4ZPafcYlNC+HVgsdcoFN72h9Fg+3hVs6iJ2JY6jibD3cnmGwGX6peomQebw0P8Agw/zwrSSdyiGI4jwbad04KY7J5bV848twGYQTF0e8SX/Wrt3iHRg1Itj/WbHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQCpq0AB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AD9C4CEE2;
	Mon, 14 Apr 2025 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744640832;
	bh=JWVti9yDCkyhRv0BTyTqquIhF/3Y9o19PO3iuCETym8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQCpq0ABSl2OfpmYLyUO46h6ATAeVaZBibS9KwX3p7ArIrXTDEg8krVSXdXwLB4To
	 I/Al+bTOimEiznRgOxdzX3OlMlcTlnp4hnHQomdNaVzLElWfM6+v9YTnTKAq9ffZqF
	 811pOgD8mZ9gDca7XQpJL+UKogHhduI3BpplcszT/IJPvjMEH1VXwcxHumEgUkt2BL
	 BNlRSFxFrSQ5giUFMjWtwLXftLwzqO7buY7Qc2VBwO79fFtTeTayO0m6Z4t8YOkGKS
	 7oT6ndVIgkJEQdfhwYg1DZOTqoRuWKZKZWhKGkJk1fbLXdarXiOaPd2F2gOJfELOLk
	 Ao+/njDNXZRag==
Date: Mon, 14 Apr 2025 16:27:06 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
Message-ID: <Z_0bOgTBkkRH9jib@cassiopeiae>
References: <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
 <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
 <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
 <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
 <aca00cb25b813da4fd2f215829f02337f05642f3.camel@mailbox.org>
 <45d66ca4-5390-42e9-869a-f5f9125d05b6@amd.com>
 <1127db242503055b2e5e8d07db3aeae46cfb7a24.camel@mailbox.org>
 <6e4628c3cfc7e0d1e4ea9af510ce0b09b34a8cf8.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4628c3cfc7e0d1e4ea9af510ce0b09b34a8cf8.camel@mailbox.org>

On Mon, Apr 14, 2025 at 10:54:25AM +0200, Philipp Stanner wrote:
> @Danilo:
> We have now 2 possible solutions for the firing WARN_ON floating.
> 
> Version A (Christian)
> Check in nouveau_fence_context_kill() whether a fence is already
> signaled before setting an error.
> 
> Version B (Me)
> This patch series here. Make sure that in Nouveau, only
> nouveau_fence_signal() signals fences.
> 
> 
> Both should do the trick. Please share a maintainer-preference so I can
> move on here.

Thanks for working on this Philipp.

If you don't want to rework things entirely, A seems to be superior, since it
also catches the case when someone else would call dma_fence_is_signaled() on a
nouveau fence (which could happen at any time). This doesn't seem to be caught
by B, right?

