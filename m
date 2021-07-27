Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CE73D73CE
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 12:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236288AbhG0Kzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 06:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbhG0Kze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 06:55:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A82C061757;
        Tue, 27 Jul 2021 03:55:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id B4F591F42CA0
Subject: Re: [PATCH v3, 00/15] Using component framework to support multi
 hardware decode
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <2b562943-534a-b53d-696d-9f2a4836f76e@collabora.com>
Date:   Tue, 27 Jul 2021 12:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727101051.24418-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for the patchset.

Could you provide information on how you
tested the code.
Did you test it on chromeos userspace?
Did you use the test-tast framework?
What tests did you run?

Dafna


On 27.07.21 12:10, Yunfei Dong wrote:
> This series adds support for multi hardware decode into mtk-vcodec, by first
> adding component framework to manage each hardware information: interrupt,
> clock, register bases and power. Secondly add core thread to deal with core
> hardware message, at the same time, add msg queue for different hardware
> share messages. Lastly, the architecture of different specs are not the same,
> using specs type to separate them.
> 
> This series has been tested with both MT8183 and MT8173. Decoding was working
> for both chips.
> 
> Patches 1,2 rewrite get register bases and power on/off interface.
> 
> Patch 3-5 add component framework to support multi hardware.
> 
> Patches 6-14 add interfaces to support core hardware.
> ----
> This patch dependents on "media: mtk-vcodec: support for MT8183 decoder"[1].
> 
> Multi hardware decode is based on stateless decoder, MT8183 is the first time
> to add stateless decoder. Otherwise it will cause conflict. Please also accept
> this patch together with [1].
> 
> [1]https://lore.kernel.org/patchwork/project/lkml/list/?series=507084
> ----
> Changes compared with v2:
> - Fix return value for patch 1/15
> - Add this new patch to align vdec and venc wake up ctx interface for patch 2/15
> - Fix comments for patch 4/15
> - Change txt files to yaml for patch 5/15
> - Generalize wake up ctx interface for stateless and stateful decode for patch 7/15
> - Add document for structs and functions for patch 8/15
> - Add condition to check the return value of kthread_run for patch 11/15
> - Fix yaml check fail for patch 13/15
> 
> Changes compared with v1:
> - Fix many comments for patch 3/14
> - Remove unnecessary code for patch 4/14
> - Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
> - Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
> - Using yaml format to instead of txt file for patch 12/14
> 
> Yunfei Dong (15):
>    media: mtk-vcodec: Get numbers of register bases from DT
>    media: mtk-vcodec: Align vcodec wake up interrupt interface
>    media: mtk-vcodec: Refactor vcodec pm interface
>    media: mtk-vcodec: Use component framework to manage each hardware
>      information
>    dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
>      dt-bindings
>    media: mtk-vcodec: Use pure single core for MT8183
>    media: mtk-vcodec: Add irq interface for multi hardware
>    media: mtk-vcodec: Add msg queue feature for lat and core architecture
>    media: mtk-vcodec: Generalize power and clock on/off interfaces
>    media: mtk-vcodec: Add new interface to lock different hardware
>    media: mtk-vcodec: Add core thread
>    media: mtk-vcodec: Support 34bits dma address for vdec
>    dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
>    media: mtk-vcodec: Add core dec and dec end ipi msg
>    media: mtk-vcodec: Use codec type to separate different hardware
> 
>   .../media/mediatek,vcodec-comp-decoder.yaml   | 154 +++++++++
>   .../media/mediatek,vcodec-decoder.yaml        | 138 ++++++++
>   .../media/mediatek,vcodec-encoder.yaml        | 128 ++++++++
>   .../bindings/media/mediatek-vcodec.txt        | 130 --------
>   drivers/media/platform/mtk-vcodec/Makefile    |   2 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
>   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 296 +++++++++++++++---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 184 +++++++++++
>   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  48 +++
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  98 ++++--
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  13 +-
>   .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
>   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   1 +
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  76 ++++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  12 +-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   1 -
>   .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  27 +-
>   .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
>   .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 ++++-
>   .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
>   .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 +-
>   .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   2 +-
>   .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 +-
>   .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 +-
>   .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
>   .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
>   .../platform/mtk-vcodec/vdec_msg_queue.c      | 290 +++++++++++++++++
>   .../platform/mtk-vcodec/vdec_msg_queue.h      | 157 ++++++++++
>   .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
>   .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
>   .../platform/mtk-vcodec/venc/venc_h264_if.c   |   2 +-
>   .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
>   33 files changed, 1697 insertions(+), 280 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> 
