Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8351B36FF5A
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 19:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhD3RSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 13:18:51 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:38966 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229750AbhD3RSv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 13:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619803075; bh=ojnJ555lXA46GF3/qKIyAUShuviwd+s4Ftf9ASPM424=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=Ro6898nhQabAFbhExawoG3OrpSeVplTWpiPtSGGYFx7zyBdOwP1+2gtO6UgAvEnev
         goGwDOExM6qWilF500x73krqgHvmRgyjcS9shUHnXfL8lJJo+FTEiM8ut4tUrkKU34
         40yqRl9Nw74v7vN2tBnQXGZVPR7l77sLhxVhrCY8=
Received: by 192.168.90.13 [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 30 Apr 2021 19:17:55 +0200 (CEST)
X-EA-Auth: c1gehlscvNEfQhgT4PN/cZce+z64ErNVj5he8oBiRfc/1rwcXcmA8TBoV4AqVJqBm3PHo3spQSTL9XjN5x4mx152xFjdHwQq
Date:   Fri, 30 Apr 2021 22:47:50 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pci: reposition braces as per
 coding style
Message-ID: <YIw7vsy+bYzFIQC0@dU2104>
References: <YIwk3KbVGRPJwKa4@dU2104>
 <20210430163327.GI3@paasikivi.fi.intel.com>
 <YIw4pUzTOHV6E9WZ@dU2104>
 <20210430171241.GJ3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430171241.GJ3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 30, 2021 at 08:12:41PM +0300, Sakari Ailus wrote:
> Hi Deepak,
> 
> On Fri, Apr 30, 2021 at 10:34:37PM +0530, Deepak R Varma wrote:
> > On Fri, Apr 30, 2021 at 07:33:27PM +0300, Sakari Ailus wrote:
> > > Hi Deepak,
> > > 
> > > If you're touching all these lines, I might do a little more. Please see
> > > the comments below.
> > > 
> > Hello Sakari,
> > I can definitely include other changes, but then it will be many different
> > types of changes into a single patch. Will that be okay?
> > 
> > I was planning to address one issue per patch as I think the volume of
> > change is going to be high.  I mentioned that in the notes section of the patch
> > message.
> 
> I think I'd split the patch into smaller chunks if the result becomes too
> big but I don't think it's necessary yet.
> 
> Splitting different kinds of simple cleanups into several patches takes
> longer time to review when they're touching the same piece of code. As the
> chunks in these patches have virtually no dependencies to other chunks,
> it's fine to do several kinds of cleanups at once.

Okay, sure. That sounds good to me. I will include other related
improvements in the same area and send split patch set accordingly. I will
include this patch in the patch set.

Thank you for the guidance.
deepak.

> 
> -- 
> Kind regards,
> 
> Sakari Ailus


