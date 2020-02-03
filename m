Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B0C15082A
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 15:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgBCOOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 09:14:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57630 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbgBCOOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 09:14:53 -0500
Received: from pendragon.ideasonboard.com (64.177-245-81.adsl-dyn.isp.belgacom.be [81.245.177.64])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57A0111FE;
        Mon,  3 Feb 2020 15:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1580739292;
        bh=zvvTfrQvlgQEUpFsSU5HLQAWdaAYVnrSrCFzT2y/4yc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pWk8qMTD81zmR2/8Oxo14Sss0SbVOlmnOMvhChjgpKMboRxaEHnlwTLpOSaDfnRNN
         Ada8ewwf1yHDypcExAPHsLBpxcna9sKvxWCL6y5lRNi6Eb/Z/5O1T2wks3JCQdvZmI
         KOBj7ODXZJE/pKeuAS7Xpp9oka/9WgTVDpKKbxjg=
Date:   Mon, 3 Feb 2020 16:14:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] gadget: uvc: rename VFL_TYPE_GRABBER to _VIDEO
Message-ID: <20200203141438.GB4722@pendragon.ideasonboard.com>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
 <20200203114119.1177490-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200203114119.1177490-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Feb 03, 2020 at 12:41:10PM +0100, Hans Verkuil wrote:
> 'GRABBER' is a weird name, all other types map to the /dev
> device names. Rename to 'VIDEO' to be consistent with the
> other types.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/f_uvc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index fb0a892687c0..0b9712616455 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -428,7 +428,7 @@ uvc_register_video(struct uvc_device *uvc)
>  
>  	video_set_drvdata(&uvc->vdev, uvc);
>  
> -	ret = video_register_device(&uvc->vdev, VFL_TYPE_GRABBER, -1);
> +	ret = video_register_device(&uvc->vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret < 0)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart
