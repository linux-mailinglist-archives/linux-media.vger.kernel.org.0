Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A3833D65C
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 16:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbhCPPEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 11:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237675AbhCPPDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 11:03:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A82C06174A
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 08:03:46 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02CC98C8;
        Tue, 16 Mar 2021 16:03:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615907024;
        bh=Y5XDZwZVjldQ7Ot6EtDI/mwOfC2+GTnR+yFGOoNsI4Y=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=n/uwmz5NBdcibV4uxTL7g4e2IlmYoO9WW5rrK7aULLHqpyJNbXcJXz3yGWNEqxUK0
         yYP0Gq8f9bg4JIoA1bVxsKlKSqVk7ePT7HU3F9ovjyl/RnXUfs526f5+T455tJrYvr
         /SMQ1wxBgA523FvY1597PimzXTXI58SbKZ5dWSnY=
Subject: Re: [PATCH 03/13] ti-vpe/cal.h: fix kernel-doc formatting
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
 <20210311102022.96954-4-hverkuil-cisco@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <bb9e76ca-2b75-ed80-8bcc-d6d8451d1a58@ideasonboard.com>
Date:   Tue, 16 Mar 2021 17:03:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311102022.96954-4-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 12:20, Hans Verkuil wrote:
> Fix inline struct member documentation, was missing the
> '@memb:' prefix.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/media/platform/ti-vpe/cal.h | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index d471b7f82519..7aaea82c6b42 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -84,35 +84,34 @@ struct cal_buffer {
>   
>   /**
>    * struct cal_dmaqueue - Queue of DMA buffers
> - * @active: Buffer being DMA'ed to for the current frame
>    */
>   struct cal_dmaqueue {
>   	/**
> -	 * Protects all fields in the cal_dmaqueue.
> +	 * @lock: Protects all fields in the cal_dmaqueue.
>   	 */
>   	spinlock_t		lock;
>   
>   	/**
> -	 * Buffers queued to the driver and waiting for DMA processing.
> +	 * @queue: Buffers queued to the driver and waiting for DMA processing.
>   	 * Buffers are added to the list by the vb2 .buffer_queue() operation,
>   	 * and move to @pending when they are scheduled for the next frame.
>   	 */
>   	struct list_head	queue;
>   	/**
> -	 * Buffer provided to the hardware to DMA the next frame. Will move to
> -	 * @active at the end of the current frame.
> +	 * @pending: Buffer provided to the hardware to DMA the next frame.
> +	 * Will move to @active at the end of the current frame.
>   	 */
>   	struct cal_buffer	*pending;
>   	/**
> -	 * Buffer being DMA'ed to for the current frame. Will be retired and
> -	 * given back to vb2 at the end of the current frame if a @pending
> -	 * buffer has been scheduled to replace it.
> +	 * @active: Buffer being DMA'ed to for the current frame. Will be
> +	 * retired and given back to vb2 at the end of the current frame if
> +	 * a @pending buffer has been scheduled to replace it.
>   	 */
>   	struct cal_buffer	*active;
>   
> -	/** State of the DMA engine. */
> +	/** @state: State of the DMA engine. */
>   	enum cal_dma_state	state;
> -	/** Wait queue to signal a @state transition to CAL_DMA_STOPPED. */
> +	/** @wait: Wait queue to signal a @state transition to CAL_DMA_STOPPED. */
>   	struct wait_queue_head	wait;
>   };
>   
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
