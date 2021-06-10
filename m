Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA5F3A2630
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 10:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhFJIGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 04:06:42 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:36678 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhFJIGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 04:06:41 -0400
Received: by mail-pg1-f177.google.com with SMTP id 27so21964275pgy.3
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ckCrSyQbJNTmXSmo9dkgIOKaYsdj3RKXSRyOV8wq17s=;
        b=YMxgPL1orF257NazX30AQwGT/yH28hIWyGUZCiMDUHdUSI+0Lsp9u4R6qguGgSfTQM
         qv7vsnvwuxOyYWZIcW9WGnvaEv4bkk1u5KXIe/08+m+E8nh9QCf6l8oN6zYJrb12IRhQ
         Z8WpbH/TBzraJM2avArL7qB/9NH7sO6Iv2rhoGK4Fv6ny7A93QiEoU9O3XI//dQkuL7u
         Z0FHGoNNx0ocu6hPHFGUtcYuckFVNSUfhe7Unp00yR9P6frvxA3X+j/22S8MMlgYfHQ0
         Dq3PVW1GD2/NDXcIWyNMTmWej8wwDFs4d9oVz1fcFAd1R3vEJVnHmtbhFuIHwT3ynrZW
         rDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ckCrSyQbJNTmXSmo9dkgIOKaYsdj3RKXSRyOV8wq17s=;
        b=hXHXfE9u9+SStHZcStZJh5gUm4PUh1jJ14N5XaRbZZTRhRVlpsFSGuBZSNPUnnVRot
         y4LQvthR6M86aGKccSXNaY3yE6UEwmFQFWJNo5RXudIJWU3y2Imo+dSs02DdQziGYGkY
         oFRQ77uPlnEaTRF849zW05hrbijRb5b1zx0mRy742TzJDG7shRPAi+Do9HXqXfhyPHTD
         hADeJEH8gU8qXBQ9exu/nIIKy9YeE1N+VbYSAK6ww8+BIVHRKlIwW41bArnCtVCG8n8E
         YhVodHxXAXhIlPQ5sYDgTsoxpbx2QMNaUce7aFcg3FLB1rFrPXH7ZBPR1wsvXM5T/Fu1
         KvOA==
X-Gm-Message-State: AOAM530m4UoYKM/NiuDr8NFq36nOWOWLmgOdI+IhC8+F44oY2P3yi67Q
        OQGuJib2vl7qVNIk12HHUpdD0ULjC2TfUGSkNf0omQ==
X-Google-Smtp-Source: ABdhPJxIms69Zk5Ijom5sRxJJ3531SlSEuoN4UZpI3GfV70SnoR4NubpAfJ2pkLtWdKf1/s0d7BPgOVd6HU2tZMiOYg=
X-Received: by 2002:a63:d47:: with SMTP id 7mr3794998pgn.339.1623312214776;
 Thu, 10 Jun 2021 01:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210608223513.23193-1-jonathan@marek.ca> <20210608223513.23193-17-jonathan@marek.ca>
In-Reply-To: <20210608223513.23193-17-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 10 Jun 2021 10:03:24 +0200
Message-ID: <CAG3jFyvhjKLyrbqt6nB8ATodZDE0cK72NdPFxLXM7FFJx-CKxw@mail.gmail.com>
Subject: Re: [PATCH 16/17] media: camss: add support for SM8250 camss
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Jonathan,

On Wed, 9 Jun 2021 at 00:38, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The Titan 480 camss found on SM8250 has 6 CSIPHY and 4 VFE/CSID.
>
> CSID is compatible with the Titan 170 CSID, but the Titan 480 CSID are
> inside the VFE region (between the "top" and "bus" registers), so a
> workaround is added to avoid ioremap failure.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Makefile    |   2 +-
>  .../{camss-csid-170.c => camss-csid-gen2.c}   |   2 +-
>  .../media/platform/qcom/camss/camss-csid.c    |  28 ++-
>  .../media/platform/qcom/camss/camss-csid.h    |   2 +-
>  .../media/platform/qcom/camss/camss-csiphy.c  |   8 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c |   9 +-
>  .../media/platform/qcom/camss/camss-video.c   |   3 +-
>  drivers/media/platform/qcom/camss/camss.c     | 199 ++++++++++++++++--
>  8 files changed, 227 insertions(+), 26 deletions(-)
>  rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (99%)
>
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 81dd56aff0f27..4e22223589739 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -6,7 +6,7 @@ qcom-camss-objs += \
>                 camss-csid.o \
>                 camss-csid-4-1.o \
>                 camss-csid-4-7.o \
> -               camss-csid-170.o \
> +               camss-csid-gen2.o \
>                 camss-csiphy-2ph-1-0.o \
>                 camss-csiphy-3ph-1-0.o \
>                 camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> similarity index 99%
> rename from drivers/media/platform/qcom/camss/camss-csid-170.c
> rename to drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 9e54d251793fc..abbfbf4488934 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -594,7 +594,7 @@ static void csid_subdev_init(struct csid_device *csid)
>         csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
>  }
>
> -const struct csid_hw_ops csid_ops_170 = {
> +const struct csid_hw_ops csid_ops_gen2 = {
>         .configure_stream = csid_configure_stream,
>         .configure_testgen_pattern = csid_configure_testgen_pattern,
>         .hw_version = csid_hw_version,
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 528674dea06ca..b4c068a152f73 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -25,6 +25,10 @@
>  #include "camss-csid-gen1.h"
>  #include "camss.h"
>
> +/* offset of CSID registers in VFE region for VFE 480 */
> +#define VFE_480_CSID_OFFSET 0x1200
> +#define VFE_480_LITE_CSID_OFFSET 0x200
> +
>  #define MSM_CSID_NAME "msm_csid"
>
>  const char * const csid_testgen_modes[] = {
> @@ -560,8 +564,9 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>         } else if (camss->version == CAMSS_8x96 ||
>                    camss->version == CAMSS_660) {
>                 csid->ops = &csid_ops_4_7;
> -       } else if (camss->version == CAMSS_845) {
> -               csid->ops = &csid_ops_170;
> +       } else if (camss->version == CAMSS_845 ||
> +                  camss->version == CAMSS_8250) {
> +               csid->ops = &csid_ops_gen2;
>         } else {
>                 return -EINVAL;
>         }
> @@ -569,10 +574,21 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>
>         /* Memory */
>
> -       r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
> -       csid->base = devm_ioremap_resource(dev, r);
> -       if (IS_ERR(csid->base))
> -               return PTR_ERR(csid->base);
> +       if (camss->version == CAMSS_8250) {
> +               /* for titan 480, CSID registers are inside the VFE region,
> +                * between the VFE "top" and "bus" registers. this requires
> +                * VFE to be initialized before CSID
> +                */
> +               if (id >= 2) /* VFE/CSID lite */
> +                       csid->base = camss->vfe[id].base + VFE_480_LITE_CSID_OFFSET;
> +               else
> +                       csid->base = camss->vfe[id].base + VFE_480_CSID_OFFSET;
> +       } else {
> +               r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
> +               csid->base = devm_ioremap_resource(dev, r);
> +               if (IS_ERR(csid->base))
> +                       return PTR_ERR(csid->base);
> +       }
>
>         /* Interrupt */
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 814ebc7c29d65..17a50fa426be1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -205,7 +205,7 @@ extern const char * const csid_testgen_modes[];
>
>  extern const struct csid_hw_ops csid_ops_4_1;
>  extern const struct csid_hw_ops csid_ops_4_7;
> -extern const struct csid_hw_ops csid_ops_170;
> +extern const struct csid_hw_ops csid_ops_gen2;
>
>
>  #endif /* QC_MSM_CAMSS_CSID_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index f82f1e2aa6883..1d10c816acf5c 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -582,7 +582,8 @@ int msm_csiphy_subdev_init(struct camss *camss,
>                 csiphy->ops = &csiphy_ops_3ph_1_0;
>                 csiphy->formats = csiphy_formats_8x96;
>                 csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
> -       } else if (camss->version == CAMSS_845) {
> +       } else if (camss->version == CAMSS_845 ||
> +                  camss->version == CAMSS_8250) {
>                 csiphy->ops = &csiphy_ops_3ph_1_0;
>                 csiphy->formats = csiphy_formats_sdm845;
>                 csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
> @@ -679,7 +680,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
>
>                 if (!strcmp(clock->name, "csiphy0_timer") ||
>                     !strcmp(clock->name, "csiphy1_timer") ||
> -                   !strcmp(clock->name, "csiphy2_timer"))
> +                   !strcmp(clock->name, "csiphy2_timer") ||
> +                   !strcmp(clock->name, "csiphy3_timer") ||
> +                   !strcmp(clock->name, "csiphy4_timer") ||
> +                   !strcmp(clock->name, "csiphy5_timer"))
>                         csiphy->rate_set[i] = true;
>
>                 if (camss->version == CAMSS_660 &&
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index b08bded2344e6..48d05ece0dcc1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -220,7 +220,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>                 }
>         else if (vfe->camss->version == CAMSS_8x96 ||
>                  vfe->camss->version == CAMSS_660 ||
> -                vfe->camss->version == CAMSS_845)
> +                vfe->camss->version == CAMSS_845 ||
> +                vfe->camss->version == CAMSS_8250)
>                 switch (sink_code) {
>                 case MEDIA_BUS_FMT_YUYV8_2X8:
>                 {
> @@ -1278,6 +1279,9 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>         case CAMSS_845:
>                 vfe->ops = &vfe_ops_170;
>                 break;
> +       case CAMSS_8250:
> +               vfe->ops = &vfe_ops_480;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -1389,7 +1393,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>                                 l->formats = formats_rdi_8x96;
>                                 l->nformats = ARRAY_SIZE(formats_rdi_8x96);
>                         }
> -               } else if (camss->version == CAMSS_845) {
> +               } else if (camss->version == CAMSS_845 ||
> +                          camss->version == CAMSS_8250) {
>                         l->formats = formats_rdi_845;
>                         l->nformats = ARRAY_SIZE(formats_rdi_845);
>                 } else {
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 54e77d30d452c..5dc1ddbe6d658 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -1011,7 +1011,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>                         video->formats = formats_rdi_8x96;
>                         video->nformats = ARRAY_SIZE(formats_rdi_8x96);
>                 }
> -       }  else if (video->camss->version == CAMSS_845) {
> +       }  else if (video->camss->version == CAMSS_845 ||
> +                   video->camss->version == CAMSS_8250) {
>                 video->formats = formats_rdi_845;
>                 video->nformats = ARRAY_SIZE(formats_rdi_845);
>         } else {
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index c08d6d6f6f90d..14a1a6e524345 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -662,6 +662,165 @@ static const struct resources vfe_res_845[] = {
>         }
>  };
>
> +static const struct resources csiphy_res_8250[] = {
> +       /* CSIPHY0 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "csiphy0", "csiphy0_timer" },
> +               .clock_rate = { { 400000000 },
> +                               { 300000000 } },
> +               .reg = { "csiphy0" },
> +               .interrupt = { "csiphy0" }
> +       },
> +       /* CSIPHY1 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "csiphy1", "csiphy1_timer" },
> +               .clock_rate = { { 400000000 },
> +                               { 300000000 } },
> +               .reg = { "csiphy1" },
> +               .interrupt = { "csiphy1" }
> +       },
> +       /* CSIPHY2 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "csiphy2", "csiphy2_timer" },
> +               .clock_rate = { { 400000000 },
> +                               { 300000000 } },
> +               .reg = { "csiphy2" },
> +               .interrupt = { "csiphy2" }
> +       },
> +       /* CSIPHY3 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "csiphy3", "csiphy3_timer" },
> +               .clock_rate = { { 400000000 },
> +                               { 300000000 } },
> +               .reg = { "csiphy3" },
> +               .interrupt = { "csiphy3" }
> +       },
> +       /* CSIPHY4 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "csiphy4", "csiphy4_timer" },
> +               .clock_rate = { { 400000000 },
> +                               { 300000000 } },
> +               .reg = { "csiphy4" },
> +               .interrupt = { "csiphy4" }
> +       },
> +       /* CSIPHY5 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "csiphy5", "csiphy5_timer" },
> +               .clock_rate = { { 400000000 },
> +                               { 300000000 } },
> +               .reg = { "csiphy5" },
> +               .interrupt = { "csiphy5" }
> +       }
> +};
> +
> +static const struct resources csid_res_8250[] = {
> +       /* CSID0 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
> +               .clock_rate = { { 400000000 },
> +                               { 400000000 },
> +                               { 350000000, 475000000, 576000000, 720000000 },
> +                               { 100000000, 200000000, 300000000, 400000000 },
> +                               { 0 } },
> +               .reg = { "csid0" },
> +               .interrupt = { "csid0" }
> +       },
> +       /* CSID1 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
> +               .clock_rate = { { 400000000 },
> +                               { 400000000 },
> +                               { 350000000, 475000000, 576000000, 720000000 },
> +                               { 100000000, 200000000, 300000000, 400000000 },
> +                               { 0 } },
> +               .reg = { "csid1" },
> +               .interrupt = { "csid1" }
> +       },
> +       /* CSID2 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
> +               .clock_rate = { { 400000000 },
> +                               { 400000000 },
> +                               { 400000000, 480000000 },
> +                               { 0 } },
> +               .reg = { "csid2" },
> +               .interrupt = { "csid2" }
> +       },
> +       /* CSID3 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
> +               .clock_rate = { { 400000000 },
> +                               { 400000000 },
> +                               { 400000000, 480000000 },
> +                               { 0 } },
> +               .reg = { "csid3" },
> +               .interrupt = { "csid3" }
> +       }
> +};
> +
> +static const struct resources vfe_res_8250[] = {
> +       /* VFE0 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0", "vfe0_axi", "cam_hf_axi" },
> +               .clock_rate = { { 400000000, 480000000 },
> +                               { 0 },
> +                               { 100000000, 200000000, 300000000, 400000000 },
> +                               { 350000000, 475000000, 576000000, 720000000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg = { "vfe0" },
> +               .interrupt = { "vfe0" }
> +       },
> +       /* VFE1 */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1", "vfe1_axi", "cam_hf_axi" },
> +               .clock_rate = { { 400000000, 480000000 },
> +                               { 0 },
> +                               { 100000000, 200000000, 300000000, 400000000 },
> +                               { 350000000, 475000000, 576000000, 720000000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg = { "vfe1" },
> +               .interrupt = { "vfe1" }
> +       },
> +       /* VFE2 (lite) */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi", "vfe_lite", "cam_hf_axi" },
> +               .clock_rate = { { 400000000, 480000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 400000000, 480000000 },
> +                               { 0 } },
> +               .reg = { "vfe_lite0" },
> +               .interrupt = { "vfe_lite0" }
> +       },
> +       /* VFE3 (lite) */
> +       {
> +               .regulator = { NULL },
> +               .clock = { "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi", "vfe_lite", "cam_hf_axi" },
> +               .clock_rate = { { 400000000, 480000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 400000000, 480000000 },
> +                               { 0 } },
> +               .reg = { "vfe_lite1" },
> +               .interrupt = { "vfe_lite1" }
> +       },
> +};
> +
>  /*
>   * camss_add_clock_margin - Add margin to clock frequency rate
>   * @rate: Clock frequency rate
> @@ -945,6 +1104,12 @@ static int camss_init_subdevices(struct camss *camss)
>                 /* Titan VFEs don't have an ISPIF  */
>                 ispif_res = NULL;
>                 vfe_res = vfe_res_845;
> +       } else if (camss->version == CAMSS_8250) {
> +               csiphy_res = csiphy_res_8250;
> +               csid_res = csid_res_8250;
> +               /* Titan VFEs don't have an ISPIF  */
> +               ispif_res = NULL;
> +               vfe_res = vfe_res_8250;
>         } else {
>                 return -EINVAL;
>         }
> @@ -960,6 +1125,17 @@ static int camss_init_subdevices(struct camss *camss)
>                 }
>         }
>
> +       /* note: SM8250 requires VFE to be initialized before CSID */
> +       for (i = 0; i < camss->vfe_num; i++) {
> +               ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
> +                                         &vfe_res[i], i);
> +               if (ret < 0) {
> +                       dev_err(camss->dev,
> +                               "Fail to init vfe%d sub-device: %d\n", i, ret);
> +                       return ret;
> +               }
> +       }
> +
>         for (i = 0; i < camss->csid_num; i++) {
>                 ret = msm_csid_subdev_init(camss, &camss->csid[i],
>                                            &csid_res[i], i);
> @@ -978,16 +1154,6 @@ static int camss_init_subdevices(struct camss *camss)
>                 return ret;
>         }
>
> -       for (i = 0; i < camss->vfe_num; i++) {
> -               ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
> -                                         &vfe_res[i], i);
> -               if (ret < 0) {
> -                       dev_err(camss->dev,
> -                               "Fail to init vfe%d sub-device: %d\n", i, ret);
> -                       return ret;
> -               }
> -       }
> -
>         return 0;
>  }
>
> @@ -1250,7 +1416,8 @@ static int camss_configure_pd(struct camss *camss)
>         if (camss->version == CAMSS_8x96 ||
>             camss->version == CAMSS_660)
>                 nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> -       else if (camss->version == CAMSS_845)
> +       else if (camss->version == CAMSS_845 ||
> +                camss->version == CAMSS_8250)
>                 nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
>
>         for (i = 0; i < nbr_pm_domains; i++) {
> @@ -1326,6 +1493,12 @@ static int camss_probe(struct platform_device *pdev)
>                 camss->csiphy_num = 4;
>                 camss->csid_num = 3;
>                 camss->vfe_num = 3;
> +       } else if (of_device_is_compatible(dev->of_node,
> +                                          "qcom,sm8250-camss")) {
> +               camss->version = CAMSS_8250;
> +               camss->csiphy_num = 6;
> +               camss->csid_num = 4;
> +               camss->vfe_num = 4;
>         } else {
>                 ret = -EINVAL;
>                 goto err_free;
> @@ -1457,7 +1630,8 @@ void camss_delete(struct camss *camss)
>         if (camss->version == CAMSS_8x96 ||
>             camss->version == CAMSS_660)
>                 nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> -       else if (camss->version == CAMSS_845)
> +       else if (camss->version == CAMSS_845 ||
> +                camss->version == CAMSS_8250)
>                 nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
>
>         for (i = 0; i < nbr_pm_domains; i++) {
> @@ -1493,6 +1667,7 @@ static const struct of_device_id camss_dt_match[] = {
>         { .compatible = "qcom,msm8996-camss" },
>         { .compatible = "qcom,sdm660-camss" },
>         { .compatible = "qcom,sdm845-camss" },
> +       { .compatible = "qcom,sm8250-camss" },
>         { }
>  };
>

This patch does not seem to apply on upstream-media/master.
