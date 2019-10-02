Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAECC917E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 21:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbfJBTJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 15:09:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38544 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729369AbfJBTIV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 15:08:21 -0400
Received: from pendragon.ideasonboard.com (unknown [132.205.229.212])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9F232BB;
        Wed,  2 Oct 2019 21:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570043299;
        bh=2bctw1IJ9Ns8CBUAHy20yJpmEISXz+Eqe/9J6CKHKTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MwopaARhx4nM+kSkI/jZ8TdgPb0PRQLQXQ3kEKbslzz8y3TJvdP4jMTmPWpJ/t2RW
         Amg8pJHOxjYmZO/PNPVq+m+3LzCOQG4lnizJXvXD1aauY/0jAu9L/6EHGfyJD6vlle
         0OveV+6E0PQpBFFe0t5CxJlCYEhSAR+SYu5QpsN8=
Date:   Wed, 2 Oct 2019 22:08:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergey Zakharchenko <doublef.mobile@gmail.com>
Cc:     Sergey Zakharchenko <szakharchenko@digital-loggers.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>,
        Auke Kok <auke-jan.h.kok@intel.com>
Subject: Re: [PATCH v2] media: uvcvideo: Add a quirk to force GEO GC6500
 Camera bits-per-pixel value
Message-ID: <20191002190805.GG5262@pendragon.ideasonboard.com>
References: <201910021929.ij7Rrmvk%lkp@intel.com>
 <20191002130102.97852-1-szakharchenko@digital-loggers.com>
 <20191002140814.GB5262@pendragon.ideasonboard.com>
 <CADYCxoOzwRQctuVaqEx40WgFLo4PY0sV4R11r+pn+Wu0jLzPng@mail.gmail.com>
 <CADYCxoNTBmX8RYf18xmX0B8xD_LvNJbZ5buyAgo5E9v14B3S_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADYCxoNTBmX8RYf18xmX0B8xD_LvNJbZ5buyAgo5E9v14B3S_A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On Wed, Oct 02, 2019 at 09:15:45PM +0400, Sergey Zakharchenko wrote:
> Sergey Zakharchenko <doublef.mobile@gmail.com>:
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> > > Do you think it would make sense to do this by default, without
> > > requiring a quirk ? Or are there cases where this calculation would lead
> > > to incorrect results while the bpp reported by the camera would be right
> > > ?
> >
> > The loop is a simplified version of the v4l2_fill_pixfmt() loop. The
> > calculation might need some checking, and might be invalid, in case
> > block_w/block_h format fields are significant (not 0 and not 1),
> > because then effective bits-per-pixel would seemingly be fractional,
> > and depend on the image dimensions if they weren't aligned; however I
> > see no formats using the block_w/block_h fields defined so far.
> 
> It's likely possible to directly replace the bpp-using computation in
> https://github.com/torvalds/linux/blob/2874c5fd284268364ece81a7bd936f3c8168e567/drivers/media/usb/uvc/uvc_driver.c#L636
> with a call to v4l2_fill_pixfmt() and the sizeimage it returns.
> However, bpp is used elsewhere, and it's hard to tell what it should
> be taken to be to in the hypothetical exotic cases I'm considering, so
> I'm reluctant to go that route.

Would it make sense to split the calculation from v4l2_fill_pixfmt() to
a helper function that the UVC driver could call ?

> I'm going to send v3 in an hour unless there are other suggestions.

-- 
Regards,

Laurent Pinchart
