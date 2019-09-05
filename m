Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B83EA9E59
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 11:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732124AbfIEJ2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 05:28:09 -0400
Received: from smtprelay0038.hostedemail.com ([216.40.44.38]:55489 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727900AbfIEJ2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 05:28:09 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 714A418224D73;
        Thu,  5 Sep 2019 09:28:07 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2731:2828:3138:3139:3140:3141:3142:3352:3622:3653:3865:3866:3867:3868:3870:4250:4321:4361:4605:5007:6117:7901:7903:9121:10004:10400:10848:11232:11658:11914:12049:12297:12740:12760:12895:13069:13184:13229:13311:13357:13439:14181:14659:14721:21080:21220:21627:30054:30070:30090:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.14.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:39,LUA_SUMMARY:none
X-HE-Tag: silk22_63dfa8e714b22
X-Filterd-Recvd-Size: 2042
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Thu,  5 Sep 2019 09:28:06 +0000 (UTC)
Message-ID: <f65bf8e7bc3234358d5956f94e3b4df81bc204e6.camel@perches.com>
Subject: Re: [PATCH] media: siano: Use the correct style for SPDX License
 Identifier
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nishad Kamdar <nishadkamdar@gmail.com>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 05 Sep 2019 02:28:05 -0700
In-Reply-To: <20190905055614.7958918b@coco.lan>
References: <20190831151147.GA7082@nishad>
         <20190904153432.7fb54f02@coco.lan> <20190904183608.GA495@kroah.com>
         <20190904160010.4532c3f5@coco.lan> <20190905055430.GA23826@kroah.com>
         <20190905055614.7958918b@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-09-05 at 05:56 -0300, Mauro Carvalho Chehab wrote:
> I'll accept
> this patch and keep such rule in mind for next SPDX changes.
> 
> Anyway, with regards to script, we need to change the rules in order to
> allow adding SPDX for python scripts, as otherwise the addition of SPDX
> headers may cause regressions.

Not really.

$ git grep -n '^# SPDX-License-Identifier' -- '*.py' | wc -l
62
$ git grep -n '^# SPDX-License-Identifier' -- '*.py' | \
  cut -f2 -d: | sort | uniq -c
     32 1
     27 2
      3 3
$ git grep -n '^# SPDX-License-Identifier' -- '*.py' | \
  cut -f1 -d: | xargs ./scripts/spdxcheck.py --verbose

License files:               14
Exception files:              2
License IDs                  19
Exception IDs                 2

Files checked:               62
Lines checked:               95
Files with SPDX:             62
Files with errors:            0


