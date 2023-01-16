Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B133B66C280
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjAPOoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbjAPOnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:43:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E64B23C75
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:22:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF69A802;
        Mon, 16 Jan 2023 15:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673878949;
        bh=txEoX9Y0uaw3HpAApqU/gLxE/5qgshc9vMJnZjsdOi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aXK/amOmTkGEzol5PWyWeTrV4OdEDOdt1FbHuOxjrmo77mVGz5llfplMiT4Ut5T7+
         VkXlqhSma2oS0z2XssI+S09fE+80xliVXivzc3nD0MowQdMZPi1qwRLv/ncqHTrO4s
         aGi5fruBNGhAj4fZtVlEKtO8aXABYYJxRG9bouPw=
Date:   Mon, 16 Jan 2023 16:22:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH v2] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Message-ID: <Y8VdpQGcqmoKESk8@pendragon.ideasonboard.com>
References: <20230116094032.4389-1-marex@denx.de>
 <Y8Uq2EtsYi9kmdqw@pendragon.ideasonboard.com>
 <CANiDSCtniqdwr7oqvcMfH9sKYMuTX7jyAA9P9ZeCFhEGq8Rnqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtniqdwr7oqvcMfH9sKYMuTX7jyAA9P9ZeCFhEGq8Rnqw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

(CC'ing Michael)

On Mon, Jan 16, 2023 at 02:20:40PM +0100, Ricardo Ribalda wrote:
> Hi Marek!!!
> 
> Why do they call MEDIASUBTYPE_RGB32 something that is BRG ? !
> 
> Why do WE call XBGR something that is BGRX? !!
> 
> Besides our insanity, your patch looks sane. Thanks for it :)
> 
> There are some patches on the queue to remove the format definitions,
> so your patch might not apply cleanly, I guess Laurent will take care
> of it

Ricardo meant [5].

Michael, I'm waiting for Mauro to merge the uvcvideo pull request for
v6.3 ([6]). Once done, you can use that as a base branch for your
series, and send a pull request to Greg. Could you include Marek's
patch, either at the bottom or the top of your series ? Alternatively I
can send a v4 of the uvcvideo pull request with this patch included if
you prefer.

[5] https://lore.kernel.org/linux-media/20221215224514.2344656-1-m.grzeschik@pengutronix.de/
[6] https://lore.kernel.org/linux-media/Y8R0yfSL+1BNi%2Ff3@pendragon.ideasonboard.com/

> On Mon, 16 Jan 2023 at 11:50, Laurent Pinchart wrote:
> > On Mon, Jan 16, 2023 at 10:40:32AM +0100, Marek Vasut wrote:
> > > The Cypress EZUSB FX3 UVC example can be configured to report pixel
> > > format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
> > > BGRA/X 8:8:8:8.
> > >
> > > The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
> > > This seems to be an extension documented in the Microsoft Windows Media
> > > Format SDK[2]. This Media Format SDK defines this GUID as corresponding
> > > to `MEDIASUBTYPE_RGB32`, which is confirmed by [4] as `MEDIASUBTYPE_ARGB32`
> > > has different GUID.
> > >
> > > Note that in my case, the FX3 UVC can output either channel order,
> > > BGR or RGB or any other mix for that matter. Since Linux commit
> > > 1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
> > > defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
> > > this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.
> > > Document [3] also indicates the channel order is BGR.
> > >
> > > [1] https://www.usb.org/document-library/video-class-v15-document-set
> > > [2] https://learn.microsoft.com/en-us/windows/win32/wmformat/media-type-identifiers
> > > [3] https://learn.microsoft.com/en-us/windows/win32/directshow/uncompressed-rgb-video-subtypes
> > > [4] https://gix.github.io/media-types/
> > >
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Ricardo Ribalda <ricardo@ribalda.com>
>
> > > ---
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Cc: William Manley <will@williammanley.net>
> > > ---
> > > V2: - Reference document [3] confirming BGR channel order
> > >     - Reference document [4] describing MEDIASUBTYPE_ARGB32 with different GUID
> > >     - Use V4L2_PIX_FMT_XBGR32 instead of V4L2_PIX_FMT_BGR32 which is deprecated
> > > ---
> > >  include/media/v4l2-uvc.h | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
> > > index f83e31661333b..b010a36fc1d95 100644
> > > --- a/include/media/v4l2-uvc.h
> > > +++ b/include/media/v4l2-uvc.h
> > > @@ -99,6 +99,9 @@
> > >  #define UVC_GUID_FORMAT_BGR3 \
> > >       { 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> > >        0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
> > > +#define UVC_GUID_FORMAT_BGR4 \
> > > +     { 0x7e, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> > > +      0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
> > >  #define UVC_GUID_FORMAT_M420 \
> > >       { 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
> > >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > @@ -266,6 +269,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> > >               .guid           = UVC_GUID_FORMAT_BGR3,
> > >               .fcc            = V4L2_PIX_FMT_BGR24,
> > >       },
> > > +     {
> > > +             .name           = "BGRA/X 8:8:8:8 (BGR4)",
> > > +             .guid           = UVC_GUID_FORMAT_BGR4,
> > > +             .fcc            = V4L2_PIX_FMT_XBGR32,
> > > +     },
> > >       {
> > >               .name           = "H.264",
> > >               .guid           = UVC_GUID_FORMAT_H264,

-- 
Regards,

Laurent Pinchart
