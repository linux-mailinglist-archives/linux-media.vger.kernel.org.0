Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0EC3C5D21
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 15:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhGLNXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 09:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhGLNXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 09:23:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ED4C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 06:21:06 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7] (unknown [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 11CB21F423B6;
        Mon, 12 Jul 2021 14:21:04 +0100 (BST)
Subject: Re: [PATCH 2/2] media: rkisp1: cap: initialize dma buf address in
 'buf_init' cb
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20210625082309.24944-1-dafna.hirschfeld@collabora.com>
 <20210625082309.24944-3-dafna.hirschfeld@collabora.com>
 <a3144cc37a11e43d984c71aa160079cab65cc335.camel@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <b627ea79-459e-f3af-ab22-3c486296ed23@collabora.com>
Date:   Mon, 12 Jul 2021 15:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3144cc37a11e43d984c71aa160079cab65cc335.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 26.06.21 03:08, Ezequiel Garcia wrote:
> Hi Dafna,
> 
> On Fri, 2021-06-25 at 11:23 +0300, Dafna Hirschfeld wrote:
>> Initializing the dma addresses of the capture buffers can
>> move to the 'buf_init' callback, since it is enough to do
>> it once for each buffer and not every time it is queued.
>>
> 
> Are you able to measure any impact with this change?

I didn't measure the impact, I just thought it is a more correct
use of the API.
You think it worth measuring the impact?

Thanks,
Dafna

> 
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> index 60cd2200e7ae..41988eb0ec0a 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> @@ -750,7 +750,7 @@ static int rkisp1_vb2_queue_setup(struct vb2_queue *queue,
>>          return 0;
>>   }
>>   
>> -static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
>> +static int rkisp1_vb2_buf_init(struct vb2_buffer *vb)
>>   {
>>          struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>          struct rkisp1_buffer *ispbuf =
> 
> Since you are interested at these kind of cleanups, you can
> do something like:
> 
> +enum rkisp1_plane {
> +       RKISP1_PLANE_Y  = 0,
> +       RKISP1_PLANE_CB = 1,
> +       RKISP1_PLANE_CR = 2,
> +       RKISP1_NUM_PLANES = 3
> +};
> +
>   /*
>    * struct rkisp1_buffer - A container for the vb2 buffers used by the video devices:
>    *                       params, stats, mainpath, selfpath
> @@ -160,7 +167,7 @@ struct rkisp1_vdev_node {
>   struct rkisp1_buffer {
>          struct vb2_v4l2_buffer vb;
>          struct list_head queue;
> -       u32 buff_addr[VIDEO_MAX_PLANES];
> +       u32 buff_addr[RKISP1_NUM_PLANES];
>   };
> 
> And then you can get rid of the memset, and rely on
> vb2_dma_contig_plane_dma_addr returning NULL.
> 
> @@ -759,8 +753,7 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
>          const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
>          unsigned int i;
>   
> -       memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
> -       for (i = 0; i < pixm->num_planes; i++)
> +       for (i = 0; i < RKISP1_NUM_PLANES; i++)
>                  ispbuf->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
> 
