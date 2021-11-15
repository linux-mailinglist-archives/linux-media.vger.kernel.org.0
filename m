Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B0245072E
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236554AbhKOOkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236409AbhKOOjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:39:41 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81595C061746;
        Mon, 15 Nov 2021 06:36:44 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id md67mFcqefwDFmd6AmOnt4; Mon, 15 Nov 2021 15:36:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636987002; bh=Eq8jPtVL/oHYIw4ntcjM8qwwXXZSyrJg4HfNEOGCtGY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cLUOUeUp6+F8NNd028CZ2CSjVhGR2TxuUXlFX7BogUFRUdj4jVOmEHu/SwUjpkIRM
         e7uON3evraTJYhc+M8kavKvRy2yd3c7CW/P+ajSwpphXMCPKXTt/0axjs7VYCadlXn
         yqdRIgqG5iELvu4M3lsm6leHDg+6bdB5e1YVAQp0mbGUMt4oYRnKWAv3ZsbdDFn5kf
         aqykpPMDKkA0R1UBHcWCc9WgB0WcXGDgUbq8CDoGuwFo9fUG8OBYkfxy5oqh2BK5jG
         xEnzfzPtZVK51b27+DxEvV8HbgG4KpfHPGv2MvV6m7C1eyIqzIuxKkr1+9rVcj00ZN
         +Hw+m6XoA/J2Q==
Subject: Re: [PATCH 1/4] media: rcar-vin: Free buffers with error if hardware
 stop fails
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-2-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f6a00224-82b1-c506-2c1b-4ebb75657268@xs4all.nl>
Date:   Mon, 15 Nov 2021 15:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211108160220.767586-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBet5P8/Mr0cDaia8dBXLIl2AhlAPapHVtHoeN+q0zLtdHNaRhj8lzv4akkLd41L++PMWZISK0WlY0+jJImgmso38adL1562FHo2+rmV5p/pS/HeLaie
 enIAYoKStXBG+dFUXE9rfN6rrCbXQzpoS/sODqGEd6HgGU7UndRwpZDw+JdwgM2d7kdaNrSmQwGtE25OGx+wbDAA/3kq7XEm+0kYUkIV+rW/DWaj7YNDSlIv
 JjHvrYw44zKdo+AsrZBNsJKrthGcv7ECi6xeQlJGz+ZqFrGAEIJQh2vQw+j1JI9b7+wbjnxEg55acaEubfbcsw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/11/2021 17:02, Niklas Söderlund wrote:
> The driver already have logic to detect if it fails to stop properly and
> report this error to the user. The driver however did not report the
> unused buffers or buffers given to the hardware (if any) with an error,
> the buffers where instead returned to user-space in the active state.
> 
> Build on the existing detection of the error condition and correctly
> return the buffers with an error if it triggers.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 25ead9333d0046e7..79bb9081853f8781 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1371,6 +1371,16 @@ void rvin_stop_streaming(struct rvin_dev *vin)
>  
>  	spin_unlock_irqrestore(&vin->qlock, flags);
>  
> +	/* If something went wrong, free buffers with an error. */
> +	if (!buffersFreed) {
> +		return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> +		for (i = 0; i < HW_BUFFER_NUM; i++) {
> +			if (vin->buf_hw[i].buffer)
> +				vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> +						VB2_BUF_STATE_ERROR);
> +		}
> +	}
> +
>  	rvin_set_stream(vin, 0);
>  
>  	/* disable interrupts */
> 

I'll take this patch, but mark the other three as 'Changes Requested'.

Regards,

	Hans
