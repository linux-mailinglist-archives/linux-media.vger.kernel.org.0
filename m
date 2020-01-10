Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63BA2136EE6
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 15:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgAJOCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 09:02:39 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35785 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726387AbgAJOCj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 09:02:39 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id purwinOkQpLtbpus0iQvrw; Fri, 10 Jan 2020 15:02:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578664956; bh=VVIn4iry47Jpvgv8H1hmbyM1b1uHVUSYE08HMtEJCbc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qGt/wPxEikTXUPu/DWVC2vh3R6guMtpqM1YW7HsYabXxWYJURJRuo/Owt3e27lY5D
         ZIZloP4W7KGH8cCS0CdSG/gbKMI4UXWFMM6xtMNmx+G9C11FB9JqL5+yyaaGMp6q6D
         LTGY0AHEa5zoebRPH+F3AMRwRElEH8A5W24bTIWlJqm+Gwfv++rClhBSCKnI11+Pil
         l9g8Le6m4caBZVb2gXFZnnKVN0sNHNVkQc1r+kOD7QBtYBW5bvwcoVREYIrwRPSqjs
         PFVmdxei/Ml0H/l7yPy1CMkrgmN6EPWiLDZ86ipYr1Bc3bt7+O2DN1DbpJdqaoI+wT
         WL7bzpDdHQ+9A==
Subject: Re: [PATCH] media: cpia2: Fix integer overflow in mmap handling
To:     Takashi Iwai <tiwai@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200108161619.7999-1-tiwai@suse.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7d972b26-fea6-db75-ff07-c5bfaf98e5d2@xs4all.nl>
Date:   Fri, 10 Jan 2020 15:02:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200108161619.7999-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDBQkJJ9iIcJD4eEM1ruLtLXZR4r/wtJ/lsrEt6VGXKUpRvNjMDG3Zs+OC9CRT81+Atip0J3dslhNKMXF1LOdlrz+ipNRMCN75Vfkw8wnmfZLJVvEl3i
 N+7TMsF58CFu4qDnB1GF4N9gVQQ4oXWii7PUDsNphSuW65IGtXU6oim+U+Lqi/NF9fnF8HlGGxS0yLY7jt/6WdEY1oomqLq/e6R9TTTwenUq8OfAxAv4j4tp
 OuaxH9VfLfnzpmOX9R4GEdOu3Lh9hHmUpXMBTSceNMref5uE/Ouu2B0A+apAomddClBBJ0T6aZvsMdJfiNC0RrBmraJgYzRaTB+DGySYb9z++WccnbI3ATpL
 UZeps93qeCbQfLTK2vzILV9FS99SHQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Takashi,

On 1/8/20 5:16 PM, Takashi Iwai wrote:
> The offset and size checks in cpia2_regmap_buffer() may ignore the
> integer overflow and allow local users to obtain the access to the
> kernel physical pages.
> 
> Fix it by modifying the check more carefully; the size value is
> already checked beforehand and guaranteed to be smaller than
> cam->frame_size*num_frames, so it's safe to subtract in the right
> hand side.
> 
> This covers CVE-2019-18675.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> 
> I'm submitting this since there hasn't been any action seen for this
> bug over a month.  Let me know if there is already a fix.  Thanks.

Read the full mail thread for the original patches:

https://patchwork.linuxtv.org/patch/60602/
https://patchwork.linuxtv.org/patch/59978/

The second has the reference to the kernel core mmap commit that prevents this
from being exploited.

Rejecting this patch for that reason.

Since this is the third time this patch pops up, I am wondering if I shouldn't
accept it anyway just to stop this. But then I want a better commit log that
points to the core commit as the *real* fix.

There is nothing wrong as such with this patch, so if someone cares to post
a new version that refers to the core commit, I'll likely accept it.

Regards,

	Hans

> 
> 
>  drivers/media/usb/cpia2/cpia2_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/media/usb/cpia2/cpia2_core.c
> index 20c50c2d042e..26ae7a5e3783 100644
> --- a/drivers/media/usb/cpia2/cpia2_core.c
> +++ b/drivers/media/usb/cpia2/cpia2_core.c
> @@ -2401,7 +2401,7 @@ int cpia2_remap_buffer(struct camera_data *cam, struct vm_area_struct *vma)
>  
>  	if (size > cam->frame_size*cam->num_frames  ||
>  	    (start_offset % cam->frame_size) != 0 ||
> -	    (start_offset+size > cam->frame_size*cam->num_frames))
> +	    (start_offset > cam->frame_size*cam->num_frames - size))
>  		return -EINVAL;
>  
>  	pos = ((unsigned long) (cam->frame_buffer)) + start_offset;
> 

