Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 226A3747041
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjGDL7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjGDL7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:59:37 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9205610A;
        Tue,  4 Jul 2023 04:59:36 -0700 (PDT)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C0B016606F8B;
        Tue,  4 Jul 2023 12:59:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1688471974;
        bh=KgU5DuxFUlWjByoqrF+GPfDgTBGAD9hOjf3Ly37cgqs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fdBWQfwuZBznWUYGHIr/rz/kbQjYSdDK7qDNCIKOMIp1XdclZ69Dcg7GobbIKwz/b
         QL64xOyyMioXnY3Qi3jQK9bPlyZ3ZQd2w/MATPgT34stogd0s3p/T5tr0O7Qz83JEt
         tY2YkUUmiFKDvkeGeuT3yAPubmOqK5JmcCSFncow8/zKDdaNZ7BN3ynUOONI/oe8r9
         AfJEYrtldXbK64l38u+rpduGdafU0sOJObgLxWZDaBqOHGAGH8nb4FY9nuo/+QFglw
         UO2vfpORoPUzggZZqA9wmda/38RX+warBCFEysAt52DddiWzCtbUAbDQi/3GCgMujv
         QwvmPfFOHlT4A==
Message-ID: <e3b3a035-508d-1422-30eb-876fd38795e3@collabora.com>
Date:   Tue, 4 Jul 2023 13:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [v4, PATCH] drm/mediatek: add dma buffer control for drm plane
 disable
Content-Language: en-US
To:     Yongqiang Niu <yongqiang.niu@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Hsin-Yi Wang <hsinyi@chromium.org>
References: <20230704090432.5844-1-yongqiang.niu@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704090432.5844-1-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 04/07/23 11:04, Yongqiang Niu ha scritto:
> dma buffer release before overlay disable, that will cause
> m4u translation fault warning.
> 
> add dma buffer control flow in mediatek driver:
> get dma buffer when drm plane disable
> put dma buffer when overlay really disable
> 
> Fixes: 41016fe1028e4 ("drm: Rename plane->state variables in atomic update and disable")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Hello,

could you please rebase this over [1] for linux-next, while retaining this for
stable backports?

[1]: 
https://lore.kernel.org/lkml/20230623094931.117918-1-angelogioacchino.delregno@collabora.com/

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 25 ++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 12 ++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h |  1 +
>   3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d40142842f85..49d671100785 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/clk.h>
> +#include <linux/dma-buf.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/mailbox_controller.h>
>   #include <linux/pm_runtime.h>
> @@ -283,6 +284,23 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>   	return NULL;
>   }
>   
> +static void mtk_drm_dma_buf_put(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +		struct drm_plane *plane = &mtk_crtc->planes[i];
> +		struct mtk_plane_state *plane_state;
> +
> +		plane_state = to_mtk_plane_state(plane->state);
> +
> +		if (plane_state && plane_state->pending.dma_buf) {
> +			dma_buf_put(plane_state->pending.dma_buf);
> +			plane_state->pending.dma_buf = NULL;
> +		}
> +	}
> +}
> +
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>   {
> @@ -323,6 +341,8 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>   		mtk_crtc->pending_async_planes = false;
>   	}
>   
> +	mtk_drm_dma_buf_put(mtk_crtc);
> +
>   	mtk_crtc->cmdq_vblank_cnt = 0;
>   	wake_up(&mtk_crtc->cb_blocking_queue);
>   }
> @@ -624,9 +644,14 @@ static void mtk_crtc_ddp_irq(void *data)
>   	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
>   		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
>   			  drm_crtc_index(&mtk_crtc->base));
> +
> +	if (!mtk_crtc->cmdq_client.chan)
> +		mtk_drm_dma_buf_put(mtk_crtc);
>   #else
>   	if (!priv->data->shadow_register)
>   		mtk_crtc_ddp_config(crtc, NULL);
> +
> +	mtk_drm_dma_buf_put(mtk_crtc);
>   #endif
>   	mtk_drm_finish_page_flip(mtk_crtc);
>   }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 31f9420aff6f..66e6393e45ee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -12,6 +12,7 @@
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <linux/align.h>
> +#include <linux/dma-buf.h>
>   
>   #include "mtk_drm_crtc.h"
>   #include "mtk_drm_ddp_comp.h"
> @@ -266,6 +267,17 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
>   	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>   									   plane);
>   	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
> +
> +	if (old_state && old_state->fb) {
> +		struct drm_gem_object *gem = old_state->fb->obj[0];
> +
> +		if (gem && gem->dma_buf) {
> +			get_dma_buf(gem->dma_buf);
> +			mtk_plane_state->pending.dma_buf = gem->dma_buf;
> +		}
> +	}
>   	mtk_plane_state->pending.enable = false;
>   	wmb(); /* Make sure the above parameter is set before update */
>   	mtk_plane_state->pending.dirty = true;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index 99aff7da0831..3aba0b58ef3c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -33,6 +33,7 @@ struct mtk_plane_pending_state {
>   	bool				async_dirty;
>   	bool				async_config;
>   	enum drm_color_encoding		color_encoding;
> +	struct dma_buf			*dma_buf;
>   };
>   
>   struct mtk_plane_state {


