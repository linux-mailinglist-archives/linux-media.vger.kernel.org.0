Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6C219F540
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 13:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgDFL4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 07:56:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53242 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727705AbgDFL4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 07:56:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8979C2958A3
Subject: Re: [PATCH v2 4/5] media: staging: rkisp1: cap: support uv swapped
 plane formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
 <20200402190419.15155-5-dafna.hirschfeld@collabora.com>
 <20200405181623.GQ5846@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e3b8728b-7146-30b5-2312-1b4cbac52c27@collabora.com>
Date:   Mon, 6 Apr 2020 13:56:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405181623.GQ5846@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/5/20 8:16 PM, Laurent Pinchart wrote:
> Hi Dafna,
> 
> Thank you for the patch.
> 
> On Thu, Apr 02, 2020 at 09:04:18PM +0200, Dafna Hirschfeld wrote:
>> Plane formats with the u and v planes swapped can be
>> supported by changing the address of the cb and cr in
>> the buffer.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Acked-by: Helen Koike <helen.koike@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index fa2849209433..2d274e8f565b 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -41,6 +41,10 @@
>>   	(((write_format) == RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA) ||	\
>>   	 ((write_format) == RKISP1_MI_CTRL_SP_WRITE_SPLA))
>>   
>> +#define RKISP1_IS_PLANAR(write_format)					\
>> +	(((write_format) == RKISP1_MI_CTRL_SP_WRITE_PLA) ||		\
>> +	 ((write_format) == RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8))
>> +
>>   enum rkisp1_plane {
>>   	RKISP1_PLANE_Y	= 0,
>>   	RKISP1_PLANE_CB	= 1,
>> @@ -788,6 +792,19 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
>>   			rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB);
>>   	}
>>   
>> +	/*
>> +	 * uv swap can be supported for plane formats by switching
>> +	 * the address of cb and cr
>> +	 */
>> +	if (RKISP1_IS_PLANAR(cap->pix.cfg->write_format) &&
> 
> As commented on patch 3/5, could this be checked from the data in
> v4l2_format_info ?
yes
> 
>> +	    cap->pix.cfg->uv_swap) {
>> +		ispbuf->buff_addr[RKISP1_PLANE_CR] =
>> +			ispbuf->buff_addr[RKISP1_PLANE_CB];
>> +		ispbuf->buff_addr[RKISP1_PLANE_CB] =
>> +			ispbuf->buff_addr[RKISP1_PLANE_CR] +
>> +			rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR);
> 
> How about
> 
> 		swap(ispbuf->buff_addr[RKISP1_PLANE_CR],
> 		     ispbuf->buff_addr[RKISP1_PLANE_CB]);
> 
> ?
This also works, theoretically if there was a format where the Cb, Cr planes
are not equal size then a swap will not work.

Thanks,
Dafna
> 
>> +	}
>> +
>>   	spin_lock_irqsave(&cap->buf.lock, flags);
>>   
>>   	/*
> 
