Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF6BE3562B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 07:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfFEFWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 01:22:10 -0400
Received: from smtprelay0133.hostedemail.com ([216.40.44.133]:36724 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725268AbfFEFWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 01:22:10 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 48FDC837F27D;
        Wed,  5 Jun 2019 05:22:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::,RULES_HIT:41:355:379:599:800:960:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3653:3865:3866:3868:3870:3874:4250:4321:5007:7903:9008:10004:10400:10848:11232:11473:11658:11914:12740:12760:12895:13069:13200:13229:13311:13357:13439:14181:14659:14721:21080:21627:30054:30060:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: quiet08_1276c8ca9e514
X-Filterd-Recvd-Size: 2325
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Wed,  5 Jun 2019 05:22:06 +0000 (UTC)
Message-ID: <b70cf8c1f901ea09abbdb22dd28244b18fd1a39d.camel@perches.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
From:   Joe Perches <joe@perches.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Tue, 04 Jun 2019 22:22:05 -0700
In-Reply-To: <20190605051040.GA22760@kroah.com>
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
         <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
         <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
         <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
         <20190604134213.GA26263@kroah.com>
         <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
         <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
         <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
         <20190605051040.GA22760@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-06-05 at 07:10 +0200, Greg KH wrote:
> On Wed, Jun 05, 2019 at 01:10:41PM +0900, Masahiro Yamada wrote:
> > On Wed, Jun 5, 2019 at 3:21 AM Arnd Bergmann <arnd@arndb.de> wrote:
[]
> > This means we cannot reliably use uint{8,16,32,64}_t in UAPI headers.
> 
> We should not be doing that as they are in the userspace "namespace" of
> variables, not in the kernel namespace.  We've been over this many times
> in the past :(

Just not very successfully...

$ git grep -w -P 'u?_?int(?:8|16|32|64)_t' include/uapi | wc -l
342

$ git grep -w -P --name-only 'u?_?int(?:8|16|32|64)_t' include/uapi | wc -l
13

Documentation helps a bit, checkpatch helps as well.
Maintainer knowledge and vigilance probably helps the most.

