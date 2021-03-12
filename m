Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF893389E2
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 11:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhCLKUC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 05:20:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbhCLKTd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 05:19:33 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43FA68F9;
        Fri, 12 Mar 2021 11:19:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615544372;
        bh=4WVLNWsi0vGsr2BYi2E+FHBor319xTVMivfKBNEC2nk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b4gaPxeiNSII5ZsDx7Xv4IatsN/uodYX4TQU7WbyhBK+jGyV85/lgoxqsMjWc9OH5
         pculN6iZ7LUXS/LtGW6fFlYr2OTOhRPIIOc1Nz6jXHGHQmCDYDvZHXYmpEZjpwgnTd
         JHCG5u2+Fq4vsW7+hKWLbb6vbORXx6/lOgyWiKFI=
Date:   Fri, 12 Mar 2021 12:18:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Subject: Re: [PATCH v2 4/6] media: uvcvideo: set error_idx to count on EACCESS
Message-ID: <YEtAEUbJr2mosKow@pendragon.ideasonboard.com>
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-5-ribalda@chromium.org>
 <e5860193-a672-96b8-9a40-5f6d77dd4783@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e5860193-a672-96b8-9a40-5f6d77dd4783@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 12, 2021 at 08:14:13AM +0100, Hans Verkuil wrote:
> On 11/03/2021 23:19, Ricardo Ribalda wrote:
> > According to the doc:
> > The, in hindsight quite poor, solution for that is to set error_idx to
> > count if the validation failed.
> 
> I think this needs a bit more explanation. How about this:
> 
> "If an error is found when validating the list of controls passed with
> VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to indicate
> to userspace that no actual hardware was touched.
> 
> It would have been much nicer of course if error_idx could point to the
> control index that failed the validation, but sadly that's not how the
> API was designed."

Here's what I commented on v1:

The [V4L2 spec] states:

"This check is done to avoid leaving the hardware in an inconsistent
state due to easy-to-avoid problems. But it leads to another problem:
the application needs to know whether an error came from the validation
step (meaning that the hardware was not touched) or from an error during
the actual reading from/writing to hardware."

I'm not sure this is correct though. -EACCES is returned by
__uvc_ctrl_get() when the control is found and is a write-only control.
The uvc_ctrl_get() calls for the previous controls will have potentially
touched the device to read the current control value if it wasn't cached
already, to this contradicts the rationale from the specification.

I understand the need for this when setting controls, but when reading
them, it's more puzzling, as the interactions with the hardware to read
the controls are not supposed to affect the hardware state in a way that
applications should care about. It may be an issue in the V4L2
specification.

> > 
> > Fixes v4l2-compliance:
> > Control ioctls (Input 0):
> >                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> After improving the commit log you can add my:
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 157310c0ca87..36eb48622d48 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1073,7 +1073,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
> >  		ret = uvc_ctrl_get(chain, ctrl);
> >  		if (ret < 0) {
> >  			uvc_ctrl_rollback(handle);
> > -			ctrls->error_idx = i;
> > +			ctrls->error_idx = (ret == -EACCES) ?
> > +						ctrls->count : i;
> >  			return ret;
> >  		}
> >  	}

-- 
Regards,

Laurent Pinchart
