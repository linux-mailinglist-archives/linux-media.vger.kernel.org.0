Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3041820C06F
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2020 11:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgF0JUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jun 2020 05:20:18 -0400
Received: from smtprelay0206.hostedemail.com ([216.40.44.206]:58100 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725850AbgF0JUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jun 2020 05:20:18 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 214C4837F24C;
        Sat, 27 Jun 2020 09:20:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 30,2,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:966:967:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2198:2199:2200:2393:2525:2553:2565:2682:2685:2693:2731:2828:2859:2892:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4385:5007:6119:6248:7809:7875:7903:7904:8531:9025:9040:9388:9389:9392:10010:10400:10848:11232:11257:11658:11914:12043:12297:12438:12555:12663:12740:12760:12895:12986:13255:13439:14096:14097:14181:14659:14721:21063:21067:21080:21324:21433:21451:21627:21740:21773:21795:21819:21939:21987:30012:30021:30054:30075:30083:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:1:0,LFtime:4,LUA_SUMMARY:none
X-HE-Tag: week56_580e02926e5c
X-Filterd-Recvd-Size: 3605
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Sat, 27 Jun 2020 09:20:15 +0000 (UTC)
Message-ID: <3f3cc81521d405c62a83650c9315c9ddbf2135aa.camel@perches.com>
Subject: Re: [PATCH] staging: media: usbvision: removing prohibited space
 before ',' (ctx:WxW)
From:   Joe Perches <joe@perches.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC
         Campus <bkkarthik@pesu.pes.edu>, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date:   Sat, 27 Jun 2020 02:20:14 -0700
In-Reply-To: <20200627084932.GA1560170@kroah.com>
References: <20200626143205.xns6nwggskssujao@pesu-pes-edu>
         <CAAhDqq0tSftPxMWGeVy3mp4DGDN3o0uQwTqVbjYUwjqzWpbibQ@mail.gmail.com>
         <20200627050745.GD226238@kroah.com>
         <f73c5a69-1bf9-d80d-2399-ef18ce78b8ac@xs4all.nl>
         <20200627084932.GA1560170@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2020-06-27 at 10:49 +0200, Greg Kroah-Hartman wrote:
> On Sat, Jun 27, 2020 at 10:28:31AM +0200, Hans Verkuil wrote:
> > On 27/06/2020 07:07, Greg Kroah-Hartman wrote:
> > > A: http://en.wikipedia.org/wiki/Top_post
> > > Q: Were do I find info about this thing called top-posting?
> > > A: Because it messes up the order in which people normally read text.
> > > Q: Why is top-posting such a bad thing?
> > > A: Top-posting.
> > > Q: What is the most annoying thing in e-mail?
> > > 
> > > A: No.
> > > Q: Should I include quotations after my reply?
> > > 
> > > http://daringfireball.net/2007/07/on_top
> > > 
> > > On Fri, Jun 26, 2020 at 11:42:49AM -0400, B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC Campus wrote:
> > > > Oh, I'm sorry but wouldn't it be helpful if we had a file that lists
> > > > all drivers that are scheduled for removal?
> > > 
> > > The TODO file in the directory for the driver should have this
> > > information in it.  I don't know if all of the media drivers have this,
> > > if not, then there is no way you could have known this.
> > 
> > They have, and in addition the Kconfig entry will mention that the driver
> > is deprecated.
> > 
> > TODO of usbvision:
> > 
> > The driver is deprecated and scheduled for removal by the end
> > of 2020.
> > 
> > In order to prevent removal the following actions would have to
> > be taken:
> > 
> > - clean up the code
> > - convert to the vb2 framework
> > - fix the disconnect and free-on-last-user handling (i.e., add
> >   a release callback for struct v4l2_device and rework the code
> >   to use that correctly).
> 
> Ah, great, nevermind then!
> 
> B K, your wish is already granted, the text is present, you just needed
> to have noticed it :)
> 
> greg k-h

You should mark the entry in MAINTAINERS as obsolete
so checkpatch tells people not to send patches.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04fceaee5200..7c136018d153 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17906,7 +17906,7 @@ F:	include/uapi/linux/uvcvideo.h
 USB VISION DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
-S:	Odd Fixes
+S:	Odd Fixes / Obsolete
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/staging/media/usbvision/


