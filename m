Return-Path: <linux-media+bounces-15348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACD593C726
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 18:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90ABE1C21AC6
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 16:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAD419DF7A;
	Thu, 25 Jul 2024 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyMfYCjV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D2A19DF65;
	Thu, 25 Jul 2024 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721924941; cv=none; b=CW6tlzeu/gd1Ttk4yX2Zvf4agLQUCa/UpvMIfbf0eeBW2ckFpQpcmBcMYc8xDnXVZYkAu2z3EJlr/2R20rEUhXXu3BpPzkMO7MMdW+8sE1WNnR1/hKD6k7WxywWvZ6dievDWLBjVsvMyf5a/AC77z1tUCndYFYNNFHCr6QxE9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721924941; c=relaxed/simple;
	bh=rA8r5GE2DmreSp4mzMERlx21Ozsy7idcGW/81EsYAjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jds7Wwnv0V2jTV2TdPsbzCcxfrbC4PrxjTHAwZDhV2BpFMZ8QMMFB0axK+vrgpU4kphLfY6NXOH4BFvq8xMyb7iZAWsSAZzyN+MOTfpS+LJOoX0VRYMde9P7nx4/cXL9SrcnuecoGaSMmilIZy0bF6Uz43H5jS6R1OV1+7t2CbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyMfYCjV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2470FC116B1;
	Thu, 25 Jul 2024 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721924940;
	bh=rA8r5GE2DmreSp4mzMERlx21Ozsy7idcGW/81EsYAjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CyMfYCjVimpSdrI/6NFuvB4RwQK2i2ehRHRAwXgwmifhEwwaPtfPhy/RarehoVDih
	 m6tAo/0CyllD9poiPv69XdsODkaF1PDmZDmf/OnerivmewQKHipRxc6zKsk3Td9B5w
	 8ehAkthL7Q9qtEmDTqC9LbMPsjfvbgQP1QEa8O9yw70+ESjjLkkJH8Fvcu5CWQSi17
	 7bRAJ0GvSEFQWNFLyTFn4g18zKZH6A2Cvnca6l7Z74b7MfyuOZLQ54E0u9Xf3Slh3C
	 2Rj+NwGKR7pZxhKZIU1vYDxaKMPkz7FTP1hVdIuvfwpkgR1R88GVfsQQw/Y1UuUGs8
	 OlC1KbzaQB5mA==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
In-Reply-To: <20240226-audio-i350-v5-3-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-3-54827318b453@baylibre.com>
Subject: Re: (subset) [PATCH RESEND v5 03/16] dt-bindings: mfd: mediatek:
 Add codec property for MT6357 PMIC
Message-Id: <172192493586.1054722.4853871002402475676.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 17:28:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 14 Jun 2024 09:27:46 +0200, Alexandre Mergnat wrote:
> Add the audio codec sub-device. This sub-device is used to set the
> optional voltage values according to the hardware.
> The properties are:
>   - Setup of microphone bias voltage.
>   - Setup of the speaker pin pull-down.
> 
> Also, add the audio power supply property which is dedicated for
> the audio codec sub-device.
> 
> [...]

Applied, thanks!

[03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
        commit: 3821149eb101fe2d45a4697659e60930828400d8

--
Lee Jones [李琼斯]


