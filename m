Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE056360AF5
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbhDONrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:47:13 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37831 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233201AbhDONrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:47:11 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id X2KRl3hIesMyaX2KVlUMzy; Thu, 15 Apr 2021 15:46:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618494407; bh=IM3aW5zjgLQE5uu1MmTY+ctBcf9hHHoZ4V5t9VLSGzQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PdN/MywbFkH1vwzigyckJZlKnF5S5F3CFmv7e6+fy43Cko9IuMoBoa48u8OziaC+H
         9oHWlXslcnhMRjbO6XLc+xPfU4UobtFcaZv3fR9mFntJoSSsZfhKYWhk9XGohydcXX
         C7VTdI2hAYE9MfS3wfFMLvLCEo89eyhXdzFy/bxfTcP1+nlZrUjWDEEmjfG8ZZCdH5
         AStGIfW/ADPVmaBMO25YFvsDCZArRoN2ltdgeyz65rPVnVoZn/1Udi9MKP1vmbRQGy
         dEyWcZGpAbne+aI+aTKxRaFTySnXUCEIVWURyftcely0a4j7KL5CLi/z01+XdR3vtW
         ZkREh7FyQii+g==
Subject: Re: [PATCH] staging: media: atomisp: [1/2] Remove redundant
 assertions in sh_css.c
To:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210415005106.530914-1-vrzh@vrzh.net>
 <20210415005106.530914-9-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <50b4d5c9-3f72-3f8a-cee7-61451ab7f5a5@xs4all.nl>
Date:   Thu, 15 Apr 2021 15:46:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415005106.530914-9-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCzH6Ggt6pZ0LgPU3GrTcHl+h9ayRhhqGZ2gqbrdS85URiRA+VB2rPPuwDyAh7FxACe5/Jz0w83Cb9shZ3pa/DqE4FXuT5yroCIAmzr8dvCe4kKh6EUI
 JIHjrA/iPReJxzrfosVFP+tiIMXsZrFcq8bALVBT18CL1r7RPqLAbzbCEAXtjNjRCqcG419SJyLqIdQ/1OffMgTUSlvoVdSCEhGGxDuByuVR8r0WKVuNcxSO
 BTu5KtPFUG+l3QyW04E0PgMJ78w2GpzorKLc5W5VF0t+sWynPjldI34NDy0MDA4x
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/04/2021 02:51, Martiros Shakhzadyan wrote:
> Remove assert() in places where the condition is already handled.
> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 4e3ef68014ec..aebecf650967 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -413,7 +413,6 @@ aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
>  static void
>  sh_css_pipe_free_shading_table(struct ia_css_pipe *pipe)
>  {
> -	assert(pipe);
>  	if (!pipe) {
>  		IA_CSS_ERROR("NULL input parameter");
>  		return;
> @@ -1080,7 +1079,6 @@ sh_css_config_input_network(struct ia_css_stream *stream)
>  		}
>  	}
>  
> -	assert(pipe);
>  	if (!pipe)
>  		return -EINVAL;
>  
> @@ -1382,10 +1380,11 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
>  		 struct ia_css_frame *out_frame)
>  {
>  	(void)out_frame;
> -	assert(pipe);
> -	assert(pipe->stream);
>  
> -	if ((!pipe) || (!pipe->stream))
> +	if (!pipe)
> +		return -EINVAL;
> +
> +	if (!pipe->stream)
>  		return -EINVAL;

Why was this 'if' rewritten? What was wrong with the original?

Also, this change has nothing to do with the removal of assert(), so
that makes me suspect that this change wasn't intended by you.

Regards,

	Hans

>  
>  #if !defined(ISP2401)
> 

