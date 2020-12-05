Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708132CF7E2
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 01:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgLEARM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 19:17:12 -0500
Received: from smtprelay0108.hostedemail.com ([216.40.44.108]:43710 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726151AbgLEARL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 19:17:11 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id D82A1837F24A;
        Sat,  5 Dec 2020 00:16:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1559:1593:1594:1711:1714:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3866:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:9025:9391:10004:10400:10848:11658:11914:12043:12048:12297:12555:12740:12760:12895:12986:13069:13311:13357:13439:14181:14659:14721:14777:21080:21433:21627:21660:21811:21819:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: bone03_630ff5d273c8
X-Filterd-Recvd-Size: 1253
Received: from XPS-9350.home (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA;
        Sat,  5 Dec 2020 00:16:29 +0000 (UTC)
Message-ID: <8b81eed584f971b1dd61132ca4d04c0853653b31.camel@perches.com>
Subject: Re: [PATCH] staging:rkvdec: Fixed "replace comma with semicolon"
 Warning:
From:   Joe Perches <joe@perches.com>
To:     Travis Carter <traviscarter2@gmail.com>, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Fri, 04 Dec 2020 16:16:28 -0800
In-Reply-To: <20201204233743.GA8530@linuxmint-midtower-pc>
References: <20201204233743.GA8530@linuxmint-midtower-pc>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-12-04 at 17:37 -0600, Travis Carter wrote:
> drivers/staging/media/rkvdec/rkvdec.c

You might consider using Julia Lawall's cocci script for all of
drivers/staging or subsets of staging like drivers/staging/media/

https://lore.kernel.org/lkml/1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr/


