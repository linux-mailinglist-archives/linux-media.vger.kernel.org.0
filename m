Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A57CC19E1AA
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 01:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgDCX5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 19:57:24 -0400
Received: from smtprelay0173.hostedemail.com ([216.40.44.173]:43072 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726060AbgDCX5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Apr 2020 19:57:24 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 874B2837F24C;
        Fri,  3 Apr 2020 23:57:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2110:2393:2559:2562:2828:2918:3138:3139:3140:3141:3142:3622:3865:3866:3867:3870:3871:3873:4321:5007:6120:6742:7901:10004:10400:10450:10455:10848:11232:11658:11914:12297:12740:12760:12895:13069:13071:13311:13357:13439:14180:14659:19904:19999:21060:21080:21324:21611:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: book21_232a483c7e13a
X-Filterd-Recvd-Size: 1743
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Fri,  3 Apr 2020 23:57:21 +0000 (UTC)
Message-ID: <cabfb02bf36b50463ebfe850ba642025ebeb88b2.camel@perches.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
From:   Joe Perches <joe@perches.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Date:   Fri, 03 Apr 2020 16:55:24 -0700
In-Reply-To: <20200403233647.GA4394@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
         <20200403102449.GB4882@pendragon.ideasonboard.com>
         <20200403104701.GC3172@kekkonen.localdomain>
         <e44e41317719727ea12aee4ff1e210dea796dd2f.camel@perches.com>
         <20200403233647.GA4394@kekkonen.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2020-04-04 at 02:36 +0300, Sakari Ailus wrote:
> Hi Joe,

Hi Sakari.

> How would these be different in functionality? fmt[2] won't be accessed if
> fmt[1] is not 'c' (including '\0'), just like on the line above. I find the
> original easier to read.

Oops. You are right of course.

cheers, Joe

