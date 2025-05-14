Return-Path: <linux-media+bounces-32484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D52AB6C06
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FFB0175CA2
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D1D27A112;
	Wed, 14 May 2025 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AB56yxbE"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A092276037;
	Wed, 14 May 2025 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227763; cv=none; b=Y3sbv36dtMrcbesiEWslOLaQEc1uArOpbCmNVFrRN5Uk+Bb5Z82HYxpxFEkHV8oXAdisPev+MR2dsuWdKs0fedZod2DFT9k88PgAJYIAYi4jCNtLWlB0y90lneKMBxDI0S6E/fWKMg4x4Hvoqkt297jwhXNMQ4W4HJ0moctYL5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227763; c=relaxed/simple;
	bh=/qgL9c72UjfK/aScb//liTBZpBmD9llnpoWSPimdNJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UW2ueG9cw9SuvX4g+uEPZmmC49hwu2A03d67lRpEASn97UDTVLXKRroH6z4JEhS1H+2zA1ZbTJVMB9HtoSd+q6kUX41eu1aUXB+Y09PIdU/HHkv7B+9IcEISQSNP4y1RXwcGA0lyG3BHag7IjzuTHUhc1U7xTOrXNuaJruVuak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AB56yxbE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747227759;
	bh=/qgL9c72UjfK/aScb//liTBZpBmD9llnpoWSPimdNJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AB56yxbEJYn0H4B4CgSrglHvjNBBLYJTQw+pf4JzTL5dEQN/zruyvWMOrPRn4YQ6M
	 LSZrnkND0Rgs8VxCBy85DAi6tBnPo0weRB8hfDLI2YGEbE6ObujIDWj3wzsaZDZpBm
	 4YcrTZ7Jk+IpYed2/Rb8AGfHHSxnTgMpuVgF3WDgoBBSuLVn4NE9RQmDpVkaWOw07F
	 INpOC1hvLH1rUVVcBDo80bGCmCa+kaRB8FyolRSeIz+7ex3uByepG2bElkiVMVicY9
	 90heWpuyL/lFesm7zVzTybdU5rHiQl7Q2KapWjzPFbRduc2sBfhMb6CaL5Er2H1eq1
	 whDJRvQd4wEsg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B818017E0509;
	Wed, 14 May 2025 15:02:38 +0200 (CEST)
Message-ID: <0d530e65-1c22-4538-9234-802541e5326a@collabora.com>
Date: Wed, 14 May 2025 15:02:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8188: Add all Multimedia
 Data Path 3 nodes
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Chun-Kuang Hu <chunkuang.hu@mediatek.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
 <20250514092259.47035-3-angelogioacchino.delregno@collabora.com>
 <439db3ea-4fb7-4944-b182-222663c09b3d@collabora.com>
 <CAL_JsqLwXwmt5Smutvv+V-HfLzgYCqb-YRVx9ydD7rfmkiWoeA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqLwXwmt5Smutvv+V-HfLzgYCqb-YRVx9ydD7rfmkiWoeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 14/05/25 14:56, Rob Herring ha scritto:
> On Wed, May 14, 2025 at 4:26 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 14/05/25 11:22, AngeloGioacchino Del Regno ha scritto:
>>> Add all of the Multimedia Data Path 3 (MDP3) related nodes
>>> including its Mutex instances, one for each VPPSYS block, and
>>> all of its DMA controllers, Film Grain (FG), HDR, Adaptive Ambient
>>> Light (AAL), Frame Resizer (RSZ), Tone Curve Conversion (TCC),
>>> Two-Dimensional Sharpness (TDSHP), and others, enabling the entire
>>> MDP3 macro-block.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
>> Rob, sorry again for missing your previous email about the warnings
>> generated by this commit.
>>
>> I ran a dtbs_check on this and I didn't see any warning - can you please urgently
>> check and confirm that I didn't miss anything on this one so that I can pull it in
>> the MediaTek trees for a fixed up PR?
>>
>> If anything else is wrong with this one, I'll have to just drop it and delay this
>> for the next cycle as it's really too late (my bad, though).
> 
> Thanks for fixing.

Thank you for the very fast ack, highly appreciated.

I have just learnt that Arnd accidentally pulled the branch anyway, so I will
have to resend this as a fix on top - it will be just a diff between the current
one and this commit that you acked.

I guess I can retain your ack on the diff-only commit, as the result will be
exactly the same as this v2.

> FYI, Linus' and next trees are tested daily here:
> 
> https://gitlab.com/robherring/linux-dt/-/jobs
> 
> platform-warnings.log has the top warnings and undocumented
> compatibles by platform family.
> 
That's very useful! Didn't know about it - thanks, that'll make my maintainer
life easier. Bookmarked!

Cheers,
Angelo



