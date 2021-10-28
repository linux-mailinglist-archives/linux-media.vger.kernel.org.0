Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF5943DD87
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 11:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhJ1JRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 05:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1JRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 05:17:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542B9C061745;
        Thu, 28 Oct 2021 02:14:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id D0B471F44910
Subject: Re: [PATCH v1] media: platform: mtk-mdp3: Revise frame change
 criteria
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
References: <20211028040902.437-1-roy-cw.yeh@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <f2be422f-5b0b-4f9e-d462-0c1308247a1c@collabora.com>
Date:   Thu, 28 Oct 2021 11:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028040902.437-1-roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 28/10/21 06:09, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> frame_change will trigger MDP SCP to re-calculate path and parameter.
> MDP fails when it doesn't get correct parameter to process frame.
> frame_change raises when size change occurs
> no matter it happens in input or output frame
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
> This patch is based on [1]
> [1] Reconfigure SHM to improve performance
>      - https://patchwork.kernel.org/project/linux-mediatek/patch/20211022092827.24631-3-roy-cw.yeh@mediatek.com/
> ---
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  2 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    | 20 ++++----
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 50 +++++++++++++++++++
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  8 +++
>   4 files changed, 71 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> index 737082093997..0d2b86019723 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> @@ -11,6 +11,7 @@
>   #include <media/v4l2-mem2mem.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/soc/mediatek/mtk-mutex.h>
> +#include "mtk-mdp3-regs.h"
>   #include "mtk-mdp3-comp.h"
>   #include "mtk-mdp3-vpu.h"
>   
> @@ -107,6 +108,7 @@ struct mdp_dev {
>   	atomic_t				cmdq_count;
>   	struct mdp_cmdq_pkt_pool		*cmdq_pool;
>   	struct mdp_cmdq_pkt_pool		*cmdq_d_pool;
> +	struct mdp_framechange_param		prev_image;
>   };
>   
>   struct mdp_pipe_info {
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> index 4684bb3718d3..6cd7bd610715 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> @@ -98,8 +98,8 @@ static void mdp_m2m_worker(struct work_struct *work)
>   	struct vb2_v4l2_buffer *src_vb, *dst_vb;
>   	struct img_ipi_frameparam param = {0};
>   	struct mdp_cmdq_param task = {0};
> +	struct mdp_framechange_param cur_frame = {0};
>   	enum vb2_buffer_state vb_state = VB2_BUF_STATE_ERROR;
> -	static u8 prev_scenario;
>   	int ret;
>   
>   	if (mdp_m2m_ctx_is_state_set(ctx, MDP_M2M_CTX_ERROR)) {
> @@ -118,21 +118,23 @@ static void mdp_m2m_worker(struct work_struct *work)
>   	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
>   	mdp_set_scenario(ctx->mdp_dev, &param, frame);
>   
> -	if (prev_scenario != param.type) {
> -		prev_scenario = param.type;
> +	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
> +
> +	cur_frame.scenario = param.type;
> +	memcpy(&cur_frame.in, &param.inputs[0], sizeof(cur_frame.in));
> +	memcpy(&cur_frame.out, &param.outputs[0], sizeof(cur_frame.out));
> +
> +	if (mdp_get_framechange(ctx->mdp_dev, &cur_frame))
>   		param.frame_change = true;
> -	} else {
> +	else
>   		param.frame_change = (ctx->frame_count == 0) ? true : false;
> -	}
>   
>   	if (param.frame_change)
>   		dev_info(&ctx->mdp_dev->pdev->dev,
>   			 "MDP Scenario: %d\n", param.type);
>   
> -	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> -	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> -	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
> -
>   	dst_vb->vb2_buf.timestamp = src_vb->vb2_buf.timestamp;
>   	param.timestamp = src_vb->vb2_buf.timestamp;
>   
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> index 91c5e35947d3..e182d27a1c3f 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> @@ -434,6 +434,56 @@ static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
>   	return 0;
>   }
>   
> +int mdp_get_framechange(struct mdp_dev *mdp,
> +			struct mdp_framechange_param *cur)

This function is returning 0 or 1, so it would be more appropriate to return
a bool instead.

> +{
> +	int ret = 0;

This would also be a bool.

> +	struct mdp_framechange_param *prev;
> +
> +	prev = &mdp->prev_image;
> +	if (prev->scenario != cur->scenario)
> +		ret = true;
> +
> +	if (prev->in.buffer.format.width != cur->in.buffer.format.width ||

It's useless to perform other checks if you've already determined that
ret = true... so I think you should aggregate all checks in one big
conditional.

if ( (prev->scenario != cur->scenario) ||
      /* Input buffers */
      (prev->in.buffer............ || .... ) ||
      /* Output buffers */
      (.....) ) {
	ret = true;
}

> +	    prev->in.buffer.format.height != cur->in.buffer.format.height)
> +		ret = true;
> +
> +	if (prev->out.buffer.format.width != cur->out.buffer.format.width ||
> +	    prev->out.buffer.format.height != cur->out.buffer.format.height)
> +		ret = true;
> +
> +	if (prev->out.crop.left != cur->out.crop.left ||
> +	    prev->out.crop.top != cur->out.crop.top ||
> +	    prev->out.crop.width != cur->out.crop.width ||
> +	    prev->out.crop.height != cur->out.crop.height)
> +		ret = true;
> +
> +	dev_dbg(&mdp->pdev->dev,
> +		"prev[%d] [%d, %d], [%d, %d], [%d, %d, %d, %d]\n", prev->scenario,
> +		prev->in.buffer.format.width,
> +		prev->in.buffer.format.height,
> +		prev->out.buffer.format.width,
> +		prev->out.buffer.format.height,
> +		prev->out.crop.left,
> +		prev->out.crop.top,
> +		prev->out.crop.width,
> +		prev->out.crop.height);
> +
> +	dev_dbg(&mdp->pdev->dev,
> +		"cur[%d] [%d, %d], [%d, %d], [%d, %d, %d, %d]\n", cur->scenario,
> +		cur->in.buffer.format.width,
> +		cur->in.buffer.format.height,
> +		cur->out.buffer.format.width,
> +		cur->out.buffer.format.height,
> +		cur->out.crop.left,
> +		cur->out.crop.top,
> +		cur->out.crop.width,
> +		cur->out.crop.height);
> +
> +	memcpy(prev, cur, sizeof(struct mdp_framechange_param));
> +	return ret;
> +}
> +
>   void mdp_set_scenario(struct mdp_dev *mdp,
>   		      struct img_ipi_frameparam *param,
>   		      struct mdp_frame *frame)
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> index 7979ad60ab87..2d0b3e77f959 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> @@ -329,6 +329,12 @@ struct mdp_frameparam {
>   	enum v4l2_quantization		quant;
>   };
>   
> +struct mdp_framechange_param {
> +	u8 scenario;
> +	struct img_input in;
> +	struct img_output out;
> +};
> +
>   int mdp_enum_fmt_mplane(struct mdp_dev *mdp, struct v4l2_fmtdesc *f);
>   const struct mdp_format *mdp_try_fmt_mplane(struct mdp_dev *mdp,
>   					    struct v4l2_format *f,
> @@ -341,6 +347,8 @@ int mdp_try_crop(struct v4l2_rect *r, const struct v4l2_selection *s,
>   int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
>   			    const struct v4l2_rect *compose, s32 rotation,
>   	const struct mdp_limit *limit);
> +int mdp_get_framechange(struct mdp_dev *mdp,
> +			struct mdp_framechange_param *cur);
>   void mdp_set_scenario(struct mdp_dev *mdp,
>   		      struct img_ipi_frameparam *param,
>   		      struct mdp_frame *frame);
> 

Regards,
- Angelo

