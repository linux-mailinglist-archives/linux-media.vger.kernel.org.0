Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F53E766540
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 09:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234180AbjG1HZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 03:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234236AbjG1HZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 03:25:37 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66772D5F
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 00:25:26 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-63d48c3d242so1998986d6.2
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 00:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690529125; x=1691133925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHP8me6VokRySX8+Juk9IP6BLwxcpF71AvYOtabkpks=;
        b=CbzJ26aeUmReO+Sp3FlLVAUZHzPeoSzWP5/pnFXq75nvqiG5GHCafAAgDE9FPcdAgD
         RWFbJG8Ucwaz8i6+0KMIvRhJvuzdVzFHKvxPAsIO/MPv2lsKdpO2W+NlWUieCNblb85P
         2zirhKF1raJQiQtAB8Fn7Uw7NpxB/EjVPhjYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690529125; x=1691133925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHP8me6VokRySX8+Juk9IP6BLwxcpF71AvYOtabkpks=;
        b=H0xRuKbb1DS70rIg8TAvknBcpPtHATbHLsY9A/bG6ByJuhVkSA7RoQq0lo4DrWPquS
         s+haDY7/YxMe1CCIUWM5lKANfsRndfm8HW7eLH6TcILII3e6R8c3pOT/uXgN/WUQB/VE
         opCOCrZ6r2pH7LmJ8rnJnPjI+khHEEkGnJZ1/lLqO80+GKNjM6fRaiBpV5pt55rbmmzL
         /cl4zeuRwR+knfwy1Q6BhhZGk0P+H87dbqRC+r2N9y8usC5WAatFVQ/Y1SlmpW9U+jfb
         4tVvjyYI/Jdl+4QnrMmQtQq9R9F4/ixMnnAeDW55FrwyH88n/8WYPi7ZukWnGI4Lp00u
         vMng==
X-Gm-Message-State: ABy/qLb106quvyfMQxBMUtAUCDm+K7QuWFBRMeNEeJoPsPGOvSfAWMTU
        +35vIQYFeG8nunYmp8S+1WJxp8ByR+SpuuvOxcE+HwQ8
X-Google-Smtp-Source: APBJJlHR33GtRcwvFKba7t+38KVBt4P2zhVQ+C1Rbm4x//zKKRhrwU9DkqzaXO3/006ZwTKR4dGxVw==
X-Received: by 2002:a05:6214:21a9:b0:63d:2369:6c41 with SMTP id t9-20020a05621421a900b0063d23696c41mr2063087qvc.55.1690529125306;
        Fri, 28 Jul 2023 00:25:25 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id e30-20020a0caa5e000000b0063d10086876sm1022837qvb.115.2023.07.28.00.25.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:25:24 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-63c70dc7ed2so11689836d6.0
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 00:25:24 -0700 (PDT)
X-Received: by 2002:a0c:b246:0:b0:63c:ed11:7bf0 with SMTP id
 k6-20020a0cb246000000b0063ced117bf0mr1593631qve.6.1690528721048; Fri, 28 Jul
 2023 00:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230206043308.28365-1-ayaka@soulik.info> <20230206043308.28365-3-ayaka@soulik.info>
 <20230713103912.favcnhqwjkzvsa6b@chromium.org> <46d15120-6e19-e224-47f3-e0dcbf0aeda5@soulik.info>
In-Reply-To: <46d15120-6e19-e224-47f3-e0dcbf0aeda5@soulik.info>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 28 Jul 2023 16:18:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DwEnKznBcJCiC06dU5xJO0Lw6fJSudEfntgLt8fmc+aQ@mail.gmail.com>
Message-ID: <CAAFQd5DwEnKznBcJCiC06dU5xJO0Lw6fJSudEfntgLt8fmc+aQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] media: vivid: Convert to v4l2_ext_pix_format
To:     Randy Li <ayaka@soulik.info>
Cc:     linux-media@vger.kernel.org, randy.li@synaptics.com,
        Brian.Starkey@arm.com, boris.brezillon@collabora.com,
        frkoenig@chromium.org, hans.verkuil@cisco.com, hiroh@chromium.org,
        hverkuil@xs4all.nl, kernel@collabora.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, narmstrong@baylibre.com, nicolas@ndufresne.ca,
        sakari.ailus@iki.fi, stanimir.varbanov@linaro.org,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 18, 2023 at 1:00=E2=80=AFAM Randy Li <ayaka@soulik.info> wrote:
>
>
> On 2023/7/13 18:39, Tomasz Figa wrote:
> > On Mon, Feb 06, 2023 at 12:33:01PM +0800, ayaka wrote:
> >> From: Helen Koike <helen.koike@collabora.com>
> >>
> >> Simplify Multi/Single planer API handling by converting to v4l2_ext_pi=
x_format.
> >>
> >> Duplicate v4l2_ioctl_ops for touch devices. This is done to force the
> >> framework to use the ext hooks when the classic Api is used from
> >> userspace in Vid devices, and to keep touch devices with classic hook.
> >>
> >> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >> ---
> >> Changes in v7:
> >> - Force the userspace using the new APIs to operate non-touch drivers.
> > The primary objective of Linux development is not to break the
> > userspace. We can't just remove the old API, especially not from
> > existing drivers.
> Maybe I should create a new virtual driver here? It is impossible to
> support the new fourcc modifier with the old APIs.

We need to find a way to make an existing driver support both the old
and new API. Obviously any new functionality of the new API doesn't
have to be retrofitted to the old API.

> >
> > [snip]
> >>   int vivid_try_fmt_vid_cap(struct file *file, void *priv,
> >> -                    struct v4l2_format *f)
> >> +                      struct v4l2_ext_pix_format *f)
> >>   {
> >> -    struct v4l2_pix_format_mplane *mp =3D &f->fmt.pix_mp;
> >> -    struct v4l2_plane_pix_format *pfmt =3D mp->plane_fmt;
> >>      struct vivid_dev *dev =3D video_drvdata(file);
> >> +    struct v4l2_plane_pix_format *pfmt =3D f->plane_fmt;
> >>      const struct vivid_fmt *fmt;
> >>      unsigned bytesperline, max_bpl;
> >>      unsigned factor =3D 1;
> >>      unsigned w, h;
> >>      unsigned p;
> >> -    bool user_set_csc =3D !!(mp->flags & V4L2_PIX_FMT_FLAG_SET_CSC);
> > Why is this condition being removed?
>
> Because the v4l2_ext_pix has a struct for the colorspace?

What do you mean? I see it has the same enum field for colorspace as
the original v4l2_pix_format_mplane.

The flag was needed for CAPTURE format to tell the driver whether it
should perform a conversion to the requested colorspace or just fill
in the color space as inferred from the current configuration (e.g.
OUTPUT format).
How was that addressed in the new API?

>
> Would you like the idea that driver exports a buffer contains all the
> info for an enumeration ?
>
> >
> > Best regards,
> > Tomasz
> >
> >>
> >> -    fmt =3D vivid_get_format(dev, mp->pixelformat);
> >> +    fmt =3D vivid_get_format(dev, f->pixelformat);
> >>      if (!fmt) {
> >>              dprintk(dev, 1, "Fourcc format (0x%08x) unknown.\n",
> >> -                    mp->pixelformat);
> >> -            mp->pixelformat =3D V4L2_PIX_FMT_YUYV;
> >> -            fmt =3D vivid_get_format(dev, mp->pixelformat);
> >> +                    f->pixelformat);
> >> +            f->pixelformat =3D V4L2_PIX_FMT_YUYV;
> >> +            fmt =3D vivid_get_format(dev, f->pixelformat);
> >>      }
> >>
> >> -    mp->field =3D vivid_field_cap(dev, mp->field);
> >> +    f->field =3D vivid_field_cap(dev, f->field);
> >>      if (vivid_is_webcam(dev)) {
> >>              const struct v4l2_frmsize_discrete *sz =3D
> >>                      v4l2_find_nearest_size(webcam_sizes,
> >>                                             VIVID_WEBCAM_SIZES, width,
> >> -                                           height, mp->width, mp->hei=
ght);
> >> +                                           height, f->width, f->heigh=
t);
> >>
> >>              w =3D sz->width;
> >>              h =3D sz->height;
> >> @@ -604,14 +603,14 @@ int vivid_try_fmt_vid_cap(struct file *file, voi=
d *priv,
> >>              w =3D dev->src_rect.width;
> >>              h =3D dev->src_rect.height;
> >>      }
> >> -    if (V4L2_FIELD_HAS_T_OR_B(mp->field))
> >> +    if (V4L2_FIELD_HAS_T_OR_B(f->field))
> >>              factor =3D 2;
> >>      if (vivid_is_webcam(dev) ||
> >>          (!dev->has_scaler_cap && !dev->has_crop_cap && !dev->has_comp=
ose_cap)) {
> >> -            mp->width =3D w;
> >> -            mp->height =3D h / factor;
> >> +            f->width =3D w;
> >> +            f->height =3D h / factor;
> >>      } else {
> >> -            struct v4l2_rect r =3D { 0, 0, mp->width, mp->height * fa=
ctor };
> >> +            struct v4l2_rect r =3D { 0, 0, f->width, f->height * fact=
or };
> >>
> >>              v4l2_rect_set_min_size(&r, &vivid_min_rect);
> >>              v4l2_rect_set_max_size(&r, &vivid_max_rect);
> >> @@ -624,16 +623,15 @@ int vivid_try_fmt_vid_cap(struct file *file, voi=
d *priv,
> >>              } else if (!dev->has_scaler_cap && !dev->has_crop_cap) {
> >>                      v4l2_rect_set_min_size(&r, &dev->src_rect);
> >>              }
> >> -            mp->width =3D r.width;
> >> -            mp->height =3D r.height / factor;
> >> +            f->width =3D r.width;
> >> +            f->height =3D r.height / factor;
> >>      }
> >>
> >>      /* This driver supports custom bytesperline values */
> >>
> >> -    mp->num_planes =3D fmt->buffers;
> >>      for (p =3D 0; p < fmt->buffers; p++) {
> >>              /* Calculate the minimum supported bytesperline value */
> >> -            bytesperline =3D (mp->width * fmt->bit_depth[p]) >> 3;
> >> +            bytesperline =3D (f->width * fmt->bit_depth[p]) >> 3;
> >>              /* Calculate the maximum supported bytesperline value */
> >>              max_bpl =3D (MAX_ZOOM * MAX_WIDTH * fmt->bit_depth[p]) >>=
 3;
> >>
> >> @@ -642,48 +640,49 @@ int vivid_try_fmt_vid_cap(struct file *file, voi=
d *priv,
> >>              if (pfmt[p].bytesperline < bytesperline)
> >>                      pfmt[p].bytesperline =3D bytesperline;
> >>
> >> -            pfmt[p].sizeimage =3D (pfmt[p].bytesperline * mp->height)=
 /
> >> +            pfmt[p].sizeimage =3D (pfmt[p].bytesperline * f->height) =
/
> >>                              fmt->vdownsampling[p] + fmt->data_offset[=
p];
> >> -
> >> -            memset(pfmt[p].reserved, 0, sizeof(pfmt[p].reserved));
> >>      }
> >> +
> >> +    if (p < VIDEO_MAX_PLANES)
> >> +            pfmt[p].sizeimage =3D 0;
> >> +
> >>      for (p =3D fmt->buffers; p < fmt->planes; p++)
> >> -            pfmt[0].sizeimage +=3D (pfmt[0].bytesperline * mp->height=
 *
> >> +            pfmt[0].sizeimage +=3D (pfmt[0].bytesperline * f->height =
*
> >>                      (fmt->bit_depth[p] / fmt->vdownsampling[p])) /
> >>                      (fmt->bit_depth[0] / fmt->vdownsampling[0]);
> >>
> >> -    if (!user_set_csc || !v4l2_is_colorspace_valid(mp->colorspace))
> >> -            mp->colorspace =3D vivid_colorspace_cap(dev);
> >> +    if (!v4l2_is_colorspace_valid(f->colorspace))
> >> +            f->colorspace =3D vivid_colorspace_cap(dev);
> >>
> >> -    if (!user_set_csc || !v4l2_is_xfer_func_valid(mp->xfer_func))
> >> -            mp->xfer_func =3D vivid_xfer_func_cap(dev);
> >> +    if (!v4l2_is_xfer_func_valid(f->xfer_func))
> >> +            f->xfer_func =3D vivid_xfer_func_cap(dev);
> >>
> >>      if (fmt->color_enc =3D=3D TGP_COLOR_ENC_HSV) {
> >> -            if (!user_set_csc || !v4l2_is_hsv_enc_valid(mp->hsv_enc))
> >> -                    mp->hsv_enc =3D vivid_hsv_enc_cap(dev);
> >> +            if (!v4l2_is_hsv_enc_valid(f->hsv_enc))
> >> +                    f->hsv_enc =3D vivid_hsv_enc_cap(dev);
> >>      } else if (fmt->color_enc =3D=3D TGP_COLOR_ENC_YCBCR) {
> >> -            if (!user_set_csc || !v4l2_is_ycbcr_enc_valid(mp->ycbcr_e=
nc))
> >> -                    mp->ycbcr_enc =3D vivid_ycbcr_enc_cap(dev);
> >> +            if (!v4l2_is_ycbcr_enc_valid(f->ycbcr_enc))
> >> +                    f->ycbcr_enc =3D vivid_ycbcr_enc_cap(dev);
> >>      } else {
> >> -            mp->ycbcr_enc =3D vivid_ycbcr_enc_cap(dev);
> >> +            f->ycbcr_enc =3D vivid_ycbcr_enc_cap(dev);
> >>      }
> >>
> >>      if (fmt->color_enc =3D=3D TGP_COLOR_ENC_YCBCR ||
> >>          fmt->color_enc =3D=3D TGP_COLOR_ENC_RGB) {
> >> -            if (!user_set_csc || !v4l2_is_quant_valid(mp->quantizatio=
n))
> >> -                    mp->quantization =3D vivid_quantization_cap(dev);
> >> +            if (!v4l2_is_quant_valid(f->quantization))
> >> +                    f->quantization =3D vivid_quantization_cap(dev);
> >>      } else {
> >> -            mp->quantization =3D vivid_quantization_cap(dev);
> >> +            f->quantization =3D vivid_quantization_cap(dev);
> >>      }
> >>
> >> -    memset(mp->reserved, 0, sizeof(mp->reserved));
> >> +    memset(f->reserved, 0, sizeof(f->reserved));
> >>      return 0;
> >>   }
> > [snip]
