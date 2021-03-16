Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018E233CEF1
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 08:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhCPH41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 03:56:27 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35003 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233309AbhCPHzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 03:55:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M4YOl0ROG4ywlM4YRlA9ne; Tue, 16 Mar 2021 08:55:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615881352; bh=e6dSmc5cY7MNxw5DiG0VryREIUrqYWT4z49jXGAeX8A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nOzFOBlNsx6WY2K3H2YLLhxLsk2dizvILysmC/cgo2fCY77ql+8sn6+UpUx+ibAI0
         Hx6xxW4lZ9LelvqeOYcusj/sDYgbvcZ4GhzHfu7PX1mXngB59arTKQpLs0FQt4Yb3z
         /onNUJT0gxbYtxdty6jXqnh33xCGVDT7O4vEaXY+8MgqekDPpYRvP2R5lq2yRFDBS/
         sECbSX4GYwq9F2djH7cxIWzJMPhuOQPhSJukzIFNwogkqMw0C3glocZ0C2+54Qs4aj
         hNn9jBoDuU6BIJyCsW7mh9MiUZa4ghKVwvHZ+1ypQd50ULtbolMDWZmUlh4buhWNHV
         gBug1Mi+di0LQ==
Subject: Re: [PATCH] media: em28xx: Fix missing check in em28xx_capture_start
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210310090032.13477-1-dinghao.liu@zju.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <74451231-31b9-4489-2241-febb05cf5bec@xs4all.nl>
Date:   Tue, 16 Mar 2021 08:55:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310090032.13477-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDpWzHC5/Ibk1hKry0XPpDPAkzfHnDxz69qxmi5oGgK+H/sWICHJxMv8p7mS/PaxfwNgHSPq63wqDnOETKPcLmN4RUHi3P76MvrnKkHnOF7V38SoaJ4H
 7mMHo7Xc2dV3oIy+vYQ5DRppWyqk7evbKb0kValSa3YgPbWjjLBejle1ST2I8BxxhFPMjgL2a8T3IqfQ63PGVfyPTAUIWtfeyOPnlBZGLFu88b6P7Spj4UlT
 fF79OQs8l8Z0Q/56LW8LGNbNcAB8dGDgDZ3gzrM8V0fRB8R/r6Y2m42OEKnousv1WvrCk+iJ6ScclfN4AewJbNChZKqYi3ZGrnr/rYPecIs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao Liu,

Thank you for the patch, but I've decided not to take it. While the
patch looks fine, it is not very useful since the return code of the
em28xx_capture_start() function is never checked. And I am hesitant
to change the behavior here in case it might break something subtle.

Ideally the error code of em28xx_capture_start() should also be
checked, and cascaded all the way up to the higher levels of the code,
but the reality is that if these register writes fail, then you likely
have much bigger problems so I don't think it is worth doing that.

Regards,

	Hans

On 10/03/2021 10:00, Dinghao Liu wrote:
> There are several em28xx_write_reg() and em28xx_write_reg_bits()
> calls that we have caught their return values but lack further
> handling. Check and return error on failure just like other calls
> in em28xx_capture_start().
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/usb/em28xx/em28xx-core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
> index 584fa400cd7d..2563275fec8e 100644
> --- a/drivers/media/usb/em28xx/em28xx-core.c
> +++ b/drivers/media/usb/em28xx/em28xx-core.c
> @@ -661,6 +661,8 @@ int em28xx_capture_start(struct em28xx *dev, int start)
>  						   EM2874_R5F_TS_ENABLE,
>  						   start ? EM2874_TS2_CAPTURE_ENABLE : 0x00,
>  						   EM2874_TS2_CAPTURE_ENABLE | EM2874_TS2_FILTER_ENABLE | EM2874_TS2_NULL_DISCARD);
> +		if (rc < 0)
> +			return rc;
>  	} else {
>  		/* FIXME: which is the best order? */
>  		/* video registers are sampled by VREF */
> @@ -670,8 +672,11 @@ int em28xx_capture_start(struct em28xx *dev, int start)
>  			return rc;
>  
>  		if (start) {
> -			if (dev->is_webcam)
> +			if (dev->is_webcam) {
>  				rc = em28xx_write_reg(dev, 0x13, 0x0c);
> +				if (rc < 0)
> +					return rc;
> +			}
>  
>  			/* Enable video capture */
>  			rc = em28xx_write_reg(dev, 0x48, 0x00);
> @@ -693,6 +698,8 @@ int em28xx_capture_start(struct em28xx *dev, int start)
>  		} else {
>  			/* disable video capture */
>  			rc = em28xx_write_reg(dev, EM28XX_R12_VINENABLE, 0x27);
> +			if (rc < 0)
> +				return rc;
>  		}
>  	}
>  
> 

