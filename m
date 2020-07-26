Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B0C22DFB9
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 16:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgGZOdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 10:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgGZOdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 10:33:32 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E9FC0619D4
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 07:33:32 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id rk21so14528534ejb.2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h6PjDTHNbJzGCFM7oR6czVYevtbFuByjvgvxELkV44g=;
        b=cHvFGREXeIYAdMHGV9Us7B6YAzH1cpXsAofFEeZiU4bKarJ0bBTHvJIhRR5jkexoZv
         F39ZFNAKdNBkZ6tm4PeeiU0zKnBgEZqzV9vbbZ1n/pET7fnu1cADJcXvRGk7X4OXUMuf
         BHyoTH66YJ/j8KD4yjcjeqoyJdE1QIdELbga1xF/Go8WVWxCSHWBSKsfL3uHZjG/e4Sz
         qQe9fnJ4P4v8A0RV99gfJDVBWiCA4vGkmc2AfHQmGtX2vKg+vy2NyabllpDcZLJbZ8kT
         SCQZigjGxMehQ5WX5HIO+G9Kgsusa/Vk2bFi3zUphaq2R85opqe+kllXgbbserAFqLJW
         Xpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h6PjDTHNbJzGCFM7oR6czVYevtbFuByjvgvxELkV44g=;
        b=rLyHO2IPWgj0HQ7QtlrKJX3+4Q2yot9PsO79zMSjF01JE+YT6gT6atwAOYkoyvpWSf
         sbHT9uroQ4oveO+QasXz5e+2bADtSfm1PocYlPZX+imZzxOdlLZPY0xqAej0peWhucUR
         O0G0j4VeUJ+qWjl28/+2J2mHa+eqMx0sh5KmWZnGVnJjiLElwXar3SJbZXmf9AbCrAyF
         UadJrWnsi0hdWOVly98xBDLQZnuIHVH7sn9znNzTNoM6MyUZL2bOFk9Z8+wSluGG34ci
         WTNMJqaSUoOTjs3zjq7vxIc2Jp+y1poz3gCX1XSUvvoqgqI+eykSX4NufMqOoeKFKzUl
         Xjsg==
X-Gm-Message-State: AOAM531bQFBdZutdg3kIAZPxzI/RhLOurA2PmE2JKYWJtNTG0GfSSufU
        hw7Qbexe9o1JoLXnICAzUxrRpP1q7syYeiG3tEeX9w==
X-Google-Smtp-Source: ABdhPJy1W/4bjZ9ErvmYuBxoIGryOmP7jlkH2GYRNNSWZpkWHE1CIwV6bSkC7L0BGhUkfi3frU4HwDBBPvwDO8iOwMs=
X-Received: by 2002:a17:906:aed4:: with SMTP id me20mr8903155ejb.141.1595774010704;
 Sun, 26 Jul 2020 07:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org>
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 26 Jul 2020 11:33:19 -0300
Message-ID: <CAAEAJfCzmEj3X2NdgaD=YSS_fV7MnZw=4o5KJOOSoMOSejv7=g@mail.gmail.com>
Subject: Re: [PATCH 00/10] media: mtk-vcodec: venc: support for MT8183
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Enric

Hello Alexandre,

Thanks for the series.

On Wed, 20 May 2020 at 05:27, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> This series adds support for the encoder present on MT8183. It is very similar
> to the one in MT8173, but with different capabilities and using a new firmware
> interface (SCP, while MT8173 talked to the VPU).
>
> So this series starts with some preparatory work by putting the firmware
> interface behind a small abstraction layer instead of directly talking to the
> VPU, and by adding support for the SCP firmware. Next platform data is completed
> with features that differ between the chips, like supported formats and bitrate,
> before support for MT8183 is added.
>
> Alexandre Courbot (6):
>   media: mtk-vcodec: venc: handle firmware version field
>   media: mtk-vcodec: venc: specify bitrate range per-chip
>   media: mtk-vcodec: venc: specify supported formats per-chip
>   media: mtk-vcodec: venc: remove redundant code
>   media: dt-bindings: mtk-vcodec: specify SCP node
>   media: dt-bindings: mtk-vcodec: document mediatek,mt8183-vcodec-enc
>
> Yunfei Dong (4):
>   media: mtk-vcodec: abstract firmware interface
>   media: mtk-vcodec: add SCP firmware ops
>   media: mtk-vcodec: venc: support SCP firmware
>   media: mtk-vcodec: add support for MT8183 encoder
>
>  .../bindings/media/mediatek-vcodec.txt        |   9 +-

Would it be possible to add the support in
arch/arm64/boot/dts/mediatek/mt8183.dtsi ?

Given the driver is stateful it should be possible
for anyone to test it with standard userspace
such as GStreamer.

Is it possible for the firmware to be pushed to linux-firmware ?

Thanks,
Ezequiel

>  drivers/media/platform/Kconfig                |   2 +
>  drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  38 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 141 ++++-------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 149 ++++++++----
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 228 ++++++++++++++++++
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  38 +++
>  .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
>  .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  12 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
>  .../platform/mtk-vcodec/venc/venc_h264_if.c   |  80 ++++--
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  11 +-
>  .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
>  .../media/platform/mtk-vcodec/venc_drv_if.h   |   6 +
>  .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  24 +-
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 141 ++++++++---
>  .../media/platform/mtk-vcodec/venc_vpu_if.h   |   8 +-
>  26 files changed, 711 insertions(+), 255 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
>
> --
> 2.26.2.761.g0e0b3e54be-goog
>
