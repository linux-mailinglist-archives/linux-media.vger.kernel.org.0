Return-Path: <linux-media+bounces-19214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E08994506
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 12:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59383286C06
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 10:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A4818C93D;
	Tue,  8 Oct 2024 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YBVL4loc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6F18CC07;
	Tue,  8 Oct 2024 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728381834; cv=none; b=Kirjt3U6XV7ApQltGX8ZDEsy8/Q+kOyPhCWwOH2N3RNBaWEfn0lamZJoWKpoasNbiHgg9lpE3NOiAJcnUX60ln8mSfP6A2ywZUUfiLA6tt8dC+pT73WC355CmdqggYwyQRJOdoPAUZSouMqU4o0PJoMaL3sJs7Uh5bE5/nYmOtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728381834; c=relaxed/simple;
	bh=LQrj1zggaNLKMpZXWCrJ2XjfNdHhKO+CPf6FzPfAKjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+ZilglCSQpmW6s0gwvGPUzF0pNOPMGlp2CdSPb9yGr88td9F26uID80chLFvCUfpX9eu6iEpew9aK3fsrCla2ARg4CKANWox1GBChb1Nn9V2sB7TaVCbBMiAZd8bcLkEZLoOfABNm6kXivluB566iBNvwT9mq8xDNjQVC89lIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YBVL4loc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728381830;
	bh=LQrj1zggaNLKMpZXWCrJ2XjfNdHhKO+CPf6FzPfAKjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YBVL4locCVsVO56W7zsJrV9FuvAcowHX1uHU5kTM4E2F+TXgCEHnFEvj7A72yBC30
	 Yi7BAXtxBNYUUfqdDSTpvZOYHO/Ep5OSAuvNOrFIk9vRBvyGyC+is1cg1hmNjAop94
	 4uuC9DgUzq9etp00N0y9CfFjTk7yTTDTF6NggjN9KKjXajEM/iwa6UU3w3Qy8c3xbB
	 vcGC1rgMwpwQI9UzeRgIHRRq1U1mSgKEoQeZF5BwSXdrEpQvzL8R5vT+gL4YUt6Xn/
	 77BFxsz7FFTrHcoSes+gu3xO8CzvwRIykEU2hWuB4yQGJSfVyZpXy+a+F0datmC0QO
	 neNqeJQuHQAyw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E75317E120E;
	Tue,  8 Oct 2024 12:03:50 +0200 (CEST)
Message-ID: <bf94c1f2-235b-42c3-8e8f-5e96d970d548@collabora.com>
Date: Tue, 8 Oct 2024 12:03:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: mediatek: mt7623: fix IR nodename
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-media@vger.kernel.org
References: <20240617094634.23173-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240617094634.23173-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 17/06/24 11:46, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Fix following validation error:
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
>          from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
> 
> Fixes: 91044f38dae7 ("arm: dts: mt7623: add ir nodes to the mt7623.dtsi file")
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



