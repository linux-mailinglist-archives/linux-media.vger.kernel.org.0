Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C6E4BA52D
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 16:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242610AbiBQPy7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 10:54:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiBQPy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 10:54:58 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0EA22218E
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 07:54:43 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id lw4so8278442ejb.12
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 07:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wput3bpjefv0ZBcvYWJ8hTGFxtHb9VEPUyzQ5GyQGc4=;
        b=c/xgOIiPo4xFO0QrIE9E97qv1kYI5jj4960KtR83PFqo/hI9mw1tzKUwXU5mcQ98cE
         Av2pS7ETZdamQo6IyhzYvSYRHq+ns0aMCJrmOhfaVwR3la5cauMs0BOlRRfroKu9yVHz
         eFNlNRF+9KFDY5z+0zvdFQtfCEw7GxckgHlgiGbdMNOt45P3kYMckWwTbcH/QqsLzN01
         Tjh8imxb8AZfBBicFYh8o2fWay9Nrk+EGie8cvRdwgeeknjqMDdxiC42f7elPrgF23pz
         n4NRLH6Hh0yAMu9wGs5fFuzofkm1Ba6nOvWDLoFu8wNbJrTA1Yyv7pxhsGxKBxFDC7uD
         DZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wput3bpjefv0ZBcvYWJ8hTGFxtHb9VEPUyzQ5GyQGc4=;
        b=SlOVH4szHL4Fseki94XbUX+Re0qdVWittN2Hf2ZWCj7I0DvzOfinPhRNVEmWl8/haE
         m4lZedvMwY17j+kUkn8WMtGlNWLib8uCiV8jZ45eMe0M8ttmfJqYQq4y3SWMjvPkT0Or
         cqalH+Ec5lg3JTB1jLmui26E0qH6fzqThiUpkULU2a6ZPuPPLqgKzMnqe7II5bAZU1ia
         qJWNB63LqwcFgxZvMiHG6N0c/8XnE+21NCHr/A1l0GiNZLv/Ca2o/THflWgJfG7NeAKa
         E0/HzouUi1O8/tzGTNB2k9sPi0LK295Ogo5PiFDtHCDZZNDTJP4CW3sj4UJRKZYnVSHh
         cz0g==
X-Gm-Message-State: AOAM5338syho4W9FWf+KW5Ts36kZnJh3n5MnXUEsvxsnWBw76BpzWSuC
        0mbfSQaFi75GIxpvebJkvGFc5Xn3vn+oFRdHMZG0yg==
X-Google-Smtp-Source: ABdhPJzy99Utfbh8HJWl15gLbJ04ZynoA4UEGm1IX4cFyjI6abhvVTXx0y2aC+G5gS02yoTGtlnl6iXwIUZFus2tbv4=
X-Received: by 2002:a17:907:2bf7:b0:6cf:86bc:4e2e with SMTP id
 gv55-20020a1709072bf700b006cf86bc4e2emr2887371ejc.200.1645113281941; Thu, 17
 Feb 2022 07:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20220215230737.1870630-1-djrscally@gmail.com> <20220215230737.1870630-5-djrscally@gmail.com>
In-Reply-To: <20220215230737.1870630-5-djrscally@gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 17 Feb 2022 15:54:26 +0000
Message-ID: <CAPY8ntAttHzaUNP6-8mn7CPkJV1JisO-_pSRwfogiMjWNt9oUA@mail.gmail.com>
Subject: Re: [PATCH 04/10] media: i2c: Provide ov7251_check_hwcfg()
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        yong.zhi@intel.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, tian.shu.qiu@intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel

On Tue, 15 Feb 2022 at 23:08, Daniel Scally <djrscally@gmail.com> wrote:
>
> Move the endpoint checking from .probe() to a dedicated function,
> and additionally check that the firmware provided link frequencies
> are a match for those supported by the driver. Finally, return
> -EPROBE_DEFER if the endpoint is not available, as it could be built
> by the ipu3-cio2 driver if that probes later.
>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov7251.c | 84 ++++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index d6fe574cb9e0..5c5f7a15a640 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -1255,10 +1255,73 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
>         .pad = &ov7251_subdev_pad_ops,
>  };
>
> +static int ov7251_check_hwcfg(struct ov7251 *ov7251)
> +{
> +       struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
> +       struct v4l2_fwnode_endpoint bus_cfg = {
> +               .bus_type = V4L2_MBUS_CSI2_DPHY,
> +       };
> +       struct fwnode_handle *endpoint;
> +       bool freq_found;
> +       int i, j;
> +       int ret;
> +
> +       endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +       if (!endpoint)
> +               return -EPROBE_DEFER; /* could be provided by cio2-bridge */
> +
> +       ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> +       fwnode_handle_put(endpoint);
> +       if (ret)
> +               return dev_err_probe(ov7251->dev, ret,
> +                                    "parsing endpoint node failed\n");
> +
> +       if (bus_cfg.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +               ret = -EINVAL;
> +               dev_err(ov7251->dev, "invalid bus type (%u), must be (%u)\n",
> +                       bus_cfg.bus_type, V4L2_MBUS_CSI2_DPHY);
> +               goto out_free_bus_cfg;
> +       }
> +
> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
> +               dev_err(ov7251->dev, "only a 1-lane CSI2 config is supported");
> +               ret = -EINVAL;
> +               goto out_free_bus_cfg;
> +       }
> +
> +       if (!bus_cfg.nr_of_link_frequencies) {
> +               dev_err(ov7251->dev, "no link frequencies defined\n");
> +               ret = -EINVAL;
> +               goto out_free_bus_cfg;
> +       }
> +
> +       freq_found = false;
> +       for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> +               if (freq_found)
> +                       break;
> +
> +               for (j = 0; j < ARRAY_SIZE(link_freq); j++)
> +                       if (bus_cfg.link_frequencies[i] == link_freq[j]) {
> +                               freq_found = true;
> +                               break;
> +                       }
> +       }
> +
> +       if (i == bus_cfg.nr_of_link_frequencies) {

This doesn't work if there is only one link frequency defined in the
config and it is valid.

Loop i=0, freq_found gets set to true.
Continue the outer loop.
i++ , so i=1.
i < bus_cfg.nr_of_link_frequencies is no longer true (both are 1), so
we quit the outer loop.
i == bus_cfg.nr_of_link_frequencies, so we now fail the function.

Doesn't this last check want to be if (!freq_found) ?

And/or amend the loop to move the "if (freq_found) break;" to the end,
so that we break out of the outer loop as soon as we have a frequency
found, and thereby avoid the i++.

It all feels a little odd as there is only one link frequency used by
all the modes, and we're not actually filtering the modes that can be
selected based on the configured link frequencies should there be
multiple frequencies in link_freq[].

  Dave

> +               dev_err(ov7251->dev, "no supported link freq found\n");
> +               ret = -EINVAL;
> +               goto out_free_bus_cfg;
> +       }
> +
> +out_free_bus_cfg:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +       return ret;
> +}
> +
>  static int ov7251_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
> -       struct fwnode_handle *endpoint;
>         struct ov7251 *ov7251;
>         u8 chip_id_high, chip_id_low, chip_rev;
>         int ret;
> @@ -1270,24 +1333,9 @@ static int ov7251_probe(struct i2c_client *client)
>         ov7251->i2c_client = client;
>         ov7251->dev = dev;
>
> -       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> -       if (!endpoint) {
> -               dev_err(dev, "endpoint node not found\n");
> -               return -EINVAL;
> -       }
> -
> -       ret = v4l2_fwnode_endpoint_parse(endpoint, &ov7251->ep);
> -       fwnode_handle_put(endpoint);
> -       if (ret < 0) {
> -               dev_err(dev, "parsing endpoint node failed\n");
> +       ret = ov7251_check_hwcfg(ov7251);
> +       if (ret)
>                 return ret;
> -       }
> -
> -       if (ov7251->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> -               dev_err(dev, "invalid bus type (%u), must be CSI2 (%u)\n",
> -                       ov7251->ep.bus_type, V4L2_MBUS_CSI2_DPHY);
> -               return -EINVAL;
> -       }
>
>         /* get system clock (xclk) */
>         ov7251->xclk = devm_clk_get(dev, "xclk");
> --
> 2.25.1
>
