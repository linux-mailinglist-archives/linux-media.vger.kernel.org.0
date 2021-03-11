Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C3E33789A
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234099AbhCKP6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:58:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50060 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234061AbhCKP6A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:58:00 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65A71879;
        Thu, 11 Mar 2021 16:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615478278;
        bh=uh0v20vIuAerIj2S1tG5H54I5B46Ush+Nb3Iwpomybs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I0LF6V+jDvhn51RT9PakCHBIk2FP3zx1PsFE4pqMeVqiPKlJZDp/2WPXk1550Q9DD
         48HcHgK5a2tUQpKijh0uZ7OARltXcY4gJ8W/IoFNfwiqARowKmBzqg0qQIO8XVlhzV
         rvmwG37dVm0/Stj5tt15e9V8M5hXOnpIdXu5u4w4=
Date:   Thu, 11 Mar 2021 17:57:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 03/10] media: uvcvideo: Return -EIO for control errors
Message-ID: <YEo95GqO0XEX4Cg0@pendragon.ideasonboard.com>
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-5-ribalda@chromium.org>
 <CANiDSCtw2q7UxMoZSMeE545WCxMs-WSHR2xbjG+xWL9CaBE3Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtw2q7UxMoZSMeE545WCxMs-WSHR2xbjG+xWL9CaBE3Aw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 11, 2021 at 03:08:22PM +0100, Ricardo Ribalda wrote:
> As discussed in the IRC with Hans
> 
> We need to specify in the commit message that this is most likely due
> to hw error.
> 
> On Thu, Mar 11, 2021 at 1:20 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Fixes v4l2-compliance:
> >
> > Control ioctls (Input 0):
> >                 fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
> >         test VIDIOC_G/S_CTRL: FAIL
> >                 fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

As this isn't supposed to happen, how do you reproduce this ? 

> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index f2f565281e63..5442e9be1c55 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -113,7 +113,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >         case 6: /* Invalid control */
> >         case 7: /* Invalid Request */

For cases 5-7 I think -EIO is fine, as the driver should really not call
this function with an invalid unit, control or request. If it does, it's
a bug in the driver (we can check the units and controls the device
claims to support, and the requests are defined by the UVC
specification), if it doesn't and the device still returns this error,
it's a bug on the device side.

> >         case 8: /* Invalid value within range */

For this case, however, isn't it valid for a device to return an error
if the control value isn't valid ? There's one particular code path I'm
concerned about, uvc_ioctl_default(UVCIOC_CTRL_QUERY) ->
uvc_xu_ctrl_query() -> uvc_query_ctrl(), where it could be useful for
userspace to know that the value it sets isn't valid.

> > -               return -EINVAL;
> > +               return -EIO;
> >         default: /* reserved or unknown */
> >                 break;
> >         }

-- 
Regards,

Laurent Pinchart
