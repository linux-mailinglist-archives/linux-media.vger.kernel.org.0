Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08DBB4A0EB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 14:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfFRMfw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 08:35:52 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:29697 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfFRMfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 08:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560861347;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=m2kTGoAEuFNvqkVPWqBQC5qo0c6Kg6FRykTE++BQQBM=;
        b=iTFN47b/qrsj13S60L1mLjpYszZV7woIWPzv8PuN/gi3PouC7JQDonSwJ+HU5bh7cE
        8KbjfY6loaxvRAPFNmCeDED9hQTU2yjIsSnFPZbKhqAu/ybqqDk9fw2RuCHWeJAg5nEH
        ks4lKyrb+Qq+FvMSkky5tlcvlwt/+X1Mz4gUfeGIl20G0c+W6htxuoqBZkcYTcodCTIp
        YFK8n9mQ3qwMCh/Gzs2gf5o9e8edA81OVASrhyirFteKh0KiitlOs4vAbhH4GZNwtCmy
        kw66wRRcEIKJgSfTQk33yKpMfPaaEI0YJF1XrMwQIBTi7hfIHXY5mrH0HHVHbhpXgcjq
        mrLg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v5ICZl0nu
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Jun 2019 14:35:47 +0200 (CEST)
Date:   Tue, 18 Jun 2019 14:35:47 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <1560656267.787381.1560861347138@webmail.strato.com>
In-Reply-To: <20190617210930.6054-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 02/10] media: vsp1: drm: Don't configure hardware
 when the pipeline is disabled
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
> The vsp1_du_atomic_flush() function calls vsp1_du_pipeline_configure()
> to configure the hardware pipeline. The function is currently guaranteed
> to be called with the pipeline enabled, but this will change by future
> rework of the DU driver. Guard the hardware configuration to skip it
> when the pipeline is disabled. The hardware will be configured the next
> time the pipeline gets enabled.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/vsp1/vsp1_drm.c | 13 ++++++++++++-
>  drivers/media/platform/vsp1/vsp1_drm.h |  2 ++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> index 7957e1439de0..900465caf1bf 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -723,6 +723,8 @@ int vsp1_du_atomic_enable(struct device *dev, unsigned int pipe_index,
>  	/* Configure all entities in the pipeline. */
>  	vsp1_du_pipeline_configure(pipe);
>  
> +	drm_pipe->enabled = true;
> +
>  unlock:
>  	mutex_unlock(&vsp1->drm->lock);
>  
> @@ -800,6 +802,8 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
>  	pipe->brx->pipe = NULL;
>  	pipe->brx = NULL;
>  
> +	drm_pipe->enabled = false;
> +
>  	mutex_unlock(&vsp1->drm->lock);
>  
>  	vsp1_dlm_reset(pipe->output->dlm);
> @@ -992,7 +996,14 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
>  	}
>  
>  	vsp1_du_pipeline_setup_inputs(vsp1, pipe);
> -	vsp1_du_pipeline_configure(pipe);
> +
> +	/*
> +	 * We may get called before the pipeline gets enabled, postpone
> +	 * configuration in that case. vsp1_du_pipeline_configure() will be
> +	 * called from vsp1_du_atomic_enable().
> +	 */
> +	if (drm_pipe->enabled)
> +		vsp1_du_pipeline_configure(pipe);
>  
>  done:
>  	mutex_unlock(&vsp1->drm->lock);
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.h b/drivers/media/platform/vsp1/vsp1_drm.h
> index e85ad4366fbb..d780dafc1324 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.h
> +++ b/drivers/media/platform/vsp1/vsp1_drm.h
> @@ -20,6 +20,7 @@
>  /**
>   * vsp1_drm_pipeline - State for the API exposed to the DRM driver
>   * @pipe: the VSP1 pipeline used for display
> + * @enabled: true if the pipeline is enabled
>   * @width: output display width
>   * @height: output display height
>   * @force_brx_release: when set, release the BRx during the next reconfiguration
> @@ -31,6 +32,7 @@
>   */
>  struct vsp1_drm_pipeline {
>  	struct vsp1_pipeline pipe;
> +	bool enabled;
>  
>  	unsigned int width;
>  	unsigned int height;
> -- 
> Regards,
> 
> Laurent Pinchart
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
