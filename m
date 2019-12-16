Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF3051203DC
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 12:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfLPL0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 06:26:08 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:33834 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfLPL0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 06:26:08 -0500
Received: by mail-io1-f66.google.com with SMTP id z193so2950303iof.1;
        Mon, 16 Dec 2019 03:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ELdUONa2ckCb0g92cQe783L5naGON8kZrHYJoYPRMio=;
        b=XBw5mkBv5ooaIsqGbE/cYqaQZopWtsnyWp6M617AWWh5EAZRLDoGG7nM31k9DZxZr+
         64gNmCWVlfSEpNVqKyVBxZxhTcuyeP3UW87f8jFHFY6k0mBGKUZ4u+kk10mWnx2Qd7c6
         xgE3CV7k/tuBGO5qu8fWnKevQpN646HSqPYYfIaPQAVdzmCNA0oBBvMMMfixRqoZf0AN
         cJilQ7FxTREx4MO73wx1hOMnnRffWlZeMRo5h/kcwbAMx4IrhuxK5HS/eyb6XtiQUfe+
         uBCeo9VO8HdqE11wzfbLab9U9AQct9YErpfo6OyKRS/OWSs5F3xuOsOYI8zKyfIZLNaq
         e/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ELdUONa2ckCb0g92cQe783L5naGON8kZrHYJoYPRMio=;
        b=qw6ogCaTDf22q/iQX/T+kFMmkJ0XpaYTf6akgwEfIRn7gAwclqXXRDPXdo4o21aRnX
         6v/4vsNezkl2D24gt81NUX3BVFo2JKkx//KdGBd/WeHiRwzVGENnXi+ddNjteRJOIPO6
         C5fjHqnKm1HnJRCqzqrMgcySRANW54noiif7ksdyR2GXoK+8kN8JUuKKBIS5kJIcS3U9
         wjV3N26gUL9OwEp6CslwFuygI/E/6JCPhcVFcb2lUyo5APEDrHuBUpdFxd90UBWoaLY8
         R3YZEF25Xmn55hpfriBDXPif9V8atgEsSqhUbeJd0ilj6KjUCP4of76g5I47ryu8pb2v
         B5Dg==
X-Gm-Message-State: APjAAAVUmW40BdT284IjR8Z2GU4TMEVXj5Izh/u6DUgK4M8A/Ra81koi
        orzwAdAkaUvBDiO79u2gWgrrI1yXPXrbfwFHsUg=
X-Google-Smtp-Source: APXvYqyA11cuClnOLO4oeV+SgFJThguY0x2zlrGH9RqOy9cyEprbnVIl37fc0V3tC5HMMwCWqY47vjyKEZER/AJjSDQ=
X-Received: by 2002:a5e:8505:: with SMTP id i5mr17060768ioj.158.1576495567012;
 Mon, 16 Dec 2019 03:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20191025190723.21105-1-aford173@gmail.com>
In-Reply-To: <20191025190723.21105-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 16 Dec 2019 05:25:55 -0600
Message-ID: <CAHCN7xJZ2oF-vV87RVygLrcDU5tAee5M+btn+m3gHOewHjmv0Q@mail.gmail.com>
Subject: Re: [PATCH] media: ov5640: Put max framerate into table and simplify check
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 25, 2019 at 2:07 PM Adam Ford <aford173@gmail.com> wrote:
>
> Currently the various modes are placed into a table, but when
> ov5640_find_mode is called, it has to double check whether
> or not the requested framerate is tolerated by the mode.
> The determination is based on checking hact, vact, and frame rate.
>
> Only 640x480 is allowed at 60fps and QSXGA is limited to 15fps, but
> as the number of permitted frame rates change, this will begin to
> add more and more complexity to the check.
>
> This patch simplifies the check by adding the max framerate
> allowed for each mode into the table of modes.  It then compares
> the requested framerate to the max permitted in the mode's table.
> This reduces the number of comparisions to one down from three
> at run-time.

Gentle nudge on this patch.  It's been nearly two months without any feedback.
There were some fixes backported to stable kernels which will get ugly
as this drivers gets more mature and as framerates start to increase.

This patch should simplify the check by adding the max frame rate to
the table and then only having to do to one check later.

adam
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 5e495c833d32..19e10c59860b 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -189,6 +189,7 @@ struct ov5640_mode_info {
>         u32 vtot;
>         const struct reg_value *reg_data;
>         u32 reg_data_size;
> +       u32 max_fps;
>  };
>
>  struct ov5640_ctrls {
> @@ -544,6 +545,7 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
>         0, SUBSAMPLING, 640, 1896, 480, 984,
>         ov5640_init_setting_30fps_VGA,
>         ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
> +       OV5640_30_FPS,
>  };
>
>  static const struct ov5640_mode_info
> @@ -551,39 +553,48 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>         {OV5640_MODE_QCIF_176_144, SUBSAMPLING,
>          176, 1896, 144, 984,
>          ov5640_setting_QCIF_176_144,
> -        ARRAY_SIZE(ov5640_setting_QCIF_176_144)},
> +        ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> +        OV5640_30_FPS},
>         {OV5640_MODE_QVGA_320_240, SUBSAMPLING,
>          320, 1896, 240, 984,
>          ov5640_setting_QVGA_320_240,
> -        ARRAY_SIZE(ov5640_setting_QVGA_320_240)},
> +        ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> +        OV5640_30_FPS},
>         {OV5640_MODE_VGA_640_480, SUBSAMPLING,
>          640, 1896, 480, 1080,
>          ov5640_setting_VGA_640_480,
> -        ARRAY_SIZE(ov5640_setting_VGA_640_480)},
> +        ARRAY_SIZE(ov5640_setting_VGA_640_480),
> +        OV5640_60_FPS},
>         {OV5640_MODE_NTSC_720_480, SUBSAMPLING,
>          720, 1896, 480, 984,
>          ov5640_setting_NTSC_720_480,
> -        ARRAY_SIZE(ov5640_setting_NTSC_720_480)},
> +        ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> +       OV5640_30_FPS},
>         {OV5640_MODE_PAL_720_576, SUBSAMPLING,
>          720, 1896, 576, 984,
>          ov5640_setting_PAL_720_576,
> -        ARRAY_SIZE(ov5640_setting_PAL_720_576)},
> +        ARRAY_SIZE(ov5640_setting_PAL_720_576),
> +        OV5640_30_FPS},
>         {OV5640_MODE_XGA_1024_768, SUBSAMPLING,
>          1024, 1896, 768, 1080,
>          ov5640_setting_XGA_1024_768,
> -        ARRAY_SIZE(ov5640_setting_XGA_1024_768)},
> +        ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> +        OV5640_30_FPS},
>         {OV5640_MODE_720P_1280_720, SUBSAMPLING,
>          1280, 1892, 720, 740,
>          ov5640_setting_720P_1280_720,
> -        ARRAY_SIZE(ov5640_setting_720P_1280_720)},
> +        ARRAY_SIZE(ov5640_setting_720P_1280_720),
> +        OV5640_30_FPS},
>         {OV5640_MODE_1080P_1920_1080, SCALING,
>          1920, 2500, 1080, 1120,
>          ov5640_setting_1080P_1920_1080,
> -        ARRAY_SIZE(ov5640_setting_1080P_1920_1080)},
> +        ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
> +        OV5640_30_FPS},
>         {OV5640_MODE_QSXGA_2592_1944, SCALING,
>          2592, 2844, 1944, 1968,
>          ov5640_setting_QSXGA_2592_1944,
> -        ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944)},
> +        ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
> +        OV5640_15_FPS},
>  };
>
>  static int ov5640_init_slave_id(struct ov5640_dev *sensor)
> @@ -1606,14 +1617,8 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
>             (!nearest && (mode->hact != width || mode->vact != height)))
>                 return NULL;
>
> -       /* Only 640x480 can operate at 60fps (for now) */
> -       if (fr == OV5640_60_FPS &&
> -           !(mode->hact == 640 && mode->vact == 480))
> -               return NULL;
> -
> -       /* 2592x1944 only works at 15fps max */
> -       if ((mode->hact == 2592 && mode->vact == 1944) &&
> -           fr > OV5640_15_FPS)
> +       /* Check to see if the current mode exceeds the max frame rate */
> +       if (ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
>                 return NULL;
>
>         return mode;
> --
> 2.17.1
>
