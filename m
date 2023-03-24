Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD99B6C7937
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 08:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjCXHuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 03:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjCXHuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 03:50:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB402231FC;
        Fri, 24 Mar 2023 00:50:15 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 120A5A49;
        Fri, 24 Mar 2023 08:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679644214;
        bh=YgvDXz+vZzs0D8BefWx7SM6QtN8f7nIR0mzWtnOonxg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aUKKyC6L/T4hp2Gb5Sr57a45bxKI7tUW43YC5AEk/J9hkwmsoYh332QGrbSXbFUZ4
         JFGtPGSJHY5EgH5BPGZ5Wl0ACSZg3dupy0Hp7ncWwBBqduk0VhSYsoOUN3tbI6biu5
         XRMVVgXhJXx2EW43CS4dmdGyl61sG53qZOwurUso=
Message-ID: <ea3247b5-3e5b-8fea-bbfb-329065900774@ideasonboard.com>
Date:   Fri, 24 Mar 2023 07:50:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/8] usb: gadget: uvc: fix return code of REQBUFS
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-2-e41f0c5d9d8e@pengutronix.de>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-2-e41f0c5d9d8e@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael

On 23/03/2023 11:41, Michael Tretter wrote:
> On success, VIDIOC_REQBUFS should return 0, not the number of allocated
> buffers. As uvcg_alloc_buffers() is directly called by regbufs, it has
> to return the correct error codes.


s/regbufs/reqbufs

>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---


This probably wants a Fixes: tag?


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/usb/gadget/function/uvc_queue.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index 0aa3d7e1f3cc..f14f75b93aaa 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -179,11 +179,7 @@ void uvcg_free_buffers(struct uvc_video_queue *queue)
>   int uvcg_alloc_buffers(struct uvc_video_queue *queue,
>   			      struct v4l2_requestbuffers *rb)
>   {
> -	int ret;
> -
> -	ret = vb2_reqbufs(&queue->queue, rb);
> -
> -	return ret ? ret : rb->count;
> +	return vb2_reqbufs(&queue->queue, rb);
>   }
>   
>   int uvcg_query_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf)
>
