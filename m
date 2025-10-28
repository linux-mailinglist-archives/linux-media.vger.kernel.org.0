Return-Path: <linux-media+bounces-45868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D2C167B0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47F9D1B26866
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D9C301711;
	Tue, 28 Oct 2025 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1JaxdFE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116BB3469F5
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761675948; cv=none; b=oln/ujPcKrihFhASl/uGVZhWgS4b5v8tJ06wgkkRj6YgwsqYJlteuuUg05kbqOZXMJSMtlW/OUqFAgALKz9ahMWgJz9mctxlXq7yN2qg2L3nhPswKzZ4DhRCBx9U2wE3YYmP2V0EBFbN/uONszBKT0djp9eKW3+tNN47y464ji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761675948; c=relaxed/simple;
	bh=ok6Tl7RUMhfY5AW2FmCbXe+CHbPj0fDsuBNMuXfUvss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIm06tLFuhZ1qwpGnj8pq+2ZbZx6lkPmSbgiRoS+USncLRP7VrkaSC+aPl0JayFaUh1+mLjIq+fcBki+nqZvi7WKC1IMWkUvbRp+4A56V01xyICA4RFQ5/Kj1nkZUzeyubiwoadM5DZqrK+jhw/P2AYz800xlLxctw6+7ewJN7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1JaxdFE; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so1400859866b.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761675944; x=1762280744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCqkedhq8gefJ0vq9o5JT8van1611cBRTjmA+ft6YH8=;
        b=a1JaxdFEoW9otWWdrRkL1qXmwKp1MNvcYvfo+UgiujAPVN5BaF5QIGSk+S8ue+V/Zu
         j5JXFhtVROmQ0asi6K2qzXBu+28EDcoYn/slLxLurNL71v3bSKooMq/N/v35qt+ZoP/8
         KSM9CLQW5xvmfpLai+y6Y7Lyxj1+VvWJO92YTP/q91Ckhk3YSCandKn/cdD6EGZKpqcf
         sBh57HRvS0gvj8yVAosSNaR/4euD1+JD/SXdG0jhZwUZCvfllVgQVFm3UHFC/AOd5RFb
         31iDdg9I4MQ3RdEfhDR0nOLjYNR1KtfTAPhRx9Ks4kzi+TC+ZcMht3uOXlQJU5uPGKNx
         seZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761675944; x=1762280744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCqkedhq8gefJ0vq9o5JT8van1611cBRTjmA+ft6YH8=;
        b=UZH1+XGv+2BSR78gcLRoXXSX2qNaa6syFpnBSn0nc7h3+MoF4xR4PxIJzGT57qamk0
         i4P7978MVVdBiwVFxNqc3O3lSyWNScLv/jMV8GQfjyuWxCnnPrqwy1Q0MXi76KPxYpXl
         wPIaX7f5XBd1xwN+aij3BR1Jh8NI//0EDcdxGPCuDCqAqPWQhqctarzs1HcRmZek8w5a
         4ScmcvTEGpZYyobZhE7DFuicRFk6xEezcLMTJ50wPQ636t+lNWVOBECWjgjXL18ainax
         gsNZ/tzDhnu/ILhDUcD5e3+ye83kk3b/IVA6aSBX45zLm3AQEIgvTDt/lf+I0qUvCuA1
         iEYQ==
X-Gm-Message-State: AOJu0YxqK0WEZ7yYg+b4hEIwJ/96mSDBJhADl/abTWoxMwbC47ZyWBrf
	ih6SIQBVkO1CznMsFapvE1/PqRSouI1KJjVFYiWgm59ZqofcURZsCDeB+7TCtk+fVKycgfgSYGy
	tyqK8pjW+SXHH4Xhb8KmS7Fi7n6jf5dg=
X-Gm-Gg: ASbGncsMDiml4/5nihNne74kMDvtyfa2lcyExcsbWDnG7slkUklxW1efUAPm/Ho2YMV
	5WWr0GO+OuRDrmO8kx7JsdgaYlJ/03NcaL07pMs2mvP0TsrFRHtSHnan9my3hTHx6YePw5kJVwe
	vlfeyR5xrQ28C3KLfBDd80/vimrwV0b2rr780bUpKZ9rcs7imdwfCx8rPfx2oZY/AFXXVPpoxG2
	qL4khNBoxCjM1iQ2jn/XoD0CMEFYroR4SqPxTe7jiZ/NLHH0gq65WmhGXhL
X-Google-Smtp-Source: AGHT+IHUN9iAMdCMTe6iKPq3e6j4mC/AjCVKjhKIhI0duJ1VlADSpP0NivnP3lrSv3tcevZNdZbSiCNvU3n7YE5rU4Q=
X-Received: by 2002:a17:907:6d0d:b0:b04:1249:2b24 with SMTP id
 a640c23a62f3a-b703290dd00mr58549566b.37.1761675944176; Tue, 28 Oct 2025
 11:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com> <20251002-c55-v12-4-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-4-3eda2dba9554@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Oct 2025 18:25:17 +0000
X-Gm-Features: AWmQ_bm2B_mhjyhjxwffXBBORyZZbcAxcXJ9p2Wws_R9xPcbz_GEzTbnOC3k5mM
Message-ID: <CA+V-a8t8H9rYmXtrMrEvnx6otoktK=EFptZndYLTFCc9qM_mKg@mail.gmail.com>
Subject: Re: [PATCH v12 04/15] media: uapi: Add controls for Mali-C55 ISP
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, 
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 11:19=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> Add definitions and documentation for the custom control that will
> be needed by the Mali-C55 ISP driver. This will be a read only
> bitmask of the driver's capabilities, informing userspace of which
> blocks are fitted and which are absent.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v12:
>
>         - Removed _FITTED suffix from control value names
>         - Specified bitmask for control name
>         - Used (1 << n) instead of BIT(n) in uapi header
>         - Updated comment to reserve 16 controls for driver
>
> Changes in v11:
>
>         - None
> Changes in v10:
>
>         - None
>
> Changes in v9:
>
>         - New patch
> ---
>  .../userspace-api/media/drivers/index.rst          |  1 +
>  .../userspace-api/media/drivers/mali-c55.rst       | 55 ++++++++++++++++=
++++++
>  include/uapi/linux/media/arm/mali-c55-config.h     | 26 ++++++++++
>  include/uapi/linux/v4l2-controls.h                 |  6 +++
>  4 files changed, 88 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Docume=
ntation/userspace-api/media/drivers/index.rst
> index d706cb47b1122b6e145a02ab826eb3ecc7997c2b..02967c9b18d6e90f414ccc132=
9c09bffee895e68 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -32,6 +32,7 @@ For more details see the file COPYING in the source dis=
tribution of Linux.
>         cx2341x-uapi
>         dw100
>         imx-uapi
> +       mali-c55
>         max2175
>         npcm-video
>         omap3isp-uapi
> diff --git a/Documentation/userspace-api/media/drivers/mali-c55.rst b/Doc=
umentation/userspace-api/media/drivers/mali-c55.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..74f2cdb717e0dddeb11fb1eab=
a69eeebb2534f95
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/mali-c55.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Arm Mali-C55 ISP driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Arm Mali-C55 ISP driver implements a single driver-specific control:
> +
> +``V4L2_CID_MALI_C55_CAPABILITIES (bitmask)``
> +    Detail the capabilities of the ISP by giving detail about the fitted=
 blocks.
> +
> +    .. flat-table:: Bitmask meaning definitions
> +       :header-rows: 1
> +       :widths: 2 4 8
> +
> +       * - Bit
> +         - Macro
> +         - Meaning
> +        * - 0
> +          - MALI_C55_GPS_PONG
> +          - Pong configuration space is fitted in the ISP
> +        * - 1
> +          - MALI_C55_GPS_WDR
> +          - WDR Framestitch, offset and gain is fitted in the ISP
> +        * - 2
> +          - MALI_C55_GPS_COMPRESSION
> +          - Temper compression is fitted in the ISP
> +        * - 3
> +          - MALI_C55_GPS_TEMPER
> +          - Temper is fitted in the ISP
> +        * - 4
> +          - MALI_C55_GPS_SINTER_LITE
> +          - Sinter Lite is fitted in the ISP instead of the full Sinter =
version
> +        * - 5
> +          - MALI_C55_GPS_SINTER
> +          - Sinter is fitted in the ISP
> +        * - 6
> +          - MALI_C55_GPS_IRIDIX_LTM
> +          - Iridix local tone mappine is fitted in the ISP
> +        * - 7
> +          - MALI_C55_GPS_IRIDIX_GTM
> +          - Iridix global tone mapping is fitted in the ISP
> +        * - 8
> +          - MALI_C55_GPS_CNR
> +          - Colour noise reduction is fitted in the ISP
> +        * - 9
> +          - MALI_C55_GPS_FRSCALER
> +          - The full resolution pipe scaler is fitted in the ISP
> +        * - 10
> +          - MALI_C55_GPS_DS_PIPE
> +          - The downscale pipe is fitted in the ISP
> +
> +    The Mali-C55 ISP can be configured in a number of ways to include or=
 exclude
> +    blocks which may not be necessary. This control provides a way for t=
he
> +    driver to communicate to userspace which of the blocks are fitted in=
 the
> +    design.
> \ No newline at end of file
> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uap=
i/linux/media/arm/mali-c55-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..7fddece54ada9dadc3c76372d=
496d9395237a41c
> --- /dev/null
> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * ARM Mali-C55 ISP Driver - Userspace API
> + *
> + * Copyright (C) 2023 Ideas on Board Oy
> + */
> +
> +#ifndef __UAPI_MALI_C55_CONFIG_H
> +#define __UAPI_MALI_C55_CONFIG_H
> +
> +#include <linux/v4l2-controls.h>
> +
> +#define V4L2_CID_MALI_C55_CAPABILITIES (V4L2_CID_USER_MALI_C55_BASE + 0x=
0)
> +#define MALI_C55_GPS_PONG              (1U << 0)
> +#define MALI_C55_GPS_WDR               (1U << 1)
> +#define MALI_C55_GPS_COMPRESSION       (1U << 2)
> +#define MALI_C55_GPS_TEMPER            (1U << 3)
> +#define MALI_C55_GPS_SINTER_LITE       (1U << 4)
> +#define MALI_C55_GPS_SINTER            (1U << 5)
> +#define MALI_C55_GPS_IRIDIX_LTM                (1U << 6)
> +#define MALI_C55_GPS_IRIDIX_GTM                (1U << 7)
> +#define MALI_C55_GPS_CNR               (1U << 8)
> +#define MALI_C55_GPS_FRSCALER          (1U << 9)
> +#define MALI_C55_GPS_DS_PIPE           (1U << 10)
> +
> +#endif /* __UAPI_MALI_C55_CONFIG_H */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 2d30107e047ee3cf6b149e5b075cc9d4137b7d3f..f84ed133a6c9b2ddc1aedbd58=
2ddf78cb71f34e5 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -228,6 +228,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_RKISP1_BASE              (V4L2_CID_USER_BASE + 0x1=
220)
>
> +/*
> + * The base for the Arm Mali-C55 ISP driver controls.
> + * We reserve 16 controls for this driver
> + */
> +#define V4L2_CID_USER_MALI_C55_BASE            (V4L2_CID_USER_BASE + 0x1=
230)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
>
> --
> 2.43.0
>
>

