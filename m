Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7119F36A90
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 05:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfFFDyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 23:54:14 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46884 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfFFDyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 23:54:14 -0400
Received: by mail-ed1-f66.google.com with SMTP id h10so1150302edi.13
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 20:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kIvQ1sS/OpNhTZqfsenmMSeWF7OiJ2I3gdO0diuwA3M=;
        b=TdOHtsPjA9fAmTxth7+zK823+8lfvsQudGC92U4RyT1oSIpW9u72NKANUV4gVKBOrr
         HJTqjqb63YBQZ2tPPQXnwYTtdiMmHrsX328qd5DyVpuYXY+w3jZto3qGP/9xpKrIL7m4
         qdXSZvL8S80Xg/HAdpt+fyxvE//LpIF3srEOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kIvQ1sS/OpNhTZqfsenmMSeWF7OiJ2I3gdO0diuwA3M=;
        b=PMxn1VJgfB0fd2iKDtYJ3IXhoIoUvNHtpwKG1p1gZivczyQO291xGjxdIFnePRw916
         w17tu5o8KY/NvOcUS1b5hClTGUt71PksU+s0xfpN2zHU/Ho9ei8zgXgcF9aFpegqO9Bq
         xswlWUgoHC2G4cQv2XDw9nKgdloFSkPvZy+traH9N1VLDC1qO6wTU8cTYAXrR3kJEv6p
         XluOlU5SpbLJerccMt9zVRwoOLYa02Fz2+xsqDB/0fDqXNIi66+20F+6c0kgyWASfukU
         ozPhpuTGBCzoA/0Z+WY1cttuBVmlFERyyELN5077/qXcIgx7gl9Abnc+dWtrjqLKcrH1
         8o9g==
X-Gm-Message-State: APjAAAWCyyx1A8YVTmy8vJJ8mloOgB3GrKssyMlRHMqSQjSuDwg321IS
        Xgi8+WGTRoR+1xshvDNZy/HL/8yPh+VJ8g==
X-Google-Smtp-Source: APXvYqylKavVJfdB7SjsF6hcFWwWRYmgKkiRs8Auv3bvxkYMfUCk9CVaDp46eBhWk1Ei8r/g0Z0cqw==
X-Received: by 2002:a50:9116:: with SMTP id e22mr13433063eda.161.1559793252397;
        Wed, 05 Jun 2019 20:54:12 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a17sm150831edt.63.2019.06.05.20.54.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 20:54:09 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id n4so766970wrw.13
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 20:54:09 -0700 (PDT)
X-Received: by 2002:a5d:514d:: with SMTP id u13mr10799306wrt.77.1559793248723;
 Wed, 05 Jun 2019 20:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190605164625.5109-1-boris.brezillon@collabora.com>
In-Reply-To: <20190605164625.5109-1-boris.brezillon@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 6 Jun 2019 12:53:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Aji4v7fJZ+at_W58L_0+wC5E9wvSW=gCPLWswFECBMJA@mail.gmail.com>
Message-ID: <CAAFQd5Aji4v7fJZ+at_W58L_0+wC5E9wvSW=gCPLWswFECBMJA@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2: Fix the _MPLANE format check in v4l_enum_fmt()
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com, Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Jourdan <mjourdan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 6, 2019 at 1:46 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> CAP_M2M_MPLANE means the device supports _MPLANE formats for both
> capture and output. Adjust the check to avoid EINVAL errors on
> such devices.
>
> Fixes: 366c719d6479 ("media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap,out}_mplane")
> Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index b4c73e8f23c5..ace9b9761bed 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1385,6 +1385,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>         struct video_device *vdev = video_devdata(file);
>         struct v4l2_fmtdesc *p = arg;
>         int ret = check_fmt(file, p->type);
> +       u32 cap_mask;
>
>         if (ret)
>                 return ret;
> @@ -1393,7 +1394,9 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>         switch (p->type) {
>         case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -               if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
> +               cap_mask = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +                          V4L2_CAP_VIDEO_M2M_MPLANE;
> +               if (!!(vdev->device_caps & cap_mask) !=

Shouldn't devices that report V4L2_CAP_VIDEO_M2M_MPLANE have also
V4L2_CAP_VIDEO_CAPTURE_MPLANE and V4L2_CAP_VIDEO_OUTPUT_MPLANE
reported anyway?

Best regards,
Tomasz
