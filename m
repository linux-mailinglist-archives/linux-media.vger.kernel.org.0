Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EDB3B2FF7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 15:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhFXNbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 09:31:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhFXNbe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 09:31:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCFAA613C3;
        Thu, 24 Jun 2021 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624541355;
        bh=h70nRGod0M7cItycXFNIenZ2aFCNyMyKeP1QnSyOXIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aJzt5kNViiP1ZEz8Nt1sazW+J8SA+wFcKnwWMJd+yLI8xzGyZfB6G9Kx41HUexYQJ
         iS+axL81+sAdTopFu6Z1fM54ehwSwGvkcCkSMi8XTqB/jbd8qgistH21/hcvp1EcD0
         wCGio9r8YQEOqr0aTaAKniU7uedo4Mg14EkS1J40=
Date:   Thu, 24 Jun 2021 15:29:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNSIqSQeefzai4fW@kroah.com>
References: <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
 <m3r1gt5hzm.fsf@t19.piap.pl>
 <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
 <m3mtrh5evo.fsf@t19.piap.pl>
 <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
 <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
 <m3bl7v6er0.fsf@t19.piap.pl>
 <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
 <YNR9CS/PfG7s1e71@kroah.com>
 <m3wnqj4ct3.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3wnqj4ct3.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 03:22:48PM +0200, Krzysztof Hałasa wrote:
> Hi Greg,
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > +// SPDX-License-Identifier: GPL-2.0
> 
> > Putting the above line on a file _IS_ a legal declaration that the file
> > is released under GPL-2.0.  It's pretty simple :)
> 
> Do you think putting this line anywhere, in any file, does it?

Yes.

> That would be crazy.

Nope, that's how license declarations work.  Please discuss this with a
lawyer if you are confused.

> How about a book, e.g. describing a patch submission process (but not
> a copy of kernel's Documentation). The same?

That does not make sense, please explain.

> Also - in all countries? Most of them?

Yes.

> Come on.
> 
> Then why would we need the Signed-off-by?

S-o-b is a DIFFERENT thing entirely.   Please go read the DCO for what
you are agreeing to there, it is a declaration for what you are doing.

> From my perspective, the SPDX-License-Identifier is only meaningful when
> the file is actually a part of the kernel, or if, at least, it's been
> presented for merge, with Signed-off-by etc.

Not true at all, sorry.  Same for a Copyright line.  Again, if you have
questions about this, please contact your company lawyer, they will be
glad to explain it in detail to you.

greg k-h
