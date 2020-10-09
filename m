Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C396288EAC
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 18:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389523AbgJIQVt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 12:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389296AbgJIQVt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 12:21:49 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E397C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 09:21:49 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k8so7293138pfk.2
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 09:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZAVNk7w8MrsrtZfuqVq+66u2qWDVQuk2yZXxQPV1wK4=;
        b=Hje6fTLbyaQMHmvoS4uxCv/W8BXOhC0ZPbFmt4j4C0cBhYo7QZCUXSEPpQ9NouEeZ+
         mOFwDLtsprqysyWJcjYu9Tw84IlWaw9zHqXACDWZbDhBrjOeTmFhT1BCxPDRCqZOYxrk
         YR7592yEI8e/ykLp+CR/BbsXoueD0+QbYpFS5sC+1rWfDb987QPb0fhCq4pyawqv+vPR
         mIr4dQT7duquep5xe3CZfw+nZQfyPCD8bpaQKE2QuaKMPSGpjpsKuPg8YoaXxmPzix5v
         o000eO02lMcDaDPIQCtmpOrAx1rZXSh2x38UAJdKRS8bt/ekWJ/MvrqjJQ7901ZFdInj
         WzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZAVNk7w8MrsrtZfuqVq+66u2qWDVQuk2yZXxQPV1wK4=;
        b=fIBV7JyXsSjwTSXK0YSwPQL5M85CWrVICv4zznEfvtLVush+eUbsSxwzbQe/b7g8Kh
         rp2Tj/FUIHjCMOPG3uQmOB3xd8m14zHBxesdjzkTNg82awj5b5bHKMBEboEuFXaDw1yg
         t0BfUAe3fYpMVkwkVN/qXulleK4wlCNP1NDJfcPPHqQMZxANEUYmgQ3ckHUEztw+Owif
         tky8Q8defHYbYxiN5c/APCp0DOe7ufC7JXK9Y8zO30HbY7YSdvFT+6gXRr6h7sXlIUca
         hAqynNjg1cBT16FomsKuxsDVjbLq3WoctL7UtQaIs4uTPq65QUPEl5PpXSCSLiSm3pmv
         BFHw==
X-Gm-Message-State: AOAM533m3w3GP/NaiVHZn2NiToozzXPEwzp63JAGkzfdV1ueRaYAX/wE
        1pghmeLWf5rWxijCHUsZpAvJebXIQ1Ltvq7/Dm0V+VHJ2zAdiA==
X-Google-Smtp-Source: ABdhPJw9WY513ghxhrMpAEYz+w2NtJS+DNfe/Pam3C05I9tCS8BluaQlr6JuepnHEu1Ny49gvtEm935vJMdxSaihKH4=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr13208558pfn.73.1602260508697; Fri, 09
 Oct 2020 09:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com> <20201009150756.3397-5-sakari.ailus@linux.intel.com>
In-Reply-To: <20201009150756.3397-5-sakari.ailus@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Oct 2020 19:22:38 +0300
Message-ID: <CAHp75Vf=KCMTysgCYt2xeF4x-bfM4Zpy_thLPnysuN+QBMkc2w@mail.gmail.com>
Subject: Re: [PATCH 4/5] ipu3-cio2: Validate mbus format in setting subdev format
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 6:10 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Validate media bus code, width and height when setting the subdev format.
>
> This effectively reworks how setting subdev format is implemented in the
> driver.

Does it make it dependent on patch 3/5?
Or maybe you can use min_t() and update to min() in a separate patch?

> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 28 ++++++++++++++++--------
>  1 file changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 9c7b527a8800..9726091c9985 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1257,6 +1257,9 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>                                struct v4l2_subdev_format *fmt)
>  {
>         struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
> +       struct v4l2_mbus_framefmt *mbus;
> +       u32 mbus_code = fmt->format.code;
> +       unsigned int i;
>
>         /*
>          * Only allow setting sink pad format;
> @@ -1265,18 +1268,25 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>         if (fmt->pad == CIO2_PAD_SOURCE)
>                 return cio2_subdev_get_fmt(sd, cfg, fmt);
>
> -       mutex_lock(&q->subdev_lock);
> +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +               mbus = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +       else
> +               mbus = &q->subdev_fmt;
>
> -       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -               *v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> -       } else {
> -               /* It's the sink, allow changing frame size */
> -               q->subdev_fmt.width = fmt->format.width;
> -               q->subdev_fmt.height = fmt->format.height;
> -               q->subdev_fmt.code = fmt->format.code;
> -               fmt->format = q->subdev_fmt;
> +       fmt->format.code = formats[0].mbus_code;
> +
> +       for (i = 0; i < ARRAY_SIZE(formats); i++) {
> +               if (formats[i].mbus_code == fmt->format.code) {
> +                       fmt->format.code = mbus_code;
> +                       break;
> +               }
>         }
>
> +       fmt->format.width = min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
> +       fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);
> +
> +       mutex_lock(&q->subdev_lock);
> +       *mbus = fmt->format;
>         mutex_unlock(&q->subdev_lock);
>
>         return 0;
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
