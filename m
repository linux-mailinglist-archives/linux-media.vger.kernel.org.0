Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE633893BD
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 18:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355265AbhESQ2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 12:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355411AbhESQ23 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 12:28:29 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41463C06175F
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 09:27:09 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 6so9833819pgk.5
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SakSgiZ4ddbOim/P+Jnfe0RsK1mrrxRc8FFWjgiG+Hw=;
        b=C4RQBdYrK8StFkUZxtXfsB0waWA1/ViKjhuPBk07N76D6u5UT1LGXcZMc5aDZVdXBw
         iTBHHNXJYaZkygeKDrLpKb0qzmmIpKNQSbXtQeSUmfvIUIOt7pAzvT2Xjrf7YW2as+DO
         LUyGCOFcJpHFWRNntaK90tv4pJZlDR32phNsmmnlPqQnAghYvFM6IbCsOb5lkrXjPt8s
         LX3gmQrpa+KInfNtM4ffR5n6FV7Fxr1lSgom0Ojh8ivnnhnhOzgPhOjvwl+EGn5v/Gdx
         8MUixZbxbUoBzFL7KUTeVZ5LoNQyjpTRVxP7PQQtoDyHOS0xCPY+F62VI4b7bPkHmppo
         0XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SakSgiZ4ddbOim/P+Jnfe0RsK1mrrxRc8FFWjgiG+Hw=;
        b=ReOyeMFpVMZRGcSfCSXw7UM48rZvGLQkGcnH0i9m0YXo74eZmROixYGpHl+5iAaJ3M
         WQdQpNMebGVWmxYIluHafqnrwYJgH/D8S/yyk/JhjRxMl6rV0pc4j6Gzfppr/ZmiYpom
         H2i0IGzZycUbzGl+ubWgDiRo51Yer/0I2f0q2BgC08ooJBbkh8vciWVwOMLYNIAcdKPf
         jzFGWYI00MxAk1xn3hg+QSKc0ZP1xqzCJlImSuZ70I9uD2/g0lYlHOHqdmfqNmYHZf7D
         F4wXOox/bGvNwG5bNpao7VSrpAJjW5aadYzk0Gr3uIHXL0hp51Usf44vkdS3AUF520lU
         186Q==
X-Gm-Message-State: AOAM532qtvJfS4Wvy6p8tbmLFWx5E8wWkLLoIJPWquplcPImkvcxHtr7
        8NbobyMPfSLYSQD9g1twnhcHww6kINhdBZr/MpNzbQ==
X-Google-Smtp-Source: ABdhPJwBsBhjiVRzoKpttjhEcHUgcSBV5/F0iI39ODAGN8VEsOq+opgx2eS+Vsrr/pYeZ7Vkt9I6CAAl7ipObN2gnIc=
X-Received: by 2002:a05:6a00:bc2:b029:2df:93cc:371a with SMTP id
 x2-20020a056a000bc2b02902df93cc371amr4622908pfu.12.1621441628686; Wed, 19 May
 2021 09:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-4-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-4-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 19 May 2021 18:26:57 +0200
Message-ID: <CAG3jFytj8sgC-GW03e17RWFLhJGhMGTBpBpFBhYi3fixJuAdFg@mail.gmail.com>
Subject: Re: [PATCH 03/17] media: camss: csiphy-3ph: add support for SM8250
 CSI DPHY
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
> Add support for CSIPHY (2PH/DPHY mode) found on SM8250 hardware.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 144 +++++++++++++++++-
>  1 file changed, 137 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 783b65295d20..61947576ddfb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -62,6 +62,7 @@ struct csiphy_reg_t {
>         u32 csiphy_param_type;
>  };
>
> +/* GEN2 1.0 2PH */
>  static const struct
>  csiphy_reg_t lane_regs_sdm845[5][14] = {
>         {
> @@ -146,6 +147,121 @@ csiphy_reg_t lane_regs_sdm845[5][14] = {
>         },
>  };
>
> +/* GEN2 1.2.1 2PH */
> +static const struct
> +csiphy_reg_t lane_regs_sm8250[5][20] = {
> +       {
> +               {0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0900, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0908, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0034, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0010, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x001C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +               {0x0000, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0024, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +       },
> +       {
> +               {0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0C80, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0C88, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0734, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0710, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x071C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0708, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +               {0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x070c, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0724, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +       },
> +       {
> +               {0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0A00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0A08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0234, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0210, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x021C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0208, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +               {0x0200, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x020c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0224, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +       },
> +       {
> +               {0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0B00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0B08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0434, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0410, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x041C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +               {0x0400, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x040c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0424, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +       },
> +       {
> +               {0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0C00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0C08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0634, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0610, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x061C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0608, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +               {0x0600, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x060c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0624, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +               {0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +               {0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +       },
> +};
> +
>  static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>                                    struct device *dev)
>  {
> @@ -298,13 +414,23 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
>  static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>                                      u8 settle_cnt)
>  {
> -       int i, l;
> -       u32 val;
> +       const struct csiphy_reg_t *r;
> +       int i, l, array_size;
> +       u32 val, lane_enable;
> +
> +       switch (csiphy->camss->version) {
> +       case CAMSS_845:
> +               r = &lane_regs_sdm845[0][0];
> +               array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
> +               break;
> +       case CAMSS_8250:

CAMSS_8250 is not defined until later in the series, in "media: camss:
add support for SM8250 camss".

> +               r = &lane_regs_sm8250[0][0];
> +               array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> +               break;
> +       }
>
>         for (l = 0; l < 5; l++) {
> -               for (i = 0; i < 14; i++) {
> -                       const struct csiphy_reg_t *r = &lane_regs_sdm845[l][i];
> -
> +               for (i = 0; i < array_size; i++, r++) {
>                         switch (r->csiphy_param_type) {
>                         case CSIPHY_SETTLE_CNT_LOWER_BYTE:
>                                 val = settle_cnt & 0xff;
> @@ -331,7 +457,10 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>
>         settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>
> -       val = BIT(c->clk.pos);
> +       if (csiphy->camss->version == CAMSS_8250)
> +               val = BIT(7);
> +       else
> +               val = BIT(c->clk.pos);

sdm845 and sm8250 behave the same way, and I think this chunk should
reflect that. With that being said the docs for camss-sdm845 mention
that the only valid lane for the clock is #7. I don't know if it is
preferred to enforce the restriction in the driver, yaml or both.

>         for (i = 0; i < c->num_data; i++)
>                 val |= BIT(c->data[i].pos * 2);
>
> @@ -349,7 +478,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>         if (csiphy->camss->version == CAMSS_8x16 ||
>             csiphy->camss->version == CAMSS_8x96)
>                 csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
> -       else if (csiphy->camss->version == CAMSS_845)
> +       else if (csiphy->camss->version == CAMSS_845 ||
> +                csiphy->camss->version == CAMSS_8250)
>                 csiphy_gen2_config_lanes(csiphy, settle_cnt);
>
>         /* IRQ_MASK registers - disable all interrupts */

With the above issues fixed;

Reviewed-by: Robert Foss <robert.foss@linaro.org>
