Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA4A8597E9E
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 08:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243644AbiHRGZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 02:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243648AbiHRGZo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 02:25:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9895EA8974
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 23:25:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D44584A8;
        Thu, 18 Aug 2022 08:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660803940;
        bh=zR4s2sOaStu22oR+42Rkv+M2dtbJ0ff0euPAGN/Dawk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mUO3QejoDy2J3FWE8U4boxytni564pcugm8rdvv/jhwFVMpH61Uvs+f9ZDv+kY00j
         5U7TqpXN4pS6neatYZBs4+kJIJRzX0V7xBvbSJxvW7jZ8yreLhfYBvWcq4NUVIWFFt
         Z0R1JqisO73dru6kZJingIZi36Q8tLMKIm68Z4Co=
Date:   Thu, 18 Aug 2022 09:25:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 5/5] media: rkisp1: Configure LSC after enabling the ISP
Message-ID: <Yv3bYci+HarfFAbo@pendragon.ideasonboard.com>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
 <20220817021850.20460-6-laurent.pinchart@ideasonboard.com>
 <20220818034546.6qx6sdi3qbf6ogra@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220818034546.6qx6sdi3qbf6ogra@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Aug 18, 2022 at 06:45:46AM +0300, Dafna Hirschfeld wrote:
> On 17.08.2022 05:18, Laurent Pinchart wrote:
> > The ISP8000Nano v18.02 (found in the i.MX8MP) requires the ISP to be
> > enabled (as indicated by the ISP_CTRL.ISP_ENABLE bit) to configure the
> > lens shading table in internal RAM. The driver currently configures all
> > ISP initial parameters before enabling the ISP, which causes the LSC RAM
> > to not be initialized properly.
> > 
> > To fix this, split the rkisp1_params_configure() function into a
> > rkisp1_params_pre_configure() and a rkisp1_params_post_configure(). The
> > former configures all ISP parameters but LSC, while the latter
> > configures LSC. To implement this, the rkisp1_params_apply_params_cfg()
> > function is deconstructed, with two small helpers created to deal with
> > the parameters buffers, which are then used in rkisp1_params_isr(),
> > rkisp1_params_pre_configure() and rkisp1_params_post_configure().
> > 
> > While this initialization ordering is only needed for the ISP8000Nano
> > v18.02, it doesn't affect other ISP versions negatively, and can thus be
> > followed unconditionally.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  29 ++-
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     |   9 +-
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 169 ++++++++++++------
> >  3 files changed, 143 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 1383c13e22b8..f612e1b42b91 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -589,19 +589,32 @@ void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
> >   */
> >  const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_code(u32 mbus_code);
> > 
> > -/* rkisp1_params_configure - configure the params when stream starts.
> > - *			     This function is called by the isp entity upon stream starts.
> > - *			     The function applies the initial configuration of the parameters.
> > +/*
> > + * rkisp1_params_pre_configure - Configure the params before stream start
> >   *
> > - * @params:	  pointer to rkisp1_params.
> > + * @params:	  pointer to rkisp1_params
> >   * @bayer_pat:	  the bayer pattern on the isp video sink pad
> >   * @quantization: the quantization configured on the isp's src pad
> >   * @ycbcr_encoding: the ycbcr_encoding configured on the isp's src pad
> > + *
> > + * This function is called by the ISP entity just before the ISP gets started.
> > + * It applies the initial ISP parameters from the first params buffer, but
> > + * skips LSC as it needs to be configured after the ISP is started.
> >   */
> > -void rkisp1_params_configure(struct rkisp1_params *params,
> > -			     enum rkisp1_fmt_raw_pat_type bayer_pat,
> > -			     enum v4l2_quantization quantization,
> > -			     enum v4l2_ycbcr_encoding ycbcr_encoding);
> > +void rkisp1_params_pre_configure(struct rkisp1_params *params,
> > +				 enum rkisp1_fmt_raw_pat_type bayer_pat,
> > +				 enum v4l2_quantization quantization,
> > +				 enum v4l2_ycbcr_encoding ycbcr_encoding);
> > +
> > +/*
> > + * rkisp1_params_post_configure - Configure the params after stream start
> > + *
> > + * @params:	  pointer to rkisp1_params
> > + *
> > + * This function is called by the ISP entity just after the ISP gets started.
> > + * It applies the initial ISP KSC parameters from the first params buffer.
> 
> What is KSC ?

An incorrect spelling of LSC :-) I'll fix it.

> > + */
> > +void rkisp1_params_post_configure(struct rkisp1_params *params);
> > 
> >  /* rkisp1_params_disable - disable all parameters.
> >   *			   This function is called by the isp entity upon stream start
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index c029d2e86717..4876bf890cb2 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -343,9 +343,9 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> >  		src_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
> >  						 RKISP1_ISP_PAD_SOURCE_VIDEO,
> >  						 V4L2_SUBDEV_FORMAT_ACTIVE);
> > -		rkisp1_params_configure(&rkisp1->params, sink_fmt->bayer_pat,
> > -					src_frm->quantization,
> > -					src_frm->ycbcr_enc);
> > +		rkisp1_params_pre_configure(&rkisp1->params, sink_fmt->bayer_pat,
> > +					    src_frm->quantization,
> > +					    src_frm->ycbcr_enc);
> >  	}
> > 
> >  	return 0;
> > @@ -462,6 +462,9 @@ static int rkisp1_isp_start(struct rkisp1_isp *isp, struct media_pad *source)
> >  	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
> >  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
> > 
> > +	if (isp->src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER)
> > +		rkisp1_params_post_configure(&rkisp1->params);
> 
> why is post config called only in case of bayer?

Because pre_configure is also called for Bayer input only. When the
input is YUV the ISP is bypassed, and the parameters are reset instead.

> also I see that the lsc config from the isr is called without this condition.
> In addition the post config also does 'complete buffer' so maybe you do want to
> call it without the bayer condition.

When the input is YUV there isn't supposed to be any ISP params buffers
queued. I don't know what will happen if userspace queues any, maybe
something bad, but this patch doesn't affect that behaviour as far as I
can tell. Further fixes, if required, would go on top.

> > +
> >  	return 0;
> >  }
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 421ade177b2d..a4664efdfea8 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -1297,22 +1297,6 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
> >  						RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
> >  	}
> > 
> > -	/* update lsc config */
> > -	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_LSC)
> > -		rkisp1_lsc_config(params,
> > -				  &new_params->others.lsc_config);
> > -
> > -	if (module_en_update & RKISP1_CIF_ISP_MODULE_LSC) {
> > -		if (module_ens & RKISP1_CIF_ISP_MODULE_LSC)
> > -			rkisp1_param_set_bits(params,
> > -					      RKISP1_CIF_ISP_LSC_CTRL,
> > -					      RKISP1_CIF_ISP_LSC_CTRL_ENA);
> > -		else
> > -			rkisp1_param_clear_bits(params,
> > -						RKISP1_CIF_ISP_LSC_CTRL,
> > -						RKISP1_CIF_ISP_LSC_CTRL_ENA);
> > -	}
> > -
> >  	/* update awb gains */
> >  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
> >  		params->ops->awb_gain_config(params, &new_params->others.awb_gain_config);
> > @@ -1429,6 +1413,33 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
> >  	}
> >  }
> > 
> > +static void
> > +rkisp1_isp_isr_lsc_config(struct rkisp1_params *params,
> > +			  const struct rkisp1_params_cfg *new_params)
> > +{
> > +	unsigned int module_en_update, module_cfg_update, module_ens;
> > +
> > +	module_en_update = new_params->module_en_update;
> > +	module_cfg_update = new_params->module_cfg_update;
> > +	module_ens = new_params->module_ens;
> > +
> > +	/* update lsc config */
> > +	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_LSC)
> > +		rkisp1_lsc_config(params,
> > +				  &new_params->others.lsc_config);
> > +
> > +	if (module_en_update & RKISP1_CIF_ISP_MODULE_LSC) {
> > +		if (module_ens & RKISP1_CIF_ISP_MODULE_LSC)
> > +			rkisp1_param_set_bits(params,
> > +					      RKISP1_CIF_ISP_LSC_CTRL,
> > +					      RKISP1_CIF_ISP_LSC_CTRL_ENA);
> > +		else
> > +			rkisp1_param_clear_bits(params,
> > +						RKISP1_CIF_ISP_LSC_CTRL,
> > +						RKISP1_CIF_ISP_LSC_CTRL_ENA);
> > +	}
> > +}
> > +
> >  static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
> >  				       struct  rkisp1_params_cfg *new_params)
> >  {
> > @@ -1490,47 +1501,60 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
> >  	}
> >  }
> > 
> > -static void rkisp1_params_apply_params_cfg(struct rkisp1_params *params,
> > -					   unsigned int frame_sequence)
> > +static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
> > +				     struct rkisp1_buffer **buf,
> > +				     struct rkisp1_params_cfg **cfg)
> >  {
> > -	struct rkisp1_params_cfg *new_params;
> > -	struct rkisp1_buffer *cur_buf = NULL;
> > -
> >  	if (list_empty(&params->params))
> > -		return;
> > +		return false;
> > 
> > -	cur_buf = list_first_entry(&params->params,
> > -				   struct rkisp1_buffer, queue);
> > +	*buf = list_first_entry(&params->params, struct rkisp1_buffer, queue);
> > +	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
> > 
> > -	new_params = (struct rkisp1_params_cfg *)vb2_plane_vaddr(&cur_buf->vb.vb2_buf, 0);
> > +	return true;
> > +}
> > 
> > -	rkisp1_isp_isr_other_config(params, new_params);
> > -	rkisp1_isp_isr_meas_config(params, new_params);
> > +static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
> > +					  struct rkisp1_buffer *buf,
> > +					  unsigned int frame_sequence)
> > +{
> > +	list_del(&buf->queue);
> > 
> > -	/* update shadow register immediately */
> > -	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL, RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
> > -
> > -	list_del(&cur_buf->queue);
> > -
> > -	cur_buf->vb.sequence = frame_sequence;
> > -	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> > +	buf->vb.sequence = frame_sequence;
> > +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> >  }
> > 
> >  void rkisp1_params_isr(struct rkisp1_device *rkisp1)
> >  {
> > -	/*
> > -	 * This isr is called when the ISR finishes processing a frame (RKISP1_CIF_ISP_FRAME).
> > -	 * Configurations performed here will be applied on the next frame.
> > -	 * Since frame_sequence is updated on the vertical sync signal, we should use
> > -	 * frame_sequence + 1 here to indicate to userspace on which frame these parameters
> > -	 * are being applied.
> > -	 */
> > -	unsigned int frame_sequence = rkisp1->isp.frame_sequence + 1;
> >  	struct rkisp1_params *params = &rkisp1->params;
> > +	struct rkisp1_params_cfg *new_params;
> > +	struct rkisp1_buffer *cur_buf;
> > 
> >  	spin_lock(&params->config_lock);
> > -	rkisp1_params_apply_params_cfg(params, frame_sequence);
> > 
> > +	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > +		goto unlock;
> > +
> > +	rkisp1_isp_isr_other_config(params, new_params);
> > +	rkisp1_isp_isr_lsc_config(params, new_params);
> > +	rkisp1_isp_isr_meas_config(params, new_params);
> > +
> > +	/* update shadow register immediately */
> > +	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > +			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
> > +
> > +	/*
> > +	 * This isr is called when the ISR finishes processing a frame
> > +	 * (RKISP1_CIF_ISP_FRAME). Configurations performed here will be
> > +	 * applied on the next frame. Since frame_sequence is updated on the
> > +	 * vertical sync signal, we should use frame_sequence + 1 here to
> > +	 * indicate to userspace on which frame these parameters are being
> > +	 * applied.
> > +	 */
> > +	rkisp1_params_complete_buffer(params, cur_buf,
> > +				      rkisp1->isp.frame_sequence + 1);
> > +
> > +unlock:
> >  	spin_unlock(&params->config_lock);
> >  }
> > 
> > @@ -1573,9 +1597,18 @@ static const struct rkisp1_cif_isp_afc_config rkisp1_afc_params_default_config =
> >  	14
> >  };
> > 
> > -static void rkisp1_params_config_parameter(struct rkisp1_params *params)
> > +void rkisp1_params_pre_configure(struct rkisp1_params *params,
> > +				 enum rkisp1_fmt_raw_pat_type bayer_pat,
> > +				 enum v4l2_quantization quantization,
> > +				 enum v4l2_ycbcr_encoding ycbcr_encoding)
> >  {
> >  	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
> > +	struct rkisp1_params_cfg *new_params;
> > +	struct rkisp1_buffer *cur_buf;
> > +
> > +	params->quantization = quantization;
> > +	params->ycbcr_encoding = ycbcr_encoding;
> > +	params->raw_type = bayer_pat;
> > 
> >  	params->ops->awb_meas_config(params, &rkisp1_awb_params_default_config);
> >  	params->ops->awb_meas_enable(params, &rkisp1_awb_params_default_config,
> > @@ -1599,20 +1632,50 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
> >  	spin_lock_irq(&params->config_lock);
> > 
> >  	/* apply the first buffer if there is one already */
> > -	rkisp1_params_apply_params_cfg(params, 0);
> > 
> > +	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > +		goto unlock;
> > +
> > +	rkisp1_isp_isr_other_config(params, new_params);
> > +	rkisp1_isp_isr_meas_config(params, new_params);
> > +
> > +	/* update shadow register immediately */
> > +	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > +			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
> > +
> > +unlock:
> >  	spin_unlock_irq(&params->config_lock);
> >  }
> > 
> > -void rkisp1_params_configure(struct rkisp1_params *params,
> > -			     enum rkisp1_fmt_raw_pat_type bayer_pat,
> > -			     enum v4l2_quantization quantization,
> > -			     enum v4l2_ycbcr_encoding ycbcr_encoding)
> > +void rkisp1_params_post_configure(struct rkisp1_params *params)
> >  {
> > -	params->quantization = quantization;
> > -	params->ycbcr_encoding = ycbcr_encoding;
> > -	params->raw_type = bayer_pat;
> > -	rkisp1_params_config_parameter(params);
> > +	struct rkisp1_params_cfg *new_params;
> > +	struct rkisp1_buffer *cur_buf;
> > +
> > +	spin_lock_irq(&params->config_lock);
> > +
> > +	/*
> > +	 * Apply LSC parameters from the first buffer (if any is already
> > +	 * available. This must be done after the ISP gets started in the
> > +	 * ISP8000Nano v18.02 (found in the i.MX8MP) as access to the LSC RAM
> > +	 * is gated by the ISP_CTRL.ISP_ENABLE bit. As this initialization
> > +	 * ordering doesn't affect other ISP versions negatively, do so
> > +	 * unconditionally.
> > +	 */
> > +
> > +	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > +		goto unlock;
> > +
> > +	rkisp1_isp_isr_lsc_config(params, new_params);
> > +
> > +	/* update shadow register immediately */
> > +	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > +			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
> 
> updating the shadow regs is already done in the 'complete buffer'

I don't see that being done in rkisp1_params_complete_buffer().

> > +
> > +	rkisp1_params_complete_buffer(params, cur_buf, 0);
> > +
> > +unlock:
> > +	spin_unlock_irq(&params->config_lock);
> >  }
> > 
> >  /*

-- 
Regards,

Laurent Pinchart
