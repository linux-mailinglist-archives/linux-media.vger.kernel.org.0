Return-Path: <linux-media+bounces-7460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9A8857B9
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 12:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3FC3B21BD1
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 11:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD82757332;
	Thu, 21 Mar 2024 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pi+hn06g"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF057323
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019000; cv=none; b=BzPwMjiMzXhl6j74caOUr+VstkiWizThZbDVeZc0qd/fPDEdsv+QOXUIckieilR/18XBpBRTAQiPjLFJ3+YD0I5/ChyKFnSOPbC0d7y78k1c/HP3I2x6UeELYZ06tiY8FQMbwpCPwHDyvAcIfoF5OdQY1E2vsUKyAmSN6tXfBKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019000; c=relaxed/simple;
	bh=+tLWIIOaNdzsj2JQkOMtUjhgKY/hXK7DzOdn54/Iz+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qATSZWVjqBSWYNMbMT1uXdtFEhdp0WMolB/Xa5uJ06VM1NwSrsI66ly1MaUxS/3OknixNx2SgI/v7o61npNlek0cqgo1BrzUIp2MGdJDxmWvfA33moP9pZwvoLyY71lu2ZupVnxpJdOPeGgYHSiT3NW7jV7S51RGSDh4yVxmJ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Pi+hn06g; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711018993;
	bh=+tLWIIOaNdzsj2JQkOMtUjhgKY/hXK7DzOdn54/Iz+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pi+hn06gSDaEHH+ePRCSG4RZZGeRXh7WBqvHRd/cSWE80WjLz43y9BEM4MefP6xBl
	 luFqmLwAKJM2gHL9TWXzNQt+yy5idMU9X74n0QY186FImbztQuYxLr1e7hVySeDDsW
	 6bXIFLa3D4cW+wyNV/PcuBePC5uj2OuimSl8nAcmPm1qKYFr+gEm5bvODrOWMYZwKc
	 QfBw4s89QLp8+XiG1dEpgjuVV3oksQ6UrSxhFzgMHqBshDLZ3oZjz6i9ambcMSlA56
	 sLoCkprH2TFZd/VbjXoGEh3LIRX+VSQCFPpKNa+k2iOEM6SxUpf6Dp6D9njhqUn+DY
	 tRMVy5av0Td1w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3A5423781426;
	Thu, 21 Mar 2024 11:03:13 +0000 (UTC)
Message-ID: <13686368-326a-4d62-aea4-0ef04b247386@collabora.com>
Date: Thu, 21 Mar 2024 12:03:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.9] Mediatek MT8186 encoder & media fix
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-media@vger.kernel.org
References: <20240313132019.6o6ave7mfy3sdvod@basti-XPS-13-9310>
 <17bca73f-9dd1-4fb0-a770-55244a9bd9d9@xs4all.nl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <17bca73f-9dd1-4fb0-a770-55244a9bd9d9@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 21/03/24 11:55, Hans Verkuil ha scritto:
> On 13/03/2024 2:20 pm, Sebastian Fricke wrote:
>> Hey Mauro & Hans,
>>
>> just a small media change, a little DT binding change and otherwise DTS
>> changes.
>>
>> Please pull.
>>
>> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:
>>
>>    media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-mt8186-video-encoder
>>
>> for you to fetch changes up to 48241e83cc161c24745a04c5660808b31a0ffe77:
>>
>>    arm64: dts: mediatek: mt8186: Add venc node (2024-03-09 15:50:26 +0100)
>>
>> ----------------------------------------------------------------
>> One small media fix and a DT binding addition for a video encoder on the
>> MT8186
>>
>> ----------------------------------------------------------------
>> Eugen Hristev (5):
>>        media: mediatek: vcodec: fix possible unbalanced PM counter
>>        dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
>>        arm64: dts: mediatek: mt8192: fix vencoder clock name
>>        dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
>>        arm64: dts: mediatek: mt8186: fix VENC power domain clocks
>>
>> Kyrie Wu (1):
>>        arm64: dts: mediatek: mt8186: Add venc node
> 
> I'm confused: I didn't check all 6 patches, but at least several have
> already been merged in the mainline kernel.
> 
> At least the dt-bindings patches must have come through AngeloGioacchino Del Regno
> based on the SoB, instead of going through the media maintainers.
> 
> The "media: mediatek: vcodec: fix possible unbalanced PM counter" patch, however,
> is marked as Accepted, but it isn't in mainline.
> 
> I *think* that Angelo intended to merge the dts changes only, and accidentally
> included the dt-bindings as well?
> 

Correct.

At this point there's just one commit to pick for you (fix possible unbalanced...)
Will be more careful next time, sorry about that.

Cheers,
Angelo

> Regardless, this PR is messed up. Sebastian, can you dig into this?
> 
> Regards,
> 
> 	Hans
> 
>>
>>   .../bindings/media/mediatek,vcodec-encoder.yaml    | 31 +++++++++++-----------
>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 23 +++++++++++++++-
>>   arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  2 +-
>>   .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c    |  4 ++-
>>   .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h    |  2 +-
>>   .../platform/mediatek/vcodec/encoder/venc_drv_if.c |  5 +++-
>>   6 files changed, 47 insertions(+), 20 deletions(-)
>>
> 

-- 

