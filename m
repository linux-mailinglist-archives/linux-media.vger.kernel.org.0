Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F63C388C3
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 13:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbfFGLQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 07:16:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35758 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfFGLQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 07:16:51 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 383CC334;
        Fri,  7 Jun 2019 13:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559906209;
        bh=Oav2Ee+8S3Ea3gFLUPoVQRmH6VnquRMMcKEh98Q9GyQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IfH2t5AcyRb3tcnAPPwmIpfEnW4rKGDgctXH7g9hpLC6r8j/Jc+uAAbg5RIAQyZF8
         hHy39qRffuFDmodTtrhumLWKjUyrr5DTB+cXDakr8va+dW+h3n53wPSJxJegz0hkEc
         8sCQsoZkdBpq695vZGqblWLOKpKgSoQBf3zKVIPM=
Date:   Fri, 7 Jun 2019 14:16:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
Message-ID: <20190607111634.GA7593@pendragon.ideasonboard.com>
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
> The __prepare_userptr() function made the incorrect assumption that if the
> same user pointer was used as the last one for which memory was acquired, then
> there was no need to re-acquire the memory. This assumption was never properly
> tested, and after doing that it became clear that this was in fact wrong.

Could you explain in the commit message why the assumption is not
correct ?

> Change the behavior to always reacquire memory.

One more reason to not use USERPTR :-)

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Tomasz Figa <tfiga@chromium.org>
> Cc: <stable@vger.kernel.org>      # for v5.1 and up
> ---
> This should be backported to all stable kernels, unfortunately this patch only
> applies cleanly to 5.1, so this has to be backported manually.
> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4489744fbbd9..a6400391117f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1013,7 +1013,7 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>  	void *mem_priv;
>  	unsigned int plane;
>  	int ret = 0;
> -	bool reacquired = vb->planes[0].mem_priv == NULL;
> +	bool called_cleanup = false;
> 
>  	memset(planes, 0, sizeof(planes[0]) * vb->num_planes);
>  	/* Copy relevant information provided by the userspace */
> @@ -1023,15 +1023,6 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>  		return ret;
> 
>  	for (plane = 0; plane < vb->num_planes; ++plane) {
> -		/* Skip the plane if already verified */
> -		if (vb->planes[plane].m.userptr &&
> -			vb->planes[plane].m.userptr == planes[plane].m.userptr
> -			&& vb->planes[plane].length == planes[plane].length)
> -			continue;
> -
> -		dprintk(3, "userspace address for plane %d changed, reacquiring memory\n",
> -			plane);
> -
>  		/* Check if the provided plane buffer is large enough */
>  		if (planes[plane].length < vb->planes[plane].min_length) {
>  			dprintk(1, "provided buffer size %u is less than setup size %u for plane %d\n",
> @@ -1044,8 +1035,8 @@ static int __prepare_userptr(struct vb2_buffer *vb)
> 
>  		/* Release previously acquired memory if present */
>  		if (vb->planes[plane].mem_priv) {
> -			if (!reacquired) {
> -				reacquired = true;
> +			if (!called_cleanup) {
> +				called_cleanup = true;
>  				vb->copied_timestamp = 0;
>  				call_void_vb_qop(vb, buf_cleanup, vb);
>  			}

Could we do this unconditionally before the loop ?

> @@ -1083,17 +1074,14 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>  		vb->planes[plane].data_offset = planes[plane].data_offset;
>  	}
> 
> -	if (reacquired) {
> -		/*
> -		 * One or more planes changed, so we must call buf_init to do
> -		 * the driver-specific initialization on the newly acquired
> -		 * buffer, if provided.
> -		 */
> -		ret = call_vb_qop(vb, buf_init, vb);
> -		if (ret) {
> -			dprintk(1, "buffer initialization failed\n");
> -			goto err;
> -		}
> +	/*
> +	 * Call buf_init to do the driver-specific initialization on
> +	 * the newly acquired buffer.
> +	 */
> +	ret = call_vb_qop(vb, buf_init, vb);
> +	if (ret) {
> +		dprintk(1, "buffer initialization failed\n");
> +		goto err;
>  	}
> 
>  	ret = call_vb_qop(vb, buf_prepare, vb);

-- 
Regards,

Laurent Pinchart
