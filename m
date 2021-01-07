Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC442ECD62
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 10:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbhAGJ55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 04:57:57 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39325 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726526AbhAGJ55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 04:57:57 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id xS2WklxBVbMeAxS2ZkTBns; Thu, 07 Jan 2021 10:57:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610013434; bh=UkZt4ZTDGeg0fKPvr549uQpl0T9ACfldIpvW2nwLlL4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sczR6Ho2DTpCeVRJ2PJFdYtjgEotQQN7ONhgXz1Ns/hskhhmgdi6bhxPOZnOtNl8J
         6bqzApH2VcpwDe39wSL4IG3BQ6Y/pPSZRVc6k5sPauzJhvMGBkPUUZqwbG/NmCNXNL
         v8WO6ANACY2FuNM5KbRAokakHzC5njKqzLv6BjlucuL2FotDSktyuMpikO9eD5ROcF
         ZfeanecZwpGMIyOrptMMO0cAI7rDNu8RqCFg/N563gsVvlV/UWqZy2E080n/2hCKE0
         VJ9d3gCoHXlbei4Wlym1dVZn+CyzIDuUc8Pqll4ibPrQEwuQStZtnIPcuCF+lzihMV
         jE94RPC/FHYBw==
Subject: Re: [PATCH] media: v4l2: Fix memleak in videobuf_read_one
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michel Lespinasse <walken@google.com>,
        Ricardo Cerqueira <v4l@cerqueira.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210105075904.27102-1-dinghao.liu@zju.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <05d5b8b5-9758-17ea-4e54-3fe1a0ad2a09@xs4all.nl>
Date:   Thu, 7 Jan 2021 10:57:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105075904.27102-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOEyJtbzCDx5Fno2GXwtVahfGOJ5dUUtS9g8McySuH9nxPuGz6pu+3T9a+p5LAQ8benbOgzlmfMMikxQvhgJkmq0VLsKrJSq77sg6BbxyuYaTEkD5Lsm
 IuHLdFngNYEUBTQiDotlB3AniyBOhDNEszHeY5+L44+ki3JqTb3NBW5lBbIgCOoGOOZKO8jXlRrM7xylkc1oGEboYnK39v/0wqcx8hVhNJbraSwfWp7V5FBY
 rg03HffeNAdCmpy0BDb1kAEfWJYowTmihuYvGP1FO5t+qJuXRIDK76JsHPBnwRWRCrr2k7O0rgLKurCn77bdAuZ+mVXbPR2T4NcL+W5kQEb/g+gzyp6ILYpS
 PvDLnEv6W8TTNjBT88KElY3OrMLurYOzK/JB82ZSjnlFzk1PvbJNe3b4bVLgNzJx6g9OpNjvIzKpmRMBcUefQav1OI2ZPeK5uWFwu9VZjMJyToqGJ6npOfDc
 CIkUTQLnJ8MAmqzQmanP5gN2MRb2LrTDlSg0GA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/01/2021 08:59, Dinghao Liu wrote:
> When videobuf_waiton() fails, we should execute clean
> functions to prevent memleak. It's the same when
> __videobuf_copy_to_user() fails.
> 
> Fixes: 7a7d9a89d0307 ("V4L/DVB (6251): Replace video-buf to a more generic approach")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/v4l2-core/videobuf-core.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf-core.c b/drivers/media/v4l2-core/videobuf-core.c
> index 606a271bdd2d..0709b75d11cd 100644
> --- a/drivers/media/v4l2-core/videobuf-core.c
> +++ b/drivers/media/v4l2-core/videobuf-core.c
> @@ -924,8 +924,12 @@ ssize_t videobuf_read_one(struct videobuf_queue *q,
>  
>  	/* wait until capture is done */
>  	retval = videobuf_waiton(q, q->read_buf, nonblocking, 1);
> -	if (0 != retval)
> +	if (retval != 0) {
> +		q->ops->buf_release(q, q->read_buf);
> +		kfree(q->read_buf);
> +		q->read_buf = NULL;
>  		goto done;
> +	}

I'm fairly certain that this is wrong: if waiton returns an error, then
that means that the wait is either interrupted or that we are in non-blocking
mode and no buffer has arrived yet. In that case you just go to done since
there is nothing to clean up.

>  
>  	CALL(q, sync, q, q->read_buf);
>  
> @@ -940,8 +944,12 @@ ssize_t videobuf_read_one(struct videobuf_queue *q,
>  
>  	/* Copy to userspace */
>  	retval = __videobuf_copy_to_user(q, q->read_buf, data, count, nonblocking);
> -	if (retval < 0)
> +	if (retval < 0) {
> +		q->ops->buf_release(q, q->read_buf);
> +		kfree(q->read_buf);
> +		q->read_buf = NULL;
>  		goto done;

I'm not sure about this either: if userspace gave a crappy pointer and this
copy_to_user fails, then that doesn't mean you should release the buffer.
The next read() might have a valid pointer or, more likely, the application
exits or crashes and everything is cleaned up when the filehandle is closed.

> +	}
>  
>  	q->read_off += retval;
>  	if (q->read_off == q->read_buf->size) {
> 

Do you have actual proof that this is a memleak? I don't want to mess around
with the old videobuf unless you can show me that there is a real bug.

Regards,

	Hans
