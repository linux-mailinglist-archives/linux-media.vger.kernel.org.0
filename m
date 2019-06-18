Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E1A4A2A6
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 15:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbfFRNq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 09:46:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54686 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfFRNq2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 09:46:28 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 988E5D5;
        Tue, 18 Jun 2019 15:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560865585;
        bh=boAtGIf2qHNlE6XrrLHndvrd+4b+xYRiYR+2bFIxjVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kuWW12xjx87anZ6Onimp6Ot4kzg7lk0ErRRTzvwg4nv3TnaTfrfnD0rTbe7ZEjXRG
         AIXQMm00yb6DD8ZM1lX61ZSmkKTxBG98G3c8Wt1SWbMVtLFWDh0Zq6RhI4OMzTbCBx
         uztX9Rt5Ds+lCt/6HBor02wGD09N0V5b0o7bfMQM=
Date:   Tue, 18 Jun 2019 16:46:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 01/10] media: vsp1: drm: Split vsp1_du_setup_lif()
Message-ID: <20190618134608.GD21105@pendragon.ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-2-laurent.pinchart+renesas@ideasonboard.com>
 <55043232.787113.1560861133484@webmail.strato.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55043232.787113.1560861133484@webmail.strato.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ulrich,

On Tue, Jun 18, 2019 at 02:32:13PM +0200, Ulrich Hecht wrote:
> > On June 17, 2019 at 11:09 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > 
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Break vsp1_du_setup_lif() into components more suited to the DRM Atomic
> > API. The existing vsp1_du_setup_lif() API call is maintained as it is
> > still used from the DU.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Minor formatting changes
> > - Fix NULL pointer dereference in vsp1_du_setup_lif()
> > ---
> >  drivers/media/platform/vsp1/vsp1_drm.c | 220 ++++++++++++++++++-------
> >  include/media/vsp1.h                   |  32 +++-
> >  2 files changed, 189 insertions(+), 63 deletions(-)
> > 
> > diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> > index a4a45d68a6ef..7957e1439de0 100644
> > --- a/drivers/media/platform/vsp1/vsp1_drm.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> > @@ -616,10 +616,10 @@ int vsp1_du_init(struct device *dev)
> >  EXPORT_SYMBOL_GPL(vsp1_du_init);
> >  
> >  /**
> > - * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
> > + * vsp1_du_atomic_modeset - Configure the mode as part of an atomic update
> >   * @dev: the VSP device
> >   * @pipe_index: the DRM pipeline index
> > - * @cfg: the LIF configuration
> > + * @cfg: the mode configuration
> >   *
> >   * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
> >   * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
> > @@ -636,14 +636,12 @@ EXPORT_SYMBOL_GPL(vsp1_du_init);
> >   *
> >   * Return 0 on success or a negative error code on failure.
> >   */
> > -int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> > -		      const struct vsp1_du_lif_config *cfg)
> > +int vsp1_du_atomic_modeset(struct device *dev, unsigned int pipe_index,
> > +			   const struct vsp1_du_modeset_config *cfg)
> >  {
> >  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> >  	struct vsp1_drm_pipeline *drm_pipe;
> >  	struct vsp1_pipeline *pipe;
> > -	unsigned long flags;
> > -	unsigned int i;
> >  	int ret;
> >  
> >  	if (pipe_index >= vsp1->info->lif_count)
> > @@ -652,60 +650,6 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> >  	drm_pipe = &vsp1->drm->pipe[pipe_index];
> >  	pipe = &drm_pipe->pipe;
> >  
> > -	if (!cfg) {
> > -		struct vsp1_brx *brx;
> > -
> > -		mutex_lock(&vsp1->drm->lock);
> > -
> > -		brx = to_brx(&pipe->brx->subdev);
> > -
> > -		/*
> > -		 * NULL configuration means the CRTC is being disabled, stop
> > -		 * the pipeline and turn the light off.
> > -		 */
> > -		ret = vsp1_pipeline_stop(pipe);
> > -		if (ret == -ETIMEDOUT)
> > -			dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
> > -
> > -		for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
> > -			struct vsp1_rwpf *rpf = pipe->inputs[i];
> > -
> > -			if (!rpf)
> > -				continue;
> > -
> > -			/*
> > -			 * Remove the RPF from the pipe and the list of BRx
> > -			 * inputs.
> > -			 */
> > -			WARN_ON(!rpf->entity.pipe);
> > -			rpf->entity.pipe = NULL;
> > -			list_del(&rpf->entity.list_pipe);
> > -			pipe->inputs[i] = NULL;
> > -
> > -			brx->inputs[rpf->brx_input].rpf = NULL;
> > -		}
> > -
> > -		drm_pipe->du_complete = NULL;
> > -		pipe->num_inputs = 0;
> > -
> > -		dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
> > -			__func__, pipe->lif->index,
> > -			BRX_NAME(pipe->brx));
> > -
> > -		list_del(&pipe->brx->list_pipe);
> > -		pipe->brx->pipe = NULL;
> > -		pipe->brx = NULL;
> > -
> > -		mutex_unlock(&vsp1->drm->lock);
> > -
> > -		vsp1_dlm_reset(pipe->output->dlm);
> > -		vsp1_device_put(vsp1);
> > -
> > -		dev_dbg(vsp1->dev, "%s: pipeline disabled\n", __func__);
> > -
> > -		return 0;
> > -	}
> > -
> >  	drm_pipe->width = cfg->width;
> >  	drm_pipe->height = cfg->height;
> >  	pipe->interlaced = cfg->interlaced;
> > @@ -722,8 +666,43 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> >  		goto unlock;
> >  
> >  	ret = vsp1_du_pipeline_setup_output(vsp1, pipe);
> > -	if (ret < 0)
> > -		goto unlock;
> > +
> > +unlock:
> > +	mutex_unlock(&vsp1->drm->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * vsp1_du_atomic_enable - Enable and start a DU pipeline
> > + * @dev: the VSP device
> > + * @pipe_index: the DRM pipeline index
> > + * @cfg: the enablement configuration
> > + *
> > + * The @pipe_index argument selects which DRM pipeline to enable. The number of
> > + * available pipelines depend on the VSP instance.
> 
> "depends".
> 
> > + *
> > + * The configuration passes a callback function to register notification of
> > + * frame completion events.
> > + *
> > + * Return 0 on success or a negative error code on failure.
> > + */
> > +int vsp1_du_atomic_enable(struct device *dev, unsigned int pipe_index,
> > +			  const struct vsp1_du_enable_config *cfg)
> > +{
> > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > +	struct vsp1_drm_pipeline *drm_pipe;
> > +	struct vsp1_pipeline *pipe;
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	if (pipe_index >= vsp1->info->lif_count)
> > +		return -EINVAL;
> > +
> > +	drm_pipe = &vsp1->drm->pipe[pipe_index];
> > +	pipe = &drm_pipe->pipe;
> > +
> > +	mutex_lock(&vsp1->drm->lock);
> >  
> >  	/* Enable the VSP1. */
> >  	ret = vsp1_device_get(vsp1);
> > @@ -758,6 +737,123 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> >  	dev_dbg(vsp1->dev, "%s: pipeline enabled\n", __func__);
> >  
> >  	return 0;
> > +
> > +}
> > +EXPORT_SYMBOL_GPL(vsp1_du_atomic_enable);
> > +
> > +/**
> > + * vsp1_du_atomic_disable - Disable and stop a DU pipeline
> > + * @dev: the VSP device
> > + * @pipe_index: the DRM pipeline index
> > + *
> > + * The @pipe_index argument selects which DRM pipeline to disable. The number
> > + * of available pipelines depend on the VSP instance.
> > + *
> > + * Return 0 on success or a negative error code on failure.
> > + */
> > +int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
> > +{
> > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > +	struct vsp1_drm_pipeline *drm_pipe;
> > +	struct vsp1_pipeline *pipe;
> > +	struct vsp1_brx *brx;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	if (pipe_index >= vsp1->info->lif_count)
> > +		return -EINVAL;
> > +
> > +	drm_pipe = &vsp1->drm->pipe[pipe_index];
> > +	pipe = &drm_pipe->pipe;
> > +
> > +	mutex_lock(&vsp1->drm->lock);
> > +
> > +	brx = to_brx(&pipe->brx->subdev);
> > +
> > +	/* Stop the pipeline and turn the light off. */
> 
> I may have missed something, but it is not clear to me what "light" refers to here.

It's a metaphor, meaning disable everything :-)

> > +	ret = vsp1_pipeline_stop(pipe);
> > +	if (ret == -ETIMEDOUT)
> > +		dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
> > +
> > +	for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
> > +		struct vsp1_rwpf *rpf = pipe->inputs[i];
> > +
> > +		if (!rpf)
> > +			continue;
> > +
> > +		/* Remove the RPF from the pipe and the list of BRx inputs. */
> > +		WARN_ON(!rpf->entity.pipe);
> > +		rpf->entity.pipe = NULL;
> > +		list_del(&rpf->entity.list_pipe);
> > +		pipe->inputs[i] = NULL;
> > +
> > +		brx->inputs[rpf->brx_input].rpf = NULL;
> > +	}
> > +
> > +	drm_pipe->du_complete = NULL;
> > +	pipe->num_inputs = 0;
> > +
> > +	dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n", __func__,
> > +		pipe->lif->index, BRX_NAME(pipe->brx));
> > +
> > +	list_del(&pipe->brx->list_pipe);
> > +	pipe->brx->pipe = NULL;
> > +	pipe->brx = NULL;
> > +
> > +	mutex_unlock(&vsp1->drm->lock);
> > +
> > +	vsp1_dlm_reset(pipe->output->dlm);
> > +	vsp1_device_put(vsp1);
> > +
> > +	dev_dbg(vsp1->dev, "%s: pipeline disabled\n", __func__);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(vsp1_du_atomic_disable);
> > +
> > +/**
> > + * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
> > + * @dev: the VSP device
> > + * @pipe_index: the DRM pipeline index
> > + * @cfg: the LIF configuration
> > + *
> > + * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
> > + * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
> > + * source pads, and the LIF sink pad.
> > + *
> > + * The @pipe_index argument selects which DRM pipeline to setup. The number of
> > + * available pipelines depend on the VSP instance.
> > + *
> > + * As the media bus code on the blend unit source pad is conditioned by the
> > + * configuration of its sink 0 pad, we also set up the formats on all blend unit
> > + * sinks, even if the configuration will be overwritten later by
> > + * vsp1_du_setup_rpf(). This ensures that the blend unit configuration is set to
> > + * a well defined state.
> > + *
> > + * Return 0 on success or a negative error code on failure.
> > + */
> > +int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> > +		      const struct vsp1_du_lif_config *cfg)
> > +{
> > +	struct vsp1_du_modeset_config modes;
> > +	struct vsp1_du_enable_config enable;
> > +	int ret;
> > +
> > +	if (!cfg)
> > +		return vsp1_du_atomic_disable(dev, pipe_index);
> > +
> > +	modes.width = cfg->width;
> > +	modes.height = cfg->height;
> > +	modes.interlaced = cfg->interlaced;
> > +
> > +	ret = vsp1_du_atomic_modeset(dev, pipe_index, &modes);
> > +	if (ret)
> > +		return ret;
> > +
> > +	enable.callback = cfg->callback;
> > +	enable.callback_data = cfg->callback_data;
> > +
> > +	return vsp1_du_atomic_enable(dev, pipe_index, &enable);
> >  }
> >  EXPORT_SYMBOL_GPL(vsp1_du_setup_lif);
> >  
> > diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> > index cc1b0d42ce95..56643f97d4c9 100644
> > --- a/include/media/vsp1.h
> > +++ b/include/media/vsp1.h
> > @@ -21,7 +21,7 @@ int vsp1_du_init(struct device *dev);
> >  #define VSP1_DU_STATUS_WRITEBACK	BIT(1)
> >  
> >  /**
> > - * struct vsp1_du_lif_config - VSP LIF configuration
> > + * struct vsp1_du_lif_config - VSP LIF configuration - Deprecated
> >   * @width: output frame width
> >   * @height: output frame height
> >   * @interlaced: true for interlaced pipelines
> > @@ -42,6 +42,30 @@ struct vsp1_du_lif_config {
> >  int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> >  		      const struct vsp1_du_lif_config *cfg);
> >  
> > +/**
> > + * struct vsp1_du_modeset_config - VSP display mode configuration
> > + * @width: output frame width
> > + * @height: output frame height
> > + * @interlaced: true for interlaced pipelines
> > + */
> > +struct vsp1_du_modeset_config {
> > +	unsigned int width;
> > +	unsigned int height;
> > +	bool interlaced;
> > +};
> > +
> > +/**
> > + * struct vsp1_du_enable_config - VSP enable configuration
> > + * @callback: frame completion callback function (optional). When a callback
> > + *	      is provided, the VSP driver guarantees that it will be called once
> > + *	      and only once for each vsp1_du_atomic_flush() call.
> > + * @callback_data: data to be passed to the frame completion callback
> > + */
> > +struct vsp1_du_enable_config {
> > +	void (*callback)(void *data, unsigned int status, u32 crc);
> > +	void *callback_data;
> > +};
> > +
> >  /**
> >   * struct vsp1_du_atomic_config - VSP atomic configuration parameters
> >   * @pixelformat: plane pixel format (V4L2 4CC)
> > @@ -106,6 +130,12 @@ struct vsp1_du_atomic_pipe_config {
> >  	struct vsp1_du_writeback_config writeback;
> >  };
> >  
> > +
> > +int vsp1_du_atomic_modeset(struct device *dev, unsigned int pipe_index,
> > +		    const struct vsp1_du_modeset_config *cfg);
> > +int vsp1_du_atomic_enable(struct device *dev, unsigned int pipe_index,
> > +		   const struct vsp1_du_enable_config *cfg);
> > +int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index);
> >  void vsp1_du_atomic_begin(struct device *dev, unsigned int pipe_index);
> >  int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
> >  			  unsigned int rpf,
> 
> With those minor issues fixed:
> 
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

-- 
Regards,

Laurent Pinchart
