Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7C72A1D81
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 12:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgKALEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 06:04:54 -0500
Received: from gofer.mess.org ([88.97.38.141]:53451 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgKALEx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 06:04:53 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 45DDAC63A4; Sun,  1 Nov 2020 11:04:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1604228692; bh=D5/AIwYi2iRE6p1FOb4Scp2Gxxq7ZdnLg7RG4L99rwE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pLYxql5qT1Gci2G5MNKD4CbGwCHMjNQt05a9JJEIC6ZlEwfu4vaZVKCNacn9lP3/G
         M7VIQUZpf9maDnhc607phaOR1ISzATOOkKozNc6e9VM01TgtQKOFtW0nL8RImkOxgA
         YOFUyHk2GNCt796itmnL2OU3/ZncPdUj4azDeyjerVwZAab841Gc7uDFYMSyKpqS+7
         NElvHDb97M8O9w+LrCZtyEvYuc0Gp6bOinI1Hsgue9Rt6sDmELe5v5C35WuJ/yqrQD
         Mr6o8w3SfYB8gkPEBqE0lhitXM855iaUD7X8+SGdgrJ8nr0vTsh18FrpA+ZSafbfaw
         i+eWIoKwSkoKA==
Date:   Sun, 1 Nov 2020 11:04:52 +0000
From:   Sean Young <sean@mess.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rc: validate that "rc_proto" is reasonable
Message-ID: <20201101110452.GA8281@gofer.mess.org>
References: <20201030115230.GF3251003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030115230.GF3251003@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Fri, Oct 30, 2020 at 02:52:30PM +0300, Dan Carpenter wrote:
> Smatch complains that "rc_proto" comes from the user and it can result
> in shift wrapping in ir_raw_encode_scancode()
> 
>     drivers/media/rc/rc-ir-raw.c:526 ir_raw_encode_scancode()
>     error: undefined (user controlled) shift '1 << protocol'
> 
> This is true, but I reviewed the surrounding code and it appears
> harmless.  Anyway, let's verify that "rc_proto" is valid as a kernel
> hardenning measure.

It would mean that suddenly an invalid rc proto could become valid; also
like you say, this is a good hardening measure.

Good catch, thank you.

Regards,

Sean

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/rc/lirc_dev.c | 3 ++-
>  include/uapi/linux/lirc.h   | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
> index f99d9dcae667..c1eb960adde3 100644
> --- a/include/uapi/linux/lirc.h
> +++ b/include/uapi/linux/lirc.h
> @@ -226,6 +226,7 @@ enum rc_proto {
>  	RC_PROTO_RCMM24		= 25,
>  	RC_PROTO_RCMM32		= 26,
>  	RC_PROTO_XBOX_DVD	= 27,
> +	RC_PROTO_MAX		= RC_PROTO_XBOX_DVD,
>  };
>  
>  #endif
> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> index 220363b9a868..116daf90c858 100644
> --- a/drivers/media/rc/lirc_dev.c
> +++ b/drivers/media/rc/lirc_dev.c
> @@ -263,7 +263,8 @@ static ssize_t lirc_transmit(struct file *file, const char __user *buf,
>  			goto out_unlock;
>  		}
>  
> -		if (scan.flags || scan.keycode || scan.timestamp) {
> +		if (scan.flags || scan.keycode || scan.timestamp ||
> +		    scan.rc_proto > RC_PROTO_MAX) {
>  			ret = -EINVAL;
>  			goto out_unlock;
>  		}
> -- 
> 2.28.0
