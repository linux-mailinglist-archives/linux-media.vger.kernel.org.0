Return-Path: <linux-media+bounces-13732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C090F189
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F371C21E12
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919BE80BF2;
	Wed, 19 Jun 2024 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dAXHebve"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F4777F2C;
	Wed, 19 Jun 2024 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718809279; cv=none; b=DukKPA+LaAL0WvrbXBgqmkIMAb7w8yscqSMCp6AlZCxdowYsO1nqQ0N/12Rvp/pzmPpNITLFEklsya1QYJy7Mguw/4GuaZd7gki/XdZkN9Yc43FLPO0dUD+djM1M3T7rOyzTbZ+ho1l+x8Cglkb8t3HNLxXqJrdVnqkBVSZJmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718809279; c=relaxed/simple;
	bh=SmW8jSoigqN6cXoH7/DH+OEqxD9eVzAWpC7UQd+YfOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRg6jn2xelRB/zlKdYh+cSgXxwu+eF/gsyAt7BExBhHktm9F+vmTVvssnxJWI8InVn3mbLE2zy1p3Um+AsrIcM1en35bvSDaNIq+TOpYNJijfMrg/79c2swftG6yBx82yVVlkL9LwANTvfb5x79+aJB7uLuh56hVL6SqGSGPDCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dAXHebve; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718809277;
	bh=SmW8jSoigqN6cXoH7/DH+OEqxD9eVzAWpC7UQd+YfOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dAXHebveT8Z0LIwwrZndAskYgi/KtH9bd+ORG3mdL1fEJCpMndK4S/UwvEFgrUVYA
	 sbWfxMS9jtr9gPUy9ZCz8bBypgNp5+H4wB1mrWyAq5Ra7A5WeDMUBbn07SVUsxoeL0
	 OuDkCK6wv8xelfg8wY2ehNC2OMQmBk6mlrM4P+uV0xzm+1dFYbFSjGAAl5htKAuTwt
	 z6f+QHvb+dw5z43BEaW7C9YTl3cNrqQst+kTNHrz8zuB8Q/qhKFUu6loz6sIg+JaFU
	 +ygZomYwr34YzE3gyG3odXSObZqVqQQXJuVZdXuhjN54/q2HM/lbD+CBDBsdtjdBNB
	 /antbN/BpvPmw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5526E37821D3;
	Wed, 19 Jun 2024 15:01:15 +0000 (UTC)
Message-ID: <27eefef0-4485-4db4-9336-2f01b9187362@collabora.com>
Date: Wed, 19 Jun 2024 17:01:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
To: amergnat@baylibre.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 19/06/24 16:46, amergnat@baylibre.com ha scritto:
> From: Nicolas Belin <nbelin@baylibre.com>
> 
> Add the support of MT6357 PMIC audio codec.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



