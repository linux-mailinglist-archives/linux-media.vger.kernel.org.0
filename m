Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6909CAFB3
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 22:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387701AbfJCUAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 16:00:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41544 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732997AbfJCUAT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 16:00:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id r2so2768172lfn.8;
        Thu, 03 Oct 2019 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NapHy1rPTgTDallxX4g8iFDr+uCGnEf2RFpdBhDGZzo=;
        b=JmRIHokBIvo1DJcwBA6wVxzr2NF0vCRfmTDgbNOtuWwY7FsnwL9b5R6EbX0V7Q21B7
         MPDWmgF7fyKUPOnKM0ugpIbFYdyuU7tbvcv5WIAaOPFU1eNmGE3azhoc69xYm+ZdaWfe
         NDBK86Mm35USGQIJ7NGsaXptiRcvSwKIbHX2pkXYK1o/pEbzVR9R6kC2/9nq7TmwQiyB
         9kOPa4+fySrly3ceHFupVzH1W63eXj+Bp01gXi+MuqeDTail+9pERNxDIPNgiMi2ima0
         YRrTL07sG/Ub7umt16iMAYUA/mJtiT4MSETdZ1W7fOVBFoi94IgoUiZ7juedBezxZDV7
         D53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NapHy1rPTgTDallxX4g8iFDr+uCGnEf2RFpdBhDGZzo=;
        b=WYF/ZYdZo2kdWEmE4cdiX3YtpL6ay4kghptdB1dotYOt4TKIvpPgf4sHw28Nwim7d+
         d+IInQ3I3OQIZszyx1m6dhys5/xZdHjcCyXxYMI/XggDBze1zazBpUJapyl1FnmYsk/c
         303xGwWe/I3elS54jcNjk5N/ZvDchxhSDq4jpWe76ZSCVnR1J/7/Ur1DIZmdrZlBQxqz
         z8HD9vfLNBfGGnXE/8NSiNcQbnhcvQq1qCVBI1Hom+KSO5mM+Y9G+6/bW2zovg6ipxI3
         dKa552II8lG0f7Fn/j7JhTnwDu2uX7Hiip+SZaHUBGo7beXAms0ka989cTvZ2qFSnr/x
         ny9g==
X-Gm-Message-State: APjAAAWpZWPqRcpCJfQFez3yvjA07Xg6asdfMT/xwD2c/B/PPMAblpjX
        MngQNqJbVyfdrqXmNkiGMGjIUIzw2uHR0PkWprA=
X-Google-Smtp-Source: APXvYqxjyz+yXTHomDPcF221F5tJRzDJfLVexFr9a1wXp4hC6/B2cWUGfY2w1dyM4Exu3RTEzKbrGoZc/Rw2fbAQkcw=
X-Received: by 2002:a19:f247:: with SMTP id d7mr6543695lfk.191.1570132816333;
 Thu, 03 Oct 2019 13:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191003144624.17899-1-daniel@qtec.com>
In-Reply-To: <20191003144624.17899-1-daniel@qtec.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Thu, 3 Oct 2019 21:59:59 +0200
Message-ID: <CAPybu_29m_PvzfA8TQGNANgQ_QFEQbhT-=ydQkE8RPJ_G_-1uQ@mail.gmail.com>
Subject: Re: [PATCH] media: imx214: Fix stop streaming
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ups.... sorry about that. Hopefully it works fine also without the
patch, but it needs to be fixed.

On Thu, Oct 3, 2019 at 4:46 PM Daniel Gomez <daniel@qtec.com> wrote:
>
> Stop video streaming when requested.
>
> When s_stream is called to stop the video streaming, if/else condition calls
> start_streaming function instead of the one for stopping it.
>
> Fixes: 436190596241 ("media: imx214: Add imx214 camera sensor driver")
> Signed-off-by: Daniel Gomez <daniel@qtec.com>

Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
> ---
>
> You can find some logs before/after running in the hardware. Notice 0x100
> register is for starting/stopping the video streaming from the imx214 sensor.
>
> * Before patch:
>
> # media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":1->"msm_ispif0":0[1],"msm_ispif0":1->"msm_vfe0_rdi0":0[1]'
> # media-ctl -d /dev/media0 -V '"imx214 3-001a":0[fmt:SRGGB10/1920x1080],"msm_csiphy0":0[fmt:SRGGB10/1920x1080],"msm_csid0":0[fmt:SRGGB10/1920x1080],"msm_ispif0":0[fmt:SRGGB10/1920x1080],"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080]'
> # yavta -f SRGGB10P -s 1920x1080 -n 1 --capture=5 /dev/v4l/by-path/platform-a34000.camss-video-index0
> Device /dev/v4l/by-path/platform-a34000.camss-video-index0 opened.
> Device `Qualcomm Camera Subsystem' on `platform:a34000.camss' (driver 'qcom-camss') supports video, capture, with mplanes.
> Video format set: SRGGB10P (41415270) 1920x1080 field none, 1 planes:
>  * Stride 2400, buffer size 2592000
> Video format: SRGGB10P (41415270) 1920x1080 field none, 1 planes:
>  * Stride 2400, buffer size 2592000
> 1 buffers requested.
> length: 1 offset: 4093609832 timestamp type/source: mono/EoF
> Buffer 0/0 mapped at address 0xffff84b6b000.
> 0 (0) [-] none 0 2592000 B 30.682759 30.705111 4.697 fps ts mono/EoF
> 1 (0) [-] none 1 2592000 B 30.749391 30.771609 15.008 fps ts mono/EoF
> 2 (0) [-] none 2 2592000 B 30.816042 30.838225 15.004 fps ts mono/EoF
> 3 (0) [-] none 3 2592000 B 30.882690 30.904992 15.004 fps ts mono/EoF
> 4 (0) [-] none 4 2592000 B 30.949333 30.971543 15.005 fps ts mono/EoF
> Captured 5 frames in 0.501681 seconds (9.966480 fps, 0.000000 B/s).
> 1 buffers released.
> # v4l2-dbg -d /dev/v4l-subdev19 -g 0x100
> ioctl: VIDIOC_DBG_G_REGISTER
> Register 0x00000100 = 1h (1d  00000001b)
>
> * After patch:
>
> # media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":1->"msm_ispif0":0[1],"msm_ispif0":1->"msm_vfe0_rdi0":0[1]'
> # media-ctl -d /dev/media0 -V '"imx214 3-001a":0[fmt:SRGGB10/1920x1080],"msm_csiphy0":0[fmt:SRGGB10/1920x1080],"msm_csid0":0[fmt:SRGGB10/1920x1080],"msm_ispif0":0[fmt:SRGGB10/1920x1080],"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080]'
> # yavta -f SRGGB10P -s 1920x1080 -n 1 --capture=5 /dev/v4l/by-path/platform-a34000.camss-video-index0
> Device /dev/v4l/by-path/platform-a34000.camss-video-index0 opened.
> Device `Qualcomm Camera Subsystem' on `platform:a34000.camss' (driver 'qcom-camss') supports video, capture, with mplanes.
> Video format set: SRGGB10P (41415270) 1920x1080 field none, 1 planes:
>  * Stride 2400, buffer size 2592000
> Video format: SRGGB10P (41415270) 1920x1080 field none, 1 planes:
>  * Stride 2400, buffer size 2592000
> 1 buffers requested.
> length: 1 offset: 3764913896 timestamp type/source: mono/EoF
> Buffer 0/0 mapped at address 0xffffb62f7000.
> 0 (0) [-] none 0 2592000 B 31.283473 31.306390 4.697 fps ts mono/EoF
> 1 (0) [-] none 1 2592000 B 31.350115 31.372475 15.006 fps ts mono/EoF
> 2 (0) [-] none 2 2592000 B 31.416765 31.439728 15.004 fps ts mono/EoF
> 3 (0) [-] none 3 2592000 B 31.483410 31.505791 15.005 fps ts mono/EoF
> 4 (0) [-] none 4 2592000 B 31.550058 31.573025 15.004 fps ts mono/EoF
> Captured 5 frames in 0.502440 seconds (9.951430 fps, 0.000000 B/s).
> 1 buffers released.
> # v4l2-dbg -d /dev/v4l-subdev19 -g 0x100
> ioctl: VIDIOC_DBG_G_REGISTER
> Register 0x00000100 = 0h (0d  00000000b)
>
>  drivers/media/i2c/imx214.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 159a3a604f0e..24659cb0d083 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -785,7 +785,7 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
>                 if (ret < 0)
>                         goto err_rpm_put;
>         } else {
> -               ret = imx214_start_streaming(imx214);
> +               ret = imx214_stop_streaming(imx214);
>                 if (ret < 0)
>                         goto err_rpm_put;
>                 pm_runtime_put(imx214->dev);
> --
> 2.20.1
>


-- 
Ricardo Ribalda
