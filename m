Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262C03B31A7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 16:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhFXOpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 10:45:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:43478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230249AbhFXOpD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 10:45:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D170F613DA;
        Thu, 24 Jun 2021 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624545763;
        bh=e/VUPLUcS2+QL65BRNKsSnJsvm8jYUsqlgrW97FJOOM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rh1F0ZJBTk8EOCB6kQvWjJjTKEUVrzyuX728AuP3zfkXSr6cVBR+9in3mwZWiiCkt
         rx950JqVehyOtbV8X5GluqSrGaXz7qI7murY8QJYZB3rpZqaHkeXwGqd5s+xoCFGvW
         e3IhatNxyGv8p55m4w+HrpSRi9NmltuDHGKSGSMg=
Date:   Thu, 24 Jun 2021 16:42:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNSZ4fbboJokxZSx@kroah.com>
References: <m3r1gt5hzm.fsf@t19.piap.pl>
 <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
 <m3mtrh5evo.fsf@t19.piap.pl>
 <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
 <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
 <m3bl7v6er0.fsf@t19.piap.pl>
 <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
 <YNR9CS/PfG7s1e71@kroah.com>
 <m3wnqj4ct3.fsf@t19.piap.pl>
 <YNSJzgJ5xu2j+U2p@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YNSJzgJ5xu2j+U2p@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 04:34:06PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 24, 2021 at 03:22:48PM +0200, Krzysztof Hałasa wrote:
> > Hi Greg,
> > 
> > Greg KH <gregkh@linuxfoundation.org> writes:
> > 
> > > +// SPDX-License-Identifier: GPL-2.0
> > 
> > > Putting the above line on a file _IS_ a legal declaration that the file
> > > is released under GPL-2.0.  It's pretty simple :)
> 
> Greg, on a side note, the discussion originated from
> https://lore.kernel.org/linux-media/m3r1gt5hzm.fsf@t19.piap.pl/. I'll
> quote Krzysztof so the discussion doesn't get split across multiple
> places:
> 
> > > To spend time reviewing this code, I want to know it will be mergeable,
> > > and that requires a SoB line. That's a blocker I'm afraid.
> > 
> > So how do you propose to solve the situation, in which my driver is
> > rejected, but another persor takes it, makes changes (btw breaking it),
> > and presents it as their own, and it's accepted? This is a paid work and
> > I'm required to put in my employer's copyright over the code.
> > I could have made this error once - but no more.
> > 
> > The code will be mergeable, as I already wrote. Why would I bother
> > otherwise? But I cannot let that history to repeat itself.
> 
> Your opinion on this would be valuable too.

I would not waste my time on code that does not have a signed-off-by on
it, otherwise the developer is obviously saying they do not want to
merge this as-is.  And I think we all have plenty of code from
developers that actually want to have their patches merged.

thanks,

greg k-h
