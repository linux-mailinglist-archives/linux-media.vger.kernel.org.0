Return-Path: <linux-media+bounces-23182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B89EC943
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99DB1188B358
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4821A841F;
	Wed, 11 Dec 2024 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOzmD3S/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C0236FBF;
	Wed, 11 Dec 2024 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909882; cv=none; b=d507XucL0fRD4J2dr6Ghf34m358oyN6sD6YvEfohplG6ViW+GiwyIKpF9p5N3TN6W9KCgMPBjKXAAzob+wb3EJX9+advCPbz1FLfyYSYJAv+2dM91E/okFXbgwqBQq9RDp7stasp7SNtVm0gm4VhUdI5m+zfgnuZLDD2qT7igR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909882; c=relaxed/simple;
	bh=li9KvKGtNQTPrbwV+H5ciVeIkjmU6ah0biDJSzitd/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txT4UCPoGuGYNcB02yZP7f1JDe9sT5Wcxn8+3tqMfCrY7M5Jh5WmSwwNCHeEkfMcNlN1FURUGLYTdGxn1txDEIkQIB2JQ1+L+TqSUQazFJq0/Q09yil24wwHh87GMYzjqqeX3cEiSzqONOifjLwZdYtfJ9+RFCPimkmNsIUiqTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOzmD3S/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB2DC4CED2;
	Wed, 11 Dec 2024 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909882;
	bh=li9KvKGtNQTPrbwV+H5ciVeIkjmU6ah0biDJSzitd/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOzmD3S/eOYo8FLhlYnpQeZjivgLR7HiWsFljppsTK5VgfMafgHqzyoWTRnx9mVfr
	 93CKNJO/xsBmRo7uVSqUaG4p4fyjSTetoZEfVHVm67VeXGrYX2qU7u3mkGVp8qnDwx
	 jGnRexDibe3drsLRV9Bj2W/NlZEBxonLAYScvELFvdN1715df3vpyFo1ylIIgUekA5
	 466/I8Kh4FiYW9BplTIEFJBOwk4yLnBDO59fx6ALP/Pz1avPCRaImUfWvom6AksLYQ
	 iiaWZqo3jp0n0xFadcFCftL5wYu0YZpZEXJPzHWAVQD2d9ui5TDrJSmiPbxX+Gnlw6
	 MVzC/HVF1XWDA==
Date: Wed, 11 Dec 2024 10:37:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/8] dt-bindings: mailbox: mediatek: Add GCE header
 file for MT8196
Message-ID: <ozifi65uycmxc5hqeu4onbths5u7dg532iufjxplsjw4jjmhf6@6bdsaabd7hl7>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
 <20241211032256.28494-2-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-2-jason-jh.lin@mediatek.com>

On Wed, Dec 11, 2024 at 11:22:49AM +0800, Jason-JH.Lin wrote:
> Add the Global Command Engine (GCE) header file to define the GCE
> thread priority, GCE subsys ID and GCE events for MT8196.

This we see from the diff. What we do not see is why priority is a
binding. Looking briefly at existing code: it is not a binding, there is
no driver user.

> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1439 +++++++++++++++++
>  1 file changed, 1439 insertions(+)
>  create mode 100644 include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> 
> diff --git a/include/dt-bindings/mailbox/mediatek,mt8196-gce.h b/include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> new file mode 100644
> index 000000000000..860d69100157
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> @@ -0,0 +1,1439 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2024 MediaTek Inc.
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_GCE_MT8196_H
> +#define _DT_BINDINGS_GCE_MT8196_H
> +
> +/* GCE thread priority */
> +#define CMDQ_THR_PRIO_LOWEST	0
> +#define CMDQ_THR_PRIO_1		1
> +#define CMDQ_THR_PRIO_2		2
> +#define CMDQ_THR_PRIO_3		3
> +#define CMDQ_THR_PRIO_4		4
> +#define CMDQ_THR_PRIO_5		5
> +#define CMDQ_THR_PRIO_6		6
> +#define CMDQ_THR_PRIO_HIGHEST	7
> +
> +/* GCE subsys table */
> +#define SUBSYS_1300XXXX		0
> +#define SUBSYS_1400XXXX		1
> +#define SUBSYS_1401XXXX		2
> +#define SUBSYS_1402XXXX		3
> +#define SUBSYS_1502XXXX		4
> +#define SUBSYS_1880XXXX		5
> +#define SUBSYS_1881XXXX		6
> +#define SUBSYS_1882XXXX		7
> +#define SUBSYS_1883XXXX		8
> +#define SUBSYS_1884XXXX		9
> +#define SUBSYS_1000XXXX		10
> +#define SUBSYS_1001XXXX		11
> +#define SUBSYS_1002XXXX		12
> +#define SUBSYS_1003XXXX		13
> +#define SUBSYS_1004XXXX		14
> +#define SUBSYS_1005XXXX		15
> +#define SUBSYS_1020XXXX		16
> +#define SUBSYS_1028XXXX		17
> +#define SUBSYS_1700XXXX		18
> +#define SUBSYS_1701XXXX		19
> +#define SUBSYS_1702XXXX		20
> +#define SUBSYS_1703XXXX		21
> +#define SUBSYS_1800XXXX		22
> +#define SUBSYS_1801XXXX		23
> +#define SUBSYS_1802XXXX		24
> +#define SUBSYS_1804XXXX		25
> +#define SUBSYS_1805XXXX		26
> +#define SUBSYS_1808XXXX		27
> +#define SUBSYS_180aXXXX		28
> +#define SUBSYS_180bXXXX		29
> +#define SUBSYS_NO_SUPPORT	99
> +
> +/*
> + * GCE General Purpose Register (GPR) support
> + * Leave note for scenario usage here
> + */
> +/* GCE: write mask */

That's a definite no-go. Register masks are not bindings.

> +#define GCE_GPR_R00		0x0
> +#define GCE_GPR_R01		0x1

Best regards,
Krzysztof


