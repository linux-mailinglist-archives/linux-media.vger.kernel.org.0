Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2FE39E99C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 00:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhFGWbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 18:31:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35596 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhFGWbT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 18:31:19 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 569B0292;
        Tue,  8 Jun 2021 00:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623104966;
        bh=ZPRG3xOEvPNfS03EJzvNPgXdOj1RK7E8KvxkiinLqvQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k07uRhPNpRtRQmpswUj//6qLjtJLqmy5Co0J3xPbB9yvmONOAk5nC8HGAoQG1lYud
         kxhG3Kv56MqenHU/Q+OcNXDkka457dpjI9DQpiipMCsiBSovh+WrUlDRyvL92x7wWr
         PR8g2QMe8p08RdhsQApK97by59ZURS5SmbjykHxE=
Date:   Tue, 8 Jun 2021 01:29:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Hans Petter Selasky <hps@selasky.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] Genesys Logic UVC microscopes used to work with Linux
Message-ID: <YL6duHwW4FKwbelU@pendragon.ideasonboard.com>
References: <478e73fc-0e2c-4f1b-11d4-c71067764571@selasky.org>
 <b3747aa3-9984-0456-943a-b16e687c0ec0@selasky.org>
 <CAPybu_3058QGK3uRZn4Q9Pru5ReMjVyD4tj9_+Lt4y0kxskfcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPybu_3058QGK3uRZn4Q9Pru5ReMjVyD4tj9_+Lt4y0kxskfcA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 07, 2021 at 10:17:35PM +0200, Ricardo Ribalda Delgado wrote:
> Maybe you want to handle this with a quirk? I suspect that some
> devices might work differently with this patches?

Furthermore, for the affected devices, shouldn't the driver cache the
value of the control and apply it only after starting streaming ?
Otherwise a V4L2_S_CTRL() with a new value before streaming will break
the device.

> On Sun, Jun 6, 2021 at 3:36 PM Hans Petter Selasky <hps@selasky.org> wrote:
> >
> > Hi,
> >
> > Some USB video class compliant devices, like Genesys Logic camera chips,
> > used in cheap microscopes, doesn't provide any image if there are UVC
> > SET current value commands for the processing unit, before the camera
> > stream is activated. Fix this by not issuing any UVC SET current value
> > commands, if the value was not changed. This should also work fine with
> > existing UVC compliant webcams and optimized the number of needed
> > processing unit control endpoint requests.
> >
> > Signed-off-by: Hans Petter Selasky <hps@selasky.org>
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > b/drivers/media/usb/uvc/uvc_ctrl.c
> > index b3dde98499f4..0d7137eca331 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1697,7 +1697,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >          if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> >                  ctrl->handle = handle;
> >
> > -       ctrl->dirty = 1;
> > +       /* Avoid setting the current value. */
> > +       if (!ctrl->dirty &&
> > +           memcmp(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_BACKUP),
> > +                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > +                  ctrl->info.size) != 0)
> > +               ctrl->dirty = 1;
> > +
> >          ctrl->modified = 1;
> >          return 0;
> >   }

-- 
Regards,

Laurent Pinchart
