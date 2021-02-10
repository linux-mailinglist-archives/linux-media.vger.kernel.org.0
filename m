Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EB4317499
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 00:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhBJXnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 18:43:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41978 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233955AbhBJXnN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 18:43:13 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEDE845E;
        Thu, 11 Feb 2021 00:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613000551;
        bh=F8M0gSMAeLtKdCNlwOMgSLqVGq6ljgVV0EdOao2CbA4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHEDF/gWuFQk613AydGAp8/l+kl3EA6POw91pmmG940EsWRyCxOFrP/IBw8KThqw7
         cmm1Vn7RxICJmf/M04QJq8Q0Klzvl+Ku9eK9JXtz1RdNBQ74OPeYIsFRWAJK5cCBtI
         oAC2WUrq5YC4zfQG/8RXb0gMvFle3DYNbtCQMcB4=
Date:   Thu, 11 Feb 2021 01:42:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2][next] media: uvcvideo: Remove duplicate assignments
 to pointer dma_dev
Message-ID: <YCRvTzUhnACWcNPT@pendragon.ideasonboard.com>
References: <20210210210149.GA842694@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210210149.GA842694@embeddedor>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gustavo,

Thank you for the patch.

On Wed, Feb 10, 2021 at 03:01:49PM -0600, Gustavo A. R. Silva wrote:
> Remove redundant assignments to pointer dma_dev.
> 
> Fixes: fdcd02a641e2 ("media: uvcvideo: Use dma_alloc_noncontiguos API")
> Addresses-Coverity-ID: 1501703 ("Evaluation order violation")
> Addresses-Coverity-ID: 1501692 ("Evaluation order violation")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Colin King has already submitted the same patch ("[PATCH][next][V2]
media: uvcvideo: remove duplicated dma_dev assignments"). As they're
identical, I can only decide to use the first patch that reached my
mailbox.

> ---
> Changes in v2:
>  - Remove another redundant assignment in function
>    uvc_free_urb_buffers().
> 
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
