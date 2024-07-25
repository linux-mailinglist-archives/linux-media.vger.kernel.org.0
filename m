Return-Path: <linux-media+bounces-15349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7912893C72B
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 18:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF6E01C20E96
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 16:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F020619DF6D;
	Thu, 25 Jul 2024 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8eboKwt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4366619DF6A;
	Thu, 25 Jul 2024 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721924946; cv=none; b=jUE2PrGdoMkrBFe0K7sJSvNdP7CMZejX9mj0HCzECsWGagrjTzBnB6riq1X3IUUX27zAJgfkBCfOtlwCrhZU2oZ7za07wlwrWgZVHprZvLURVW7Ld4VgafMsc76hlXo1pjVlIHNN7eZbIZHogtJc977P2yEsBznHkkWQcJVmX0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721924946; c=relaxed/simple;
	bh=6M9VEwQ0bCBbEukoo/UWmk3UpgsSaKDRg0kAVMformg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k15tnCszRIEwXV5CZMshEIg7gxTAtL7mkRm1cWism6qoz9Vdkmp+FxH3+s5VXQbUsRsKzalLKilpIVUuF61oyJuKy7wznqKcOyTOyBX4DY4b6DMpKcAwAfe+UOoTXWZSfzVGeujl+oQIfiuJc1SwpBZq9LMFQHccqvWev78NxCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8eboKwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E65C4AF07;
	Thu, 25 Jul 2024 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721924946;
	bh=6M9VEwQ0bCBbEukoo/UWmk3UpgsSaKDRg0kAVMformg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T8eboKwt63bDwOUKiZpVQxR38fh1QOLlVI2F7pPUT9mbxxqyWa4EvKAxGnXp3/CbV
	 n/Scg7QCtvteXcE5w/IHr87pLi4oVXk/ngNMgo0Rn4fYa8bj81/xOVUcM0IT+DRUIM
	 0nNQ/NJZ628zHQdrwnbQ8mbRYdMwG+EirQiVeVKitq/yRyPjpXoYPeDQhJ89JxLpUD
	 Kl6l+btIgr5OZZ6WKKpslw1c9LKaB/IC+xrnw5IQM8cgW1zGqsf56I+FEqfVhhRls5
	 QhGGBlKzaxr2E2O/wRrA45cbF6fCq+rT2KQhAjP80z/YOMguStbJz3vP7RbvfbBEsQ
	 g9db7e7JW4xew==
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
In-Reply-To: <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
Subject: Re: (subset) [PATCH v7 03/16] dt-bindings: mfd: mediatek: Add
 codec property for MT6357 PMIC
Message-Id: <172192494107.1054722.15668367028139729556.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 17:29:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 22 Jul 2024 08:53:32 +0200, Alexandre Mergnat wrote:
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


