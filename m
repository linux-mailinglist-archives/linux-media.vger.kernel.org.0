Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA2B38AF2D
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243100AbhETMwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243087AbhETMvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:51:38 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2747DC069176
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:14:17 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t30so11710615pgl.8
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+11Asx9mB6ZyWHyZn4h1vSOfApP9ND3aSL86GPZLDE8=;
        b=drRAtIfz7o3efRjYGNUrYYK4FSZooNjDRta0p9WGLPAgjwmUIB2Rt0HozeQ9k72rI6
         n0DfB7ldV8NvKV7bGfRMoElKKbwdsamH+qba9+Spn3R/XlRn0kh8YSIKnnyK4o9yEZZp
         Ipl8lTxvURBCzbqQZYBPaHtYwjPgLKVs6R2B/K0nWIbgIld2rgWK4OUx1z8vQeTbS3ah
         1tIRbbkS1YeBvUpBdcuf7UNwkFH3Ivwl1HuSocPqCCKnbztfuT2Rh3dLAr2uWx1TqPi0
         hEIKfv4vfStz3l/k4JT+cOoSo0A5Ybu0pwKh2TIWQo/r98HnZYxIQlUAYK0ePoU1eBFU
         PxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+11Asx9mB6ZyWHyZn4h1vSOfApP9ND3aSL86GPZLDE8=;
        b=ZNEd/AEW2H9uOy4Y7vNe0ajmW+piSDcTioRNj0uYBO2o+SJ2M/IKDE+wnoR26XHh1A
         pzzYQqkD0rC6vNp5EAANksVPj+OHWFafp5UVllRh5I22fY72EyEnL8kgzr5bLTJR3dzc
         PKl9b57IwCENpFYRkpQsxilDWG5CCpTO/zA4AcepKjtyjJGBiuP6pV8t1ahTQS0Owkit
         dmfx+5fLvkhoLxrGRRBV8f6jmY2F9OloCi9yf2x/wjp9CVEuyx5bqDXNPxX6uoPlzBir
         7T0b78jqCOmzyT0XXXhbk/OVj36m3E++5kwUqXIoG37mh3W9iA2SGn1qkWjUzCY49f8C
         HdTQ==
X-Gm-Message-State: AOAM531ykOUI1qIa130mAYmyjLmq2XJPskQ50yBFUJiavGULczeSrk3P
        4175a0xj8Qwf5JCS6NgP68oy5xvIfiKXRVX7VxSpIrt14HTAFw==
X-Google-Smtp-Source: ABdhPJwbodNgWFgeN2AQHQRqgbGi8pKONPqqgmZHyx3zuUWP8wat9k8I1mThIO5zDnJdgh+krIPYwYTr7uNlCIK1IH4=
X-Received: by 2002:a63:1054:: with SMTP id 20mr4317007pgq.120.1621512857098;
 Thu, 20 May 2021 05:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-10-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-10-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 20 May 2021 14:14:04 +0200
Message-ID: <CAG3jFyv71xJxkH_aq9PMObSKRu1GUcekCHpwKRMTbnrch2vG_Q@mail.gmail.com>
Subject: Re: [PATCH 09/17] media: camss: csid: allow csid to work without a regulator
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

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> At least for titan HW, CSID don't have an associated regulator. This change
> is necessary to be able to model this in the CSID resources.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index cc11fbfdae13..528674dea06c 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -162,7 +162,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>                         return ret;
>                 }
>
> -               ret = regulator_enable(csid->vdda);
> +               ret = csid->vdda ? regulator_enable(csid->vdda) : 0;
>                 if (ret < 0) {
>                         pm_runtime_put_sync(dev);
>                         return ret;
> @@ -170,14 +170,16 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>
>                 ret = csid_set_clock_rates(csid);
>                 if (ret < 0) {
> -                       regulator_disable(csid->vdda);
> +                       if (csid->vdda)
> +                               regulator_disable(csid->vdda);
>                         pm_runtime_put_sync(dev);
>                         return ret;
>                 }
>
>                 ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
>                 if (ret < 0) {
> -                       regulator_disable(csid->vdda);
> +                       if (csid->vdda)
> +                               regulator_disable(csid->vdda);
>                         pm_runtime_put_sync(dev);
>                         return ret;
>                 }
> @@ -188,7 +190,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>                 if (ret < 0) {
>                         disable_irq(csid->irq);
>                         camss_disable_clocks(csid->nclocks, csid->clock);
> -                       regulator_disable(csid->vdda);
> +                       if (csid->vdda)
> +                               regulator_disable(csid->vdda);
>                         pm_runtime_put_sync(dev);
>                         return ret;

Since this & the previous chunks of failure cleanups are growing
larger, maybe it is time to extract all of the failure cleanups into
gotos. That should probably go into a seperate patch though.

>                 }
> @@ -197,7 +200,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>         } else {
>                 disable_irq(csid->irq);
>                 camss_disable_clocks(csid->nclocks, csid->clock);
> -               ret = regulator_disable(csid->vdda);
> +               ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
>                 pm_runtime_put_sync(dev);
>         }
>
> @@ -634,7 +637,9 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>
>         /* Regulator */
>
> -       csid->vdda = devm_regulator_get(dev, res->regulator[0]);
> +       csid->vdda = NULL;
> +       if (res->regulator[0])
> +               csid->vdda = devm_regulator_get(dev, res->regulator[0]);
>         if (IS_ERR(csid->vdda)) {
>                 dev_err(dev, "could not get regulator\n");
>                 return PTR_ERR(csid->vdda);

Reviewed-by: Robert Foss <robert.foss@linaro.org>
