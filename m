Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76515760F4
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 13:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiGOL5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 07:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiGOL5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 07:57:14 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4EF89EB7
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 04:57:13 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id os14so8592358ejb.4
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 04:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qbK16Gbm94nbzaReVK0X7evWgKmmaW9SJjy+LYIFtn4=;
        b=jfBLjYyRASV7mMdiUXspW7Opso/aSZihTIYAPpHd3l1yAH8qgoHujxz2PFeWkw32/w
         IQ13kd+LbCq+U9oOm1RpwqQycvLz9VBoeYN9gV4lv4QbKTOGjtSUUnxOpJEMSBFvz/hO
         uY/MP9TwIJkCKFpb4Zi16YOHm7kLgHKZT2+X5xSbig36lIVGmBmf7ujlW+Sjtd1PaOaL
         aiSLIvgXrzCBnkCG9FO3v91jLOzh0MJDb6kgAQ9qzWG2+qESYEtEatAb5jPf+ZwhzGGz
         a0sEL+Dea+w9B+H85ohoh3aISrSRknxewWgRcgb2WWIn3xTI6yt9bnTcxl4d+l5HLE4J
         6aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qbK16Gbm94nbzaReVK0X7evWgKmmaW9SJjy+LYIFtn4=;
        b=K+6Kjw1P1OOpkFGzJVJodcr/7lsWq3xnvFe8v8ip9egZT5GFOrB38p9J2SGVqcVXWL
         IaT45oeG25mrh8X+kEFi+d+jGMHpL/Y6LfgW1EfIK/qttHlFpdJ6zf6bmc8v3jqPBjn8
         d1Zytvy4/HuRJgp5rp2vsR/xr5fcXzGzzK8POO+8SVxQThu59+9c1RVqx+05JPihoZ5h
         Jx7vFm8TlkFP6cgbAeWbSHSJaRJ9cOcP5SpxJG8f3Unrx9QoQvG+QgaLP8nPZrlOjqiY
         L+45yM8rQgUECB3moaZEnXnXD1dTQn6v/5Mvbh9cDq6drBT8kooJMbAb0d4Pcrhr1IYg
         tkWQ==
X-Gm-Message-State: AJIora91OCFCYkFk+87JVozv48GSOB5fb9p20xNcu4Voem9W/fHE4Pdp
        9c7XzB+PDGs5+J64yXL4BeqaS/Bk/UaNhmgWIHk=
X-Google-Smtp-Source: AGRyM1uB44efMwdgCPmEY0TptcIfhmj+nZIYRITbZ20616qp8vlU5GISCeFCeHP40vySRcA8iZ2JN1n/6+iS91VJaUk=
X-Received: by 2002:a17:906:7e43:b0:72b:52de:b039 with SMTP id
 z3-20020a1709067e4300b0072b52deb039mr13558541ejr.198.1657886231753; Fri, 15
 Jul 2022 04:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com> <20220630230713.10580-49-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220630230713.10580-49-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 15 Jul 2022 06:56:57 -0500
Message-ID: <CAHCN7xKVzrExUvK+fEKiTXV71J5K-VOcqxVFrew0f2dN5mjAOQ@mail.gmail.com>
Subject: Re: [PATCH v2 48/55] media: rkisp1: Add match data for i.MX8MP ISP
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 30, 2022 at 6:27 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Paul Elder <paul.elder@ideasonboard.com>
>
> Add match data to the rkisp1 driver to match the i.MX8MP ISP.
>

I am testing this series on an i.MX8MP with two Sony IMX219 cameras in
4-lane mode.
From what I can tell, the ISP_1 doesn't enumerate if ISP_0 is already
enumerated.  My guess is that the name of the ISP is hard-coded so the
second instance isn't able to load because the names conflict.  I
don't see any errors, so it's just a guess.



> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++++++++++
>  include/uapi/linux/rkisp1-config.h            |  3 +++
>  2 files changed, 25 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index f2475c6235ea..a41f89807dd7 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -496,6 +496,24 @@ static const struct rkisp1_info rk3399_isp_info = {
>         .features = RKISP1_FEATURE_MIPI_CSI2,
>  };
>
> +static const char * const imx8mp_isp_clks[] = {
> +       "isp",
> +       "hclk",
> +       "aclk",
> +};
> +
> +static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
> +       { NULL, rkisp1_isr },
> +};
> +
> +static const struct rkisp1_info imx8mp_isp_info = {
> +       .clks = imx8mp_isp_clks,
> +       .clk_size = ARRAY_SIZE(imx8mp_isp_clks),
> +       .isrs = imx8mp_isp_isrs,
> +       .isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> +       .isp_ver = IMX8MP_V10,
> +};
> +
>  static const struct of_device_id rkisp1_of_match[] = {
>         {
>                 .compatible = "rockchip,px30-cif-isp",
> @@ -505,6 +523,10 @@ static const struct of_device_id rkisp1_of_match[] = {
>                 .compatible = "rockchip,rk3399-cif-isp",
>                 .data = &rk3399_isp_info,
>         },
> +       {
> +               .compatible = "fsl,imx8mp-isp",
> +               .data = &imx8mp_isp_info,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 583ca0d9a79d..40677d47825c 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -140,12 +140,15 @@
>   * @RKISP1_V11: declared in the original vendor code, but not used
>   * @RKISP1_V12: used at least in rk3326 and px30
>   * @RKISP1_V13: used at least in rk1808
> + * @IMX8MP_V10: used in at least imx8mp
>   */
>  enum rkisp1_cif_isp_version {
>         RKISP1_V10 = 10,
>         RKISP1_V11,
>         RKISP1_V12,
>         RKISP1_V13,
> +       /* TODO Choose a better version for this */
> +       IMX8MP_V10,
>  };
>
>  enum rkisp1_cif_isp_histogram_mode {
> --
> Regards,
>
> Laurent Pinchart
>
