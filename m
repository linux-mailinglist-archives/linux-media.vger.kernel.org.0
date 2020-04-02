Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B34B19CD7B
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 01:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390187AbgDBXaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 19:30:02 -0400
Received: from smtprelay0186.hostedemail.com ([216.40.44.186]:42506 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390160AbgDBXaC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Apr 2020 19:30:02 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 1E662180115BA;
        Thu,  2 Apr 2020 23:30:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1561:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3871:4321:5007:6120:6742:7901:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14659:21080:21611:21627:30034:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: ear56_1ce45487cda0f
X-Filterd-Recvd-Size: 1599
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Thu,  2 Apr 2020 23:29:58 +0000 (UTC)
Message-ID: <f8847ea6b8af08eaa49f142bbefefe7a8e2229eb.camel@perches.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hverkuil@xs4all.nl,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        laurent.pinchart@ideasonboard.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>
Date:   Thu, 02 Apr 2020 16:28:02 -0700
In-Reply-To: <20200402155323.6866b5c9@coco.lan>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
         <87eet6mgk7.fsf@intel.com> <20200402155323.6866b5c9@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-04-02 at 15:53 +0200, Mauro Carvalho Chehab wrote:

> I liked one of the suggestions of using "%p4cc" (or maybe something
> similar, if having a number there is a problem, like "%pAcc" or "%pfcc")

Using a number is not a problem.


