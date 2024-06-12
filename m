Return-Path: <linux-media+bounces-12995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E52E904C62
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38A71C20D3E
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCD616C69D;
	Wed, 12 Jun 2024 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W+CSOz6R"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB83167D83;
	Wed, 12 Jun 2024 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718176106; cv=none; b=RgtB56KNp6xzqbFfbkg09n1/U7igZ/eD/ZosGDNLNItPVl0kYGVIGs5U5pulRojrVZH2I3fUuiOnVmife98sTCytSZ6yPGX3hNlPmX+BUkLEGY1CYP0jiBjzBNIh/smLzqLY+jB1npyYwfreaUUTyRLqwaPggZMjMv4M0WAs80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718176106; c=relaxed/simple;
	bh=//Og3yNNct5s+qvAY63P4nOlV4F+BI4Wqr+wdE+gKRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgsqGp2hTmJwHQaDOQ5uD7gXNhFaq1kHVN6VKxfai6Y8PV6VdDGHPckEPpAVvJPtYdKLvVIBQ5qS84O+xibOf0XxNfqIiIFsvJbNe2kcnRmNsuEToztXPcPuG5v1oxqJauvU5sqxkRisVJsKaNcJmaoJ54iS43pr5LC0nUnMtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W+CSOz6R; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718176103;
	bh=//Og3yNNct5s+qvAY63P4nOlV4F+BI4Wqr+wdE+gKRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+CSOz6RWOhjmtt7FonzKe31KmI+0DaHUCNMbXYudiD+rAs6TkevF7et0NPNYaU0X
	 SxyExyd2eYRO7ieAQd+VWfmvW6Cz3cjYAbtU5RoIDcgc7+QsX7vsYAf4YuE0W43/Mn
	 MNBz0LNtCNQZWq9Jd3ZgYI7SLbhaLF+upoFeLzh/8TlH6RjR/W0XRr0HHwmBKj93XH
	 bQexNVFcMf+t39+lrMvIMY/HzqKRgzTgSrstY6BU1yi35TE4r874cZ61McR9xQlMkq
	 DlUK58AkWirolwOfkHDKlcjEN3jN+AsZUaljcMcik0Wokw60M+wpF58APSAHUjq6XS
	 SqU1oUksPYYbQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6FC1D3780016;
	Wed, 12 Jun 2024 07:08:21 +0000 (UTC)
Message-ID: <8621af0e-a7fc-4df3-a887-add23aed9c10@collabora.com>
Date: Wed, 12 Jun 2024 09:08:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: dt-bindings: i2c: add Giantec GT97xx VCM
To: Zhi Mao <zhi.mao@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hans de Goede <hdegoede@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 shengnan.wang@mediatek.com, yaya.chang@mediatek.com, yunkec@chromium.org,
 10572168@qq.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
 <20240612012019.19078-2-zhi.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240612012019.19078-2-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 12/06/24 03:20, Zhi Mao ha scritto:
> Add YAML device tree binding for GT9768 & GT9769 VCM,
> and the relevant MAINTAINERS entries.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>   .../bindings/media/i2c/giantec,gt9769.yaml    | 55 +++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml b/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
> new file mode 100644
> index 000000000000..92d603acc53c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/giantec,gt9769.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Giantec Semiconductor, Crop. GT9768 & GT9769 Voice Coil Motor (VCM)
> +
> +maintainers:
> +  - Zhi Mao <zhi.mao@mediatek.com>
> +
> +description:
> +  The Giantec GT9768 & GT9769 is a 10-bit DAC with current sink capability.
> +  The DAC is controlled via I2C bus that operates at clock rates up to 1MHz.
> +  This chip integrates Advanced Actuator Control (AAC) technology
> +  and is intended for driving voice coil lens in camera modules.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - giantec,gt9768

Can't you simply add the "giantec,gt9768" compatible to dongwoon,dw9768.yaml?

Regards,
Angelo



