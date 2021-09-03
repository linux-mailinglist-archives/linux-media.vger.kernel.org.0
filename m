Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244AF3FFD70
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 11:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234985AbhICJtq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 05:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234898AbhICJtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 05:49:45 -0400
X-Greylist: delayed 456 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Sep 2021 02:48:45 PDT
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54656C061575;
        Fri,  3 Sep 2021 02:48:45 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id M5oQmN7Ajy7WyM5oRmA06H; Fri, 03 Sep 2021 11:48:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630662523; bh=SJ8hd1vkoE1lDR7Gui6NdVSUUgSzmWITome7gxPlUDU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j6p6FJi6YLNAQCdU6hfsWGUf3VqqCIrYZiKbDUYj5qegwetrBhX/nNKewE1O1TGTa
         /tRsIIdCQsxDvkroD9J9avuXIkQjK5qzVUfuX53WBjhogMasACClK23P0E0uEk5f3+
         bA2IEZlGtUaUX7Nr8tKkeFIdB8LARUVSuSHkyx+VJSUmQn6JwJkney2LOCCnVVJU+T
         mvMJaypvY1mf6+yKfvfp1hosjcc3KTcc+ZTrgsrkXSytsamvq8GoHbnhSDzyCHEyZC
         exZxNVlSPCX+atGtLUSqkaxsjidkwwyE6S8HjXwUSQVqrUmlqaLV/41ZF7Ky5AZW7B
         iFfjQibG/1Srg==
Subject: Re: [PATCH v7 5/5] media: platform: mtk-mdp3: Add Mediatek MDP3
 driver
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream@mediatek.com, hsinyi@google.com
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-6-moudy.ho@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6898a212-6ccf-b668-fc70-cc8fd4bb39f5@xs4all.nl>
Date:   Fri, 3 Sep 2021 11:48:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824100027.25989-6-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ4ioDmS4XtQHcugZwVkBni7FGMQiywW0gjM3kJxcDJjOQZ2L4kqAsGHSfISHRR/5AXECJ0HS3oAZm0u4YKkjd+0JKhwzM4XgPxJr35egUjDy2+LHGok
 Z9F2+O4SFhAob1iDfSzyZv3Rp0RKcTH6b00WEl3WVJWpE9oCTWb95ffxbtLNZYLkgDnqvht0HoMtOxpWI6nySJYzwKZQ+ivG/Cz5xe5Xa525f8T8QaO4/Ej9
 ol0fME5v6XF4BaPQZ8HEK+posxVZ5i1Fav7DGdW+or7cu0AzafNiWJpSVeru0l24kc/Gf6g8i8ZWUEpagGoL4rVmpqbVSPXFYaRKDLZJNa1wpUc0sj5Rmt9H
 bqscLv8O9cSh9uSTrgFxzQj2webhgMD1PjmkU2U1lveYIcxiC4fjEtoU/RGAfdvuePT4VfhG+m9Fm/7jI4CDUObSeO8KFUbTKMp0Tikw/HI6L5oyWTM9Vg3d
 fH8uZdy2E8ostYECZes7wsfSPs8BPS7GiPSQJL1XaBeDEURptiAQkRVzVZJeSNtGVQhngrWcAMAEAk2A9qCAxweLrKIsATU80hlWI3TGlsluIJ3xYW1xXiYX
 /bim1qkBOt0004Jspanj4fv/rxxOf42+H1Y0YtfH9MfMJtuPX2kMfe/ZkFW59xaaiDF7DsYt5EikKEzvlYrdqH441hMnJGOCFsEWhsNLKJYNnOC6Dhkextxt
 Uwt90RdZeU8+c3Ua/HYhOAkrX6aUwIc/blpywayEtAcGSA0mGowrVfOc8dr3dgaCb3ZmuJKp3qJDlvNXrdL+x9rvI26/MgcMmjbPcOkfgtM+uf9lZ13ngZiE
 b2lacG87jUILXuTWanJaMvl/duxSJQTlKMRvzQQ0pD/NLEnSNG7I1kMlQWsT72XfN4rwTH5XGDHA+IerYJQVf0z3K3Q0T4lTCezjDgUyeW00tK/djXYOrOY4
 XuTc3z+IPCG/U+qvgk/yx/zClC+qYora5WFp1pQPFvzYagbbpLGof9LWI1FaXnySR0S7g+kwx3an14wahxiL4ggb/fzv9UjKUvEFRPf2vj9RkCasQSS0d8S8
 t7t8sxFGu6J2IMAe2I4TJ7KOgz1PvCoWTEwnr3AtBhpsE/CbElNjFUDiggyqgoP7S/t9x3Oy3x2VIdFUOLShrWSmbufDEShsDRIbAzzSnOr5CTGpmM8d3hWz
 1awnQY2/CLTiiVr4TCTVBA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/08/2021 12:00, Moudy Ho wrote:
> This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> It provides the following functions:
>   color transform, format conversion, resize, crop, rotate, flip
>   and additional image quality enhancement.
> 
> The MDP3 driver is mainly used for Google Chromebook products to
> import the new architecture to set the HW settings as shown below:
>   User -> V4L2 framework
>     -> MDP3 driver -> SCP (setting calculations)
>       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> 
> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_" prefix
> GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> Probe, power, suspend/resume, system level functions are defined in
> mtk-mdp3-core.c
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
> Depend on:
>    [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-9-acourbot@chromium.org/
>    [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-10-acourbot@chromium.org/
> ---
>  drivers/media/platform/Kconfig                |   19 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-mdp3/Makefile      |    6 +
>  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
>  drivers/media/platform/mtk-mdp3/mdp_reg_isp.h |   27 +
>  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
>  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
>  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
>  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  280 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  507 +++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   46 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1307 +++++++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  147 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  329 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   75 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  801 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   41 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  746 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  372 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  312 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   78 +
>  22 files changed, 5320 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 157c924686e4..b7f331dbe1b5 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -299,6 +299,25 @@ config VIDEO_MEDIATEK_MDP
>  	    To compile this driver as a module, choose M here: the
>  	    module will be called mtk-mdp.
>  
> +config VIDEO_MEDIATEK_MDP3
> +	tristate "Mediatek MDP v3 driver"
> +	depends on MTK_IOMMU

This should probably be:

	depends on MTK_IOMMU || COMPILE_TEST

> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on HAS_DMA
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEO_MEDIATEK_VPU
> +	select MTK_CMDQ
> +	select MTK_SCP
> +	default n
> +	help
> +	    It is a v4l2 driver and present in Mediatek MT8183 SoC.
> +	    The driver supports for scaling and color space conversion.
> +
> +	    To compile this driver as a module, choose M here: the
> +	    module will be called mtk-mdp3.
> +
>  config VIDEO_MEDIATEK_VCODEC
>  	tristate "Mediatek Video Codec driver"
>  	depends on MTK_IOMMU || COMPILE_TEST

Regards,

	Hans
