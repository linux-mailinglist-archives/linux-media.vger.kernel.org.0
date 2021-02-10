Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A60331690A
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 15:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhBJOYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 09:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhBJOYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 09:24:37 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519B1C061574
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 06:23:57 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id cv23so1187852pjb.5
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 06:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MPgybWOPz9O8KUCUEo9OULkMkLL6UsB5l9YUlsh/sYA=;
        b=QrvT1sx0pSFF+l/9RHgHJWGNWxEmPN+Ow3+annBHqQ5Lwdjk8t50ctv/kusRScAjQi
         xAhBAYcB++RJlH6lya4XQ4BBxcV7xbK4YIjs635zeBzE7FD/WryRCNtLCTb7jvyNq7kT
         +oFp6x5Wdlk+GXh011QlsJsCwCVqXp9PprlJqhskqGeXXy8Sv+1ZmeAoIwA2JCdww6Sr
         F5O5XG8M5hJAo8ZvUXRzaM3/3I7eQiuXwsr7XqgCaxrKPP0aiHF4AKtKkMSMOOZxi+NL
         XblNJ0C6SFxdEMQylqFvhs5z9W/5fJuQrcq/JpoFn7oAaB8G0aItBOz3aqyReulkyzRX
         GyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MPgybWOPz9O8KUCUEo9OULkMkLL6UsB5l9YUlsh/sYA=;
        b=WAd5dumifGLJ2SEAwJHkiB9+cAaLHSzILDkAY4KCoYNHYqEOtggDcZtQT4xd5sCOZx
         GccP3dnzkpzQ2UN7b4LfAzSie/9dK1j4qFekPD/6hkHxBYty6zwkGs8lIEVrpmswBPwG
         O+Mf9HQsUltkBMGFM9YoB5j9fs/hvRTrrKUUd9ki81AxfFA+xlUqhIRIT8nyNbVgT/gF
         zN10One6lLNUKjSj3FJ3KYhzucrA4Ya3I5f+qeYt8tXEypJYCGoCJyeV0dzNLl78Foor
         0Vcowm6i9Xfzj7qoEHn0oYuelO/bGO0nSKOSd2HeAzdFKims2n1j28HMwkG/EBpKKurh
         FYmw==
X-Gm-Message-State: AOAM531liWfJUn91Atf2QvyAlOKyoN4+1qgx1GMSSwJ1AFjpGKhC0JSy
        nZyLmJB+nDTTrdIhu4euDr5lmp2EdsdkBXcEYQK/jg==
X-Google-Smtp-Source: ABdhPJyHFwLn1YvUc5+umh9ZUkR80qmd5zC5Amw2Hy/evxQddUInk4UiCVAFc7Y7NDYhurh20nXMI8ql53REo1NawqA=
X-Received: by 2002:a17:902:e5cf:b029:e2:5300:b1b8 with SMTP id
 u15-20020a170902e5cfb02900e25300b1b8mr3190228plf.69.1612967036709; Wed, 10
 Feb 2021 06:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20210210122906.3037085-1-junak.pub@gmail.com>
In-Reply-To: <20210210122906.3037085-1-junak.pub@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 10 Feb 2021 15:23:45 +0100
Message-ID: <CAG3jFyvTGE8NtkjjNaXNeVueTYCUPStwp=mADVVbkgeDaQ_8zw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Fix overflows in clock rate calculations
To:     Vladimir Lypak <junak.pub@gmail.com>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Vladimir,

This patch looks good to me, thanks for the submission.
Acked-by: Robert Foss <robert.foss@linaro.org>

On Wed, 10 Feb 2021 at 13:51, Vladimir Lypak <junak.pub@gmail.com> wrote:
>
> Because of u32 type being used to store pixel clock rate, expression used
> to calculate pipeline clocks (pixel_clock * bpp) produces wrong value due
> to integer overflow. This patch changes data type used to store, pass and
> retrieve pixel_clock from u32 to u64 to make this mistake less likely to
> be repeated in the future.
>
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c           | 2 +-
>  drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c | 4 ++--
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 4 ++--
>  drivers/media/platform/qcom/camss/camss-csiphy.c         | 4 ++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h         | 2 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c            | 4 ++--
>  drivers/media/platform/qcom/camss/camss.c                | 2 +-
>  drivers/media/platform/qcom/camss/camss.h                | 2 +-
>  8 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index be3fe76f3dc30..6307b889baa69 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -462,7 +462,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>  static int csid_set_clock_rates(struct csid_device *csid)
>  {
>         struct device *dev = csid->camss->dev;
> -       u32 pixel_clock;
> +       u64 pixel_clock;
>         int i, j;
>         int ret;
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> index 12bce391d71fd..ec66d1557b8b1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> @@ -57,7 +57,7 @@ static void csiphy_reset(struct csiphy_device *csiphy)
>   * Return settle count value or 0 if the CSI2 pixel clock
>   * frequency is not available
>   */
> -static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
> +static u8 csiphy_settle_cnt_calc(u64 pixel_clock, u8 bpp, u8 num_lanes,
>                                  u32 timer_clk_rate)
>  {
>         u32 mipi_clock; /* Hz */
> @@ -83,7 +83,7 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>
>  static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>                                 struct csiphy_config *cfg,
> -                               u32 pixel_clock, u8 bpp, u8 lane_mask)
> +                               u64 pixel_clock, u8 bpp, u8 lane_mask)
>  {
>         struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>         u8 settle_cnt;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 97cb9de850315..cd6eb88a7c153 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -113,7 +113,7 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
>   * Return settle count value or 0 if the CSI2 pixel clock
>   * frequency is not available
>   */
> -static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
> +static u8 csiphy_settle_cnt_calc(u64 pixel_clock, u8 bpp, u8 num_lanes,
>                                  u32 timer_clk_rate)
>  {
>         u32 mipi_clock; /* Hz */
> @@ -137,7 +137,7 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>
>  static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>                                 struct csiphy_config *cfg,
> -                               u32 pixel_clock, u8 bpp, u8 lane_mask)
> +                               u64 pixel_clock, u8 bpp, u8 lane_mask)
>  {
>         struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>         u8 settle_cnt;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 509c9a59c09cd..61628f55c4f63 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -102,7 +102,7 @@ static u8 csiphy_get_bpp(const struct csiphy_format *formats,
>  static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>  {
>         struct device *dev = csiphy->camss->dev;
> -       u32 pixel_clock;
> +       u64 pixel_clock;
>         int i, j;
>         int ret;
>
> @@ -238,7 +238,7 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>  static int csiphy_stream_on(struct csiphy_device *csiphy)
>  {
>         struct csiphy_config *cfg = &csiphy->cfg;
> -       u32 pixel_clock;
> +       u64 pixel_clock;
>         u8 lane_mask = csiphy_get_lane_mask(&cfg->csi2->lane_cfg);
>         u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
>                                 csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index f7967ef836dcc..450c8247bd533 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -50,7 +50,7 @@ struct csiphy_hw_ops {
>         void (*reset)(struct csiphy_device *csiphy);
>         void (*lanes_enable)(struct csiphy_device *csiphy,
>                              struct csiphy_config *cfg,
> -                            u32 pixel_clock, u8 bpp, u8 lane_mask);
> +                            u64 pixel_clock, u8 bpp, u8 lane_mask);
>         void (*lanes_disable)(struct csiphy_device *csiphy,
>                               struct csiphy_config *cfg);
>         irqreturn_t (*isr)(int irq, void *dev);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index fae2b513b2f9d..b2c95b46ce661 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1112,7 +1112,7 @@ static inline void vfe_isr_halt_ack(struct vfe_device *vfe)
>  static int vfe_set_clock_rates(struct vfe_device *vfe)
>  {
>         struct device *dev = vfe->camss->dev;
> -       u32 pixel_clock[MSM_VFE_LINE_NUM];
> +       u64 pixel_clock[MSM_VFE_LINE_NUM];
>         int i, j;
>         int ret;
>
> @@ -1194,7 +1194,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
>   */
>  static int vfe_check_clock_rates(struct vfe_device *vfe)
>  {
> -       u32 pixel_clock[MSM_VFE_LINE_NUM];
> +       u64 pixel_clock[MSM_VFE_LINE_NUM];
>         int i, j;
>         int ret;
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 8fefce57bc49f..eb55cf436b717 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -555,7 +555,7 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
> +int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
>  {
>         struct media_entity *sensor;
>         struct v4l2_subdev *subdev;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 3a0484683cd6e..fabfce9a3496c 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -108,7 +108,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>                         struct device *dev);
>  void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>  struct media_entity *camss_find_sensor(struct media_entity *entity);
> -int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
> +int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>  int camss_pm_domain_on(struct camss *camss, int id);
>  void camss_pm_domain_off(struct camss *camss, int id);
>  void camss_delete(struct camss *camss);
> --
> 2.30.0
>
