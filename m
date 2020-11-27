Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5E92C684B
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 15:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbgK0O4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 09:56:53 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:56117 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729913AbgK0O4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 09:56:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ifB1kXAH1kGBYifB4kPoNg; Fri, 27 Nov 2020 15:56:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606489011; bh=6hiM2CA4tZKAKqBJODw7h/LTTqXoU9uPnCQF/6zYjQc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=i7zAviguXus2cHvcWnQJWS70o2o8G9vmkM/fubM0exKQYBYzfkfPrPoEverVmguh3
         WCTc1gIRDqEVTq1AdcUFUYho0KAOeAuPMcr4P229j6DYzFGHp9RgViz5Z7pO89h6+P
         pVPBGVtA/YwOReVEAnyFgQSAOwTOBm86J73/vpNtjFxOBD/2GbxO7zH4OCLA6Qh69K
         Kc1tiHI63g2zl1zZ3eN++P1VFK0XZYv/d7FSM4CTmKS8FjZW4KhcsL79JHsSBiFeu8
         qt9ofBiKHAlJH946INXW7ir+84H9gk9HuWZJI7AaOh4VHJDJ0RHeirAeJgK/e5v2dz
         BO+0wIPFphnTA==
Subject: Re: [PATCH] media: vb2: always set buffer cache sync hints
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
 <0dbfa509-8c82-7470-c18b-24ab5c92dc4b@xs4all.nl>
 <X8ENifLanjYuhF/r@jagdpanzerIV.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <509cc69b-39d7-4b13-f392-ebf25530c8fe@xs4all.nl>
Date:   Fri, 27 Nov 2020 15:56:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <X8ENifLanjYuhF/r@jagdpanzerIV.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJk8DMwpDEftwig59ilInD05om490pgnHJQNuDUkJ/rTnJjdPTUo3SjCv3g5ZJRo+4aL/aAvDwHfq0sm/+BRi8oNC2kFo2lxFRqb6NW0t90MovHpslQw
 d8QCY8U1d33g0qCr43A6BtnRWl0No33SjIqCbCkSS2otXHPIjlz86Aj0H6HbZpEXGhcwA2ZqqpYfyiYhoGNwVb3SoqNGRWyp5lFmd4SYO4YXCdurnMIBs38j
 iHdUWesXl7xrr0ZsOeMcESokLElifMi4VLMzly+J9AIQbXDhWF7c6cMSO2iUbNB8Lybv0fzr3x4IO9us+/ufM7gIAyi14fnx6iYoEPlWGSMtLIZf+h5MkOF8
 sPm861j4mg99aKQx+z08Nk+wFe6Kjm6KxUBXrvpmqLGHuMmXgiOHhTXn52KtmUN3+MShDhMZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/11/2020 15:30, Sergey Senozhatsky wrote:
> On (20/11/27 13:59), Hans Verkuil wrote:
>>
>> I think this needs a comment, basically explaining what you said in
>> the commit log. It's not obvious from the code that this is a
>> workaround.
> 
> Something like this?

Yes.

BTW, wouldn't it be sufficient to change this code to:

	if (!q->allow_cache_hints && q->memory != VB2_MEMORY_DMABUF) {
		vb->need_cache_sync_on_prepare = 1;
		vb->need_cache_sync_on_finish = 1;
	}

Or am I missing something?

DVB drivers do not set this flag, and even for DVB cache sync shouldn't be
needed for DMABUF, right?

Regards,

	Hans

> 
> ---
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 5499013cf82e..21b2b0ae3629 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -414,6 +414,16 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>                 vb->index = q->num_buffers + buffer;
>                 vb->type = q->type;
>                 vb->memory = memory;
> +               /*
> +                * A workaround fix. We need to set these flags here so that
> +                * videobuf2 core will always call ->prepare()/->finish()
> +                * cache sync/flush on vb2 buffers. Otherwise, for backends
> +                * that don't rely on V4L2 (perhaps dvb) these flags will
> +                * always be false and, hence, videobuf2 core will skip cache
> +                * sync/flush operations.
> +                */
> +               vb->need_cache_sync_on_prepare = 1;
> +               vb->need_cache_sync_on_finish = 1;
>                 for (plane = 0; plane < num_planes; ++plane) {
>                         vb->planes[plane].length = plane_sizes[plane];
>                         vb->planes[plane].min_length = plane_sizes[plane];
> 

