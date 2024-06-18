Return-Path: <linux-media+bounces-13563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C034F90D60C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 780791F23046
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF4315DBAF;
	Tue, 18 Jun 2024 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jmCoO3SI"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0A515CD72;
	Tue, 18 Jun 2024 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721819; cv=none; b=YSlmnqEQ2FbVIh43/enoUj3OcGyjisqrtGbuTfeulk7FNltzCWvWYUyRGc9gLcujoGnyXW08bG80zkrwV0nVeOL/IODBWzFn4qy8YbXuA67wNVIQKFEeH6Z8Ai/GpWUyTCt8PMK875M3AkXl+p266wIcKFIsYHptYQuGzJVXWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721819; c=relaxed/simple;
	bh=AZX3jLOJVEnToDsGXuWNi9vG2dyKEdoxx4/ojvn22zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ogp+q/YZyBa/ru3ObenxjYf/UybqQn9tSQKLbYYS8CZ4v7LZF/ROeOn9D4wSBJXssfFTTAP6I3jZoP6fGz9vvdEN/T41yvPaa48IUsp7Lt/vd3Q8IOq9fvhDoGLLHNvGlbFD4g+T1j8IMXlqASOv5/oMlKqwgZpcjo5iOaBTcA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jmCoO3SI; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718721816;
	bh=AZX3jLOJVEnToDsGXuWNi9vG2dyKEdoxx4/ojvn22zA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jmCoO3SIi6oHxg0EKZjZGZyaCG7LiZU6f1I3SGvaglMFAtJQ7Mwcjjve669cWFx/C
	 bhMWSEfjyebzfgV7SXQ/bklAWdZneVHuDoJci07mY9ZUdgakx25wPRZ/ofUntv/j9W
	 +KatqSgywWZGJwHqZuA5A8Gq/DeDC7JRzIgJvaNwdjHIuohBgyVQYPF2nVRx/yhOLz
	 4x+8CXrg5xhaQkMpoyPOzuMapk2yQJjH24+i93HjAFIexsHpY8ABnw/k7y4njovqdy
	 vuHn983rA/cEnzda4SrkmT3P0Hz9812PJdx6RTU3zPSFUTTCHIoF0MroWxwjXOPoPk
	 YoD1wvA/DtKTg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A25873780629;
	Tue, 18 Jun 2024 14:43:34 +0000 (UTC)
Message-ID: <03662a3e-6a66-4541-9435-98f809f1c617@collabora.com>
Date: Tue, 18 Jun 2024 16:43:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
To: Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
 <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 17/06/24 10:05, Alexandre Mergnat ha scritto:
> 
> 
> On 14/06/2024 11:31, Mark Brown wrote:
>> On Fri, Jun 14, 2024 at 09:27:43AM +0200, Alexandre Mergnat wrote:
>>> This serie aim to add the following audio support for the Genio 350-evk:
>>> - Playback
>>>    - 2ch Headset Jack (Earphone)
>>>    - 1ch Line-out Jack (Speaker)
>>>    - 8ch HDMI Tx
>>
>> I seem to remember you had review comments that needed addressing from
>> AngeloGioacchino, why resend without addressing those?
> 
> I don't see any comment:
> https://lore.kernel.org/lkml/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com/
> 

Mark, the review comments were on the v4 of this series :-)

I'll review this version probably tomorrow, or anyway this week.

Cheers,
Angelo

