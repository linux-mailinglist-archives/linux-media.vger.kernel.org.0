Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60AD3B8A79
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 07:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392287AbfITFaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 01:30:14 -0400
Received: from smtprelay0147.hostedemail.com ([216.40.44.147]:48132 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390482AbfITFaN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 01:30:13 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id C534080422AC;
        Fri, 20 Sep 2019 05:30:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::,RULES_HIT:41:355:379:599:800:960:967:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2559:2564:2682:2685:2693:2828:2859:2892:2895:2917:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6117:6119:7652:7774:7903:8527:8985:9010:9025:9040:10004:10400:10562:10848:10967:11232:11473:11658:11914:12043:12296:12297:12555:12740:12760:12895:12986:13439:14096:14097:14181:14659:14721:21080:21433:21627:21740:21819:30021:30026:30054:30060:30070:30075:30079:30090:30091,0,RBL:error,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: honey36_3b89e0c6eb21c
X-Filterd-Recvd-Size: 3226
Received: from [10.10.16.41] (unknown [113.161.206.70])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Fri, 20 Sep 2019 05:30:08 +0000 (UTC)
Message-ID: <cfbe9a092f60f1ce5d1fb3ab5260dd56193bd8fb.camel@perches.com>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile
 documentation
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Thu, 19 Sep 2019 22:29:33 -0700
In-Reply-To: <20190919070856.GG2959@kadam>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
         <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
         <20190918123620.GA6306@pendragon.ideasonboard.com>
         <20190918105728.24e7eb48@coco.lan>
         <20190918172705.GC4734@pendragon.ideasonboard.com>
         <20190918154831.3dd0d040@coco.lan> <20190919070856.GG2959@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-09-19 at 10:08 +0300, Dan Carpenter wrote:
> On Wed, Sep 18, 2019 at 03:48:31PM -0300, Mauro Carvalho Chehab wrote:
> > Em Wed, 18 Sep 2019 20:27:05 +0300
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> > 
> > > > Anyway, not sure if the other sub-maintainers see the same way. From my side,
> > > > I prefer not to be c/c, as this is just more noise, as I just rely on
> > > > patchwork for media patches. What about changing this to:
> > > > 
> > > > 	Patches for the media subsystem should be sent to the media mailing list
> > > > 	at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > > 	HTML will be automatically rejected by the mail server. It could be wise 
> > > > 	to also copy the sub-maintainer(s).  
> > > 
> > > That works for me. As this is really a personal preference, is there a
> > > way it could be encoded in MAINTAINERS in a per-person fashion ?
> > > Something that would allow you to opt-out from CC from linux-media (but
> > > possibly opt-in for other parts of the kernel), and allow me to opt-in
> > > for the drivers I maintain ?
> > 
> > I don't think so. Perhaps we could add, instead, something like that at the
> > sub-maintainers section of the profile.
> 
> Of course there is a way to add yourself as a maintainer for a specific
> .c file...  Maybe people feel like MAINTAINERS is too crowded?
> 
> We could update get_maintainer.pl to grep the .c files for a specific
> tag instead of putting everything in a centralized MAINTAINERS file.

Another option is to split the MAINTAINERS file into multiple
distributed files.  get_maintainer.pl already supports that.

https://lwn.net/Articles/730509/
https://lore.kernel.org/lkml/1501350403.5368.65.camel@perches.com/

> But it doesn't make sense to try store that information MY BRAIN!  I
> can't remember anything from one minute to the next so I have no idea
> who maintains media submodules...

Nor I.  Nor should I have to.


