Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEFE437426
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 10:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232538AbhJVJAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 05:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbhJVJAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 05:00:41 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC21C061764;
        Fri, 22 Oct 2021 01:58:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 6CCD91F44F77
Subject: Re: [PATCH v3 9/9] media: platform: mtk-mdp3: Add dual pipe feature
 support
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
 <20211022022146.3577-10-roy-cw.yeh@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <def8532b-c454-a87a-8d53-fa4a77791b9c@collabora.com>
Date:   Fri, 22 Oct 2021 10:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022022146.3577-10-roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 22/10/21 04:21, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add dual pipe feature which uses two svpp to execute dma
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



> ---
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 189 ++++++++++++++----
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   1 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  11 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   3 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   4 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  15 ++
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |   4 +
>   7 files changed, 185 insertions(+), 42 deletions(-)
> 

