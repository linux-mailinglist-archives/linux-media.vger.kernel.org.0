Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176043FD969
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 14:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244038AbhIAMSP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 08:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243964AbhIAMSP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 08:18:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86580C061575;
        Wed,  1 Sep 2021 05:17:18 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:2851:934a:bc81:97e6] (unknown [IPv6:2a02:810a:880:f54:2851:934a:bc81:97e6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E017F1F41DED;
        Wed,  1 Sep 2021 13:17:13 +0100 (BST)
Subject: Re: [PATCH v6, 15/15] media: mtk-vcodec: Use codec type to separate
 different hardware
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <20210901083215.25984-16-yunfei.dong@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <cf57148f-430b-2023-5f62-b57b12a960b7@collabora.com>
Date:   Wed, 1 Sep 2021 14:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901083215.25984-16-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 01.09.21 10:32, Yunfei Dong wrote:
> There are just one core thread, in order to separeate different
> hardware, using codec type to separeate it in scp driver.

this code seems to relate to the vpu driver not the scp driver.
Is there a corresponding code added to the vpu driver that test the codec_type?

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 12 ++++---
>   .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 34 ++++++++++++++++---
>   .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  4 +++
>   3 files changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> index 9d8079c4f976..c488f0c40190 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> @@ -35,6 +35,8 @@ enum vdec_ipi_msgid {
>    * @msg_id	: vdec_ipi_msgid
>    * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
>    * @inst_id     : instance ID. Used if the ABI version >= 2.
> + * @codec_type	: Codec fourcc
> + * @reserved	: reserved param
>    */
>   struct vdec_ap_ipi_cmd {
>   	uint32_t msg_id;
> @@ -42,6 +44,8 @@ struct vdec_ap_ipi_cmd {
>   		uint32_t vpu_inst_addr;
>   		uint32_t inst_id;
>   	};
> +	uint32_t codec_type;
> +	uint32_t reserved;
>   };
>   
>   /**
> @@ -59,12 +63,12 @@ struct vdec_vpu_ipi_ack {
>   /**
>    * struct vdec_ap_ipi_init - for AP_IPIMSG_DEC_INIT
>    * @msg_id	: AP_IPIMSG_DEC_INIT
> - * @reserved	: Reserved field
> + * @codec_type	: Codec fourcc
>    * @ap_inst_addr	: AP video decoder instance address
>    */
>   struct vdec_ap_ipi_init {
>   	uint32_t msg_id;
> -	uint32_t reserved;
> +	uint32_t codec_type;
>   	uint64_t ap_inst_addr;
>   };
>   
> @@ -77,7 +81,7 @@ struct vdec_ap_ipi_init {
>    *	H264 decoder [0]:buf_sz [1]:nal_start
>    *	VP8 decoder  [0]:width/height
>    *	VP9 decoder  [0]:profile, [1][2] width/height
> - * @reserved	: Reserved field
> + * @codec_type	: Codec fourcc
>    */
>   struct vdec_ap_ipi_dec_start {
>   	uint32_t msg_id;
> @@ -86,7 +90,7 @@ struct vdec_ap_ipi_dec_start {
>   		uint32_t inst_id;
>   	};
>   	uint32_t data[3];
> -	uint32_t reserved;
> +	uint32_t codec_type;
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> index bfd8e87dceff..c84fac52fe26 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> @@ -100,18 +100,29 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
>   
>   static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
>   {
> -	int err;
> +	int err, id, msgid;
>   
> -	mtk_vcodec_debug(vpu, "id=%X", *(uint32_t *)msg);
> +	msgid = *(uint32_t *)msg;
> +	mtk_vcodec_debug(vpu, "id=%X", msgid);
>   
>   	vpu->failure = 0;
>   	vpu->signaled = 0;
>   
> -	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id, msg,
> +	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
> +		if (msgid == AP_IPIMSG_DEC_CORE ||
> +			msgid == AP_IPIMSG_DEC_CORE_END)
> +			id = vpu->core_id;
> +		else
> +			id = vpu->id;
> +	} else {
> +		id = vpu->id;
> +	}
> +
> +	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg,
>   				     len, 2000);

so
>   	if (err) {
>   		mtk_vcodec_err(vpu, "send fail vpu_id=%d msg_id=%X status=%d",
> -			       vpu->id, *(uint32_t *)msg, err);
> +			       id, msgid, err);
>   		return err;
>   	}
>   
> @@ -131,6 +142,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
>   		msg.vpu_inst_addr = vpu->inst_addr;
>   	else
>   		msg.inst_id = vpu->inst_id;
> +	msg.codec_type = vpu->codec_type;
>   
>   	err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
>   	mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
> @@ -149,14 +161,25 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>   
>   	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
>   					 vpu->handler, "vdec", NULL);
> -	if (err != 0) {
> +	if (err) {

could be nice to send a patch with other such fixes,
anyway it is better to send unrelated fixes in a separate patch

>   		mtk_vcodec_err(vpu, "vpu_ipi_register fail status=%d", err);
>   		return err;
>   	}
>   
> +	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
> +		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
> +					 vpu->core_id, vpu->handler,
> +					 "vdec", NULL);
> +		if (err) {
> +			mtk_vcodec_err(vpu, "vpu_ipi_register core fail status=%d", err);
> +			return err;
> +		}
> +	}
> +
>   	memset(&msg, 0, sizeof(msg));
>   	msg.msg_id = AP_IPIMSG_DEC_INIT;
>   	msg.ap_inst_addr = (unsigned long)vpu;
> +	msg.codec_type = vpu->codec_type;
>   
>   	mtk_vcodec_debug(vpu, "vdec_inst=%p", vpu);
>   
> @@ -187,6 +210,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
>   
>   	for (i = 0; i < len; i++)
>   		msg.data[i] = data[i];
> +	msg.codec_type = vpu->codec_type;

I don't see where is the vpu->codec_type initialzied

Thanks,
Dafna

>   
>   	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
>   	mtk_vcodec_debug(vpu, "- ret=%d", err);
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> index ae24b75d1649..802660770a87 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> @@ -14,6 +14,7 @@ struct mtk_vcodec_ctx;
>   /**
>    * struct vdec_vpu_inst - VPU instance for video codec
>    * @id          : ipi msg id for each decoder
> + * @core_id     : core id used to separate different hardware
>    * @vsi         : driver structure allocated by VPU side and shared to AP side
>    *                for control and info share
>    * @failure     : VPU execution result status, 0: success, others: fail
> @@ -26,9 +27,11 @@ struct mtk_vcodec_ctx;
>    * @dev		: platform device of VPU
>    * @wq          : wait queue to wait VPU message ack
>    * @handler     : ipi handler for each decoder
> + * @codec_type     : used codec type to separate different codecs
>    */
>   struct vdec_vpu_inst {
>   	int id;
> +	int core_id;
>   	void *vsi;
>   	int32_t failure;
>   	uint32_t inst_addr;
> @@ -38,6 +41,7 @@ struct vdec_vpu_inst {
>   	struct mtk_vcodec_ctx *ctx;
>   	wait_queue_head_t wq;
>   	mtk_vcodec_ipi_handler handler;
> +	unsigned int codec_type;
>   };
>   
>   /**
> 
