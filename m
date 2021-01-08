Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5242EF00B
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbhAHJuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbhAHJuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 04:50:01 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9A9C0612F5
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 01:49:21 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t30so8387917wrb.0
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 01:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6RcYttTMOnXQ/EkpLSa2hP7WyET9NuXOkFaalMdFVgM=;
        b=upXMSd/IWf84zJj2eifJ4ej+Bxpt7HnlTttf4LiN36uw9tvU4eCtR/jUPqxNvZs8As
         a0eAYW6UlPazIZ1HlYiMsk9te0WbcyZ5wZbU+3Gh34KKqWpbXV6ArAIWaSFVzHXlRGnw
         z91DEW7/aeQF0F566EvGbEMUnqSo0xkuVmkcL+SFNNHnrUBLsp6N3Za7NZU4CIp+IMFF
         pTp2B15WVxZSmWpy3ChmdL7+Lvt1qbHrk/JaupVjx+iunmBCr6mQXuxb22F8yixtQrxT
         RwuvvA6MAk8qlu2lq8jyK82T684YEpZe3pQ/EITjvGQbfCOz8sSxKLXZDi2vunT+xh0B
         VrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6RcYttTMOnXQ/EkpLSa2hP7WyET9NuXOkFaalMdFVgM=;
        b=aWvnLzqsG4gukjBhXk2/+ygaXvmXLEjaOFdg4mY9jjMzUTNSTue9GaqMym2rJduv65
         SkeWcMEXGqId3l5FhgIu8aF06LsjSX3XFnjTPzYnT3KkBBDVfirlfUfMJ9iiryvf1hmk
         BXSR+iKPOkSJsgaMAJBGNoZdEihIfeJW12WHKsP1CpqAyslj6XJi+ADcoA40L4BeSnTM
         dio8I+c5fRRzlhRPlSTWdhgDA3C3SVO5cI+GD0i6L7yLeH1xrEquAMZYg5GkTrcipLja
         EQdNNdusKmfRdxM/02yt8m/n9eB+qEw/kvaHTAMJZm6+8LkxigJu2OiCnHJEe0UCYT7E
         JOjg==
X-Gm-Message-State: AOAM531QMYzXC4UUgWNAu7/+Z4p8J5gn0rTo3E6tpP8MByVg5nTAzPBe
        mDXpa6dkiPP0w9Amn+FlewiK0+0GF3qUU1xCr5bRnQ==
X-Google-Smtp-Source: ABdhPJxlNukvJ6v5Vi6Sol8VEaWaRMlqnUbpU+ZmI4OWw99W5JQjYWAAj0IN9GsuCkAUMQ2pNFDQXTMEJRyimM4JS2M=
X-Received: by 2002:adf:ef12:: with SMTP id e18mr2779398wro.192.1610099359674;
 Fri, 08 Jan 2021 01:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20210107142123.639477-1-robert.foss@linaro.org>
In-Reply-To: <20210107142123.639477-1-robert.foss@linaro.org>
From:   Tomasz Figa <tfiga@google.com>
Date:   Fri, 8 Jan 2021 18:49:07 +0900
Message-ID: <CAAFQd5BVSNGDV7ZkiVpZwbfTfRLJmNvopMQFnQno+CDs+bo3Gg@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov8856: Fix Bayer format dependance on mode
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Thu, Jan 7, 2021 at 11:21 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> The Bayer GRBG10 mode used for earlier modes 3280x2460 and
> 1640x1232 isn't the mode output by the sensor for the
> 3264x2448 and 1632x1224 modes.
>
> Switch from MEDIA_BUS_FMT_SGRBG10_1X10 to MEDIA_BUS_FMT_SBGGR10_1X10
> for 3264x2448 & 1632x1224 modes.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>
> Changes since v1:
>  - Sakari: Added mode information to ov8856_mode struct
>  - Sakari: enum_mbus_code updated
>
>  drivers/media/i2c/ov8856.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 2f4ceaa80593..7cd83564585c 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -126,6 +126,9 @@ struct ov8856_mode {
>
>         /* Sensor register settings for this resolution */
>         const struct ov8856_reg_list reg_list;
> +
> +       /* MEDIA_BUS_FMT for this mode */
> +       u32 code;
>  };
>
>  static const struct ov8856_reg mipi_data_rate_720mbps[] = {
> @@ -942,6 +945,11 @@ static const char * const ov8856_test_pattern_menu[] = {
>         "Bottom-Top Darker Color Bar"
>  };
>
> +static const u32 ov8856_formats[] = {
> +       MEDIA_BUS_FMT_SBGGR10_1X10,
> +       MEDIA_BUS_FMT_SGRBG10_1X10,
> +};
> +
>  static const s64 link_freq_menu_items[] = {
>         OV8856_LINK_FREQ_360MHZ,
>         OV8856_LINK_FREQ_180MHZ
> @@ -974,6 +982,7 @@ static const struct ov8856_mode supported_modes[] = {
>                         .regs = mode_3280x2464_regs,
>                 },
>                 .link_freq_index = OV8856_LINK_FREQ_720MBPS,
> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>         },
>         {
>                 .width = 3264,
> @@ -986,6 +995,7 @@ static const struct ov8856_mode supported_modes[] = {
>                         .regs = mode_3264x2448_regs,
>                 },
>                 .link_freq_index = OV8856_LINK_FREQ_720MBPS,
> +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
>         },
>         {
>                 .width = 1640,
> @@ -998,6 +1008,7 @@ static const struct ov8856_mode supported_modes[] = {
>                         .regs = mode_1640x1232_regs,
>                 },
>                 .link_freq_index = OV8856_LINK_FREQ_360MBPS,
> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>         },
>         {
>                 .width = 1632,
> @@ -1010,6 +1021,7 @@ static const struct ov8856_mode supported_modes[] = {
>                         .regs = mode_1632x1224_regs,
>                 },
>                 .link_freq_index = OV8856_LINK_FREQ_360MBPS,
> +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
>         }
>  };
>
> @@ -1281,8 +1293,8 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
>  {
>         fmt->width = mode->width;
>         fmt->height = mode->height;
> -       fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>         fmt->field = V4L2_FIELD_NONE;
> +       fmt->code = mode->code;
>  }
>
>  static int ov8856_start_streaming(struct ov8856 *ov8856)
> @@ -1519,11 +1531,10 @@ static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_pad_config *cfg,
>                                  struct v4l2_subdev_mbus_code_enum *code)
>  {
> -       /* Only one bayer order GRBG is supported */
> -       if (code->index > 0)
> +       if (code->index >= ARRAY_SIZE(ov8856_formats))
>                 return -EINVAL;
>
> -       code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +       code->code = ov8856_formats[code->index];
>
>         return 0;
>  }
> @@ -1532,10 +1543,11 @@ static int ov8856_enum_frame_size(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_pad_config *cfg,
>                                   struct v4l2_subdev_frame_size_enum *fse)
>  {
> -       if (fse->index >= ARRAY_SIZE(supported_modes))
> +       if ((fse->code != ov8856_formats[0]) &&
> +           (fse->code != ov8856_formats[1]))

Shouldn't this be validated against the current mode? I guess it's the
question about which part of the state takes precedence - the mbus
code or the frame size.

Best regards,
Tomasz
