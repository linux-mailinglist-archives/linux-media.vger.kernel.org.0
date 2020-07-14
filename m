Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3850E21F5E0
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 17:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgGNPLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 11:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgGNPLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 11:11:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14643C061755
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 08:11:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id D4DF02A3924
Subject: Re: [PATCH 2/4] media: staging: rkisp1: cap: protect buf.curr and
 buf.next with buf.lock
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
 <20200714123832.28011-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <dbf0fb76-8401-399f-1404-2424342d98ab@collabora.com>
Date:   Tue, 14 Jul 2020 12:11:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200714123832.28011-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/14/20 9:38 AM, Dafna Hirschfeld wrote:
> The spinlock buf.lock should protect access to the buffers.
> This includes the buffers in buf.queue and also buf.curr and
> buf.next. The function 'rkisp1_set_next_buf' access buf.next
> therefore it should also be protected with the lock.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 572b0949c81f..fa3eaeac2a00 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -617,10 +617,11 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>  static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
>  {
>  	struct rkisp1_isp *isp = &cap->rkisp1->isp;
> -	struct rkisp1_buffer *curr_buf = cap->buf.curr;
> +	struct rkisp1_buffer *curr_buf;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&cap->buf.lock, flags);
> +	curr_buf = cap->buf.curr;
>  
>  	if (curr_buf) {
>  		curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
> @@ -640,9 +641,9 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
>  						 queue);
>  		list_del(&cap->buf.next->queue);
>  	}
> -	spin_unlock_irqrestore(&cap->buf.lock, flags);
>  
>  	rkisp1_set_next_buf(cap);
> +	spin_unlock_irqrestore(&cap->buf.lock, flags);
>  }
>  
>  void rkisp1_capture_isr(struct rkisp1_device *rkisp1)
> 
