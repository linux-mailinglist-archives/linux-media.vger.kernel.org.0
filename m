Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74764220184
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 02:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgGOAv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 20:51:59 -0400
Received: from smtprelay0224.hostedemail.com ([216.40.44.224]:44132 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726356AbgGOAv6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 20:51:58 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 8823718224D61;
        Wed, 15 Jul 2020 00:51:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:4250:4321:5007:6117:7875:7903:10004:10400:10848:11026:11232:11658:11914:12043:12297:12555:12740:12760:12895:12986:13019:13069:13311:13357:13439:14093:14096:14097:14180:14181:14659:14721:21080:21433:21627:21939:21987:21990:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: plane42_08149f426ef5
X-Filterd-Recvd-Size: 2039
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf10.hostedemail.com (Postfix) with ESMTPA;
        Wed, 15 Jul 2020 00:51:56 +0000 (UTC)
Message-ID: <c3dc7c1dd56a3a677e6d72b05313b2a61962885e.camel@perches.com>
Subject: Re: [PATCH 3/5] media/dvbdev.h: fix duplicated word in comment
From:   Joe Perches <joe@perches.com>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Date:   Tue, 14 Jul 2020 17:51:55 -0700
In-Reply-To: <20200714220553.20294-3-rdunlap@infradead.org>
References: <20200714220553.20294-1-rdunlap@infradead.org>
         <20200714220553.20294-3-rdunlap@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-07-14 at 15:05 -0700, Randy Dunlap wrote:
> Change the doubled word "the" in a comment to "to the".

Hey 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> ---
>  include/media/dvbdev.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200714.orig/include/media/dvbdev.h
> +++ linux-next-20200714/include/media/dvbdev.h
> @@ -385,7 +385,7 @@ struct i2c_client;
>   * with dvb_module_probe() should use dvb_module_release() to unbind.
>   *
>   * Return:
> - *	On success, return an &struct i2c_client, pointing the the bound
> + *	On success, return an &struct i2c_client, pointing to the bound

an &struct reads OK as text, but does not as rst/html

Perhaps this should be:

   return the address of the bound &struct i2c_client device
or
   return a pointer to the bound &struct i2c_client device

otherwise the html output is

   Return

   On success, return an struct i2c_client, pointing to the bound
   I2C device. NULL otherwise.

and there seem to be too many commas used as well.



