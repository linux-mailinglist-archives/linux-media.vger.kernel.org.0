Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 923CDABD92
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 18:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731870AbfIFQUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 12:20:39 -0400
Received: from smtprelay0113.hostedemail.com ([216.40.44.113]:47720 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727391AbfIFQUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 12:20:39 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 10FFD18026B11;
        Fri,  6 Sep 2019 16:20:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::,RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2564:2682:2685:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3868:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:7901:7903:8985:9025:10004:10400:10848:10967:11232:11658:11854:11914:12043:12297:12438:12555:12740:12760:12895:13019:13069:13311:13357:13439:14096:14097:14181:14659:14721:21067:21080:21433:21627:21811:30054:30060:30070:30090:30091,0,RBL:error,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: jump19_79b02ed939a5d
X-Filterd-Recvd-Size: 2482
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Fri,  6 Sep 2019 16:20:36 +0000 (UTC)
Message-ID: <38bf64245d173d0de4452cac1c6cf028ad0490d8.camel@perches.com>
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Date:   Fri, 06 Sep 2019 09:20:35 -0700
In-Reply-To: <20190906114552.524d0d50@coco.lan>
References: <20190905055614.7958918b@coco.lan>
         <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
         <20190905092703.GA30899@kroah.com> <20190905090701.37dcf75e@coco.lan>
         <b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com>
         <20190906083457.7e7934ec@coco.lan>
         <a610efdd3bf488d407dc1130fa8ed090019ccffd.camel@perches.com>
         <20190906114552.524d0d50@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-09-06 at 11:45 -0300, Mauro Carvalho Chehab wrote:
> Em Fri, 06 Sep 2019 05:20:30 -0700
> Joe Perches <joe@perches.com> escreveu:
> 
> > On Fri, 2019-09-06 at 08:34 -0300, Mauro Carvalho Chehab wrote:
> > > I did some changes on it, plus one change at the pedantic mode of
> > > scripts/spdxcheck.py, and placed the corresponding patches at:
> > > 
> > > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=spdx_pedantic  
> > 
> > Overall seems very nice, thanks.
> > 
> > Couple nits.
> > 
> > Some of the scripts and py files move the author
> > block into a description or add unnecessary blank
> > comments.  These may use some manual fixups.
> 
> True. I noticed that too. I suspect that fixing this automatically would 
> make the script too complex.
> 
> Anyway, the point is: who will apply it? Linus? Each maintainer?

I have been advocating for a treewide scripted mechanism for awhile.
https://lore.kernel.org/lkml/4398924f28a58fca296d101dae11e7accce80656.camel@perches.com/



