Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEAF43B4DCB
	for <lists+linux-media@lfdr.de>; Sat, 26 Jun 2021 11:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhFZJT4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Jun 2021 05:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhFZJTz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Jun 2021 05:19:55 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A51C061574
        for <linux-media@vger.kernel.org>; Sat, 26 Jun 2021 02:17:33 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id k30-20020a05600c1c9eb02901d4d33c5ca0so1946802wms.3
        for <linux-media@vger.kernel.org>; Sat, 26 Jun 2021 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LDhw70Yt6exlhcSv9Afxjx3HSFu7MiB5l0gKPfTwVSY=;
        b=H1L+9kK5x2xDfD4+ac6jvpBBlKEBrPfMnVFKtFc67B60aavZwq7To5ljsFPD5Nj7ve
         rbhEohxu98kStOog/G5sidu42+NAMVG4xEiqKPwHovsY2Qvv5jombxa7qs/2WL9csCrd
         oI4GIQ2j1MZKexR3D7bW9Pd+U5kamhOj6riC9HAia/x0QsgC/DkCTfR0c35QmlgKwu7g
         x50O7Wob3t0T6E9euXInfAkuPcjIDXs9tLuqE408zhfVxXAnGvRC8VP6ZvpJCgfcrElZ
         +v4sfa2skP9krOkj88XLVoV8itniXJzadspK6crZZeKlolyRNqZZaqhBga8u3FIFHkW+
         nRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LDhw70Yt6exlhcSv9Afxjx3HSFu7MiB5l0gKPfTwVSY=;
        b=MF2E/ZBNvezG+pimw6X4TFe6ywOyfBIYQykow8H0v0ih55NnBBXRR+h53PZ5axJgNK
         az7IqitfN7FFCi4cKJZpCv7Hs5RASzJNpDlltcG8HT0cP11WD6Y838piWTZG8fAsqdll
         y8EhYTGRlJKB3C0mkngPWB6xcIU2BkFsh8iuL+FvZsNz2FeU8uarDpODWXho8ntuWNLO
         +CzvnNHTygZgenUcnQXO+gyYGgZWrZRbWXRYLasalGNpKOCsuXHmj/8n1TlfYGkVpcWA
         /nqYm/7OzJEbguTJlbL3NbMnFYli1juXniI2x/IrnLgRmzpfKUYUM964QOhnKPxLgVNR
         +ejg==
X-Gm-Message-State: AOAM5306PCuatlXavjgJu1TzKLWhfKjgx/9hHw3TUGqRe/3An962hpEy
        mQNwhgiPhoF7JgGd2m+Fxw==
X-Google-Smtp-Source: ABdhPJwEgPRMkMpbegQwnIrmpL866N7XdcNLXf7aA10ISebqBYaS89SGrO07eG8kEkK8VzbJqZ/p7A==
X-Received: by 2002:a05:600c:21c4:: with SMTP id x4mr15593320wmj.30.1624699051638;
        Sat, 26 Jun 2021 02:17:31 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de. [91.67.75.139])
        by smtp.gmail.com with ESMTPSA id r1sm13379774wmn.10.2021.06.26.02.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jun 2021 02:17:31 -0700 (PDT)
Subject: Re: [PATCH 00/12] hantro: Enable H.264 VDPU2 (Odroid Advance Go)
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
References: <20210624182612.177969-1-ezequiel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <125998a1-e521-bcf6-2905-20204c38d5a7@gmail.com>
Date:   Sat, 26 Jun 2021 11:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624182612.177969-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
> This series adds support for H.264 decoding on the PX30, RK3328
> and RK3326 platforms, enabling the VDPU2 core.
>
> Given it's tested on the Odroid Advance Go, patches 1 and 2
> add the basic support to report the panel orientation to
> userspace (Heiko, if you like them, feel free to pick them).
> Weston (for instance) picks up the orientation automagically
> and rotates the render.
>
> Patches 3 and 4 are just low-hanging fruit that was on my backlog.
>
> Patches 5, 6 and 7 add some helpers to avoid duplicating some processes
> between Hantro G1 and VDPU2. Patches 8 and 9 enable the VDPU2 H.264.
> The implementation is based on a patch from Jonas Karlman [1], which
> I forwarded ported to mainline.
>
> Finally, patches 10 to 12 add support for the VPU on Rockchip PX30 SoCs.
> These patches are based on patches submitted by Paul Kocialkowski [2],
> which I ported and adjusted a bit.
>
> Tested on i.MX8MQ EVK and RK3326 Odroid Advance Go, the latter
> is able to decode a 1080p sample at ~100fps nicely.
>
> Fluster conformance testing is looking good as well, and producing
> expected results:
>
> RK3326:
>    Ran 135 tests in 480.067s
>    FAILED (failures=9, errors=54)
>
> i.MX8MQ:
>    Ran 135 tests in 337.491s
>    FAILED (failures=9, errors=54)
>
> [1] https://lore.kernel.org/linux-media/HE1PR06MB40119DE07D38060F531D1070ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com/
> [2] https://lore.kernel.org/patchwork/cover/1361795/

FWIW: Patches 03/12 - 09/12 are

Tested-by: Alex Bee <knaerzche@gmail.com>

> Ezequiel Garcia (8):
>    drm/panel: kd35t133: Add panel orientation support
>    arm64: dts: rockchip: Add panel orientation to Odroid Go Advance
>    hantro: vp8: Move noisy WARN_ON to vpu_debug
>    hantro: Make struct hantro_variant.init() optional
>    media: hantro: Avoid redundant hantro_get_{dst,src}_buf() calls
>    media: hantro: h264: Move DPB valid and long-term bitmaps
>    media: hantro: h264: Move reference picture number to a helper
>    media: hantro: Enable H.264 on Rockchip VDPU2
>
> Jonas Karlman (1):
>    media: hantro: Add H.264 support for Rockchip VDPU2
>
> Paul Kocialkowski (3):
>    dt-bindings: media: rockchip-vpu: Add PX30 compatible
>    arm64: dts: rockchip: Add VPU support for the PX30
>    media: hantro: Add support for the Rockchip PX30
>
>   .../bindings/media/rockchip-vpu.yaml          |   3 +
>   arch/arm64/boot/dts/rockchip/px30.dtsi        |  23 +
>   .../boot/dts/rockchip/rk3326-odroid-go2.dts   |   1 +
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c  |   8 +
>   drivers/staging/media/hantro/Makefile         |   1 +
>   drivers/staging/media/hantro/hantro.h         |   4 +-
>   drivers/staging/media/hantro/hantro_drv.c     |  11 +-
>   .../staging/media/hantro/hantro_g1_h264_dec.c |  48 +-
>   .../staging/media/hantro/hantro_g1_vp8_dec.c  |  31 +-
>   drivers/staging/media/hantro/hantro_h264.c    |  24 +
>   drivers/staging/media/hantro/hantro_hw.h      |   8 +
>   .../media/hantro/rockchip_vpu2_hw_h264_dec.c  | 491 ++++++++++++++++++
>   .../media/hantro/rockchip_vpu2_hw_vp8_dec.c   |  32 +-
>   .../staging/media/hantro/rockchip_vpu_hw.c    |  54 +-
>   .../staging/media/hantro/sama5d4_vdec_hw.c    |   6 -
>   15 files changed, 671 insertions(+), 74 deletions(-)
>   create mode 100644 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c
>
