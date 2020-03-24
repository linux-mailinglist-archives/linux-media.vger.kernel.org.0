Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2195F191B5A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 21:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgCXUqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 16:46:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58504 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728299AbgCXUqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 16:46:20 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F7A52D2;
        Tue, 24 Mar 2020 21:46:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585082778;
        bh=U0n7oZ9KuKIc+UfH46Id9kcgZ5vT9XPc8ip+OnadaMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Khq6yQR4I9DlbU3B0OrA/h+4+uLAPoOCCu8DNit6P8OxUQBtEnKYl9VGpagEPjen8
         YMfjMlq9uYEVBRtSbyk9UM9I7uc3yUvq2pOgx38PkJx46Y7KaAk1guzoyvHsgHzXby
         51YvVcaCno2mKZLB+sU6P/9YVmOgONkUwM0P0wKo=
Date:   Tue, 24 Mar 2020 22:46:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [libcamera-devel] [PATCH 4/4] media: bcm2835: Fix trivial
 whitespace error
Message-ID: <20200324204616.GD20997@pendragon.ideasonboard.com>
References: <20200324202844.1518292-1-jacopo@jmondi.org>
 <20200324202844.1518292-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200324202844.1518292-5-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Mar 24, 2020 at 09:28:44PM +0100, Jacopo Mondi wrote:
> Cosmetic change only.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/bcm2835/bcm2835-unicam.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/bcm2835/bcm2835-unicam.c b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> index 5001976dcebc..65534a18d3d4 100644
> --- a/drivers/media/platform/bcm2835/bcm2835-unicam.c
> +++ b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> @@ -2462,7 +2462,7 @@ static int unicam_set_ctrl(struct v4l2_ctrl *ctrl)
>  		/* Change the number of frames of delay we believe there
>  		 * to be between updating analogue gain and it taking effect.
>  		 */
> -		return unicam_update_delay(unicam, 
> +		return unicam_update_delay(unicam,
>  			V4L2_CID_ANALOGUE_GAIN, ctrl->val);

While at it, write it

		return unicam_update_delay(unicam, V4L2_CID_ANALOGUE_GAIN,
					   ctrl->val);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	default:

-- 
Regards,

Laurent Pinchart
