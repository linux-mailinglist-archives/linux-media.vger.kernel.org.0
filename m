Return-Path: <linux-media+bounces-13664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1069890E773
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20CE71C21582
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDAE81AA3;
	Wed, 19 Jun 2024 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OTUCVd1S"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F49280C1C;
	Wed, 19 Jun 2024 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718790938; cv=none; b=BpeWoVJRXI/NgM7PqLq3MXQXwnwwTked+mOnuisHG1vyV0OM+NWOsQybo54FSYrUXPeKAh7lE0fO72WjlzU0eCfnj5VS4YBTP+sQ/GStplM/p5+1rVS027atD+kzTp6xXcSckb3hA43U/2WKm/qAIiHE+/nFl2AO6C6hj2TsvVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718790938; c=relaxed/simple;
	bh=RgR7pL3q6FdzPNPxMoHYHj3+d6yEDIjf4KWYmXODHlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8ryNKrg/gmjDB3Tln6nAtK7G4a+MobKoFFKeTX0Z6ASbB1b//XPBem6Z5M+7Xy41sL/yp8HoaW14bej5fvsdgIC206eqlWGLXApc2yYqkE1/GrzmwMZ89PkRHB85Rprd3YWPpUnUJCaC0wVDAC5pJ34Kc178VyQM9T0fZNHoWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OTUCVd1S; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790934;
	bh=RgR7pL3q6FdzPNPxMoHYHj3+d6yEDIjf4KWYmXODHlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OTUCVd1SLJQ05t+OduwXHaRfIRbVoR5/XhgVJb9HsZShVz1HbDbckPUqXRF+PN2bM
	 XmZAq3vM/JSReGHz0ARFMXKO0Al8gXt9Neo6lckyi6icceTkt0bdoEPJIP3gwoBH7Z
	 J7tn0XyQinzdIGi3KEuYvZwt9A+byQtNSDm8jUPNxeVbBtITfnSPEl3NmrqapokyqH
	 g1EycX1z3VbO0s2EJbt/n4Fw4dLip+Ff9EB3lwQP7TJX0ROqfxw+bcurna5Ey6MQVk
	 Si1ZrDtvbPetpAPc8neh+R8Xr9YSigY3AKlcc+8MLiaem81Gf6dI5ufk/5rsexYzaE
	 1uCvV+6kWR2sA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CFF413782163;
	Wed, 19 Jun 2024 09:55:32 +0000 (UTC)
Message-ID: <0942a9d3-fca4-4c59-9a3a-47717111233a@collabora.com>
Date: Wed, 19 Jun 2024 11:55:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 08/16] ASoC: mediatek: mt8365: Add DMIC DAI
 support
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
 <20240226-audio-i350-v5-8-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-8-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add Digital Micro Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


