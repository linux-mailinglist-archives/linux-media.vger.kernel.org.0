Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2895076E18E
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 09:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjHCHfR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 03:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbjHCHe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 03:34:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B59344AE
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 00:31:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D5AF61C32
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 07:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40E1C433C9;
        Thu,  3 Aug 2023 07:31:14 +0000 (UTC)
Message-ID: <a001e625-ffa5-4607-baff-0b6f8a283c25@xs4all.nl>
Date:   Thu, 3 Aug 2023 09:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] media: i2c: ccs: Check rules is non-NULL
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20230802100447.712618-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230802100447.712618-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 02/08/2023 12:04, Sakari Ailus wrote:
> Fix the following smatch warning:
> 
> drivers/media/i2c/ccs/ccs-data.c:524 ccs_data_parse_rules() warn: address
> of NULL pointer 'rules'
> 
> The CCS static data rule parser does not check an if rule has been
> obtained before checking for other rule types (which depend on the if
> rule). In practice this means parsing invalid CCS static data could lead
> to dereferencing a NULL pointer.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
> Cc: stable@vger.kernel.org # for 5.11 and up
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-data.c | 94 +++++++++++++++++---------------
>  1 file changed, 49 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
> index 45f2b2f55ec5..5e3ca02112f1 100644
> --- a/drivers/media/i2c/ccs/ccs-data.c
> +++ b/drivers/media/i2c/ccs/ccs-data.c
> @@ -464,8 +464,7 @@ static int ccs_data_parse_rules(struct bin_container *bin,
>  		rule_payload = __rule_type + 1;
>  		rule_plen2 = rule_plen - sizeof(*__rule_type);
>  
> -		switch (*__rule_type) {
> -		case CCS_DATA_BLOCK_RULE_ID_IF: {
> +		if (*__rule_type == CCS_DATA_BLOCK_RULE_ID_IF) {
>  			const struct __ccs_data_block_rule_if *__if_rules =
>  				rule_payload;
>  			const size_t __num_if_rules =
> @@ -514,49 +513,54 @@ static int ccs_data_parse_rules(struct bin_container *bin,
>  				rules->if_rules = if_rule;
>  				rules->num_if_rules = __num_if_rules;
>  			}
> -			break;
> -		}
> -		case CCS_DATA_BLOCK_RULE_ID_READ_ONLY_REGS:
> -			rval = ccs_data_parse_reg_rules(bin, &rules->read_only_regs,
> -							&rules->num_read_only_regs,
> -							rule_payload,
> -							rule_payload + rule_plen2,
> -							dev);
> -			if (rval)
> -				return rval;
> -			break;
> -		case CCS_DATA_BLOCK_RULE_ID_FFD:
> -			rval = ccs_data_parse_ffd(bin, &rules->frame_format,
> -						  rule_payload,
> -						  rule_payload + rule_plen2,
> -						  dev);
> -			if (rval)
> -				return rval;
> -			break;
> -		case CCS_DATA_BLOCK_RULE_ID_MSR:
> -			rval = ccs_data_parse_reg_rules(bin,
> -							&rules->manufacturer_regs,
> -							&rules->num_manufacturer_regs,
> -							rule_payload,
> -							rule_payload + rule_plen2,
> -							dev);
> -			if (rval)
> -				return rval;
> -			break;
> -		case CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT:
> -			rval = ccs_data_parse_pdaf_readout(bin,
> -							   &rules->pdaf_readout,
> -							   rule_payload,
> -							   rule_payload + rule_plen2,
> -							   dev);
> -			if (rval)
> -				return rval;
> -			break;
> -		default:
> -			dev_dbg(dev,
> -				"Don't know how to handle rule type %u!\n",
> -				*__rule_type);
> -			return -EINVAL;
> +		} else {
> +			/* Check there was an if rule before any other rules */
> +			if (bin->base && !rules)
> +				return -EINVAL;
> +
> +			switch (*__rule_type) {
> +			case CCS_DATA_BLOCK_RULE_ID_READ_ONLY_REGS:
> +				rval = ccs_data_parse_reg_rules(bin, &rules->read_only_regs,
> +								&rules->num_read_only_regs,
> +								rule_payload,
> +								rule_payload + rule_plen2,
> +								dev);

I still get the same smatch warning:

drivers/media/i2c/ccs/ccs-data.c:524 ccs_data_parse_rules() warn: address of NULL pointer 'rules'

Shouldn't the 'if' above simply read: 'if (!rules)'?

With that change the smatch warning disappears.

Regards,

	Hans

> +				if (rval)
> +					return rval;
> +				break;
> +			case CCS_DATA_BLOCK_RULE_ID_FFD:
> +				rval = ccs_data_parse_ffd(bin, &rules->frame_format,
> +							  rule_payload,
> +							  rule_payload + rule_plen2,
> +							  dev);
> +				if (rval)
> +					return rval;
> +				break;
> +			case CCS_DATA_BLOCK_RULE_ID_MSR:
> +				rval = ccs_data_parse_reg_rules(bin,
> +								&rules->manufacturer_regs,
> +								&rules->num_manufacturer_regs,
> +								rule_payload,
> +								rule_payload + rule_plen2,
> +								dev);
> +				if (rval)
> +					return rval;
> +				break;
> +			case CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT:
> +				rval = ccs_data_parse_pdaf_readout(bin,
> +								   &rules->pdaf_readout,
> +								   rule_payload,
> +								   rule_payload + rule_plen2,
> +								   dev);
> +				if (rval)
> +					return rval;
> +				break;
> +			default:
> +				dev_dbg(dev,
> +					"Don't know how to handle rule type %u!\n",
> +					*__rule_type);
> +				return -EINVAL;
> +			}
>  		}
>  		__next_rule = __next_rule + rule_hlen + rule_plen;
>  	}

