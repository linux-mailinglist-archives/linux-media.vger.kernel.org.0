Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4363F76E35A
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjHCIlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbjHCIlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:41:06 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4580128
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691052063; x=1722588063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qSS1Rb1XF10wH1yDQHNF5jiZtrYH9KMUtfNsdW2bNt0=;
  b=dGv1Nkb72QxwEYY/jNnrxqcWnyaJ81OUIbQzZeRKIfLHmhNhkC3iGl42
   vVASDfsoCqt0uNSdjDDLQzcDxjLi9Ftg1GD8TOkLJOWK13nx+GvPFBGgb
   35vp/+YPmaK4rzZc+apwTe06o79+wg4xZbtbTZlRTDJU7tSsyxdp1DbTX
   mZY+8DBYLgS+jGag8IVijIjj5SqKoipqETPYD0SliiKWba66OpwhYFvT+
   SQUcwRPCDAJvtw4soMlCcy2f9u7anh3Ou1dE1u2Z09QOIUlsXEJhyZBVa
   uZlW5NyTPn+VSUX7mS0Ndtk1SmhGZAqAKeQKelzz+dA5gdSj8nearYzHp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="354727523"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="354727523"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843503917"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="843503917"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:38:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2F7AC1207A3;
        Thu,  3 Aug 2023 11:38:21 +0300 (EEST)
Date:   Thu, 3 Aug 2023 08:38:21 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: ccs: Check rules is non-NULL
Message-ID: <ZMtnfWjDmj4lmPvk@kekkonen.localdomain>
References: <20230802100447.712618-1-sakari.ailus@linux.intel.com>
 <a001e625-ffa5-4607-baff-0b6f8a283c25@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a001e625-ffa5-4607-baff-0b6f8a283c25@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Aug 03, 2023 at 09:31:13AM +0200, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 02/08/2023 12:04, Sakari Ailus wrote:
> > Fix the following smatch warning:
> > 
> > drivers/media/i2c/ccs/ccs-data.c:524 ccs_data_parse_rules() warn: address
> > of NULL pointer 'rules'
> > 
> > The CCS static data rule parser does not check an if rule has been
> > obtained before checking for other rule types (which depend on the if
> > rule). In practice this means parsing invalid CCS static data could lead
> > to dereferencing a NULL pointer.
> > 
> > Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
> > Cc: stable@vger.kernel.org # for 5.11 and up
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs/ccs-data.c | 94 +++++++++++++++++---------------
> >  1 file changed, 49 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
> > index 45f2b2f55ec5..5e3ca02112f1 100644
> > --- a/drivers/media/i2c/ccs/ccs-data.c
> > +++ b/drivers/media/i2c/ccs/ccs-data.c
> > @@ -464,8 +464,7 @@ static int ccs_data_parse_rules(struct bin_container *bin,
> >  		rule_payload = __rule_type + 1;
> >  		rule_plen2 = rule_plen - sizeof(*__rule_type);
> >  
> > -		switch (*__rule_type) {
> > -		case CCS_DATA_BLOCK_RULE_ID_IF: {
> > +		if (*__rule_type == CCS_DATA_BLOCK_RULE_ID_IF) {
> >  			const struct __ccs_data_block_rule_if *__if_rules =
> >  				rule_payload;
> >  			const size_t __num_if_rules =
> > @@ -514,49 +513,54 @@ static int ccs_data_parse_rules(struct bin_container *bin,
> >  				rules->if_rules = if_rule;
> >  				rules->num_if_rules = __num_if_rules;
> >  			}
> > -			break;
> > -		}
> > -		case CCS_DATA_BLOCK_RULE_ID_READ_ONLY_REGS:
> > -			rval = ccs_data_parse_reg_rules(bin, &rules->read_only_regs,
> > -							&rules->num_read_only_regs,
> > -							rule_payload,
> > -							rule_payload + rule_plen2,
> > -							dev);
> > -			if (rval)
> > -				return rval;
> > -			break;
> > -		case CCS_DATA_BLOCK_RULE_ID_FFD:
> > -			rval = ccs_data_parse_ffd(bin, &rules->frame_format,
> > -						  rule_payload,
> > -						  rule_payload + rule_plen2,
> > -						  dev);
> > -			if (rval)
> > -				return rval;
> > -			break;
> > -		case CCS_DATA_BLOCK_RULE_ID_MSR:
> > -			rval = ccs_data_parse_reg_rules(bin,
> > -							&rules->manufacturer_regs,
> > -							&rules->num_manufacturer_regs,
> > -							rule_payload,
> > -							rule_payload + rule_plen2,
> > -							dev);
> > -			if (rval)
> > -				return rval;
> > -			break;
> > -		case CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT:
> > -			rval = ccs_data_parse_pdaf_readout(bin,
> > -							   &rules->pdaf_readout,
> > -							   rule_payload,
> > -							   rule_payload + rule_plen2,
> > -							   dev);
> > -			if (rval)
> > -				return rval;
> > -			break;
> > -		default:
> > -			dev_dbg(dev,
> > -				"Don't know how to handle rule type %u!\n",
> > -				*__rule_type);
> > -			return -EINVAL;
> > +		} else {
> > +			/* Check there was an if rule before any other rules */
> > +			if (bin->base && !rules)
> > +				return -EINVAL;
> > +
> > +			switch (*__rule_type) {
> > +			case CCS_DATA_BLOCK_RULE_ID_READ_ONLY_REGS:
> > +				rval = ccs_data_parse_reg_rules(bin, &rules->read_only_regs,
> > +								&rules->num_read_only_regs,
> > +								rule_payload,
> > +								rule_payload + rule_plen2,
> > +								dev);
> 
> I still get the same smatch warning:
> 
> drivers/media/i2c/ccs/ccs-data.c:524 ccs_data_parse_rules() warn: address of NULL pointer 'rules'
> 
> Shouldn't the 'if' above simply read: 'if (!rules)'?
> 
> With that change the smatch warning disappears.

"rules" is actually NULL on the first round of parsing, which is used to
determine the size of the memory allocation for the resulting data
structure.

I guess it warns then about just referencing it while it isn't actually
accessed?

The bug should be fixed by this patch though. I'll see if the warning could
also be suppressed without making the code too awkward.

> 
> Regards,
> 
> 	Hans
> 
> > +				if (rval)
> > +					return rval;
> > +				break;
> > +			case CCS_DATA_BLOCK_RULE_ID_FFD:
> > +				rval = ccs_data_parse_ffd(bin, &rules->frame_format,
> > +							  rule_payload,
> > +							  rule_payload + rule_plen2,
> > +							  dev);
> > +				if (rval)
> > +					return rval;
> > +				break;
> > +			case CCS_DATA_BLOCK_RULE_ID_MSR:
> > +				rval = ccs_data_parse_reg_rules(bin,
> > +								&rules->manufacturer_regs,
> > +								&rules->num_manufacturer_regs,
> > +								rule_payload,
> > +								rule_payload + rule_plen2,
> > +								dev);
> > +				if (rval)
> > +					return rval;
> > +				break;
> > +			case CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT:
> > +				rval = ccs_data_parse_pdaf_readout(bin,
> > +								   &rules->pdaf_readout,
> > +								   rule_payload,
> > +								   rule_payload + rule_plen2,
> > +								   dev);
> > +				if (rval)
> > +					return rval;
> > +				break;
> > +			default:
> > +				dev_dbg(dev,
> > +					"Don't know how to handle rule type %u!\n",
> > +					*__rule_type);
> > +				return -EINVAL;
> > +			}
> >  		}
> >  		__next_rule = __next_rule + rule_hlen + rule_plen;
> >  	}
> 

-- 
Kind regards,

Sakari Ailus
