Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3A245D820
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 11:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351418AbhKYKWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 05:22:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37290 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351998AbhKYKUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 05:20:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 6EE071F45F43
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637835442; bh=kU/MZYNKaO3dvvsRN6JtzRQ0r5zNYRD15c2pxK8A1Ok=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JGFhrwntMATS6G/uRNt2zAPnUTAA3+pGem015A7Lx36duECl7zqipbC+UMi9omJG0
         Iszu+AW61a7QT8TII0Bb54NsOG4GccMZvVi2maKuZk5NcVgx5zT7+Fr1keXmOj0j4m
         S4C6Hb9EJpkLL/XtT93AH0Z/R6NQ1H0h0WwLjDTVksPPb7BM/hxUf5Wq1j6zjhCi1Q
         J2EEXTfyMrsGHkdrZKnqnd1CSn2VNUgp8DQXs7whKpgQnY2FkrEl4JC7FbOw1FvHDN
         g2TeRJtCr37bJEBoP5AcItesIOCFas3KRMjZ6lgHdm3IF+T/A1gQmA9CXsLb1Y6QSK
         2Ht57sVCAfBlg==
Subject: Re: [PATCH 0/9] Enable two H264 encoder cores on MT8195
To:     Irui Wang <irui.wang@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210816105934.28265-1-irui.wang@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <50a44f71-b39e-6f5c-dfc6-67377ecb4364@collabora.com>
Date:   Thu, 25 Nov 2021 11:17:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 16/08/21 12:59, Irui Wang ha scritto:
> MT8195 has two H264 encoder cores, they have their own power-domains,
> clocks, interrupts, register base. The two H264 encoder cores can work
> together to achieve higher performance.
> 
> This series of patches is to use enable two h264 encoder cores.
> path[1..2]: use linux component framework to manage encoder hardware,
> user call "mt8195-vcodec-enc" driver can get the encoder master device,
> the encoding work is done by the two encoder core device. The hw_mode
> variable is added to distinguish from old platform, two encoder cores
> called "FRAME_RACING_MODE".
> 
> The hardware mode of two encoder cores work together(overlap, another
> word called) on MT8195 called "frame_racing_mode", the two encoder
> power-domains should be power on together while encoding, the encoding
> process look like this:
> 
>      VENC Core0 frm#0....frm#2....frm#4
>      VENC Core1  .frm#1....frm#3....frm#5
> 
> patch[3..5]: due to the component device, the master device has no
> power-domains/clocks properties in dtsi, so the power/clock init function
> can't use for "frame_racing_mode" device in master device probe process,
> it should be called in component device probe process. Power on the
> hardware power and clock on demand.
> 
> patch[6]: "frame_racing_mode" encoding need a new set of memory buffer
> for two encoder cores. For compatibility, we should new a encoder driver
> interface.
> 
> patch[7..9]: add "frame_racing_mode" encoding process:
> As-Is: Synchronous
> VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder IRQ -->
> encode done with result --> job_finish
> 
> VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder IRQ -->
> encode done with result --> job_finish
> ...
> 
> To-Be: Asynchronous
> VIDIOC_QBUF#0 --> device_run(triger encoder core0) --> job_finish
> ..VIDIOC_QBUF#1 --> device_run(triger encoder core1) --> job_finish
> (core0 may encode done here, return encode result to client)
> VIDIOC_QBUF#2 --> device_run(triger encoder core0) --> job_finish
> 
> Thers is no "wait encoder IRQ" synchronous call during "frame_racing_mode"
> encoding process, which can full use the two encoder cores to achieve
> higher performance.
> 
> Irui Wang (9):
>    dt-bindings: media: mtk-vcodec: Add binding for MT8195 two venc cores
>    media: mtk-vcodec: Use component framework to manage encoder hardware
>    media: mtk-vcodec: Rewrite venc power manage interface
>    media: mtk-vcodec: Add venc power on/off interface
>    media: mtk-vcodec: Rewrite venc clock interface
>    media: mtk-vcodec: Add new venc drv interface for frame_racing mode
>    media: mtk-vcodec: Add frame racing mode encode process
>    media: mtk-vcodec: Return encode result to client
>    media: mtk-vcodec: Add delayed worker for encode timeout
> 
>   .../bindings/media/mediatek-vcodec.txt        |   2 +
>   drivers/media/platform/mtk-vcodec/Makefile    |   2 +
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  34 +-
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 120 +++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc.h      |  10 +-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 204 +++++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 253 +++++++
>   .../platform/mtk-vcodec/mtk_vcodec_enc_hw.h   |  38 +
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 213 ++++--
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  13 +-
>   .../platform/mtk-vcodec/mtk_vcodec_util.c     |  19 +
>   .../platform/mtk-vcodec/mtk_vcodec_util.h     |   5 +
>   .../platform/mtk-vcodec/venc/venc_common_if.c | 675 ++++++++++++++++++
>   .../platform/mtk-vcodec/venc/venc_h264_if.c   |   6 +-
>   .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
>   .../media/platform/mtk-vcodec/venc_drv_if.c   |  96 ++-
>   .../media/platform/mtk-vcodec/venc_drv_if.h   |   7 +
>   .../media/platform/mtk-vcodec/venc_vpu_if.c   |  11 +-
>   .../media/platform/mtk-vcodec/venc_vpu_if.h   |   3 +-
>   19 files changed, 1564 insertions(+), 149 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
>   create mode 100644 drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
> 

Hello Irui,
we have some interest in this series; can you please rebase it over the latest
changes that were sent in series [1] [2]?

Also, please follow [2], where of_platform_populate was used in place of the
component framework (where applicable and where possible) on this series, as well.

Thanks!
- Angelo

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=579201
[2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=578467
