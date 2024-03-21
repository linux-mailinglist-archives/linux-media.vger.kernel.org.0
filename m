Return-Path: <linux-media+bounces-7472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC28859B6
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 14:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C792F284D66
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 13:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033BB84A37;
	Thu, 21 Mar 2024 13:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="uxlNtgO1"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84D7C6DF
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026677; cv=none; b=Ovb6IJsOui7crOYij+UMriVqNagFOIQkJsXloQ/bwPbId3UA0hvj4p6skG3guhRoNvN+92Kt6c5aAZgE1GURsNJshj/dnUj3ECwGcyU5n4/NArggQ6rk936cowvqGMylXBQVBVNS78SPtkl6xINvSiKp3OPdQOg+d0e2gZZYGjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026677; c=relaxed/simple;
	bh=E4lSxIFlnR/J6pZrApxuwFkO6tbKBiRw6aNFvLS4EEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xrf8viFlRA6ohV8XJ8gHzS+AabRFelKnHkfB2y1agn3gROVHdC+m+LIqsY6Q+riMjn+e04VjWykf9vK4BDGb8yjWj3xHbn4oNotNXXLof0te3+8wDLvQmQ8ajYut4+ZiKsrFwoUm0ePQpXdfLLKbH6LD0XTL3nmVUEEuniRuqv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=uxlNtgO1; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711026670;
	bh=E4lSxIFlnR/J6pZrApxuwFkO6tbKBiRw6aNFvLS4EEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxlNtgO1J+Sm50otajDzFq7wugJqrOqq4ia/yXvmSnM2aU6fQkK2bIeeKhbXYPczb
	 azuefr0m5YQpvvG6s/3yGLIo7Cna1qVYOYPzi4skhMAXPYGEkSvDauxhD6GVtxtxoS
	 AAsLTjYDRmu6FWh32tQu62cimwzwa6uSJgQsraJZEfQR+eCDMUfjTIptCaH+ynVDTa
	 nVQQSZ5pC5P/QTr/Y/vXIp1XEV8d5fVvhBeb/AWAnEZ0UxrqLlud3wtZmt2bDymky4
	 ZSWT6xTeQsSKHnfPncT5N1F6mE9QuDlYqubpWmIOcT/AHQlH9qzYqwP85wkGNoz10T
	 E0tOGnbwnxv1g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 664F13782115;
	Thu, 21 Mar 2024 13:11:10 +0000 (UTC)
Date: Thu, 21 Mar 2024 14:11:09 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.9] Mediatek MT8186 encoder & media fix
Message-ID: <20240321131109.ynpxjuiyxxnuyc7h@basti-XPS-13-9310>
References: <20240313132019.6o6ave7mfy3sdvod@basti-XPS-13-9310>
 <17bca73f-9dd1-4fb0-a770-55244a9bd9d9@xs4all.nl>
 <13686368-326a-4d62-aea4-0ef04b247386@collabora.com>
 <f155ac29-7641-44f0-88f0-53bc9954dfdf@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f155ac29-7641-44f0-88f0-53bc9954dfdf@xs4all.nl>

Hey Hans,

On 21.03.2024 12:13, Hans Verkuil wrote:
>On 21/03/2024 12:03 pm, AngeloGioacchino Del Regno wrote:
>> Il 21/03/24 11:55, Hans Verkuil ha scritto:
>>> On 13/03/2024 2:20 pm, Sebastian Fricke wrote:
>>>> Hey Mauro & Hans,
>>>>
>>>> just a small media change, a little DT binding change and otherwise DTS
>>>> changes.
>>>>
>>>> Please pull.
>>>>
>>>> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:
>>>>
>>>>    media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>    https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-mt8186-video-encoder
>>>>
>>>> for you to fetch changes up to 48241e83cc161c24745a04c5660808b31a0ffe77:
>>>>
>>>>    arm64: dts: mediatek: mt8186: Add venc node (2024-03-09 15:50:26 +0100)
>>>>
>>>> ----------------------------------------------------------------
>>>> One small media fix and a DT binding addition for a video encoder on the
>>>> MT8186
>>>>
>>>> ----------------------------------------------------------------
>>>> Eugen Hristev (5):
>>>>        media: mediatek: vcodec: fix possible unbalanced PM counter
>>>>        dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
>>>>        arm64: dts: mediatek: mt8192: fix vencoder clock name
>>>>        dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
>>>>        arm64: dts: mediatek: mt8186: fix VENC power domain clocks
>>>>
>>>> Kyrie Wu (1):
>>>>        arm64: dts: mediatek: mt8186: Add venc node
>>>
>>> I'm confused: I didn't check all 6 patches, but at least several have
>>> already been merged in the mainline kernel.
>>>
>>> At least the dt-bindings patches must have come through AngeloGioacchino Del Regno
>>> based on the SoB, instead of going through the media maintainers.
>>>
>>> The "media: mediatek: vcodec: fix possible unbalanced PM counter" patch, however,
>>> is marked as Accepted, but it isn't in mainline.
>>>
>>> I *think* that Angelo intended to merge the dts changes only, and accidentally
>>> included the dt-bindings as well?
>>>
>>
>> Correct.
>>
>> At this point there's just one commit to pick for you (fix possible unbalanced...)
>> Will be more careful next time, sorry about that.
>
>Ah, OK.
>
>I changed the state of that one commit to 'New' in patchwork. Sebastian, can you make
>a new PR containing that patch?

Sure, as soon as I am back to work, I am going to prepare it.

>
>Regards,
>
>	Hans

Greetings,
Sebastian

>
>>
>> Cheers,
>> Angelo
>>
>>> Regardless, this PR is messed up. Sebastian, can you dig into this?
>>>
>>> Regards,
>>>
>>>     Hans
>>>
>>>>
>>>>   .../bindings/media/mediatek,vcodec-encoder.yaml    | 31 +++++++++++-----------
>>>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 23 +++++++++++++++-
>>>>   arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  2 +-
>>>>   .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c    |  4 ++-
>>>>   .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h    |  2 +-
>>>>   .../platform/mediatek/vcodec/encoder/venc_drv_if.c |  5 +++-
>>>>   6 files changed, 47 insertions(+), 20 deletions(-)
>>>>
>>>
>>
>

