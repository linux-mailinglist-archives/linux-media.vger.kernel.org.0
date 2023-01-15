Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA7FD66B427
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 22:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjAOVcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 16:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjAOVcD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 16:32:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E9016314
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 13:32:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72586308;
        Sun, 15 Jan 2023 22:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673818320;
        bh=0LRAOJwiqAflU8isbZmCc8zXBmiUppQieTesDPUEu04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bERuT/O2iX7fwNT/5r2H8wPSqI9wqiACn1Nrv84jAwgVFtoFq6M8jI3SPxzm6Z+LI
         qW7DDMLIJYJdO4JntUuPmIlzfSHq5/dZmmWe5scB7CgwBpVP7cFfPjYG9x/EFwijLY
         FYllT1NSyhir44T6vSiF9weZl/ItaO+U5bz1SEi4=
Date:   Sun, 15 Jan 2023 23:32:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
Subject: Re: [PATCH] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Message-ID: <Y8Rw0Ok9JpoflkEt@pendragon.ideasonboard.com>
References: <20230110195331.175103-1-marex@denx.de>
 <Y8CUo17laYyY9/c2@pendragon.ideasonboard.com>
 <3dcf0665-a3ba-1279-2bc8-0e5d6f9319bc@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3dcf0665-a3ba-1279-2bc8-0e5d6f9319bc@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Fri, Jan 13, 2023 at 02:03:33AM +0100, Marek Vasut wrote:
> On 1/13/23 00:15, Laurent Pinchart wrote:
> > On Tue, Jan 10, 2023 at 08:53:31PM +0100, Marek Vasut wrote:
> >> The Cypress EZUSB FX3 UVC example can be configured to report pixel
> >> format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
> >> BGRA/X 8:8:8:8.
> >>
> >> The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
> >> This seems to be an extension documented in the Microsoft Windows Media
> >> Format SDK[2]. This Media Format SDK defines this GUID as corresponding
> >> to `MEDIASUBTYPE_RGB32`.
> >>
> >> Note that in my case, the FX3 UVC can output either channel order,
> >> BGR or RGB or any other mix for that matter. Since Linux commit
> >> 1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
> >> defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
> >> this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.
> > 
> > I'd like to see documentation of the MEDIASUBTYPE_RGB32 format that
> > indicates the components order precisely. While there's a high chance it
> > maps to a BGR (in the V4L2 nomenclature) format, there would still be
> > two different options for the A or X component.
> 
> Maybe this ?
> 
> https://github.com/MicrosoftDocs/win32/blob/docs/desktop-src/DirectShow/uncompressed-rgb-video-subtypes.md
> 
> "
> Remarks
> ...
> For RGB 32, every pixel is an RGBQUAD. Each color is one byte, with a 
> value from 0 to 255, inclusive. The memory layout is:
> Byte    0       1       2       3
> Value   Blue    Green   Red     Alpha or Don't Care
> "
> 
> Maps to
> 
> drivers/media/v4l2-core/v4l2-ioctl.c:   case V4L2_PIX_FMT_BGR32: 
> descr = "32-bit BGRA/X 8-8-8-8"; break;

Thank you for digging it up. Looks good to me, except that
V4L2_PIX_FMT_BGR32 is deprecated (see
https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/pixfmt-rgb.html#deprecated-rgb-formats).
You should use V4L2_PIX_FMT_BGRA32 or V4L2_PIX_FMT_BGRX32 instead.

-- 
Regards,

Laurent Pinchart
