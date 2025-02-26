Return-Path: <linux-media+bounces-27006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C88A45A0B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A9CE7A58BC
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B52822425A;
	Wed, 26 Feb 2025 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="IPc116QA"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80F31E1E1C;
	Wed, 26 Feb 2025 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561919; cv=pass; b=gmzxwS3zvgBnJMYQLkkJGSRroHVzgwCg2ia96s8w8UEAawy484kUa4mT94VrfVHC8HTvVbndqRXbnCShM3mUe8GFOdq6zchoX643zATKp4f1U+ceN7eaqAVN9B+Luc8FUk6aWWHU/i6zlWFYeQAH5b0HQ7h4X4K+S8aZVI/tGGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561919; c=relaxed/simple;
	bh=oUOx9Kz4dvI/7dVS3nn6fCIBr41Arep8TQVo5tX9YAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D52LJL4oXbjl/Zciapvc+o+2TxgQA09Ih5fZbIhr49X5AyEsConU6KxYkERObMMeKpvBO2tMHQw5LWCwJ1MWQU0TmqGhJ+hP7i4EMWECf3oNd1C78itaMk/T/jCm4WX8TkvjjiO8r8PlbujhH5qV0G/Es4yBqrFN8m4j2V/IR38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=IPc116QA; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740561869; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KCb4NYylXhPLcCtlRcYxc2+z9bebyyP+zFAmiQalFIagup8Quw7gnJKP7jTHxQU0+lpnQpUUro5KDs6MencGDmVmi2qdR9RrEVud6II6I2Sc3RbV0dZg31zeZ9iZ+zLVrGHVmAWXAxrknuXh3tdASgc58XBSmcQdbRTHYC75PiU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740561869; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v64rHJTOh+QwNJ4+f9WHe2WqRnNhrh1i028ev/E/4UA=; 
	b=G2Ue4d+GAqNUqs+LcfxCg245SIt8MpZIeoxf+Ao0FHlqh7Tfrk7AhRyyOUGzbdbXK2iG0T6OLTK/Tg9pjtxghwb/Q/Hlw907glvdm12sPETGLSIyA8vAxH/iBNN4j69vkW6aMy7Gx63Ow27lP4LNwGdEqkYIcVrXNA2ysQyl+RY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740561869;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v64rHJTOh+QwNJ4+f9WHe2WqRnNhrh1i028ev/E/4UA=;
	b=IPc116QAWR1v4ByKA2qDn3rrCNPzPMDE1INUy2HtcYZsytOJAiXcMSxkS1qvbAe3
	c7yw7et10rmf3w5cr1Ihh6OzuPn5h7dyhIfPJw/lAIyJA15tChzlM25geymHHHLPasO
	9fSNIQEPGHuLV+PFltoL0k0hxW1zwFXYd7VXPssI=
Received: by mx.zohomail.com with SMTPS id 1740561867817714.6694770539592;
	Wed, 26 Feb 2025 01:24:27 -0800 (PST)
Message-ID: <ba3bafcc-b7b4-4237-bbeb-b81c0c9328d0@collabora.com>
Date: Wed, 26 Feb 2025 12:24:20 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/6] arm64: defconfig: Enable Synopsys HDMI receiver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
 <20250225183058.607047-7-dmitry.osipenko@collabora.com>
 <a8a6c8c8-ee3b-422a-8573-a2cbb61fc3aa@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <a8a6c8c8-ee3b-422a-8573-a2cbb61fc3aa@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/26/25 11:31, Hans Verkuil wrote:
> On 25/02/2025 19:30, Dmitry Osipenko wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> The Rockchip RK3588 has a built-in HDMI receiver block from
>> Synopsys. Let's enable the driver for it.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  arch/arm64/configs/defconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index cb7da4415599..3dccc9e1c4aa 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -859,6 +859,8 @@ CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>>  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
>>  CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
>>  CONFIG_VIDEO_SUN6I_CSI=m
>> +CONFIG_VIDEO_SYNOPSYS_HDMIRX=m
>> +CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID=y
> 
> I do not believe it is a good idea to default to y for this option.
> 
> The EDID depends on the specific device you make, and you should
> think carefully about whether the default EDID fits the needs of the
> device.
> 
> So if you want the default EDID, then you should manually select it
> and not have it autoselected.

Ack

-- 
Best regards,
Dmitry

