Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A445AAAF8
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 11:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbiIBJLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 05:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234836AbiIBJL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 05:11:29 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFDE2ED72;
        Fri,  2 Sep 2022 02:11:28 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D900C6601F04;
        Fri,  2 Sep 2022 10:11:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1662109887;
        bh=EbLnAfL1q9nzyDgYiKgpj5/yjDssEj9usoV+zglURE8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BjtAHi8p+pCwYDqqOIb1c2oBBuYVhEhBeMbpVvslsKBeMnrMrgQfL9R2+tCX8eYbw
         CEfOkM+JrfKdmKY+jekkXLfZAQC1YCeEDE7cKxMkqmbGVr6DWJA96QUr12S9t0NMbZ
         W43NyW0VUw94dcYIxNR4dJdq2EuIPLcqlc2QAFhuZ/VVpAJmY7Xh6j8Yafdcx0UZ70
         noDkRwm6F4Lrz2WIsz7FjFFbvOfCTkPAzuVW+vFTRBeM7tdYM5IK9L53zRcsAVzT6s
         a5fKV85IBBOZCTIIiEyR473aYVfvKkr3ors/J6YlElP/+muP9F+F8qBIaruyTMjpt4
         VDtqaIdcDnsbQ==
Message-ID: <bd4a91ec-33fa-aa95-1845-8fd5ce70c176@collabora.com>
Date:   Fri, 2 Sep 2022 11:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] media: platform: mtk-mdp3: fix error code in
 mdp_vpu_dev_init()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Moudy Ho <moudy.ho@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <YxDGFMwyeNXFPaig@kili>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YxDGFMwyeNXFPaig@kili>
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

Il 01/09/22 16:47, Dan Carpenter ha scritto:
> Return a negative error code if mdp_vpu_shared_mem_alloc() fails.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


