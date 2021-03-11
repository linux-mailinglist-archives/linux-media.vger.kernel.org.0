Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E6B33817C
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 00:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCKXay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 18:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCKXau (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 18:30:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1BEC061574;
        Thu, 11 Mar 2021 15:30:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31DB788F;
        Fri, 12 Mar 2021 00:30:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615505448;
        bh=2h5lGJQCPJsScbGJZXmDfBLLBZ1ji3Y0BJ/1ysIiqLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IsoTU+MlyE7zh9pe7SlLnYaRCxEMVwHPHA6n+R0I0ST8bl563bY+AKs/edJRFglSC
         Z8RDqTgb/NF+sbkBjF3/pnUQfS6JaQp8R32hSBMFSyJA6mmrGmIQhhdipHXlMjhZCI
         K2IPo2pDsx1bwfuJB9lFKPsJTCUfNZ0heAqg70Ho=
Date:   Fri, 12 Mar 2021 01:30:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 3/6] media: uvcvideo: Return -EIO for control errors
Message-ID: <YEqoBe5sQ+xP8PpY@pendragon.ideasonboard.com>
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-4-ribalda@chromium.org>
 <YEqevkojuvniSTFS@pendragon.ideasonboard.com>
 <CAPybu_2GF96ODzrkycAixiRg+L_BMCF40uW5jBhErND8v6STjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPybu_2GF96ODzrkycAixiRg+L_BMCF40uW5jBhErND8v6STjA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Mar 11, 2021 at 11:59:27PM +0100, Ricardo Ribalda Delgado wrote:
> On Thu, Mar 11, 2021 at 11:53 PM Laurent Pinchart wrote:
> > On Thu, Mar 11, 2021 at 11:19:43PM +0100, Ricardo Ribalda wrote:
> > > The device is doing something unspected with the control. Either because
> > > the protocol is not properly implemented or there has been a HW error.
> > >
> > > Fixes v4l2-compliance:
> > >
> > > Control ioctls (Input 0):
> > >                 fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
> > >         test VIDIOC_G/S_CTRL: FAIL
> > >                 fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
> > >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > The change looks good to me.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Which of the error codes below do you get with your camera, and for
> > which control ?
> 
> Bus 001 Device 003: ID 05c8:03a2 Cheng Uei Precision Industry Co., Ltd
> (Foxlink) XiaoMi USB 2.0 Webcam
> 
> info: checking extended control 'White Balance Temperature' (0x0098091a)
> Control error 7
> info: checking extended control 'Exposure (Absolute)' (0x009a0902)
> Control error 6

:-S And what's the request (GET_CUR, GET_INFO, ...) ?

> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index f2f565281e63..25fd8aa23529 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -112,6 +112,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > >       case 5: /* Invalid unit */
> > >       case 6: /* Invalid control */
> > >       case 7: /* Invalid Request */
> > > +             /*
> > > +              * The firmware has not properly implemented
> > > +              * the control or there has been a HW error.
> > > +              */
> > > +             return -EIO;
> > >       case 8: /* Invalid value within range */
> > >               return -EINVAL;
> > >       default: /* reserved or unknown */

-- 
Regards,

Laurent Pinchart
