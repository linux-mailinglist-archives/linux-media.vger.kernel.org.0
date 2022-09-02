Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85E375AAAF3
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 11:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbiIBJKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 05:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234776AbiIBJKu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 05:10:50 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFA65F132;
        Fri,  2 Sep 2022 02:10:49 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D44A6601F04;
        Fri,  2 Sep 2022 10:10:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1662109848;
        bh=lDJ9dZRK9MgMljtZl2+U/+k0zbMoLNgyT3MdX+UUElE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RYKJ4rmIkBKJ2y0peq0CDqlputlhNbpNUSAKuCxM7tyuMEXWz+AGEpEBpoM5phane
         QFy/faz1o2AOPz1NFQUJ5SoEniZizj5rdVd4mKszXzBVyfTp8Ii66PaGz+PLitkYbq
         qepVJTYeMLNzmt9du+amJeji8HPfRRbqxzmBUyCCAmIXlMKn2Xu5Rshk5jWrL0u/UM
         KL7gmOO3ZBvBWW6BAdDXffcWb2QYrftkEsVFwUBlw1t6vNzgm1o8OeJCHIG0dg6Yjn
         GMlZP7KHhyQwUuggnacXvBLtUqtv5j2Gqsv1sMhPMqQQHazBF9+HqrNfplYNLr1hUS
         qtbyY6gdjJCNA==
Message-ID: <ee6221e1-8ce6-9fe0-6094-1cd156fdaae3@collabora.com>
Date:   Fri, 2 Sep 2022 11:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/3] media: platform: mtk-mdp3: fix error return code in
 mdp_vpu_dev_init()
Content-Language: en-US
To:     Sun Ke <sunke32@huawei.com>, mchehab@kernel.org,
        matthias.bgg@gmail.com, hverkuil-cisco@xs4all.nl,
        ping-hsun.wu@mediatek.com, daoyuan.huang@mediatek.com,
        moudy.ho@mediatek.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-4-sunke32@huawei.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220902085820.3777360-4-sunke32@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 02/09/22 10:58, Sun Ke ha scritto:
> If mdp_vpu_shared_mem_alloc failed, mdp_vpu_dev_init should return -ENOMEM.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Hello Sun,
thanks for the patch! However, someone else already sent the same fix and it's
in a better shape. Please look at [1].

Thanks,
Angelo

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/YxDGFMwyeNXFPaig@kili/

> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> index 9f5844385c8f..078040b7f65e 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> @@ -175,6 +175,7 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
>   	mem_size = vpu_alloc_size;
>   	if (mdp_vpu_shared_mem_alloc(vpu)) {
>   		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
> +		err = -ENOMEM;
>   		goto err_mem_alloc;
>   	}
>   
> 


