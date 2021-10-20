Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02EA4347EB
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 11:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhJTJbr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 05:31:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58044 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhJTJbp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 05:31:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 08B1E1F43FDB
Subject: Re: [PATCH v2 3/9] media: platform: mtk-mdp3: add chip independence
 architecture
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
References: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
 <20211020071448.14187-4-roy-cw.yeh@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <89b3f65d-3ad1-5f81-7e16-0c00db74678b@collabora.com>
Date:   Wed, 20 Oct 2021 11:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020071448.14187-4-roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 20/10/21 09:14, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add chip independence architecture
> - Add hal architecture for mt8183
> - Add driver data to adapt other soc
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 154 ++++---
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 181 ++++-----
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   | 193 ++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 383 +++++++++++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  19 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  10 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 259 +-----------
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   | 268 ++++++------
>   8 files changed, 925 insertions(+), 542 deletions(-)
> 

snip...

> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> index a6caefb097be..50fd5430a565 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c

snip..

> @@ -732,7 +514,7 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
>   	param->num_captures = 1;
>   	frame = &param->captures[0];
>   	frame->format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -	frame->mdp_fmt = mdp_try_fmt_mplane(&frame->format, param, 0);
> +	frame->mdp_fmt = mdp_try_fmt_mplane(mdp, &frame->format, param, 0);
>   	frame->ycbcr_prof =
>   		mdp_map_ycbcr_prof_mplane(&frame->format,
>   					  frame->mdp_fmt->mdp_color);
> @@ -744,3 +526,4 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
>   
>   	return 0;
>   }
> +

Please remove this empty new line.

Apart from that,

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
