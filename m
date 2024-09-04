Return-Path: <linux-media+bounces-17567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1177296BA21
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C23A0280F72
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397281D2202;
	Wed,  4 Sep 2024 11:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjHlMtPn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898471482E1;
	Wed,  4 Sep 2024 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448604; cv=none; b=EIuulm9Uyfx8135x4kLymrrwAxvV9eKJ9ai2JMniTFFBvtG+wRNy97yOEc8aLlHpA50gKssh7mvohzA5UWlY2pkXDCRclV1QicRhCUU3XiFh/b8F916VYW6u11Tbv5MPerOTaH3eqBDryOl/AnLD2ru6ok4sQGtuka2AORHqMOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448604; c=relaxed/simple;
	bh=jnoKCbmPcD1GmESgYWHnWAC+C8551B8aEwnlyDgxp3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m26i0/Gb2tZs5GGpD8A0eeFlDyYpGUQSAnUNGrktyBUaOXgh2sGjQc4FowxzJy/hDvecyCxonk2SxZP3nBzfi+576DhSwo9LuUb7aL7vgu7maM1GLlkrthuxk4UWjEJZNx34STdldG7RGD6mRiyAQzxB8HGwXiAZiZh5M+QMtao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjHlMtPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3A8C4CECC;
	Wed,  4 Sep 2024 11:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725448604;
	bh=jnoKCbmPcD1GmESgYWHnWAC+C8551B8aEwnlyDgxp3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KjHlMtPnOpovnTl90GfKpIuPGs+gwJYi/h9SpXSQSXUdkrLC8x059cyHOUCTVcQOD
	 Eqr9oJu5zIZad+ON1Qmc3Db1zhARkcfmANz8S72acVTG2+sXIuoCP+UGzxD6lMqVxL
	 A344eGn47au8ya+z4zXlx1unlRaMD2HS3bXc2HkfL0x0sLRhbFUWjvxrIfFFXtxORU
	 4qAl+rFufzT6CVtExWQQ+WK9KnpnQZorBxF7zoVKjz+50bzQv32m+7xqpJef5BXpXq
	 p0i1jr9DGm3zmP/+0sQ9VrwCcFGTJnLAvroMUo6N0mCMOO9W5uEmSP7bYwNYcVHMjW
	 LgHv2DTwNjySA==
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
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
Subject: Re: (subset) [PATCH v6 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-Id: <172544859867.19172.9438630691561948517.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 12:16:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 19 Jun 2024 16:46:36 +0200, Alexandre Mergnat wrote:
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


