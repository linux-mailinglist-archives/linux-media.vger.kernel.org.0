Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EC27D6E3A
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 16:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344575AbjJYNx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 09:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbjJYNxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 09:53:52 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8C8132
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 06:51:59 -0700 (PDT)
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 48D17413B8
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1698241818;
        bh=W1x37B91j9+69z88CpRerUtWigBjNUnfhOj4SQBIvW4=;
        h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=vS+12Q40AQ4TZ0QJz97o+VvWhbM+rqyeHwG+1ZD+Ih8mEMUEE8DoQjwmMIsgVMZTc
         GRM4mUkK6H6/qKxgwcbVsHIpKMlGOUewITUboL59t5wtXNriDvTxFx9Yn1VWJH4olL
         sSs6Va3B3mjbT5hy/2xEjh1E99qDgI8tGviExP4LEQPo/F7+2KyEuWPvxdL2Q/RIf2
         jB4LWj8G67cKC11NE8f8z2CVaGGSWC+D1HzLf0ptDTq5nc/zmuhFlYKOKJxaDiQ6/3
         TMpt0ttlunlbci+q1eSnxI05nJ/e1Yshlm6mTvtzNuew0gcCZ7qmpsZ/9Gfx3DtLVN
         mkExeCxE4l/5g==
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-49da52a5356so1805504e0c.2
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 06:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698241817; x=1698846617;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1x37B91j9+69z88CpRerUtWigBjNUnfhOj4SQBIvW4=;
        b=vYWSIrXyUZ2H89UZJ7H9TtObhoXAgPbHcerX7AYMa1lM57tZ9gocVHdSVD75cHLwpg
         xVTo5vXCBYTVPSVvud92HL4RndJ1TXZ6+npw2xsC/YHpc7myxSGv077CX6bjJPes5aRC
         wrLQfQtlNLPHaxLRIlh5zKU+SeDZxTmbw0BORAany364cpj+D7aKnflTHLoRT0jT2Q1S
         PHqWTi+mcR1J0m4XsdFGVORSlQUbmQITK6C+86DIr4YI+bdnKP7zVmrYLj+FT3Kb/RCl
         WUKoN6ObQeMvL2+Wj+SlwH5Z8p2tzh8hINZ7zunrYiQo1/lt7W4CbpQHXFRfKxAhKZ4h
         YYZQ==
X-Gm-Message-State: AOJu0Yx4kzLDGgPmbYoy0T2FlPP6LM+YNyIzMk+0pxCWJiH630kpXN42
        9tRrXvxeQewhtqecUjlJxGOht+adg/RIQDfl7q3Ab8OtSARG1oSIz/b5rswvJr9uCQEAVW57ywX
        kSHMqS8FIBBAxwTNckzmJs/4S/RNCvA3W1TXSS/fhRist0uok6qh+r2Nv
X-Received: by 2002:a1f:2413:0:b0:496:b3b7:5d4c with SMTP id k19-20020a1f2413000000b00496b3b75d4cmr9124781vkk.16.1698241817330;
        Wed, 25 Oct 2023 06:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9zDnpBEjkuG+zK5+I3md5OYseNj7+FyeAufjrHbMrkjT4o0+aAODqiZVHTJv2jiFeyLuyYUPzrjH27o2gXYU=
X-Received: by 2002:a1f:2413:0:b0:496:b3b7:5d4c with SMTP id
 k19-20020a1f2413000000b00496b3b75d4cmr9124773vkk.16.1698241817037; Wed, 25
 Oct 2023 06:50:17 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 06:50:16 -0700
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231025103957.3776-4-keith.zhao@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com> <20231025103957.3776-4-keith.zhao@starfivetech.com>
Mime-Version: 1.0
Date:   Wed, 25 Oct 2023 06:50:16 -0700
Message-ID: <CAJM55Z_SS351YyudUkiS3YvBx7O9OM=MGL6PpgVZZjaYjLy3+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
To:     Keith Zhao <keith.zhao@starfivetech.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        christian.koenig@amd.com, Bjorn Andersson <andersson@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
        Chris Morgan <macromorgan@hotmail.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Shengyang Chen <shengyang.chen@starfivetech.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keith Zhao wrote:
> For each modifier, add the corresponding description
>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8db7fd3f7..a580a848c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -419,6 +419,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VERISILICON 0x0b
>
>  /* add more to the end as needed */
>
> @@ -1562,6 +1563,62 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>  	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL					0x00
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_MASK					((__u64)0x3 << 54)
> +
> +#define fourcc_mod_vs_code(type, val) \
> +	fourcc_mod_code(VERISILICON, ((((__u64)type) << 54) | (val)))
> +
> +#define DRM_FORMAT_MOD_VERISILICON_NORM_MODE_MASK				0x1F
> +
> +/*
> + * An x-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
> + * Each 8x8 sub-tile consists of four standard tiles .
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X8		0x02
> +
> +/*
> + * A y-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
> + * Each 8x8 sub-tile consists of four standard tiles .
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_8X8		0x03
> +
> +/*
> + * An 8x8 tile consists of four standard tiles
> + * that are organized in Z-order.
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_TILE_8X8						0x04
> +
> +/*
> + * An 8x4 tile consists of two standard tiles
> + * that are organized in Z-order.
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_TILE_8X4						0x07
> +
> +/*
> + * An x-major 8x4 super tile consists of 128 8x4 sub-tiles in total.
> + * Each 8x4 sub-tile consists of two standard tiles.
> + * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X4		0x0B

These indents are all over the place. Please either align them with tabs or use
a single space like the AMD defines above.

> +
> +/*
> + * A y-major 4x8 super tile consists of 128 4x8 sub-tiles in total.
> + * Each 4x8 sub-tile consists of two standard tiles.
> + * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_4X8    0x0C
> +
> +#define fourcc_mod_vs_norm_code(tile) \
> +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL, \
> +				(tile))
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.34.1
>
