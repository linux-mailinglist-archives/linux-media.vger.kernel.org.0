Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B187E3B300D
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 15:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhFXNg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 09:36:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhFXNg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 09:36:57 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0349501;
        Thu, 24 Jun 2021 15:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624541677;
        bh=6qFe25lAFpYqRWkfpn2PWiku/loxGKiPTH42srro7Zk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qg/EC/BvcI8fB4WDjBJRbqZFxWVfvjTj0Mo2NU06xm2Vb2mbBucYf5jATMamb3W3+
         61jZd/SGn4BTObsUfDkGKr3A7MigG21yklzNfDnC1mE3ywvFojI8WiG9FuNrtisYW0
         uLDHghKdq9PBT4CtLXwo/xt6Y43nrdmX5amcUE6o=
Date:   Thu, 24 Jun 2021 16:34:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNSJzgJ5xu2j+U2p@pendragon.ideasonboard.com>
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

Greg, on a side note, the discussion originated from
https://lore.kernel.org/linux-media/m3r1gt5hzm.fsf@t19.piap.pl/. I'll
quote Krzysztof so the discussion doesn't get split across multiple
places:

> > To spend time reviewing this code, I want to know it will be mergeable,
> > and that requires a SoB line. That's a blocker I'm afraid.
> 
> So how do you propose to solve the situation, in which my driver is
> rejected, but another persor takes it, makes changes (btw breaking it),
> and presents it as their own, and it's accepted? This is a paid work and
> I'm required to put in my employer's copyright over the code.
> I could have made this error once - but no more.
> 
> The code will be mergeable, as I already wrote. Why would I bother
> otherwise? But I cannot let that history to repeat itself.

Your opinion on this would be valuable too.

> Do you think putting this line anywhere, in any file, does it?
> That would be crazy.
> 
> How about a book, e.g. describing a patch submission process (but not
> a copy of kernel's Documentation). The same?
> 
> Also - in all countries? Most of them?
> 
> Come on.
> 
> Then why would we need the Signed-off-by?
> From my perspective, the SPDX-License-Identifier is only meaningful when
> the file is actually a part of the kernel, or if, at least, it's been
> presented for merge, with Signed-off-by etc.

Quoting Documentation/process/submitting-patches.rst:

Sign your work - the Developer's Certificate of Origin
------------------------------------------------------

To improve tracking of who did what, especially with patches that can
percolate to their final resting place in the kernel through several
layers of maintainers, we've introduced a "sign-off" procedure on
patches that are being emailed around.

The sign-off is a simple line at the end of the explanation for the
patch, which certifies that you wrote it or otherwise have the right to
pass it on as an open-source patch.  The rules are pretty simple: if you
can certify the below:

Developer's Certificate of Origin 1.1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) is
            maintained indefinitely and may be redistributed consistent with
            this project or the open source license(s) involved.

then you just add a line saying::

        Signed-off-by: Random J Developer <random@developer.example.org>


The SoB line doesn't convey any license information, that's specified
separately and explicitly in each file (usually in the form of an SPDX
tag, which is just a machine-parsable, short-hand version of a full
license header in text form).

-- 
Regards,

Laurent Pinchart
