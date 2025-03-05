Return-Path: <linux-media+bounces-27604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95104A4FD40
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D205D3A4127
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CE9233734;
	Wed,  5 Mar 2025 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="MEhKF3Ax"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D9A23314A;
	Wed,  5 Mar 2025 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172995; cv=pass; b=BPnQDdK/IKIwa6ZT0QzcYEA2wHmFdtPHhCgkKiVnsCRyahrdviZsQ5ELAkTz0rYRJYTFq/RzPIvdEkbzyiSNjNyQNabbFPK9SY6gssKuBZGRvcwA7yjKeznxC7wAnE0/GLM7MH9e1Vh7i32/ydJIOObryLovNr4Gla4LpAhz9Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172995; c=relaxed/simple;
	bh=jRhn9QLmpYRvSUIKgnwkpPtTnchm9qPvZJvpvPUlDNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vp8ULcqTx9IIBiHAC0++9qLY3laLPYNVh7D+PxQtal2c1kP1ExZGDm6pz450me7rLIrBuPPtiUDb9fPcHwhYt2FLZKoMw4PLLvAk/I86MljVS584HiBvQ13w09NLJiWilTxFbOgHvmZGXh1UTWmrAApOc/qbvvtKHt/nPdccILA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=MEhKF3Ax; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741172946; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZTUYJn29glC9vvUfcOfxW13mevM1V8V0v7dxFnI4YHIdMNrt5mm5q84KSOo33+VW4JQm9tOiFmmr9j+x7cgqxCDo1sy/jmipmV4wqDLhqYZ+pLm8TBZrXqHnWOPi5OmHxoX7Vwhtc12lsvDMwM1DecqU3sgnh+Uc9V4Lgx6CO6Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741172946; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1QzXkuu/q5GiJN30wSGE0+yL0Yhr9XMU57s5jrdhvAA=; 
	b=nPCFfxJMonpZzXyhib2hgPGPXvNu76+XP24uIpaUaE3+kdB/0OsqrBvSTFycDNh43DMeRmPKgSwZ+/8yKC8gHieelMuK0bUsu//T0Xv+ONo1EOJCV4YhgcqhFXZ3cMfCbvsZL9XHkHBxUZt13C8HouwnmSG2cfHF/1YHywAA4q4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741172946;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1QzXkuu/q5GiJN30wSGE0+yL0Yhr9XMU57s5jrdhvAA=;
	b=MEhKF3Axe1O7AWq4XpWTTgOY+tP4S7KJQfblgQ2/+qxWDooPsnQo36bpHcslg596
	NfOqumBStSvnxYHdUnh3Li766LL0nLhj/rsoqNuQw9SJrs+4iuNqdyu/8o7Ce1Vn92U
	xsL6hyQHEjYjhY6za4pfuyCBIpgC75tGaYy29y/M=
Received: by mx.zohomail.com with SMTPS id 1741172944911622.394610948164;
	Wed, 5 Mar 2025 03:09:04 -0800 (PST)
Message-ID: <d41bfc24-2787-4bae-aa8e-352899be097b@collabora.com>
Date: Wed, 5 Mar 2025 14:08:58 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/6] arm64: defconfig: Enable Synopsys HDMI receiver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
 <20250225183058.607047-7-dmitry.osipenko@collabora.com>
 <a8a6c8c8-ee3b-422a-8573-a2cbb61fc3aa@xs4all.nl>
 <863f9c1beb7a912f94f8740b3e5095e09e49cee5.camel@collabora.com>
 <cade5c73-e25f-4f56-be10-7d5a06f92917@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <cade5c73-e25f-4f56-be10-7d5a06f92917@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 3/4/25 19:17, Hans Verkuil wrote:
> On 28/02/2025 04:51, Nicolas Dufresne wrote:
>> Hi Hans,
>>
>> Le mercredi 26 février 2025 à 09:31 +0100, Hans Verkuil a écrit :
>>> On 25/02/2025 19:30, Dmitry Osipenko wrote:
>>>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>>
>>>> The Rockchip RK3588 has a built-in HDMI receiver block from
>>>> Synopsys. Let's enable the driver for it.
>>>>
>>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>  arch/arm64/configs/defconfig | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/configs/defconfig
>>>> b/arch/arm64/configs/defconfig
>>>> index cb7da4415599..3dccc9e1c4aa 100644
>>>> --- a/arch/arm64/configs/defconfig
>>>> +++ b/arch/arm64/configs/defconfig
>>>> @@ -859,6 +859,8 @@ CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>>>>  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
>>>>  CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
>>>>  CONFIG_VIDEO_SUN6I_CSI=m
>>>> +CONFIG_VIDEO_SYNOPSYS_HDMIRX=m
>>>> +CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID=y
>>>
>>> I do not believe it is a good idea to default to y for this option.
>>>
>>> The EDID depends on the specific device you make, and you should
>>> think carefully about whether the default EDID fits the needs of the
>>> device.
>>>
>>> So if you want the default EDID, then you should manually select it
>>> and not have it autoselected.
>>
>> Following up here, from the device maker perspective sure, but I'm not
>> sure this is the best choice for generic Linux distribution. As of
>> today, pretty much no userspace capture software knows about this,
>> meaning the device will not work out of the box in OBS, GStreamer,
>> Ffmpeg, Web Browsers. In comparison, if you pick any UVC HDMI capture,
>> it just work, with a default EDID that covers the range of
>> capabilities, which in this case are defined by the SoC.
> 
> A UVC HDMI capture device is not a good comparison: that has it's own
> EDID that is configured for the specific hardware and USB bandwidth
> limitations. EDID handling is all internal to that device, nothing to
> do with the UVC driver.
> 
> That said, this device is a bit different compared to most other
> HDMI receivers in that it also has a DMA engine. Usually HDMI receivers
> are i2c devices that connect to an SoC. In this case the hardware is
> inside the SoC. So I am OK with making LOAD_DEFAULT_EDID=y in the defconfig.
> 
> So:
> 
> Acked-by: Hans Verkuil <hverkuil@xs4all.nl>
> 
> Note that I will merge the v13 driver (patches 1-3), since it looks good.
> 
> But v11-v13 of this defconfig patch dropped the "CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID=y"
> line, so you might want to post a v14 of just patches 4-6, restoring that
> line, once I merged patches 1-3.

Will post v14, thanks!

-- 
Best regards,
Dmitry

