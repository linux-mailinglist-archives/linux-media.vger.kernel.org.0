Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19F996D747C
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 08:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236706AbjDEGkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 02:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbjDEGkT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 02:40:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C17F1FE7
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 23:40:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F120B905;
        Wed,  5 Apr 2023 08:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680676814;
        bh=H8F32ksNjUi4T3xN6eAKo1dKAXzTCF2dH1JCOI+L858=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=voe0Qmedgq49Hs1FoNUU1bfsZTUKcSrsI8xmgPuSvsFDipiG/1x3YRn2nRO77le9w
         CPeQ1bTiZJVu5449yvEW2WM+Zef/7Rp67rmtqQHNhvWgto+LgRfpq6C6q1wbP66TDS
         ZLniVG1DcM2NTAog18LigCQlqi5DfRAN4gTxhow8=
Date:   Wed, 5 Apr 2023 09:40:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        regressions@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
Message-ID: <20230405064020.GZ9915@pendragon.ideasonboard.com>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
 <CANiDSCuiHLw6FBu8GV93Mm2WK5suCnGk8PBUDfn_krtMfPwdaw@mail.gmail.com>
 <7bcc8593-a98d-6faa-2ec5-3cf59137cbcb@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7bcc8593-a98d-6faa-2ec5-3cf59137cbcb@xs4all.nl>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Mar 29, 2023 at 07:20:59PM +0200, Hans Verkuil wrote:
> On 29/03/2023 18:05, Ricardo Ribalda wrote:
> > Hi Hans
> > 
> > Thanks for the patch.
> > 
> > I believe the user can fetch this info from lsusb, so this is kind of
> > duplicated info, and this is why it was removed.
> 
> You got to set some description, so using the GUID this seems best.
> 
> > Is there an app that uses this unknown format code ? Or the only
> > complaint is that WARN() is too loud for the user?
> 
> Normally drivers do not pass on unknown formats, but if a driver does,
> then I want a WARN. If a driver does this legitimately (and I understand
> that's the case for UVC), then the driver should fill in the description
> to avoid this WARN.

In hindsight we shouldn't have added a text description to formats :-)

> > On Wed, 29 Mar 2023 at 14:39, Hans Verkuil wrote:
> >>
> >> If the fcc is 0 (indicating an unknown GUID format), then fill in the
> >> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> >> ---
> >> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >> index 7aefa76a42b3..2f1ced1212cd 100644
> >> --- a/drivers/media/usb/uvc/uvc_driver.c
> >> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
> >>                 } else {
> >>                         dev_info(&streaming->intf->dev,
> >>                                  "Unknown video format %pUl\n", &buffer[5]);
> >> +                       snprintf(format->name, sizeof(format->name), "%pUl\n",
> >> +                                &buffer[5]);
> > Don't we need at least 38 chars for this?
> 
> Yes. But all we have is 31 chars, so we take what we can :-)
> 
> This is what uvc did before this was removed.
> 
> Regards,
> 
> 	Hans
> 
> > https://docs.kernel.org/core-api/printk-formats.html#uuid-guid-addresses
> > 
> >> +
> >>                         format->fcc = 0;
> >>                 }
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> >> index 35453f81c1d9..fc6f9e7d8506 100644
> >> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> >>         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
> >>                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> >>         fmt->pixelformat = format->fcc;
> >> +       if (format->name[0])
> >> +               strscpy(fmt->description, format->name,
> >> +                       sizeof(fmt->description));
> >> +
> >>         return 0;
> >>  }
> >>
> >> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >> index 9a596c8d894a..22656755a801 100644
> >> --- a/drivers/media/usb/uvc/uvcvideo.h
> >> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >> @@ -264,6 +264,8 @@ struct uvc_format {
> >>         u32 fcc;
> >>         u32 flags;
> >>
> >> +       char name[32];
> >> +

I'd not really nice to have to store the name for every format, when we
know it will very rarely be used.

One alternative option would be to store the GUID, which would halve the
amount of memory. Another option would be to stop reporting those
formats to userspace in uvc_ioctl_enum_fmt(). They can't be selected
anyway, they have no unique 4CC.

> >>         unsigned int nframes;
> >>         struct uvc_frame *frame;
> >>  };

-- 
Regards,

Laurent Pinchart
