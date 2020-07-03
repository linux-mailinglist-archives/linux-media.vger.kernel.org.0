Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F0D214008
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 21:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgGCTek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 15:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgGCTek (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 15:34:40 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A54C061794
        for <linux-media@vger.kernel.org>; Fri,  3 Jul 2020 12:34:39 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id ga4so35321964ejb.11
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2020 12:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Im8+2+dYukH0cK0EvCF45t1IhRWlOyQY9yC3F7KQpGI=;
        b=l6OetGGXQDgMZ2DNLNFmDkoDP37jILMp8A2lQNAt5zEn9Dnnzw8CA6ZgCgM2gNN8ye
         4YqDOkJaEMu3w0msA3hpeeVFihJIlN3GsuaXX5Bvdy75+UsFvygYxoGOoDbOhXR4mpao
         E8f9rNij1sNbaBhJSPY9NZYohFUm6HuJId7hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Im8+2+dYukH0cK0EvCF45t1IhRWlOyQY9yC3F7KQpGI=;
        b=TdqKKvCcSdioCgHFuWJrO+4HwWQpeln1TLe6K1ux9IrsfJsBSDGlYysKtmJo1uAEXk
         AlXykEico+//99xcrsLHCyTWWiqjzQCCoTxEoITqcShukZ2BwazJVWHW19ObbHNbXwh8
         oXFssb+QIl9Ar72bYUaPyMN4x+orxRa4pmRYJwegdCAWesfNG0eFcmlzyOnx2+06Cn5p
         aaLoNt/R/Z5tIBR+Ex5UFeeRgARAgSlQpdjroge6W/yrJnKKhaDlVUoSEWVADNP5BVdT
         Gr8bT2eSs5kTGilxllxA1HKpm+kovMzyTl33EuWI72+gFf73mHwHhFP6hN0zUZ4JBkwE
         aZmQ==
X-Gm-Message-State: AOAM53334QqnBfjEOkWTl6pIwagKFBV/9ym2glGnnRcwaTiYx3hA6VBo
        dwLrYEblAY5wTXK3yecTT+Qpk6vdHJ9Itg==
X-Google-Smtp-Source: ABdhPJyx7dZ7UrC0Co+qNyUOdQM6lf3a4QIiNRHVNBThg3Ij7ZEfs1WSedLEvP0vK3c8DMXuAUdOWw==
X-Received: by 2002:a17:906:328d:: with SMTP id 13mr34281463ejw.71.1593804877917;
        Fri, 03 Jul 2020 12:34:37 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id ch2sm13639069edb.87.2020.07.03.12.34.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 12:34:37 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id q5so33822023wru.6
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2020 12:34:37 -0700 (PDT)
X-Received: by 2002:adf:f34f:: with SMTP id e15mr38649990wrp.415.1593804876655;
 Fri, 03 Jul 2020 12:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200701215616.30874-1-jonas@kwiboo.se> <20200701215616.30874-9-jonas@kwiboo.se>
 <67a130a8fd8874c5dc639c924de959f88357b480.camel@collabora.com>
 <f817d682-ec76-1879-4324-39cf7993493e@kwiboo.se> <7abec9992460dcd84a2c951fce55bc8e46f2a0ed.camel@collabora.com>
 <0353b993-907d-2dfe-993f-94b82aa27e00@kwiboo.se>
In-Reply-To: <0353b993-907d-2dfe-993f-94b82aa27e00@kwiboo.se>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 3 Jul 2020 21:34:24 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DYwuP-=wgthnHAgVP302MZhHwKcsErNaJQ+Mg-RRPbBg@mail.gmail.com>
Message-ID: <CAAFQd5DYwuP-=wgthnHAgVP302MZhHwKcsErNaJQ+Mg-RRPbBg@mail.gmail.com>
Subject: Re: [PATCH 8/9] media: rkvdec: Add validate_fmt ops for pixelformat validation
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 3, 2020 at 9:18 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2020-07-03 16:58, Ezequiel Garcia wrote:
> > On Fri, 2020-07-03 at 06:55 +0000, Jonas Karlman wrote:
> >> On 2020-07-03 05:14, Ezequiel Garcia wrote:
> >>> Hi Jonas,
> >>>
> >>> Thanks for working on this.
> >>>
> >>> On Wed, 2020-07-01 at 21:56 +0000, Jonas Karlman wrote:
> >>>> Add an optional validate_fmt operation that is used to validate the
> >>>> pixelformat of CAPTURE buffers.
> >>>>
> >>>> This is used in next patch to ensure correct pixelformat is used for 10-bit
> >>>> and 4:2:2 content.
> >>>>
> >>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> >>>> ---
> >>>>  drivers/staging/media/rkvdec/rkvdec.c | 8 ++++++++
> >>>>  drivers/staging/media/rkvdec/rkvdec.h | 1 +
> >>>>  2 files changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> >>>> index b1de55aa6535..465444c58f13 100644
> >>>> --- a/drivers/staging/media/rkvdec/rkvdec.c
> >>>> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> >>>> @@ -239,6 +239,14 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
> >>>>    if (WARN_ON(!coded_desc))
> >>>>            return -EINVAL;
> >>>>
> >>>> +  if (coded_desc->ops->validate_fmt) {
> >>>> +          int ret;
> >>>> +
> >>>> +          ret = coded_desc->ops->validate_fmt(ctx, pix_mp->pixelformat);
> >>>> +          if (ret)
> >>>> +                  return ret;
> >>>> +  }
> >>>> +
> >>>
> >>> I don't think this approach will be enough. Unless I'm mistaken,
> >>> it's perfectly legal as per the stateless spec to first
> >>> call S_FMT on the OUTPUT queue (which is propagated to the CAPTURE side),
> >>> and then set the SPS and other controls.
> >>
> >> I agree that this will not be enough to cover all use cases stated in the spec.
> >>
> >>> The application is not required to do a TRY_FMT after S_EXT_CTRLS.
> >>
> >> If I remember correctly we were required to implement a TRY_FMT loop in
> >> ffmpeg due to cedrus defaulting to SUNXI_TILED_NV12 instead of linear NV12
> >> on platforms where display controller did not support the tiled modifier.
> >>
> >> So having TRY_FMT as part of the init sequence has been my only test-case.
> >>
> >>> What I believe is needed is for the S_EXT_CTRLS to modify
> >>> and restrict the CAPTURE format accordingly, so the application
> >>> gets the correct format on G_FMT (and restrict future TRY_FMT).
> >>
> >> This sounds like a proper solution, I do belive we may have a chicken or
> >> the egg problem depending on if application call S_EXT_CTRLS or S_FMT first.
> >>
> >
> > IIUC, the order is specified in the stateless spec [1].
> >
> > 1) S_FMT on OUTPUT (to set the coded pixelformat). CAPTURE format
> > format is propagated here and a default format is set.
> >
> > 2) S_EXT_CTRLS, parameters are set. We don't do anything here,
> > but here we'd validate the SPS and restrict the CAPTURE pixelformat
> > (and perhaps reset the default CAPTURE pixelformat).
> >
> > 3) G_FMT on CAPTURE.
> >
> > 4) (optional) ENUM_FMT / S_FMT on CAPTURE, to negotiate
> > something different from default.
>
> There is also the following scenario that we may need to support:
>
> 1) S_FMT on OUTPUT, default CAPTURE format is set.
>
> 2) skip S_EXT_CTRLS, mandatory controls is only validated in req_validate.
>
> 3) G_FMT on CAPTURE, returns default CAPTURE format.
>
> 4) S_FMT on CAPTURE, CAPTURE format is changed from default to selected format.
>
> 5) STREAMON
>
> From this point on I would expect S_EXT_CTRLS with a V4L2_CTRL_WHICH_REQUEST_VAL
> flag to reject any SPS not matching the selected CAPTURE format. Effectively
> allowing S_FMT to lock down a format instead of an initial S_EXT_CTRLS during init.
>
> This means that we have to both allow and reject a SPS depending on the state.
>

That would end up with a really bad API behavior inconsistency. Rather
than that, we have to define what is the authoritative source of the
width and height and I believe that for streams that have this kind of
information in the metadata (e.g. header controls), that should be the
metadata.

So, for example, for H.264, the driver would have to always keep the
width and height of the OUTPUT format fixed to whatever the SPS
control specifies, regardless of what one attempts to set via S_FMT.
If an SPS is set that has different width and height values, the
OUTPUT format should be updated by the driver, in turn the CAPTURE
format should be reset as well and then a SOURCE_CHANGE event should
be signaled, like with the stateful decoders.

Best regards,
Tomasz

> Regards,
> Jonas
>
> >
> > Regards,
> > Ezequiel
> >
> > [1] Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> >
> >> I guess we may need to lock down on a format at whatever comes first,
> >> S_FMT on CAPTURE or S_EXT_CTRLS with SPS ctrl.
> >>
> >> I have an idea on how this could be addressed, will explore and see
> >> if I can come up with something new.
> >>
> >> Regards,
> >> Jonas
> >>
> >>> Also, V4L2 spec asks drivers not to fail on S_FMT
> >>> format mismatch, but instead to adjust and return a legal format
> >>> back to the application [1].
> >>>
> >>> Let me know what you think and thanks again.
> >>>
> >>> Ezequiel
> >>>
> >>> [1] Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> >>>
> >>>>    for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> >>>>            if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
> >>>>                    break;
> >>>> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> >>>> index 2fc9f46b6910..be4fc3645cde 100644
> >>>> --- a/drivers/staging/media/rkvdec/rkvdec.h
> >>>> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> >>>> @@ -64,6 +64,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> >>>>  struct rkvdec_coded_fmt_ops {
> >>>>    int (*adjust_fmt)(struct rkvdec_ctx *ctx,
> >>>>                      struct v4l2_format *f);
> >>>> +  int (*validate_fmt)(struct rkvdec_ctx *ctx, u32 pixelformat);
> >>>>    int (*start)(struct rkvdec_ctx *ctx);
> >>>>    void (*stop)(struct rkvdec_ctx *ctx);
> >>>>    int (*run)(struct rkvdec_ctx *ctx);
> >
> >
