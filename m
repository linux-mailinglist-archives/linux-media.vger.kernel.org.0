Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F176DA9259
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 21:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbfIDTgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 15:36:08 -0400
Received: from smtprelay0024.hostedemail.com ([216.40.44.24]:53002 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729122AbfIDTgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 15:36:08 -0400
X-Greylist: delayed 559 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Sep 2019 15:36:07 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id D0D9980019AC
        for <linux-media@vger.kernel.org>; Wed,  4 Sep 2019 19:26:49 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 2178C182CED5B;
        Wed,  4 Sep 2019 19:26:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 30,2,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:421:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:6117:7901:10010:10400:10848:11026:11232:11473:11658:11914:12043:12050:12297:12740:12760:12895:13069:13200:13229:13311:13357:13439:14181:14659:14721:21080:21451:21627:21939:30054:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:1:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: sign82_1e205b955f54d
X-Filterd-Recvd-Size: 2459
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Wed,  4 Sep 2019 19:26:46 +0000 (UTC)
Message-ID: <ab957f98a62390dbc603632704c60d39596095c1.camel@perches.com>
Subject: Re: [PATCH] media: siano: Use the correct style for SPDX License
 Identifier
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nishad Kamdar <nishadkamdar@gmail.com>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 04 Sep 2019 12:26:45 -0700
In-Reply-To: <20190904160010.4532c3f5@coco.lan>
References: <20190831151147.GA7082@nishad>
         <20190904153432.7fb54f02@coco.lan> <20190904183608.GA495@kroah.com>
         <20190904160010.4532c3f5@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-09-04 at 16:00 -0300, Mauro Carvalho Chehab wrote:
> With Python, you can't even use the second line, as it is reserved
> for charset encoding. 
> 
> So, realistically, the SPDX header could be up to the third line of
> a given file.
> 
> Besides that, I vaguely remember some discussions we had, back on the
> days SPDX was introduced, envolving Thomas, Linus and others. My 
> understanding for such discussions is that something like this:
> 
> /*
>  * SPDX-License-Identifier: GPL-2.0+
>  *
>  * some other notes about the file
>  */
> 
> Would be acceptable, as the first line of the comment (with is at
> the beginning of the file) is the SPDX tag.

Using the 2nd line of a .[ch] file does not follow the
documented mechanisms.

Documentation/process/license-rules.rst-1. Placement:
Documentation/process/license-rules.rst-
Documentation/process/license-rules.rst-   The SPDX license identifier in kernel files shall be added at the first
Documentation/process/license-rules.rst:   possible line in a file which can contain a comment.  For the majority
Documentation/process/license-rules.rst:   of files this is the first line, except for scripts which require the
Documentation/process/license-rules.rst:   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
Documentation/process/license-rules.rst:   identifier goes into the second line.


