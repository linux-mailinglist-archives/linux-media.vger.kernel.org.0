Return-Path: <linux-media+bounces-36438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD1AEFAA6
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC004E31D8
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585F32798E6;
	Tue,  1 Jul 2025 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yb9e5Fjk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10ED274FDA;
	Tue,  1 Jul 2025 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376465; cv=none; b=mUV7SkakFGPPX2OBpGOLmhSwS7H8QJl/k+zmwMsDo6QC49rL2I11MtLQnmlaH74U6JtoraWsMchccvptLHKP+2lGpmSh7fOrn1V5MKJ0dGKevR2nwfAMYRvD7WWQbYqPar2osV8ndQqyupvPun/qgz4p8yPTJrnHFfhRFSoZ97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376465; c=relaxed/simple;
	bh=nVZIcfUr8Mb/dtNYc+Fdyt+jgVN5nRav5S+gh2OWH7k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iNadVUw/J0Y9JC0gsshAeemSNBDzZ3//ZaB7gKzOCXW4k7Ea0Jb9x8lZJPGFRKo9/XVd7MeiuB8cj79ttG2N4iAFzmDzsXL9YC8iSralcinVtIwXyV87CYWgDRRRwx7N/KzbW7NROZeCcqU7hywe5xLHy4cRHxMwYf7cMAKrmBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yb9e5Fjk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8DFC4CEEB;
	Tue,  1 Jul 2025 13:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376465;
	bh=nVZIcfUr8Mb/dtNYc+Fdyt+jgVN5nRav5S+gh2OWH7k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yb9e5Fjk0FBz/lZV6rNQD/fD1YrAz5TLPflwLYQKlMx6aRR62d4rcahQEuDT3yx6D
	 e5he0iMMF0zBqdOH8oyhyXReu0Iz6Azw/0cJifb62LFyKpnkVGV6dRr5OTHvyKtaRP
	 qr4cjNhHaqtfIF/NE/VTcC6j2uAxEHfgVYOZo9pIVovIf4+ojroy69GasTOHOw1K0z
	 z7a5FClGOXrPNy/3I1yWbgi2wUloJQatt6atAJuD25ciukeFmCJekmScs7clfUDruG
	 vuieVnkZyDRsucHKyi5g5IcBveUkFKp8NI71PgPYOVtH0oDYEjD8q3/9//47m3Orxm
	 bMhfpnlyqTv6A==
From: Lee Jones <lee@kernel.org>
To: arnd@arndb.de, lee@kernel.org, mchehab@kernel.org, lgirdwood@gmail.com, 
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, linux@treblig.org
Cc: linux-media@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250625133258.78133-1-linux@treblig.org>
References: <20250625133258.78133-1-linux@treblig.org>
Subject: Re: (subset) [PATCH 0/4] Remove the wl1273 FM Radio
Message-Id: <175137646300.2319882.12045106011003909576.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 14:27:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

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
      commit: efddd98938400a570bde5bc69b5ecc7e76cacbe1
[4/4] mfd: wl1273-core: Remove the header
      commit: d356033e7b1e94e0187bb0651f4a066a4646fbb9

--
Lee Jones [李琼斯]


