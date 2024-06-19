Return-Path: <linux-media+bounces-13728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE0190F17A
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 16:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5BB1C242CD
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBB713213C;
	Wed, 19 Jun 2024 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VVycH7iB"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B147A48;
	Wed, 19 Jun 2024 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718809134; cv=none; b=T1YNuPuhteVcuGQnPIF4ntJBVTKenJnKakBSDq/L6Lzh51ZroV2T3TSFHOZVNv271RDGJwny+Dymt+pi15QEANkVZckk6h0Zv8g+/sYN/JCh+PBw9lhw36+CQPXFbWkeUkldOAIskJFsLIfEgAxdOEjtlV9k/ON5tzoIaVIMzKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718809134; c=relaxed/simple;
	bh=TfdiLpPcowkpG7DfwRLC6PoeUh74hUy4Rn14jmcYeD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMsLp/3Rn+KDfz+G1jou1k/FVJM5/+C340Ly62c62e0oc9qk4sGRo5if18NXgQpSBQ+rgzmElIhHcIafGauh5vLMokSPQjnebMA9fkMmwrGo92a8zlCuHpIrOyVhWy0NJIPLOI/KRrEJSHJbLUCBpCQ0qacM1FGKlz8jHxhVbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VVycH7iB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718809130;
	bh=TfdiLpPcowkpG7DfwRLC6PoeUh74hUy4Rn14jmcYeD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VVycH7iBwGokAILwg9+iopYPqEXQKuCGJvJoSkoHgUW7+lIoU9RM6a2zr/SsELUFu
	 gsZT8E/9r0/EgiVsJFZwKnAarWJEe1N5+FuQUadCLPer78gkgJXsZaQiSw/qrvotnO
	 tCzLAq5aKnBjm+5t3yhoeU4t4hLWQnSNFDLsjgMygeXyIzxYSTp9EPoNQB6VixQVsw
	 pOQY2V/O7YvYRcFGDZ4d/A4mbNR1CV+QzMT1Udj2372oG/n5Roe/V+X5GeJ6YJ0k7T
	 lcyjOHxqfJ348CWOoIZjRSY+tX0ucwkXgkYixxdDugxHp7mWmKurzjLPgqYgVXdtl+
	 n8Y2jskOZlBfA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BD4C93780B79;
	Wed, 19 Jun 2024 14:58:48 +0000 (UTC)
Message-ID: <32a9d7aa-4f84-41c5-ba07-50a8d4883e76@collabora.com>
Date: Wed, 19 Jun 2024 16:58:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/16] arm64: dts: mediatek: add audio support for
 mt8365-evk
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
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-16-f754ec1a7634@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v6-16-f754ec1a7634@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 19/06/24 16:46, Alexandre Mergnat ha scritto:
> Add the sound node which is linked to the MT8365 SoC AFE and
> the MT6357 audio codec.
> 
> Update the file header.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



