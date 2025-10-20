Return-Path: <linux-media+bounces-45010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10725BF04E4
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 11:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D8723A379A
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A98E23AB9D;
	Mon, 20 Oct 2025 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V0pFhusg"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A343A146585;
	Mon, 20 Oct 2025 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760953578; cv=none; b=rqZj5GkoU9Wr8ROMPQYwWYtSFP3irE6GistwJVGZJVk7zUDXXVJW5cgegqWw3bZyootRkUgLXASllmibhsymbQB34pExXywcywAz4z5SS1vW5bm5bL/bFQw0di/KLkprvPEWXEftbRs9BIvfbNv15ARf52PcJEuOgg7uUByPusw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760953578; c=relaxed/simple;
	bh=jImzS7kzdcSLp9Jf+2/whVppszQvlgg1u1y3EIe5sjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSYwZlPsF4oPjfvJPd6ffY94JOKXrcbPsATWDxlT+kFKJlM4QBb5OkBcpredFs8+RfgRMAowPiSbQR4xyi5HxICcVG/JgL0QWQ0kHkAyl28ij0f0nBYODwyGDHzcduec5Tr0SxhWZ76TmIdJT6IFSvS0vuHayFwjJAQjcieLpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V0pFhusg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760953574;
	bh=jImzS7kzdcSLp9Jf+2/whVppszQvlgg1u1y3EIe5sjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V0pFhusgmorb/EI/Ff3qSALsH+A4wCvTsjbW4TxYmOYLbRf1iQLt0+7ZcKSynNJNr
	 VSKmlM7OTEBSWmkM3ZOy5inFxIhvkWlrHbcTVa2Q3E7RrKCn2TaDnw8aWBuQlzdevt
	 aszck1+q3M1v6YhWjGTclgROU1xcZsKybjEMFXp8cZ5/AkveIbIm4iHorglYqYN7sR
	 MEt8DkpKHFowsspj6uIBFP3DM7IcxElvUgz+gwCg3g4LynJa5MV1lQKIbreLhIID4+
	 awTbLhAerc2fOavsIGw5vKeLlaySd010Ptc2Ve0u1gNdtyv5ppLzRZOatOU1fL5HnU
	 IzBiyEfDm1QwQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFF3F17E0DB7;
	Mon, 20 Oct 2025 11:46:13 +0200 (CEST)
Message-ID: <4ed4e704-ba0d-4d72-bbb1-0bcbfba2dc11@collabora.com>
Date: Mon, 20 Oct 2025 11:46:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/20] arm64: dts: mediatek: Add GCE header for MT8196
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Add GCE header define for GCE Thread Priority and GCE Event IDs
> that used in the MT8196 dtsi.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8196-gce.h | 612 ++++++++++++++++++++++
>   1 file changed, 612 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8196-gce.h b/arch/arm64/boot/dts/mediatek/mt8196-gce.h
> new file mode 100644
> index 000000000000..457dc73aeed3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8196-gce.h
> @@ -0,0 +1,612 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *
> + */
> +
> +#ifndef __DTS_GCE_MT8196_H
> +#define __DTS_GCE_MT8196_H
> +
> +/* GCE Thread Priority
> + * The GCE core has multiple GCE threads, each of which can independently
> + * execute its own sequence of instructions.
> + * However, the GCE threads on the same core cannot run in parallel.
> + * Different GCE threads can determine thread priority based on the scenario,
> + * thereby serving different user needs.
> + *
> + * Low priority thread is executed when no high priority thread is active.
> + * Same priority thread is scheduled by round robin.
> + */
> +#define CMDQ_THR_PRIO_LOWEST	0
> +#define CMDQ_THR_PRIO_1		1
> +#define CMDQ_THR_PRIO_2		2
> +#define CMDQ_THR_PRIO_3		3
> +#define CMDQ_THR_PRIO_4		4
> +#define CMDQ_THR_PRIO_5		5
> +#define CMDQ_THR_PRIO_6		6
> +#define CMDQ_THR_PRIO_HIGHEST	7
> +
> +/*
> + * GCE0 Hardware Event IDs
> + * Different SoCs will have varying numbers of hardware event signals,
> + * which are sent from the corresponding hardware to the GCE.
> + * Each hardware event signal corresponds to an event ID in the GCE.
> + * The CMDQ driver can use the following event ID definitions to allow
> + * the client driver to use wait and clear APIs provided by CMDQ, enabling
> + * the GCE to execute operations in the instructions for that event ID.
> + *
> + * The event IDs of GCE0 are mainly used by display hardware.

..snip..

> +/* CMDQ_EVENT_MML1_FRAME_DONE_SEL0 ~ 15: 284 ~ 299 */
> +#define CMDQ_EVENT_MML1_FRAME_DONE_SEL(n)					(284 + (n))
> +/* CMDQ_EVENT_MML1_REG_UPDATE_DONE_ENG_EVENT0 ~ 15: 300 ~ 315 */
> +#define CMDQ_EVENT_MML1_REG_UPDATE_DONE_ENG_EVENT0				(300 + (n))
                                                     ^^^^^
There's a typo here                                  (n)

Please fix, after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


