Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DA96A9250
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 09:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjCCIWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 03:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjCCIWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 03:22:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360E559E5E
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 00:21:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 805B461760
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 08:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442C3C433EF;
        Fri,  3 Mar 2023 08:21:06 +0000 (UTC)
Message-ID: <c180080e-c4b9-3cbe-558d-ca97b1d2456d@xs4all.nl>
Date:   Fri, 3 Mar 2023 09:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 21/26] media: ipu3-cio2: Don't use devm_request_irq()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <20230201214535.347075-22-sakari.ailus@linux.intel.com>
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230201214535.347075-22-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/02/2023 22:45, Sakari Ailus wrote:
> Use request_irq() instead of devm_request_irq(), as a handler set using
> devm_request_irq() may still be called once the driver's remove() callback
> has been called.
> 
> Also register the IRQ earlier on.

Why register it earlier? You do not explain the reason.

Also, does this patch (and also 18/26) belong in this patch series?
It seems more like a normal bug fix and not related to life-time management.

And isn't it the responsibility of the driver to ensure that the irqs are
masked in the remove() callback to prevent the irq from being called?

devm_request_irq() is used a lot in the kernel, so if this is a
common issue, then just fixing it in two drivers isn't going to make
much of a difference.

Regards,

	Hans

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index d1bfcfba112f..9fdfb2a794db 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1773,6 +1773,12 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	if (r)
>  		return r;
>  
> +	r = request_irq(pci_dev->irq, cio2_irq, IRQF_SHARED, CIO2_NAME, cio2);
> +	if (r) {
> +		dev_err(dev, "failed to request IRQ (%d)\n", r);
> +		goto fail_mutex_destroy;
> +	}
> +
>  	mutex_init(&cio2->lock);
>  
>  	cio2->media_dev.dev = dev;
> @@ -1783,7 +1789,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	media_device_init(&cio2->media_dev);
>  	r = media_device_register(&cio2->media_dev);
>  	if (r < 0)
> -		goto fail_mutex_destroy;
> +		goto fail_free_irq;
>  
>  	cio2->v4l2_dev.mdev = &cio2->media_dev;
>  	r = v4l2_device_register(dev, &cio2->v4l2_dev);
> @@ -1803,13 +1809,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	if (r)
>  		goto fail_clean_notifier;
>  
> -	r = devm_request_irq(dev, pci_dev->irq, cio2_irq, IRQF_SHARED,
> -			     CIO2_NAME, cio2);
> -	if (r) {
> -		dev_err(dev, "failed to request IRQ (%d)\n", r);
> -		goto fail_clean_notifier;
> -	}
> -
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_allow(dev);
>  
> @@ -1824,6 +1823,8 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  fail_media_device_unregister:
>  	media_device_unregister(&cio2->media_dev);
>  	media_device_cleanup(&cio2->media_dev);
> +fail_free_irq:
> +	free_irq(pci_dev->irq, cio2);
>  fail_mutex_destroy:
>  	mutex_destroy(&cio2->lock);
>  	cio2_fbpt_exit_dummy(cio2);
> @@ -1837,6 +1838,7 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
>  
>  	media_device_unregister(&cio2->media_dev);
>  	v4l2_device_unregister(&cio2->v4l2_dev);
> +	free_irq(pci_dev->irq, cio2);
>  	v4l2_async_nf_unregister(&cio2->notifier);
>  	v4l2_async_nf_cleanup(&cio2->notifier);
>  	cio2_queues_exit(cio2);

