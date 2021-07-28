Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB543D8A08
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 10:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbhG1IvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 04:51:04 -0400
Received: from comms.puri.sm ([159.203.221.185]:36200 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235081AbhG1IvC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 04:51:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 8E0C3E048D;
        Wed, 28 Jul 2021 01:50:30 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id O9IJ2Mv9jZrl; Wed, 28 Jul 2021 01:50:29 -0700 (PDT)
Message-ID: <09087c452885b0da779258b4962a349dbde1aec7.camel@puri.sm>
Subject: Re: [PATCH] media: imx: imx7-media-csi: Fix buffer return upon
 stream start failure
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Date:   Wed, 28 Jul 2021 10:50:25 +0200
In-Reply-To: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
References: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 19.05.2021 um 03:58 +0300 schrieb Laurent Pinchart:
> When the stream fails to start, the first two buffers in the queue
> have
> been moved to the active_vb2_buf array and are returned to vb2 by
> imx7_csi_dma_unsetup_vb2_buf(). The function is called with the
> buffer
> state set to VB2_BUF_STATE_ERROR unconditionally, which is correct
> when
> stopping the stream, but not when the start operation fails. In that
> case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c
> b/drivers/staging/media/imx/imx7-media-csi.c
> index f644a640a831..da768ea21d03 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -361,6 +361,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct
> imx7_csi *csi,
>  
>                         vb->timestamp = ktime_get_ns();
>                         vb2_buffer_done(vb, return_status);
> +                       csi->active_vb2_buf[i] = NULL;
>                 }
>         }
>  }
> @@ -386,9 +387,10 @@ static int imx7_csi_dma_setup(struct imx7_csi
> *csi)
>         return 0;
>  }
>  
> -static void imx7_csi_dma_cleanup(struct imx7_csi *csi)
> +static void imx7_csi_dma_cleanup(struct imx7_csi *csi,
> +                                enum vb2_buffer_state return_status)
>  {
> -       imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
> +       imx7_csi_dma_unsetup_vb2_buf(csi, return_status);
>         imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
>  }
>  
> @@ -526,9 +528,10 @@ static int imx7_csi_init(struct imx7_csi *csi)
>         return 0;
>  }
>  
> -static void imx7_csi_deinit(struct imx7_csi *csi)
> +static void imx7_csi_deinit(struct imx7_csi *csi,
> +                           enum vb2_buffer_state return_status)
>  {
> -       imx7_csi_dma_cleanup(csi);
> +       imx7_csi_dma_cleanup(csi, return_status);
>         imx7_csi_init_default(csi);
>         imx7_csi_dmareq_rff_disable(csi);
>         clk_disable_unprepare(csi->mclk);
> @@ -691,7 +694,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev
> *sd, int enable)
>  
>                 ret = v4l2_subdev_call(csi->src_sd, video, s_stream,
> 1);
>                 if (ret < 0) {
> -                       imx7_csi_deinit(csi);
> +                       imx7_csi_deinit(csi, VB2_BUF_STATE_QUEUED);
>                         goto out_unlock;
>                 }
>  
> @@ -701,7 +704,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev
> *sd, int enable)
>  
>                 v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
>  
> -               imx7_csi_deinit(csi);
> +               imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
>         }
>  
>         csi->is_streaming = !!enable;


This patch has not yet been accepted. Any specific reason? I need it.

Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>

thank you very much

