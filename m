Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CD73B1A8F
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 14:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFWM67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 08:58:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38544 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhFWM66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 08:58:58 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E1C99AA;
        Wed, 23 Jun 2021 14:56:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624453000;
        bh=MOq5yt8/oq2a0B9Z3C+/bOxpANloWJvF0E5s3omCJS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=leq6EKfUOeunGG32fL0YLu5TTPeD5p+UygbcWb6aTKIFxPgkZF+PjDKNTx7q5v7WO
         5HT++Eoc7VotPXvROA6weF/arvUU15PXhjtJ5xarYiepgzMNFDjFcF5gwvjFe1ZJRQ
         pf25W9RHmD1OD/6v/7A0H1jK/ZPzRu00iLbNlgRk=
Date:   Wed, 23 Jun 2021 15:56:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: fix some NULL vs IS_ERR() checks
Message-ID: <YNMvarFl/KU1pGCG@pendragon.ideasonboard.com>
References: <YNH0WU7BcQ/60UNG@mwanda>
 <YNH87qd4eJOR296R@pendragon.ideasonboard.com>
 <20210622155858.GN1861@kadam>
 <YNKdqFNSrSBXVNqo@pendragon.ideasonboard.com>
 <20210623090325.GA2116@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210623090325.GA2116@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 12:03:26PM +0300, Dan Carpenter wrote:
> On Wed, Jun 23, 2021 at 05:34:16AM +0300, Laurent Pinchart wrote:
> > 
> > Do you think an annotation could still help, by making it explicit in
> > headers whether a function returns NULL or an error pointer, thus
> > helping developers get it right in the first place ?
> 
> Not really.  It wouldn't help with Smatch.  I really think error pointer
> bugs are handled pretty well currently.  Sometimes I have seen syzbot
> find them before the static checkers but I don't see them affecting
> users and production kernels.

I meant to ask if it would be useful for developers, not for smatch.
When I use a function and have to figure out whether to use IS_ERR() or
!= NULL, I first look at the header, and most of the time I then need to
find the corresponding implementation, wherever it may be. If we had an
annotation, the second step could be skipped. Of course the annotation
would need to match the implementation, and that's an area where smatch
could help.

> There are few other things that Smatch looks for like passing positives,
> valid pointers or NULLs to PTR_ERR().  I do wish that when functions
> return a mix of negative error codes, 0 and 1 that they had comment
> explaining what the 1 means.

-- 
Regards,

Laurent Pinchart
