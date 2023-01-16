Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FFE66B4F5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 01:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjAPAcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 19:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjAPAcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 19:32:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDD34C2F
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 16:32:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6569A997;
        Mon, 16 Jan 2023 01:32:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673829166;
        bh=z9Gk8yFVpD4p7Wujgkv70kOwkzWFEsJxsmxk9G3yG4E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MIxoGAk/E7aQ/i8OfJ7Uhz302e3Cwi6WReh5rSMKb90pFjZ4JoHA4vC4apYBANRZY
         9j20ILJlFTX6gMq57tJT4CV4lNNKceNCwguxwAAxr/P1d/ZPAmYnOvCHR185evDd0r
         e5UM5dhD0d49+sHeYPw8nETjcxmqkm5cEIqmm0HU=
Date:   Mon, 16 Jan 2023 02:32:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
Subject: Re: [PATCH] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Message-ID: <Y8SbLuu8lVQEZ8gg@pendragon.ideasonboard.com>
References: <20230110195331.175103-1-marex@denx.de>
 <Y8CUo17laYyY9/c2@pendragon.ideasonboard.com>
 <3dcf0665-a3ba-1279-2bc8-0e5d6f9319bc@denx.de>
 <Y8Rw0Ok9JpoflkEt@pendragon.ideasonboard.com>
 <02b50474-8ce0-31e8-92f5-653774d24d4e@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02b50474-8ce0-31e8-92f5-653774d24d4e@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Mon, Jan 16, 2023 at 12:45:34AM +0100, Marek Vasut wrote:
> On 1/15/23 22:32, Laurent Pinchart wrote:
> > On Fri, Jan 13, 2023 at 02:03:33AM +0100, Marek Vasut wrote:
> >> On 1/13/23 00:15, Laurent Pinchart wrote:
> >>> On Tue, Jan 10, 2023 at 08:53:31PM +0100, Marek Vasut wrote:
> >>>> The Cypress EZUSB FX3 UVC example can be configured to report pixel
> >>>> format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
> >>>> BGRA/X 8:8:8:8.
> >>>>
> >>>> The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
> >>>> This seems to be an extension documented in the Microsoft Windows Media
> >>>> Format SDK[2]. This Media Format SDK defines this GUID as corresponding
> >>>> to `MEDIASUBTYPE_RGB32`.
> >>>>
> >>>> Note that in my case, the FX3 UVC can output either channel order,
> >>>> BGR or RGB or any other mix for that matter. Since Linux commit
> >>>> 1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
> >>>> defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
> >>>> this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.
> >>>
> >>> I'd like to see documentation of the MEDIASUBTYPE_RGB32 format that
> >>> indicates the components order precisely. While there's a high chance it
> >>> maps to a BGR (in the V4L2 nomenclature) format, there would still be
> >>> two different options for the A or X component.
> >>
> >> Maybe this ?
> >>
> >> https://github.com/MicrosoftDocs/win32/blob/docs/desktop-src/DirectShow/uncompressed-rgb-video-subtypes.md
> >>
> >> "
> >> Remarks
> >> ...
> >> For RGB 32, every pixel is an RGBQUAD. Each color is one byte, with a
> >> value from 0 to 255, inclusive. The memory layout is:
> >> Byte    0       1       2       3
> >> Value   Blue    Green   Red     Alpha or Don't Care
> >> "
> >>
> >> Maps to
> >>
> >> drivers/media/v4l2-core/v4l2-ioctl.c:   case V4L2_PIX_FMT_BGR32:
> >> descr = "32-bit BGRA/X 8-8-8-8"; break;
> > 
> > Thank you for digging it up. Looks good to me, except that
> > V4L2_PIX_FMT_BGR32 is deprecated (see
> > https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/pixfmt-rgb.html#deprecated-rgb-formats).
> > You should use V4L2_PIX_FMT_BGRA32 or V4L2_PIX_FMT_BGRX32 instead.
> 
> V4L2_PIX_FMT_XBGR32 , right ?

Yes, my bad. 4CCs are awful :-)

We could also use V4L2_PIX_FMT_ABGR32, but I don't think a UVC camera
would meaningfully produce an alpha channel.

I can change the pixel format when applying the patch if this is fine
with you.

-- 
Regards,

Laurent Pinchart
