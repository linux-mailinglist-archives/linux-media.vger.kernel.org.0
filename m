Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA7A229E61
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 19:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732184AbgGVRVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 13:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729217AbgGVRVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 13:21:09 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DDAC0619DC
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 10:21:09 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id e22so2228718edq.8
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9oQjAxW9raoez//GESU0RtdFQgaxoBAyy+yMJwbspnQ=;
        b=hYEW/tF5QFgkgZyzZSn/gyUoGJ9GWWcgVddASJ8sVNTVUb2XDtg8cs5GOyawgmhdVT
         nLp9c6GcvEFGm1uFwrj1TuMKBsV5DrAsnzN4f2dlE5iaGgsJwJr584u9S+uRcT16klPP
         XAh3xs3KXcXAPRS2z+icQaHx4nDbEOVS7neBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9oQjAxW9raoez//GESU0RtdFQgaxoBAyy+yMJwbspnQ=;
        b=e6dHz5t5FLwOREdhv5155gXjeo80H8wOY0Jzpe+W/cfSeEC1fwZLLfnJeh0oSLcHLX
         pN9tpesSCwQP5KiHp2LRMvWWRpvbDlUZptHVxDsT9TSIaBN5xsXR06GeIW6oGrPxQwkq
         13Y5BqAIW33vaJVE0exoAjL1kGCc0nlUcPlx8/HTHyKQ/89eI3drnyq2DvR4SoSfq5nw
         0pHhOmOV7cPTH+vHLgIvuV0r9BB/FmVjUOyuS7LosWsP0EoBT8mn/IGi6fv8skXlEYum
         ILA2fOIuTv4BHF1g/6rrclllRC5XCXeyeITMiquejf65paLhcv5xISsv68ZAkLiTtd4S
         TBrQ==
X-Gm-Message-State: AOAM530Bcrn1fMpiX1MIFuClilB32RTx+ZwguacVGC1WZXWmp0N7tsvX
        QRly5TILwFjRPLuQFqi4C2pIGrexq6/N8w==
X-Google-Smtp-Source: ABdhPJwYAiELUli75pWFQD3gwW1bJf3FXesW7pPmJntnm6haZ5/c11r8JCIYP+uEcYVUy/eTHvo+fg==
X-Received: by 2002:a50:f08c:: with SMTP id v12mr474053edl.119.1595438467323;
        Wed, 22 Jul 2020 10:21:07 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id w18sm325239edv.11.2020.07.22.10.21.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 10:21:06 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id f1so2111957wro.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 10:21:06 -0700 (PDT)
X-Received: by 2002:adf:ec45:: with SMTP id w5mr493337wrn.415.1595438465765;
 Wed, 22 Jul 2020 10:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-7-dafna.hirschfeld@collabora.com> <a4d0a929-8e54-a72f-0940-1657987c8522@collabora.com>
 <20200722131242.GB1828171@chromium.org> <25ab2b2d-c7f4-24f7-071f-2a99c9339217@collabora.com>
In-Reply-To: <25ab2b2d-c7f4-24f7-071f-2a99c9339217@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 22 Jul 2020 19:20:54 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AibpGtepB+40YdEzbudoemxxXayBwfndLBavjCckYvJQ@mail.gmail.com>
Message-ID: <CAAFQd5AibpGtepB+40YdEzbudoemxxXayBwfndLBavjCckYvJQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 22, 2020 at 7:13 PM Helen Koike <helen.koike@collabora.com> wro=
te:
>
> Hi,
>
> On 7/22/20 10:12 AM, Tomasz Figa wrote:
> > On Fri, Jul 03, 2020 at 05:00:40PM -0300, Helen Koike wrote:
> >> Hi Dafna,
> >>
> >> Thanks for your patch.
> >>
> >> On 7/3/20 2:10 PM, Dafna Hirschfeld wrote:
> >>> The isp entity has a hardware support to force full range quantizatio=
n
> >>> for YUV formats. Use the subdev CSC API to allow userspace to set the
> >>> quantization for YUV formats on the isp entity.
> >>>
> >>> - The flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION is set on
> >>> YUV formats during enumeration of the isp formats on the source pad.
> >>> - The full quantization is set on YUV formats if userspace ask it
> >>> on the isp entity using the flag V4L2_MBUS_FRAMEFMT_SET_CSC.
> >>>
> >>> On the capture and the resizer, the quantization is read-only
> >>> and always set to the default quantization.
> >>>
> >>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>> ---
> >>>  drivers/staging/media/rkisp1/TODO             |  2 +-
> >>>  drivers/staging/media/rkisp1/rkisp1-capture.c | 10 ----------
> >>>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 18 ++++++++++++++---=
-
> >>>  3 files changed, 15 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/medi=
a/rkisp1/TODO
> >>> index c0cbec0a164d..db05288949bd 100644
> >>> --- a/drivers/staging/media/rkisp1/TODO
> >>> +++ b/drivers/staging/media/rkisp1/TODO
> >>> @@ -2,7 +2,7 @@
> >>>  * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
> >>>  * Fix checkpatch errors.
> >>>  * Review and comment every lock
> >>> -* Handle quantization
> >>> +* Add uapi docs. Remeber to add documentation of how quantization is=
 handled.
> >>>  * Document rkisp1-common.h
> >>>  * streaming paths (mainpath and selfpath) check if the other path is=
 streaming
> >>>  in several places of the code, review this, specially that it doesn'=
t seem it
> >>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/=
staging/media/rkisp1/rkisp1-capture.c
> >>> index f69235f82c45..93d6846886f2 100644
> >>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> >>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >>> @@ -1085,8 +1085,6 @@ static void rkisp1_try_fmt(const struct rkisp1_=
capture *cap,
> >>>                        const struct v4l2_format_info **fmt_info)
> >>>  {
> >>>     const struct rkisp1_capture_config *config =3D cap->config;
> >>> -   struct rkisp1_capture *other_cap =3D
> >>> -                   &cap->rkisp1->capture_devs[cap->id ^ 1];
> >>>     const struct rkisp1_capture_fmt_cfg *fmt;
> >>>     const struct v4l2_format_info *info;
> >>>     const unsigned int max_widths[] =3D { RKISP1_RSZ_MP_SRC_MAX_WIDTH=
,
> >>> @@ -1111,14 +1109,6 @@ static void rkisp1_try_fmt(const struct rkisp1=
_capture *cap,
> >>>
> >>>     info =3D rkisp1_fill_pixfmt(pixm, cap->id);
> >>>
> >>> -   /* can not change quantization when stream-on */
> >>> -   if (other_cap->is_streaming)
> >>> -           pixm->quantization =3D other_cap->pix.fmt.quantization;
> >>> -   /* output full range by default, take effect in params */
> >>> -   else if (!pixm->quantization ||
> >>> -            pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
> >>> -           pixm->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> >>> -
> >>>     if (fmt_cfg)
> >>>             *fmt_cfg =3D fmt;
> >>>     if (fmt_info)
> >>> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/stag=
ing/media/rkisp1/rkisp1-isp.c
> >>> index 58c90c67594d..d575c1e4dc4b 100644
> >>> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> >>> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> >>> @@ -589,6 +589,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2=
_subdev *sd,
> >>>
> >>>             if (code->index =3D=3D pos - 1) {
> >>>                     code->code =3D fmt->mbus_code;
> >>> +                   if (fmt->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV &&
> >>> +                       dir =3D=3D RKISP1_ISP_SD_SRC)
> >>> +                           code->flags =3D
> >>> +                                   V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZ=
ATION;
> >>>                     return 0;
> >>>             }
> >>>     }
> >>> @@ -620,7 +624,6 @@ static int rkisp1_isp_init_config(struct v4l2_sub=
dev *sd,
> >>>                                          RKISP1_ISP_PAD_SOURCE_VIDEO)=
;
> >>>     *src_fmt =3D *sink_fmt;
> >>>     src_fmt->code =3D RKISP1_DEF_SRC_PAD_FMT;
> >>> -   src_fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> >>>
> >>>     src_crop =3D v4l2_subdev_get_try_crop(sd, cfg,
> >>>                                         RKISP1_ISP_PAD_SOURCE_VIDEO);
> >>> @@ -663,10 +666,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp=
1_isp *isp,
> >>>             isp->src_fmt =3D mbus_info;
> >>>     src_fmt->width  =3D src_crop->width;
> >>>     src_fmt->height =3D src_crop->height;
> >>> -   src_fmt->quantization =3D format->quantization;
> >>> -   /* full range by default */
> >>> -   if (!src_fmt->quantization)
> >>> +
> >>> +   /*
> >>> +    * The CSC API is used to allow userspace to force full
> >>> +    * quantization on YUV formats.
> >>> +    */
> >>> +   if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
> >>> +       format->quantization =3D=3D V4L2_QUANTIZATION_FULL_RANGE &&
> >>> +       mbus_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV)
> >>>             src_fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> >>> +   else
> >>> +           src_fmt->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> >>
> >> According to the docs [1]:
> >>
> >> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/c=
olorspaces-defs.html?highlight=3Dquantization
> >>
> >> "The default colorspace. This can be used by applications to let the d=
river fill in the colorspace."
> >>
> >> So, in my understanding, the driver should never return V4L2_QUANTIZAT=
ION_DEFAULT to userspace.
> >>
> >
> > The part of the documentation you quoted comes from the description of
> > V4L2_COLORSPACE_DEFAULT and not V4L2_QUANTIZATION_DEFAULT.
> >
> > For the latter it says:
> >
> > "Use the default quantization encoding as defined by the colorspace.
> >  This is always full range for R=E2=80=99G=E2=80=99B=E2=80=99 (except f=
or the BT.2020 colorspace)
> >  and HSV. It is usually limited range for Y=E2=80=99CbCr."
> >
> > Which, in my understanding, doesn't suggest in any way that it shouldn'=
t
> > be returned by the driver. There is also a valid case when the driver
> > simply doesn't know or care what quantization the captured signal uses.
>
> Thanks for this clarification.
>
> >
> > However, in this case, I don't see why we would return DEFAULT here
> > indeed, as the driver has the full knowledge, RGB is full range and YUV
> > is limited range unless full range was requested.
> >
> >> We have the same issue in the resizer.
> >>
> >> I also see an issue in the capture that allows userspace to change qua=
ntization, and this should be fixed.
> >>
> >> In my understanding, since you are leaving all the other pads and vide=
o nodes with read-only quantization,
> >> changing quantization in the ISP source pad should change the readings=
 in all the other pads and video nodes.
> >> So, if all pads are reporting V4L2_QUANTIZATION_LIM_RANGE (which is th=
e default for sRGB colorspace), and userspace sets
> >> V4L2_QUANTIZATION_FULL_RANGE to the isp source pad, then all the other=
 pads and video nodes should also report
> >> V4L2_QUANTIZATION_FULL_RANGE, since this will be the actual quantizati=
on used by the driver.
> >
> > This was extensively discussed at v3:
> > https://patchwork.kernel.org/patch/11493105/
> >
> > The conclusion is that there is no value from both the kernel and the u=
serspace point of
> > view in propagating this to the end of the pipeline, because the
> > hardware components later in the pipeline don't care and the userspace,
> > given the DEFAULT quantization value, can infer the exact quantziation =
from the
> > pipeline - here from what it configured at the ISP entity.
>
> Let's use DEFAULT then, sounds the simplest solution imho, unless you dis=
agree.
>
> Acked-by: Helen Koike <helen.koike@collabora.com>

Yes. Laurent convinced me that it is indeed the right behavior here.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
