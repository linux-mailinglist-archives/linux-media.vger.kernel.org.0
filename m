Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F82534857
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 03:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235955AbiEZBsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 21:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235790AbiEZBsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 21:48:24 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DF0A0D04
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 18:48:23 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2ff7b90e635so1745987b3.5
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 18:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PtH7doDT+MxL5sQvaQOQLLZdvttQY3KyVR4SioFhTYk=;
        b=LJVNhU3/xaVbE+dYuPQ78x4tOo1bpTDlBiY+3e2JKqhDU3hjVtP94HZ2sKXe8G3z7/
         tdoVidLNte8jFtSw8V5St4HMo7rcA5WNKSTHvb7ds9ZV3yjNRLZthSjKrgRvCt0K5oRA
         8I/mpQHqke6a7OQgOHOVn1c+g0kT5Zo0kqHz0+IqscomWrzx3unEFYumam1EUVimKbm/
         x/YQkCxbIJ0zotnm49rFjlNtZr3lo/xOStHLhLL3h4mcZCEZt6Hf5kDZgwPlBgfO/s3L
         S74kwhetOJoRQgfkx+7xMsFBP9vgpFTQ0bFPhyAAA14ijjdXGzAnuEKwE+oTo4ueRkLy
         PJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PtH7doDT+MxL5sQvaQOQLLZdvttQY3KyVR4SioFhTYk=;
        b=sQhypWyUAVPdCoQOEwgyHNhAXY9XEZNqZQJWfrJc7Nz0P1yg19e5FuUz0RGLP+h0n0
         Ma70l4gJ8QZj4t8h4++Io4Qc0MKuFbsgEaJnzsyNDR3AvgIyzgag9jskTZy6j6Mc9yL0
         Gvn0gJ87FgnzHVyt97DkSulqBI5+INHOPtJ5LZVf81LjfD4qKPhufbCGCY4LTjpc23wt
         alxxEFm4kVyCA22go4vfUuRQ3B4w9cK5ecJGl9J5p/UMc7PvaxGeQDjTKit0yoqufZ6O
         vCb90z0+2P4YIgXfXeYc2GyuHzQdpO9Oh7mKIzv3IbpmDzs4MuG68XouCdO+nUOwtpH0
         mlTQ==
X-Gm-Message-State: AOAM532fePmzNmBdHQXYAK9/vKU4watdV5suG3JEnC6gAD/Og3CFFIOx
        GsW2KZb0Yi3ZQQGsLrg15GDZDk5QOA6oKDPBaYtqebvnTrg=
X-Google-Smtp-Source: ABdhPJxL+2QUsjtAFcgyWLEWKU5OZ7kxK1im6FznxAdbkFXjSTzwksZBGjoD1JiCxdG+K2OxQ4rK0NhjRUx2BCsJCo8=
X-Received: by 2002:a0d:c3c3:0:b0:2ff:64d5:6e08 with SMTP id
 f186-20020a0dc3c3000000b002ff64d56e08mr34364250ywd.439.1653529701904; Wed, 25
 May 2022 18:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220524044507.1696012-1-yunkec@google.com> <20220524044507.1696012-2-yunkec@google.com>
 <CANiDSCux+Bjanm9E4_KQbDcYWy27WDaT=MGyqKeGB419Ym7k5Q@mail.gmail.com>
In-Reply-To: <CANiDSCux+Bjanm9E4_KQbDcYWy27WDaT=MGyqKeGB419Ym7k5Q@mail.gmail.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Thu, 26 May 2022 10:48:11 +0900
Message-ID: <CANqU6FfxcB1R+=G4t3aYRt09iPnrBRX9Oty1u+pmQzzTUc=7tw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Yes, thanks for catching that!

Best,
Yunke

On Tue, May 24, 2022 at 6:31 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Yunke
>
> Thanks for your patch.
>
> Just a minor comment
>
> On Tue, 24 May 2022 at 06:45, Yunke Cao <yunkec@google.com> wrote:
> >
> > Add p_rect to struct v4l2_ext_control with basic support in
> > v4l2-ctrls.
> >
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
> >  .../media/videodev2.h.rst.exceptions          |  1 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
> >  include/media/v4l2-ctrls.h                    |  2 ++
> >  include/uapi/linux/videodev2.h                |  2 ++
> >  5 files changed, 29 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > index 29971a45a2d4..f4e205ead0a2 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > @@ -189,6 +189,10 @@ still cause this situation.
> >        - ``p_area``
> >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> >          of type ``V4L2_CTRL_TYPE_AREA``.
> > +    * - struct :c:type:`v4l2_rect` *
> > +      - ``p_area``
>
> I guess you mean: p_rect
>
> > +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
> > +        of type ``V4L2_CTRL_TYPE_RECT``.
> >      * - struct :c:type:`v4l2_ctrl_h264_sps` *
> >        - ``p_h264_sps``
> >        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 9cbb7a0c354a..7b423475281d 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> > +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 8968cec8454e..384d12a9638b 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
> >                 return ptr1.p_u16[idx] == ptr2.p_u16[idx];
> >         case V4L2_CTRL_TYPE_U32:
> >                 return ptr1.p_u32[idx] == ptr2.p_u32[idx];
> > +       case V4L2_CTRL_TYPE_RECT:
> > +               return ptr1.p_rect->top == ptr2.p_rect->top &&
> > +                      ptr1.p_rect->left == ptr2.p_rect->left &&
> > +                      ptr1.p_rect->height == ptr2.p_rect->height &&
> > +                      ptr1.p_rect->width == ptr2.p_rect->width;
> >         default:
> >                 if (ctrl->is_int)
> >                         return ptr1.p_s32[idx] == ptr2.p_s32[idx];
> > @@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ctrl)
> >         case V4L2_CTRL_TYPE_VP9_FRAME:
> >                 pr_cont("VP9_FRAME");
> >                 break;
> > +       case V4L2_CTRL_TYPE_RECT:
> > +               pr_cont("%ux%u@%dx%d",
> > +                       ptr.p_rect->width, ptr.p_rect->height,
> > +                       ptr.p_rect->left, ptr.p_rect->top);
> > +               break;
> >         default:
> >                 pr_cont("unknown type %d", ctrl->type);
> >                 break;
> > @@ -525,6 +535,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >         struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> >         struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> >         struct v4l2_area *area;
> > +       struct v4l2_rect *rect;
> >         void *p = ptr.p + idx * ctrl->elem_size;
> >         unsigned int i;
> >
> > @@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >                         return -EINVAL;
> >                 break;
> >
> > +       case V4L2_CTRL_TYPE_RECT:
> > +               rect = p;
> > +               if (!rect->width || !rect->height)
> > +                       return -EINVAL;
> > +               break;
> > +
> >         default:
> >                 return -EINVAL;
> >         }
> > @@ -1456,6 +1473,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >         case V4L2_CTRL_TYPE_AREA:
> >                 elem_size = sizeof(struct v4l2_area);
> >                 break;
> > +       case V4L2_CTRL_TYPE_RECT:
> > +               elem_size = sizeof(struct v4l2_rect);
> > +               break;
> >         default:
> >                 if (type < V4L2_CTRL_COMPOUND_TYPES)
> >                         elem_size = sizeof(s32);
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index b3ce438f1329..919e104de50b 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -58,6 +58,7 @@ struct video_device;
> >   * @p_hdr10_cll:               Pointer to an HDR10 Content Light Level structure.
> >   * @p_hdr10_mastering:         Pointer to an HDR10 Mastering Display structure.
> >   * @p_area:                    Pointer to an area.
> > + * @p_rect:                    Pointer to a rectangle.
> >   * @p:                         Pointer to a compound value.
> >   * @p_const:                   Pointer to a constant compound value.
> >   */
> > @@ -87,6 +88,7 @@ union v4l2_ctrl_ptr {
> >         struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
> >         struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> >         struct v4l2_area *p_area;
> > +       struct v4l2_rect *p_rect;
> >         void *p;
> >         const void *p_const;
> >  };
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 3768a0a80830..b712412cf763 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1751,6 +1751,7 @@ struct v4l2_ext_control {
> >                 __u16 __user *p_u16;
> >                 __u32 __user *p_u32;
> >                 struct v4l2_area __user *p_area;
> > +               struct v4l2_rect __user *p_rect;
> >                 struct v4l2_ctrl_h264_sps __user *p_h264_sps;
> >                 struct v4l2_ctrl_h264_pps *p_h264_pps;
> >                 struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
> > @@ -1810,6 +1811,7 @@ enum v4l2_ctrl_type {
> >         V4L2_CTRL_TYPE_U16           = 0x0101,
> >         V4L2_CTRL_TYPE_U32           = 0x0102,
> >         V4L2_CTRL_TYPE_AREA          = 0x0106,
> > +       V4L2_CTRL_TYPE_RECT          = 0x0107,
> >
> >         V4L2_CTRL_TYPE_HDR10_CLL_INFO           = 0x0110,
> >         V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY  = 0x0111,
> > --
> > 2.36.1.124.g0e6072fb45-goog
> >
>
>
> --
> Ricardo Ribalda
