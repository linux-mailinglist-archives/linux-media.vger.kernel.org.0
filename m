Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C546A372D40
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 17:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhEDPtq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 11:49:46 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:58072 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230256AbhEDPtq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 May 2021 11:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1620143321; bh=i/DscfyocaLXVPs/tq8JAhNd8zHh2Pe2i8Xk7pjc6tw=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=SaqjVcCDXUJFTlvrG+JFn/T9gKzU8LYdN88S+/1wWVpDpqks3bibcQdAu6NgTWRGE
         I1HgCFr02pr8dPbWU2nohTDyVP2FVObN9UPrduoHja6OXrrkle5IUSbwzEy9htlOHs
         B8adLEkja898epS1QCzZR/6Qj6Zzdy2joRq/XwW8=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Tue,  4 May 2021 17:48:41 +0200 (CEST)
X-EA-Auth: ASSLxZ0NBX1lWQ7iVfQIVWKVqHIffGnrW3jbI3eWgAd6GVbDR26vByddwu1ZsTT3EQT/jNXpwthNMtJMvt7VVMiZx+p7/4S8
Date:   Tue, 4 May 2021 21:18:36 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pci: reposition braces as per
 coding style
Message-ID: <YJFs1KspK2aapNSk@dU2104>
References: <YIwk3KbVGRPJwKa4@dU2104>
 <20210430163327.GI3@paasikivi.fi.intel.com>
 <YIw4pUzTOHV6E9WZ@dU2104>
 <20210430171241.GJ3@paasikivi.fi.intel.com>
 <YIw7vsy+bYzFIQC0@dU2104>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIw7vsy+bYzFIQC0@dU2104>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 30, 2021 at 10:48:12PM +0530, Deepak R Varma wrote:
> On Fri, Apr 30, 2021 at 08:12:41PM +0300, Sakari Ailus wrote:
> > Hi Deepak,
> > 
> > On Fri, Apr 30, 2021 at 10:34:37PM +0530, Deepak R Varma wrote:
> > > On Fri, Apr 30, 2021 at 07:33:27PM +0300, Sakari Ailus wrote:
> > > > Hi Deepak,
> > > > 
> > > > If you're touching all these lines, I might do a little more. Please see
> > > > the comments below.
> > > > 
> > > Hello Sakari,
> > > I can definitely include other changes, but then it will be many different
> > > types of changes into a single patch. Will that be okay?
> > > 
> > > I was planning to address one issue per patch as I think the volume of
> > > change is going to be high.  I mentioned that in the notes section of the patch
> > > message.
> > 
> > I think I'd split the patch into smaller chunks if the result becomes too
> > big but I don't think it's necessary yet.
> > 
> > Splitting different kinds of simple cleanups into several patches takes
> > longer time to review when they're touching the same piece of code. As the
> > chunks in these patches have virtually no dependencies to other chunks,
> > it's fine to do several kinds of cleanups at once.
> 
> Okay, sure. That sounds good to me. I will include other related
> improvements in the same area and send split patch set accordingly. I will
> include this patch in the patch set.

Hello Sakari and all,
I have sent in the changes as suggested in a patch set with 5 individual
patches. I will wait for your review and feedback before I work on other
files.

Thank you,
deepak.

> 
> Thank you for the guidance.
> deepak.
> 
> > 
> > -- 
> > Kind regards,
> > 
> > Sakari Ailus


