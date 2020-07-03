Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E042140AC
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 23:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGCVVm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 17:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgGCVVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 17:21:41 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FCAC061794
        for <linux-media@vger.kernel.org>; Fri,  3 Jul 2020 14:21:41 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a1so35616803ejg.12
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2020 14:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S5U1o4FSqNDtzjL6eZUPO8gyYTMebkN9sz0vCWl7VXo=;
        b=nqzwDQ+qryTFX180xUbidAmLNsoUEr/cpDPOdMDV1qdRpxz4u9e9wox4NMN1h4rlAb
         Nav16yDitiyZUqHB3vii1+um+H4y0p43HZa5I9qns+PJRLN3WV61NErTzOdRd5xrrAen
         ng/2wfa0/wasKUgtZ1QTtwj9bZZXydmaHlF3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S5U1o4FSqNDtzjL6eZUPO8gyYTMebkN9sz0vCWl7VXo=;
        b=BK0hqWxEhdqes8DiB6emQJ2v7+gkqsgKOgndf3T5EDO3arEvw25P3W+CJy8tYo7BjS
         RQb+ARgjQiLpR6onPzUlPmzcqoVsKyww+WFL78wv4V1GVbxWGbiuPcgQka3fCrYvczSU
         CXNPJoeOVuIny4hsIFBk/28lhkdIA+zLOYHVn8ixuafg/7W43ilEyxYwkYrmao3aOrgT
         2U6eTOe0xAb9PUHkWmcATWowYcmFHPz+GdJ7ykB5XEP+/Sa1oSyz12pT4FG3Sz+vmJqq
         kKw37xkUIuOGmB7acNIVbn+9ROIppo2h42gg1UHILRUm+cXFgmy5Xq8P5EJ5UY7y4Quy
         pv7A==
X-Gm-Message-State: AOAM530yqU5yC7O8mgLLKYvIvM9EmRLMHsiHE+YzF82n71eN5A3Aenge
        9wwsiYq965vdAj4mXTEc04dHyebcMKcyrg==
X-Google-Smtp-Source: ABdhPJytbOzYLC0XB/KvfF/R4HHfeCDbpqV7TtQ1Ph5/gHY+ny1kidXYCXsXMdXUgqy1YXoOz5Yx4Q==
X-Received: by 2002:a17:906:6a14:: with SMTP id o20mr34770111ejr.128.1593811300030;
        Fri, 03 Jul 2020 14:21:40 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id x19sm13345461eds.43.2020.07.03.14.21.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 14:21:38 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id z15so22793207wrl.8
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2020 14:21:37 -0700 (PDT)
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr38414982wrn.295.1593811297298;
 Fri, 03 Jul 2020 14:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-7-dafna.hirschfeld@collabora.com> <a4d0a929-8e54-a72f-0940-1657987c8522@collabora.com>
In-Reply-To: <a4d0a929-8e54-a72f-0940-1657987c8522@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 3 Jul 2020 23:21:26 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DDuTZ7ZpuZgY49_yCPo67vR4fSvdpL+E3hpvZBaoixzw@mail.gmail.com>
Message-ID: <CAAFQd5DDuTZ7ZpuZgY49_yCPo67vR4fSvdpL+E3hpvZBaoixzw@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] media: staging: rkisp1: allow quantization setting
 by userspace on the isp source pad
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Helen,

On Fri, Jul 3, 2020 at 10:00 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Dafna,
>
> Thanks for your patch.
>
> On 7/3/20 2:10 PM, Dafna Hirschfeld wrote:
> > The isp entity has a hardware support to force full range quantization
> > for YUV formats. Use the subdev CSC API to allow userspace to set the
> > quantization for YUV formats on the isp entity.
> >
> > - The flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION is set on
> > YUV formats during enumeration of the isp formats on the source pad.
> > - The full quantization is set on YUV formats if userspace ask it
> > on the isp entity using the flag V4L2_MBUS_FRAMEFMT_SET_CSC.
> >
> > On the capture and the resizer, the quantization is read-only
> > and always set to the default quantization.
> >
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >  drivers/staging/media/rkisp1/TODO             |  2 +-
> >  drivers/staging/media/rkisp1/rkisp1-capture.c | 10 ----------
> >  drivers/staging/media/rkisp1/rkisp1-isp.c     | 18 ++++++++++++++----
> >  3 files changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> > index c0cbec0a164d..db05288949bd 100644
> > --- a/drivers/staging/media/rkisp1/TODO
> > +++ b/drivers/staging/media/rkisp1/TODO
> > @@ -2,7 +2,7 @@
> >  * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
> >  * Fix checkpatch errors.
> >  * Review and comment every lock
> > -* Handle quantization
> > +* Add uapi docs. Remeber to add documentation of how quantization is handled.
> >  * Document rkisp1-common.h
> >  * streaming paths (mainpath and selfpath) check if the other path is streaming
> >  in several places of the code, review this, specially that it doesn't seem it
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > index f69235f82c45..93d6846886f2 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > @@ -1085,8 +1085,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> >                          const struct v4l2_format_info **fmt_info)
> >  {
> >       const struct rkisp1_capture_config *config = cap->config;
> > -     struct rkisp1_capture *other_cap =
> > -                     &cap->rkisp1->capture_devs[cap->id ^ 1];
> >       const struct rkisp1_capture_fmt_cfg *fmt;
> >       const struct v4l2_format_info *info;
> >       const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
> > @@ -1111,14 +1109,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> >
> >       info = rkisp1_fill_pixfmt(pixm, cap->id);
> >
> > -     /* can not change quantization when stream-on */
> > -     if (other_cap->is_streaming)
> > -             pixm->quantization = other_cap->pix.fmt.quantization;
> > -     /* output full range by default, take effect in params */
> > -     else if (!pixm->quantization ||
> > -              pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
> > -             pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > -
> >       if (fmt_cfg)
> >               *fmt_cfg = fmt;
> >       if (fmt_info)
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> > index 58c90c67594d..d575c1e4dc4b 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> > @@ -589,6 +589,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
> >
> >               if (code->index == pos - 1) {
> >                       code->code = fmt->mbus_code;
> > +                     if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
> > +                         dir == RKISP1_ISP_SD_SRC)
> > +                             code->flags =
> > +                                     V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
> >                       return 0;
> >               }
> >       }
> > @@ -620,7 +624,6 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
> >                                            RKISP1_ISP_PAD_SOURCE_VIDEO);
> >       *src_fmt = *sink_fmt;
> >       src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
> > -     src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >
> >       src_crop = v4l2_subdev_get_try_crop(sd, cfg,
> >                                           RKISP1_ISP_PAD_SOURCE_VIDEO);
> > @@ -663,10 +666,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> >               isp->src_fmt = mbus_info;
> >       src_fmt->width  = src_crop->width;
> >       src_fmt->height = src_crop->height;
> > -     src_fmt->quantization = format->quantization;
> > -     /* full range by default */
> > -     if (!src_fmt->quantization)
> > +
> > +     /*
> > +      * The CSC API is used to allow userspace to force full
> > +      * quantization on YUV formats.
> > +      */
> > +     if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
> > +         format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
> > +         mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> >               src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +     else
> > +             src_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>
> According to the docs [1]:
>
> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-defs.html?highlight=quantization
>
> "The default colorspace. This can be used by applications to let the driver fill in the colorspace."
>
> So, in my understanding, the driver should never return V4L2_QUANTIZATION_DEFAULT to userspace.
>
> We have the same issue in the resizer.
>
> I also see an issue in the capture that allows userspace to change quantization, and this should be fixed.
>
> In my understanding, since you are leaving all the other pads and video nodes with read-only quantization,
> changing quantization in the ISP source pad should change the readings in all the other pads and video nodes.
>
> So, if all pads are reporting V4L2_QUANTIZATION_LIM_RANGE (which is the default for sRGB colorspace), and userspace sets
> V4L2_QUANTIZATION_FULL_RANGE to the isp source pad, then all the other pads and video nodes should also report
> V4L2_QUANTIZATION_FULL_RANGE, since this will be the actual quantization used by the driver.

That's my interpretation of the spec and I would choose to implement
such behavior, however not everyone agrees on that. Please check the
discussion over the v3 series [1].

[1] https://lore.kernel.org/linux-media/20200702184324.GP12562@pendragon.ideasonboard.com/

Best regards,
Tomasz
