Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242FB44BD78
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 09:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhKJJBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 04:01:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhKJJAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 04:00:55 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17438C061764
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 00:58:07 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kjQgmljixfwDFkjQjmFMMr; Wed, 10 Nov 2021 09:58:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636534686; bh=PKQXvNvbbaVBkRk7DfB1GPKuWmkG/6IrMzr54x/D+T8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Qv9gsPq+p8K49IxxBig9+a4rOg9EdO45UMydYY8bmgm/lTQwcA8pO+bksdJGhPtIX
         4FY8RJdVkH9ObIoyXFIWLcD8J5DuaFLM61wWJ5qpVEFzqKe6HbuN+zs3ZhF/aMDwnp
         a658EioKtSBETHMYP4tWPWKq1XuXuro8Wq1+4DutJsQ0BoxIhRNyJn5017i0rXAVU2
         Pl89VYEIB/al5HPa2lvBedn1rBQoqMFg316YUCtTrqbsqFVdWGYmZKx9mOwffwUdOB
         M7+54IKBFN2AdN1t/r8VzZA7vOrXf0IiO1w30gJoNGdvZEmx/1rkLC8BmfZ1aPSAij
         fxjsOMC4Vd6Ww==
Subject: Re: [PATCH 2/2] media: videobuf2: add WARN_ON if bytesused is bigger
 than buffer length
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20211108193933.20369-1-dafna.hirschfeld@collabora.com>
 <20211108193933.20369-3-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5efc3d13-9d25-d0ce-98c8-fe1563dd91e9@xs4all.nl>
Date:   Wed, 10 Nov 2021 09:58:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211108193933.20369-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGmv+V8qz23lPe5LT1SbTxvQ3Q7StkJAbnmMUMQPOlKLWOxlUk1l6zAcmYziKx8CL564HS7POhBO1KmCypG/HHiID8LsxVlFnLLR2oDEmhecI2Aj5y8/
 ScjC0xQL0zudqnFi3q/NrgVuzJWl06DOiAwGMmoN8hI6xQMY7OKjKTviJET+jFHkO2r/V3Ef2ETVn7SS+ciIFW7Ls3cstne0l/Zao+fh3iJSn1QOM9vjBqqo
 DECMDAJWHQDKnhBoR0JplAZejV+q1YEvc+PohEoVSvGfQy1dj1OQKyZ6BGP0QI0DQt9MqgPKCUGES0zoFLxovKggbUJBYK+62GSSROdJH5NVS+2xFnm/ReFd
 uiu5285piyOCtzp296j57SP2WLCQIUMMOVMG0n9VtpZzoZGU9A3rIHy1PdNKSfbgIKHIfcNI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/11/2021 20:39, Dafna Hirschfeld wrote:
> In function vb2_set_plane_payload, report if the
> given bytesused is bigger than the buffer size.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  include/media/videobuf2-core.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 2467284e5f26..ffaa1f3361c3 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1155,8 +1155,10 @@ static inline void *vb2_get_drv_priv(struct vb2_queue *q)
>  static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
>  				 unsigned int plane_no, unsigned long size)
>  {
> -	if (plane_no < vb->num_planes)
> +	if (plane_no < vb->num_planes) {
> +		WARN_ON(size > vb->planes[plane_no].length);

I would change this to:

		/*
		 * size must never be larger than the buffer length, so
		 * warn and clamp to the buffer length if that's the case.
		 */
		if (WARN_ON(size > vb->planes[plane_no].length))
			size = vb->planes[plane_no].length;

Regards,

	Hans

>  		vb->planes[plane_no].bytesused = size;
> +	}
>  }
>  
>  /**
> 

