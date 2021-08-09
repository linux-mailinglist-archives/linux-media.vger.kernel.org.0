Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5BA3E45A2
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 14:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhHIMcR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 08:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbhHIMcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 08:32:16 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2FBC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 05:31:56 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id h13so21196650wrp.1
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DXykzn+En8BS1os1tt/8rLT4Z5PHVvY/B3TJOpteTAc=;
        b=Nw8LPKH99MkOYtXJIrbbX/FNEvvy/2Wq7CkmgP5xGUZFfNmAqcTOeTZlWP4i8IT+lI
         v5tprKW+j+6uk+++KrFRd3pTQ5WoZgiOrUIpkDZpMjz8DULiLlCsW/4Gj6mVcBJorTuK
         D812I+TlmDgdiEf9QgtJpKDMiia0WtVsNSEEOib2KAphwl1XINjwe7hll0086u98jqB2
         zU4n2c3cgYcR/MygwJxdCRxkcMQXSD+JCNtyGB6X7PH9SWei9xh4ItIIlp2TtdsuyOpr
         pAjssxuukABPmQA/QQLvYWVl0Jp7Ywhye7rC+pFiaMR/lBsj2bXMOzCKzfGvUkAMvdEX
         k/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DXykzn+En8BS1os1tt/8rLT4Z5PHVvY/B3TJOpteTAc=;
        b=djRWAQsv0LDWfS6A+mpMqqXFw5hOKMkX1JhMoVUiN3DmNVDglVqev9M//mPOGvSbku
         s7NCIO/ZNdxy265UuLF8pF5w4n25lWN+xBGAVbgFK5Q4/9vVkbCgNSGmVWWrEGmnaqhV
         lkxAspIIOKVuuifz8FluZcIDJ9uxGlot+0gCm4+nj0a6vY+hgl5qM5eXkF8AyrFO4SE8
         z1xlVacOT2tAdc6iwX1pwaEcArrfEb1p0d9cI/L3pRcezmpFbvBPF5UiHp3NwOpjjDnf
         o3IO9y+mS7yXUicf6CwP/lRjAkF9A6NW97Yl09YIou30e9T1HmQR9vdUBwc+PAAogSIr
         lGRA==
X-Gm-Message-State: AOAM533Qzzm+ZuVBa3RC3nq+6UjWUoGLZQexayhLkRnuPAl/7MLcSAYW
        psQ/ccWX+zVVIKBnW4nleYDSmA/KuTSV/IizD237sA==
X-Google-Smtp-Source: ABdhPJxrl+Xrpva/3uYTXV8vBBhf2Upx4usQOlj4vhGHprHCxUWfBuaFkrINDnHyPbp9SnJki7zxNpDVy0g4lhbxYdw=
X-Received: by 2002:a5d:6e12:: with SMTP id h18mr24932734wrz.236.1628512314727;
 Mon, 09 Aug 2021 05:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210809093448.4461-1-david.plowman@raspberrypi.com>
 <20210809093448.4461-2-david.plowman@raspberrypi.com> <21527f47-3c9e-55e2-3973-bfd0ebc91c2e@xs4all.nl>
 <YREdXF2XhR6WA+50@pendragon.ideasonboard.com> <54c13814-634d-b0db-1e8c-965dbb45fa0f@xs4all.nl>
In-Reply-To: <54c13814-634d-b0db-1e8c-965dbb45fa0f@xs4all.nl>
From:   David Plowman <david.plowman@raspberrypi.com>
Date:   Mon, 9 Aug 2021 13:31:44 +0100
Message-ID: <CAHW6GYKAYq=MaJBF3HRvuR1=oYOWXgGjK-DHXSvxmSAqcHPJ0g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone

On Mon, 9 Aug 2021 at 13:24, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 09/08/2021 14:19, Laurent Pinchart wrote:
> > Hi Hans,
> >
> > On Mon, Aug 09, 2021 at 01:05:00PM +0200, Hans Verkuil wrote:
> >> On 09/08/2021 11:34, David Plowman wrote:
> >>> We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
> >>> be notified what gains will be applied to the different colour
> >>> channels by subsequent processing (such as by an ISP), even though the
> >>> sensor will not apply any of these gains itself.
> >>>
> >>> For Bayer sensors this will be an array control taking 4 values which
> >>> are the 4 gains arranged in the fixed order B, Gb, Gr and R,
> >>> irrespective of the exact Bayer order of the sensor itself.
> >>>
> >>> The units are in all cases linear with the default value indicating a
> >>> gain of exactly 1.
> >>
> >> So a value of 2 means a gain of 2? Or are these fixed point values? How do
> >> I represent a gain of 1.5?
> >
> > No, the default value corresponds to a x1.0 gain, but it's not 1. If the
> > default is, let's say, 128, then x2.0 will be 256.
>
> Ah, now I get it. Perhaps a small example of this in the documentation patch will
> help clarify this.

Yes I agree that would be helpful. I'll put that in the next version
shortly (just waiting to see if there are any other changes
suggested).

>
> >
> >>> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
> >>>  include/uapi/linux/v4l2-controls.h        | 1 +
> >>>  2 files changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> index 421300e13a41..f87053c83249 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> @@ -1107,6 +1107,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>     case V4L2_CID_TEST_PATTERN_GREENR:      return "Green (Red) Pixel Value";
> >>>     case V4L2_CID_TEST_PATTERN_BLUE:        return "Blue Pixel Value";
> >>>     case V4L2_CID_TEST_PATTERN_GREENB:      return "Green (Blue) Pixel Value";
> >>> +   case V4L2_CID_NOTIFY_GAINS:             return "Notify Gains";
> >>>
> >>>     /* Image processing controls */
> >>>     /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> >>
> >> Since this is a standard control, it should also be configured correctly in
> >> v4l2_ctrl_fill().

Just a small clarification on this. Given that the min/max/default
values are really up to the sensor what would I fill in here, maybe
just the control type?

> >>
> >> Instead of an array, would a compound control (aka a struct) be better? Then you can
> >> explicitly have field names g, gb, gr and r.
> >>
> >> Is there a specific reason we want an array instead of that? I'm not opposed, but
> >> I'd like to see a rationale for that.
> >
> > Bayer ia only one of the possible CFA patterns for sensors. With a
> > structure containing named b, gb, gr and r fields, we wouldn't be able
> > to support, for instance, RGBW filters. It's not clear at this point
> > what other CFA patterns will be seen in sensors that require this
> > feature, but an array control will be able to more easily support these
> > use cases.
>
> OK. It is probably a good idea to mention this in the commit log at least.

Will do!

Thanks and best regards
David

>
> Regards,
>
>         Hans
>
> >
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> >>> index 5532b5f68493..133e20444939 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -1118,6 +1118,7 @@ enum v4l2_jpeg_chroma_subsampling {
> >>>  #define V4L2_CID_TEST_PATTERN_BLUE         (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
> >>>  #define V4L2_CID_TEST_PATTERN_GREENB               (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
> >>>  #define V4L2_CID_UNIT_CELL_SIZE                    (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> >>> +#define V4L2_CID_NOTIFY_GAINS                      (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> >>>
> >>>
> >>>  /* Image processing controls */
> >
>
