Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC5A45AAAE7
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 11:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235358AbiIBJJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 05:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiIBJJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 05:09:02 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BCEAA4CD;
        Fri,  2 Sep 2022 02:09:02 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4DA086601F04;
        Fri,  2 Sep 2022 10:09:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1662109740;
        bh=me5bwAelKcyFGZPLRPYw5VKaBsEgHRaZdTst+izZfuU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=EOaGpB91B1iotFwQ5oFBUUoPinLhioyJNTo9eCwD4GGwoQkfLXxtCGdtlxO7tC6pl
         tJPxMohoawjrnc0ql2wvZGuCD+KdtMKoJL+stVNdW2s3dxbw5IBLpUVERXEADT0PtQ
         VJ5/2t31KpDHe9igYh23GC5lNRogOyC5f0a7b/eiWOaq9MHv2xxQNmC80KF5Fj0F2H
         Dp3157s1LqH1uQVxfT9Vz7ppyFI15qh2EaP32cYLZ2RXdt8VgLpipz9vmcmb/rzNBI
         25AxEzSADd2+QENa9KFUqGqB96fhB0uZclbCyMvDugMwtyJJ4/AfhUpkcVr53h9GK/
         tLjLaS8P0jzYA==
Message-ID: <9c10dac6-bb24-976a-f207-fc70603d4586@collabora.com>
Date:   Fri, 2 Sep 2022 11:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] media: platform: mtk-mdp3: use devm_kfree to free
 memory allocated with devm_kmalloc()
Content-Language: en-US
To:     Sun Ke <sunke32@huawei.com>, mchehab@kernel.org,
        matthias.bgg@gmail.com, hverkuil-cisco@xs4all.nl,
        ping-hsun.wu@mediatek.com, daoyuan.huang@mediatek.com,
        moudy.ho@mediatek.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-2-sunke32@huawei.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220902085820.3777360-2-sunke32@huawei.com>
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
> comp is allocated with devm_kmalloc(), use devm_kfree to free it.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


