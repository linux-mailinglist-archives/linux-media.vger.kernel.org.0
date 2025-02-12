Return-Path: <linux-media+bounces-26055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5124EA32452
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 12:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE58516803B
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 11:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7156C20A5C9;
	Wed, 12 Feb 2025 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RQ294yJN"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECC2AF19;
	Wed, 12 Feb 2025 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358553; cv=none; b=E0Kh6jqZfyvOjcBEzL7XbmhHFq98epP/mE1E35UA7TdT1bd5KpPb9pZy0Cejb28iU6ggemoldpfWjj6+q36NaSVYsHYxMRxiSTcipPky5GC11eBdviLlzKt97I4VEzm+6PgdjhNPl9H0F1o23hFheb+qEIgKjFwXcLaW4TkGtjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358553; c=relaxed/simple;
	bh=0WMcpkgL+kzI3wuew8Ndfo8EQnxAuf57HxbK5IfZrRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1oxY+pjxW6Mz3QeBhgQOKGoeH2/2PvyVInJPaJQ1OtDXYk5CZT94QZkfu8xis53yGOD2Pg4RyOuL/dDQRVen5Ep6khYeDuEW9rb60ZsFpKwVYvoaD2PizKcUC8D4rWd4D6J+Pva2P64WbCD3QVfm6ix2162ZEaMDlOsbA6fX84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RQ294yJN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739358544;
	bh=0WMcpkgL+kzI3wuew8Ndfo8EQnxAuf57HxbK5IfZrRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQ294yJNqb53NHibL46kTJCyFUsetkdQa7DtxTTTHDVuGx0/4KZsSMzsk99kedW5n
	 m4eMWwwVGDraz6U+Qi/7/oOqSbweyl3dHK70ClKIByimu/QHsfZfSqxk7XSOC824wt
	 Pppf0NTU5tnO8UFI207x3XF6TywPbJ6FaKhuNf3bPKE1QASHJrCbiOFtS/leBB1gJb
	 KQrviYKDPTMo7revohw/yudk54gWnPaXiLtWqT1pQEf3L76HzYgav/kzFrhbYqfVz1
	 5p+h7nY03xDZWEh0k22GXhm/NV3PTLUe7+ehX6nOt4ODo9NG7Ickcaz34n3XzOHHFs
	 6eYmuA40vR0xQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EAFF717E0FBA;
	Wed, 12 Feb 2025 12:09:02 +0100 (CET)
Message-ID: <70436de1-7ad0-41f0-a101-7373662aa008@collabora.com>
Date: Wed, 12 Feb 2025 12:09:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
To: chunkuang.hu@kernel.org, mchehab@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 18/12/24 11:53, AngeloGioacchino Del Regno ha scritto:
> This series adds the necessary bindings and devicetree nodes to enable
> the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
> MT8188 SoC.
> 
> This was tested on a MediaTek Genio 700 EVK board.
> 
> AngeloGioacchino Del Regno (3):
>    dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>    dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3

CK, Mauro,

If it's okay for you, I'd like to take the display and media bindings
patches in the MediaTek trees, so that I can also safely take the DT patch
without immutable branching, etc.

It's a very old series, yes, but it's still applicable.

Can you please ack the display and media bindings so that I can safely pick?

For display: 20241218105320.38980-2-angelogioacchino.delregno@collabora.com
For media:   20241218105320.38980-3-angelogioacchino.delregno@collabora.com

Thanks!
Angelo

>    arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> 
>   .../display/mediatek/mediatek,aal.yaml        |   4 +
>   .../display/mediatek/mediatek,color.yaml      |   4 +
>   .../display/mediatek/mediatek,merge.yaml      |   4 +
>   .../display/mediatek/mediatek,padding.yaml    |  10 +-
>   .../bindings/media/mediatek,mdp3-fg.yaml      |   8 +-
>   .../bindings/media/mediatek,mdp3-hdr.yaml     |   8 +-
>   .../bindings/media/mediatek,mdp3-rsz.yaml     |   1 +
>   .../bindings/media/mediatek,mdp3-stitch.yaml  |   8 +-
>   .../bindings/media/mediatek,mdp3-tcc.yaml     |   8 +-
>   .../bindings/media/mediatek,mdp3-tdshp.yaml   |   8 +-
>   .../bindings/media/mediatek,mdp3-wrot.yaml    |   1 +
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 313 ++++++++++++++++++
>   12 files changed, 364 insertions(+), 13 deletions(-)
> 



