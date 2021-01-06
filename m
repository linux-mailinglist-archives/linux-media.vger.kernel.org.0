Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587E82EC595
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 22:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbhAFVSc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 16:18:32 -0500
Received: from smtprelay0102.hostedemail.com ([216.40.44.102]:57798 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726379AbhAFVSc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 16:18:32 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id D782D100E7B45;
        Wed,  6 Jan 2021 21:17:50 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:968:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3870:3871:3872:3874:4321:5007:6691:7652:7903:10004:10400:10848:11232:11658:11914:12043:12297:12740:12760:12895:13069:13095:13311:13357:13439:14181:14659:14721:21080:21433:21451:21627:21740:30029:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: love44_6310349274e4
X-Filterd-Recvd-Size: 2444
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf01.hostedemail.com (Postfix) with ESMTPA;
        Wed,  6 Jan 2021 21:17:49 +0000 (UTC)
Message-ID: <c5781c80a582cc68e1ae1bdc106c50cb263f81bf.camel@perches.com>
Subject: Re: [PATCH] media: atomisp: ov2722: replace hardcoded function name
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Filip Kolev <fil.kolev@gmail.com>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Date:   Wed, 06 Jan 2021 13:17:47 -0800
In-Reply-To: <20210106193633.GK2809@kadam>
References: <20210105202945.26913-1-fil.kolev@gmail.com>
         <X/VsF364jpGz6oze@kroah.com>
         <dcdda829-89d6-badd-4f22-72d95d24e9e3@gmail.com>
         <X/X45909l1Tk7Bni@kroah.com>
         <c9284a7f1443146b3885e8ceae3dcf113c531a36.camel@perches.com>
         <20210106193633.GK2809@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-01-06 at 22:36 +0300, Dan Carpenter wrote:
> On Wed, Jan 06, 2021 at 10:25:26AM -0800, Joe Perches wrote:
> > On Wed, 2021-01-06 at 18:52 +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Jan 06, 2021 at 07:43:42PM +0200, Filip Kolev wrote: 
> > > > On 06-Jan-21 09:51, Greg Kroah-Hartman wrote:
> > > > > On Tue, Jan 05, 2021 at 10:29:18PM +0200, Filip Kolev wrote:
> > > > > > There is a debug message using hardcoded function name instead of the
> > > > > > __func__ macro. Replace it.
> > > > > > 
> > > > > > Report from checkpatch.pl on the file:
> > > > > > 
> > > > > > WARNING: Prefer using '"%s...", __func__' to using 'ov2722_remove', this function's name, in a string
> > > > > > +	dev_dbg(&client->dev, "ov2722_remove...\n");
[]
> > There are quite a lot of these relatively useless function tracing like
> > uses in the kernel:
> > 
> > $ git grep -P '"%s[\.\!]*\\n"\s*,\s*__func__\s*\)' | wc -l
> > 1065
> 
> These are printing other stuff besides just the function name.

No, these are printing _only_ the function name.

> Maybe grep for '", __func__\)'?

No, that wouldn't work as there are many many uses like:

	printk('%s: some string\n", __func__);


