Return-Path: <linux-media+bounces-15088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3BA933DDC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 15:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5CF31C229E0
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA693FB1B;
	Wed, 17 Jul 2024 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="s2WEjZpK"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0113AF2;
	Wed, 17 Jul 2024 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223798; cv=none; b=YuYnrQnHeNLpte4+m+Dodt8pwIwXQ/8FHLTn79bLsml5fG/+QQysBAPC3ZbafQWgs5bv9AbysHvzhj76jLgIFdWRlCwIiY6mOTSk8zc6H1bvRCWWQKzQ/ec+rlGUySu+55ZlgOQnHQs1RQkFrz+24PGWzrX3ZKGem0ooLT492Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223798; c=relaxed/simple;
	bh=XsjKcz7wJDMS9Op0lhw4ugrW9oIsyEt2rhrcKG9Ughc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4KuB18WF78OUr+W2Jd9W5AeuOBUT5h5cE2bfX9IQK4s2Fw6POkvfJAFReGtw9/KYPx8IJGMjoCDSKnO+wSPqZq1z1rrsXYbu5Cz1Mhq5sc/0FOZUO/Z7ELZsCA9tTaoslYAIPbR9T10TLOwmJfDTm5o/voRYzI07OrPJGj+/9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=s2WEjZpK; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721223795;
	bh=XsjKcz7wJDMS9Op0lhw4ugrW9oIsyEt2rhrcKG9Ughc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s2WEjZpKxVj3VSYPwqNLEjn0TVGfUKwUf1Vlos1NKJftWd1xo0ziwwFYTjZwz8c6P
	 py5vi7V/pO3fnPdMue9/A3KfPb0XHvHIF/1XiyzfoB6D7EAVfByBWER1lB3OTKHnhS
	 Aq5T3ln8TCg0N64d8/mIjUKaw+Gr98xOe/+w/3xo8ci/z8vFSukSnyEcHlORMXY6Kj
	 KK8tW7UCKSL5f0gVuK2gzUHyn4dnY5xNsGUAk+gj0TurFe7Fcc5PhiWbRWtP/mIs9s
	 Kn0WLUtMlsKZmwPsRYqgMfwEhnnioASeQEbB6SoUKHok+Mz+H/nyHsSJAh5dGPf4ao
	 BLiDWutrW38bQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31A3837805D6;
	Wed, 17 Jul 2024 13:43:14 +0000 (UTC)
Message-ID: <d90ef170-6c4c-4db2-9757-8e3f1cf46ec7@collabora.com>
Date: Wed, 17 Jul 2024 15:43:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: mediatek: Add support MT8188 AIE
To: 20220614094956 created <yelian.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org
References: <20240717125426.32660-1-yelian.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240717125426.32660-1-yelian.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 17/07/24 14:41, 20220614094956 created ha scritto:
> From: Yelian Wang <yelian.wang@mediatek.com>
> 
> *** BLURB HERE ***
> 
> This patch series add YAML DT binding and V4L2 sub-device driver
> for mediatek MT8188 AIE. AIE is the ISP unit in the SoC，it's used
> to detect faces on an image stored in dram. Mainly used for the
> camera's Face Detection function of MT8188.
> 

Leaving the fact that this driver is *far* from being upstream quality, there's
something missing that is essential for reviewers to even try to help you here.

What does this hardware do, in depth?

I get it, it's giving out "face detection" functionality, okay, but what are we
supposed to feed to it? An image? A stream? Encoded? Decoded? Size limitations?

What is it supposed to output?
An image? A stream? Polygons? With or without text?

....too many questions, and I'm afraid that this should not even be a V4L2 driver,
or a generous part of it should not, anyway... maybe.

With such a huge driver, you should at least provide an extensive overview of what
you are trying to implement and how the user(/kernel)-facing part is supposed to
work.

Regards,
Angelo

> This series is based on linux-next, tag: next-20240716
> 
> Yelian Wang (3):
>    media: dt-bindings: add MT8188 AIE
>    uapi: linux: add MT8188 AIE
>    media: mediatek: add MT8188 AIE driver
> 
>   .../bindings/media/mediatek-aie.yaml          |   99 +
>   drivers/media/platform/mediatek/Kconfig       |    1 +
>   drivers/media/platform/mediatek/Makefile      |    1 +
>   drivers/media/platform/mediatek/aie/Kconfig   |   13 +
>   drivers/media/platform/mediatek/aie/Makefile  |    5 +
>   drivers/media/platform/mediatek/aie/mtk_aie.h | 1012 +++++
>   .../media/platform/mediatek/aie/mtk_aie_53.c  | 2031 +++++++++
>   .../media/platform/mediatek/aie/mtk_aie_drv.c | 3613 +++++++++++++++++
>   include/uapi/linux/mtk_aie_v4l2_controls.h    |  130 +
>   include/uapi/linux/videodev2.h                |    6 +
>   10 files changed, 6911 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek-aie.yaml
>   create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
>   create mode 100644 drivers/media/platform/mediatek/aie/Makefile
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
>   create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h
> 


