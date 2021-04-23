Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2364368F4E
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 11:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhDWJ1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 05:27:05 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:50561 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229939AbhDWJ1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 05:27:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Zs4ul03T4vTEDZs4xlcnlH; Fri, 23 Apr 2021 11:26:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619169988; bh=AuuNHKEQlnVecykRj2Q/6f+tcDmXmU5mEcTJtFxhua8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=shZz0qjoAREnVCRO+bBnDP6G8UBsQaj9tdq5wS+DIerET9nK6TtymoMSaAHRiLocy
         bCu5sUpIpL8CySdMy8ReYCyBlsbfjRDIU8ucibZtFfZGhzlQ0ifNaIq2exkiUwZmxN
         V1G1bIqPIansfDQOJ6f2V3XHZnjQ2f8tQTG5l3/szX6AFZlWjQby84OSJooCZr4dM+
         CiVKf7bF32p2A8aP/BLQX4JBtG08Wl+X3YXnaL4tDjQ1f07QF/7+4rJj9AopY0ijRB
         OJfBHhiDgv1anQibABee6bbgk26lqvB6Efnipza1NFxLjYRWx6lPd9bgbb0XAtYa1K
         qpEMk+JXv6XMg==
Subject: Re: [PATCHv2 5/8] staging: media: atomisp: Refactor
 ia_css_stream_load()
To:     Martiros Shakhzadyan <vrzh@vrzh.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210420150356.579395-1-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7edb21ff-23b5-8195-877f-829bf17bf6bb@xs4all.nl>
Date:   Fri, 23 Apr 2021 11:26:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210420150356.579395-1-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfK23fUSrGU7iaFkipi6tuObRGgkjIsuEEDP8bLMV6X8zPbpqWyk498KPyoQEiBU52wUBnt3QLj+c9aMZb12i7q7HMQJ6BLtSyzhblICjYl4o1yEfpw7w
 izKrUUfF46iOxcPaS3Ji5xZ+go0MiZDkm8XzDCjuF8GQPZRhVj6XX9IgSgoSbtK5bnJhD9nqw5uRVukCsPMMvjdDmimJY5o0O5z8SwJ1FdBO1yRmCzsMyusG
 FJzAN12RL/OmOu9zrDoyo+TJp71QILWa6CYi6yDASZqPlZ5qsp/wfSS8whfDAWKK
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 17:03, Martiros Shakhzadyan wrote:
> Move the support check to the beginning of the function.
> Change the logic to avoid multiple nesting blocks.
> Move variable assignment outside of the if statement.
> Remove an unnecessary check.
> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 72 +++++++++++-----------
>  1 file changed, 35 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 4d4f030e0fe0..bd96c4ab04d0 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -9615,48 +9615,46 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
>  int
>  ia_css_stream_load(struct ia_css_stream *stream)
>  {
> -	if (!IS_ISP2401) {
> -		int i;
> -		int err;
> +	int i, j, err;
>  
> -		assert(stream);
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
> -		for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
> -			if (my_css_save.stream_seeds[i].stream == stream) {
> -				int j;
> -
> -				for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
> -					if ((err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
> -								    &my_css_save.stream_seeds[i].pipes[j])) != 0) {
> -						if (j) {
> -							int k;
> -
> -							for (k = 0; k < j; k++)
> -								ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[k]);
> -						}
> -						return err;
> -					}
> -				}
> -				err = ia_css_stream_create(&my_css_save.stream_seeds[i].stream_config,
> -							my_css_save.stream_seeds[i].num_pipes,
> -							my_css_save.stream_seeds[i].pipes,
> -							&my_css_save.stream_seeds[i].stream);
> -				if (err) {
> -					ia_css_stream_destroy(stream);
> -					for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
> -						ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
> -					return err;
> -				}
> -				break;
> -			}
> -		}
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
> -		return 0;
> -	} else {
> +	if (IS_ISP2401) {
>  		/* TODO remove function - DEPRECATED */
>  		(void)stream;
>  		return -ENOTSUPP;
>  	}
> +
> +	assert(stream);
> +	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
> +	for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
> +		if (my_css_save.stream_seeds[i].stream != stream)
> +			continue;
> +
> +		for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
> +			int k;
> +
> +			err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
> +						 &my_css_save.stream_seeds[i].pipes[j]);
> +			if (!err)
> +				continue;
> +
> +			for (k = 0; k < j; k++)
> +				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[k]);
> +			return err;
> +		}
> +		err = ia_css_stream_create(&my_css_save.stream_seeds[i].stream_config,
> +					   my_css_save.stream_seeds[i].num_pipes,
> +					   my_css_save.stream_seeds[i].pipes,
> +					   &my_css_save.stream_seeds[i].stream);
> +		if (err) {
> +			ia_css_stream_destroy(stream);
> +			for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
> +				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
> +			return err;
> +		}

You dropped a 'break' here!

Regards,

	Hans

> +	}
> +
> +	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
> +	return 0;
>  }
>  
>  int
> 

