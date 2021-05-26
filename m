Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80599391480
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 12:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbhEZKKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 06:10:21 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34415 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233730AbhEZKKU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 06:10:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id lqSvlSZDFWkKblqSylCbTZ; Wed, 26 May 2021 12:08:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622023724; bh=BzmVFHMSQuu3AG7hFRs0XESZaEsUHE9O1y4qz6Gi6Ik=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BcMPltnApAGxzCWLNrQEX1oGsal0xKYVvxe/C7G+bVSKZeZntrbB0pjZRKtiybj+G
         5oN4F/I4V1flABrhpyXzk26EfJ1Q8RcWgCmK7scc5uYgv8txHn2b+xMo6j6K5/v6AB
         7eJO8mx8BWzB/rSX3c3QTxgVlPg+zrfHdhHKVhio7OWRLj7nzEDl4ndiW4gl2mIivO
         om0+pBx9sVFNW1KVLpBo7rpk4tBdwn++/qm0GPENPhTEzEGWbcYmI/QzFgf7VRxx0B
         AK/AFfhF/fIYmHUnqti0QgEF4kY/+trTPJjD0kmQu4NB1BJyLJDKh79LT9PjQ/1VOO
         P9r2pV/vAXHyQ==
Subject: Re: [PATCH -next] [media] media: Replaced simple_strtol() with
 kstrtoint()
To:     Liu Shixin <liushixin2@huawei.com>, Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210524120836.1580468-1-liushixin2@huawei.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9d949d86-d8d0-7094-c13b-a0ed03ceaef7@xs4all.nl>
Date:   Wed, 26 May 2021 12:08:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210524120836.1580468-1-liushixin2@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfISORGEzTdymqwJW0pSInJkxpOAmpZaB2TQD2YgT1vs1RzXSzw1icwufkktModJXqJMKESSl+yrD3gLpGLcdBmMvtrtwhfo6cAgxmMGiatyz3ZtKzgGe
 Zs/knQUdjk3WlQSULGiiahHBQHpxjXkOiaCMaZji72fG9WJr7O+gm6xp0Tg2L72XpG+yVgpNGUGybhVnYJAEqSP3SO03FbCzkjFbFNoTvsZ6XFkbmiosHi7X
 UmjZyp2/w0qF5vCgKiqQ73iBV7hRD8Ox8itgm0J1M4ALYN4JpwEPYkD1hoZvhbHCZT0ds4QULzhLPyg3kyTALZuUkezSWwlLcKr58tZLNBo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/05/2021 14:08, Liu Shixin wrote:
> It looks like that memcpy() is a superfluous operation in
> parse_token()/parse_mtoken(). Simple these two functions and
> use kstrtoint() instead of simple_strtol() to avoid data
> overflow.

Always mention which driver you are changing in the subject line.
Just saying 'media:' suggests a subsystem-wide patch, but this is
just for a single driver.

Regards,

	Hans

> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-ctrl.c | 25 ++----------------------
>  1 file changed, 2 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> index 9f71d8c2a3c6..8ae3ad80cccb 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> @@ -355,11 +355,8 @@ static int parse_token(const char *ptr,unsigned int len,
>  		       int *valptr,
>  		       const char * const *names, unsigned int namecnt)
>  {
> -	char buf[33];
>  	unsigned int slen;
>  	unsigned int idx;
> -	int negfl;
> -	char *p2;
>  	*valptr = 0;
>  	if (!names) namecnt = 0;
>  	for (idx = 0; idx < namecnt; idx++) {
> @@ -370,18 +367,7 @@ static int parse_token(const char *ptr,unsigned int len,
>  		*valptr = idx;
>  		return 0;
>  	}
> -	negfl = 0;
> -	if ((*ptr == '-') || (*ptr == '+')) {
> -		negfl = (*ptr == '-');
> -		ptr++; len--;
> -	}
> -	if (len >= sizeof(buf)) return -EINVAL;
> -	memcpy(buf,ptr,len);
> -	buf[len] = 0;
> -	*valptr = simple_strtol(buf,&p2,0);
> -	if (negfl) *valptr = -(*valptr);
> -	if (*p2) return -EINVAL;
> -	return 1;
> +	return kstrtoint(ptr, 0, valptr) ? -EINVAL : 1;
>  }
>  
>  
> @@ -389,10 +375,8 @@ static int parse_mtoken(const char *ptr,unsigned int len,
>  			int *valptr,
>  			const char **names,int valid_bits)
>  {
> -	char buf[33];
>  	unsigned int slen;
>  	unsigned int idx;
> -	char *p2;
>  	int msk;
>  	*valptr = 0;
>  	for (idx = 0, msk = 1; valid_bits; idx++, msk <<= 1) {
> @@ -405,12 +389,7 @@ static int parse_mtoken(const char *ptr,unsigned int len,
>  		*valptr = msk;
>  		return 0;
>  	}
> -	if (len >= sizeof(buf)) return -EINVAL;
> -	memcpy(buf,ptr,len);
> -	buf[len] = 0;
> -	*valptr = simple_strtol(buf,&p2,0);
> -	if (*p2) return -EINVAL;
> -	return 0;
> +	return kstrtoint(ptr, 0, valptr);
>  }
>  
>  
> 

