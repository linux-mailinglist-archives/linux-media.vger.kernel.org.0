Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF9E21F5E1
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 17:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgGNPLW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 11:11:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50032 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgGNPLW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 11:11:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id D62DB2A3970
Subject: Re: [PATCH 3/4] media: staging: rkisp1: cap: move code that manages
 the buffers to rkisp1_set_next_buf
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
 <20200714123832.28011-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <4a4a9264-b5b6-06e2-8cee-5dceb043bbce@collabora.com>
Date:   Tue, 14 Jul 2020 12:11:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200714123832.28011-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/14/20 9:38 AM, Dafna Hirschfeld wrote:
> The function 'rkisp1_set_next_buf' configures the registers
> according to 'cap->buf.next'. It is called after updating
> 'cap->buf.next' and 'cap->buf.curr'. This patch moves the
> code that updates those fields to rkisp1_set_next_buf.
> This is a preparation for later patch that change a call to
> 'rkisp1_handle_buffer' with a call to 'rkisp1_set_next_buf'.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 30 +++++++++----------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index fa3eaeac2a00..7f400aefe550 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -575,12 +575,16 @@ static void rkisp1_dummy_buf_destroy(struct rkisp1_capture *cap)
>  
>  static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>  {
> -	/*
> -	 * Use the dummy space allocated by dma_alloc_coherent to
> -	 * throw data if there is no available buffer.
> -	 */
> -	if (cap->buf.next) {
> -		u32 *buff_addr = cap->buf.next->buff_addr;
> +	cap->buf.curr = cap->buf.next;
> +	cap->buf.next = NULL;
> +
> +	if (!list_empty(&cap->buf.queue)) {
> +		u32 *buff_addr;
> +
> +		cap->buf.next = list_first_entry(&cap->buf.queue, struct rkisp1_buffer, queue);
> +		list_del(&cap->buf.next->queue);
> +
> +		buff_addr = cap->buf.next->buff_addr;
>  
>  		rkisp1_write(cap->rkisp1,
>  			     buff_addr[RKISP1_PLANE_Y],
> @@ -592,6 +596,10 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>  			     buff_addr[RKISP1_PLANE_CR],
>  			     cap->config->mi.cr_base_ad_init);
>  	} else {
> +		/*
> +		 * Use the dummy space allocated by dma_alloc_coherent to
> +		 * throw data if there is no available buffer.
> +		 */
>  		rkisp1_write(cap->rkisp1,
>  			     cap->buf.dummy.dma_addr,
>  			     cap->config->mi.y_base_ad_init);
> @@ -632,16 +640,6 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
>  		cap->rkisp1->debug.frame_drop[cap->id]++;
>  	}
>  
> -	cap->buf.curr = cap->buf.next;
> -	cap->buf.next = NULL;
> -
> -	if (!list_empty(&cap->buf.queue)) {
> -		cap->buf.next = list_first_entry(&cap->buf.queue,
> -						 struct rkisp1_buffer,
> -						 queue);
> -		list_del(&cap->buf.next->queue);
> -	}
> -
>  	rkisp1_set_next_buf(cap);
>  	spin_unlock_irqrestore(&cap->buf.lock, flags);
>  }
> 
