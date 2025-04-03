Return-Path: <linux-media+bounces-29326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA9A7A37F
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 15:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C16AD188FCE1
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 13:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E78024E016;
	Thu,  3 Apr 2025 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvbDGYOR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E16D529;
	Thu,  3 Apr 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686132; cv=none; b=DJjvLwkIuDfFyT4naejRXuk8Srquk8yJ4c0jxMJpJ9eod9C8HRx+GdMDsxh8ySBJcflfmAh9Iid4eKLV2ZcQGr9lJENN7yvSVwN8hFfIKYJiqf7V590AmjU6CIqa9ri63K7HM73zpzPRkCpRjlAsi1a8I9Oi8e5mmU6c7LqMpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686132; c=relaxed/simple;
	bh=r4n/nElshuEC+N/oCbbDCl2TaTMzeqJvA0E1GhChm2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPqvyhZhAe7bLJb2yCIb7/hev4nul60olypF8h01lvpRESUoWxy3riFiWViUaEV+42BX83gMK02kpy+Cz/CSFMNW/M/lavXzFNan9tuFIrwmZFFXcb/PUx7pJeBBOIWtlDmz39U7w/dNjbIDCQk57stzQg1oTmRw69mcxyBLuqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvbDGYOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4D6C4CEE3;
	Thu,  3 Apr 2025 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743686131;
	bh=r4n/nElshuEC+N/oCbbDCl2TaTMzeqJvA0E1GhChm2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvbDGYORWxXFYqROzffePhwsr3Gp9fXm75EwuFZpPa1CWJ0B/HHQXNKE8FFykhtuN
	 ABrrdG1HJW9UFSzkn5f4amdVgsn1ckORpYuX/JUBNNhEs9HrXaBjefz4+iMoAtTawS
	 fQyiuoGferImQDO+gcmNi2laXyu0uc5zrTkAgOAGejOOMBxfXSq4PKt4rdW8kHi8BY
	 6fmnxStLeYEjFgssbD5NuRFupOZVAliz+iiyqmZMv1GxzSBDyqCZxa2e4zGdD8P2N9
	 RpNGNyf/+fIhKKwCQHfCLtTb5nPcsulrdrPV7rF0Lfy0uvDGl/e5z4So0rA0C+075A
	 CxD5w/7dDFVFA==
Date: Thu, 3 Apr 2025 15:15:25 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
Message-ID: <Z-6J7bngU2JtfMMN@pollux>
References: <20250403101353.42880-2-phasta@kernel.org>
 <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
 <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>

On Thu, Apr 03, 2025 at 02:58:13PM +0200, Philipp Stanner wrote:
> On Thu, 2025-04-03 at 14:08 +0200, Christian König wrote:
> > Am 03.04.25 um 12:13 schrieb Philipp Stanner:
> 
> > BTW: nouveau_fence_no_signaling() looks completely broken as well. It
> > calls nouveau_fence_is_signaled() and then list_del() on the fence
> > head.
> 
> I can assure you that a great many things in Nouveau look completely
> broken.
> 
> The question for us is always the cost-benefit-ratio when fixing bugs.
> There are fixes that solve the bug with reasonable effort, and there
> are great reworks towards an ideal state.

That's just an additional thing that Christian noticed. It isn't really directly
related to what you want to fix with your patch.

I think the function can simply be dropped.

