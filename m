Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 249CACE128
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 14:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbfJGMDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 08:03:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:58910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727490AbfJGMDp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 08:03:45 -0400
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD02221721;
        Mon,  7 Oct 2019 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570449824;
        bh=YN/JDzAHCMJ/e/tv+TeADCITLgu70dRqullL+zBfzRI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h2ARMmStLRBbfeCRMjGFhE/t8aggvk+hAsD5O2K/dvaTwriGK3ZFyQpAiMGmWaASD
         xC8qqJSv5/mLI1DFQaQgfSeMcXPphZpOMQbDarc8+8wAr2OsnO3799AueEQgZjtez4
         FQLh76Gylo7JormMMkhat0fLHRtR4RkPEBzr9Yqo=
Received: by mail-lj1-f175.google.com with SMTP id b20so13344269ljj.5;
        Mon, 07 Oct 2019 05:03:43 -0700 (PDT)
X-Gm-Message-State: APjAAAUbFBs13NYEtN+PJOWmAeFMEy2bucVBjDdUkEe6fOGWXeywY65y
        i3r8FKH62rm4Uqm0lacoLGz92sqSW9HJlSbo/Tg=
X-Google-Smtp-Source: APXvYqz+5o0y+Lcliaxl0zhfcnGA29V1xk5EIyxYl1tl8ZiZNti7nhFKHrlHADM/iioHNG3U3FFhZAdr3QfcoST7Ldc=
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr18679419lji.131.1570449822085;
 Mon, 07 Oct 2019 05:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191007113502.11746-1-ribalda@kernel.org> <20191007113502.11746-7-ribalda@kernel.org>
 <494e3061-985d-8b8e-7728-9e72442ad9f7@xs4all.nl>
In-Reply-To: <494e3061-985d-8b8e-7728-9e72442ad9f7@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 7 Oct 2019 14:03:25 +0200
X-Gmail-Original-Message-ID: <CAPybu_2Qm+1MxQXCXXq4zzhvnjew5awRSofkqiPrc2bMav=Jkg@mail.gmail.com>
Message-ID: <CAPybu_2Qm+1MxQXCXXq4zzhvnjew5awRSofkqiPrc2bMav=Jkg@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans



On Mon, Oct 7, 2019 at 2:01 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 10/7/19 1:35 PM, Ricardo Ribalda Delgado wrote:
> > New control to pass to userspace the width/height of a pixel. Which is
> > needed for calibration and lens selection.
> >
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-image-source.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> > index 2c3ab5796d76..6388668855d0 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> > @@ -55,3 +55,12 @@ Image Source Control IDs
> >
> >  ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
> >      Test pattern green (next to blue) colour component.
> > +
> > +``V4L2_CID_UNIT_CELL_SIZE (struct)``
> > +    This control returns the unit cell size in nanometers. The struct
> > +    :c:type:`v4l2_area` provides the width and the height in separate
> > +    fields to take into consideration asymmetric pixels and/or hardware
> > +    binning.
>
> This still states that this control takes binning into account. I understood that
> we decided not to do that?
>

Good catch, seems that at some point I changed my mind :).

Will fix this doc.

Can I resend only this patch to avoid spamming the list?


> Regards,
>
>         Hans
>
> > +    The unit cell consists of the whole area of the pixel, sensitive and
> > +    non-sensitive.
> > +    This control is required for automatic calibration of sensors/cameras.
> >
>
