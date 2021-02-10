Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE33D3174B6
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 00:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhBJXuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 18:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233949AbhBJXuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 18:50:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E4CC06174A;
        Wed, 10 Feb 2021 15:49:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D12445E;
        Thu, 11 Feb 2021 00:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613000973;
        bh=MlMMJDIllbHroxxS5PfHR4lyjqzjRXrCAXqI9l8C7fE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rZwSw4cSoEsy8CtGOULfWaKylP5BwxwR1DoMe36vp980q3gv8FzRClqvyZWItWla4
         gNPJLqNXTOZ9XtCoBZ2XOkvKiiVY3Df/cKvMz4rRGdzVZTtbRmHszL2jL6//LiSBaA
         2+80mvrDVUH3bYkoIOJWK2+ujD5iFmenHJppAhBA=
Date:   Thu, 11 Feb 2021 01:49:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH][next][V2] media: uvcvideo: remove duplicated dma_dev
 assignments
Message-ID: <YCRw9YRQSbC7FmjV@pendragon.ideasonboard.com>
References: <20210210191942.147083-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210191942.147083-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Colin,

(CC'ing Christoph)

Thank you for the patch.

On Wed, Feb 10, 2021 at 07:19:42PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to dma_dev has been performed twice in one
> statement. Fix this by removing the extraneous assignment.
> 
> Addresses-Coverity: ("Evaluation order violation")
> Fixes: fdcd02a641e2 ("media: uvcvideo: Use dma_alloc_noncontiguos API")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

The fix looks good to me,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

As I wasn't CC'ed on the offending patch, and given that it didn't get
merged through the linux-media tree and isn't in the linux-media master
branch, I'll let Ricardo and Christoph deal with the fallout for
linux-next.

> ---
> 
> V2:  Fix 2nd occurrence of this same issue.
> 
> ---
>  drivers/media/usb/uvc/uvc_video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index dc81f9a86eca..6f2f308d86fe 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1105,7 +1105,7 @@ static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
>  
>  static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
>  {
> -	struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
> +	struct device *dma_dev = stream_to_dmadev(uvc_urb->stream);
>  
>  	if (for_device) {
>  		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
> @@ -1586,7 +1586,7 @@ static void uvc_video_complete(struct urb *urb)
>   */
>  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  {
> -	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
> +	struct device *dma_dev = stream_to_dmadev(stream);
>  	struct uvc_urb *uvc_urb;
>  
>  	for_each_uvc_urb(uvc_urb, stream) {

-- 
Regards,

Laurent Pinchart
