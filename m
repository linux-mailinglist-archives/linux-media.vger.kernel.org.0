Return-Path: <linux-media+bounces-39940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB0B26FEE
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 22:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30AD95A2620
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 20:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9CB248F78;
	Thu, 14 Aug 2025 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+4D3XxX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236731986E;
	Thu, 14 Aug 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755202088; cv=none; b=l6SER09eAoWSGEmPGMY+f7Dvo/eWJojvkjd+WXVTews1vmWqtnUL9OpW9Vi1Ek2a1E4GkX6x/g/wnII1hmg8u7lmQwVvAN8t3QmyhGxEqs7/QNer50sGpeflslkntSPb6x/LywE86f0HN7gD/grno+n6YjUmg92dSuHeNzZcVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755202088; c=relaxed/simple;
	bh=CJoOu3ga/1pLRZ+X8m6O3r/IJ7J+n7vSjzg8D7BtxnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MlHXfItcKjv8XAKTQMGKdFrafmGZKD1Sa2JFd09tFaCQhgkT8V3wTQzxBusMGiurwP3i6N+uF62ZqUcQfqSocLRMw331UxL+eaMfSGxX5kK36oArq0gunN9HLc/5Byre6n935Eq2i7rjebVZFIfO8lHB6I0xuofQCyq7DRkGrW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+4D3XxX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D94FC4CEED;
	Thu, 14 Aug 2025 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755202088;
	bh=CJoOu3ga/1pLRZ+X8m6O3r/IJ7J+n7vSjzg8D7BtxnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M+4D3XxXCCDwQGYY/QX877Cs+ddgYiMwtNNAWHysxdoI78rLK0t6aFdSbW3cBLMRF
	 TNLED4+uF/3/UbQ1yk3iLeeJB6blcVqiuf4OmyGE0bLsEeKYdq6rc+F3Dd3QFdRRkV
	 iOMxckhBH+7ACbEBKmvOqeIxeI6HtcWxXN21FJWLvNhE1CIp7M0uYs43YSh6owpuyW
	 /5CrQMD1vyFFQr19rRys+i+8c5zhhNa77UWI9vO4WKH88Ic1HYZQ54de97+mvke07O
	 XlSSH6eQmrIUK3/Psj7QcWMxaJcW1FUuNGpWG0qnpbwFG7Fpr4YRX8Zgmu7aehGQTc
	 cCSJQNH5ixUMg==
From: Mark Brown <broonie@kernel.org>
To: arnd@arndb.de, lee@kernel.org, mchehab@kernel.org, lgirdwood@gmail.com, 
 perex@perex.cz, tiwai@suse.com, linux@treblig.org
Cc: linux-media@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250625133258.78133-1-linux@treblig.org>
References: <20250625133258.78133-1-linux@treblig.org>
Subject: Re: (subset) [PATCH 0/4] Remove the wl1273 FM Radio
Message-Id: <175520208626.152171.10554357200062278681.b4-ty@kernel.org>
Date: Thu, 14 Aug 2025 21:08:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 25 Jun 2025 14:32:54 +0100, linux@treblig.org wrote:
> I noticed that the wl1273 radio had an unused symbol, but then noticed
> it is on Arnd's unused driver list:
>   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> 
> So, delete it.
> The components seem pretty separable, except for Kconfig dependencies.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: wl1273: Remove
      commit: a46e95c81e3a28926ab1904d9f754fef8318074d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


