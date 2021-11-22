Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3FA45951C
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 19:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237306AbhKVSyi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 13:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237700AbhKVSy3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 13:54:29 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FA8C061714;
        Mon, 22 Nov 2021 10:51:22 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id r25so44340390edq.7;
        Mon, 22 Nov 2021 10:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z5nvE8R1g68uXQp/4of3MVll2I+d9ZYBd8YnGL7MI3U=;
        b=GSQXkLBsft7BbxrZYlMDTsQXwRtu0mUeXiIJH1gJwa37yE6G+2ZnDNCAgWIFq18ZUX
         3BXKK5ISO0bRnGzB3nr9RFFyL36W3+a3KI31gam99ITnSYhcXMrOkXoRiT98Yohu5REM
         Q7q2O1nqAsXNF+j9K+LC2ZejnyiBaEBhdPjN1MR+ffY8KfiAn4hWRspSyhGmh/SwwbJy
         Vo+v27GSFtQeRTvwOvpsn4SSXypW7OUVbabDeHTuE9Rxsr6d6sNdpwlO8RNy06nwBk2n
         PIWMRp/DvS1bPwqlUrN81/0cOoufKy6BpGLqyMrbADgrwvf+zNONgu8HELE+2Ge7baWI
         M/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z5nvE8R1g68uXQp/4of3MVll2I+d9ZYBd8YnGL7MI3U=;
        b=P594IPA5KljXC9XZyFzczqxiK01Nkz53IxEWL+c85isxboj5LYnNBSqzl+wdHMsNn1
         K8AxD4yd+E9jEDvaD9Y3FdU9fOxvLkfkm/YEX463HckMkqZYkgjiu3qu60Xmyfq90aFH
         jtO/Cr8QaEJjkGtRXhvCU4Hpj/QsJYDxAzpxZGTCuSv6qhNpYb83D898MuLPjGpnFeG7
         J3g1qdUIYOLHSAGhiFTnar96JowsHyGkDAtApgkgndqoHsCSy1ra8RFypVbv+sY3FibM
         Wvv1FVGrKNzxKw01PnDmeeTZ54dKE2+Gm+g4iz/MfpUD0LivZrCE5qQl9UPEx+L0+1tn
         7lxQ==
X-Gm-Message-State: AOAM532diV72fMA8yjF2mL5/kc9EVQN6SPhrvL4CUWCQSIaE3KDM8oFS
        hBz6py4zPWXHx+rz1jwMAsZiTRGFHecmjg==
X-Google-Smtp-Source: ABdhPJwN2wUfOIKWPGzvBUR0COCWmhOXb7IycOilOrZEpvYk/vGy3mmFuOXrmZMq99QEnjwKdoo0qg==
X-Received: by 2002:a17:906:9f20:: with SMTP id fy32mr45026224ejc.459.1637607081010;
        Mon, 22 Nov 2021 10:51:21 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id hc10sm4241706ejc.99.2021.11.22.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:51:20 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/7] media: hantro: add Allwinner H6 support
Date:   Mon, 22 Nov 2021 19:51:19 +0100
Message-ID: <4666655.GXAFRqVoOG@kista>
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 22. november 2021 ob 19:46:55 CET je Jernej Skrabec 
napisal(a):
> Hi everyone!
> 
> Here is patchset which adds support for Hantro G2 core found in Allwinner
> H6 SoC. It is slightly older core, so it needs few quirks to be
> implemented:
> 1. It uses slightly different register layout in some cases. However, those
>    differences are small, so it makes sense only to add quirks.
> 2. It doesn't use ring buffer for bitstream as newer variants.
> 3. It needs double buffering to be enabled in order to work correctly.
> 4. postproc must be enabled at the end of the job. It seems that core has
>    some issues with latching register values if postproc registers are set
>    at the beginning of the job
> 
> legacy_regs quirk could be split into 3, like legacy_regs, ring_buffer and
> late_postproc, but I didn't see the need for that. I examined vendor
> sources at [1] and it suggests that legacy_regs implies no ring buffer.
> 
> It's also unclear if core supports HEVC decoding or not. This can be
> implemented later. VP9 10-bit decoding support is mentioned in manual, but
> it doesn't work at the moment. This will be addressed later.
> 
> Please take a look.
> 
> Best regards,
> Jernej
> 
> [1] https://github.com/CliveLau1990/imx-vpu-hantro

Forgot to add, this series is based on top of:
https://www.spinics.net/lists/linux-media/msg202448.html

Regards,
Jernej

> 
> Jernej Skrabec (7):
>   media: hantro: add support for reset lines
>   media: hantro: vp9: use double buffering if needed
>   media: hantro: vp9: add support for legacy register set
>   media: hantro: move postproc enablement for old cores
>   media: dt-bindings: allwinner: document H6 Hantro G2 binding
>   media: hantro: Add support for Allwinner H6
>   arm64: dts: allwinner: h6: Add Hantro G2 node
> 
>  .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  64 +++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   9 ++
>  drivers/staging/media/hantro/Kconfig          |  10 +-
>  drivers/staging/media/hantro/Makefile         |   3 +
>  drivers/staging/media/hantro/hantro.h         |   7 ++
>  drivers/staging/media/hantro/hantro_drv.c     |  27 ++++-
>  drivers/staging/media/hantro/hantro_g2_regs.h |  20 ++++
>  .../staging/media/hantro/hantro_g2_vp9_dec.c  |  76 ++++++++++---
>  drivers/staging/media/hantro/hantro_hw.h      |   1 +
>  drivers/staging/media/hantro/sunxi_vpu_hw.c   | 104 ++++++++++++++++++
>  10 files changed, 301 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/
allwinner,sun50i-h6-vpu-g2.yaml
>  create mode 100644 drivers/staging/media/hantro/sunxi_vpu_hw.c
> 
> -- 
> 2.34.0
> 
> 


