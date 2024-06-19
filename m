Return-Path: <linux-media+bounces-13672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB9E90E7AD
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AFA7B22B54
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FA48248C;
	Wed, 19 Jun 2024 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BgpkkD+z"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21D80C13;
	Wed, 19 Jun 2024 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718791128; cv=none; b=ry1UmiUdcr+44k3tKOQGCuFkxhycZu/zm36oa2hQ6PwtLQ6xgLPa+ur0OdPlR0ezkihRRtqeJG3UJ8lv0RTi9XkoerHLP3TQsI4ETlYoxkmfDZUOIAG4NAuBzwoJkI6veGKVf5I6pSceiHy0akq1rzBa1ZhQ86rB0l8iKx8fU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718791128; c=relaxed/simple;
	bh=3DgwcQEpJg+efanAve5I4mMMZoiHaWnUZB/zpU57N9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEOKCOZcJDizfzp4yjJ+nFQmVf8/6eERLGZdbM0RMszPZqOch12OGhfO2NweIUkSoAxMmS/7U1oL/3jgwKA5fJgan+4xh5YQXkGW/1dHAnK/C+TfDvllA2CX4z6m2STaOsqf7kwKJQLGnAaA6MdkdVaAJQhojiO5afMl8a043To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BgpkkD+z; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718791125;
	bh=3DgwcQEpJg+efanAve5I4mMMZoiHaWnUZB/zpU57N9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BgpkkD+zwBWb+KtGZW8JOKmhG6ZpcccQWu6eAPU6eRO9Pi6z4f3mDI8Y0Zm0IFiih
	 QotGPFng1sbxYrqlgtu0MA9FIiNjbhqKyTcu0kC3Kcz9LZ1jG5TQS1buvZIXGD4UEF
	 kLszpPyzgKOnATlbm8jy0Tb7Bm89D+3ua4/1F2Z5ZQCGrd6qTKZnPubS9NuFOlsMvO
	 FtOVkJHbRW8jqWg3Qd4vXH0+MP26JIbeZSCsS/sywr5dqmBBmdwFno/HzkvViErNMz
	 HX4rGVwUHmyVuaRSjHVHcqF1vPt6PzkynBZuYRSlINrg0/vyTMXkDwol29W2IcIDV6
	 MDJbvV2I7q2bg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 985913782163;
	Wed, 19 Jun 2024 09:58:43 +0000 (UTC)
Message-ID: <6ba7aad1-0113-4e07-9420-18369ec6a79b@collabora.com>
Date: Wed, 19 Jun 2024 11:58:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 15/16] arm64: dts: mediatek: add afe support for
 mt8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add audio front end support of MT8365 SoC.
> Update the file header.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



