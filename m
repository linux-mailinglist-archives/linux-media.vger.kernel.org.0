Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E11F74AC33D
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 16:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240994AbiBGP2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 10:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443667AbiBGPNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 10:13:36 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC685C03FED3
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 07:13:14 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id 4so17229241oil.11
        for <linux-media@vger.kernel.org>; Mon, 07 Feb 2022 07:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NgLzhNEOB/umY2G29qPQnKU7fENvJTeyCIxyQJI0WC8=;
        b=GCac4Qy3VunjSaQ8Y0FfjR4DG151bVUy0cheEUaUQtVtafKE9mz9Bwggz698p0Bbp5
         cy9t6zlRsb5p/DKGVqzC41WPRID4snkB0zkfRsszv9kbmOq1i8ryjW3GdxTuCPJenpst
         K3y4PWUjtDJSpO0VfGgcTF/XDPanXNvb+jJOL2FdPXsavNeKz7XavHHPUbPpBiV1cIqr
         ejv0XIIkC4Fyb1yhnLHb/msj5nYZsqeQ8G2AVRtku2y5RJNykhyuULCLuUJSujI+0DYn
         gcVxfGEqmd3xxw3jNo/Y9hofIPegsqeyAcBkBVfa2IczKHid75hWz9HVqsqhiKSkuXVX
         etbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NgLzhNEOB/umY2G29qPQnKU7fENvJTeyCIxyQJI0WC8=;
        b=2BsTL7uR1tmkWjrLBH6H2wq3eIzzWWtG6Bu0cvVQXVW7/wDme1XsOAgeGVm7Hidpjq
         JL/YvDR91M0dQClE6zIkEKfpqIxPxjXdBetIaQ9FDTO+IpNZAHcpVlp7IAHsu/cBSMqY
         h8qfs0eD6quQNP+vuAfGa0HqTcLmWLg2EEMsWNIarxDGdZhMZWLFEwkhUIrJArNN9PbJ
         AejDlmyBEE+LgZlRl8CKYrLdh8ONK8ivRfdORLUDonlazwxhKaxBjE9v0iGpY+F15hRU
         hlxisWeR1vE2cOb6Bx8TnoOF+ce2wELb0gBtJcVEc7Dmy486qsPWkP0dhUHN2dXkQ6mn
         1bog==
X-Gm-Message-State: AOAM533iB1tSl+1FXJI5k6g9Yol6s3ozuXArIKhq6Z+0E6JTgRCylTYY
        KAy+XAUNm/qsg3z/tM0LYH7U0g==
X-Google-Smtp-Source: ABdhPJxGWZKcjy9KWReecJceZEhjyMjc2eHswxwI1B6pEe6iGyGhax8rbeDRCLzYSlzMGAT4bKn3sw==
X-Received: by 2002:a05:6808:1648:: with SMTP id az8mr79160oib.22.1644246794304;
        Mon, 07 Feb 2022 07:13:14 -0800 (PST)
Received: from eze-laptop ([190.194.87.200])
        by smtp.gmail.com with ESMTPSA id s3sm4447446ois.19.2022.02.07.07.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 07:13:13 -0800 (PST)
Date:   Mon, 7 Feb 2022 12:13:08 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        hch@lst.de, dafna3@gmail.com
Subject: Re: [PATCH v2 4/4] media: stk1160: use dma_alloc_noncontiguous API
Message-ID: <YgE3BGsZs1h/fyzK@eze-laptop>
References: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
 <20220125080213.30090-5-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125080213.30090-5-dafna.hirschfeld@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jan 25, 2022 at 10:02:13AM +0200, Dafna Hirschfeld wrote:
> Replace the urb buffers allocation to use the
> noncontiguous API. This improves performance on ARM
> platform since the previous dma allocation was
> coherent dma allocation which disables the cache on
> ARM platforms. With the noncontiguous API the cache
> is not disabled.
> The noncontiguous API requires the driver to
> handle synchronization.
> This commit is similar to this one for the uvc driver:
> 
^^^^^^
This description still looks weird. How about:

"""
Replace the urb buffers allocation to use the noncontiguous API

This improves performance on ARM platform where DMA coherent allocations
produce uncached mappings. Note that the noncontiguous API
requires the driver to handle synchronization.

This commit is similar to this one for the uvc driver:

  https://lkml.org/lkml/2021/3/12/1506

Performance ...
""

Also, see below a little change:

> 
> Performance tests on rock-pi4 (Arm64) shows about 15x
> improvements:
> 
> == DMA NONCONTIGUOUS ==
> total durations: 20.63678480 sec
> urb processing durations: 0.286864889 sec
> uS/qty: 286864/2508 avg: 114.379 min: 0.583 max: 155.461 (uS)
> FPS: 24.92
> lost: 0 done: 500
> raw decode speed: 11.603 Gbits/s
> bytes 414831228.000
> bytes/urb: 165403
> 
> == DMA COHERENT ==
> total durations: 20.73551767 sec
> urb processing durations: 4.541559160 sec
> uS/qty: 4541559/2509 avg: 1810.107 min: 0.583 max: 2113.163 (uS)
> FPS: 24.90
> lost: 0 done: 500
> raw decode speed: 730.738 Mbits/s
> bytes 414785444.000
> bytes/urb: 165319
> 
> Performance tests on x86 laptop show no significant
> difference:
> 
> == DMA NONCONTIGUOUS ==
> total durations: 20.220590102 sec
> urb processing durations: 0.63021818 sec
> uS/qty: 63021/2512 avg: 25.088 min: 0.138 max: 146.750 (uS)
> FPS: 24.72
> lost: 0 done: 500
> raw decode speed: 52.751 Gbits/s
> bytes 415421032.000
> bytes/urb: 165374
> 
> == DMA COHERENT ==
> total durations: 20.220475614 sec
> urb processing durations: 0.64751972 sec
> uS/qty: 64751/2512 avg: 25.777 min: 0.168 max: 132.250 (uS)
> FPS: 24.72
> lost: 0 done: 500
> raw decode speed: 51.927 Gbits/s
> bytes 415422794.000
> bytes/urb: 165375
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/usb/stk1160/stk1160-v4l.c   |   4 +
>  drivers/media/usb/stk1160/stk1160-video.c | 114 +++++++++++++---------
>  drivers/media/usb/stk1160/stk1160.h       |  10 ++
>  3 files changed, 84 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
> index ebf245d44005..a1f785a5ffd8 100644
> --- a/drivers/media/usb/stk1160/stk1160-v4l.c
> +++ b/drivers/media/usb/stk1160/stk1160-v4l.c
> @@ -232,6 +232,10 @@ static int stk1160_start_streaming(struct stk1160 *dev)
>  
>  	/* submit urbs and enables IRQ */
>  	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
> +		struct stk1160_urb *stk_urb = &dev->isoc_ctl.urb_ctl[i];
> +
> +		dma_sync_sgtable_for_device(stk1160_get_dmadev(dev), stk_urb->sgt,
> +					    DMA_FROM_DEVICE);
>  		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb, GFP_KERNEL);
>  		if (rc) {
>  			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index f3c0497a8539..6600afc565b8 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -295,7 +295,9 @@ static void stk1160_process_isoc(struct stk1160 *dev, struct urb *urb)
>  static void stk1160_isoc_irq(struct urb *urb)
>  {
>  	int i, rc;
> -	struct stk1160 *dev = urb->context;
> +	struct stk1160_urb *stk_urb = urb->context;
> +	struct stk1160 *dev = stk_urb->dev;
> +	struct device *dma_dev = stk1160_get_dmadev(dev);
>  
>  	switch (urb->status) {
>  	case 0:
> @@ -310,6 +312,10 @@ static void stk1160_isoc_irq(struct urb *urb)
>  		return;
>  	}
>  
> +	invalidate_kernel_vmap_range(stk_urb->transfer_buffer,
> +				     urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_cpu(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
> +
>  	stk1160_process_isoc(dev, urb);
>  
>  	/* Reset urb buffers */
> @@ -318,6 +324,7 @@ static void stk1160_isoc_irq(struct urb *urb)
>  		urb->iso_frame_desc[i].actual_length = 0;
>  	}
>  
> +	dma_sync_sgtable_for_device(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
>  	rc = usb_submit_urb(urb, GFP_ATOMIC);
>  	if (rc)
>  		stk1160_err("urb re-submit failed (%d)\n", rc);
> @@ -353,37 +360,34 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
>  	stk1160_dbg("all urbs killed\n");
>  }
>  
> +static void stk_free_urb_buffer(struct stk1160 *dev, struct stk1160_urb *stk_urb)

Change this function to "stk1160_free_urb". With that,

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel
