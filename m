Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99BA20C05D
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2020 10:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgF0Itj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jun 2020 04:49:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:38308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgF0Itj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jun 2020 04:49:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25C6920768;
        Sat, 27 Jun 2020 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593247778;
        bh=hJ/9GrC67f1tuUmfTLQDxK1x8SfKFDzbXZk5X543OJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0nJFoJbJkMyU7/kNRsXs2kWkdzWiQoDSWLm4xutD0u9RnZpQGX48yo0DqxzhndvSC
         7HXz24A4/et7gKP4ACOwimMhIpexj4eBWfYq60JH8s3e/MUdDGeCgnmp33g6mh38Hb
         1nWDzAC6NQYplB6GQGlo6nXAghG6RQjwHuQjznGA=
Date:   Sat, 27 Jun 2020 10:49:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC
         Campus <bkkarthik@pesu.pes.edu>, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: usbvision: removing prohibited space
 before ',' (ctx:WxW)
Message-ID: <20200627084932.GA1560170@kroah.com>
References: <20200626143205.xns6nwggskssujao@pesu-pes-edu>
 <CAAhDqq0tSftPxMWGeVy3mp4DGDN3o0uQwTqVbjYUwjqzWpbibQ@mail.gmail.com>
 <20200627050745.GD226238@kroah.com>
 <f73c5a69-1bf9-d80d-2399-ef18ce78b8ac@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f73c5a69-1bf9-d80d-2399-ef18ce78b8ac@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 27, 2020 at 10:28:31AM +0200, Hans Verkuil wrote:
> On 27/06/2020 07:07, Greg Kroah-Hartman wrote:
> > 
> > A: http://en.wikipedia.org/wiki/Top_post
> > Q: Were do I find info about this thing called top-posting?
> > A: Because it messes up the order in which people normally read text.
> > Q: Why is top-posting such a bad thing?
> > A: Top-posting.
> > Q: What is the most annoying thing in e-mail?
> > 
> > A: No.
> > Q: Should I include quotations after my reply?
> > 
> > http://daringfireball.net/2007/07/on_top
> > 
> > On Fri, Jun 26, 2020 at 11:42:49AM -0400, B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC Campus wrote:
> >> Oh, I'm sorry but wouldn't it be helpful if we had a file that lists
> >> all drivers that are scheduled for removal?
> > 
> > The TODO file in the directory for the driver should have this
> > information in it.  I don't know if all of the media drivers have this,
> > if not, then there is no way you could have known this.
> 
> They have, and in addition the Kconfig entry will mention that the driver
> is deprecated.
> 
> TODO of usbvision:
> 
> The driver is deprecated and scheduled for removal by the end
> of 2020.
> 
> In order to prevent removal the following actions would have to
> be taken:
> 
> - clean up the code
> - convert to the vb2 framework
> - fix the disconnect and free-on-last-user handling (i.e., add
>   a release callback for struct v4l2_device and rework the code
>   to use that correctly).

Ah, great, nevermind then!

B K, your wish is already granted, the text is present, you just needed
to have noticed it :)

greg k-h
