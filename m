Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11507ADD96
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbfIIQzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:55:00 -0400
Received: from smtprelay0227.hostedemail.com ([216.40.44.227]:45554 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727781AbfIIQzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 12:55:00 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id DD120100E86C0;
        Mon,  9 Sep 2019 16:54:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:960:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1981:2194:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3874:4250:4321:4419:5007:6117:10004:10400:10848:11026:11232:11657:11658:11914:12043:12296:12297:12438:12740:12760:12895:13069:13161:13229:13311:13357:13439:13972:14181:14659:14721:21080:21451:21627:21740:30029:30054:30069:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:28,LUA_SUMMARY:none
X-HE-Tag: joke95_e38df7958c09
X-Filterd-Recvd-Size: 2099
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Mon,  9 Sep 2019 16:54:57 +0000 (UTC)
Message-ID: <ec66e477095bcddb86ffcc7ca10d3e0bbe72f943.camel@perches.com>
Subject: Re: [Patch 09/13] media: am437x-vpfe: fix function trace debug log
From:   Joe Perches <joe@perches.com>
To:     Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 09 Sep 2019 09:54:56 -0700
In-Reply-To: <20190909162743.30114-10-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
         <20190909162743.30114-10-bparrot@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-09-09 at 11:27 -0500, Benoit Parrot wrote:
> checkpatch.pl nows reports several:
> WARNING: Prefer using '"%s...", __func__' to using '<function name>',
> this function's name, in a string
> 
> So fix these for the whole driver.

Most of these seem to be function tracing comments
that should probably be removed instead.

The generic kernel facility ftrace works well.

> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
[]
> @@ -466,7 +466,7 @@ static void vpfe_ccdc_config_ycbcr(struct vpfe_ccdc *ccdc)
>  	struct ccdc_params_ycbcr *params = &ccdc->ccdc_cfg.ycbcr;
>  	u32 syn_mode;
>  
> -	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_ycbcr:\n");
> +	vpfe_dbg(3, vpfe, "%s:\n", __func__);

Remove this instead

>  	/*
>  	 * first restore the CCDC registers to default values
>  	 * This is important since we assume default values to be set in
> @@ -598,7 +598,7 @@ static void vpfe_ccdc_config_raw(struct vpfe_ccdc *ccdc)
>  	unsigned int syn_mode;
>  	unsigned int val;
>  
> -	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_raw:\n");
> +	vpfe_dbg(3, vpfe, "%s:\n", __func__);

here too, etc...


