Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF58B36598C
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 15:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbhDTNMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 09:12:09 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:40237 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231313AbhDTNMJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 09:12:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YqA9lY1Iw8K3KYqADlzk8E; Tue, 20 Apr 2021 15:11:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618924297; bh=yqLYcsBLFI2JYHfgnG3Wr9I81QDXNW8sWl9OnOVNAj4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ME2mC1QTOmo9Kiy48D0qoB2juhND4KbEYvjv9Xg/WbVQra9QT/igu3/1RTfrKBPFu
         6ou/nbFLli57aFHE6PFURiwR4nTpSf45OBUYEcVvQW/hztSVW2xVPbN2cVux8KAHJP
         7Iz46YC3j7GZ1OAjv6OUsvmMvqpAp7psV16pMciY0PBD8MHi9050T4vv9z5E7w2k6y
         1raxGdxpFjXfpkWtupeKJZS2nfVfWZqG0K6adJDJAQX8MMayW+EhP+awrir7GWvIQN
         8D9yv7D1gbSkmsb5eYLxbhdbOrAppQCu8xEcHm6Sn1zCJM/TDXBJBiz1eVAPNbHw1t
         N8m4FkCfU+mwA==
Subject: Re: [PATCH 5/8] staging: media: atomisp: Refactor
 ia_css_stream_load()
To:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210419192602.498815-1-vrzh@vrzh.net>
 <20210419192602.498815-6-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cab37171-bbe4-c1c4-239d-80f49b47fc88@xs4all.nl>
Date:   Tue, 20 Apr 2021 15:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210419192602.498815-6-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKTQDD105nHKeClCiHckPkR2085+ApsCvWHtBT5txUBFzL0lXgWl135CUsyID9/wDYsLX8i/sZ/H/+FTm7iJtFGgxR+Oo+M76uaFKsMcb9dC2QTGiU3M
 z3vRDTqQFh34ymvY5APhOKY1foEp8RzrlFPei8KKlPy7zMbtBy+XB2Q5v4NozKt8JRiCZP3//zpWvVihfuk/JXDBoG40+qTho/F/MyzMvlc2M9xKPlYARo7K
 eav+s36WPz5j06ceXYAPl1VufU8t/3lz/boWhhpdkCQHxBMovC2ikDhCMfXf+pGq
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/04/2021 21:25, Martiros Shakhzadyan wrote:
> Move the support check to the beginning of the function.
> Replace ENOTSUPP with a standard EOPNOTSUPP exit code.
> Use goto instead of nesting blocks in the stream search loop.
> Move variable assignment outside of the if statement.
> Remove an unnecessary check.
> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 72 +++++++++++-----------
>  1 file changed, 35 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 87438b5948ba..71e8133abf04 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -9616,48 +9616,46 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
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
> +	if (IS_ISP2401) {
> +		/* TODO remove function - DEPRECATED */
> +		(void)stream;
> +		return -EOPNOTSUPP;

Keep ENOTSUPP: ENOPNOTSUPP is for unsupported operands, ENOTSUPP is for
unsupported functionality, like this.

> +	}
>  
> -				for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
> -					if ((err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
> -								    &my_css_save.stream_seeds[i].pipes[j])) != 0) {
> -						if (j) {
> -							int k;
> +	assert(stream);
> +	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
> +	for (i = 0; i < MAX_ACTIVE_STREAMS; i++)
> +		if (my_css_save.stream_seeds[i].stream == stream)
> +			goto found;
> +	goto done;

Yuck.

The way to do this is as follows:

	for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
		if (my_css_save.stream_seeds[i].stream != stream)
			continue;

		...

> +
> +found:
> +	for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
> +		err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
> +					 &my_css_save.stream_seeds[i].pipes[j]);
> +		if (err) {

Similar construct:

		if (!err)
			continue;

> +			int k;
>  
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
> +			for (k = 0; k < j; k++)
> +				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[k]);
> +			return err;
>  		}
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
> -		return 0;
> -	} else {
> -		/* TODO remove function - DEPRECATED */
> -		(void)stream;
> -		return -ENOTSUPP;
>  	}
> +	err = ia_css_stream_create(&my_css_save.stream_seeds[i].stream_config,
> +				   my_css_save.stream_seeds[i].num_pipes,
> +				   my_css_save.stream_seeds[i].pipes,
> +				   &my_css_save.stream_seeds[i].stream);
> +	if (err) {
> +		ia_css_stream_destroy(stream);
> +		for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
> +			ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
> +		return err;
> +	}
> +done:
> +	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
> +	return 0;
>  }
>  
>  int
> 

Regards,

	Hans
