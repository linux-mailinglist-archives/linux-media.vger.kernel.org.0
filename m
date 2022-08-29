Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A9A5A428C
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 07:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiH2Fsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 01:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiH2Fsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 01:48:30 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF30246DB4
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 22:48:27 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-32a09b909f6so170837187b3.0
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 22:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=eFYcTSF1mtb3FRbEFeX7FCL5RYHXImCu7b73+Xj9Huw=;
        b=LMBRWQcRzkpudQiV5VHfvcAW+sSFSko6GXMCpc3vMIWWlZW9GQzTPR/kCxjKtwUX81
         CmvldBEsKBcJ9+hzXJlc/8UyrNK8tAotSBx7/dbdgOeB88nwaKaBlFS3JE3ErhsmjkZl
         Xk9z85qPMutIEoQejogbX/Z2n3CmMxjdnysBnoK97Gpg2a74aPinA+l1V0y9uH4vB1fm
         Y5j7iLHMGSWJGjW+zO1Q7SWYPoEstZ+b0ub8zt6LkkwcqPbpwOf9jFrV2ONXfKp5Y3bQ
         My9lixCxu5TAuoWidBcSSL6lkGZD8wz0FQMvJ8z6eTsjgqYztBqRxyi7Gktz4n16Sm1X
         Jbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=eFYcTSF1mtb3FRbEFeX7FCL5RYHXImCu7b73+Xj9Huw=;
        b=p6v0058vkEvfy8OfqKStt7kpzimV7PlVrb1oTtR/V+LfBsI8sofBky/aadcQuoE8ng
         KnhEgtMXs1hfuQiEcemFg15xWAluOHfsTOexkoDp/tL3fJsUxhU4tr/hZUhWVW9e3HTD
         itzrhYm8YZPfL3Nyo6etOsff+4fkU1ooGdibL81zef9M9akGU8739vrumtuU+joTcj74
         RWb0YxblmvikgrUbUO8rVu7MX8YTuu5AWREnMV37w11P5WMthewwXuoVGc1TFA6ut5K/
         Wb5Q2Fjm2sfDtFqMg4Ghm8Sh1Z0Vbr9RKnDrscVf0pH0wZ9gWtyVnu51lRMXuFJZk8sY
         mgsA==
X-Gm-Message-State: ACgBeo1VGpBX1HQQ4jhe46PpTfAhFVPFBa3iUA2GsE5U+5LU8ekIz5YW
        bi4XcUeZzXfbYZIr2vPNKJNZGvIU/lwc1PaJG56Fng==
X-Google-Smtp-Source: AA6agR7fD00ADf3R3VKIXinRnXZ2tMX3C0E6NpBrEB5AtmGkDPS4C+cjl9WA+jGmCuw27Hfws9AV/p1S8aybsjqUvBo=
X-Received: by 2002:a81:8a81:0:b0:33d:829f:644d with SMTP id
 a123-20020a818a81000000b0033d829f644dmr8521356ywg.439.1661752106650; Sun, 28
 Aug 2022 22:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-5-yunkec@google.com>
 <YwaL6BgwEwif7b16@pendragon.ideasonboard.com>
In-Reply-To: <YwaL6BgwEwif7b16@pendragon.ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Mon, 29 Aug 2022 14:48:15 +0900
Message-ID: <CANqU6Fc+Lm1dk4CnBpO_EkfSBFyWZ8msveqfD6V8K_kbyrcBew@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] media: uvcvideo: implement UVC v1.5 ROI
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Laurent,

Thanks for the review!

On Thu, Aug 25, 2022 at 5:37 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch.
>
> On Tue, Jun 28, 2022 at 04:57:02PM +0900, Yunke Cao wrote:
> > Implement support for ROI as described in UVC 1.5:
> > 4.2.2.1.20 Digital Region of Interest (ROI) Control
> >
> > ROI control is implemented using V4L2 control API as
> > two uvc-specific controls:
>
> s/uvc/UVC/
>
> > V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> > V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> >
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 146 ++++++++++++++++++++++++++++-
> >  drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
> >  drivers/media/usb/uvc/uvcvideo.h   |   7 ++
> >  include/uapi/linux/usb/video.h     |   1 +
> >  include/uapi/linux/uvcvideo.h      |  13 +++
> >  include/uapi/linux/v4l2-controls.h |   8 ++
> >  6 files changed, 178 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index 508ee04afbcd..00482269233a 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -355,6 +355,23 @@ static const struct uvc_control_info uvc_ctrls[] =
=3D {
> >               .flags          =3D UVC_CTRL_FLAG_GET_CUR
> >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> >       },
> > +     /* UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get up=
dated
>
>         /*
>          * UVC_CTRL_...
>
> > +      * by sensors.
> > +      * "This RoI should be the same as specified in most recent SET_C=
UR
> > +      * except in the case where the =E2=80=98Auto Detect and Track=E2=
=80=99 and/or
> > +      * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> > +      * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> > +      */
> > +     {
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .index          =3D 21,
> > +             .size           =3D 10,
> > +             .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG=
_GET_CUR
> > +                             | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_G=
ET_MAX
> > +                             | UVC_CTRL_FLAG_GET_DEF
> > +                             | UVC_CTRL_FLAG_AUTO_UPDATE,
> > +     },
> >  };
> >
> >  static const u32 uvc_control_classes[] =3D {
> > @@ -429,6 +446,64 @@ static void uvc_ctrl_set_rel_speed(struct uvc_cont=
rol_mapping *mapping,
> >       data[first+1] =3D min_t(int, abs(value), 0xff);
> >  }
> >
> > +static void uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
> > +                          const struct uvc_rect *uvc_rect)
> > +{
> > +     v4l2_rect->top =3D uvc_rect->top;
> > +     v4l2_rect->left =3D uvc_rect->left;
> > +     v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> > +     v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
>
> What happens if the device sends a bogus value with top > bottom or left
> > right ?
>

Hmm. I didn't think of this.  I guess we should check and return -EINVAL.

> > +}
> > +
> > +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
> > +                         const struct v4l2_rect *v4l2_rect)
> > +{
> > +     // Safely converts s32 and u32 to u16.
>
> C-style comments.
>
> > +     if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
> > +         v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
> > +         v4l2_rect->height > U16_MAX || v4l2_rect->height =3D=3D 0 ||
> > +         v4l2_rect->width > U16_MAX || v4l2_rect->width =3D=3D 0 ||
> > +         v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
> > +         v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
> > +             return -ERANGE;
>
> Doesn't V4L2 adjust the control value instead ?
>

videoc-g-ext-ctrls.rst says
" When the value is out of bounds drivers can choose to take the closest
valid value or return an ERANGE error code, whatever seems more appropriate=
."

I chose to return ERANGE because it's a bit easier. Is it acceptable?

> > +
> > +     uvc_rect->top =3D v4l2_rect->top;
> > +     uvc_rect->left =3D v4l2_rect->left;
> > +     uvc_rect->bottom =3D v4l2_rect->height + v4l2_rect->top - 1;
> > +     uvc_rect->right =3D v4l2_rect->width + v4l2_rect->left - 1;
> > +     return 0;
> > +}
> > +
> > +static int uvc_get_array_rect(struct uvc_control_mapping *mapping,
> > +                           const u8 *data,  u8 *data_out)
> > +{
> > +     struct uvc_rect *uvc_rect;
> > +
> > +     if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> > +             return -EINVAL;
> > +     if (WARN_ON(mapping->size / 8 !=3D sizeof(struct uvc_rect)))
> > +             return -EINVAL;
> > +
>
> These checks should go to mapping creation time.
>
> > +     uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
>
> If the offset happens to not be a multiple of 2 bytes this will cause
> unaligned accesses on some platforms.
>
> > +     uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
>
> Same here if not aligned on 4 bytes.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int uvc_set_array_rect(struct uvc_control_mapping *mapping,
> > +                           const u8 *data_in, u8 *data)
> > +{
> > +     struct uvc_rect *uvc_rect;
> > +
> > +     if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> > +             return -EINVAL;
> > +     if (WARN_ON(mapping->size / 8 !=3D sizeof(struct uvc_rect)))
> > +             return -EINVAL;
> > +
>
> Same here.
>
> > +     uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> > +     return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
> > +}
> > +
> >  static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
> >       {
> >               .id             =3D V4L2_CID_BRIGHTNESS,
> > @@ -728,6 +803,26 @@ static const struct uvc_control_mapping uvc_ctrl_m=
appings[] =3D {
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> >       },
> > +     {
> > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .size           =3D 64,
>
> sizeof(struct uvc_rect)
>
> > +             .offset         =3D 0,
> > +             .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> > +             .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> > +             .get_array      =3D uvc_get_array_rect,
> > +             .set_array      =3D uvc_set_array_rect,
> > +     },
> > +     {
> > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .size           =3D 16,
> > +             .offset         =3D 64,
> > +             .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> > +             .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> > +     },
> >  };
> >
> >  /* -------------------------------------------------------------------=
-----
> > @@ -1061,7 +1156,16 @@ static int __uvc_ctrl_get_compound_to_user(struc=
t uvc_control_mapping *mapping,
> >       if (WARN_ON(!mapping->size % 8))
> >               return -EINVAL;
> >
> > -     size =3D mapping->size / 8;
> > +     switch (mapping->v4l2_type) {
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             size =3D sizeof(struct v4l2_rect);
>
> Oohhh that sounds fragile. I'm worried we may be using mapping->size as
> the V4L2 control size somewhere else.
>
> It would be safer to split the size field of uvc_control_mapping into a
> v4l2_size and a uvc_size (or possibly data_size to match the v4l2_type
> and data_type names) in a patch before this. This will force reviewing
> all the users of the size field to check which size they need.
>

Thanks for the suggestion! That makes a lot of sense. I will try to impleme=
nt
this in the next version, and fix other places you pointed out.

Best,
Yunke

> > +             break;
> > +
> > +     default:
> > +             size =3D mapping->size / 8;
> > +             break;
> > +     }
> > +
> >       if (xctrl->size < size) {
> >               xctrl->size =3D size;
> >               return -ENOSPC;
> > @@ -2578,6 +2682,40 @@ static void uvc_ctrl_prune_entity(struct uvc_dev=
ice *dev,
> >       }
> >  }
> >
> > +static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_contro=
l *ctrl)
> > +{
> > +     int ret;
> > +
> > +     ret =3D uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev->i=
ntfnum,
> > +                          UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +                          uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> > +                          ctrl->info.size);
> > +     if (ret)
> > +             goto out;
> > +
> > +     /*
> > +      * Most firmwares have wrong GET_CURRENT configuration. E.g. it's
>
> s/GET_CURRENT/GET_CUR/
>
> > +      * below GET_MIN, or have rectangle coordinates mixed up. This
> > +      * causes problems sometimes, because we are unable to set
> > +      * auto-controls value without first setting ROI rectangle to
> > +      * valid configuration.
> > +      *
> > +      * We expect that default configuration is always correct and
> > +      * is within the GET_MIN / GET_MAX boundaries.
>
> A dangerous expectation to make given the quality of most UVC camera
> firmwares...
>
> > +      *
> > +      * Set current ROI configuration to GET_DEF, so that we will
> > +      * always have properly configured ROI.
> > +      */
> > +     ret =3D uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
> > +                          UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +                          uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> > +                          ctrl->info.size);
> > +out:
> > +     if (ret)
> > +             dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n", r=
et);
>
> s/(%d)./(%d)/
>
> > +     return ret;
> > +}
> > +
> >  /*
> >   * Add control information and hardcoded stock control mappings to the=
 given
> >   * device.
> > @@ -2590,6 +2728,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_c=
hain *chain,
> >       const struct uvc_control_mapping *mapping =3D uvc_ctrl_mappings;
> >       const struct uvc_control_mapping *mend =3D
> >               mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> > +     const u8 camera_entity[16] =3D UVC_GUID_UVC_CAMERA;
> >
> >       /* XU controls initialization requires querying the device for co=
ntrol
> >        * information. As some buggy UVC devices will crash when queried
> > @@ -2610,6 +2749,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_=
chain *chain,
> >                        * GET_INFO on standard controls.
> >                        */
> >                       uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info)=
;
> > +
> > +                     if (ctrl->info.selector =3D=3D
> > +                             UVC_CT_REGION_OF_INTEREST_CONTROL &&
> > +                         uvc_entity_match_guid(ctrl->entity, camera_en=
tity))
> > +                             uvc_ctrl_init_roi(chain->dev, ctrl);
>
> Should we instead add an init operation to the uvc_control_info
> structure ?
>
> >                       break;
> >                }
> >       }
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
> > index 0366d05895a9..aad61af36271 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -998,7 +998,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file *f=
ile, void *fh,
> >       qec->step =3D qc.step;
> >       qec->default_value =3D qc.default_value;
> >       qec->flags =3D qc.flags;
> > -     qec->elem_size =3D 4;
> > +     if (qc.type =3D=3D V4L2_CTRL_TYPE_RECT)
> > +             qec->elem_size =3D sizeof(struct v4l2_rect);
> > +     else
> > +             qec->elem_size =3D 4;
> >       qec->elems =3D 1;
> >       qec->nr_of_dims =3D 0;
> >       memset(qec->dims, 0, sizeof(qec->dims));
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index 2f9b75faae83..9ff95bbad251 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -431,6 +431,13 @@ struct uvc_streaming_header {
> >       u8 bTriggerUsage;
> >  };
> >
> > +struct uvc_rect {
> > +     u16 top;
> > +     u16 left;
> > +     u16 bottom;
> > +     u16 right;
> > +} __packed;
> > +
> >  enum uvc_buffer_state {
> >       UVC_BUF_STATE_IDLE      =3D 0,
> >       UVC_BUF_STATE_QUEUED    =3D 1,
> > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/vi=
deo.h
> > index bfdae12cdacf..9076a444758a 100644
> > --- a/include/uapi/linux/usb/video.h
> > +++ b/include/uapi/linux/usb/video.h
> > @@ -104,6 +104,7 @@
> >  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                 0x0f
> >  #define UVC_CT_ROLL_RELATIVE_CONTROL                 0x10
> >  #define UVC_CT_PRIVACY_CONTROL                               0x11
> > +#define UVC_CT_REGION_OF_INTEREST_CONTROL            0x14
> >
> >  /* A.9.5. Processing Unit Control Selectors */
> >  #define UVC_PU_CONTROL_UNDEFINED                     0x00
> > diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvide=
o.h
> > index 8288137387c0..e2feee15cb1b 100644
> > --- a/include/uapi/linux/uvcvideo.h
> > +++ b/include/uapi/linux/uvcvideo.h
> > @@ -16,6 +16,7 @@
> >  #define UVC_CTRL_DATA_TYPE_BOOLEAN   3
> >  #define UVC_CTRL_DATA_TYPE_ENUM              4
> >  #define UVC_CTRL_DATA_TYPE_BITMASK   5
> > +#define UVC_CTRL_DATA_TYPE_RECT              6
> >
> >  /* Control flags */
> >  #define UVC_CTRL_FLAG_SET_CUR                (1 << 0)
> > @@ -36,6 +37,18 @@
> >        UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
> >        UVC_CTRL_FLAG_GET_DEF)
> >
> > +/* V4L2 private controls */
> > +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT (V4L2_CID_CAMERA_UVC_BASE=
 + 1)
> > +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (V4L2_CID_CAMERA_UVC_BASE=
 + 2)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                        (=
1 << 1)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE               (=
1 << 2)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                       (=
1 << 3)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY              (=
1 << 7)
> > +
> >  struct uvc_menu_info {
> >       __u32 value;
> >       __u8 name[32];
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index dfff69ed88f7..d85be46e46f2 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1013,6 +1013,14 @@ enum v4l2_auto_focus_range {
> >
> >  #define V4L2_CID_CAMERA_SENSOR_ROTATION              (V4L2_CID_CAMERA_=
CLASS_BASE+35)
> >
> > +/* CAMERA-class private control IDs */
> > +
>
> Why doesn't this go in the driver-specific controls range ?
>
> > +/*
> > + * The base for the uvc driver controls. See linux/uvcvideo.h for the =
list
> > + * of controls. We reserve 16 controls for this driver.
>
> I'd reserve more just in case, UVC 1.5 has quite a few controls that may
> not be exposed through standard V4L2 controls, especially for encoding
> units.
>
> > + */
> > +#define V4L2_CID_CAMERA_UVC_BASE             (V4L2_CID_CAMERA_CLASS_BA=
SE + 0x1000)
> > +
> >  /* FM Modulator class control IDs */
> >
> >  #define V4L2_CID_FM_TX_CLASS_BASE            (V4L2_CTRL_CLASS_FM_TX | =
0x900)
>
> --
> Regards,
>
> Laurent Pinchart
