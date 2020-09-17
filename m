Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC5626D484
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 09:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIQHUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 03:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgIQHUY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 03:20:24 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998FFC061756
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 00:20:22 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u13so850904pgh.1
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 00:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=8mZBJ8cLMtckf5ie94vJM9dG4dXSSI5Lejo+Q/gBHh4=;
        b=emqitvXamm1Zt4kpxTich+8DdlEB5lfs6ctgPWa0EPCVR9Iyj+wLVcTCZ44Z74IjUY
         94Mj+hbZqt2kyeIzD3SJ1u5sB1MIHi4psCJJgsF8tfoS7tmUTZ5OzCuBFiTkY4d9O9Xl
         sE6j+kvR4hBDGNAXRH3Jf1laOeVtuJl9IgMUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=8mZBJ8cLMtckf5ie94vJM9dG4dXSSI5Lejo+Q/gBHh4=;
        b=b7N+fFcQmwmpIwusnQwTqA40FSWUR3Of8WGzEBMzAWzKcLlIeQIZ4y8NaFoLteDCHz
         M3TCLUr+TLfQbrwoT2N7rAHyNXNJp+3k4xqCeXcXfdSc674Arlqb3ZLJ+XtlFkxAOP7w
         DQnCEYGy09Qztn1rYzIrYDkFAqzkjsHjiifnyZcQ0TRcuJ0zOCRw0230FDzGS3M+IIIl
         VqE75w2hmf1Cf3UyLGoGKuCpxLIB/5Fjp8A4+NlPdpxUNN5mYRIo3DSS5ijJc2SQFSFK
         dzT9kjcyJcGYLZCc3gfEK4/qNydGHBcT+PuBjchKrJ1mUqGfx24zTDwUFDiUrEABKcVp
         Mp/w==
X-Gm-Message-State: AOAM530oypUt9rJ3wBw1T9fFTo7D1Av+QRe6THCy76N2k1t/HKxpmJFU
        gaJADV3uJ+JctSXK5ax5IvmyG6XkYQemWA==
X-Google-Smtp-Source: ABdhPJwXci7bPJVYBFGnOsZ81TDzX4aNaBlsDL4MOUhAzC4BVReOIP1FUogHNHnB3AqHInM5cq0p0Q==
X-Received: by 2002:a63:d648:: with SMTP id d8mr21375045pgj.4.1600327222184;
        Thu, 17 Sep 2020 00:20:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 143sm19564027pfc.66.2020.09.17.00.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:20:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600305963-7659-3-git-send-email-mansur@codeaurora.org>
References: <1600305963-7659-1-git-send-email-mansur@codeaurora.org> <1600305963-7659-3-git-send-email-mansur@codeaurora.org>
Subject: Re: [RESEND v2 2/4] venus: core: vote for video-mem path
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Thu, 17 Sep 2020 00:20:20 -0700
Message-ID: <160032722036.4188128.15261798942473063496@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-16 18:26:01)
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 52a3886..064b6c8 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -363,8 +363,16 @@ static __maybe_unused int venus_runtime_suspend(stru=
ct device *dev)
> =20
>         ret =3D icc_set_bw(core->cpucfg_path, 0, 0);
>         if (ret)
> -               return ret;
> +               goto err_poweron_core;
> +
> +       ret =3D icc_set_bw(core->video_path, 0, 0);
> +       if (ret)
> +               goto err_poweron_core;
> +
> +       return ret;
> =20
> +err_poweron_core:
> +       pm_ops->core_power(dev, POWER_ON);

Don't we need to put back the bandwidth from before suspend was entered
if the video_path fails?

>         return ret;
>  }
>
