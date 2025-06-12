Return-Path: <linux-media+bounces-34625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CBAD70DE
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F023217A8A3
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2732472B6;
	Thu, 12 Jun 2025 12:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkgWyLuo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA9246BAC;
	Thu, 12 Jun 2025 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732844; cv=none; b=A0u7ObTWAi5A8j1AVOE8zP+XIUsUkt8dnjO38OkzMnb0KBUlGFQOWqCPzNf+NSqUCn8vcqh/8mLCGF8A7LVBNnK5qKjI8oDvLHOMNnJzHV/rJmAvoSAxmW6dIQlSs+J1yAAS602XfpZx7C6HupE5IpneK2KOKm2OO5iz+qmk5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732844; c=relaxed/simple;
	bh=Zts3wJyRH1KHn9p4EUEhfUWb7tNpZIhQ2gO9k2BoiyU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=TJ7jbSzuPgT2Fck0HFKcF9ojUnwK5Is4fxMgC6rkZ9lALq0IghYZDhqq9qEmfp/LtGo0Uczqnz9WZobuNbwyvnZTZshfqBjqcVo9qHZ/bBUxxs35bYML5xG09sX7DJC0p5n4825TLVi8eunV9MNeHO0TbIcsOjlKxDaOWhcONSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkgWyLuo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B90C4CEEE;
	Thu, 12 Jun 2025 12:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749732844;
	bh=Zts3wJyRH1KHn9p4EUEhfUWb7tNpZIhQ2gO9k2BoiyU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=CkgWyLuok6gXMCXoHJoPCqb9+QWwEOdKdez7wA+Oc/rbwt95u2TIGnrDQf/oah9KH
	 G6niHbJ7DXmeReuunREhsdh0JJejAoM6stJOXmTkX5F5jmE36S+hQavFr7RjrByDai
	 zeAgNsC6azyHwM7rqHLX6lAiRUJruRd0UYxG4X0o49mfWH07CUMKKntri6CCAk/PoH
	 v+jhvio10tFgVaSSw6OLsNhTegKze+ysUo8NcyuPXHVQguj0vOS/Ny0fIV4468mTFE
	 Lw7ZCjTReBpuybnIu/XgbUi+e2D8g6EE4S/SXesWmxDy1Bf63HHE5TVxMTqHDFbGOt
	 jD9U9IxXuQgEA==
Message-ID: <c3c62b98dfc2fcbfa018bf683e5abf60@kernel.org>
Date: Thu, 12 Jun 2025 12:54:01 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 0/4] media: tc358743: Additional link freq, and better
 validation
In-Reply-To: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
References: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, "Hans Verkuil" <hverkuil@xs4all.nl>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Philipp Zabel" <p.zabel@pengutronix.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On Wed, 11 Jun 2025 19:37:12 +0100, Dave Stevenson wrote:
> I've had these patches on our Raspberry Pi downstream kernel since
> I tried upstreaming them back in 2017 [1].
> Maxime's asked me to repost them as he's trying to use tc358743 with
> mainline in RGB mode[2], and is hitting exactly the problems I had
> written them to solve.
> 
> [ ... ]

Tested-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

