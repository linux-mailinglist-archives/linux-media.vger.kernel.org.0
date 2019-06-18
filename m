Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E384A0FE
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 14:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbfFRMkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 08:40:18 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:35167 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRMkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 08:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560861614;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=9h09722upog+39XDPFzo5t1AJoptc4ISfiVy2GXnOFQ=;
        b=o0eHJXXbemHNymlLloMAi8xnEYLa5mVO48Q7pk5wuAcdWl2/vhUq9PZQ/QvoUKB3F3
        VqoqjIVHV/zwOBwfrUw1JMnGK//fgv44H2SY3DT4MxCSjGtJfjKWD/g0hrTXuQ0vj412
        BNmHD7rs5WDqSWmDJqhSP/518flGmejgsSegROx2HgJJI+LNWOwqlIGqwmaLathv1KqJ
        nBFFSohk+lyzvYJw2vUT4611+mV8jNA/uFA1++RgI9Sc59baShEmH1tFvGum3QcKifsc
        WO+g4phb091KYFnbwekIw8X4d9nvvB+S/JBgv5KkJytEG+Cl9O4RAXr/OJyfehwkyYF2
        c0fg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v5ICeE0pT
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Jun 2019 14:40:14 +0200 (CEST)
Date:   Tue, 18 Jun 2019 14:40:14 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <2079292286.787727.1560861614830@webmail.strato.com>
In-Reply-To: <20190617210930.6054-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-5-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 04/10] media: vsp1: drm: Remove vsp1_du_setup_lif()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev58
X-Originating-IP: 85.212.220.45
X-Originating-Client: open-xchange-appsuite
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On June 17, 2019 at 11:09 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The vsp1_du_setup_lif() function is deprecated, and the users have been
> removed. Remove the implementation and the associated configuration
> structure.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/vsp1/vsp1_drm.c | 46 --------------------------
>  include/media/vsp1.h                   | 22 ------------
>  2 files changed, 68 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> index 900465caf1bf..3452d7a6dd89 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -815,52 +815,6 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
>  }
>  EXPORT_SYMBOL_GPL(vsp1_du_atomic_disable);
>  
> -/**
> - * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
> - * @dev: the VSP device
> - * @pipe_index: the DRM pipeline index
> - * @cfg: the LIF configuration
> - *
> - * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
> - * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
> - * source pads, and the LIF sink pad.
> - *
> - * The @pipe_index argument selects which DRM pipeline to setup. The number of
> - * available pipelines depend on the VSP instance.
> - *
> - * As the media bus code on the blend unit source pad is conditioned by the
> - * configuration of its sink 0 pad, we also set up the formats on all blend unit
> - * sinks, even if the configuration will be overwritten later by
> - * vsp1_du_setup_rpf(). This ensures that the blend unit configuration is set to
> - * a well defined state.
> - *
> - * Return 0 on success or a negative error code on failure.
> - */
> -int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> -		      const struct vsp1_du_lif_config *cfg)
> -{
> -	struct vsp1_du_modeset_config modes;
> -	struct vsp1_du_enable_config enable;
> -	int ret;
> -
> -	if (!cfg)
> -		return vsp1_du_atomic_disable(dev, pipe_index);
> -
> -	modes.width = cfg->width;
> -	modes.height = cfg->height;
> -	modes.interlaced = cfg->interlaced;
> -
> -	ret = vsp1_du_atomic_modeset(dev, pipe_index, &modes);
> -	if (ret)
> -		return ret;
> -
> -	enable.callback = cfg->callback;
> -	enable.callback_data = cfg->callback_data;
> -
> -	return vsp1_du_atomic_enable(dev, pipe_index, &enable);
> -}
> -EXPORT_SYMBOL_GPL(vsp1_du_setup_lif);
> -
>  /**
>   * vsp1_du_atomic_begin - Prepare for an atomic update
>   * @dev: the VSP device
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index 56643f97d4c9..b8eadd62fd15 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -20,28 +20,6 @@ int vsp1_du_init(struct device *dev);
>  #define VSP1_DU_STATUS_COMPLETE		BIT(0)
>  #define VSP1_DU_STATUS_WRITEBACK	BIT(1)
>  
> -/**
> - * struct vsp1_du_lif_config - VSP LIF configuration - Deprecated
> - * @width: output frame width
> - * @height: output frame height
> - * @interlaced: true for interlaced pipelines
> - * @callback: frame completion callback function (optional). When a callback
> - *	      is provided, the VSP driver guarantees that it will be called once
> - *	      and only once for each vsp1_du_atomic_flush() call.
> - * @callback_data: data to be passed to the frame completion callback
> - */
> -struct vsp1_du_lif_config {
> -	unsigned int width;
> -	unsigned int height;
> -	bool interlaced;
> -
> -	void (*callback)(void *data, unsigned int status, u32 crc);
> -	void *callback_data;
> -};
> -
> -int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> -		      const struct vsp1_du_lif_config *cfg);
> -
>  /**
>   * struct vsp1_du_modeset_config - VSP display mode configuration
>   * @width: output frame width
> -- 
> Regards,
> 
> Laurent Pinchart
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
