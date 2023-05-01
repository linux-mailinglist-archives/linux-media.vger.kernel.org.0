Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A2B6F3096
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 14:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbjEAMBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 08:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbjEAMBX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 08:01:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD45BE62
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 05:01:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9196CFB;
        Mon,  1 May 2023 14:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682942477;
        bh=MAgW6GVJMJFhRfFjwo+wmZkLVxdzG9PqDFqZlKSHYS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bDA3Fpw808Z+9L/LmIBQJk640J9oeQ1GG4uaa/v0YQJW5/bbUAPrnlIZEcfgrS+HL
         XE7zA6Ukha4UE3ck2fy8fP2e3ffyyIW6BoVZc0IO9ALzpCOm/N6Y2Qlbcdp4ja6OYX
         CpkQBIkP2Ua1shHXUpnUSJw1Zti2QdR9E1ejQBpU=
Date:   Mon, 1 May 2023 15:01:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: uvcvideo: Don't expose unsupported formats to
 userspace
Message-ID: <20230501120129.GB21559@pendragon.ideasonboard.com>
References: <20230420100750.10463-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvo4oX2DmdXApofiJybCrf+Dhj4-jtmUnmU+UfgUw0fhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvo4oX2DmdXApofiJybCrf+Dhj4-jtmUnmU+UfgUw0fhA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, May 01, 2023 at 01:44:11PM +0200, Ricardo Ribalda wrote:
> Hi Laurent
> 
> I agree with the intent of the patch but am not sure that this will work.
> 
> Regards!
> 
> On Thu, 20 Apr 2023 at 12:07, Laurent Pinchart wrote:
> >
> > When the uvcvideo driver encounters a format descriptor with an unknown
> > format GUID, it creates a corresponding struct uvc_format instance with
> > the fcc field set to 0. Since commit 50459f103edf ("media: uvcvideo:
> > Remove format descriptions"), the driver relies on the V4L2 core to
> > provide the format description string, which the V4L2 core can't do
> > without a valid 4CC. This triggers a WARN_ON.
> >
> > As a format with a zero 4CC can't be selected, it is unusable for
> > applications. Ignore the format completely without creating a uvc_format
> > instance, which fixes the warning.
> >
> > Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index de64c9d789fd..25b8199f4e82 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -251,14 +251,17 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                 /* Find the format descriptor from its GUID. */
> >                 fmtdesc = uvc_format_by_guid(&buffer[5]);
> >
> > -               if (fmtdesc != NULL) {
> > -                       format->fcc = fmtdesc->fcc;
> > -               } else {
> > +               if (!fmtdesc) {
> > +                       /*
> > +                        * Unknown video formats are not fatal errors, the
> > +                        * caller will skip this descriptor.
> > +                        */
> >                         dev_info(&streaming->intf->dev,
> >                                  "Unknown video format %pUl\n", &buffer[5]);
> > -                       format->fcc = 0;
> > +                       return 0;
> >                 }
> >
> > +               format->fcc = fmtdesc->fcc;
> >                 format->bpp = buffer[21];
> >
> >                 /*
> > @@ -689,6 +692,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >                                 &interval, buffer, buflen);
> 
> For devices with unknown formats streaming->nformats will not be
> valid, it will be higher than the actual formats on
> streaming->formats.

Indeed. I think this could be handled quite simply:

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index d966d003632b..cc6608eb3ab9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -679,7 +679,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	interval = (u32 *)&frame[nframes];

 	streaming->formats = format;
-	streaming->nformats = nformats;
+	streaming->nformats = 0;

 	/* Parse the format descriptors. */
 	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
@@ -695,6 +695,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 			if (!ret)
 				break;

+			streaming->nformats++;
 			frame += format->nframes;
 			format++;

What do you think ? I can submit a v2 with this change.

> >                         if (ret < 0)
> >                                 goto error;
> > +                       if (!ret)
> > +                               break;
> >
> >                         frame += format->nframes;
> >                         format++;

-- 
Regards,

Laurent Pinchart
