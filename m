Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F79926DBA5
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgIQMes (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:34:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726951AbgIQMeX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:34:23 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1626A2087D;
        Thu, 17 Sep 2020 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600346034;
        bh=tdZKh1qLT5/CZgLEYm1IvQYFAkgpFAnpj9CITh0Zkqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H1VYO8wh+cqUCtIwF8Gg/BZkUMELrZ3utpX5LMxkJmTBAW3S1GIZicW2tVT1t3zpC
         bM18Uo9l2XCsLNapvssmLb91kGpS4dXeuvJ1AZD5JQBGCrUscMfBtsiIsZVhkZHKj4
         jaA66+mq3vHtmPSI35KnEWR5fJ9T2LvSvJkiwUYw=
Date:   Thu, 17 Sep 2020 14:34:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] media: usb: uvc: no need to check return value of
 debugfs_create functions
Message-ID: <20200917123426.GA3595353@kroah.com>
References: <20200818133608.462514-1-gregkh@linuxfoundation.org>
 <20200818133608.462514-7-gregkh@linuxfoundation.org>
 <20200818234719.GD2360@pendragon.ideasonboard.com>
 <20200917122550.GA5053@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917122550.GA5053@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 03:25:50PM +0300, Laurent Pinchart wrote:
> Hi Greg,
> 
> On Wed, Aug 19, 2020 at 02:47:19AM +0300, Laurent Pinchart wrote:
> > Hi Greg,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Aug 18, 2020 at 03:36:08PM +0200, Greg Kroah-Hartman wrote:
> > > When calling debugfs functions, there is no need to ever check the
> > > return value.  The function can work or not, but the code logic should
> > > never do something different based on this.
> > 
> > Is there no value in warning the user that something went wrong ? Silent
> > failures are harder to debug.
> 
> Could yous share your opinion about this ?

For debugfs, this isn't an issue, what can a user do with something like
"debugfs isn't working?  What does that mean???"

And if we _really_ want warnings like this, it should go into the
debugfs core, not require this to be done for every debugfs user, right?

debugfs is just there for kernel developers to help debug things, it's
not a dependancy on any userspace functionality, so if it works or not
should not be an issue for any user.

Unless that user is a kernel developer of course :)

thanks,

greg k-h
