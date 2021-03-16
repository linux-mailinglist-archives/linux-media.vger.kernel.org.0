Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A14333D0FB
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 10:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhCPJlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 05:41:08 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50309 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234161AbhCPJlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 05:41:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M6CAl0yYY4ywlM6CDlAR2K; Tue, 16 Mar 2021 10:41:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615887662; bh=CugcxmEGRPCNeLQbQYJZM+ylLGD1my8oO6vsENcmFt0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MYgG7AJeP2Chzagwl9IiUtxqyUjzbqkhGdgBVhu9cR1SB5+M2k39pXku4Xr2lAsi6
         qOP+fxP96fhK4mc9GEsx6cTv/vr9no5D/TxSHsSg9EZructpOFdqzLtaGIx6GXuMjZ
         EP+FV1CxyoTiiAGtn6nhZ9D0PKEDUXUOSLrxmoOAG/WL1i2SKdK+pEuKvD+mJbnKnB
         7/pnhog40R5wRoZ0GXmQwTz1bkk1GaOhUiF3yiDcAt8tTktpQZmXs6K33UIPyiPqJY
         dt8LBR68Nki8L3+z8CI66lUE51w3oHcGrb7bPotfsieroWG4jlHJ7P3QU8CiHJrya0
         kg0lAEcQSQj9Q==
Subject: Re: [PATCH v8 06/22] media: camss: Refactor VFE HW version support
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210315155942.640889-1-robert.foss@linaro.org>
 <20210315155942.640889-7-robert.foss@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d11ad801-e387-dcd8-1737-1cbc69dea046@xs4all.nl>
Date:   Tue, 16 Mar 2021 10:40:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315155942.640889-7-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIz9gAZi9PqPsJH2z5AwHuPrkg3KrQJ9sbK70pFxZYUKtM9Vac6JU0hlh1OJ3ZjQBw2Erhc9/dN58D9R+3bW8Ydrc3+2CA5Otfx4jgz+/YIQ2QkHzcKq
 RkSiCAM/pWuVGinIlqI/G0XlINEHoMgi5ojTrqF2KWZHU1lCa3oxtWG4OmoT8s9b/3OHTYhsDs68wcWFNDE3ij4EwA0yvRJJrYfHRjhqxd4jaPmL0jgApoBg
 zeJQrpcefD41dyvER8q0OZTGD+lMFKCi6CVqanq1eX2Ejdh3WQ+l0z07oE755lquqzIe3y90KJouGll85BJLfmeRO8RdZ0LLSIIBJ4B6BY1hMqFCUS/fpXnc
 Bh30NeARFRmIXLqfW2p7G5qosPgNdX98TMAZ0cO8Za3q5VWBfdX+SFF+RvVLzK1UUAOdNys4c6pJbRjKwXGTtoTrpYE5QWmdvfreUWFU7577gs0ToNEJaggt
 g3qOLfTrL530wBHZIO+BfgdS5r7KuLIrsE1H/Im6aeUXW2ZmiuR7O5H8y/xX9c/yF4jEOshOanmwF9Z9RWpUKm2ihMzi0VETsZQ5HspfeEUGaaH6eTdhO+BS
 Z12o6VXwClkKF5rCNri4YIHBpwS/NGWOwp2vOyJ67znJhPHP5Myviy2XFjOHTKF1eDYgEHGomho6muwgEVn+RTlI83o61qAHLKVB7NWl6cxtwqXigM5fEz9t
 kr/a/VTa9O3+Pln7RoMMKZAU1RJkWzDjlMPTrglXJjsumEnI1decX6kMNSdwyyhbZZsacqRziNtvVCwDsd6EMzzba1MkFAzBNu9H7Oe4sqWcs0pEjIERj7z6
 e2tD2MhS+W/B6oFmUlrQuTh5b6dvxIFEcGDQjGXlQmPkM8bPihnt0s4vAByAgQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 16:59, Robert Foss wrote:
> In order to support Qualcomm ISP hardware architectures that diverge
> from older architectures, the VFE subdevice driver needs to be refactored
> to better abstract the different ISP architectures.
> 
> Gen1 represents the CAMSS ISP architecture. The ISP architecture developed
> after CAMSS, Titan, will be referred to as Gen2.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
> 
> 

<snip>

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 5bce6736e4bb..ceff4985b1cc 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -17,15 +17,26 @@
>  #include <media/v4l2-subdev.h>
>  
>  #include "camss-video.h"
> +#include "camss-vfe-gen1.h"
>  
>  #define MSM_VFE_PAD_SINK 0
>  #define MSM_VFE_PAD_SRC 1
>  #define MSM_VFE_PADS_NUM 2
>  
> -#define MSM_VFE_LINE_NUM 4
>  #define MSM_VFE_IMAGE_MASTERS_NUM 7
>  #define MSM_VFE_COMPOSITE_IRQ_NUM 4
>  
> +/* VFE halt timeout */
> +#define VFE_HALT_TIMEOUT_MS 100
> +/* Frame drop value. VAL + UPDATES - 1 should not exceed 31 */
> +#define VFE_FRAME_DROP_VAL 30
> +
> +#define vfe_line_array(ptr_line)	\
> +	((const struct vfe_line (*)[]) &(ptr_line[-(ptr_line->id)]))

I get a checkpatch warning on this:

CHECK: Unnecessary parentheses around ptr_line[-(ptr_line->id)]
#3612: FILE: drivers/media/platform/qcom/camss/camss-vfe.h:35:
+       ((const struct vfe_line (*)[]) &(ptr_line[-(ptr_line->id)]))

This should be:

	((const struct vfe_line (*)[]) &(ptr_line)[-(ptr_line)->id])

The checkpatch message is a bit odd, the real problem here is the missing
parenthesis around ptr_line: this would cause problems if ptr_line is an
expression like 'ptr + 5', which would lead to a bad expansion.

Regards,

	Hans

> +
> +#define to_vfe(ptr_line)	\
> +	container_of(vfe_line_array(ptr_line), struct vfe_device, line)
> +
>  enum vfe_output_state {
>  	VFE_OUTPUT_OFF,
>  	VFE_OUTPUT_RESERVED,
> @@ -40,23 +51,30 @@ enum vfe_line_id {
>  	VFE_LINE_RDI0 = 0,
>  	VFE_LINE_RDI1 = 1,
>  	VFE_LINE_RDI2 = 2,
> -	VFE_LINE_PIX = 3
> +	VFE_LINE_PIX = 3,
> +	VFE_LINE_NUM_GEN1 = 4,
> +	VFE_LINE_NUM_MAX = 4
>  };
>  
>  struct vfe_output {
>  	u8 wm_num;
>  	u8 wm_idx[3];
>  
> -	int active_buf;
>  	struct camss_buffer *buf[2];
>  	struct camss_buffer *last_buffer;
>  	struct list_head pending_bufs;
>  
>  	unsigned int drop_update_idx;
>  
> +	union {
> +		struct {
> +			int active_buf;
> +			int wait_sof;
> +		} gen1;
> +	};
>  	enum vfe_output_state state;
>  	unsigned int sequence;
> -	int wait_sof;
> +
>  	int wait_reg_update;
>  	struct completion sof;
>  	struct completion reg_update;
> @@ -78,59 +96,19 @@ struct vfe_line {
>  struct vfe_device;
>  
>  struct vfe_hw_ops {
> -	void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
> -	u16 (*get_ub_size)(u8 vfe_id);
> +	void (*enable_irq_common)(struct vfe_device *vfe);
>  	void (*global_reset)(struct vfe_device *vfe);
> -	void (*halt_request)(struct vfe_device *vfe);
> -	void (*halt_clear)(struct vfe_device *vfe);
> -	void (*wm_enable)(struct vfe_device *vfe, u8 wm, u8 enable);
> -	void (*wm_frame_based)(struct vfe_device *vfe, u8 wm, u8 enable);
> -	void (*wm_line_based)(struct vfe_device *vfe, u32 wm,
> -			      struct v4l2_pix_format_mplane *pix,
> -			      u8 plane, u32 enable);
> -	void (*wm_set_framedrop_period)(struct vfe_device *vfe, u8 wm, u8 per);
> -	void (*wm_set_framedrop_pattern)(struct vfe_device *vfe, u8 wm,
> -					 u32 pattern);
> -	void (*wm_set_ub_cfg)(struct vfe_device *vfe, u8 wm, u16 offset,
> -			      u16 depth);
> -	void (*bus_reload_wm)(struct vfe_device *vfe, u8 wm);
> -	void (*wm_set_ping_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
> -	void (*wm_set_pong_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
> -	int (*wm_get_ping_pong_status)(struct vfe_device *vfe, u8 wm);
> -	void (*bus_enable_wr_if)(struct vfe_device *vfe, u8 enable);
> -	void (*bus_connect_wm_to_rdi)(struct vfe_device *vfe, u8 wm,
> -				      enum vfe_line_id id);
> -	void (*wm_set_subsample)(struct vfe_device *vfe, u8 wm);
> -	void (*bus_disconnect_wm_from_rdi)(struct vfe_device *vfe, u8 wm,
> -					   enum vfe_line_id id);
> -	void (*set_xbar_cfg)(struct vfe_device *vfe, struct vfe_output *output,
> -			     u8 enable);
> -	void (*set_rdi_cid)(struct vfe_device *vfe, enum vfe_line_id id,
> -			    u8 cid);
> -	void (*set_realign_cfg)(struct vfe_device *vfe, struct vfe_line *line,
> -				u8 enable);
> +	void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
> +	irqreturn_t (*isr)(int irq, void *dev);
> +	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
>  	void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
>  	void (*reg_update_clear)(struct vfe_device *vfe,
>  				 enum vfe_line_id line_id);
> -	void (*enable_irq_wm_line)(struct vfe_device *vfe, u8 wm,
> -				   enum vfe_line_id line_id, u8 enable);
> -	void (*enable_irq_pix_line)(struct vfe_device *vfe, u8 comp,
> -				    enum vfe_line_id line_id, u8 enable);
> -	void (*enable_irq_common)(struct vfe_device *vfe);
> -	void (*set_demux_cfg)(struct vfe_device *vfe, struct vfe_line *line);
> -	void (*set_scale_cfg)(struct vfe_device *vfe, struct vfe_line *line);
> -	void (*set_crop_cfg)(struct vfe_device *vfe, struct vfe_line *line);
> -	void (*set_clamp_cfg)(struct vfe_device *vfe);
> -	void (*set_qos)(struct vfe_device *vfe);
> -	void (*set_ds)(struct vfe_device *vfe);
> -	void (*set_cgc_override)(struct vfe_device *vfe, u8 wm, u8 enable);
> -	void (*set_camif_cfg)(struct vfe_device *vfe, struct vfe_line *line);
> -	void (*set_camif_cmd)(struct vfe_device *vfe, u8 enable);
> -	void (*set_module_cfg)(struct vfe_device *vfe, u8 enable);
> -	int (*camif_wait_for_stop)(struct vfe_device *vfe, struct device *dev);
> -	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
> +	void (*subdev_init)(struct device *dev, struct vfe_device *vfe);
> +	int (*vfe_disable)(struct vfe_line *line);
> +	int (*vfe_enable)(struct vfe_line *line);
> +	int (*vfe_halt)(struct vfe_device *vfe);
>  	void (*violation_read)(struct vfe_device *vfe);
> -	irqreturn_t (*isr)(int irq, void *dev);
>  };
>  
>  struct vfe_isr_ops {
> @@ -158,11 +136,14 @@ struct vfe_device {
>  	int stream_count;
>  	spinlock_t output_lock;
>  	enum vfe_line_id wm_output_map[MSM_VFE_IMAGE_MASTERS_NUM];
> -	struct vfe_line line[MSM_VFE_LINE_NUM];
> +	struct vfe_line line[VFE_LINE_NUM_MAX];
> +	u8 line_num;
>  	u32 reg_update;
>  	u8 was_streaming;
>  	const struct vfe_hw_ops *ops;
> +	const struct vfe_hw_ops_gen1 *ops_gen1;
>  	struct vfe_isr_ops isr_ops;
> +	struct camss_video_ops video_ops;
>  };
>  
>  struct resources;
> @@ -178,6 +159,37 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
>  void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
>  void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
>  
> +/*
> + * vfe_buf_add_pending - Add output buffer to list of pending
> + * @output: VFE output
> + * @buffer: Video buffer
> + */
> +void vfe_buf_add_pending(struct vfe_output *output, struct camss_buffer *buffer);
> +
> +struct camss_buffer *vfe_buf_get_pending(struct vfe_output *output);
> +
> +/*
> + * vfe_disable - Disable streaming on VFE line
> + * @line: VFE line
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +int vfe_disable(struct vfe_line *line);
> +
> +int vfe_flush_buffers(struct camss_video *vid, enum vb2_buffer_state state);
> +
> +/*
> + * vfe_isr_comp_done - Process composite image done interrupt
> + * @vfe: VFE Device
> + * @comp: Composite image id
> + */
> +void vfe_isr_comp_done(struct vfe_device *vfe, u8 comp);
> +
> +void vfe_isr_reset_ack(struct vfe_device *vfe);
> +int vfe_put_output(struct vfe_line *line);
> +int vfe_release_wm(struct vfe_device *vfe, u8 wm);
> +int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id);
> +
>  extern const struct vfe_hw_ops vfe_ops_4_1;
>  extern const struct vfe_hw_ops vfe_ops_4_7;
>  extern const struct vfe_hw_ops vfe_ops_4_8;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0c679c97da6d..49e25c837bdc 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -881,7 +881,7 @@ static int camss_register_entities(struct camss *camss)
>  
>  		for (i = 0; i < camss->ispif->line_num; i++)
>  			for (k = 0; k < camss->vfe_num; k++)
> -				for (j = 0; j < ARRAY_SIZE(camss->vfe[k].line); j++) {
> +				for (j = 0; j < camss->vfe[k].line_num; j++) {
>  					struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
>  					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
>  
> @@ -902,7 +902,7 @@ static int camss_register_entities(struct camss *camss)
>  	} else {
>  		for (i = 0; i < camss->csid_num; i++)
>  			for (k = 0; k < camss->vfe_num; k++)
> -				for (j = 0; j < ARRAY_SIZE(camss->vfe[k].line); j++) {
> +				for (j = 0; j < camss->vfe[k].line_num; j++) {
>  					struct v4l2_subdev *csid = &camss->csid[i].subdev;
>  					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
>  
> 

