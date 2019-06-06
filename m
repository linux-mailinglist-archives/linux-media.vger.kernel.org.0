Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA12137BF2
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 20:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbfFFSNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 14:13:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59954 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfFFSNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 14:13:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E2442260D5F
Message-ID: <0647e37ad859aa3ada953c6a202584622b8dcada.camel@collabora.com>
Subject: Re: [PATCH 0/5] media: Access videobuf2 buffers via an accessor
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com, Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>
Date:   Thu, 06 Jun 2019 15:13:00 -0300
In-Reply-To: <20190606194316.080288c2@collabora.com>
References: <20190606154426.6899-1-ezequiel@collabora.com>
         <20190606194316.080288c2@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-06-06 at 19:43 +0200, Boris Brezillon wrote:
> On Thu,  6 Jun 2019 12:44:21 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> 
> > Hi,
> > 
> > This patchset introduces a new vb2_get_buffer accessor and then
> > uses it on all the drivers that are accessing videobuf2
> > private buffer array directly.
> 
> Just curious, how did you find all occurrences of direct q->bufs[]
> accesses? If you used a cocci script it might be worth submitting it so
> we don't end up with new offenders of the "don't access q->bufs[]
> directly" rule.
> 

No, I just inspected the code and tried a few grep variants.

Hopefully, I haven't missed any!

> > I'm skipping Intel IPU3 driver here, since the code goes beyond
> > just accessing the buffer. It also modifies the buffer queue
> > directly. I believe this driver would need some more cleanup
> > and love from its maintainers.
> > 
> > Note that OMAP2/OMAP3 display driver is videobuf1 and so not
> > affected by this change.
> > 
> > Lastly, note that I'm doing the minimum changes to drivers I can't test,
> > only using the new accessor and avoiding any further changes.
> 
> Can you also add a patch to remove the private buf pointers array in the
> cedrus driver?
> 

You mean removing the dst_bufs field?

I can but it's not part of this series, is it?

And I'd rather someone else test it, as my cedrus boards
are not wired at the moment.
 
> > `
> > Thanks,
> > Ezequiel
> > 
> > Ezequiel Garcia (5):
> >   media: vb2: Introduce a vb2_get_buffer accessor
> >   media: mtk-jpeg: Use vb2_get_buffer
> >   media: mtk-vcodec: Use vb2_get_buffer
> >   media: sti: Use vb2_get_buffer
> >   media: rockchip: Use vb2_get_buffer
> > 
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c    |  2 +-
> >  .../media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 +++++++++---
> >  drivers/media/platform/sti/hva/hva-v4l2.c      |  4 +++-
> >  .../media/rockchip/vpu/rockchip_vpu_drv.c      |  9 ++++++---
> >  include/media/videobuf2-core.h                 | 18 ++++++++++++++++++
> >  5 files changed, 37 insertions(+), 8 deletions(-)
> > 


