Return-Path: <linux-media+bounces-44109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F7BC9B45
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8C7A1A6159C
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3642EC54B;
	Thu,  9 Oct 2025 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIRVrddz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2D2EC08A;
	Thu,  9 Oct 2025 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022542; cv=none; b=VHJiYOwe6N66HiS47KOIGjpwx5Xx3g5WlV6rkFxbkqG/vQ5uNCcTbYNYZqT5Ogm/NW17+BygRTTnPKjdVvbDhQczy7wkAcU/GAzthbgyk1X/kwjPAIlWTqchTWPQbOVqvKnuKhNjvJQqA+PkeT0mVYG077jg5mMcjE4RF7Zfhsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022542; c=relaxed/simple;
	bh=LBITJVCsJlbyikSLQk+ONcydel5gO2Q3tuPkl2GAg/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UxfdPIi+8bF64MJ7F4NaajHNfTtvWOgRCjMDS9x1DWBy0FqbZyTicP9RnIWIA/q1G7IJ34jjGy9U/wA2KRNJ/WpsgHnsErPnujizVLz7D5FJLD/jdI+ObjEuWo5fmcj39y7iYGhYVfILE84qW47NhgAkFIKSOyoEFMKwQRfwBNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIRVrddz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2503EC4CEE7;
	Thu,  9 Oct 2025 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760022542;
	bh=LBITJVCsJlbyikSLQk+ONcydel5gO2Q3tuPkl2GAg/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QIRVrddzU2+SC8UHW7tlQniq+sOvWIZgK8RZO91rx6HCp1GomDI5yEyzBZhRwMRJ5
	 wadWK/Y9EN1t5/wIBcAMAJsNermEfwiOVeIGfZqtpnEGHKrQMjqxsAUMDEQTNZovDe
	 NC40lCqpjGCTqZhUhF9sMUMw9BWa653z0DrYJyZZ+/nmzDNFO3kjIyUqHWcqGNWbgp
	 fC/fdDeBK4MxpvAs+Tq9dx8RG2ROsoWQvOWkeA/cfCdfFa85da/c/bhrJeekRMNDl+
	 HdPkJ0mBVDOU+pn8g3aSIzUKP7+zn/dMpZJzPEgmGVuaARpXxdz53l+hZ/qwWwNrKF
	 hDqZMosPTkhRw==
From: Lee Jones <lee@kernel.org>
To: arnd@arndb.de, lee@kernel.org, mchehab@kernel.org, lgirdwood@gmail.com, 
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, linux@treblig.org
Cc: linux-media@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250625133258.78133-1-linux@treblig.org>
References: <20250625133258.78133-1-linux@treblig.org>
Subject: Re: (subset) [PATCH 0/4] Remove the wl1273 FM Radio
Message-Id: <176002253988.2906155.7980864945187163436.b4-ty@kernel.org>
Date: Thu, 09 Oct 2025 16:08:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b87af

On Wed, 25 Jun 2025 14:32:54 +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> I noticed that the wl1273 radio had an unused symbol, but then noticed
> it is on Arnd's unused driver list:
>   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> 
> So, delete it.
> The components seem pretty separable, except for Kconfig dependencies.
> 
> [...]

Applied, thanks!

[3/4] mfd: wl1273-core: Remove
      commit: 2ec8f54725b2ae4f08aeae0483410280e72877e3
[4/4] mfd: wl1273-core: Remove the header
      commit: 5576355937ad7d0ec86ca2cdf4e82cb0f70cd227

--
Lee Jones [李琼斯]


