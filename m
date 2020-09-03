Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF7825BBF2
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 09:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgICHtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 03:49:49 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9777 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgICHts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 03:49:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f509fec0000>; Thu, 03 Sep 2020 00:49:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Sep 2020 00:49:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Sep 2020 00:49:47 -0700
Received: from [10.2.53.12] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Sep
 2020 07:49:47 +0000
Subject: Re: [PATCH 16/38] media: videobuf-dma-sg: number of pages should be
 unsigned long
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michel Lespinasse <walken@google.com>,
        Mike Rapoport <rppt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
 <a57a3584ccc16f33b2e6e8a850b7cb7cf029dfb6.1599062230.git.mchehab+huawei@kernel.org>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <29cbe38a-4094-5d60-9f85-050bb44febcc@nvidia.com>
Date:   Thu, 3 Sep 2020 00:49:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a57a3584ccc16f33b2e6e8a850b7cb7cf029dfb6.1599062230.git.mchehab+huawei@kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599119340; bh=h2YtYK7X/8q5C0J8GcJkvpLDMTqz+dYhXOto+gkI9M0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=StoEJz9iReMvZwUWoJPzLDURYq36XjxdX0hehx0H3TQYOUtozau3fLiE24n5XClNA
         ewK9DL8Nr3NSo5qkdaRNBJq+nGrCeHq8N7jPvSUezeqX+WXTq9cohG+FcBzRYgNgQR
         T5wzmgZGEIuk48fyBbNS9tPt4flECSVn1+xaV2OcpZ+jXivNfdJidtnfuxylTC+soy
         L84gmlGpqVVlALWKfC1tn3jY0u7P7cwxj2FNP3N1WCEtQnGEs/Kw4GGb0iq41OY/th
         eDtzPslAdNwT8+I+bKdycacU0PEfbcmIHw/maCPnOLKSDLcWKKsyJ+DnoZyE2ZyR/T
         70hp5hBYErUvw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/2/20 9:10 AM, Mauro Carvalho Chehab wrote:
> As reported by smatch:
> 
> 	drivers/media/v4l2-core/videobuf-dma-sg.c:245 videobuf_dma_init_kernel() warn: should 'nr_pages << 12' be a 64 bit type?
> 
> The printk should not be using %d for the number of pages.
> 
> After looking better, the real problem here is that the
> number of pages should be long int.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   drivers/media/v4l2-core/videobuf-dma-sg.c | 22 ++++++++++++----------
>   include/media/videobuf-dma-sg.h           |  2 +-
>   2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
> index 46ff19df9f53..8dd0562de287 100644
> --- a/drivers/media/v4l2-core/videobuf-dma-sg.c
> +++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
> @@ -180,7 +180,7 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
>   	if (rw == READ)
>   		flags |= FOLL_WRITE;
>   
> -	dprintk(1, "init user [0x%lx+0x%lx => %d pages]\n",
> +	dprintk(1, "init user [0x%lx+0x%lx => %lu pages]\n",
>   		data, size, dma->nr_pages);
>   
>   	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages,


One pre-existing detail to remember is that the gup/pup routines,
specifically pin_user_pages() in this case, use an "int" for the
incoming nr_pages. (I wonder if that should be changed? It's now
becoming a pitfall.) So it's now possible to overflow.

In other situations like this (see xsdfec_table_write() in
drivers/misc/xilinx_sdfec.c), we've added checks such as:

	u32 n;
	...

	if (WARN_ON_ONCE(n > INT_MAX))
		return -EINVAL;

	nr_pages = n;

	res = pin_user_pages_fast((unsigned long)src_ptr, nr_pages, 0, pages);

...in other words, check the value while it's stored in a 64-bit type,
before sending it down into a 32-bit API.

...other than that, everything else looks fine.

thanks,
-- 
John Hubbard
NVIDIA
