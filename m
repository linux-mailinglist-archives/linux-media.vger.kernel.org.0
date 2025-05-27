Return-Path: <linux-media+bounces-33459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369DAC4F16
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 15:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED4A1BA0340
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E570F270EC8;
	Tue, 27 May 2025 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKdAm5e/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A7A270568;
	Tue, 27 May 2025 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350818; cv=none; b=Bzvukw4+/WJlSJpTc40VyB3zMLT84sY3RuiayaCKSurh8gsaEvWxlTwIkPCtndixikkIh8/b3Kh3g5LNFBxvB1VeI52QlpqJwtYql2T+vYUnCgZImFTg1+j4HeQYTI3hpAFxf+Q4ZtS/7vU5ejCX4FWQFOqPlL5HdV3uEs0FPsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350818; c=relaxed/simple;
	bh=ByY3v2Z6BPxv2P0JXnk/fpP5Gnu/Ld1qKUcEghmsQ/c=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=K0fgCtqwQ6LCr2rA1B8BwsRwvXj8kYtTX2pdvPPfRmIh4S8MopPgGr3PBdXdERjQyHv6rEO3491b1g1oUxiLZPRiRL50FJvBqrkGER6hDZka/AXN89/qt0f6U3164hkuc8sP2GQUJQqpYtcHvKXhTcfi4V24XAhIhbzFrSLl12A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKdAm5e/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B66C4CEE9;
	Tue, 27 May 2025 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748350817;
	bh=ByY3v2Z6BPxv2P0JXnk/fpP5Gnu/Ld1qKUcEghmsQ/c=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=vKdAm5e/51iiN/W8WOdsfc91Jw+oMMaRIECe9P1oymn4oUYRcAclX0NDlrIau0AOJ
	 Bqes1x9wHn9KDjJuOs6Z8XDznbs222PHmjiD+0j9GvIXN+HVvTbiNVBK7KVRPvDYxj
	 jmuq23Q4I64jPT/n8ZeacK/7C+xwNIXZAiki+hMm6QNPLPoI7XBC8BaclisBZ2Fi0m
	 NPKnVKHjJs6ThT/T1igeKE6QSVkBZ8WPJm0FAiu3f5u7g7a7QkW2rIV5ocXnPU3JnE
	 /sJHvV8/t2h0RzIJYsnqyyh+nUC6fRqCjalh8u7hmDnavVzitv5/zLF7Bsj9ZcX8R5
	 AY7Xde8EUjkcg==
Message-ID: <9470f08c3fcc49fcbbe890a5d66588a5@kernel.org>
Date: Tue, 27 May 2025 13:00:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jared Kangas" <jkangas@redhat.com>
Subject: Re: [PATCH v3 2/3] dma-buf: heaps: Parameterize heap name in
 __add_cma_heap()
In-Reply-To: <20250522191418.442390-3-jkangas@redhat.com>
References: <20250522191418.442390-3-jkangas@redhat.com>
Cc: Brian.Starkey@arm.com, benjamin.gaignard@collabora.com, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mripard@kernel.org, sumit.semwal@linaro.org, tjmercier@google.com, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On Thu, 22 May 2025 12:14:17 -0700, Jared Kangas wrote:
> Prepare for the introduction of a fixed-name CMA heap by replacing the
> unused void pointer parameter in __add_cma_heap() with the heap name.
> 
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

