Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737A8395981
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbhEaLPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhEaLPE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:15:04 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17976C061760
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:13:24 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u7so5068160plq.4
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M7rtmjYl1G3JP0LENPx/2+MKo1rvZR64UzRNYVYPL7k=;
        b=w+UhEQrG+R7Z/4whk2QWB0GpaE2LdfTk8YPS8MmFSqs7j4IGlKZx/sufJPT0FZqI73
         PDDtWTlqsXctWMrnCGMSjw28USLt+rhW9HVMmKsmihVusO0gr/TiC4+Ei9OoqJrMm369
         6rtEByCdptgX+sMNeB1dXJ77B+lGLI79Svd85ZS/JoR2p5joREW4usOsjticuuf7mXVo
         Khxxnp/mXO+EACO2cefAn0RQ97+oPl9WGSbtaT4t/zxdj2xJvTCcLmD9F0yyUF26pVXz
         mFH/67zohktL0ZKp9nnsQMcKeMEjo81pGpbFccVVnGZ5ZYb7q0a8BVrvg0DywCaFo8aS
         qhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M7rtmjYl1G3JP0LENPx/2+MKo1rvZR64UzRNYVYPL7k=;
        b=Ak+pRUr+ZOZ7YYepKAaDSp1EmhPyA3oYgB4IYSCgJomx6i3y+UF/cyMOUOHwbfRFRZ
         cUgPY+CannUWeidp9WIYEiewOA83jDPb1II1y/md55q46GHyV/fc29sMYhzrc+5iwdS6
         2JUZTKx0v4tSQDETRySuUJSLQkNn564CberUQDsN6gd/quJQrS5lQFm1xDCHORLD6hae
         yrRe4vjdylArnqtVHJDATxVYZSL9vv33u/jW3aJpqxebH4sHzeTsRagfhsIU0AsfNZ8r
         1H9FgxO9BH0C3kMz1/K6437qL8FfhhCJmWQy4HiZPUs/D6h0SnXErNObbnCckulPSA83
         3iAg==
X-Gm-Message-State: AOAM533BMLuPio9qDyksK4Yzj25vtfSmOfpDkB8DWq7+M4YQmFzcCOu8
        WLCXFSy4iXc+aX0w+Yrr2hInDBrscCkiTdKSTBUxyQ==
X-Google-Smtp-Source: ABdhPJzHo45kjOG5SmoDhd2D6ubaSlNGrUiJnR6xQnJqE+ZlExbxX8BmsLLaheQLQdhoyH8nLuCC0xiGMxT335qc7uk=
X-Received: by 2002:a17:902:b713:b029:fd:8738:63cb with SMTP id
 d19-20020a170902b713b02900fd873863cbmr19905123pls.28.1622459603605; Mon, 31
 May 2021 04:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-14-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-14-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 31 May 2021 13:13:12 +0200
Message-ID: <CAG3jFysYpgOpBS+GUh8ZHh16KMWtkPFGmn5O1+svHoe59XuhNQ@mail.gmail.com>
Subject: Re: [PATCH 13/17] media: camss: vfe-170: fix "VFE halt timeout" error
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> This function waits for halt_complete but doesn't do anything to cause
> it to complete, and always hits the "VFE halt timeout" error. Just delete
> this code for now.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe-170.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> index 076ca082e107..080eef767d3b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> @@ -363,17 +363,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>   */
>  static int vfe_halt(struct vfe_device *vfe)
>  {
> -       unsigned long time;
> -
> -       reinit_completion(&vfe->halt_complete);
> -
> -       time = wait_for_completion_timeout(&vfe->halt_complete,
> -                                          msecs_to_jiffies(VFE_HALT_TIMEOUT_MS));
> -       if (!time) {
> -               dev_err(vfe->camss->dev, "VFE halt timeout\n");
> -               return -EIO;
> -       }
> -
> +       /* rely on vfe_disable_output() to stop the VFE */
>         return 0;
>  }


Reviewed-by: Robert Foss <robert.foss@linaro.org>
