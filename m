Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCCC837CF5
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 21:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbfFFTIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 15:08:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60260 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbfFFTIg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 15:08:36 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8A59A283ED2;
        Thu,  6 Jun 2019 20:08:34 +0100 (BST)
Date:   Thu, 6 Jun 2019 21:08:31 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com, Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>
Subject: Re: [PATCH 0/5] media: Access videobuf2 buffers via an accessor
Message-ID: <20190606210831.0ba7b354@collabora.com>
In-Reply-To: <0647e37ad859aa3ada953c6a202584622b8dcada.camel@collabora.com>
References: <20190606154426.6899-1-ezequiel@collabora.com>
        <20190606194316.080288c2@collabora.com>
        <0647e37ad859aa3ada953c6a202584622b8dcada.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 06 Jun 2019 15:13:00 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> On Thu, 2019-06-06 at 19:43 +0200, Boris Brezillon wrote:
> > On Thu,  6 Jun 2019 12:44:21 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >   
> > > Hi,
> > > 
> > > This patchset introduces a new vb2_get_buffer accessor and then
> > > uses it on all the drivers that are accessing videobuf2
> > > private buffer array directly.  
> > 
> > Just curious, how did you find all occurrences of direct q->bufs[]
> > accesses? If you used a cocci script it might be worth submitting it so
> > we don't end up with new offenders of the "don't access q->bufs[]
> > directly" rule.
> >   
> 
> No, I just inspected the code and tried a few grep variants.

Okay.

> 
> Hopefully, I haven't missed any!
> 
> > > I'm skipping Intel IPU3 driver here, since the code goes beyond
> > > just accessing the buffer. It also modifies the buffer queue
> > > directly. I believe this driver would need some more cleanup
> > > and love from its maintainers.
> > > 
> > > Note that OMAP2/OMAP3 display driver is videobuf1 and so not
> > > affected by this change.
> > > 
> > > Lastly, note that I'm doing the minimum changes to drivers I can't test,
> > > only using the new accessor and avoiding any further changes.  
> > 
> > Can you also add a patch to remove the private buf pointers array in the
> > cedrus driver?
> >   
> 
> You mean removing the dst_bufs field?

Yes.

> 
> I can but it's not part of this series, is it?

Fair enough.

> 
> And I'd rather someone else test it, as my cedrus boards
> are not wired at the moment.

I guess we can ask Jernej, Jonas, Paul or Maxime if they can test.
