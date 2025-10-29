Return-Path: <linux-media+bounces-45937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAA1C19F17
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 12:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F16B05036A3
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 11:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D312132C92A;
	Wed, 29 Oct 2025 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ancwp3/X"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C9932ABFA;
	Wed, 29 Oct 2025 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736375; cv=none; b=jhY/0EzObcVM77JyxHuTzqkQLfyDIlkAKFC3tRohtJLk+tfU0kXl9xjNKvV4C630O2unbsN6RWpEXKS/j0OLfbj4/izU352erpFomBGQRTx7m7JZgWjaPua2sRzJft6QG+nnF1mrrwsVwFpYqebT+EaF01PCDeaIhrJuW5RcSZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736375; c=relaxed/simple;
	bh=s35qvMWiPZye3mUq5eDEkpYwlGbij9U1I7wTMhBYFyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Jco0aGNuuvTKDNwCAOL+0t7QbGLAAllHlg1f8jUkNfhpska59kkl37bUcBsbZIO0dYXdPfxOZMzodU3rzQ8uCLsV3Is8KJkkrrBq654wvUh56Lq7r2dc4+AlI6M1HRlFwP16k/dtQey3Zl/H+DvofmD8fSBU7Cu+TPJ2RajN0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ancwp3/X; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761736371;
	bh=s35qvMWiPZye3mUq5eDEkpYwlGbij9U1I7wTMhBYFyI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ancwp3/XUPKjTQvDhJuUU/IpaBlsnpvEiPhZsSTX2lmXUrROvRFfktCfKVyYdFuAk
	 57F0XzYcMuB8hr40V6pD7NAbiOjIkUwf4r0b6Yd2ucGNYhWyfU5SbKxLifyscl8a/W
	 a9S2E1f4CwNWV/ufrd7uWNuyVY2JQALxqu5ND4GIsgRpwQRW8Fbu5cZb83+K2tkk/S
	 rlUMaBiaVCpgAS6+ocypqSOcomhDaBQnEqKJm6YPbtOMfmIFjl9hWVXrL4OlfGfn61
	 pDmZ5eVgmCKit0O2HtSRPEkOh4OI+Fbfq7vGTFKgFFMquuqfdavABm3t6QUrF957fk
	 BlMl0l1gxsUpA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D41B317E00A6;
	Wed, 29 Oct 2025 12:12:50 +0100 (CET)
Message-ID: <0ddae136-3c25-4d70-9bc2-4e423873cd43@collabora.com>
Date: Wed, 29 Oct 2025 12:12:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/12] media: mediatek: jpeg: fix jpeg hw count
 setting
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251029065354.22257-1-kyrie.wu@mediatek.com>
 <20251029065354.22257-2-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251029065354.22257-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/10/25 07:53, Kyrie Wu ha scritto:
> Different ICs have different amounts of hardware,
> use a variable to set the amount of hardware.
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> ---
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 8 ++++----
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h   | 2 ++
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
>   4 files changed, 8 insertions(+), 4 deletions(-)
> 

