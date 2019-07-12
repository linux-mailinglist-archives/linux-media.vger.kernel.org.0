Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC36667D6
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 09:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfGLHhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 03:37:22 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:2655 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725877AbfGLHhW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 03:37:22 -0400
X-UUID: 05fbbb4b28594fa69adb835a9a3aed10-20190712
X-UUID: 05fbbb4b28594fa69adb835a9a3aed10-20190712
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 415586906; Fri, 12 Jul 2019 15:37:14 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 12 Jul
 2019 15:37:12 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 12 Jul 2019 15:37:12 +0800
Message-ID: <1562917032.29653.7.camel@mhfsdcap03>
Subject: Re: [PATCH] media: platform: mtk-mdp: mtk_mdp_core: Add
 of_node_put() before goto
From:   houlong wei <houlong.wei@mediatek.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
CC:     <houlong.wei@mediatek.com>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>
Date:   Fri, 12 Jul 2019 15:37:12 +0800
In-Reply-To: <20190709172454.13648-1-nishkadg.linux@gmail.com>
References: <20190709172454.13648-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 79F4A719342E98B201861EFA9EC14351327E4D4119A09EDE5AA191DCE970379F2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-07-10 at 01:24 +0800, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a goto from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the goto in two
> places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index fc9faec85edb..d0a3f06ad83d 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -145,13 +145,16 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
>  		if (!comp) {
>  			ret = -ENOMEM;
> +			of_node_put(node);
>  			goto err_comp;
>  		}
>  		mdp->comp[comp_id] = comp;
>  
>  		ret = mtk_mdp_comp_init(dev, node, comp, comp_id);
> -		if (ret)
> +		if (ret) {
> +			of_node_put(node);
>  			goto err_comp;
> +		}
>  	}
>  
>  	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);

Thanks Nishka for fixing the bug.

Acked-by: Houlong Wei <houlong.wei@mediatek.com>

