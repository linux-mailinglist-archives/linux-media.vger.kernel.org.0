Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C4745D847
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 11:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351679AbhKYKc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 05:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354483AbhKYKa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 05:30:58 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47925C06175B
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 02:27:47 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id o4so5463936pfp.13
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 02:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7UBpZ31d6DK8dBZhR4azdbVcJo9QJ6kyKTWtZoP8ZUA=;
        b=V7TXZioMsgnY3ixi1rdbza6y/ipZx1LjCi3MDIDxmUsK5eG4A/XKBl71gvEmhyDGXZ
         BApzlpkxzVB45o7HJOYQEo3TbeMqb/m9wc1RZufvxUifmEHz8HP+emJ18nMvuxEvFfOv
         X3XOjyC32Gv2Z1TpalOW6+5oC2Z3gPVe2mHAX5ltyR7BRnIo0OFqDv5wWyHPCwpBujYn
         G8FtLIwtwydaMPFri7+pKa/AM0Tn+fRo2K/xMabsiEoxrXmYgWYJyb0AsCVZfIltMMFR
         toY8QxXIeZgrdb2f/yS8GriapcqgudGJT/DfHFIcofNPSDak3Yx69mowGyKDfI9Se+Fm
         IIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7UBpZ31d6DK8dBZhR4azdbVcJo9QJ6kyKTWtZoP8ZUA=;
        b=8D5ESQvbJXAAtOKx9FzXgGFKrgXA0NwzKqjUfh9ENA6qJaRRCw2q1dyesS21LwqCVZ
         /702nRZtuDkn+EazWaRHCmIi6LTqXBpvV0oVZqaSArShHCXr8izwDmDHSLPjqafcKx7a
         SjdYXZQqURZ3T9r9nyUTMJ+XwT+GUhxyY0L3xDt03ezZdcCIZywhNNLm/qen+VWLJuwf
         mnZEfElRXb8eN71YbpHWkQgE9/t8h5EPQiWYoGIY2/S3VPBCbUHMIyZCDyNup3S9Fpia
         OkAllYVhScR5O1KKtsXIN05ZclrZ6yJzUZco8U+8PMAKLChDQY6cKPIkfc1lWmfrFrvV
         ndtw==
X-Gm-Message-State: AOAM5314fx4/TZpCaCOzQo9oyoF/MSHduaCl0KgS5bXI/GYagMh7KC2P
        9zMePKjzZ57IVBKDlKDCZhEf7VBOdydukDrHs5ZfVQ==
X-Google-Smtp-Source: ABdhPJy1uoGrEU/t9vyQ7he6hmDCBzD1nj8yUqoFr5dJ3acoqcnsJiiK8jjIIVhgr4Vw53y3fdsOrbUVsJR6cdBD+Rs=
X-Received: by 2002:a62:7c8b:0:b0:49f:a8ae:de33 with SMTP id
 x133-20020a627c8b000000b0049fa8aede33mr13231941pfc.29.1637836066680; Thu, 25
 Nov 2021 02:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org> <20211124175921.1048375-18-bryan.odonoghue@linaro.org>
In-Reply-To: <20211124175921.1048375-18-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 25 Nov 2021 11:27:35 +0100
Message-ID: <CAG3jFytVHxOWw1aymMJtXXZ=4r3gjdjtM6Qpb8mqtzc5jSs-EA@mail.gmail.com>
Subject: Re: [PATCH v2 17/19] media: camss: Add SM8250 bandwdith configuration support
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
> Downstream makes some pretty explicit comments about voting for bus
> bandwidth prior to camcc_camnoc_axi_clk_src. Working with camx downstream
> also shows that the bandwidth vote is required to get that root clock
> working.
>
> Add a simple mechanism to declare set and unset named NOCs. Whereas the
> objective is to enable the sm8250 specifically the code has been
> implemented to allow setting of whatever NOCs different SoCs using this
> driver may require.
>
> Tested-by: Julian Grahsl <jgrahsl@snap.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 81 +++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h | 17 +++++
>  2 files changed, 98 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 066639db9f18..d9905e737d88 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2015-2018 Linaro Ltd.
>   */
>  #include <linux/clk.h>
> +#include <linux/interconnect.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/media.h>
>  #include <linux/module.h>
> @@ -841,6 +842,29 @@ static const struct resources vfe_res_8250[] = {
>         },
>  };
>
> +static const struct resources_icc icc_res_sm8250[] = {
> +       {
> +               .name = "cam_ahb",
> +               .icc_bw_tbl.avg = 38400,
> +               .icc_bw_tbl.peak = 76800,
> +       },
> +       {
> +               .name = "cam_hf_0_mnoc",
> +               .icc_bw_tbl.avg = 2097152,
> +               .icc_bw_tbl.peak = 2097152,
> +       },
> +       {
> +               .name = "cam_sf_0_mnoc",
> +               .icc_bw_tbl.avg = 0,
> +               .icc_bw_tbl.peak = 2097152,
> +       },
> +       {
> +               .name = "cam_sf_icp_mnoc",
> +               .icc_bw_tbl.avg = 2097152,
> +               .icc_bw_tbl.peak = 2097152,
> +       },
> +};
> +
>  /*
>   * camss_add_clock_margin - Add margin to clock frequency rate
>   * @rate: Clock frequency rate
> @@ -1470,6 +1494,29 @@ static int camss_configure_pd(struct camss *camss)
>         return ret;
>  }
>
> +static int camss_icc_get(struct camss *camss)
> +{
> +       const struct resources_icc *icc_res;
> +       int nbr_icc_paths = 0;
> +       int i;
> +
> +       if (camss->version == CAMSS_8250) {
> +               icc_res = &icc_res_sm8250[0];
> +               nbr_icc_paths = ICC_SM8250_COUNT;
> +       }
> +
> +       for (i = 0; i < nbr_icc_paths; i++) {
> +               camss->icc_path[i] = devm_of_icc_get(camss->dev,
> +                                                    icc_res[i].name);
> +               if (IS_ERR(camss->icc_path[i]))
> +                       return PTR_ERR(camss->icc_path[i]);
> +
> +               camss->icc_bw_tbl[i] = icc_res[i].icc_bw_tbl;
> +       }
> +
> +       return 0;
> +}
> +
>  /*
>   * camss_probe - Probe CAMSS platform device
>   * @pdev: Pointer to CAMSS platform device
> @@ -1562,6 +1609,10 @@ static int camss_probe(struct platform_device *pdev)
>                 goto err_cleanup;
>         }
>
> +       ret = camss_icc_get(camss);
> +       if (ret < 0)
> +               goto err_cleanup;
> +
>         ret = camss_init_subdevices(camss);
>         if (ret < 0)
>                 goto err_cleanup;
> @@ -1695,11 +1746,41 @@ MODULE_DEVICE_TABLE(of, camss_dt_match);
>
>  static int __maybe_unused camss_runtime_suspend(struct device *dev)
>  {
> +       struct camss *camss = dev_get_drvdata(dev);
> +       int nbr_icc_paths = 0;
> +       int i;
> +       int ret;
> +
> +       if (camss->version == CAMSS_8250)
> +               nbr_icc_paths = ICC_SM8250_COUNT;
> +
> +       for (i = 0; i < nbr_icc_paths; i++) {
> +               ret = icc_set_bw(camss->icc_path[i], 0, 0);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         return 0;
>  }
>
>  static int __maybe_unused camss_runtime_resume(struct device *dev)
>  {
> +       struct camss *camss = dev_get_drvdata(dev);
> +       int nbr_icc_paths = 0;
> +       int i;
> +       int ret;
> +
> +       if (camss->version == CAMSS_8250)
> +               nbr_icc_paths = ICC_SM8250_COUNT;
> +
> +       for (i = 0; i < nbr_icc_paths; i++) {
> +               ret = icc_set_bw(camss->icc_path[i],
> +                                camss->icc_bw_tbl[i].avg,
> +                                camss->icc_bw_tbl[i].peak);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 377e2474a485..9c644e638a94 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -56,6 +56,16 @@ struct resources_ispif {
>         char *interrupt;
>  };
>
> +struct icc_bw_tbl {
> +       u32 avg;
> +       u32 peak;
> +};
> +
> +struct resources_icc {
> +       char *name;
> +       struct icc_bw_tbl icc_bw_tbl;
> +};
> +
>  enum pm_domain {
>         PM_DOMAIN_VFE0 = 0,
>         PM_DOMAIN_VFE1 = 1,
> @@ -72,6 +82,11 @@ enum camss_version {
>         CAMSS_8250,
>  };
>
> +enum icc_count {
> +       ICC_DEFAULT_COUNT = 0,
> +       ICC_SM8250_COUNT = 4,
> +};
> +
>  struct camss {
>         enum camss_version version;
>         struct v4l2_device v4l2_dev;
> @@ -88,6 +103,8 @@ struct camss {
>         atomic_t ref_count;
>         struct device *genpd[PM_DOMAIN_GEN2_COUNT];
>         struct device_link *genpd_link[PM_DOMAIN_GEN2_COUNT];
> +       struct icc_path *icc_path[ICC_SM8250_COUNT];
> +       struct icc_bw_tbl icc_bw_tbl[ICC_SM8250_COUNT];
>  };
>
>  struct camss_camera_interface {
> --
> 2.33.0
>

Looks good!

Reviewed-by: Robert Foss <robert.foss@linaro.org>
