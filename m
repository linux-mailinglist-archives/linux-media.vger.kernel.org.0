Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D71E136B14
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 11:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgAJKas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 05:30:48 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:32847 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727240AbgAJKar (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 05:30:47 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id prYvilyy5pLtbprYyiPyae; Fri, 10 Jan 2020 11:30:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578652245; bh=UmnHjuhv0L/RUYEp6Ru2m4/tm4kdj/elcPFBqWEVHsA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aXgdqHQeSDOkA8v8+aqyxhzgnhEWgGpaTTPNzRXLfv8H88letSqlwvP7m4tsKm6ZP
         eD7da6VPOvuXE24n42eskJ1eHYZ/+SYA+qq8km7HV2bRGcBTsI41RxNrFnaYdU548K
         NNKUTQh9Rkb1B6kjpLpLjxdigWTkU7tsM6LKYs5Sf/0ZQEby0orBet8EGSLhyGYTLp
         JvbdzZIwTmZXXaSYzVwY/rnq+EUSfP6v3kIS9h6fiG+BjTEyKlYP9XsIe5NXN46uW8
         1qB79ogDL21N9RRO3SSp/D0+qi8y1KiYwDm75yRgq1Fb7DC4GmBYFWg7AM4Eo4VC/6
         iP1C8XbYLUpTg==
Subject: Re: [RFC][PATCH 13/15] videobuf2: do not sync buffers for DMABUF
 queues
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-14-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2d0e1a9b-6c5e-ff70-9862-32c8b8aaf65f@xs4all.nl>
Date:   Fri, 10 Jan 2020 11:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217032034.54897-14-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGn33jl5Ex11r9ndRakEZYzhkqPPU69dIYYYWJ1U1bzJZwhBMtR/fILC9rwwGvREyzCX7w1lFqaGdZsGk9Z0x2jeCOrN0qQhBCdmkix6mx/UbIuanza5
 fvNDNOni7JbE+fK0zqGwln+v07+XaWCjIBYdrBC8oxhiP/KyAzSPZREEGTTsWib2J2LbAN//W1QO2kIsHfROPfwq/jnUXdDNcyWacew3cMFhh8FW7CT0SpmX
 tHuiWSRbJ4XDHCNn30cUMluYhbN9xLp2XMh5cGfnEscGAras6lPiNz16fZzKiRiPgdPe3NtnV9HlybXYHq8zTQT2t/h3GkxIhtiotro1Ox4mGGrlM89Ee7Sv
 9Ws1D5OENNOkyy8xJYnu564EsEApvyxRFsK3nGNGHNqTYI9oAQ/et6CCffhZE+6NAFwZXk9xD5K0H1gC5Qp6hzocoDWMbRbf4CMi+Y+kZ4x40aQgl6sby5cY
 jwPmU05COAssVkRI41aDK25Ky1wDcMXzv84gvN50NBr93iqJ0pMlLUUAk4D0tG9kOLJkyzla9/uyqPMD1iXX1+NP0pWLIXm7vkIqZsoCZZVNaX+Yz9Wo+9sl
 UeF2iOP4OS6R+KdmN4EyLVqkO2SdfkmHiRiD5uwuY+9YFm86J2rtZFHMeYltEU23pt0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> DMA-exporter is supposed to handle cache syncs, so we can
> avoid ->prepare()/->finish() syncs from videobuf2 core for
> DMABUF buffers.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 1762849288ae..2b9d3318e6fb 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -341,8 +341,22 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
>  				   struct vb2_buffer *vb,
>  				   struct v4l2_buffer *b)
>  {
> -	vb->need_cache_sync_on_prepare = 1;
> +	/*
> +	 * DMA exporter should take care of cache syncs, so we can avoid
> +	 * explicit ->prepare()/->finish() syncs.
> +	 */
> +	if (q->memory == VB2_MEMORY_DMABUF) {
> +		vb->need_cache_sync_on_finish = 0;
> +		vb->need_cache_sync_on_prepare = 0;
> +		return;
> +	}
>  
> +	/*
> +	 * For other ->memory types we always need ->prepare() cache
> +	 * sync. ->finish() cache sync, however, can be avoided when queue
> +	 * direction is TO_DEVICE.
> +	 */
> +	vb->need_cache_sync_on_prepare = 1;

I'm trying to remember: what needs to be done in prepare()
for a capture buffer? I thought that for capture you only
needed to invalidate the cache in finish(), but nothing needs
to be done in the prepare().

Regards,

	Hans

>  	if (q->dma_dir != DMA_TO_DEVICE)
>  		vb->need_cache_sync_on_finish = 1;
>  	else
> 

