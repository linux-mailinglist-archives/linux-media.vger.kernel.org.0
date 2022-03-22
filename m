Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6AB94E499D
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 00:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbiCVXYQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 19:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiCVXYQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 19:24:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1614B852
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 16:22:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CE819DE;
        Wed, 23 Mar 2022 00:22:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647991366;
        bh=qmJvMpaWf5M/a8rBFYm0IaZrlVvN7GNHZp2bpgMBqwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=onKRmmfTYGZAcEMcMYV9keVhvLW+tyoJMTLRVHRSas2nDd+6a8sXQKlVMcp/Bv+bJ
         C1mSXdCATIWTgOuuE7x+G+15stqWtZFVvPqFlMi2Ezik0ok0vmAaW9o1vAE3K+GrTs
         TJnLKRL+oGj8pQ+hLFD7yaE5rHqewQ5k0XG7qM3c=
Date:   Wed, 23 Mar 2022 01:22:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com,
        libcamera-devel@lists.libcamera.org, sakari.ailus@linux.intel.com
Subject: Re: [libcamera-devel] [PATCH 1/2] media: staging/intel-ipu3: Reset
 imgu_video_device sequence
Message-ID: <YjpaNAKuI7Ap2lZz@pendragon.ideasonboard.com>
References: <20220318121826.877187-1-umang.jain@ideasonboard.com>
 <20220318121826.877187-2-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220318121826.877187-2-umang.jain@ideasonboard.com>
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

On Fri, Mar 18, 2022 at 05:48:25PM +0530, Umang Jain via libcamera-devel wrote:
> Reset the sequence number of imgu_video_device on stream start.
> Failing to do so results in sequence number getting incremented
> for consecutive stream on/off cycles.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 0473457b4e64..d1c539cefba8 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -485,6 +485,7 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  	pipe = node->pipe;
>  	imgu_pipe = &imgu->imgu_pipe[pipe];
> +	atomic_set(&node->sequence, 0);
>  	r = media_pipeline_start(&node->vdev.entity, &imgu_pipe->pipeline);
>  	if (r < 0)
>  		goto fail_return_bufs;

-- 
Regards,

Laurent Pinchart
