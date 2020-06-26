Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A40B20B284
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 15:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgFZNcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 09:32:05 -0400
Received: from foss.arm.com ([217.140.110.172]:50628 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgFZNcF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 09:32:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D74BD6E;
        Fri, 26 Jun 2020 06:32:04 -0700 (PDT)
Received: from [10.57.13.97] (unknown [10.57.13.97])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BFB13F6CF;
        Fri, 26 Jun 2020 06:32:02 -0700 (PDT)
Subject: Re: [PATCH 3/3] media: staging: rkisp1: params: in 'stop_streaming'
 don't release the lock while returning buffers
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, dafna3@gmail.com, tfiga@chromium.org,
        hverkuil@xs4all.nl, linux-rockchip@lists.infradead.org,
        helen.koike@collabora.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
 <20200625174257.22216-4-dafna.hirschfeld@collabora.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e269f2f5-c24c-7009-e624-3545af206709@arm.com>
Date:   Fri, 26 Jun 2020 14:32:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625174257.22216-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 2020-06-25 18:42, Dafna Hirschfeld wrote:
> In the stop_streaming callback 'rkisp1_params_vb2_stop_streaming'
> there is no need to release the lock 'config_lock' and then acquire
> it again at each iteration when returning all buffers.
> This is because the stream is about to end and there is no need
> to let the isr access a buffer.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>   drivers/staging/media/rkisp1/rkisp1-params.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index bf006dbeee2d..5169b02731f1 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1488,19 +1488,13 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>   	/* stop params input firstly */
>   	spin_lock_irqsave(&params->config_lock, flags);
>   	params->is_streaming = false;
> -	spin_unlock_irqrestore(&params->config_lock, flags);
>   
>   	for (i = 0; i < RKISP1_ISP_PARAMS_REQ_BUFS_MAX; i++) {
> -		spin_lock_irqsave(&params->config_lock, flags);
>   		if (!list_empty(&params->params)) {
>   			buf = list_first_entry(&params->params,
>   					       struct rkisp1_buffer, queue);
>   			list_del(&buf->queue);
> -			spin_unlock_irqrestore(&params->config_lock,
> -					       flags);
>   		} else {
> -			spin_unlock_irqrestore(&params->config_lock,
> -					       flags);
>   			break;
>   		}

Just skimming through out of idle curiosity I was going to comment that 
if you end up with this pattern:

	if (!x) {
		//do stuff
	} else {
		break;
	}

it would be better as:

	if (x)
		break;
	//do stuff

However I then went and looked at the whole function and frankly it's a 
bit of a WTF. As best I could decipher, this whole crazy loop appears to 
be a baroque reinvention of:

	list_for_each_entry_safe(&params->params, ..., buf) {
		list_del(&buf->queue);
		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
	}

(assuming from context that the list should never contain more than 
RKISP1_ISP_PARAMS_REQ_BUFS_MAX entries in the first place)

Robin.

>   
> @@ -1508,6 +1502,7 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>   			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>   		buf = NULL;
>   	}
> +	spin_unlock_irqrestore(&params->config_lock, flags);
>   }
>   
>   static int
> 
