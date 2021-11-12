Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F9944DED3
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 01:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhKLANn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 19:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhKLANm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 19:13:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CBCC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 16:10:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FF253E7;
        Fri, 12 Nov 2021 01:10:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636675849;
        bh=jOC16qgy1PAYZPUG1lPn68l6ngw3zxhYkPxvw4gmjIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SEQjD25pu2lPVbNcd6+fKs1EJIiHL9ikUMsclEzw+VdgKk22i4DBFWxVCCFjTbi9l
         cOTJdgwr0l5jJt+sGMzFxHottjcX4gFGhqeMgq84sgnldhwbMhaYsWRTmQjTYhg1b9
         5r6YNuZDd4qtg1IQbfTLPn5M7wfLfvrzRVP7bYwQ=
Date:   Fri, 12 Nov 2021 02:10:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        hverkuil@xs4all.nl, dafna3@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org
Subject: Re: [PATCH v2 2/2] media: videobuf2: add WARN_ON if bytesused is
 bigger than buffer length
Message-ID: <YY2w8+ljCzHS9VPT@pendragon.ideasonboard.com>
References: <20211111152640.1537-1-dafna.hirschfeld@collabora.com>
 <20211111152640.1537-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211111152640.1537-3-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Thu, Nov 11, 2021 at 05:26:40PM +0200, Dafna Hirschfeld wrote:
> In function vb2_set_plane_payload, report if the
> given bytesused is bigger than the buffer size,
> and clamp it to the buffer size.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/videobuf2-core.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 2467284e5f26..e06c190265f0 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1155,8 +1155,14 @@ static inline void *vb2_get_drv_priv(struct vb2_queue *q)
>  static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
>  				 unsigned int plane_no, unsigned long size)
>  {
> -	if (plane_no < vb->num_planes)
> +	/*
> +	 * size must never be larger than the buffer length, so
> +	 * warn and clamp to the buffer length if that's the case.
> +	 */
> +	if (plane_no < vb->num_planes) {
> +		WARN_ON_ONCE(size > vb->planes[plane_no].length);
>  		vb->planes[plane_no].bytesused = size;
> +	}
>  }
>  
>  /**

-- 
Regards,

Laurent Pinchart
