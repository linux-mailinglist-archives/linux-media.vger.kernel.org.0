Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1EB597E64
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 08:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243469AbiHRGH4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 02:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243365AbiHRGHz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 02:07:55 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360928E441
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 23:07:54 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id q8so545563qvr.9
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 23:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=eovCU3oefLwCBarQm+zizJfd/x3OzrHww+wVE0aIUzY=;
        b=YZvfA4w6b0yxhmcJjPM0vvBl5yh0tgeZWxLd38TYifeI2pI1kLX74JOxwA5uqKeUWL
         ptrGDD1wgRfU7rrjwNpdMsXLhq1fF+9HF6l0uaIWi22ZrELxl+9YWdxlJl8L4V8Bg8By
         GgElj1pry7Bv7InBM5xwJ716YHcz6/sf3hYLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=eovCU3oefLwCBarQm+zizJfd/x3OzrHww+wVE0aIUzY=;
        b=ilJZLGemlVW4fCS/mIqKlYaZBJLfuHd92Mk/o6pZBPW1DUq0WfQXofJKFeCHvqEHnb
         RRITFaSRDiN25TC+OuBlIgtGos6++XDgDbwpY0IGgmKC8aVd9nET2ZaTiDC2bT43ufkh
         tmrQ7v4N9EsUHZ70BiBxaWtx5eEvxSZq/zhxWEnun3UEt7yhK9/dm7UQ2nIEO/LMe+Eu
         dKEo2UM5x0ZT/q2CF/pm4VQNmCSjz5Hx6PwAbaQeyz3xyuGkHservrDYxdBiczFSsm2U
         W11mHpaG8hCIahFC+1INtpjvoL9xrF5y9CpjcPBkeeU7tSCSfMz5gLeEugMz4gTVYfxi
         sUUg==
X-Gm-Message-State: ACgBeo0t8Xwt7AdukNvtjgrwHCILda8MBfo9Oz9c6dhX42iDIHaMts3a
        sP0EaFcwZAI8f0V3IK47OTVkbVvRlnHdpY//
X-Google-Smtp-Source: AA6agR6Vv98CUFd6SO7ffA/IdFSZHnbaga6Yy6LlNc3zCOdP4H9jbo4J7Cy+VIwaH1rszznShgNe2A==
X-Received: by 2002:a05:6214:21e8:b0:476:8d19:f611 with SMTP id p8-20020a05621421e800b004768d19f611mr1112289qvj.128.1660802873087;
        Wed, 17 Aug 2022 23:07:53 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id v21-20020a05620a441500b006bb20e8ee70sm790637qkp.89.2022.08.17.23.07.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 23:07:52 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-33365a01f29so15465767b3.2
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 23:07:51 -0700 (PDT)
X-Received: by 2002:a81:2596:0:b0:329:da3a:e1d3 with SMTP id
 l144-20020a812596000000b00329da3ae1d3mr1383846ywl.41.1660802871136; Wed, 17
 Aug 2022 23:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220808162750.828001-1-randy.li@synaptics.com> <20220808162750.828001-2-randy.li@synaptics.com>
In-Reply-To: <20220808162750.828001-2-randy.li@synaptics.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 18 Aug 2022 15:07:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A+ueaiW8=cZZLomBLVtSNd8k89FUhYRp23yayQfXnT9A@mail.gmail.com>
Message-ID: <CAAFQd5A+ueaiW8=cZZLomBLVtSNd8k89FUhYRp23yayQfXnT9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
To:     Hsia-Jun Li <randy.li@synaptics.com>
Cc:     dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, ezequiel@vanguardiasur.com.ar,
        sakari.ailus@linux.intel.com, ribalda@chromium.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sebastian.hesselbarth@gmail.com, jszhang@kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>
> Memory Traffic Reduction(MTR) is a module in Synaptics
> VideoSmart platform could process lossless compression image
> and cache the tile memory line.
>
> Those modifiers only record the parameters would effort pixel
> layout or memory layout. Whether physical memory page mapping
> is used is not a part of format.
>
> We would allocate the same size of memory for uncompressed
> and compressed luma and chroma data, while the compressed buffer
> would request two extra planes holding the metadata for
> the decompression.
>
> The reason why we need to allocate the same size of memory for
> the compressed frame:
> 1. The compression ratio is not fixed and differnt platforms could
> use a different compression protocol. These protocols are complete
> vendor proprietaries, the other device won't be able to use them.
> It is not necessary to define the version of them here.
>
> 2. Video codec could discard the compression attribute when the
> intra block copy applied to this frame. It would waste lots of
> time on re-allocation.
>
> I am wondering if it is better to add an addtional plane property to
> describe whether the current framebuffer is compressed?
> While the compression flag is still a part of format modifier,
> because it would have two extra meta data planes in the compression
> version.
>
> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 49 +++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 0206f812c569..b67884e8bc69 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -381,6 +381,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>
>  /* add more to the end as needed */
>
> @@ -1452,6 +1453,54 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>         (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>
> +/*
> + * Synaptics VideoSmart modifiers
> + *
> + *       Macro
> + * Bits  Param Description
> + * ----  ----- -----------------------------------------------------------------
> + *
> + *  7:0  f     Scan direction description.
> + *
> + *               0 = Invalid
> + *               1 = V4, the scan would always start from vertical for 4 pixel
> + *                   then move back to the start pixel of the next horizontal
> + *                   direction.
> + *               2 = Reserved for future use.

I guess 2..255 are all reserved for future use?

> + *
> + * 15:8  m     The times of pattern repeat in the right angle direction from
> + *             the first scan direction.
> + *
> + * 19:16 p     The padding bits after the whole scan, could be zero.

What is the meaning of "scan" and "whole scan" here?

Best regards,
Tomasz

> + *
> + * 35:20 -     Reserved for future use.  Must be zero.
> + *
> + * 36:36 c     Compression flag.
> + *
> + * 55:37 -     Reserved for future use.  Must be zero.
> + *
> + */
> +
> +#define DRM_FORMAT_MOD_SYNA_V4_TILED           fourcc_mod_code(SYNAPTICS, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, c) \
> +       fourcc_mod_code(SYNAPTICS, (((f) & 0xff) | \
> +                                (((m) & 0xff) << 8) | \
> +                                (((p) & 0xf) << 16) | \
> +                                (((c) & 0x1) << 36)))
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1_COMPRESSED \
> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_COMPRESSED \
> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.17.1
>
