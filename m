Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F347C455B22
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 13:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344456AbhKRMFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 07:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344447AbhKRMFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 07:05:17 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA242C061570
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 04:02:17 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id b68so5721149pfg.11
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 04:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S6zyLf4rBaZQHFYnVQfrG1Mvv/HRfSpfyvWGKM/XzYg=;
        b=P2nN368L6rLcbt9PTv3AyuLdtHYgJVGGz9hqPXtXjedDpNbhA9YgeOXz0PW6AjvWli
         HoyNmBbQIWGB6UHGFvJ5CJ05RTuGGwPlospE/BP4nnDE1izWq/jJdTglX1yhMWpxb3Ww
         pVMNUJemr7OJnneQ89WIDMHdYHaBCCsIBxTELF+1IqGUZLyqy3LFPb9nBh+S0p/bj/3E
         Wb2a8XcdE7fE6jTsTTuqgpF1oj9EKzIx9VUHAAXkL+kxq4a4kdE5Wc0g5oRbhOyER47p
         DDsUDcHwtBIKkpNWnrPCH0sNioMwVHP5jhQ7Vqmr+HFeUbnwON6e3+e5VauFRbOY9aqJ
         jQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S6zyLf4rBaZQHFYnVQfrG1Mvv/HRfSpfyvWGKM/XzYg=;
        b=PEDTJQ8E6lZA8Iee7MS/8cgyTt2kGPsUkgL4FBCu6zcKHsb1OpoP2jilZ8ZkdmBxdf
         C7xkM8IFFiBhIWBJ4JW5wFfQCPmpAx1+lrtsN4pKG9QZXw76YA+xerP0vz466sIqaWOY
         AspL/L1cYOfWRUICHeztLzyJx7RQY8oYpO4ewIdozA/YQbzhXSPgXKcW3eHySZ86X7wk
         5R2kDT3xpiVkBeAszr+DGuQZfLcC7RafgJN7umsZxFHw+RiKIa04ooEqVtIU6GSrAvVw
         x9u8+Foxh+A/gAwtMUd7h0QtNph0+8NFGkXBOaytYEsuaEuNMUJb1DSkXX7h1SrMVr/G
         EVhA==
X-Gm-Message-State: AOAM532zJ+dy/78VNklp4hBv7q9KjqhLPIUThdZ+2oVIZBfFaFTuxjbO
        x9J6YetjrcfokLsJ764Oy66VDrrsE1u+8pA/PFEMjw==
X-Google-Smtp-Source: ABdhPJzIk5ARWMCyxIM7UA8/c8E4fXz2CCO9geupDGEnPu7eWFyHCGAnsQtT4n3uGz3Ae+L3QmPGJk/7TNuPntJUhqo=
X-Received: by 2002:aa7:9903:0:b0:49f:e368:4fc3 with SMTP id
 z3-20020aa79903000000b0049fe3684fc3mr14719769pff.1.1637236935054; Thu, 18 Nov
 2021 04:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org> <20211111161542.3936425-19-bryan.odonoghue@linaro.org>
In-Reply-To: <20211111161542.3936425-19-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 18 Nov 2021 13:02:04 +0100
Message-ID: <CAG3jFyuW4dKutvxB8vt=5keaGtJmNUO3tAViE+0Kve-HUoM8YQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 18/18] media: camss: Do vfe_get/vfe_put for csid on sm8250
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, jgrahsl@snap.com, hfink@snap.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Bryan,

On Thu, 11 Nov 2021 at 17:14, Bryan O'Donoghue
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

I think the same thing is possible for all Gen2/Titan based camss
architectures, and this fix should  be enabled for CAMSS_845 too.

With that fixed, please add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

>
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
>
