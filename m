Return-Path: <linux-media+bounces-13669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB3490E78D
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804C01C21755
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1641813A263;
	Wed, 19 Jun 2024 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RBCHa7Vh"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1BE136664;
	Wed, 19 Jun 2024 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718790948; cv=none; b=NXJgK55g8rdQJt6T2gcmjSQUBgHJk+4dlR4gFBf533yNrEKicJdqwJnuwYhIJ2M3DlazEN/0oHPNWLQamOM7C/vaUedYdhVfL9dd3U2tFNSolryQhr1b0yIu0dc0YV3W8K0pbA0HTVQGoHRdwhDnIIerlVi2j6XJIS30nSYm61o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718790948; c=relaxed/simple;
	bh=ccqhkRQ+dQDXGIwdq7jXyziveJY0PrkdcAxZPvyIbTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XvK8v81SOT9r3WSICkVEb8BY9arZIHoxz80lqG139jEIg3iB7LTsrrZNDYXLH9DgngpzGxm9SR07HI9g0PWsfmxQIgCtA9Qz+NKT2X7PlF1MBl3ZNhYGFxvGoBBwA001xd8f623MC6bLxwehjTs7ZpZHnD/SwmY8FkvrEmswYpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RBCHa7Vh; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790945;
	bh=ccqhkRQ+dQDXGIwdq7jXyziveJY0PrkdcAxZPvyIbTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RBCHa7VhJYw8kadFFaI+Ln3q8ur+ATI4w25Yt2Gbdae+K2y3x4GuxKnx8rBmN1+v4
	 dyxQASh9VmMXW6DpeFmKCkFEWGhLDQGGTPzpz0QYWVICqC5x8kc95koTD9690ZbCQP
	 9KVKaH4Rj5zWmt5frlNGuEeZjzEgItA2O9ZXjeukYEKFwTP/XcspByJjeqmKPIzIct
	 XAmfSS3NxCo2zFKtDo498Mco2RjrVDwEAknkzNiXug63KHFbWBSgORG57oGd44cboC
	 r2OEVNEXL5A2HNNSVynqLImvhUt7aNzgUjvEvKXTO8nkt7iRuMRKADokA0a/Q3t0BI
	 gDvZDSIQjSBYA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DB8F537821CD;
	Wed, 19 Jun 2024 09:55:43 +0000 (UTC)
Message-ID: <c5f7cd1f-e2a2-4055-8d0a-9da320ff591f@collabora.com>
Date: Wed, 19 Jun 2024 11:55:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 02/16] ASoC: dt-bindings:
 mediatek,mt8365-mt6357: Add audio sound card document
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-2-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-2-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



