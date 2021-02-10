Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B89316FDD
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbhBJTPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:15:53 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53842 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbhBJTPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:15:46 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l9ux6-0000pz-Tc; Wed, 10 Feb 2021 19:15:04 +0000
Subject: NAK: [PATCH][next] media: uvcvideo: remove duplicated dma_dev
 assignment
From:   Colin Ian King <colin.king@canonical.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210210174555.144128-1-colin.king@canonical.com>
Message-ID: <1d50eb5e-bed3-50dd-6eaf-b055e188dcf8@canonical.com>
Date:   Wed, 10 Feb 2021 19:15:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210174555.144128-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/02/2021 17:45, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to dma_dev has been performed twice in one
> statement. Fix this by removing the extraneous assignment.
> 
> Addresses-Coverity: ("Evaluation order violation")
> Fixes: fdcd02a641e2 ("media: uvcvideo: Use dma_alloc_noncontiguos API")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index dc81f9a86eca..edf451a956d8 100644
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
> 

there are some other occurrences of this, I'll send a V2.
