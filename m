Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381125EE1DA
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 18:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbiI1QaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 12:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234486AbiI1QaC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 12:30:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F088F1E722;
        Wed, 28 Sep 2022 09:29:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2D0AB82150;
        Wed, 28 Sep 2022 16:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E2DC433D6;
        Wed, 28 Sep 2022 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664382597;
        bh=XeyD6GwfVncXVfYNyWO+FuF8P1JbvW1tgiUZc/k3E2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mRwEo/8t/4+gDjRK82Lc+WFxc77zy+yErX5s2eHGgzVs4lAenQbFm10NS8pdgv/uD
         5FHNbq6yg4I101zuyNpwBH9mAeeZmsC//XPMXWiNe4IO/TBj8TwrXWnaGalaiIi+lq
         zFh9sXNJX9gPdaAEDIf9TcnqSGZd5BUhuEhjSNeiOyAi/C2qSLuSJ275feoE2EFNfE
         BqtKUEw62k+hVXpvR9IFct2EKrgosuARv2w74jK64nFSPn8SS+u3V2RIRAffGLB83w
         /ge357bLp9AaD52f2fjF4SXuqtxHBdDK5EhPKK8/eEkAG6Svek8MCZ9PdthidCkW1I
         5fMHofnMOk8PQ==
Date:   Wed, 28 Sep 2022 09:29:55 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <YzR2gyyuU6luYRBP@dev-arch.thelio-3990X>
References: <20220907215818.2670097-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220907215818.2670097-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Wed, Sep 07, 2022 at 11:58:18PM +0200, Michael Grzeschik wrote:
> This patch is changing the simple workqueue in the gadget driver to be
> allocated as async_wq with a higher priority. The pump worker, that is
> filling the usb requests, will have a higher priority and will not be
> scheduled away so often while the video stream is handled. This will
> lead to fewer streaming underruns.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

...

> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 58e383afdd4406..1a31e6c6a5ffb8 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -88,6 +88,7 @@ struct uvc_video {
>  	struct usb_ep *ep;
>  
>  	struct work_struct pump;
> +	struct workqueue_struct *async_wq;
>  
>  	/* Frame parameters */
>  	u8 bpp;

I am commenting here because this is the most recent change but after
this showed up in -next as commit 9b91a6523078 ("usb: gadget: uvc:
increase worker prio to WQ_HIGHPRI"), I see the following warning/error
when building s390 allmodconfig:

  In file included from ../include/linux/string.h:253,
                   from ../include/linux/bitmap.h:11,
                   from ../include/linux/cpumask.h:12,
                   from ../include/linux/smp.h:13,
                   from ../include/linux/lockdep.h:14,
                   from ../include/linux/rcupdate.h:29,
                   from ../include/linux/rculist.h:11,
                   from ../include/linux/pid.h:5,
                   from ../include/linux/sched.h:14,
                   from ../include/linux/ratelimit.h:6,
                   from ../include/linux/dev_printk.h:16,
                   from ../include/linux/device.h:15,
                   from ../drivers/usb/gadget/function/f_uvc.c:9:
  In function ‘fortify_memset_chk’,
      inlined from ‘uvc_register_video’ at ../drivers/usb/gadget/function/f_uvc.c:424:2:
  ../include/linux/fortify-string.h:301:25: error: call to ‘__write_overflow_field’ declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
    301 |                         __write_overflow_field(p_size_field, size);
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This commit did not directly cause this, it just made the issue more
obvious. In commit e4ce9ed835bc ("usb: gadget: uvc: ensure the vdev is
unset"), also authored by you, the size parameter appears to be wrong?
It is using the size of 'struct uvc_video', instead of the size of
'struct video_device'. It appears to be pure luck that everything worked
up until this point, as those two types had the same size (1400 bytes)
before this change but now 'struct uvc_video' is 1408 bytes, meaning
there is now an overwrite. Any reason this is not the fix?

Cheers,
Nathan

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index e6948cf8def3..836601227155 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -421,7 +421,7 @@ uvc_register_video(struct uvc_device *uvc)
 	int ret;
 
 	/* TODO reference counting. */
-	memset(&uvc->vdev, 0, sizeof(uvc->video));
+	memset(&uvc->vdev, 0, sizeof(uvc->vdev));
 	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
 	uvc->vdev.v4l2_dev->dev = &cdev->gadget->dev;
 	uvc->vdev.fops = &uvc_v4l2_fops;
