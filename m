Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC74E2A02ED
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgJ3Kc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:32:56 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57205 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725993AbgJ3Kcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:32:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YRhpknn8TWvjMYRhskH3V2; Fri, 30 Oct 2020 11:32:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604053948; bh=22JUqQBBILBmVwZwtLfugevAizud9zUlnOuqquupUA0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Lp62cjNZVJTNkCMmYDdeUOU7krPwfp3XoJAjuM6bzy+NJhH7FnE8AN8A0sw56+QXr
         YXWpwSii1ny+uDveJxDwjd6VfZNNo18MIKLwGG0LjzgN1GmRvBeV5s4ly7+S9JwLdI
         k0gZYNh9WYU65HKmINHZfqERBEthlMMd38GhsaVngM2j1Pg8iJys8TmNwxBTUOcYD+
         ffTDvgAPwsRGyXrNhgsoVgcFg+tJZooMF0U4U+rEwfKuJJhhUdXR8/AM4CdNTrqokL
         znqx3xgrd5Vwtl8bq7bOSD5pL3D3b8HCfDdLmsdSoBa/KzPxTVNb4bM7UeRIqvBy6M
         brKWdxGr2DClQ==
Subject: Re: [PATCH] media: v4l2-compat-ioctl32: check for max size
To:     Defang Bo <bodefang@126.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1603108489-4832-1-git-send-email-bodefang@126.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9a70ec34-95f3-c1f8-4002-a76b4836546a@xs4all.nl>
Date:   Fri, 30 Oct 2020 11:32:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1603108489-4832-1-git-send-email-bodefang@126.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNDpo6U0VcwkgfgVf1bGDnBfy0LMhP4pEAO9I9AmACO/skfw2ZxXfzcZI18QCoCSVO0nIZdzG8X2W31Az/7G7qN6T3LDdnLi1gOAQVu+rbpNmb1Tt/Ji
 +n3IRWTjaIgjbQOrhUNh//7E4MEIwMwGLtKbEQrNAQaoA/UzA2i53NQYjT9GdvXQnjdt9qlrOWJ3DFSyxVRLayA8Mbgkp6dXVYFrZxpm7EitIErZAURa3ub3
 F2MlKkDRN+Hc3TbhImbZgYIs2BCWWQNPG8bEPAWoDDWpPujq8AzsQxl9IOC01Z+WMpf8BcF6Kc2nnBjqljIDxw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/10/2020 13:54, Defang Bo wrote:
> Similar to commit<ea72fbf588ac>("media: v4l2-compat-ioctl32: prevent go past max size"} ,add max size check for count variable.
> 
> Signed-off-by: Defang Bo <bodefang@126.com>
> ---
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index a99e82e..5041d60 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -207,7 +207,7 @@ static int put_v4l2_window32(struct v4l2_window __user *p64,
>  	    get_user(clipcount, &p64->clipcount) ||
>  	    put_user(clipcount, &p32->clipcount))
>  		return -EFAULT;
> -	if (!clipcount)
> +	if (!clipcount || count > (U32_MAX/sizeof(*uclips)))

Clearly you didn't compile this since count should have been clipcount.

And in any case, this is bogus since get_v4l2_window32() already checks that
clipcount doesn't exceed 2048.

Regards,

	Hans

>  		return 0;
>  
>  	if (get_user(kclips, &p64->clips))
> 

