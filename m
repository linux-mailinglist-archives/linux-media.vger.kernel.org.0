Return-Path: <linux-media+bounces-13667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CB090E784
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5C0B1C2172E
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E9B13210E;
	Wed, 19 Jun 2024 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="4U1iitXc"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EC285624;
	Wed, 19 Jun 2024 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718790942; cv=none; b=L9+0RcqZTFPA+ADFcHCz7AeTG+IXcSCNQdEDSBPpGx5eYLQ3RI5nzxKfqVVOhIl96jdFHXwhcVDWJ6qDHEPhU2JHJ+Z3eg09v+70NX6oZ46VSLvmKd6qv0ENIVc2du/yHLkPULkHHAd4UL/jnDSwEPdJKXpCmStrdCKbU5pZ8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718790942; c=relaxed/simple;
	bh=8QGSAxGqICnLWou/+L9cSLfTKbqC10cxA2/R2kml4NY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cy2auLZi+VFhtiyJhF7PBztly3lu66aXprfMEwVt9hGJcI5JBPNnuvjQRdrrGwvFhomujxGeeL8lMp8I45wKnjAMUZlxtbUhVbge3rLkgwa9qqTHor7Vh8usXoF3ot4D2RJhO7yf516WoAm2r8KlpmJ6dCubzuDI+gFSglEmBdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=4U1iitXc; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790939;
	bh=8QGSAxGqICnLWou/+L9cSLfTKbqC10cxA2/R2kml4NY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4U1iitXcT54VVgOPURfpPAJlRUnl+Mu0calqzUgSc4HAoH0DDYbQWWumz20KyvBON
	 WrVA0o6Jt+J/nRBEN5/4UrG4GVE+58+GN26GVI+sSbuHb3plsz2KbRGu3XDPHkmk4d
	 9qjKMbQLinGy1pj9vByeTkdTGC3htSHi0b6G0voDtArQJBE932rF0dsJvrajvAe9YK
	 f6v9dDNhpWoIUWSlrJVzTrxupXi5pCp7aLKPMqlaZ3YGcN8VnzGTi6Mx/UJAKnkv4a
	 wXhK1QFxT4hMR3ac8i1u09mcBizCCq+5TGVaupwQId2CDlFJWWWH3yshdZ0JH1p3OR
	 nELPCN848J/kA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1CD9537821C7;
	Wed, 19 Jun 2024 09:55:38 +0000 (UTC)
Message-ID: <cef36b0a-eb50-43c2-9a28-252502fba99a@collabora.com>
Date: Wed, 19 Jun 2024 11:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 05/16] ASoC: mediatek: mt8365: Add audio clock
 control support
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
 <20240226-audio-i350-v5-5-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-5-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add audio clock wrapper and audio tuner control.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



