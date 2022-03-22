Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED674E499F
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 00:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbiCVXZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 19:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiCVXZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 19:25:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDE32DD7D
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 16:23:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AFEC1273;
        Wed, 23 Mar 2022 00:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647991424;
        bh=pLN3KqefIsV8sQozUTnPBHAlnhpX9AuzCKXrNyseVh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o2Op7fByiPNZeSJNUbJZRaS0w22guzJOmP7dlnnLcbvKkoYQSjN959uRp0sdTYcv8
         WeEkMNeMVwh4oIjKIsSXyiGGxgAPFBFptGBttmQ6ymKfm3K7sFXqIeAsv04IQbQ9cz
         /+sQwdG1RXYb1IKm6MQLW0hv7pyGxm6vLMVByVns=
Date:   Wed, 23 Mar 2022 01:23:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com,
        libcamera-devel@lists.libcamera.org, sakari.ailus@linux.intel.com
Subject: Re: [libcamera-devel] [PATCH 2/2] media: staging/intel-ipu3: Cleanup
 dummy buffers via helper
Message-ID: <YjpabnA+IU1uVEL8@pendragon.ideasonboard.com>
References: <20220318121826.877187-1-umang.jain@ideasonboard.com>
 <20220318121826.877187-3-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220318121826.877187-3-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

Thank you for the patch.

On Fri, Mar 18, 2022 at 05:48:26PM +0530, Umang Jain via libcamera-devel wrote:
> Use an existing helper imgu_video_nodes_exit() on imgu-video-node
> initialization failure path to cleanup dummy buffers.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/ipu3/ipu3.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index 8e1e9e46e604..0c453b37f8c4 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -440,6 +440,16 @@ int imgu_s_stream(struct imgu_device *imgu, int enable)
>  	return r;
>  }
>  
> +static void imgu_video_nodes_exit(struct imgu_device *imgu)
> +{
> +	int i;
> +
> +	for (i = 0; i < IMGU_MAX_PIPE_NUM; i++)
> +		imgu_dummybufs_cleanup(imgu, i);
> +
> +	imgu_v4l2_unregister(imgu);
> +}
> +
>  static int imgu_video_nodes_init(struct imgu_device *imgu)
>  {
>  	struct v4l2_pix_format_mplane *fmts[IPU3_CSS_QUEUES] = { NULL };
> @@ -489,24 +499,11 @@ static int imgu_video_nodes_init(struct imgu_device *imgu)
>  	return 0;
>  
>  out_cleanup:
> -	for (j = 0; j < IMGU_MAX_PIPE_NUM; j++)
> -		imgu_dummybufs_cleanup(imgu, j);
> -
> -	imgu_v4l2_unregister(imgu);
> +	imgu_video_nodes_exit(imgu);
>  
>  	return r;
>  }
>  
> -static void imgu_video_nodes_exit(struct imgu_device *imgu)
> -{
> -	int i;
> -
> -	for (i = 0; i < IMGU_MAX_PIPE_NUM; i++)
> -		imgu_dummybufs_cleanup(imgu, i);
> -
> -	imgu_v4l2_unregister(imgu);
> -}
> -
>  /**************** PCI interface ****************/
>  
>  static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)

-- 
Regards,

Laurent Pinchart
