Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18652D406A
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 11:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbgLIK5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 05:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730263AbgLIK5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 05:57:34 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE740C0613D6
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 02:56:53 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t3so933671pgi.11
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 02:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7VihS8UZRpLZrdHjYOKQ2pp7IsLDsu9GnvDVWQGO/T0=;
        b=R++eJ29cYWxAN+/F/3ChxmEWxhJgn5BVqlVzAlVejga10koM7L39MsylEZw3A2QorG
         x53uTZoW0SzI+tTpQNOsB8RZOL1SVzch3wHzb0jlRAcGE3Y4049nAlxJT6aYWq6dDVG4
         wVrk/oQ7B5karjipcYl0GIT9lBWDYtf7N2YTW6xsOLIfZYDCpOdYddNucKJQU4seDxQo
         0w7XqhRq4OVq7u24z+TWx4OYq7Qlzq0kc6aXfmroahkviJW4tA+Uj9pD42/sATEddAMe
         xLXa3SAfjhKVMytZZSE/IKm2SRl3A4o9tTLBUDTpg8Lxw8k/ctiRkyeRNURkuSzyy/aB
         Qm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7VihS8UZRpLZrdHjYOKQ2pp7IsLDsu9GnvDVWQGO/T0=;
        b=Ht7DfuzVY9UHwblxdyPCNUvpNPadox1v83xH4zhcywLl6SndFCOb4VH5TL/yooiS/v
         Pz/7Ftcsk+FBpIfVqie8NXQQMpyPth2umvRTzjE0cey2RXiN+fvUUdIFRe73Zra0Bs2g
         oPGNQepFlJ/0fFROxaA4hyzAzpwqMn1kTjWOYIjNjdL40eNU+t5Kvqnh/geCgyctC8iz
         wwdlGzvb7ibhwUR7uQhxSsTJiIMm9q8bs7iTg4eqRYYGM/YOzbonEKo0t5CreRvxhRh0
         L7JDqt6yOp7k5AAlxnO5uYYNJ9IqZK/1NjByoCvnAw3bkuATQdW0e8P3WsFFpC0fNAc5
         ITAg==
X-Gm-Message-State: AOAM533MH2F9ldqUOyvnF4u313zcxYkBG/siIAsCuNJ5pT0oKKfFhs8o
        CAJIrfkROFUiVlKP7PBQ/nQF48XxRqJSh+AbqyYiUw==
X-Google-Smtp-Source: ABdhPJzLaiyGpxIFRGP60i7SgoyYNy5UI77xOAibOeDYqF4rGR+pWCgiM53zWz3su6YV8uM6t3HbFAW3boTRFA5qOEA=
X-Received: by 2002:a05:6a00:2382:b029:198:15a2:aaf9 with SMTP id
 f2-20020a056a002382b029019815a2aaf9mr1582890pfc.39.1607511413578; Wed, 09 Dec
 2020 02:56:53 -0800 (PST)
MIME-Version: 1.0
References: <X9BzujGgPAM/s+rG@mwanda> <X9Bz8pRFNhR2x11I@mwanda>
In-Reply-To: <X9Bz8pRFNhR2x11I@mwanda>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 9 Dec 2020 11:56:38 +0100
Message-ID: <CAG3jFytWd3p3sBoC8PLUES-SJFu=DxQWED9jGmLO7zCaCXdRFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camss: missing error code in msm_video_register()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for submitting this Dan.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 9 Dec 2020 at 07:51, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This error path returns success but it should return -EINVAL.
>
> Fixes: cba3819d1e93 ("media: camss: Format configuration per hardware version")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 2fa3214775d5..97cea7c4d769 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -961,6 +961,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>                         video->nformats = ARRAY_SIZE(formats_rdi_8x96);
>                 }
>         } else {
> +               ret = -EINVAL;
>                 goto error_video_register;
>         }
>
> --
> 2.29.2
>
