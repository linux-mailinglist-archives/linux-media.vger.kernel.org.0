Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 390D4165174
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 22:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgBSVRX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 16:17:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38990 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSVRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 16:17:22 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id C31D428DE65
Subject: Re: [RFC PATCH V5 0/3] media: support Mediatek sensor interface
 driver
To:     Louis Kuo <louis.kuo@mediatek.com>, hans.verkuil@cisco.com,
        laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
        keiichiw@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org,
        "kernel@collabora.com" <kernel@collabora.com>
References: <20200129081650.8027-1-louis.kuo@mediatek.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f825b943-610e-ba19-cbfd-eea2dae2245f@collabora.com>
Date:   Wed, 19 Feb 2020 18:17:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129081650.8027-1-louis.kuo@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Louis,

On 1/29/20 6:16 AM, Louis Kuo wrote:
> Hello,
> 
> This is the RFC patch adding Sensor Inferface(seninf) driver on Mediatek mt8183 SoC, which will be used
> in camera features on CrOS application.
> It belongs to the first Mediatek's camera driver series based on V4L2 and media controller framework.
> I posted the main part of the seninf driver as RFC to discuss first and would like some review comments
> on the overall structure of the driver.
> 
> The driver is implemented with V4L2 framework.
> 1. Register as a V4L2 sub-device.
> 2. Only one entity with sink pads linked to camera sensors for choosing desired camera sensor by setup link
>    and with source pads linked to cam-io for routing different types of decoded packet datas to PASS1 driver
>    to generate sensor image frame and meta-data.

If I understood correctly, the subdevice represents a bridge, with 4 sink pads and 8 source pads (12 total) right?
And you can only route a sink to a source at a time and you can't use multiple sensors simultaneously, correct?

> 
> The overall file structure of the seninf driver is as following:
> 
> * mtk_seninf.c: Implement software and HW control flow of seninf driver.
> * mtk_seninf_def.h: Define data structure and enumeration.
> * mtk_seninf_reg.h: Define HW register R/W macros and HW register names.
> 
> [ V5: use recommended coding style, revise DT binding documentation]
> 
>   media: platform: mtk-isp: Add Mediatek sensor interface driver

It looks like patch 1/3 didn't reach linux-media mailing list
    https://patchwork.linuxtv.org/project/linux-media/list/?series=1706
I guess it's because of its size, you might need to break it into smaller patches.
I see that mtk_seninf_reg.h is really big and not all of it is used, maybe you can split it up.


>   dt-bindings: mt8183: Add sensor interface dt-bindings
>   dts: arm64: mt8183: Add sensor interface nodes
> 
>  .../bindings/media/mediatek-seninf.txt        |   66 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   12 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/mtk-isp/Kconfig        |   17 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
>  .../platform/mtk-isp/isp_50/seninf/Makefile   |    6 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf.c        | 1112 +++
>  .../mtk-isp/isp_50/seninf/mtk_seninf_def.h    |   72 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h    | 7747 +++++++++++++++++
>  9 files changed, 9036 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> 

Thanks
Helen
