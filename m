Return-Path: <linux-media+bounces-13666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24990E77F
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EF96287BB9
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E44C12BE91;
	Wed, 19 Jun 2024 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OmjRzAxW"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E238248E;
	Wed, 19 Jun 2024 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718790941; cv=none; b=FMayjToQxbpUS/Rk++cKcPB24/NzUf1Y2t6kojVhlZoSKkQjDE8CpRU1fN3oKmoDWLTYSy2RaL75MfLDOvDPcnysq/1RjU3Hlk2S+PZ4A86w3tB5Zi8ZoZqhELv4MUsIIFA+IXE1thm8Sh6dKcfQySa2CJNWJT3P4dcqyUmZGR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718790941; c=relaxed/simple;
	bh=k5zFRwWLqHmR3Bl9MBcDfo6tNRRQ8+Rc5ZUSSaZAaVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KI6/6gYVv0xZra5fH9Vq/LfJcl16zy+CrB4aFRZDQR3Kxn3cxb/Y4oDotoBATP0dgE7qPKJrLIpy01CAF1zbINTiw+8ttymRYiRqyzeHJyS4g2bhddARA+mKo5gDGR7loWCEKjcANpCZcB0rRKyCqsWJt0nQA3f7E3jsbwn5rFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OmjRzAxW; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790937;
	bh=k5zFRwWLqHmR3Bl9MBcDfo6tNRRQ8+Rc5ZUSSaZAaVs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OmjRzAxWaDVNOprhuzlY+xdhrt6tm3WxAPVAdp6Si4kMylbX283Lb3exN1kNK4Qgy
	 /JRytY2OFABlBWew4u+HxUOmzKOiRf/8ErAS9WtxPIM6oFYxeko1v0DE5O/28lHgW+
	 C/xP+zZFPxuadRnrpoVjIOFjbE+7rBcC/bA6NahUAwS+uHYgo4mq+vlSbepbERXw4u
	 xKrSXuRUJ0s9UIoH5v6N3mDyo7Tq4HM6FV7wlvg5dNe0cwse5Oxus1rAwIWnjLElXb
	 EhjFQKeUoOMGN3Qe2QuS44HwIAHbtYANa8pOUYCvspfGj66ql3ypCnepP77lolatFA
	 4ZqO7q2uMEXkg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 555FE37821C3;
	Wed, 19 Jun 2024 09:55:36 +0000 (UTC)
Message-ID: <c6bbdd70-334b-429a-aa99-1df142550826@collabora.com>
Date: Wed, 19 Jun 2024 11:55:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 06/16] ASoC: mediatek: mt8365: Add I2S DAI
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
 <20240226-audio-i350-v5-6-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-6-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add I2S Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



