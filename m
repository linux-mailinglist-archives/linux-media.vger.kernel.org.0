Return-Path: <linux-media+bounces-13665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 079DD90E779
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B05351F21E5D
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AEA824BB;
	Wed, 19 Jun 2024 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l7LkJdC6"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB10811E2;
	Wed, 19 Jun 2024 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718790939; cv=none; b=AzPayqUw9PNRVxGhsrTNEh1AXBNjP1fW9NYFJQ7tJj59Q7474dngi3moLrm040uYhfUTVBExUwdKnD9v8VPxMsO33pVEjmClMEnQOCa61KMq2W85ECNIFt9PhVK2EQIRZvbqDVT6AbAsBEzHbh9vpNiXv/xYxzAw6SQvwsxw0Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718790939; c=relaxed/simple;
	bh=7KzSPlxyYALxvdI8aMJn+UgJvJPdMPKIQFWHPvo6U3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6+rnUhjU51hK3Ng3E+4pQyAnTGW1CAZzV962RDWYweN56sdfgtGyhmSzwUdsaOMwByYWy0rifSDVDhQGkqncukgcftgDqJl3nvFFDjok4Sq3V1cORgKVzJGAb+wUJCFFcRRw/dSopVUA7IGFeABGC2k1O5CqIK+x7Qinc64gXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l7LkJdC6; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790936;
	bh=7KzSPlxyYALxvdI8aMJn+UgJvJPdMPKIQFWHPvo6U3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l7LkJdC6/56XaMvvPV3MPI6h163PTfBk9aCiWDAy5MJkecr5TOIO10XIQQx1b4uSE
	 nrXN2r9X4gW3/Iq/XNTVo4Loslnw3SInsik6fxKwN8cIXxc31ItLpN887qTZaMvh/V
	 UaZqBSJKGsRiUSWURPbzL2JojTPgklLiylJfR6Au6vX6BCC6OGaiWBshghpcK4r9+u
	 Ltyre1n+RMtBMmjb/Hwh2qs2sXjIyMemnRfU4A4ArFUO0tMPLGnj/e4JGn7JieJogV
	 JL7X4IYKJeUO4mBq79P+SF7ok9wpjQpJxLlNZoY5Tox67VZFtsCtum95R00j9zaMnf
	 KALKDvNPvqBzw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9658237821C0;
	Wed, 19 Jun 2024 09:55:34 +0000 (UTC)
Message-ID: <f5860674-eed6-4967-abe1-ca180747de5b@collabora.com>
Date: Wed, 19 Jun 2024 11:55:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 07/16] ASoC: mediatek: mt8365: Add ADDA DAI
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
 <20240226-audio-i350-v5-7-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-7-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add ADDA Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



