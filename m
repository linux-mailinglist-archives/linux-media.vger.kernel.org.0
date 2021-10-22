Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4DF437424
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 10:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbhJVJAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 05:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbhJVJAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 05:00:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A789C061243;
        Fri, 22 Oct 2021 01:58:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 11BF31F44F74
Subject: Re: [PATCH v3 8/9] media: platform: mtk-mdp3: support mt8195
To:     "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        "jason-jh . lin" <jason-jh.lin@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Moudy Ho <moudy.ho@mediatek.com>,
        "river . cheng" <river.cheng@mediatek.com>,
        Yongqiang Niu <yongqiang.niu@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
 <20211022022146.3577-9-roy-cw.yeh@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <59d184c6-87ee-918c-b3cb-abb923c39912@collabora.com>
Date:   Fri, 22 Oct 2021 10:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022022146.3577-9-roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add mt8195 driver
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



> ---
>   drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |   24 +
>   .../media/platform/mtk-mdp3/mdp_reg_color.h   |   29 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_fg.h  |   23 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |   31 +
>   .../media/platform/mtk-mdp3/mdp_reg_merge.h   |   23 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |   24 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |   20 +
>   .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   31 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |    6 +
>   .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   |  114 ++
>   .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   18 +
>   drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  215 ++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  496 ++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1196 ++++++++++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |   83 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  703 +++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   31 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |    4 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  143 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |    2 +
>   20 files changed, 3020 insertions(+), 196 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_color.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h
> 
