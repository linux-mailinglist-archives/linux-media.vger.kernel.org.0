Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0CE02E4D8
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 20:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfE2Szi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 14:55:38 -0400
Received: from smtprelay0162.hostedemail.com ([216.40.44.162]:42784 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725956AbfE2Szi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 14:55:38 -0400
X-Greylist: delayed 599 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 May 2019 14:55:37 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 653211800C0CE
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 18:45:39 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 984F9100E86C2;
        Wed, 29 May 2019 18:45:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:599:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:4321:4385:5007:7875:7903:10004:10400:10848:11026:11232:11473:11658:11914:12043:12048:12296:12438:12555:12663:12740:12760:12895:13439:14181:14659:14721:21080:21451:21627:21789:30012:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:24,LUA_SUMMARY:none
X-HE-Tag: mark05_4ddac67b04548
X-Filterd-Recvd-Size: 3252
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Wed, 29 May 2019 18:45:34 +0000 (UTC)
Message-ID: <bcd12350374533ef090ae911be444e702e85134b.camel@perches.com>
Subject: Re: [PATCH v2] drivers/media/dvb-frontends: Implement probe/remove
 for stv6110x
From:   Joe Perches <joe@perches.com>
To:     Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org
Date:   Wed, 29 May 2019 11:45:33 -0700
In-Reply-To: <20190529165633.8779-1-tobias.johannes.klausmann@mni.thm.de>
References: <20190509195118.23027-1-tobias.johannes.klausmann@mni.thm.de>
         <20190529165633.8779-1-tobias.johannes.klausmann@mni.thm.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-05-29 at 18:56 +0200, Tobias Klausmann wrote:
> Refactor out the common parts of stv6110x_probe() and stv6110x_attach()
> into separate functions.
> 
> This provides the needed functionality to use dvb_module_probe() instead
> of dvb_attach()!
> 
> v2:
> - Impovments based on comments by Sean Young
> - Fix checkpatch.pl --strict errors

trivia:

> diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-frontends/stv6110x.c
[]
> @@ -333,6 +333,41 @@ static void stv6110x_release(struct dvb_frontend *fe)
>  	kfree(stv6110x);
>  }
>  
> +void st6110x_init_regs(struct stv6110x_state *stv6110x)
> +{
> +	u8 default_regs[] = {0x07, 0x11, 0xdc, 0x85, 0x17, 0x01, 0xe6, 0x1e};

static const u8...

> +
> +	memcpy(stv6110x->regs, default_regs, 8);

	memcpy(stv6110x->regs, default_regs, ARRAY_SIZE(default_regs));

> +}
> +
> +void stv6110x_setup_divider(struct stv6110x_state *stv6110x)
> +{
> +	switch (stv6110x->config->clk_div) {
> +	default:
> +	case 1:
> +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2],
> +				  CTRL2_CO_DIV,
> +				  0);
> +		break;
> +	case 2:
> +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2],
> +				  CTRL2_CO_DIV,
> +				  1);
> +		break;
> +	case 4:
> +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2],
> +				  CTRL2_CO_DIV,
> +				  2);
> +		break;
> +	case 8:
> +	case 0:
> +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2],
> +				  CTRL2_CO_DIV,
> +				  3);
> +		break;
> +	}
> +}

Probably more sensible (and smaller object code) written using
an automatic like:

{
	int div;

	switch (stv6110x->config->clk_div) {
	case 8:
		div = 3;
		break;
	case 4:
		div = 2;
		break;
	case 2:
		div = 1;
		break;
	case 1:
	default:
		div = 0;
		break;
	}
	STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, div);
}

> diff --git a/drivers/media/dvb-frontends/stv6110x_priv.h b/drivers/media/dvb-frontends/stv6110x_priv.h
[]
> @@ -54,11 +54,12 @@
>  #define REFCLOCK_MHz				(stv6110x->config->refclk / 1000000)
>  
>  struct stv6110x_state {
> +	struct dvb_frontend		*frontend;
>  	struct i2c_adapter		*i2c;
>  	const struct stv6110x_config	*config;
>  	u8				regs[8];

Perhaps this 8 should be a define?


