Return-Path: <linux-media+bounces-13668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E24990E788
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5761E1F23347
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563CA1369AA;
	Wed, 19 Jun 2024 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NqEf3yl5"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58953134402;
	Wed, 19 Jun 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718790946; cv=none; b=dk5SoW+i6fPfM/efMF8rmyc5w/RCVkCgv6lXYAGEDlUCFUjHWAuVLtsXP0rC1cAEb9Aer+dFs1rvB+xdGBd5z9PhaLXCogIttUKPwCOXMlydZxr2D0FYzLh0D0yyAZGrdpMI1ZEZ8jgFqjpgyCOpDBuJuVyTO5VMQwgdvc5yzaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718790946; c=relaxed/simple;
	bh=8Fb5oLq+wj7onkMLOYYldQHhtPuVpDgA5L+9vUTFoUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HK+y1vHkOIuAgkbb1sX0s83VpYfXXIXny+uvTid7LqxjWGDZMDi6GUtGk5aPPcezcPaQjncRtZoWuJnU1UTEOsNR1hg0mtReZNdsR2+Y6+FaHs2/PuD7atMBqe7TKDr8FGQta6qTOvSZqC5dub5a9Of7V16dv0GDDQvf1uX5Qeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NqEf3yl5; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790943;
	bh=8Fb5oLq+wj7onkMLOYYldQHhtPuVpDgA5L+9vUTFoUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NqEf3yl5Mez/C70kftx/epL79UnYIMK1Sorzh+2wYsAOzJT73u+d4gL443z4PN+hH
	 69TRr5FYO1lJ01RL021soEJQJM0CH1LI2j/xwZAPmEEtPF3xdOiCb/NCaL15guWLtv
	 K4e1cpESaw87RbulnDMyue+D75P2NqZzpKwd00o/h9POlLdS9IkB0N0ptLxTLJ4qBF
	 hksf+ALzOiMVsrGNqeLsWZ00hqkuemZV0uK+A3pgV4mpf/X/ny+cQ3H6TWT3OxLUzL
	 dggsQ3PFTAcHaoDVb/i33HPpadNWuc81jRxfpaAmk19FwItHMRcPnzS4YimGgzb9Ts
	 jibMHxsUirvCw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0EB5937821D1;
	Wed, 19 Jun 2024 09:55:42 +0000 (UTC)
Message-ID: <584857e3-a1b9-4dd2-9d3b-f4d76ccf1cbd@collabora.com>
Date: Wed, 19 Jun 2024 11:55:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 01/16] ASoC: dt-bindings: mediatek,mt8365-afe:
 Add audio afe document
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
 <20240226-audio-i350-v5-1-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-1-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add MT8365 audio front-end bindings
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


