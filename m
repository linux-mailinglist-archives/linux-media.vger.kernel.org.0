Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D233B2F2E
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 14:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhFXMmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 08:42:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231367AbhFXMl7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 08:41:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33787613F9;
        Thu, 24 Jun 2021 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624538379;
        bh=nKj38+Wzyi+tJFKbDI7NfmZggPELJNHWPYbGpEuAhfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uszB6u2QvBlPTNla/VdCFLDUsCctLOR2VNk9Zbfa871BFgTtJcBE8W7HLrUHnaE5f
         yG1ig9VgZvPoGghFPHqdWIfgOfKXi9lmX/ZYbUdqXOYuMU/687nIzTofGWv0fHi44/
         PV2FT19RbRSq+8ea5F4Jm/t3XdfuiomVJ1/obmcw=
Date:   Thu, 24 Jun 2021 14:39:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNR9CS/PfG7s1e71@kroah.com>
References: <m3wnqm5eqo.fsf@t19.piap.pl>
 <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
 <m3r1gt5hzm.fsf@t19.piap.pl>
 <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
 <m3mtrh5evo.fsf@t19.piap.pl>
 <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
 <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
 <m3bl7v6er0.fsf@t19.piap.pl>
 <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 03:10:34PM +0300, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> CC'ing Greg to get his expert opinion on the topic.
> 
> On Thu, Jun 24, 2021 at 06:57:55AM +0200, Krzysztof Hałasa wrote:
> > Hi Kieran, and others,
> > 
> > Kieran Bingham <kieran.bingham@ideasonboard.com> writes:
> > 
> > >>> The work is not published under GPL.
> > >
> > > This seems like an odd thing to say when your patch explicitly contains:
> > >
> > >> +++ b/drivers/media/i2c/ar0521.c
> > >> @@ -0,0 +1,1060 @@
> > >> +// SPDX-License-Identifier: GPL-2.0
> > 
> > Such tags have meaning only in the kernel context, when signed-off etc.

Huh?  It is a statement of the license of the file itself, it is
independent of "Signed-off-by:" which is a legal agreement of a totally
different thing and is independent of license type entirely.

> > Alone, they aren't legal statements, especially when I explicitly state
> > that it's not signed-off-by me yet. Nevertheless...

Putting the above line on a file _IS_ a legal declaration that the file
is released under GPL-2.0.  It's pretty simple :)

thanks,

greg k-h
