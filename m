Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F092EAFE0
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 17:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbhAEQSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 11:18:54 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45073 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726132AbhAEQSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 11:18:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id wp28kgDcVQzFnwp2BkkL7U; Tue, 05 Jan 2021 17:18:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1609863491; bh=bx9OoX8ppvOVoa6fAFCwQrXob8i/ji5lG6WPKd9fLuI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mdgY1vMrnX0f6dUTD7bTeoyAMvyQDivp1PJ95N6k9Gc4OX0gKjhKGAt2S8QdrxXKJ
         ZvIsAfHSxj86ZldbCizLwyD44AOTDCI+KL47r7KYaVX/QM5SQOInbA2xZYGGD0FZWN
         AULOb/fe+W1Ltxax3k+oVHLh5T4HgPctILsOMQlpi2gxkxzywh3gavM7nVnSaW5q9O
         12C9LSlgzRXH/055YgTVQf8iG0LfoQBqt3IZPhVFnCoGFQmr/DqlwBE6iUrW9YU+b1
         CHz76Rh3MyEEt1Vsixb5EaUOiqbYND3boJJnBBA09HkNZXRwGblIvlIODxdKbPLK3b
         xc4bLy7SnlndA==
Subject: Re: [PATCH 1/1] ccs: Make (non-)use of uninitialised variables more
 robust
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210105124914.22900-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9ea0a248-a317-6536-0786-d85ceb585928@xs4all.nl>
Date:   Tue, 5 Jan 2021 17:18:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210105124914.22900-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLsa6UlbHBOocX0bpiLeqmGaWNIAHHxuZGEu3Tobu0ZTd/7+ZumhtNewQE3cg2oor+lzjabZsT5ONmkSNAp/Ftg4Bgc3VC/nHOrmDADrIU1sFIq97wRu
 vIumFijLwjNwehw92jsxAZQUSlRlYOZL1HTd8nnZSPb6FKjYVH3ZwBBbdik2mILpE8rBlvK5Aij9lHoBGXMShu9vM/FxGcpwlSklD2JSxIeuEflC3TzdpuCd
 SmtljqcOfVYlr78cbOp2MA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/01/2021 13:49, Sakari Ailus wrote:
> GCC with W=2 level of kernel compiler warnings warns about the use of
> uninitialised variables in a few locations. While these uninitialised
> variables were not used in reality, this still produced compiler warnings.
> 
> Address this by assigning the variables to NULL and checking for NULL in
> places it is not expected, returning -EPROTO in that case. This provides
> at least some sanity checking at runtime as the compiler appears unable to
> do that at compile time.
> 
> Reported-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This fixes the warnings!

Thank you,

	Hans

> ---
>  drivers/media/i2c/ccs/ccs-data.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
> index 59338a6704af..99b2b515058a 100644
> --- a/drivers/media/i2c/ccs/ccs-data.c
> +++ b/drivers/media/i2c/ccs/ccs-data.c
> @@ -214,7 +214,7 @@ static int ccs_data_parse_regs(struct bin_container *bin,
>  			       size_t *__num_regs, const void *payload,
>  			       const void *endp, struct device *dev)
>  {
> -	struct ccs_reg *regs_base, *regs;
> +	struct ccs_reg *regs_base = NULL, *regs = NULL;
>  	size_t num_regs = 0;
>  	u16 addr = 0;
>  
> @@ -285,6 +285,9 @@ static int ccs_data_parse_regs(struct bin_container *bin,
>  		if (!bin->base) {
>  			bin_reserve(bin, len);
>  		} else if (__regs) {
> +			if (!regs)
> +				return -EPROTO;
> +
>  			regs->addr = addr;
>  			regs->len = len;
>  			regs->value = bin_alloc(bin, len);
> @@ -305,8 +308,12 @@ static int ccs_data_parse_regs(struct bin_container *bin,
>  	if (__num_regs)
>  		*__num_regs = num_regs;
>  
> -	if (bin->base && __regs)
> +	if (bin->base && __regs) {
> +		if (!regs_base)
> +			return -EPROTO;
> +
>  		*__regs = regs_base;
> +	}
>  
>  	return 0;
>  }
> @@ -425,7 +432,7 @@ static int ccs_data_parse_rules(struct bin_container *bin,
>  				size_t *__num_rules, const void *payload,
>  				const void *endp, struct device *dev)
>  {
> -	struct ccs_rule *rules_base, *rules = NULL, *next_rule;
> +	struct ccs_rule *rules_base = NULL, *rules = NULL, *next_rule = NULL;
>  	size_t num_rules = 0;
>  	const void *__next_rule = payload;
>  	int rval;
> @@ -483,6 +490,9 @@ static int ccs_data_parse_rules(struct bin_container *bin,
>  			} else {
>  				unsigned int i;
>  
> +				if (!next_rule)
> +					return -EPROTO;
> +
>  				rules = next_rule;
>  				next_rule++;
>  
> @@ -555,6 +565,9 @@ static int ccs_data_parse_rules(struct bin_container *bin,
>  		bin_reserve(bin, sizeof(*rules) * num_rules);
>  		*__num_rules = num_rules;
>  	} else {
> +		if (!rules_base)
> +			return -EPROTO;
> +
>  		*__rules = rules_base;
>  	}
>  
> @@ -690,7 +703,7 @@ static int ccs_data_parse_pdaf(struct bin_container *bin, struct ccs_pdaf_pix_lo
>  	}
>  
>  	for (i = 0; i < max_block_type_id; i++) {
> -		struct ccs_pdaf_pix_loc_pixel_desc_group *pdgroup;
> +		struct ccs_pdaf_pix_loc_pixel_desc_group *pdgroup = NULL;
>  		unsigned int j;
>  
>  		if (!is_contained(__num_pixel_descs, endp))
> @@ -721,6 +734,9 @@ static int ccs_data_parse_pdaf(struct bin_container *bin, struct ccs_pdaf_pix_lo
>  			if (!bin->base)
>  				continue;
>  
> +			if (!pdgroup)
> +				return -EPROTO;
> +
>  			pdesc = &pdgroup->descs[j];
>  			pdesc->pixel_type = __pixel_desc->pixel_type;
>  			pdesc->small_offset_x = __pixel_desc->small_offset_x;
> 

