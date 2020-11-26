Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC732C5200
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 11:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387924AbgKZK1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 05:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgKZK1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 05:27:08 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9776FC0617A7
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 02:27:08 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id m9so1375137pgb.4
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 02:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgJRzBWgmp6ezjp+pp/RSafCYZqljDuN430R30/KheA=;
        b=UYtiger8uqFTy7mlurYH0+WXJVCFZX0XBM0GzBQoKOdv9FzzldIX+PTScuu7ge7WHb
         9SWT4Hl7oupwUyGrvV9JysSw1tQejEh0o4PNDSDQRhPyILXcISGvFIBXtv21m8ec024H
         XyMb3ZMwZLUit3JnH1DoV3yXypMK2FnvPN6kjviEE/NJMyLTDHBklJgfcp/C7ZKMg2aL
         +HLGeS1nBtvHZk8VLfMSQkgPuUKQnObU9Pxddqe5M9VcOWhEi+JgP7IPAeeYp3P/g5t8
         F4I+paZlmq1hOSd1EzNMIBzfv81r5M2iigPTefyRbEd734K0UVsxwO67dada99RxHaSv
         uQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgJRzBWgmp6ezjp+pp/RSafCYZqljDuN430R30/KheA=;
        b=VViwj0v88zN50Ydae1kmxwGGDMq6p5qU9LmbTYCEXkZA+5BLQiHtWekGXRdnW3th/m
         SpmvV1SqnFAD7lUcgK16PmcWUTnrUxHPILLVEWfblcGxQ1zF2PeKjqCK6RoqkILSyqMN
         phPf+J7LdFBq8e1pKTtGy4eH14/fjc/KziBhpplPCJo1j4XP3aqVG2WEHYvpd/PIQ7wR
         1A8zBpiqkC+sT0fHUxuZAjvHPnq7qOF+91D+uqVD4GgStXmKPV12hYMZ7GVQnk5zzhCw
         nV8US1Qvcu9fZX03Iy66lPtgjawUiv4oXeaniBk/5WlLjdjn4nGIXruN3A1SgqHBQs9x
         P/Qg==
X-Gm-Message-State: AOAM530kPFWRsngMGKdunWrqDVsJ9GlXEYsbQSyDzsQR9TIA4iRvGc7s
        QnjuVde279WEi8iswyzXvx7kPlVrkVgs2R+/idUzBA==
X-Google-Smtp-Source: ABdhPJz91dc8tLqbixVGj8HYhNQwiyZMh2ty2xmP1M7X5pC9QeuEvR3+y7Uxizuj0W8hoR5eOzY8gh5UpLbJqECIjw8=
X-Received: by 2002:a17:90a:fc92:: with SMTP id ci18mr2917180pjb.75.1606386428056;
 Thu, 26 Nov 2020 02:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20201125123710.28491-1-andrey.konovalov@linaro.org> <20201125123710.28491-2-andrey.konovalov@linaro.org>
In-Reply-To: <20201125123710.28491-2-andrey.konovalov@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 Nov 2020 11:26:56 +0100
Message-ID: <CAG3jFytaZFQuY0eZstm9TQ_Dry8oWapUgp3EhCjWB-dE+qkxig@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camss: Make use of V4L2_CAP_IO_MC
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Andrey,

I've suggested a small change, with that feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 25 Nov 2020 at 13:37, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Implement mbus_code filtering for format enumeration.
>
> Without this patch libcamera errors out with:
> "ERROR V4L2 v4l2_videodevice.cpp:982 /dev/video0[cap]: Media bus code
> filtering not supported by the device"
>
> This is the second version of this change which handles the case of
> several pixel formats corresponding to one media bus format correctly.
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 20673de9020e..60737b771d52 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -539,6 +539,7 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>  {
>         struct camss_video *video = video_drvdata(file);
>         int i, j, k;
> +       u32 mcode = f->mbus_code;
>
>         if (f->type != video->type)
>                 return -EINVAL;
> @@ -549,7 +550,12 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>         /* find index "i" of "k"th unique pixelformat in formats array */

Maybe this is a good place to explain how mcode is used, and for which
extension it is required.

>         k = -1;
>         for (i = 0; i < video->nformats; i++) {
> +               if (mcode != 0 && video->formats[i].code != mcode)
> +                       continue;
> +
>                 for (j = 0; j < i; j++) {
> +                       if (mcode != 0 && video->formats[j].code != mcode)
> +                               continue;
>                         if (video->formats[i].pixelformat ==
>                                         video->formats[j].pixelformat)
>                                 break;
> @@ -948,8 +954,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>         }
>
>         vdev->fops = &msm_vid_fops;
> -       vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING |
> -                                                       V4L2_CAP_READWRITE;
> +       vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING
> +                         | V4L2_CAP_READWRITE | V4L2_CAP_IO_MC;
>         vdev->ioctl_ops = &msm_vid_ioctl_ops;
>         vdev->release = msm_video_release;
>         vdev->v4l2_dev = v4l2_dev;
> --
> 2.17.1
>
