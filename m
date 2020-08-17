Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1A22465B4
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 13:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgHQLun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 07:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgHQLul (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 07:50:41 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDA6C061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 04:50:40 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id d6so17367098ejr.5
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 04:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eHVM9jcI91pbY88fFWyW6/wr9C6nSlMI8HS38tOD5lY=;
        b=B44MqFYDydR5LrxwZuIC8SbBeM7mDhBlRLP+u1OkCEMj12vEzkqTyq+YDHeuJlADBF
         u6pC34lc0zwts2nJQNbbFXAHK5Ih7W5KUg345hP+KFm9BaLkSzhxUGrOuSyGftoXqo0/
         1rtQOH9zc7S6kbb6fa2TxdPdP+aGOzP8NuHv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eHVM9jcI91pbY88fFWyW6/wr9C6nSlMI8HS38tOD5lY=;
        b=MewOiYS3iWk/1b16CEcl5ajkJsmRXpCeEGGWDURActkJv82q4IPtnFxRzuQANhS9Pe
         0PXNhIfU8y2PRtHdbV3T3g3B1I0hhhtKRQzyvQPphhbhPt0mKVMoYRAG/IjAm9mmfotZ
         065i0kmTLMtyxeXDJPyVWA+L9uH4kAMWlN1ppWF/9Bn87GPynF6hDhlYnWYPSxh4rVMF
         zOBD8lmNfQFsGKCrb/EyPUvbXT0R3/RrPP33dasUp1OC4CmBbu5fPPqkAi35mA3GNX4d
         vpG6dcfeJuzGZLgn8+5Bo+3cM0pq7LyQiadNax9T3oZaawxg0qnCMOg+OKcK+aIS4KUh
         iirw==
X-Gm-Message-State: AOAM531CZG1KWnvqyak4H36ZSXFe2YeXI+aMflDqVAiCOmRKiRxUv3Ae
        /Znw+HJPVzTLXULr5RXdIbF/vG1Xni76Ww==
X-Google-Smtp-Source: ABdhPJxf6+sYDRZ9HLPKwU0G4vgBYQsjsTRGo/RkO/R1VRD0qTA/SXBS+FH/Rq4OMdwKCS5D7PZHGw==
X-Received: by 2002:a17:906:cc48:: with SMTP id mm8mr15299842ejb.292.1597665038769;
        Mon, 17 Aug 2020 04:50:38 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id l23sm14024213eje.46.2020.08.17.04.50.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 04:50:37 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id r4so14637134wrx.9
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 04:50:37 -0700 (PDT)
X-Received: by 2002:adf:f849:: with SMTP id d9mr14932260wrq.295.1597665037189;
 Mon, 17 Aug 2020 04:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-5-dafna.hirschfeld@collabora.com> <20200722125328.GA1828171@chromium.org>
 <8cc4f3a2-d116-ec0a-a838-b35859cdc34e@collabora.com>
In-Reply-To: <8cc4f3a2-d116-ec0a-a838-b35859cdc34e@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 17 Aug 2020 13:50:25 +0200
X-Gmail-Original-Message-ID: <CAAFQd5A5Y22KmOp7vHTDOKkTPiPmBVnUQ3ydtBs10z3Jjk_=4g@mail.gmail.com>
Message-ID: <CAAFQd5A5Y22KmOp7vHTDOKkTPiPmBVnUQ3ydtBs10z3Jjk_=4g@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] v4l2: extend the CSC API to subdevice.
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 12:24 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> Am 22.07.20 um 14:53 schrieb Tomasz Figa:
> > Hi Dafna,
> >
> > On Fri, Jul 03, 2020 at 07:10:16PM +0200, Dafna Hirschfeld wrote:
> >> This patch extends the CSC API in video devices to be supported
> >> also on sub-devices. The flag V4L2_MBUS_FRAMEFMT_SET_CSC set by
> >> the application when calling VIDIOC_SUBDEV_S_FMT ioctl.
> >> The flags:
> >>
> >> V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE, V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC,
> >> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC,
> >>
> >> are set by the driver in the VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.
> >>
> >> New 'flags' fields were added to the structs
> >> v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed
> >> from the 'reserved' field
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>   .../media/v4l/subdev-formats.rst              | 78 +++++++++++++++++--
> >>   .../v4l/vidioc-subdev-enum-mbus-code.rst      | 44 ++++++++++-
> >>   include/uapi/linux/v4l2-mediabus.h            |  9 ++-
> >>   include/uapi/linux/v4l2-subdev.h              |  8 +-
> >>   4 files changed, 129 insertions(+), 10 deletions(-)
> >>
> >
> > Thank you for the patch. Please see my comments inline.
> >
> >> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> >> index 9a4d61b0d76f..7362ee0b1e96 100644
> >> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> >> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> >> @@ -41,32 +41,96 @@ Media Bus Formats
> >>      :ref:`field-order` for details.
> >>       * - __u32
> >>         - ``colorspace``
> >> -      - Image colorspace, from enum
> >> -    :c:type:`v4l2_colorspace`. See
> >> -    :ref:`colorspaces` for details.
> >> +      - Image colorspace, from enum :c:type:`v4l2_colorspace`.
> >> +        Must be set by the driver for capture streams and by the application
> >> +    for output streams, see :ref:`colorspaces`. If the application sets the
> >> +    flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> >> +    this field for a capture stream to request a specific colorspace
> >
> > What is a "capture stream" in terms of the subdev API? Should this
> > perhaps refer to "source pads" instead?
>
> Hi, yes, I should change it to 'source pad'. I see that for the other colorimetry fields,
> the docs for v4l2_mbus_framefmt already writes
> "This information supplements the colorspace and must be set by the driver for capture streams and by the application for output streams,"
> I guess this should also change,

Right.

Best regards,
Tomasz
