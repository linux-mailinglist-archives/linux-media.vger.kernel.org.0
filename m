Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F14C66958A1
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 06:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjBNFqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 00:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjBNFqL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 00:46:11 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DDFA1631D
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 21:46:08 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id v3so9570015pgh.4
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 21:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=43I7psS1KROU4KiUI2HJmrSALy9aPYIpoJQ1l7x5UQY=;
        b=cFbDtESc0WY/hBpzlM9WmLsEDXNsH8mG2+mLEdGco3rm6dBTRHeLX04fhYhDNQOnwF
         AoUjITthkPlUOfAfT0KSkPfhmDYi1NzUplNuOgPIwMxwN40Nm1QUNGN4VLtjVrJz8KQD
         AzBx64aFwPEPFJsdX3s7qVjlLHy3cSHHuzNBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43I7psS1KROU4KiUI2HJmrSALy9aPYIpoJQ1l7x5UQY=;
        b=7jUujIBwEIwqBcN2eUb8GlaUlJG9JHHX7JGpuyYHi1pVQDC809mEu4WAUTiqJhk5+d
         iK0LYkGL6m3YOh1uYAIMS2VtfamK0O2i3joFHEWqXLnkwCklHST2Hpv4ZGttzi+sH6Sd
         hF8d0hfG+lKlrx6b6K6IBeJnU1hQTN5IPncbI6kWedqTmq4QXntFaJj0kfAlhQbrosjw
         aHD0/Q3VzY1RDv0EaWXwpw+OEHn+46YnTRlfSORrdWyfU/z7v/9AGl0gS0ewlNItvmJK
         rtFJy+ZTAnWycOXsQCrl1BY342i0wJIv/beeju5ffGeItVrX7RvCjlY7KOV+766jWDNd
         a/FA==
X-Gm-Message-State: AO0yUKXtPGWBN7bTWOsXkBv/tVB8AIgnuHdmrJxKzgTHzTXoI8FMM88n
        tNENH1j+XgNTANbuEnp6ZP4Pz6N2oPI4giiyPok5kVUnZ82I4w==
X-Google-Smtp-Source: AK7set+gj+LN6e3QAh1wh37wvr4Y1dPkCKdbPxEHLfAi3QgUY22aHPr/gqKvINdoSZlvnJ6Q0EDQV8DHIjsi48ZOT5Q=
X-Received: by 2002:aa7:9ad4:0:b0:5a8:a9f2:3623 with SMTP id
 x20-20020aa79ad4000000b005a8a9f23623mr200181pfp.36.1676353567806; Mon, 13 Feb
 2023 21:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org> <CANiDSCuq483Eha-KfUM_1y4zb0sC8rNgf-yki5SjiUo3czaKBw@mail.gmail.com>
In-Reply-To: <CANiDSCuq483Eha-KfUM_1y4zb0sC8rNgf-yki5SjiUo3czaKBw@mail.gmail.com>
From:   Yunke Cao <yunkec@chromium.org>
Date:   Tue, 14 Feb 2023 14:45:57 +0900
Message-ID: <CAEDqmY7XqqFrQCEMFe3kmOFJkgOcHoJcUH5bJAueyH0oQivzmw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] meida: uvcvideo: reimplement privacy gpio as a
 separate subdevice
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

On Fri, Jan 13, 2023 at 5:26 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Yunke
>
> Thank you very much for the patchset :)
>
> On Wed, 11 Jan 2023 at 09:52, Yunke Cao <yunkec@chromium.org> wrote:
> >
> > privacy_gpio in uvc were added as V4L2_CID_PRIVACY in uvc video node in
> > https://lore.kernel.org/all/20201223133528.55014-1-ribalda@chromium.org/
> >
> > Userspace applications often require to constantly poll privacy control.
> > Currently, polling privacy control requires keeping the video node open,
> > which prevents the camera from autosuspending.
> >
> > This patchset adds a separate v4l2 subdevice. Userspace access the gpio
> > via V4L2_CID_PRIVACY in the new subdevice. Applications can poll the
> > privacy control status without opening the video node and activate the
> > camera.
> >
> > The non-gpio V4L2_CID_PRIVACY in uvc is not affected.
>
> Since this is a RFC, lets focus on the idea and not on the code itself.
>
> - I am missing a reference to the subdevice from the media device. How
> will a user figure out that /dev/v4l-subdev0 is the privacy gpio of
> /dev/media0 and not /dev/media1?. Thake a look to the "ancillary
> links"
> - We have already exposed the control as part of the main video
> device, that means that we need to keep that API. The control on
> /dev/v4l-subdev0 should "mirror" the control on /dev/video0
> - There is no need to v4l2_ctrl_fill_event(), if you modify the
> control with a set controll function, the media controller should take
> care of everything

Thanks! I will fix these in the next version if we decide to proceed.

>
> @Sakari Ailus @Hans Verkuil : Assuming a correct implementation, how
> would you feel about exposing a privacy gpio as a subdevice?
>

Sakari, Hans, do you think this idea makes sense?

Best,
Yunke

>
> Thanks!!!
>
>
> >
> > Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > ---
> > Yunke Cao (3):
> >       media: v4l2-ctrls: Expose v4l2_ctrl_fill_event()
> >       media: uvcvideo: remove entity privacy control in the uvc video node
> >       media: uvcvideo: reimplement privacy GPIO as a separate subdevice
> >
> >  drivers/media/usb/uvc/uvc_ctrl.c          | 17 -------
> >  drivers/media/usb/uvc/uvc_driver.c        | 44 ++----------------
> >  drivers/media/usb/uvc/uvc_entity.c        | 76 +++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h          | 19 +++++---
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c |  9 ++--
> >  include/media/v4l2-ctrls.h                | 12 +++++
> >  6 files changed, 111 insertions(+), 66 deletions(-)
> > ---
> > base-commit: 7dd4b804e08041ff56c88bdd8da742d14b17ed25
> > change-id: 20230111-uvc_privacy_subdev-1e7a167e86eb
> >
> > Best regards,
> > --
> > Yunke Cao <yunkec@chromium.org>
>
>
>
> --
> Ricardo Ribalda
