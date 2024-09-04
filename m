Return-Path: <linux-media+bounces-17568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5996BA26
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C12C81C24276
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CD61D9320;
	Wed,  4 Sep 2024 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRVtWdg9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA4E1D016D;
	Wed,  4 Sep 2024 11:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448614; cv=none; b=ZEiRoos31J3zmjYsylpfNX9sf/a4G2UGiA8ylodqrLmFw21q91iQy7Xe96G/+9KoTmu5qFh04mZV86zY58ZAgyCx1Aly8uZqdMtlSx4gA5BMKW04D3n8tfvWphoJ8gnWZZ4nfX+q7i0BABlngKcYQgRKr144VctRT18qqqPogw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448614; c=relaxed/simple;
	bh=SFWQxwybbR05p/JSlu2vfeQxyFVILJVtOStppUEw+xw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DBPn4XSL1p7xjouVPi9eD1oaJKiZaIYOLwLJEMKswf3m0MbVImc0/LQGhqWFRh6gNqaOWJ9D3IaxR2P0DJhNuyNqkUGtqWcuLPvZYIRtmlpdPFsn9jMa3o1S7DFAFVi2LN+sO9SjcnXiKwwyhG9a5bcguovCp6pzcyP0VSF2WUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRVtWdg9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D711FC4CEC9;
	Wed,  4 Sep 2024 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725448613;
	bh=SFWQxwybbR05p/JSlu2vfeQxyFVILJVtOStppUEw+xw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KRVtWdg9D4xhd/xX3u5CgZSN5Sm0NZWjAaFc8R5UIZOvKvw7KgThuvHywHeB3MdGE
	 kgA2xop/P1gXyrNDSdt9rkNvIKmYiSEpIzrKdCqUSl1RczLm9zXv5zRl4J+FummyAt
	 Xi8bvs1g+F47UlxXsHpphN5OeHmq6pxpp0RWjA95epvKzdjasyrp2JgHw8t8e3Nosp
	 VBomlo31XSnwYb0Cem8rEVFMAlnnrfrfSCfiFncF8c/X9VoNBp67c3eqHtvOrCoNxj
	 q2KL+vVp0YtBLxLoISr+raawo46JGCCLhCqUxMAaeLNlbLagNf7BrjjDV86zzRJKmH
	 Fw24bheSYB6OQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Nicolas Belin <nbelin@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-Id: <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 12:16:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 22 Jul 2024 08:53:29 +0200, Alexandre Mergnat wrote:
> This serie aim to add the following audio support for the Genio 350-evk:
> - Playback
>   - 2ch Headset Jack (Earphone)
>   - 1ch Line-out Jack (Speaker)
>   - 8ch HDMI Tx
> - Capture
>   - 1ch DMIC (On-board Digital Microphone)
>   - 1ch AMIC (On-board Analogic Microphone)
>   - 1ch Headset Jack (External Analogic Microphone)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
        commit: ceb3ca2876243e3ea02f78b3d488b1f2d734de49
[02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
        commit: 76d80dcdd55f70b28930edb97b96ee375e1cce5a
[03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
        commit: 761cab667898d86c04867948f1b7aec1090be796
[04/16] ASoC: mediatek: mt8365: Add common header
        commit: 38c7c9ddc74033406461d64e541bbc8268e77f73
[05/16] ASoC: mediatek: mt8365: Add audio clock control support
        commit: ef307b40b7f0042d54f020bccb3e728ced292282
[06/16] ASoC: mediatek: mt8365: Add I2S DAI support
        commit: 402bbb13a195caa83b3279ebecdabfb11ddee084
[07/16] ASoC: mediatek: mt8365: Add ADDA DAI support
        commit: 7c58c88e524180e8439acdfc44872325e7f6d33d
[08/16] ASoC: mediatek: mt8365: Add DMIC DAI support
        commit: 1c50ec75ce6c0c6b5736499393e522f73e19d0cf
[09/16] ASoC: mediatek: mt8365: Add PCM DAI support
        commit: 5097c0c8634d703e3c59cfb89831b7db9dc46339
[10/16] ASoc: mediatek: mt8365: Add a specific soundcard for EVK
        commit: 1bf6dbd75f7603dd026660bebf324f812200dc1b
[11/16] ASoC: mediatek: mt8365: Add the AFE driver support
        commit: e1991d102bc2abb32331c462f8f3e77059c69578
[12/16] ASoC: codecs: add MT6357 support
        (no commit info)
[13/16] ASoC: mediatek: Add MT8365 support
        (no commit info)

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


