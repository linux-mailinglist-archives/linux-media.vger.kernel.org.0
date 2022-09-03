Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263C25AC163
	for <lists+linux-media@lfdr.de>; Sat,  3 Sep 2022 22:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbiICUjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Sep 2022 16:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiICUjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Sep 2022 16:39:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC6E50059
        for <linux-media@vger.kernel.org>; Sat,  3 Sep 2022 13:39:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F2F74A8;
        Sat,  3 Sep 2022 22:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662237556;
        bh=NgsNBLIKwXMg8LLWZqHMqCjXx/sf6aC2gD7CRVySptM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O6vrh2edswVVFOeVDg+2DWn3cWoHOtS6agwYeRA8OdlT6dFiJn6MDULwQR3f/gerl
         IIeZjBjGybMpnjVq38l3HiRGWWKGPELJRr6rOgqlU2V4YisSGp477aZLPVlrndx2ja
         W93oWkrDqT00iDQngzvzz7+qUCCUyUOg+bijvLlI=
Date:   Sat, 3 Sep 2022 23:39:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v1.1 5/5] media: rkisp1: Configure LSC after enabling the
 ISP
Message-ID: <YxO7Z0MH0esvOEZD@pendragon.ideasonboard.com>
References: <20220817021850.20460-6-laurent.pinchart@ideasonboard.com>
 <20220823172156.9374-1-laurent.pinchart@ideasonboard.com>
 <20220903030942.o2t5j2njbaizn4al@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220903030942.o2t5j2njbaizn4al@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Sat, Sep 03, 2022 at 06:09:42AM +0300, Dafna Hirschfeld wrote:
> On 23.08.2022 20:21, Laurent Pinchart wrote:
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
> > Changes since v1:
> > 
> > - Fix typo
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  29 ++-
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     |   9 +-
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 169 ++++++++++++------
> >  3 files changed, 143 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 1383c13e22b8..8b317060ab97 100644
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
> > + * It applies the initial ISP LSC parameters from the first params buffer.
> > + */
> > +void rkisp1_params_post_configure(struct rkisp1_params *params);
> > 
> >  /* rkisp1_params_disable - disable all parameters.
> >   *			   This function is called by the isp entity upon stream start
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 20c01e0e2e17..81a8fe66f5a7 100644
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
> hi,
> I see that the pre-configure is actually called when format is not bayer.

You're absolutely right. It ended up working by chance. I'll replace ==
with != in v1.2.

> > +
> >  	return 0;
> >  }
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 123c26fc1679..d8731ebbf479 100644
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
