Return-Path: <linux-media+bounces-18952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7626298C4E0
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 19:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9AE8B227B5
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 17:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8FD1CDA0F;
	Tue,  1 Oct 2024 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUdghwbc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9455A1CC8AB;
	Tue,  1 Oct 2024 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727805200; cv=none; b=O0pvekGLc+UE2usRGt05/dgjBSdUh4UOOvEU3dL28bV25/SR+qzPyRIL9SpjrKoFPKnfP9yq6IgDWNmJiHl7kaHoaTpYXnWXkWYQMmgvMl47kD0paFcFu63SC0O1e7Pah4x5vXTyMAAHoA6XAW2m+qhDyLvulh/9iytdJJTj0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727805200; c=relaxed/simple;
	bh=an7wYpPqt2R7TgWMl+pfDAOwZGn/V/Z9kjfDwk8AGtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ij5nmBsCrvvYCecam/rAfviF373kDAa8Gxpk50aOj+T3uq3sr9zhV2Sml1Z7Qw5a/RqxYlO0KEectq+oUag9THgp2h2PnJUSMCY+vExcqYBqoKkKcNEztPFB/5a5N64xJmroQgDcj/XPZe1GBNZe4EZsVbaUe0vMTqQwLRSshr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUdghwbc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DFFC4CECD;
	Tue,  1 Oct 2024 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805200;
	bh=an7wYpPqt2R7TgWMl+pfDAOwZGn/V/Z9kjfDwk8AGtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cUdghwbcOytt1+ZkD7mUFJTbf/S5CMvNfpMdxCoMCRjb3Gib8E0qpdGuw420cw4SJ
	 H5iuDfEMa6Hu5CC6IhlEnYXq+dydv+v7X5cXQASyim/FHy0AlkOen/bBGH+A95+lse
	 boaoG5uvecAMEuVuoox0RlBGUdUbh9PZkrp6rfcZHDS6qizBPnFQjvLg/UETTWPSoD
	 /mQwjT21NzQLvLGAFOJFeN2ZDaSKupMHZkgfaahikJL5F2EeMXPZssXYv6H+E9+GoZ
	 oKDEzufB2pjrOMgzxh38CbZvRgQuGYEQkCqj6O2ciglGUl/OpJvNv/soOV7FwE3LR4
	 bvMHn35L2HYbw==
From: Mark Brown <broonie@kernel.org>
To: Tim Harvey <tharvey@gateworks.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
References: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
Subject: Re: [PATCH v2 0/2] {ASoC,media}: constify snd_soc_component_driver
 when used as read-only
Message-Id: <172780519475.2298697.14049924817371991791.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 29 Jul 2024 11:37:36 +0200, Javier Carrasco wrote:
> Declare `snd_soc_component_driver` as const to move their declarations
> to read-only sections for the drivers that do not modify the struct
> after its declaration.
> 
> Apart from a single case under media/, the affected drivers are members
> of the ASoC subsystem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] media: i2c: tda1997x: constify snd_soc_component_driver struct
      (no commit info)
[2/2] ASoC: constify snd_soc_component_driver struct
      commit: 8adff2ff73d8271c993549b106b26f301fa003cf

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


