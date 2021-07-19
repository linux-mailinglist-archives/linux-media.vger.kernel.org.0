Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE713CCE2F
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 09:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbhGSHEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 03:04:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60804 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234699AbhGSHEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 03:04:00 -0400
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 25DE81F422A8;
        Mon, 19 Jul 2021 08:00:59 +0100 (BST)
Subject: Re: [PATCH v2, 00/14] Using component framework to support multi
 hardware decode
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Collabora Kernel ML <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <bac9fe10-50e1-a91f-8f71-b6295227d01b@collabora.com>
Date:   Mon, 19 Jul 2021 09:00:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081233.7809-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 17.07.21 10:12, Yunfei Dong wrote:
> This series adds support for multi hardware decode into mtk-vcodec, by first
> adding component framework to manage each hardware information: interrupt,
> clock, register bases and power. Secondly add core thread to deal with core
> hardware message, at the same time, add msg queue for different hardware
> share messages. Lastly, the architecture of different specs are not the same,
> using specs type to separate them.
> 
> This series has been tested with both MT8183 and MT8173. Decoding was working
> for both chips.

Hi, I am currently working on stabilizing the codec drivers on mt8173 chromeos
  device (elm). It would be very helpful if you provide information on how you
tested the code.
Did you test it on chromeos userspace?
Did you use the test-tast framework?
What tests did you run?

Thanks,
Dafna

> 
> Patches 1,2 rewrite get register bases and power on/off interface.
> 
> Patch 3-5 add component framework to support multi hardware.
> 
> Patches 6-14 add interfaces to support core hardware.
> ----
> This patch dependents on "media: mtk-vcodec: support for MT8183 decoder"[1].
> 
> Multi hardware decode is based on stateless decoder, MT8183 is the first
> time to add stateless decoder. Otherwise it will cause conflict.
> Please also accept this patch together with [1].
> 
> [1]https://lore.kernel.org/patchwork/project/lkml/list/?series=507084
> ----
> 
> Changes compared with v1:
> - Fix many comments for patch 3/14
> - Remove unnecessary code for patch 4/14
> - Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
> - Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
> - Using yaml format to instead of txt file for patch 12/14
> 
> Yunfei Dong (14):
>    media: mtk-vcodec: Get numbers of register bases from DT
>    media: mtk-vcodec: Refactor vcodec pm interface
>    media: mtk-vcodec: Use component framework to manage each hardware
>      information
>    dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
>      dt-bindings
>    media: mtk-vcodec: Use pure single core for MT8183
>    media: mtk-vcodec: Add irq interface for core hardware
>    media: mtk-vcodec: Add msg queue feature for lat and core architecture
>    media: mtk-vcodec: Generalize power and clock on/off interfaces
>    media: mtk-vcodec: Add new interface to lock different hardware
>    media: mtk-vcodec: Add core thread
>    media: mtk-vcodec: Support 34bits dma address for vdec
>    dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
>    media: mtk-vcodec: Add core dec and dec end ipi msg
>    media: mtk-vcodec: Use codec type to separate different hardware
> 
>   .../media/mediatek-vcodec-comp-decoder.yaml   | 150 +++++++++
>   ...vcodec.txt => mediatek-vcodec-decoder.txt} |  62 +---
>   .../media/mediatek-vcodec-encoder.txt         |  73 +++++
>   drivers/media/platform/mtk-vcodec/Makefile    |   2 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
>   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 297 +++++++++++++++---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 194 ++++++++++++
>   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  50 +++
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  98 ++++--
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  13 +-
>   .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
>   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   1 +
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  72 ++++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   1 -
>   .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  32 +-
>   .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
>   .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 ++++-
>   .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
>   .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
>   .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
>   .../platform/mtk-vcodec/vdec_msg_queue.c      | 286 +++++++++++++++++
>   .../platform/mtk-vcodec/vdec_msg_queue.h      | 143 +++++++++
>   .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
>   .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
>   25 files changed, 1516 insertions(+), 168 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml
>   rename Documentation/devicetree/bindings/media/{mediatek-vcodec.txt => mediatek-vcodec-decoder.txt} (56%)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> 
