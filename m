Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE3BADD67
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbfIIQjn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:39:43 -0400
Received: from smtprelay0165.hostedemail.com ([216.40.44.165]:54836 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729421AbfIIQjn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 12:39:43 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 35AB5181D341F;
        Mon,  9 Sep 2019 16:39:41 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3872:3874:4321:5007:6119:7903:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12296:12297:12438:12679:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21433:21451:21627:30012:30054:30070:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:none
X-HE-Tag: tent99_1a341b076e050
X-Filterd-Recvd-Size: 2865
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA;
        Mon,  9 Sep 2019 16:39:39 +0000 (UTC)
Message-ID: <7d870b0119afa378dc68c710670b9b550ef5bdd4.camel@perches.com>
Subject: Re: [Patch 10/13] media: am437x-vpfe: Remove print_fourcc helper
From:   Joe Perches <joe@perches.com>
To:     Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 09 Sep 2019 09:39:37 -0700
In-Reply-To: <20190909162743.30114-11-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
         <20190909162743.30114-11-bparrot@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-09-09 at 11:27 -0500, Benoit Parrot wrote:
> print_fourcc helper function was used for debug log the
> convert a pixel format code into its readable form for display
> purposes. But since it used a single static buffer to perform
> the conversion this might lead to display format issue when more
> than one instance was invoked simultaneously.
> 
> It turns out that print_fourcc can be safely replace by using
> "%4.4s" instead and casting the pointer to the fourcc code
> into a (char *).
[]
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
[]
> @@ -221,20 +221,6 @@ static void pix_to_mbus(struct vpfe_device *vpfe,
[]
> @@ -700,8 +686,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
>  {
>  	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
>  
> -	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
> -		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
> +	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4.4s\n",
> +		 __func__, ccdc->ccdc_cfg.if_type, (char *)&pixfmt);


To avoid any possible defect in the content of pixfmt, it's
probably better to use vsprintf extension "%4pE", &pixfmt
see: Documentation/core-api/printk-formats.rst

	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4pE\n",
		 __func__, ccdc->ccdc_cfg.if_type, &pixfmt);

>  
>  	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
>  		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
> @@ -989,8 +975,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
>  
>  	vpfe_dbg(2, vpfe, "%s:\n", __func__);
>  
> -	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
> -		print_fourcc(vpfe->v_fmt.fmt.pix.pixelformat));
> +	vpfe_dbg(1, vpfe, "pixelformat: %4.4s\n",
> +		 (char *)&vpfe->v_fmt.fmt.pix.pixelformat);

	vpfe_dbg(1, vpfe, "pixelformat: %4pE\n",
		 &vpfe->v_fmt.fmt.pix.pixelformat);

etc...


