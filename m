Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACD41ABC0E
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503094AbgDPJDM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:03:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502790AbgDPJC4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 05:02:56 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D05F206B9;
        Thu, 16 Apr 2020 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587027775;
        bh=lklmniicHQqU2dRj3nlOgj3Q5y6VhCBHRL82DuV/2+I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Cp4ZSLl0UuqOf8aaiJlWo3FBbXr1XwlhXuxdRtdzm4EgweU52BBIf4DjCb8lRIfJR
         +cF7JqvgzfJx3I0dv3veysGPLIXy+ZkWuB55dYnMgNzi8GZQP9Dlom5gYLiuodbQwG
         fuvNO9mFhk2SpTFV3l3G4zPTDKEGr9C/JBN1p1S4=
Date:   Thu, 16 Apr 2020 11:02:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: Script to build the media documentation as if it were a single
 book
Message-ID: <20200416110251.10b850e1@coco.lan>
In-Reply-To: <a3236eb0-2328-266e-b5b2-167e37b56c7a@xs4all.nl>
References: <20200414153739.30b58bdc@coco.lan>
        <e83dbd40-2a34-3bad-be5f-e451c3a5d020@xs4all.nl>
        <20200416092132.2cbfce7e@coco.lan>
        <c55b5aae-ffb5-3ca0-b855-1df4a2da08f9@xs4all.nl>
        <20200416095554.53566315@coco.lan>
        <a3236eb0-2328-266e-b5b2-167e37b56c7a@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 16 Apr 2020 10:06:28 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 16/04/2020 09:55, Mauro Carvalho Chehab wrote:
> > Em Thu, 16 Apr 2020 09:29:45 +0200
> > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >   
> >> On 16/04/2020 09:21, Mauro Carvalho Chehab wrote:  
> >>> Em Thu, 16 Apr 2020 09:01:55 +0200
> >>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >>>     
> >>>> On 14/04/2020 15:37, Mauro Carvalho Chehab wrote:    
> >>>     
> >>>>> ================================
> >>>>> Linux Kernel Media Documentation
> >>>>> ================================
> >>>>>
> >>>>> .. toctree::
> >>>>> 	:maxdepth: 4
> >>>>>
> >>>>>         admin-guide/index
> >>>>>         driver-api/index
> >>>>>         userspace-api/index      
> >>>>
> >>>> Wouldn't it make more sense to have the userspace-api before the admin-guide?    
> >>>
> >>> There, I just placed them on alphabetic order.
> >>>
> >>> But answering your question, that depends on the audience ;-)
> >>>
> >>> -
> >>>
> >>> Yet, assuming that we are doing a good job, I would expect a lot more
> >>> users than developers[1].    
> >>
> >> If you want to see what it looks like with userspace-api on top:
> >>
> >> https://hverkuil.home.xs4all.nl/spec/index.html
> >>
> >> I think it makes more sense that way.  
> > 
> > With the current content, I fully agree with you. However, take a look
> > at the RFC patch I just sent. It is just the start of something
> > (and it is not aligned yet with the latest Kconfig changes).
> > 
> > Anyway, my plan is to add something that a random media user could
> > find some useful information, and point to our Wiki pages where
> > it would make sense.  
> 
> But that's only useful for people who need to build their own kernel or do
> other admin tasks. That's a small group and it is usually a one-off thing.

Well, all Kernel developers need that. Also userspace developers that
may want to build test drivers. So, the ones potentially interested
on this chapter contains the group of people interested at the public
API.

Granted, once some Kernel developer gets familiar with the stuff 
contained there, the uAPI guide becomes a lot more interesting, but
this is true for any technical book:

at the beginning, the introductory chapters (with don't have much
details) are the more relevant ones, as they explain the basic concepts
that will be present at the rest of the book. Once you pass that, the
other chapters will be a lot more interesting, and those are the ones 
that people re-visit more often.

> 
> The vast majority is interested in the public APIs.
> 
> Regards,
> 
> 	Hans
> 
> >   
> >>
> >> Regards,
> >>
> >> 	Hans
> >>  
> >>>
> >>> [1] Granted, there are lots of gaps there for it to be a generic guide
> >>>     to media subsystem. I'm planning to improve the admin-guide in order
> >>>     to make it more consistent and useful for media users.
> >>>
> >>> The order there, IMHO, doesn't matter much, as someone accessing it from
> >>> LinuxTV.org would likely use this URL:
> >>>
> >>> 	https://linuxtv.org/docs.php
> >>>
> >>> Side note: I need to add a pointer to the admin guide there - and at the
> >>> wiki pages.
> >>>
> >>> Thanks,
> >>> Mauro
> >>>     
> >>  
> > 
> > 
> > 
> > Thanks,
> > Mauro
> >   
> 



Thanks,
Mauro
