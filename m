Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575A721F1CE
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 14:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgGNMsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 08:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728393AbgGNMsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 08:48:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE82C061755
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 05:48:19 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 11A752A2D7F
Subject: Re: [PATCH 1/4] media: staging: rkisp1: cap: don't set next buffer
 from rkisp1_vb2_buf_queue
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
 <20200714123832.28011-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c4dd300d-4dab-8c5a-e2c3-2d0ba042dc8d@collabora.com>
Date:   Tue, 14 Jul 2020 09:48:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200714123832.28011-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 7/14/20 9:38 AM, Dafna Hirschfeld wrote:
> The function 'rkisp1_vb2_buf_queue' sets the next buffer directly
> in case the capture is already streaming but no frame yet arrived
> from the sensor. This is an optimization that tries to avoid
> dropping a frame.
> The call atomic_read(&cap->rkisp1->isp.frame_sequence) is used
> to check if a frame arrived. Reading the 'frame_sequence' should
> be avoided outside irq handlers to avoid race conditions.
> 
> This patch removes this optimization. Dropping of the first
> frames can be avoided if userspace queues the buffers before
> start streaming. If userspace starts queueing buffers
> only after calling 'streamon' he risks frame drops anyway.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 793ec884c894..572b0949c81f 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -743,18 +743,7 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
>  		     ispbuf->buff_addr[RKISP1_PLANE_CB]);
>  
>  	spin_lock_irqsave(&cap->buf.lock, flags);
> -
> -	/*
> -	 * If there's no next buffer assigned, queue this buffer directly
> -	 * as the next buffer, and update the memory interface.
> -	 */
> -	if (cap->is_streaming && !cap->buf.next &&
> -	    atomic_read(&cap->rkisp1->isp.frame_sequence) == -1) {
> -		cap->buf.next = ispbuf;
> -		rkisp1_set_next_buf(cap);

Doesn't this mean we'll always drop the first frame? Since the first user buffer will only be configured to
the hardware after receiving the first frame? So the first frame will always go to the dummy buffer, no?

Thanks
Helen

> -	} else {
> -		list_add_tail(&ispbuf->queue, &cap->buf.queue);
> -	}
> +	list_add_tail(&ispbuf->queue, &cap->buf.queue);
>  	spin_unlock_irqrestore(&cap->buf.lock, flags);
>  }
>  
> 
