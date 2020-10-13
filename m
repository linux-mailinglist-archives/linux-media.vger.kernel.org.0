Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DCA28CECB
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 14:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgJMM4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 08:56:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56390 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728250AbgJMM4f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 08:56:35 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58104B87;
        Tue, 13 Oct 2020 14:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602593793;
        bh=JsHIX8K4CTToEPM3YZUlzdV0bl3F7oyrt7DppYkKxEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cooB+Sp/C2ZGuNjLrEj3rrfqabdOsbBkpQH8OgDu1alJIGOhelULV9fgexsGLPw1H
         0YhsBYuTIGH8e4E6GdciO3npqWcHk61t5KVHAAtTYmPfo0qoSXj4FKX5Co6oLXqLTi
         A+f2v9d2z8F8wF1sWZCLXLwjBfk1+HdT0fyO1drI=
Date:   Tue, 13 Oct 2020 15:55:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] ipu3-cio2: Check receved the size against payload
 size, not buffer size
Message-ID: <20201013125547.GC11939@pendragon.ideasonboard.com>
References: <20201013124143.12459-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201013124143.12459-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

s/receved the/the received/ in the subject line

On Tue, Oct 13, 2020 at 03:41:43PM +0300, Sakari Ailus wrote:
> Compare the received size of the payload size, not the allocated size of
> the buffer that is page aligned. This way also images that aren't aligned
> to page size are not warned about.
> 
> Also wrap a line over 80 characters.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 51c4dd6a8f9a..dffcc74acb7e 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -571,10 +571,11 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
>  			b->vbb.vb2_buf.timestamp = ns;
>  			b->vbb.field = V4L2_FIELD_NONE;
>  			b->vbb.sequence = atomic_read(&q->frame_sequence);
> -			if (b->vbb.vb2_buf.planes[0].length != bytes)
> -				dev_warn(dev, "buffer length is %d received %d\n",
> -					 b->vbb.vb2_buf.planes[0].length,
> -					 bytes);
> +			if (vb2_get_plane_payload(&b->vbb.vb2_buf, 0) != bytes)
> +				dev_warn(dev,
> +					 "payload length is %lu received %u\n",

Maybe ""payload length %lu != received %u\n" ? Or at least a comma after
%lu.

> +					 vb2_get_plane_payload(&b->vbb.vb2_buf,
> +							       0), bytes);

I would store vb2_get_plane_payload(&b->vbb.vb2_buf, 0) in a local
variable to make this look a bit nicer.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tests are ongoing.

>  			vb2_buffer_done(&b->vbb.vb2_buf, VB2_BUF_STATE_DONE);
>  		}
>  		atomic_inc(&q->frame_sequence);

-- 
Regards,

Laurent Pinchart
