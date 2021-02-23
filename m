Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249DE3227EC
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 10:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhBWJhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 04:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbhBWJg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 04:36:57 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A47DC06178A
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 01:36:17 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 201so5318461pfw.5
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 01:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qKqNX4ktId18Ng9PtL8nhYBB5WBeeyEUuhpQ2w0NnHs=;
        b=jXsqoiSAVF6JRtxVRkwtaEqIyvv2dGKqUeTQ6hjHOZPVOAk7N+b/diIkOJPlyZFkgG
         CTJXhK+Kc7ciVd2WwiO6jyW0JDnxdcM/pYCW1fLUcLaRmKqnd7B7a8YAbSmn8EqihWgk
         Dp765cwMJbeZ6aLJY08sCR/jxl98BzBgle2L15weyiYxwh6sj/UkiokyXUadpa1++Yk8
         FsElQ1pZ2Aqf3POXw5nR39HfCi5Z2EsFkfkwZmw0JvyQmE0sSCIMkp67K1kRdKF8ESqF
         6azkaR2WnVlUUz6YRLdwGqCUYJsBS6lUT8R9qxW9pNrPdE4SQ747FnrpyazSNiSb1/4O
         99aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qKqNX4ktId18Ng9PtL8nhYBB5WBeeyEUuhpQ2w0NnHs=;
        b=KNJQRsTZC+XfCiXjiIJPkdTBPAwiTp7e4KKf/5PLI0Fk+3KUKD0zCJsI8Y2Jp3Ctd/
         QEl6/zJsvVNwraB85wQS51eixok9lTq5XnUMwlGAWL0nAb1yd12Qc4sO7cvUBPnl3B0I
         nyq3pd1GuY+ennUUTyEm8ys5JSM6tcMYkh2K37VG/FRMiaoUXqBhyIBW9+VzO0yK5D7U
         uEpIgjY9SEFNS5vQintJCsLVsVJ8cxQ50N8q0R/R1AqzdwrWLzY35Qq0uDvM+dSuoZjG
         T4c8rIHy9XOc1Mc6b5UgCd6Ggt3p2WKkpmWmYQVyBfGzSanba8NyOYlWAyniIr4eN0wp
         vTiQ==
X-Gm-Message-State: AOAM530zekql7DSBaQg9gQzAtQtlF11ImLFPj+hEgCDq53v8qwb74n0a
        rOdR+Js3ScQnmNLhHyhaeXW3fjjAgWzDXE+j4YrvSA==
X-Google-Smtp-Source: ABdhPJyqqNBTNdw0MobgNDVotykkgnpT2BxRlWG/FXBSMXHXrDgsQCzAFcwDtRbhJN6wUoUhxWcAsWZfHvfOASdYz3Y=
X-Received: by 2002:aa7:9281:0:b029:1ec:48b2:811c with SMTP id
 j1-20020aa792810000b02901ec48b2811cmr25990319pfa.18.1614072976656; Tue, 23
 Feb 2021 01:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-12-robert.foss@linaro.org> <73691f16-a7e7-71e4-1ffc-5c28805493d2@linaro.org>
In-Reply-To: <73691f16-a7e7-71e4-1ffc-5c28805493d2@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 23 Feb 2021 10:36:05 +0100
Message-ID: <CAG3jFyveQzvOkTd5bssxzwPLNze72VihmLs644-DGZvaw+L2CA@mail.gmail.com>
Subject: Re: [PATCH v5 11/22] media: camss: Add support for CSIPHY hardware
 version Titan 170
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 21 Feb 2021 at 19:17, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> Thank you for your patch!
>
> On 17.02.2021 14:21, Robert Foss wrote:
> > Add register definitions for version 170 of the Titan architecture
> > and implement support for the CSIPHY subdevice.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >
> > Changes since v3
> >   - Sakari: Make variable const
> >
> > Changes since v4
> >   - kernel test robot: Fix warning related to const
> >
> >
> >   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 182 ++++++++++++++++--
> >   .../media/platform/qcom/camss/camss-csiphy.c  |  66 +++++--
> >   drivers/media/platform/qcom/camss/camss.c     |  74 +++++++
> >   3 files changed, 290 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > index 97cb9de85031..f350c0c92362 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > @@ -47,6 +47,105 @@
> >   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID BIT(1)
> >   #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(n)        (0x8b0 + 0x4 * (n))
> >
> > +#define CSIPHY_DEFAULT_PARAMS            0
> > +#define CSIPHY_LANE_ENABLE               1
> > +#define CSIPHY_SETTLE_CNT_LOWER_BYTE     2
> > +#define CSIPHY_SETTLE_CNT_HIGHER_BYTE    3
> > +#define CSIPHY_DNP_PARAMS                4
> > +#define CSIPHY_2PH_REGS                  5
> > +#define CSIPHY_3PH_REGS                  6
> > +
> > +struct csiphy_reg_t {
> > +     int32_t  reg_addr;
> > +     int32_t  reg_data;
> > +     int32_t  delay;
> > +     uint32_t csiphy_param_type;
> > +};
> > +
> > +static const struct
> > +csiphy_reg_t lane_regs_sdm845[5][14] = {
> > +     {
> > +             {0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> > +             {0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0008, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> > +             {0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> > +             {0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +     },
> > +     {
> > +             {0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0708, 0x14, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> > +             {0x070C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0764, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +     },
> > +     {
> > +             {0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> > +             {0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0208, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> > +             {0x020C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> > +             {0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +     },
> > +     {
> > +             {0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> > +             {0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0408, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> > +             {0x040C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> > +             {0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +     },
> > +     {
> > +             {0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> > +             {0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0608, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> > +             {0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> > +             {0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +             {0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> > +     },
> > +};
> > +
> >   static void csiphy_hw_version_read(struct csiphy_device *csiphy,
> >                                  struct device *dev)
> >   {
> > @@ -135,26 +234,13 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
> >       return settle_cnt;
> >   }
> >
> > -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> > -                             struct csiphy_config *cfg,
> > -                             u32 pixel_clock, u8 bpp, u8 lane_mask)
> > +static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
> > +                                  struct csiphy_config *cfg,
> > +                                  u8 settle_cnt)
> >   {
> >       struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
> > -     u8 settle_cnt;
> > -     u8 val, l = 0;
> > -     int i;
> > -
> > -     settle_cnt = csiphy_settle_cnt_calc(pixel_clock, bpp, c->num_data,
> > -                                         csiphy->timer_clk_rate);
> > -
> > -     val = BIT(c->clk.pos);
> > -     for (i = 0; i < c->num_data; i++)
> > -             val |= BIT(c->data[i].pos * 2);
> > -
> > -     writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5));
> > -
> > -     val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
> > -     writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(6));
> > +     int i, l = 0;
> > +     u8 val;
> >
> >       for (i = 0; i <= c->num_data; i++) {
> >               if (i == c->num_data)
> > @@ -208,6 +294,66 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> >
> >       val = CSIPHY_3PH_LNn_MISC1_IS_CLKLANE;
> >       writel_relaxed(val, csiphy->base + CSIPHY_3PH_LNn_MISC1(l));
> > +}
> > +
> > +static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
> > +                                  u8 settle_cnt)
> > +{
> > +     int i, l;
> > +     u32 val;
> > +
> > +     for (l = 0; l < 5; l++) {
> > +             for (i = 0; i < 14; i++) {
> > +                     const struct csiphy_reg_t *r = &lane_regs_sdm845[l][i];
> > +
> > +                     switch (r->csiphy_param_type) {
> > +                     case CSIPHY_SETTLE_CNT_LOWER_BYTE:
> > +                             val = settle_cnt & 0xff;
> > +                             break;
> > +                     case CSIPHY_DNP_PARAMS:
> > +                             continue;
> > +                     default:
> > +                             val = r->reg_data;
> > +                             break;
> > +                     }
> > +                     writel_relaxed(val, csiphy->base + r->reg_addr);
> > +             }
> > +     }
> > +}
> > +
> > +static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> > +                             struct csiphy_config *cfg,
> > +                             u32 pixel_clock, u8 bpp, u8 lane_mask)
> > +{
> > +     struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
> > +     u8 settle_cnt;
> > +     u8 val;
> > +     int i;
> > +
> > +     settle_cnt = csiphy_settle_cnt_calc(pixel_clock, bpp, c->num_data,
> > +                                         csiphy->timer_clk_rate);
> > +
> > +     val = BIT(c->clk.pos);
> > +     for (i = 0; i < c->num_data; i++)
> > +             val |= BIT(c->data[i].pos * 2);
>
> - before your patch this "val" was written to the CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5)
>    register.
>    In your patch you are overwriting it with the below hardcoded number:
>
> > +
> > +     val = 0xd5;
>
> - why?

I think this is a mistake, and the computed value should be used. Let
me verify that it works as intended with the computed value.

>
> Thanks,
> Andrey
>
> > +     writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5));
> > +
> > +     val = 1;
> > +     writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(6));
> > +
> > +     val = 0x02;
> > +     writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(7));
> > +
> > +     val = 0x00;
> > +     writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(0));
> > +
> > +     if (csiphy->camss->version == CAMSS_8x16 ||
> > +         csiphy->camss->version == CAMSS_8x96)
> > +             csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
> > +     else if (csiphy->camss->version == CAMSS_845)
> > +             csiphy_gen2_config_lanes(csiphy, settle_cnt);
> >
> >       val = 0xff;
> >       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(11));
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > index 509c9a59c09c..e3fdc268050c 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > @@ -73,6 +73,30 @@ static const struct csiphy_format csiphy_formats_8x96[] = {
> >       { MEDIA_BUS_FMT_Y10_1X10, 10 },
> >   };
> >
> > +static const struct csiphy_format csiphy_formats_sdm845[] = {
> > +     { MEDIA_BUS_FMT_UYVY8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_VYUY8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_YUYV8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_YVYU8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
> > +     { MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
> > +     { MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
> > +     { MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
> > +     { MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
> > +     { MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
> > +     { MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
> > +     { MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> > +     { MEDIA_BUS_FMT_SBGGR14_1X14, 14 },
> > +     { MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
> > +     { MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
> > +     { MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
> > +     { MEDIA_BUS_FMT_Y10_1X10, 10 },
> > +};
> > +
> >   /*
> >    * csiphy_get_bpp - map media bus format to bits per pixel
> >    * @formats: supported media bus formats array
> > @@ -257,16 +281,20 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
> >               return -EINVAL;
> >       }
> >
> > -     val = readl_relaxed(csiphy->base_clk_mux);
> > -     if (cfg->combo_mode && (lane_mask & 0x18) == 0x18) {
> > -             val &= ~0xf0;
> > -             val |= cfg->csid_id << 4;
> > -     } else {
> > -             val &= ~0xf;
> > -             val |= cfg->csid_id;
> > +     if (csiphy->base_clk_mux) {
> > +             val = readl_relaxed(csiphy->base_clk_mux);
> > +             if (cfg->combo_mode && (lane_mask & 0x18) == 0x18) {
> > +                     val &= ~0xf0;
> > +                     val |= cfg->csid_id << 4;
> > +             } else {
> > +                     val &= ~0xf;
> > +                     val |= cfg->csid_id;
> > +             }
> > +             writel_relaxed(val, csiphy->base_clk_mux);
> > +
> > +             /* Enforce reg write ordering between clk mux & lane enabling */
> > +             wmb();
> >       }
> > -     writel_relaxed(val, csiphy->base_clk_mux);
> > -     wmb();
> >
> >       csiphy->ops->lanes_enable(csiphy, cfg, pixel_clock, bpp, lane_mask);
> >
> > @@ -557,6 +585,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
> >               csiphy->ops = &csiphy_ops_3ph_1_0;
> >               csiphy->formats = csiphy_formats_8x96;
> >               csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
> > +     } else if (camss->version == CAMSS_845) {
> > +             csiphy->ops = &csiphy_ops_3ph_1_0;
> > +             csiphy->formats = csiphy_formats_sdm845;
> > +             csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
> >       } else {
> >               return -EINVAL;
> >       }
> > @@ -570,11 +602,17 @@ int msm_csiphy_subdev_init(struct camss *camss,
> >               return PTR_ERR(csiphy->base);
> >       }
> >
> > -     r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[1]);
> > -     csiphy->base_clk_mux = devm_ioremap_resource(dev, r);
> > -     if (IS_ERR(csiphy->base_clk_mux)) {
> > -             dev_err(dev, "could not map memory\n");
> > -             return PTR_ERR(csiphy->base_clk_mux);
> > +     if (camss->version == CAMSS_8x16 ||
> > +         camss->version == CAMSS_8x96) {
> > +             r = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > +                     res->reg[1]);
> > +             csiphy->base_clk_mux = devm_ioremap_resource(dev, r);
> > +             if (IS_ERR(csiphy->base_clk_mux)) {
> > +                     dev_err(dev, "could not map memory\n");
> > +                     return PTR_ERR(csiphy->base_clk_mux);
> > +             }
> > +     } else {
> > +             csiphy->base_clk_mux = NULL;
> >       }
> >
> >       /* Interrupt */
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > index 0b1693c34fbc..5d0479b5589c 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -465,6 +465,80 @@ static const struct resources vfe_res_660[] = {
> >       }
> >   };
> >
> > +static const struct resources csiphy_res_845[] = {
> > +     /* CSIPHY0 */
> > +     {
> > +             .regulator = { NULL },
> > +             .clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
> > +                             "cpas_ahb", "cphy_rx_src", "csiphy0",
> > +                             "csiphy0_timer_src", "csiphy0_timer" },
> > +             .clock_rate = { { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 19200000, 240000000, 269333333 } },
> > +             .reg = { "csiphy0" },
> > +             .interrupt = { "csiphy0" }
> > +     },
> > +
> > +     /* CSIPHY1 */
> > +     {
> > +             .regulator = { NULL },
> > +             .clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
> > +                             "cpas_ahb", "cphy_rx_src", "csiphy1",
> > +                             "csiphy1_timer_src", "csiphy1_timer" },
> > +             .clock_rate = { { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 19200000, 240000000, 269333333 } },
> > +             .reg = { "csiphy1" },
> > +             .interrupt = { "csiphy1" }
> > +     },
> > +
> > +     /* CSIPHY2 */
> > +     {
> > +             .regulator = { NULL },
> > +             .clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
> > +                             "cpas_ahb", "cphy_rx_src", "csiphy2",
> > +                             "csiphy2_timer_src", "csiphy2_timer" },
> > +             .clock_rate = { { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 19200000, 240000000, 269333333 } },
> > +             .reg = { "csiphy2" },
> > +             .interrupt = { "csiphy2" }
> > +     },
> > +
> > +     /* CSIPHY3 */
> > +     {
> > +             .regulator = { NULL },
> > +             .clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
> > +                             "cpas_ahb", "cphy_rx_src", "csiphy3",
> > +                             "csiphy3_timer_src", "csiphy3_timer" },
> > +             .clock_rate = { { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 0 },
> > +                             { 19200000, 240000000, 269333333 } },
> > +             .reg = { "csiphy3" },
> > +             .interrupt = { "csiphy3" }
> > +     }
> > +};
> > +
> >   static const struct resources csid_res_845[] = {
> >       /* CSID0 */
> >       {
> >
