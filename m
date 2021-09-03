Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E892400125
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 16:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbhICOWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 10:22:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234951AbhICOWP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Sep 2021 10:22:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C939A601FF;
        Fri,  3 Sep 2021 14:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630678875;
        bh=HydASXwy+OG7t06UydQL58Z+NYESzA/qxRca/WKmqm8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fWB4hpRyMwTxRsz5N1yAGb2CAovyLLRtOtfHktsdzklzbOFbXqcSpfpHUlQ16cGiE
         0WusgNdrvpJa9HXWuX0Dbpek/65thQzCGMW7zL1WgHVFrgYTd4VJx1QKGkEzmwf+mz
         wiaCyX3kYrnnWucJEHzJbjKYOlsAW9ZzIiqTjWuGzeFxRLkFHI0bMgTiHojHtqgAzN
         vjC4zsNUmooNgw2yMRJUFwGOEZV/oCyaTtNdzaE1r+foBWPyYYSJBt/p3ZP2HNwm1p
         LPoakjI8SYur8iCE17q1iQ1GgPqT7Q643QAULo35PFj6o0EtbO9faJsewlja4Mjlbx
         /xHy65gLFQ3ZA==
Date:   Fri, 3 Sep 2021 16:21:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [GIT PULL FOR v5.16] uvcvideo v4l2-compliance fixes
Message-ID: <20210903162112.2cc752ed@coco.lan>
In-Reply-To: <YTIX8oXT8KOQlT2C@pendragon.ideasonboard.com>
References: <YSNsXylafQPuKH4H@pendragon.ideasonboard.com>
        <20210903140421.1b021b6f@coco.lan>
        <YTIX8oXT8KOQlT2C@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 3 Sep 2021 15:41:22 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro, 
> 
> On Fri, Sep 03, 2021 at 02:04:27PM +0200, Mauro Carvalho Chehab wrote:
> > Em Mon, 23 Aug 2021 12:37:35 +0300
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> >   
> > > Hi Mauro,
> > > 
> > > The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:
> > > 
> > >   media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://linuxtv.org/pinchartl/media.git tags/uvc-next-20210823
> > > 
> > > for you to fetch changes up to 2bc2b78476b4bc5690186c2b9a4dd565be6a9913:
> > > 
> > >   media: uvcvideo: Don't spam the log in uvc_ctrl_restore_values() (2021-08-23 12:31:04 +0300)
> > > 
> > > This contains a subset of "[PATCH v10 00/21] Fix v4l2-compliance errors"
> > > as 17 out of the 21 patches are ready to go and don't need to be
> > > delayed.
> > > 
> > > ----------------------------------------------------------------
> > > - uvcvideo v4l2-compliance fixes
> > > 
> > > ----------------------------------------------------------------
> > > Hans Verkuil (1):
> > >       media: uvcvideo: Don't spam the log in uvc_ctrl_restore_values()
> > > 
> > > Ricardo Ribalda (16):
> > >       media: v4l2-ioctl: Fix check_ext_ctrls
> > >       media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
> > >       media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
> > >       media: v4l2-ioctl: S_CTRL output the right value
> > >       media: uvcvideo: Remove s_ctrl and g_ctrl
> > >       media: uvcvideo: Set capability in s_param
> > >       media: uvcvideo: Return -EIO for control errors
> > >       media: uvcvideo: refactor __uvc_ctrl_add_mapping
> > >       media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
> > >       media: uvcvideo: Use dev->name for querycap()
> > >       media: uvcvideo: Set unique vdev name based in type
> > >       media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE  
> > 
> > Patches applied.
> >   
> > >       media: uvcvideo: Use control names from framework
> > >       media: uvcvideo: Check controls flags before accessing them
> > >       media: uvcvideo: Set error_idx during ctrl_commit errors  
> > 
> > I didn't apply those three. The first one seems to be causing
> > memory leaks, and the other two are dependent on the first one.  
> 
> Ricardo has replied to your review.

OK. Patches applied.


Thanks,
Mauro
