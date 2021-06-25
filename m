Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FEC3B3CF4
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 08:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhFYHB6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 03:01:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229922AbhFYHB5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 03:01:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B5D661400;
        Fri, 25 Jun 2021 06:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624604375;
        bh=VKXj5JQQkxkDMTbPDvpRlNGDFjj0Beb4Z5ufAQkXQQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zt6Xhe2YgP3mYsKF759VLR50hnx7/nKqYtI4PRBJR5wrvk3n03Y3SH8I2TwdLyitM
         ElOMsdrsW3AtGsZq/TYljY1oeiACAc0g8tl5bqBhW5/3ASzlI9Uo9QCzSeWWoMUBrM
         CBWIm3mv9EppDIcN63lPlk8HtmCSd3pP7+LYXf4Q=
Date:   Fri, 25 Jun 2021 08:59:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNV+1JSdyjWDYfwp@kroah.com>
References: <m3mtrh5evo.fsf@t19.piap.pl>
 <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
 <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
 <m3bl7v6er0.fsf@t19.piap.pl>
 <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
 <YNR9CS/PfG7s1e71@kroah.com>
 <m3wnqj4ct3.fsf@t19.piap.pl>
 <YNSJzgJ5xu2j+U2p@pendragon.ideasonboard.com>
 <YNSZ4fbboJokxZSx@kroah.com>
 <m3h7hm4h14.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3h7hm4h14.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 25, 2021 at 08:03:51AM +0200, Krzysztof Hałasa wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > I would not waste my time on code that does not have a signed-off-by on
> > it, otherwise the developer is obviously saying they do not want to
> > merge this as-is.
> 
> I would want it be be merged as-is, and would happily supply a SOB, but
> nobody would merge it at this point. This isn't a problem, though.
> 
> > And I think we all have plenty of code from
> > developers that actually want to have their patches merged.
> 
> Oh well. I want to have *MY* patch merged. That's exactly why I did what
> I did. I did state that I will sign if off when I get positive response,
> when the patch is ready to be merged. Isn't it clear?

Not clear at all, this is not how kernel development works.

Developers submit changes they are comfortable with and wish to get
merged, and reviewers review them and merge them if all is good.

Do not submit stuff that you do not feel comfortable with having merged
as that just wastes reviewer's time.

Are you helping to review code that developers submit but say they do
not want to have merged?

best of luck!

greg k-h
