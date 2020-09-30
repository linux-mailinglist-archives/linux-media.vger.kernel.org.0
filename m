Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A570527DDBC
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 03:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbgI3B1H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 21:27:07 -0400
Received: from smtprelay0058.hostedemail.com ([216.40.44.58]:59788 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726689AbgI3B1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 21:27:07 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 24807100E7B46;
        Wed, 30 Sep 2020 01:27:06 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2110:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3868:3874:4321:5007:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13255:13311:13357:13439:14659:14721:21080:21627:30054:30083:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: route17_40126172718e
X-Filterd-Recvd-Size: 1691
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA;
        Wed, 30 Sep 2020 01:27:04 +0000 (UTC)
Message-ID: <723e89d8cce4fed905d11740d855c60b06be2595.camel@perches.com>
Subject: Re: [PATCH 10/20] media: lmedm04: use semicolons rather than commas
 to separate statements
From:   Joe Perches <joe@perches.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 29 Sep 2020 18:27:03 -0700
In-Reply-To: <3b7457e4efd04865115152636ca65b5dc9cfe0e4.camel@perches.com>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
         <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr>
         <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr>
         <c79b36c12c978d38f3ad89b1c659871a@perches.com>
         <alpine.DEB.2.22.394.2009291843560.2808@hadrien>
         <3b7457e4efd04865115152636ca65b5dc9cfe0e4.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-09-29 at 15:21 -0700, Joe Perches wrote:
> I did not send a patch for this one.

Well, I guess I did and forgot.

I thought this was about the braces and semicolons
addition around multi-statement commas, and I
didn't send a patch for this file for that.

cheers, Joe


