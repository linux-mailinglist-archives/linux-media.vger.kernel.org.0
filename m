Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB7345D86A
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 11:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354582AbhKYKuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 05:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349586AbhKYKsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 05:48:17 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C57C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 02:43:44 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id s137so4887973pgs.5
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PLDLR5j0uGVv9q27fcEmCOFCgkuYsEfI0zTW3hiJpl4=;
        b=GIbsqeGnjW1ynQqSkUG0vdCVPpMgM4AXg0OJdgKe5xgiIs5ck+Y5DBupLRrVSbifSl
         /bM7yBLvxt8+5Ojjx+GdsM1W/ZLZIHhxOa1ywPnzOGGz1zi+/pKLpgWGBsALKo/jmUpj
         SwFhGQY0L6sYoGVCYFC39uO3ZiVwklWOsORldpq5hXbGXxDcolLpzqzUcgn9UaCIwC28
         +VsnnIRkOogFkmXRZcjk/W4kjEFidkgzjHbBVcgwcG+KT8wfTIobZxvcBnhJEP+0rJaI
         Q6Y4mDeTTd2haqEIhDhlr89JewkrnxetqX0asbvTK2GmfxJCK/6Mx5+ZPsuIPr3PIecq
         8Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PLDLR5j0uGVv9q27fcEmCOFCgkuYsEfI0zTW3hiJpl4=;
        b=O6neaQdgLNe/laNWOxk+3y9KjJcsGDoohuwkR1q5T4H4vqYEDTeVzYjuZHRypVVSjm
         njSpIU/n+dwYby3kVyEK9SwYp7Kpr0G5aAPZaFtNHkWZeyDkv9y51RVIuLs8uOXDbxwH
         KBIgrnVts9ZMiobJyZ3wdVRaTpZlta+JW4Rpbey7SmsXj4K41vzOpRO/7rxsQ+kQt0Z0
         viS0dEPVHyADmiygT2f7Lca1b5kZYGaeV1VLuG3jSZnJwvB2fXA+AV7mcQfAuZHxDS4D
         /UbN/Do3dhVi2USKgLdU6xL/03W/igmDUkND2OxlbFY4r/Vcolilh7nizMriu0DkQ45k
         /kzw==
X-Gm-Message-State: AOAM5302ouv8BoXshQ5kbvLze4IxrTnCshKuwn8CZM2/l4phSHYqqW04
        GJIoLpdj79XWmeJEPbDMUx8smQmjQBCG3txUkA2gYQ==
X-Google-Smtp-Source: ABdhPJxj8GzS1yiZIzq3ZfxvRsHM69e1vu7aC8vZmXn7atXgX7lOy/NZB4hc6Bfk4+E+SZLt2VmU5+Cm/DVB1zTZAd4=
X-Received: by 2002:a63:85c3:: with SMTP id u186mr10381560pgd.201.1637837023695;
 Thu, 25 Nov 2021 02:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org> <20211124175921.1048375-19-bryan.odonoghue@linaro.org>
In-Reply-To: <20211124175921.1048375-19-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 25 Nov 2021 11:43:31 +0100
Message-ID: <CAG3jFyuZ7EZyxJhXOKbE5mzo6mHGrsp_xe97cJWKjenMk2zLHA@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] media: camss: Do vfe_get/vfe_put for csid on sm8250
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, jgrahsl@snap.com, hfink@snap.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 24 Nov 2021 at 18:57, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The sm8250 CAMSS CSID depends on the VFE it is attached to being powered on
> and clocked prior to taking the CSID out of reset.
>
> It is possible to open just the CSID subdev from libcamera and attempt to
> bring the CSID block up.
>
> If we do not first bring up the VFE the CSID will fail to come out of
> reset.
>
> Tested-by: Julian Grahsl <jgrahsl@snap.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 12 +++++++++++-
>  drivers/media/platform/qcom/camss/camss-vfe.c  |  4 ++--
>  drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 9ef6fbbeeddf..e6835b92695b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -156,10 +156,18 @@ static int csid_set_clock_rates(struct csid_device *csid)
>  static int csid_set_power(struct v4l2_subdev *sd, int on)
>  {
>         struct csid_device *csid = v4l2_get_subdevdata(sd);
> -       struct device *dev = csid->camss->dev;
> +       struct camss *camss = csid->camss;
> +       struct device *dev = camss->dev;
> +       struct vfe_device *vfe = &camss->vfe[csid->id];
>         int ret;
>
>         if (on) {
> +               if (camss->version == CAMSS_8250) {
> +                       ret = vfe_get(vfe);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +
>                 ret = pm_runtime_resume_and_get(dev);
>                 if (ret < 0)
>                         return ret;
> @@ -204,6 +212,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>                 camss_disable_clocks(csid->nclocks, csid->clock);
>                 ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
>                 pm_runtime_put_sync(dev);
> +               if (camss->version == CAMSS_8250)
> +                       vfe_put(vfe);
>         }
>
>         return ret;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5b5fe620914d..703ea39f1262 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -575,7 +575,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int vfe_get(struct vfe_device *vfe)
> +int vfe_get(struct vfe_device *vfe)
>  {
>         int ret;
>
> @@ -637,7 +637,7 @@ static int vfe_get(struct vfe_device *vfe)
>   * vfe_put - Power down VFE module
>   * @vfe: VFE Device
>   */
> -static void vfe_put(struct vfe_device *vfe)
> +void vfe_put(struct vfe_device *vfe)
>  {
>         mutex_lock(&vfe->power_lock);
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 6500474a749e..0eba04eb9b77 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -203,4 +203,7 @@ extern const struct vfe_hw_ops vfe_ops_4_8;
>  extern const struct vfe_hw_ops vfe_ops_170;
>  extern const struct vfe_hw_ops vfe_ops_480;
>
> +int vfe_get(struct vfe_device *vfe);
> +void vfe_put(struct vfe_device *vfe);
> +
>  #endif /* QC_MSM_CAMSS_VFE_H */
> --
> 2.33.0

Looks good to me!

Reviewed-by: Robert Foss <robert.foss@linaro.org>
