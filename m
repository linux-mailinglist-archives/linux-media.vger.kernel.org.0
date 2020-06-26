Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7912620B3B1
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbgFZOhA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:37:00 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58965 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725970AbgFZOg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:36:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id opTIjNoEl0MRaopTMjNIdm; Fri, 26 Jun 2020 16:36:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593182218; bh=eEXatkmLWv6Cn91mrDmo2zkvbJBl1/6cb6rg4xzWyxc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UhLStb8BHj9s4skZajutHeZlGXrISp1NAUJlOJ0QlCYjg8FM42BsrAWI6DD3sJ7+s
         6nrsVLgBsBz/WvyVrNn8f6Dg5skqIb+hvFl8tt74eOXuBgyxssCJFndWNvrRJSUxTv
         9Z0KkptYCbJ/LLrjuIKMflk4aLroF9gVG0VQRXGHDNUEfJJ+AgdIa2bBNnZEBqGllt
         CTsrwSTFPYVvMvm28JxMv8xJPAUn4t4OLHNY+htFw4Ily8GK/Ul1/BGqz+s6iEqdBH
         YJT6v2sVC7D0e72gUzuwbYyBUGZPOQD9qtjEIKvTq7ugP3WK+oA4h48gpa78KC/1fZ
         IwYD7zwiHfIMA==
Subject: Re: [PATCH] staging: media: usbvision: removing prohibited space
 before ',' (ctx:WxW)
To:     B K Karthik <bkkarthik@pesu.pes.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20200626143205.xns6nwggskssujao@pesu-pes-edu>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a9efda13-4425-8cb0-5854-8421f6c14181@xs4all.nl>
Date:   Fri, 26 Jun 2020 16:36:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626143205.xns6nwggskssujao@pesu-pes-edu>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIABrg0rj/3IAf1UbDBBrjdwQxRn5BzdsdIYziZ7B2iCppG1JK7WTE2dwMLgs6AthjTJuuryUrWsqyuLryCpWLJiBEWKLnXOIfa96vYuN/vdQ1qrJb94
 7QMhRe8YNRjJim+NhxI7F8PYFpoyfXFJDgaj7luf2EBe4yxG3UPahJVsCZvRHO5GgjdFLgLn3KetegxEK/SligwOdJWMiLqVS4wFDvuZ30PO3501NkQJK+0m
 GVyaejVoBvEsGEFuGZqQEkfcJdPhup497w1bdfT7JPjesuhlV4b3aFsUqehaczLBGBk2GRN/u99RtzodAKduQPyp4OXaBQe36u9Twjav0l/Q7OCiPweoux4o
 whRWnkeo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/06/2020 16:32, B K Karthik wrote:
> fixing ERROR: space prohibited before that ',' (ctx:WxW)
> 
> Signed-off-by: B K Karthik <karthik.bk2000@live.com>

usbvision is another driver that is scheduled for removal by the end of the year,
so I won't apply this patch.

> ---
>  drivers/staging/media/usbvision/usbvision-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/usbvision/usbvision-i2c.c b/drivers/staging/media/usbvision/usbvision-i2c.c
> index 6e4df3335b1b..010ad03c6ec1 100644
> --- a/drivers/staging/media/usbvision/usbvision-i2c.c
> +++ b/drivers/staging/media/usbvision/usbvision-i2c.c
> @@ -32,7 +32,7 @@ MODULE_PARM_DESC(i2c_debug, "enable debug messages [i2c]");
>  #define PDEBUG(level, fmt, args...) { \
>  		if (i2c_debug & (level)) \
>  			printk(KERN_INFO KBUILD_MODNAME ":[%s:%d] " fmt, \
> -				__func__, __LINE__ , ## args); \
> +				__func__, __LINE__, ## args); \

Actually, older (buggy) gcc compiler needed a space there, if memory serves.

Regards,

	Hans

>  	}
>  
>  static int usbvision_i2c_write(struct usb_usbvision *usbvision, unsigned char addr, char *buf,
> 

