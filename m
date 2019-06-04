Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C948834626
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbfFDMFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:05:00 -0400
Received: from smtprelay0146.hostedemail.com ([216.40.44.146]:44039 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727250AbfFDME7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 08:04:59 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 6F9BE100E86D1;
        Tue,  4 Jun 2019 12:04:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::,RULES_HIT:41:355:379:421:599:800:960:967:968:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1981:2110:2194:2199:2393:2525:2553:2560:2563:2682:2685:2691:2828:2859:2895:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6117:7903:8814:9025:9040:9388:10004:10400:10848:11232:11658:11914:12043:12740:12760:12895:13069:13161:13229:13311:13357:13439:14094:14096:14181:14659:14721:21080:21324:21627:21788:21795:30054:30060:30070:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:35,LUA_SUMMARY:none
X-HE-Tag: class59_827f50f7dee18
X-Filterd-Recvd-Size: 2744
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Tue,  4 Jun 2019 12:04:56 +0000 (UTC)
Message-ID: <2674b675063812e7c422a7964afdef6b7c712e4b.camel@perches.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
From:   Joe Perches <joe@perches.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 04 Jun 2019 05:04:55 -0700
In-Reply-To: <CAK7LNAR9iz8_wvybmrVFqDaiP3bzxjQ18EUwkvC1LMjR96WWag@mail.gmail.com>
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
         <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
         <CAK7LNAR9iz8_wvybmrVFqDaiP3bzxjQ18EUwkvC1LMjR96WWag@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-06-04 at 20:48 +0900, Masahiro Yamada wrote:
> On Tue, Jun 4, 2019 at 8:24 PM Joe Perches <joe@perches.com> wrote:
> > On Tue, 2019-06-04 at 20:13 +0900, Masahiro Yamada wrote:
> > > On the other hand, uapi headers are written in more strict C, where
> > > the C++ comment style is forbidden.
> > 
> > Is this a real problem for any toolchain?
> 
> I was waiting for this comment!
> 
> Which standard should UAPI headers follow?
> Is it defined somewhere?
> 
> If there is no rule, is it up to subsystem maintainers?
> 
> We have a certain of unknowledge in user-space,
> I do not know it it is a real problem.
> 
> Actually, this patch is related to this thread:
> https://lkml.org/lkml/2019/5/22/1441
> 
> Thomas and you agreed
> // should be avoided for SPDX tags in UAPI headers.

If it's really a generic issue, I think there are more
uses of // comments in uapi files.

$ git grep '//' include/uapi/ | grep -vP '(http://|https://|ftp:/)' | wc -l
101

> So, I just thought C99 was forbidden for user-space.

No idea, I just believe if it's really a problem
it likely would have been reported already.

> If C89/C90 is already fantasy,
> let's clearly say "Kernel requires C99 for user-space",
> and use // everywhere for SPDX tags?

OK by me.

I have a checkpatch patch waiting to submit to remove the
requirement to use the /* */ comment style in .h files.

The docs need to be updated too.

cheers, Joe

