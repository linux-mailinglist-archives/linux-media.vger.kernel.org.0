Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE946A5521
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 10:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjB1JGF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 04:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbjB1JGE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 04:06:04 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A6E168B2
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 01:06:00 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-53916ab0c6bso252203707b3.7
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eH7pnKWOeSx/c27EGu8Yze9+45o05j4vywrBRnAEw5U=;
        b=mk9IA3adcxu6aTs7LCDYnMm146AOCIWeVvYrMBJnNCBDtZwLbgxWmqt28oftVJ7dXO
         fUOJX5Eyvt7H1Q4nettcYWgbKpgA3USPcE+vCbgm0J1xjmz5hlu4Rv+/QOqn0Lu8TmwY
         GEaVaGp+052zvfxWoPOMB9QaMwmGrpKsKRT0zHRSzVWaSaUzNBcP/n1yW++O2YhLxBei
         gneMkcPV31tRA37MJK8khBfBcm7/2IJEPceWfgxHTBsyHiX4QXaTTfrega5gH31iuYrJ
         BwSlhfHjFtxL5eI8KpB1u9n1HH8sqHgWrFXIaMPCZjwlS2fYqtHSePMAkrcWZEWy5Th9
         +tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eH7pnKWOeSx/c27EGu8Yze9+45o05j4vywrBRnAEw5U=;
        b=MER5xtxbfBYg02pTNNH9GCbAfhSkPMUq4+MaZWvGpo0ld2/EYgXocN4v9lLEM+7BM8
         HqrQWDIPa/xXpCrnH+WKXe9EMVEe3N53sxa2nai+8yCMKPuZs2rugSO/O0w6mKyGTid+
         Uc3Jq3SYxrzTkFlm5iD497XZtsI64NvkYQEZhraI2YOgLsCN5guFmH4DiW9ZC/gNCPFC
         rPAgdNjIrBa5O5PuOksaE9vb2ZthFX6Ps2Q+Q9MQmwM2qDCTjRHvrXtPwU68Owz1zgOO
         AZqxNDzEj0P36QkjI9FANVTj317lfir+NKHGKP5W6hwYGoq/S/8kv/GNM0kNQE10gozt
         H05w==
X-Gm-Message-State: AO0yUKXx6h4sggAJJaY5sO27SgAYrTVppfLR6uYKfLFS2QmVkCDSKlfs
        0TALoQj9k5AnPYz8spDeSz8nUfN6aqhhgX5SQ/A=
X-Google-Smtp-Source: AK7set9mPccL+dDFP2jb0+h5TYFITrYco5lKGULpRAX6brpM1bvgWoXWxNUgx5dy7Qz5eDXa3bZQqQmFsEaYtKhDpAE=
X-Received: by 2002:a81:4412:0:b0:535:cdde:9a63 with SMTP id
 r18-20020a814412000000b00535cdde9a63mr1146203ywa.7.1677575159509; Tue, 28 Feb
 2023 01:05:59 -0800 (PST)
MIME-Version: 1.0
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com> <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 28 Feb 2023 09:05:33 +0000
Message-ID: <CA+V-a8uMybX0KTRZts9UZ1eTxt5HyC1=QbouvNLec37Suu8xuA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: Zero-initialize all structures passed to
 subdev pad operations
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the patch.

On Wed, Feb 15, 2023 at 4:50 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Several drivers call subdev pad operations, passing structures that are
> not fully zeroed. While the drivers initialize the fields they care
> about explicitly, this results in reserved fields having uninitialized
> values. Future kernel API changes that make use of those fields thus
> risk breaking proper driver operation in ways that could be hard to
> detect.
>
> To avoid this, make the code more robust by zero-initializing all the
> structures passed to subdev pad operation. Maintain a consistent coding
> style by preferring designated initializers (which zero-initialize all
> the fields that are not specified) over memset() where possible, and
> make variable declarations local to inner scopes where applicable. One
> notable exception to this rule is in the ipu3 driver, where a memset()
> is needed as the structure is not a local variable but a function
> parameter provided by the caller.
>
> Not all fields of those structures can be initialized when declaring the
> variables, as the values for those fields are computed later in the
> code. Initialize the 'which' field in all cases, and other fields when
> the variable declaration is so close to the v4l2_subdev_call() call that
> it keeps all the context easily visible when reading the code, to avoid
> hindering readability.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
<snip>
>  .../media/platform/ti/am437x/am437x-vpfe.c    | 20 +++++++------

For above,

Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

>  drivers/media/platform/ti/cal/cal-video.c     | 29 ++++++++++---------
>  drivers/media/platform/ti/omap3isp/ispccdc.c  |  5 ++--
>  drivers/media/platform/ti/omap3isp/ispvideo.c | 20 ++++++++-----
>  drivers/media/platform/xilinx/xilinx-dma.c    |  5 ++--
>  drivers/media/test-drivers/vimc/vimc-common.c |  8 ++---
>  drivers/staging/media/imx/imx-media-capture.c | 28 ++++++++++--------
>  drivers/staging/media/omap4iss/iss_video.c    | 10 ++++---
>  drivers/staging/media/tegra-video/vi.c        | 10 ++++---
>  18 files changed, 120 insertions(+), 82 deletions(-)
>
> diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
> index 0ff37496c9ab..284c0909a282 100644
> --- a/drivers/media/pci/cobalt/cobalt-v4l2.c
> +++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
> @@ -708,7 +708,6 @@ static int cobalt_g_fmt_vid_cap(struct file *file, void *priv_fh,
>  {
>         struct cobalt_stream *s = video_drvdata(file);
>         struct v4l2_pix_format *pix = &f->fmt.pix;
> -       struct v4l2_subdev_format sd_fmt;
>
>         pix->width = s->width;
>         pix->height = s->height;
> @@ -718,8 +717,11 @@ static int cobalt_g_fmt_vid_cap(struct file *file, void *priv_fh,
>         if (s->input == 1) {
>                 pix->colorspace = V4L2_COLORSPACE_SRGB;
>         } else {
> -               sd_fmt.pad = s->pad_source;
> -               sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +               struct v4l2_subdev_format sd_fmt = {
> +                       .pad = s->pad_source,
> +                       .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +               };
> +
>                 v4l2_subdev_call(s->sd, pad, get_fmt, NULL, &sd_fmt);
>                 v4l2_fill_pix_format(pix, &sd_fmt.format);
>         }
> @@ -735,7 +737,6 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv_fh,
>  {
>         struct cobalt_stream *s = video_drvdata(file);
>         struct v4l2_pix_format *pix = &f->fmt.pix;
> -       struct v4l2_subdev_format sd_fmt;
>
>         /* Check for min (QCIF) and max (Full HD) size */
>         if ((pix->width < 176) || (pix->height < 144)) {
> @@ -760,8 +761,11 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv_fh,
>                 pix->height = 1080;
>                 pix->colorspace = V4L2_COLORSPACE_SRGB;
>         } else {
> -               sd_fmt.pad = s->pad_source;
> -               sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +               struct v4l2_subdev_format sd_fmt = {
> +                       .pad = s->pad_source,
> +                       .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +               };
> +
>                 v4l2_subdev_call(s->sd, pad, get_fmt, NULL, &sd_fmt);
>                 v4l2_fill_pix_format(pix, &sd_fmt.format);
>         }
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 3b76a9d0383a..3c84cb121632 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1305,6 +1305,7 @@ static int cio2_subdev_link_validate_get_format(struct media_pad *pad,
>                 struct v4l2_subdev *sd =
>                         media_entity_to_v4l2_subdev(pad->entity);
>
> +               memset(fmt, 0, sizeof(*fmt));
>                 fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>                 fmt->pad = pad->index;
>                 return v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 41deda232e4a..65c87af24463 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -342,7 +342,9 @@ static struct v4l2_subdev *video_remote_subdev(struct camss_video *video,
>  static int video_get_subdev_format(struct camss_video *video,
>                                    struct v4l2_format *format)
>  {
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         u32 pad;
>         int ret;
> @@ -352,7 +354,6 @@ static int video_get_subdev_format(struct camss_video *video,
>                 return -EPIPE;
>
>         fmt.pad = pad;
> -       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>         if (ret)
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 9d24647c8f32..ee0b61a52327 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -62,7 +62,9 @@ vsp1_video_remote_subdev(struct media_pad *local, u32 *pad)
>
>  static int vsp1_video_verify_format(struct vsp1_video *video)
>  {
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         int ret;
>
> @@ -70,7 +72,6 @@ static int vsp1_video_verify_format(struct vsp1_video *video)
>         if (subdev == NULL)
>                 return -EINVAL;
>
> -       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>         if (ret < 0)
>                 return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> index e3b95a2b7e04..4800751a401c 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> @@ -854,7 +854,7 @@ static int fimc_get_sensor_frame_desc(struct v4l2_subdev *sensor,
>                                       struct v4l2_plane_pix_format *plane_fmt,
>                                       unsigned int num_planes, bool try)
>  {
> -       struct v4l2_mbus_frame_desc fd;
> +       struct v4l2_mbus_frame_desc fd = { };
>         int i, ret;
>         int pad;
>
> @@ -1095,7 +1095,12 @@ static int fimc_cap_g_input(struct file *file, void *priv, unsigned int *i)
>   */
>  static int fimc_pipeline_validate(struct fimc_dev *fimc)
>  {
> -       struct v4l2_subdev_format sink_fmt, src_fmt;
> +       struct v4l2_subdev_format sink_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
> +       struct v4l2_subdev_format src_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct fimc_vid_cap *vc = &fimc->vid_cap;
>         struct v4l2_subdev *sd = &vc->subdev;
>         struct fimc_pipeline *p = to_fimc_pipeline(vc->ve.pipe);
> @@ -1132,7 +1137,6 @@ static int fimc_pipeline_validate(struct fimc_dev *fimc)
>                         sink_fmt.format.code = ff->fmt ? ff->fmt->mbus_code : 0;
>                 } else {
>                         sink_fmt.pad = sink_pad->index;
> -                       sink_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>                         ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sink_fmt);
>                         if (ret < 0 && ret != -ENOIOCTLCMD)
>                                 return -EPIPE;
> @@ -1141,7 +1145,6 @@ static int fimc_pipeline_validate(struct fimc_dev *fimc)
>                 /* Retrieve format at the source pad */
>                 sd = media_entity_to_v4l2_subdev(src_pad->entity);
>                 src_fmt.pad = src_pad->index;
> -               src_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>                 ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fmt);
>                 if (ret < 0 && ret != -ENOIOCTLCMD)
>                         return -EPIPE;
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
> index f6a302fa8d37..8fa26969c411 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
> @@ -449,17 +449,22 @@ static int isp_video_s_fmt_mplane(struct file *file, void *priv,
>  static int isp_video_pipeline_validate(struct fimc_isp *isp)
>  {
>         struct v4l2_subdev *sd = &isp->subdev;
> -       struct v4l2_subdev_format sink_fmt, src_fmt;
>         struct media_pad *pad;
>         int ret;
>
>         while (1) {
> +               struct v4l2_subdev_format sink_fmt = {
> +                       .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +               };
> +               struct v4l2_subdev_format src_fmt = {
> +                       .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +               };
> +
>                 /* Retrieve format at the sink pad */
>                 pad = &sd->entity.pads[0];
>                 if (!(pad->flags & MEDIA_PAD_FL_SINK))
>                         break;
>                 sink_fmt.pad = pad->index;
> -               sink_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>                 ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sink_fmt);
>                 if (ret < 0 && ret != -ENOIOCTLCMD)
>                         return -EPIPE;
> @@ -471,7 +476,6 @@ static int isp_video_pipeline_validate(struct fimc_isp *isp)
>
>                 sd = media_entity_to_v4l2_subdev(pad->entity);
>                 src_fmt.pad = pad->index;
> -               src_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>                 ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fmt);
>                 if (ret < 0 && ret != -ENOIOCTLCMD)
>                         return -EPIPE;
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
> index e185a40305a8..162e44efcb3e 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
> @@ -765,7 +765,12 @@ static int fimc_lite_s_fmt_mplane(struct file *file, void *priv,
>  static int fimc_pipeline_validate(struct fimc_lite *fimc)
>  {
>         struct v4l2_subdev *sd = &fimc->subdev;
> -       struct v4l2_subdev_format sink_fmt, src_fmt;
> +       struct v4l2_subdev_format sink_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
> +       struct v4l2_subdev_format src_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct media_pad *pad;
>         int ret;
>
> @@ -782,7 +787,6 @@ static int fimc_pipeline_validate(struct fimc_lite *fimc)
>                         sink_fmt.format.code = fimc->inp_frame.fmt->mbus_code;
>                 } else {
>                         sink_fmt.pad = pad->index;
> -                       sink_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>                         ret = v4l2_subdev_call(sd, pad, get_fmt, NULL,
>                                                &sink_fmt);
>                         if (ret < 0 && ret != -ENOIOCTLCMD)
> @@ -795,7 +799,6 @@ static int fimc_pipeline_validate(struct fimc_lite *fimc)
>
>                 sd = media_entity_to_v4l2_subdev(pad->entity);
>                 src_fmt.pad = pad->index;
> -               src_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>                 ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fmt);
>                 if (ret < 0 && ret != -ENOIOCTLCMD)
>                         return -EPIPE;
> diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> index db106ebdf870..76634d242b10 100644
> --- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> @@ -806,7 +806,9 @@ static int s3c_camif_vidioc_s_fmt(struct file *file, void *priv,
>  /* Only check pixel formats at the sensor and the camif subdev pads */
>  static int camif_pipeline_validate(struct camif_dev *camif)
>  {
> -       struct v4l2_subdev_format src_fmt;
> +       struct v4l2_subdev_format src_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct media_pad *pad;
>         int ret;
>
> @@ -816,7 +818,6 @@ static int camif_pipeline_validate(struct camif_dev *camif)
>                 return -EPIPE;
>
>         src_fmt.pad = pad->index;
> -       src_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(camif->sensor.sd, pad, get_fmt, NULL, &src_fmt);
>         if (ret < 0 && ret != -ENOIOCTLCMD)
>                 return -EPIPE;
> diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
> index 6e8ef86566b7..9827510b7b50 100644
> --- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
> +++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
> @@ -190,7 +190,9 @@ static int camif_register_sensor(struct camif_dev *camif)
>         struct s3c_camif_sensor_info *sensor = &camif->pdata.sensor;
>         struct v4l2_device *v4l2_dev = &camif->v4l2_dev;
>         struct i2c_adapter *adapter;
> -       struct v4l2_subdev_format format;
> +       struct v4l2_subdev_format format = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *sd;
>         int ret;
>
> @@ -220,7 +222,6 @@ static int camif_register_sensor(struct camif_dev *camif)
>
>         /* Get initial pixel format and set it at the camif sink pad */
>         format.pad = 0;
> -       format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
>
>         if (ret < 0)
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 2dfae9bc0bba..f23085b5954b 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -1285,13 +1285,13 @@ static int __subdev_get_format(struct vpfe_device *vpfe,
>                                struct v4l2_mbus_framefmt *fmt)
>  {
>         struct v4l2_subdev *sd = vpfe->current_subdev->sd;
> -       struct v4l2_subdev_format sd_fmt;
> +       struct v4l2_subdev_format sd_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad = 0,
> +       };
>         struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
>         int ret;
>
> -       sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -       sd_fmt.pad = 0;
> -
>         ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
>         if (ret)
>                 return ret;
> @@ -1309,12 +1309,13 @@ static int __subdev_set_format(struct vpfe_device *vpfe,
>                                struct v4l2_mbus_framefmt *fmt)
>  {
>         struct v4l2_subdev *sd = vpfe->current_subdev->sd;
> -       struct v4l2_subdev_format sd_fmt;
> +       struct v4l2_subdev_format sd_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad = 0,
> +       };
>         struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
>         int ret;
>
> -       sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -       sd_fmt.pad = 0;
>         *mbus_fmt = *fmt;
>
>         ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &sd_fmt);
> @@ -1393,7 +1394,9 @@ static int vpfe_try_fmt(struct file *file, void *priv,
>         struct vpfe_device *vpfe = video_drvdata(file);
>         struct v4l2_subdev *sd = vpfe->current_subdev->sd;
>         const struct vpfe_fmt *fmt;
> -       struct v4l2_subdev_frame_size_enum fse;
> +       struct v4l2_subdev_frame_size_enum fse = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         int ret, found;
>
>         fmt = find_format_by_pix(vpfe, f->fmt.pix.pixelformat);
> @@ -1412,7 +1415,6 @@ static int vpfe_try_fmt(struct file *file, void *priv,
>         found = false;
>         fse.pad = 0;
>         fse.code = fmt->code;
> -       fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         for (fse.index = 0; ; fse.index++) {
>                 ret = v4l2_subdev_call(sd, pad, enum_frame_size,
>                                        NULL, &fse);
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index 4eade409d5d3..51ed82172d71 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -117,13 +117,13 @@ static int cal_legacy_enum_fmt_vid_cap(struct file *file, void *priv,
>  static int __subdev_get_format(struct cal_ctx *ctx,
>                                struct v4l2_mbus_framefmt *fmt)
>  {
> -       struct v4l2_subdev_format sd_fmt;
> +       struct v4l2_subdev_format sd_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad = 0,
> +       };
>         struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
>         int ret;
>
> -       sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -       sd_fmt.pad = 0;
> -
>         ret = v4l2_subdev_call(ctx->phy->source, pad, get_fmt, NULL, &sd_fmt);
>         if (ret)
>                 return ret;
> @@ -139,12 +139,13 @@ static int __subdev_get_format(struct cal_ctx *ctx,
>  static int __subdev_set_format(struct cal_ctx *ctx,
>                                struct v4l2_mbus_framefmt *fmt)
>  {
> -       struct v4l2_subdev_format sd_fmt;
> +       struct v4l2_subdev_format sd_fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad = 0,
> +       };
>         struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
>         int ret;
>
> -       sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -       sd_fmt.pad = 0;
>         *mbus_fmt = *fmt;
>
>         ret = v4l2_subdev_call(ctx->phy->source, pad, set_fmt, NULL, &sd_fmt);
> @@ -190,7 +191,9 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
>  {
>         struct cal_ctx *ctx = video_drvdata(file);
>         const struct cal_format_info *fmtinfo;
> -       struct v4l2_subdev_frame_size_enum fse;
> +       struct v4l2_subdev_frame_size_enum fse = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         int found;
>
>         fmtinfo = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
> @@ -209,7 +212,6 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
>         found = false;
>         fse.pad = 0;
>         fse.code = fmtinfo->code;
> -       fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         for (fse.index = 0; ; fse.index++) {
>                 int ret;
>
> @@ -302,7 +304,11 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
>  {
>         struct cal_ctx *ctx = video_drvdata(file);
>         const struct cal_format_info *fmtinfo;
> -       struct v4l2_subdev_frame_size_enum fse;
> +       struct v4l2_subdev_frame_size_enum fse = {
> +               .index = fsize->index,
> +               .pad = 0,
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         int ret;
>
>         /* check for valid format */
> @@ -313,10 +319,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
>                 return -EINVAL;
>         }
>
> -       fse.index = fsize->index;
> -       fse.pad = 0;
>         fse.code = fmtinfo->code;
> -       fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>
>         ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size, NULL,
>                                &fse);
> diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
> index 11afb8aec292..fdcdffe5fecb 100644
> --- a/drivers/media/platform/ti/omap3isp/ispccdc.c
> +++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
> @@ -1118,7 +1118,9 @@ static void ccdc_configure(struct isp_ccdc_device *ccdc)
>         struct v4l2_mbus_framefmt *format;
>         const struct v4l2_rect *crop;
>         const struct isp_format_info *fmt_info;
> -       struct v4l2_subdev_format fmt_src;
> +       struct v4l2_subdev_format fmt_src = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         unsigned int depth_out;
>         unsigned int depth_in = 0;
>         struct media_pad *pad;
> @@ -1150,7 +1152,6 @@ static void ccdc_configure(struct isp_ccdc_device *ccdc)
>          * input format is a non-BT.656 YUV variant.
>          */
>         fmt_src.pad = pad->index;
> -       fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         if (!v4l2_subdev_call(sensor, pad, get_fmt, NULL, &fmt_src)) {
>                 fmt_info = omap3isp_video_format_info(fmt_src.format.code);
>                 depth_in = fmt_info->width;
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index ddc7d08d4f96..daca689dc082 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -268,7 +268,9 @@ static int isp_video_get_graph_data(struct isp_video *video,
>  static int
>  __isp_video_get_format(struct isp_video *video, struct v4l2_format *format)
>  {
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         u32 pad;
>         int ret;
> @@ -278,7 +280,6 @@ __isp_video_get_format(struct isp_video *video, struct v4l2_format *format)
>                 return -EINVAL;
>
>         fmt.pad = pad;
> -       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>
>         mutex_lock(&video->mutex);
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> @@ -731,7 +732,9 @@ static int
>  isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>  {
>         struct isp_video *video = video_drvdata(file);
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         u32 pad;
>         int ret;
> @@ -746,7 +749,6 @@ isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>         isp_video_pix_to_mbus(&format->fmt.pix, &fmt.format);
>
>         fmt.pad = pad;
> -       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>         if (ret)
>                 return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
> @@ -759,7 +761,9 @@ static int
>  isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
>  {
>         struct isp_video *video = video_drvdata(file);
> -       struct v4l2_subdev_format format;
> +       struct v4l2_subdev_format format = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         struct v4l2_subdev_selection sdsel = {
>                 .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> @@ -799,7 +803,6 @@ isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
>                 return ret;
>
>         format.pad = pad;
> -       format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &format);
>         if (ret < 0)
>                 return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
> @@ -957,7 +960,9 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
>         struct media_pad *source_pad;
>         struct media_entity *source = NULL;
>         struct media_entity *sink;
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_ext_controls ctrls;
>         struct v4l2_ext_control ctrl;
>         unsigned int i;
> @@ -993,7 +998,6 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
>         pipe->external = media_entity_to_v4l2_subdev(source);
>
>         fmt.pad = source_pad->index;
> -       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(media_entity_to_v4l2_subdev(sink),
>                                pad, get_fmt, NULL, &fmt);
>         if (unlikely(ret < 0)) {
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index fee02c8c85fd..80d6f5b072ea 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -56,7 +56,9 @@ xvip_dma_remote_subdev(struct media_pad *local, u32 *pad)
>
>  static int xvip_dma_verify_format(struct xvip_dma *dma)
>  {
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         int ret;
>
> @@ -64,7 +66,6 @@ static int xvip_dma_verify_format(struct xvip_dma *dma)
>         if (subdev == NULL)
>                 return -EPIPE;
>
> -       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>         if (ret < 0)
>                 return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
> index 7b27153c0728..2e72974e35b4 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.c
> +++ b/drivers/media/test-drivers/vimc/vimc-common.c
> @@ -241,13 +241,13 @@ static int vimc_get_pix_format(struct media_pad *pad,
>         if (is_media_entity_v4l2_subdev(pad->entity)) {
>                 struct v4l2_subdev *sd =
>                         media_entity_to_v4l2_subdev(pad->entity);
> -               struct v4l2_subdev_format sd_fmt;
> +               struct v4l2_subdev_format sd_fmt = {
> +                       .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +                       .pad = pad->index,
> +               };
>                 const struct vimc_pix_map *pix_map;
>                 int ret;
>
> -               sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -               sd_fmt.pad = pad->index;
> -
>                 ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
>                 if (ret)
>                         return ret;
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 93ba09236010..39666db59c4e 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -353,12 +353,13 @@ static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
>  {
>         struct capture_priv *priv = video_drvdata(file);
>         const struct imx_media_pixfmt *cc_src;
> -       struct v4l2_subdev_format fmt_src;
> +       struct v4l2_subdev_format fmt_src = {
> +               .pad = priv->src_sd_pad,
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         u32 fourcc;
>         int ret;
>
> -       fmt_src.pad = priv->src_sd_pad;
> -       fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
>         if (ret) {
>                 dev_err(priv->dev, "failed to get src_sd format\n");
> @@ -426,11 +427,12 @@ static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
>                                           struct v4l2_format *f)
>  {
>         struct capture_priv *priv = video_drvdata(file);
> -       struct v4l2_subdev_format fmt_src;
> +       struct v4l2_subdev_format fmt_src = {
> +               .pad = priv->src_sd_pad,
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         int ret;
>
> -       fmt_src.pad = priv->src_sd_pad;
> -       fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
>         if (ret)
>                 return ret;
> @@ -445,7 +447,10 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
>                                         struct v4l2_format *f)
>  {
>         struct capture_priv *priv = video_drvdata(file);
> -       struct v4l2_subdev_format fmt_src;
> +       struct v4l2_subdev_format fmt_src = {
> +               .pad = priv->src_sd_pad,
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         const struct imx_media_pixfmt *cc;
>         int ret;
>
> @@ -454,8 +459,6 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
>                 return -EBUSY;
>         }
>
> -       fmt_src.pad = priv->src_sd_pad;
> -       fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
>         if (ret)
>                 return ret;
> @@ -670,13 +673,14 @@ static void capture_buf_queue(struct vb2_buffer *vb)
>
>  static int capture_validate_fmt(struct capture_priv *priv)
>  {
> -       struct v4l2_subdev_format fmt_src;
> +       struct v4l2_subdev_format fmt_src = {
> +               .pad = priv->src_sd_pad,
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         const struct imx_media_pixfmt *cc;
>         int ret;
>
>         /* Retrieve the media bus format on the source subdev. */
> -       fmt_src.pad = priv->src_sd_pad;
> -       fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
>         if (ret)
>                 return ret;
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index 05548eab7daa..1406445a30c3 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -610,7 +610,9 @@ static int
>  iss_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>  {
>         struct iss_video *video = video_drvdata(file);
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         u32 pad;
>         int ret;
> @@ -625,7 +627,6 @@ iss_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>         iss_video_pix_to_mbus(&format->fmt.pix, &fmt.format);
>
>         fmt.pad = pad;
> -       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>         if (ret)
>                 return ret;
> @@ -638,7 +639,9 @@ static int
>  iss_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
>  {
>         struct iss_video *video = video_drvdata(file);
> -       struct v4l2_subdev_format format;
> +       struct v4l2_subdev_format format = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         struct v4l2_subdev_selection sdsel = {
>                 .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> @@ -679,7 +682,6 @@ iss_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
>                 return ret;
>
>         format.pad = pad;
> -       format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &format);
>         if (ret < 0)
>                 return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 11dd142c98c5..8504adff9919 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -493,7 +493,9 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>         const struct tegra_video_format *fmtinfo;
>         static struct lock_class_key key;
>         struct v4l2_subdev *subdev;
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_TRY,
> +       };
>         struct v4l2_subdev_state *sd_state;
>         struct v4l2_subdev_frame_size_enum fse = {
>                 .which = V4L2_SUBDEV_FORMAT_TRY,
> @@ -529,7 +531,6 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>         }
>
>         pix->field = V4L2_FIELD_NONE;
> -       fmt.which = V4L2_SUBDEV_FORMAT_TRY;
>         fmt.pad = 0;
>         v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
>
> @@ -590,7 +591,9 @@ static int tegra_channel_set_format(struct file *file, void *fh,
>  {
>         struct tegra_vi_channel *chan = video_drvdata(file);
>         const struct tegra_video_format *fmtinfo;
> -       struct v4l2_subdev_format fmt;
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +       };
>         struct v4l2_subdev *subdev;
>         struct v4l2_pix_format *pix = &format->fmt.pix;
>         int ret;
> @@ -605,7 +608,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
>
>         fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
>
> -       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>         fmt.pad = 0;
>         v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
>         subdev = tegra_channel_get_remote_source_subdev(chan);
> --
> Regards,
>
> Laurent Pinchart
>
