Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5328F76C64A
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 09:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbjHBHTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 03:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjHBHTi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 03:19:38 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3124C1981
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 00:19:36 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4039a2b71c1so37441171cf.0
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690960774; x=1691565574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbMvUxwH+/+y3la1xiXvJTcsHrArNwK80KsvHS3wgHI=;
        b=ETtEoNZvnjIBRiuHg18aaJj9lWN9itCP7KatlxIPWQ4BVkrWVd9Hs3OVR7KiXBvXZX
         ELat7kx0R40ZAqmd+vw5l6NwvIegkuEjf5hg3gs/22hy2rQU7GSOmOUpCyC1VTOI4lTe
         i8uG8m56winr/X6ogtu71//Sxua0RgEaI1f0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690960774; x=1691565574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbMvUxwH+/+y3la1xiXvJTcsHrArNwK80KsvHS3wgHI=;
        b=NNXSZ1agor+vEHs75QtG8MRuLkAsvreCukk19safHa72IItQjbBKTh0ESdatQs627p
         y82Vf1b5KMHyIajOQeHy/EVbUnuWsFOdg9ngek2cNgSfFvJ+Bl7sKLhvFJPYPyhRBs5M
         Yapo5hO42Y8bB7sASzs3oZukgnFBrKLl7Atbii3k2C+LSQknQCcuvcl2mujipE8d7mNW
         pf4eyBoKE5tNOHfwCDEfbMqhOXnfkXe60FpjJONdn676LijtlFLAQQXxi73WOYa4UnWg
         UREszwhaLIlNS+39b4NC7vmBR47qCF2SlF1QupBuhHGygxX3tA59Is9+QuvfWxSK7t4s
         vmHA==
X-Gm-Message-State: ABy/qLbiXsN7sT7rlfY80cjL0fcGEr4+2ab8y1+oFA75SWsNO/aexpdK
        EQ0EFAYktEbHLxYr6MaFTqJYePabjcErNIRexvq9+9sQ
X-Google-Smtp-Source: APBJJlGdqe5CSiKTxfJyWIShf6ejWcdCNHgXhFnSXqvbozcGVIcBBTvEj/N5tAjWQ0ggNVycPFypxg==
X-Received: by 2002:a05:620a:1710:b0:767:11b1:de09 with SMTP id az16-20020a05620a171000b0076711b1de09mr15766748qkb.4.1690960774464;
        Wed, 02 Aug 2023 00:19:34 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id d13-20020a05620a158d00b0076cce1e9a1csm420307qkk.31.2023.08.02.00.19.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 00:19:33 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76c9334baedso278313985a.2
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 00:19:32 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:768:34e2:6473 with SMTP id
 y8-20020a05620a25c800b0076834e26473mr14652022qko.73.1690960772081; Wed, 02
 Aug 2023 00:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <1690265540-25999-5-git-send-email-shengjiu.wang@nxp.com> <20230728075933.pdepqspznenazs5f@chromium.org>
 <CAA+D8APU-F93JH539cUYDJ83PeMQwyfNV1kF7iGSmZrsdSeiUg@mail.gmail.com>
In-Reply-To: <CAA+D8APU-F93JH539cUYDJ83PeMQwyfNV1kF7iGSmZrsdSeiUg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 2 Aug 2023 16:19:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AD9U8F0DzLLGMVE6EiVPiNRd5v5fLCcvGputSBmLc-0g@mail.gmail.com>
Message-ID: <CAAFQd5AD9U8F0DzLLGMVE6EiVPiNRd5v5fLCcvGputSBmLc-0g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/7] media: v4l2: Add audio capture and output support
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
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

On Tue, Aug 1, 2023 at 6:47=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Fri, Jul 28, 2023 at 3:59=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> =
wrote:
> >
> > Hi Shengjiu,
> >
> > On Tue, Jul 25, 2023 at 02:12:17PM +0800, Shengjiu Wang wrote:
> > > Audio signal processing has the requirement for memory to
> > > memory similar as Video.
> > >
> > > This patch is to add this support in v4l2 framework, defined
> > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > for audio case usage.
> > >
> > > The created audio device is named "/dev/audioX".
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> > >  drivers/media/v4l2-core/v4l2-dev.c            | 17 ++++++
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          | 52 +++++++++++++++++=
++
> > >  include/media/v4l2-dev.h                      |  2 +
> > >  include/media/v4l2-ioctl.h                    | 34 ++++++++++++
> > >  include/uapi/linux/videodev2.h                | 19 +++++++
> > >  6 files changed, 128 insertions(+)
> > >
> >
> > Thanks for the patch! Please check my comments inline.
>
> Thanks for reviewing.
>
> Sorry for sending again for using the plain text mode.
>
> >
> > > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/driver=
s/media/common/videobuf2/videobuf2-v4l2.c
> > > index c7a54d82a55e..12f2be2773a2 100644
> > > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > @@ -785,6 +785,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct =
v4l2_create_buffers *create)
> > >       case V4L2_BUF_TYPE_META_OUTPUT:
> > >               requested_sizes[0] =3D f->fmt.meta.buffersize;
> > >               break;
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             requested_sizes[0] =3D f->fmt.audio.buffersize;
> > > +             break;
> > >       default:
> > >               return -EINVAL;
> > >       }
> > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-=
core/v4l2-dev.c
> > > index f81279492682..67484f4c6eaf 100644
> > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > @@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct video_d=
evice *vdev)
> > >       bool is_tch =3D vdev->vfl_type =3D=3D VFL_TYPE_TOUCH;
> > >       bool is_meta =3D vdev->vfl_type =3D=3D VFL_TYPE_VIDEO &&
> > >                      (vdev->device_caps & meta_caps);
> > > +     bool is_audio =3D vdev->vfl_type =3D=3D VFL_TYPE_AUDIO;
> > >       bool is_rx =3D vdev->vfl_dir !=3D VFL_DIR_TX;
> > >       bool is_tx =3D vdev->vfl_dir !=3D VFL_DIR_RX;
> > >       bool is_io_mc =3D vdev->device_caps & V4L2_CAP_IO_MC;
> > > @@ -664,6 +665,19 @@ static void determine_valid_ioctls(struct video_=
device *vdev)
> > >               SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_ou=
t);
> > >               SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_met=
a_out);
> > >       }
> > > +     if (is_audio && is_rx) {
> > > +             /* audio capture specific ioctls */
> > > +             SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_a=
udio_cap);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_c=
ap);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_c=
ap);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_aud=
io_cap);
> > > +     } else if (is_audio && is_tx) {
> > > +             /* audio output specific ioctls */
> > > +             SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_a=
udio_out);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_o=
ut);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_o=
ut);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_aud=
io_out);
> > > +     }
> > >       if (is_vbi) {
> > >               /* vbi specific ioctls */
> > >               if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
> > > @@ -927,6 +941,9 @@ int __video_register_device(struct video_device *=
vdev,
> > >       case VFL_TYPE_TOUCH:
> > >               name_base =3D "v4l-touch";
> > >               break;
> > > +     case VFL_TYPE_AUDIO:
> > > +             name_base =3D "audio";
> >
> > I think it was mentioned before that "audio" could be confusing. Wasn't
> > there actually some other kind of /dev/audio device long ago?
> >
> > Seems like for touch, "v4l-touch" was introduced. Maybe it would also
> > make sense to call it "v4l-audio" for audio?
>
> Ok,  will change to use "v4l-audio".
>
> >
> > > +             break;
> > >       default:
> > >               pr_err("%s called with unknown type: %d\n",
> > >                      __func__, type);
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> > > index 01ba27f2ef87..aa9d872bba8d 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -188,6 +188,8 @@ const char *v4l2_type_names[] =3D {
> > >       [V4L2_BUF_TYPE_SDR_OUTPUT]         =3D "sdr-out",
> > >       [V4L2_BUF_TYPE_META_CAPTURE]       =3D "meta-cap",
> > >       [V4L2_BUF_TYPE_META_OUTPUT]        =3D "meta-out",
> > > +     [V4L2_BUF_TYPE_AUDIO_CAPTURE]      =3D "audio-cap",
> > > +     [V4L2_BUF_TYPE_AUDIO_OUTPUT]       =3D "audio-out",
> > >  };
> > >  EXPORT_SYMBOL(v4l2_type_names);
> > >
> > > @@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, boo=
l write_only)
> > >       const struct v4l2_sliced_vbi_format *sliced;
> > >       const struct v4l2_window *win;
> > >       const struct v4l2_meta_format *meta;
> > > +     const struct v4l2_audio_format *audio;
> > >       u32 pixelformat;
> > >       u32 planes;
> > >       unsigned i;
> > > @@ -346,6 +349,12 @@ static void v4l_print_format(const void *arg, bo=
ol write_only)
> > >               pr_cont(", dataformat=3D%p4cc, buffersize=3D%u\n",
> > >                       &pixelformat, meta->buffersize);
> > >               break;
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             audio =3D &p->fmt.audio;
> > > +             pr_cont(", rate=3D%u, format=3D%u, channels=3D%u, buffe=
rsize=3D%u\n",
> > > +                     audio->rate, audio->format, audio->channels, au=
dio->buffersize);
> > > +             break;
> > >       }
> > >  }
> > >
> > > @@ -927,6 +936,7 @@ static int check_fmt(struct file *file, enum v4l2=
_buf_type type)
> > >       bool is_tch =3D vfd->vfl_type =3D=3D VFL_TYPE_TOUCH;
> > >       bool is_meta =3D vfd->vfl_type =3D=3D VFL_TYPE_VIDEO &&
> > >                      (vfd->device_caps & meta_caps);
> > > +     bool is_audio =3D vfd->vfl_type =3D=3D VFL_TYPE_AUDIO;
> > >       bool is_rx =3D vfd->vfl_dir !=3D VFL_DIR_TX;
> > >       bool is_tx =3D vfd->vfl_dir !=3D VFL_DIR_RX;
> > >
> > > @@ -992,6 +1002,14 @@ static int check_fmt(struct file *file, enum v4=
l2_buf_type type)
> > >               if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
> > >                       return 0;
> > >               break;
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             if (is_audio && is_rx && ops->vidioc_g_fmt_audio_cap)
> > > +                     return 0;
> > > +             break;
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             if (is_audio && is_tx && ops->vidioc_g_fmt_audio_out)
> > > +                     return 0;
> > > +             break;
> > >       default:
> > >               break;
> > >       }
> > > @@ -1594,6 +1612,16 @@ static int v4l_enum_fmt(const struct v4l2_ioct=
l_ops *ops,
> > >                       break;
> > >               ret =3D ops->vidioc_enum_fmt_meta_out(file, fh, arg);
> > >               break;
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             if (unlikely(!ops->vidioc_enum_fmt_audio_cap))
> > > +                     break;
> > > +             ret =3D ops->vidioc_enum_fmt_audio_cap(file, fh, arg);
> > > +             break;
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             if (unlikely(!ops->vidioc_enum_fmt_audio_out))
> > > +                     break;
> > > +             ret =3D ops->vidioc_enum_fmt_audio_out(file, fh, arg);
> > > +             break;
> > >       }
> > >       if (ret =3D=3D 0)
> > >               v4l_fill_fmtdesc(p);
> > > @@ -1670,6 +1698,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_o=
ps *ops,
> > >               return ops->vidioc_g_fmt_meta_cap(file, fh, arg);
> > >       case V4L2_BUF_TYPE_META_OUTPUT:
> > >               return ops->vidioc_g_fmt_meta_out(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             return ops->vidioc_g_fmt_audio_cap(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             return ops->vidioc_g_fmt_audio_out(file, fh, arg);
> > >       }
> > >       return -EINVAL;
> > >  }
> > > @@ -1781,6 +1813,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_o=
ps *ops,
> > >                       break;
> > >               memset_after(p, 0, fmt.meta);
> > >               return ops->vidioc_s_fmt_meta_out(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             if (unlikely(!ops->vidioc_s_fmt_audio_cap))
> > > +                     break;
> > > +             memset_after(p, 0, fmt.audio);
> > > +             return ops->vidioc_s_fmt_audio_cap(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             if (unlikely(!ops->vidioc_s_fmt_audio_out))
> > > +                     break;
> > > +             memset_after(p, 0, fmt.audio);
> > > +             return ops->vidioc_s_fmt_audio_out(file, fh, arg);
> > >       }
> > >       return -EINVAL;
> > >  }
> > > @@ -1889,6 +1931,16 @@ static int v4l_try_fmt(const struct v4l2_ioctl=
_ops *ops,
> > >                       break;
> > >               memset_after(p, 0, fmt.meta);
> > >               return ops->vidioc_try_fmt_meta_out(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             if (unlikely(!ops->vidioc_try_fmt_audio_cap))
> > > +                     break;
> > > +             memset_after(p, 0, fmt.audio);
> > > +             return ops->vidioc_try_fmt_audio_cap(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             if (unlikely(!ops->vidioc_try_fmt_audio_out))
> > > +                     break;
> > > +             memset_after(p, 0, fmt.audio);
> > > +             return ops->vidioc_try_fmt_audio_out(file, fh, arg);
> > >       }
> > >       return -EINVAL;
> > >  }
> > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > index e0a13505f88d..0924e6d1dab1 100644
> > > --- a/include/media/v4l2-dev.h
> > > +++ b/include/media/v4l2-dev.h
> > > @@ -30,6 +30,7 @@
> > >   * @VFL_TYPE_SUBDEV: for V4L2 subdevices
> > >   * @VFL_TYPE_SDR:    for Software Defined Radio tuners
> > >   * @VFL_TYPE_TOUCH:  for touch sensors
> > > + * @VFL_TYPE_AUDIO:  for audio input/output devices
> > >   * @VFL_TYPE_MAX:    number of VFL types, must always be last in the=
 enum
> > >   */
> > >  enum vfl_devnode_type {
> > > @@ -39,6 +40,7 @@ enum vfl_devnode_type {
> > >       VFL_TYPE_SUBDEV,
> > >       VFL_TYPE_SDR,
> > >       VFL_TYPE_TOUCH,
> > > +     VFL_TYPE_AUDIO,
> > >       VFL_TYPE_MAX /* Shall be the last one */
> > >  };
> > >
> > > diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> > > index edb733f21604..f840cf740ce1 100644
> > > --- a/include/media/v4l2-ioctl.h
> > > +++ b/include/media/v4l2-ioctl.h
> > > @@ -45,6 +45,12 @@ struct v4l2_fh;
> > >   * @vidioc_enum_fmt_meta_out: pointer to the function that implement=
s
> > >   *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> > >   *   for metadata output
> > > + * @vidioc_enum_fmt_audio_cap: pointer to the function that implemen=
ts
> > > + *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> > > + *   for audio capture
> > > + * @vidioc_enum_fmt_audio_out: pointer to the function that implemen=
ts
> > > + *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> > > + *   for audio output
> > >   * @vidioc_g_fmt_vid_cap: pointer to the function that implements
> > >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video captur=
e
> > >   *   in single plane mode
> > > @@ -79,6 +85,10 @@ struct v4l2_fh;
> > >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata cap=
ture
> > >   * @vidioc_g_fmt_meta_out: pointer to the function that implements
> > >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata out=
put
> > > + * @vidioc_g_fmt_audio_cap: pointer to the function that implements
> > > + *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio captur=
e
> > > + * @vidioc_g_fmt_audio_out: pointer to the function that implements
> > > + *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio output
> > >   * @vidioc_s_fmt_vid_cap: pointer to the function that implements
> > >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video captur=
e
> > >   *   in single plane mode
> > > @@ -113,6 +123,10 @@ struct v4l2_fh;
> > >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata cap=
ture
> > >   * @vidioc_s_fmt_meta_out: pointer to the function that implements
> > >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata out=
put
> > > + * @vidioc_s_fmt_audio_cap: pointer to the function that implements
> > > + *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio captur=
e
> > > + * @vidioc_s_fmt_audio_out: pointer to the function that implements
> > > + *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio output
> > >   * @vidioc_try_fmt_vid_cap: pointer to the function that implements
> > >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capt=
ure
> > >   *   in single plane mode
> > > @@ -149,6 +163,10 @@ struct v4l2_fh;
> > >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata c=
apture
> > >   * @vidioc_try_fmt_meta_out: pointer to the function that implements
> > >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata o=
utput
> > > + * @vidioc_try_fmt_audio_cap: pointer to the function that implement=
s
> > > + *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio capt=
ure
> > > + * @vidioc_try_fmt_audio_out: pointer to the function that implement=
s
> > > + *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio outp=
ut
> > >   * @vidioc_reqbufs: pointer to the function that implements
> > >   *   :ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
> > >   * @vidioc_querybuf: pointer to the function that implements
> > > @@ -315,6 +333,10 @@ struct v4l2_ioctl_ops {
> > >                                       struct v4l2_fmtdesc *f);
> > >       int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
> > >                                       struct v4l2_fmtdesc *f);
> > > +     int (*vidioc_enum_fmt_audio_cap)(struct file *file, void *fh,
> > > +                                      struct v4l2_fmtdesc *f);
> > > +     int (*vidioc_enum_fmt_audio_out)(struct file *file, void *fh,
> > > +                                      struct v4l2_fmtdesc *f);
> > >
> > >       /* VIDIOC_G_FMT handlers */
> > >       int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
> > > @@ -345,6 +367,10 @@ struct v4l2_ioctl_ops {
> > >                                    struct v4l2_format *f);
> > >       int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
> > >                                    struct v4l2_format *f);
> > > +     int (*vidioc_g_fmt_audio_cap)(struct file *file, void *fh,
> > > +                                   struct v4l2_format *f);
> > > +     int (*vidioc_g_fmt_audio_out)(struct file *file, void *fh,
> > > +                                   struct v4l2_format *f);
> > >
> > >       /* VIDIOC_S_FMT handlers */
> > >       int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
> > > @@ -375,6 +401,10 @@ struct v4l2_ioctl_ops {
> > >                                    struct v4l2_format *f);
> > >       int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
> > >                                    struct v4l2_format *f);
> > > +     int (*vidioc_s_fmt_audio_cap)(struct file *file, void *fh,
> > > +                                   struct v4l2_format *f);
> > > +     int (*vidioc_s_fmt_audio_out)(struct file *file, void *fh,
> > > +                                   struct v4l2_format *f);
> > >
> > >       /* VIDIOC_TRY_FMT handlers */
> > >       int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
> > > @@ -405,6 +435,10 @@ struct v4l2_ioctl_ops {
> > >                                      struct v4l2_format *f);
> > >       int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
> > >                                      struct v4l2_format *f);
> > > +     int (*vidioc_try_fmt_audio_cap)(struct file *file, void *fh,
> > > +                                     struct v4l2_format *f);
> > > +     int (*vidioc_try_fmt_audio_out)(struct file *file, void *fh,
> > > +                                     struct v4l2_format *f);
> > >
> > >       /* Buffer handlers */
> > >       int (*vidioc_reqbufs)(struct file *file, void *fh,
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index 3af6a82d0cad..e5051410928a 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -153,6 +153,8 @@ enum v4l2_buf_type {
> > >       V4L2_BUF_TYPE_SDR_OUTPUT           =3D 12,
> > >       V4L2_BUF_TYPE_META_CAPTURE         =3D 13,
> > >       V4L2_BUF_TYPE_META_OUTPUT          =3D 14,
> > > +     V4L2_BUF_TYPE_AUDIO_CAPTURE        =3D 15,
> > > +     V4L2_BUF_TYPE_AUDIO_OUTPUT         =3D 16,
> > >       /* Deprecated, do not use */
> > >       V4L2_BUF_TYPE_PRIVATE              =3D 0x80,
> > >  };
> > > @@ -169,6 +171,7 @@ enum v4l2_buf_type {
> > >        || (type) =3D=3D V4L2_BUF_TYPE_VBI_OUTPUT                  \
> > >        || (type) =3D=3D V4L2_BUF_TYPE_SLICED_VBI_OUTPUT           \
> > >        || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT                  \
> > > +      || (type) =3D=3D V4L2_BUF_TYPE_AUDIO_OUTPUT                \
> > >        || (type) =3D=3D V4L2_BUF_TYPE_META_OUTPUT)
> > >
> > >  #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
> > > @@ -2415,6 +2418,20 @@ struct v4l2_meta_format {
> > >       __u32                           buffersize;
> > >  } __attribute__ ((packed));
> > >
> > > +/**
> > > + * struct v4l2_audio_format - audio data format definition
> > > + * @rate:            sample rate
> > > + * @format:          sample format
> > > + * @channels:                channel numbers
> > > + * @buffersize:              maximum size in bytes required for data
> > > + */
> > > +struct v4l2_audio_format {
> > > +     __u32                           rate;
> > > +     __u32                           format;
> >
> > What are the values for the rate and format fields? Since they are part
> > of the UAPI, they need to be defined.
> >
>
> The range for sample rate is [5512, 768000].
> The format is defined in include/uapi/sound/asound.h,  they are
> SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8, ...
>
> Where should I put these info?
>

I see, so those are standard definitions of the sound subsystem. I
think we should refer to the right header and/or data types in the
kerneldoc comment for the struct. We also need to provide the sphinx
documentation for the new device type and extend the description of
relevant ioctls (e.g. VIDIOC_S_FMT) that accept the new structs. I.e.
the v4l2_format struct used by VIDIOC_S_FMT is documented in

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-g-fmt=
.html?highlight=3Dg_fmt#c.V4L.v4l2_format

and there is documentation for each of the union members, like
v4l2_pix_format_mplane that is commonly used for video data:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-v4l2-=
mplane.html#c.v4l2_pix_format_mplane

We'll need a similar one for the new v4l2_audio_format.

Best regards,
Tomasz

> Best regards
> Wang shengjiu
>
> > Best regards,
> > Tomasz
> >
> > > +     __u32                           channels;
> > > +     __u32                           buffersize;
> > > +} __attribute__ ((packed));
> > > +
> > >  /**
> > >   * struct v4l2_format - stream data format
> > >   * @type:    enum v4l2_buf_type; type of the data stream
> > > @@ -2423,6 +2440,7 @@ struct v4l2_meta_format {
> > >   * @win:     definition of an overlaid image
> > >   * @vbi:     raw VBI capture or output parameters
> > >   * @sliced:  sliced VBI capture or output parameters
> > > + * @audio:   definition of an audio format
> > >   * @raw_data:        placeholder for future extensions and custom fo=
rmats
> > >   * @fmt:     union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @met=
a
> > >   *           and @raw_data
> > > @@ -2437,6 +2455,7 @@ struct v4l2_format {
> > >               struct v4l2_sliced_vbi_format   sliced;  /* V4L2_BUF_TY=
PE_SLICED_VBI_CAPTURE */
> > >               struct v4l2_sdr_format          sdr;     /* V4L2_BUF_TY=
PE_SDR_CAPTURE */
> > >               struct v4l2_meta_format         meta;    /* V4L2_BUF_TY=
PE_META_CAPTURE */
> > > +             struct v4l2_audio_format        audio;   /* V4L2_BUF_TY=
PE_AUDIO_CAPTURE */
> > >               __u8    raw_data[200];                   /* user-define=
d */
> > >       } fmt;
> > >  };
> > > --
> > > 2.34.1
> > >
