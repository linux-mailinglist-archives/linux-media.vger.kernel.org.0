Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3536831BEC0
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 17:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbhBOQRT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 11:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbhBOQN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 11:13:27 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6C0C06178B
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 08:10:54 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a17so8461931ljq.2
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 08:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=adyDEyXmX1vGwKBDyeGaj0KaMXvtQ9EbceU+3mS6KQE=;
        b=NbT9/U7T1xdJ+1i1v7Gs+Z5ok0/93Sp928JoFhOEfMaXIB86sbu8b0Do7E0hYAqk3l
         whBejJQEtfggW2rYktI0AsUquit8bOkgH5Dh9swfrAOKOpshmswpq6KORH8S66dNjTgW
         vZThV10dJz/MERtvFPDDWKTFV+PRrE6b2bL69lK5SSMAhw0MhdvMP+l6L93WGzS8m9My
         4uaiNnnN8ut/PT+6SbASXM9EmhMKbCsRxnX7nqewaZHhigzwPaj3D0WFho8CBcwQei3f
         nf5Ykj27KKU47QzTSi+zuJ7p/STR8/zVHuHynbjCd66DHH7nfrFYsKoc2JJprLw9OViz
         pwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=adyDEyXmX1vGwKBDyeGaj0KaMXvtQ9EbceU+3mS6KQE=;
        b=Y9/0aCrbN8gUCzCkfxIUBsnqlF8I7MRcN1ij7LRqhtmEFdv/IKtd68Rx+YQv1dICh5
         E3vWmSOF6mlECFxv7vNNqreMq29SmhLPmETtMLN6vzPpu7a8pzp+6Dsn0ZdRzTfCq+HX
         RuEo44EsOXSFtB83sRLTGO2FwCa1rG/q4PB/azBThwrAxv9gKjJP7ffnbOhYqITb/7iD
         6pg7ej1gcpAg/XSbI6Y1hAmcLqMwoKjeTDzURct8nw3a4ouiUo7NkCFQY8rCTM2ukY0C
         yjUynhd1MuAaMvzOD6eVogu9GXQoixrbVYZ9SrwjYdZbVwYc5G+0r93xtdbuJIz72t0f
         +YRA==
X-Gm-Message-State: AOAM533XeeTUV0YjpGcD0lOHBtOtPnxOGQfPFNQ4Z3MrylGSw/fLd6oy
        4toahixgDHTR/lUQR8LcPGYnYg==
X-Google-Smtp-Source: ABdhPJweMqhlOLX6RZz6rJN/AUXXv0OGR/VbdCbBwhg7bnU4eyv25XJ1euTF/T2xSkUFUoUmIiWq7g==
X-Received: by 2002:a2e:760d:: with SMTP id r13mr2125790ljc.223.1613405452352;
        Mon, 15 Feb 2021 08:10:52 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id z21sm2429362lfh.248.2021.02.15.08.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 08:10:51 -0800 (PST)
Subject: Re: [PATCH 1/2] media: camss: use v4l2_get_link_freq() to calculate
 the relevant clocks
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Vladimir Lypak <junak.pub@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        jacopo@jmondi.org, linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210214213404.8373-1-andrey.konovalov@linaro.org>
 <20210214213404.8373-2-andrey.konovalov@linaro.org>
 <CAG3jFyveFHq_vyAABvowxJOdS8Ww36w5uArEmXvcC4DO1DGVvg@mail.gmail.com>
 <CAG3jFytzLAMkyC6DhLXZ5LHan-faes3xcTPvCXk4pCN=WgFkLw@mail.gmail.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <5c47e0b6-81cc-4d1a-2ab4-562c2114408d@linaro.org>
Date:   Mon, 15 Feb 2021 19:10:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFytzLAMkyC6DhLXZ5LHan-faes3xcTPvCXk4pCN=WgFkLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thanks for your review!

On 15.02.2021 14:28, Robert Foss wrote:
> On Mon, 15 Feb 2021 at 12:27, Robert Foss <robert.foss@linaro.org> wrote:
>>
>> Hey Andrey,
>>
>> Thanks for sending out this series and picking up Vladimirs patch.
>>
>> With the below issues fixed feel free to add my r-b.
>> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> 
> Actually, make that an Acked-by.
> Acked-by: Robert Foss <robert.foss@linaro.org>

OK, thanks!

>>
>> On Sun, 14 Feb 2021 at 22:34, Andrey Konovalov
>> <andrey.konovalov@linaro.org> wrote:
>>>
>>> There are places in the camss driver where camss_get_pixel_clock() is
>>> called to get the pixel rate (using V4L2_CID_PIXEL_RATE control) and to
>>> calculate the link frequency from it. There is a case when this would
>>> not work: when V4L2_CID_PIXEL_RATE gets the rate at which the pixels are
>>> read (sampled) from the sensor's pixel array, and this rate is different
>>> from the pixel transmission rate over the CSI link, the link frequency
>>> value can't be calculated from the pixel rate. One needs to use
>>> V4L2_CID_LINK_FREQ to get the link frequency in this case.
>>>
>>> Replace such calls to camss_get_pixel_clock() with calls to a wrapper
>>> around v4l2_get_link_freq(). v4l2_get_link_freq() tries V4L2_CID_LINK_FREQ
>>> first, and if it is not implemented by the camera sensor driver, falls
>>> back to V4L2_CID_PIXEL_RATE to calculate the link frequency value from.
>>>
>>> Calls to camss_get_pixel_clock() from vfe_[check,set]_clock_rates()
>>> are left intact as it looks like this VFE clock does depend on the
>>> rate the pixel samples comes out of the camera sensor, not on the
>>> frequency at which the link between the sensor and the CSI receiver
>>> operates.
>>>
>>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>>> ---
>>>   .../media/platform/qcom/camss/camss-csid.c    | 22 ++++++------
>>>   .../qcom/camss/camss-csiphy-2ph-1-0.c         | 22 ++++++------
>>>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 22 ++++++------
>>>   .../media/platform/qcom/camss/camss-csiphy.c  | 36 +++++++++----------
>>>   .../media/platform/qcom/camss/camss-csiphy.h  |  2 +-
>>>   drivers/media/platform/qcom/camss/camss.c     | 23 ++++++++++++
>>>   drivers/media/platform/qcom/camss/camss.h     |  2 ++
>>>   7 files changed, 73 insertions(+), 56 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>>> index be3fe76f3dc3..b2cbf4b65949 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>>> @@ -462,13 +462,19 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>>   static int csid_set_clock_rates(struct csid_device *csid)
>>>   {
>>>          struct device *dev = csid->camss->dev;
>>> -       u32 pixel_clock;
>>> +       s64 link_freq;
>>>          int i, j;
>>>          int ret;
>>>
>>> -       ret = camss_get_pixel_clock(&csid->subdev.entity, &pixel_clock);
>>> -       if (ret)
>>> -               pixel_clock = 0;
>>> +       const struct csid_format *f = csid_get_fmt_entry(
>>> +               csid->formats,
>>> +               csid->nformats,
>>> +               csid->fmt[MSM_CSIPHY_PAD_SINK].code);
>>> +       u8 num_lanes = csid->phy.lane_cnt;
>>> +       link_freq = camss_get_link_freq(&csid->subdev.entity, f->bpp,
>>> +                                       2 * num_lanes);
>>
>> Checkpatch lists the following error:

Oops... indeed.

>> WARNING: Missing a blank line after declarations
>> #59: FILE: drivers/media/platform/qcom/camss/camss-csid.c:474:
>> +       u8 num_lanes = csid->phy.lane_cnt;
>> +       link_freq = camss_get_link_freq(&csid->subdev.entity, f->bpp,
>>
>>
>>> +       if (link_freq < 0)
>>> +               link_freq = 0;
>>>
>>>          for (i = 0; i < csid->nclocks; i++) {
>>>                  struct camss_clock *clock = &csid->clock[i];
>>> @@ -477,13 +483,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
>>>                      !strcmp(clock->name, "csi1") ||
>>>                      !strcmp(clock->name, "csi2") ||
>>>                      !strcmp(clock->name, "csi3")) {
>>> -                       const struct csid_format *f = csid_get_fmt_entry(
>>> -                               csid->formats,
>>> -                               csid->nformats,
>>> -                               csid->fmt[MSM_CSIPHY_PAD_SINK].code);
>>> -                       u8 num_lanes = csid->phy.lane_cnt;
>>> -                       u64 min_rate = pixel_clock * f->bpp /
>>> -                                                       (2 * num_lanes * 4);
>>> +                       u64 min_rate = link_freq / 4;
>>>                          long rate;
>>>
>>>                          camss_add_clock_margin(&min_rate);
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
>>> index 12bce391d71f..30b454c369ab 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
>>> @@ -51,16 +51,13 @@ static void csiphy_reset(struct csiphy_device *csiphy)
>>>    *
>>>    * Helper function to calculate settle count value. This is
>>>    * based on the CSI2 T_hs_settle parameter which in turn
>>> - * is calculated based on the CSI2 transmitter pixel clock
>>> - * frequency.
>>> + * is calculated based on the CSI2 transmitter link frequency.
>>>    *
>>> - * Return settle count value or 0 if the CSI2 pixel clock
>>> - * frequency is not available
>>> + * Return settle count value or 0 if the CSI2 link frequency
>>> + * is not available
>>>    */
>>> -static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>>> -                                u32 timer_clk_rate)
>>> +static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>>>   {
>>> -       u32 mipi_clock; /* Hz */
>>>          u32 ui; /* ps */
>>>          u32 timer_period; /* ps */
>>>          u32 t_hs_prepare_max; /* ps */
>>> @@ -68,8 +65,10 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>>>          u32 t_hs_settle; /* ps */
>>>          u8 settle_cnt;
>>>
>>> -       mipi_clock = pixel_clock * bpp / (2 * num_lanes);
>>> -       ui = div_u64(1000000000000LL, mipi_clock);
>>> +       if (link_freq <= 0)
>>> +               return 0;
>>> +
>>> +       ui = div_u64(1000000000000LL, link_freq);
>>>          ui /= 2;
>>>          t_hs_prepare_max = 85000 + 6 * ui;
>>>          t_hs_prepare_zero_min = 145000 + 10 * ui;
>>> @@ -83,15 +82,14 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>>>
>>>   static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>>                                  struct csiphy_config *cfg,
>>> -                               u32 pixel_clock, u8 bpp, u8 lane_mask)
>>> +                               s64 link_freq, u8 lane_mask)
>>>   {
>>>          struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>>>          u8 settle_cnt;
>>>          u8 val, l = 0;
>>>          int i = 0;
>>>
>>> -       settle_cnt = csiphy_settle_cnt_calc(pixel_clock, bpp, c->num_data,
>>> -                                           csiphy->timer_clk_rate);
>>> +       settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>>>
>>>          writel_relaxed(0x1, csiphy->base +
>>>                         CAMSS_CSI_PHY_GLBL_T_INIT_CFG0);
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index 97cb9de85031..da7c3d3f9a10 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -107,24 +107,23 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
>>>    *
>>>    * Helper function to calculate settle count value. This is
>>>    * based on the CSI2 T_hs_settle parameter which in turn
>>> - * is calculated based on the CSI2 transmitter pixel clock
>>> - * frequency.
>>> + * is calculated based on the CSI2 transmitter link frequency.
>>>    *
>>> - * Return settle count value or 0 if the CSI2 pixel clock
>>> - * frequency is not available
>>> + * Return settle count value or 0 if the CSI2 link frequency
>>> + * is not available
>>>    */
>>> -static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>>> -                                u32 timer_clk_rate)
>>> +static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>>>   {
>>> -       u32 mipi_clock; /* Hz */
>>>          u32 ui; /* ps */
>>>          u32 timer_period; /* ps */
>>>          u32 t_hs_prepare_max; /* ps */
>>>          u32 t_hs_settle; /* ps */
>>>          u8 settle_cnt;
>>>
>>> -       mipi_clock = pixel_clock * bpp / (2 * num_lanes);
>>> -       ui = div_u64(1000000000000LL, mipi_clock);
>>> +       if (link_freq <= 0)
>>> +               return 0;
>>> +
>>> +       ui = div_u64(1000000000000LL, link_freq);
>>>          ui /= 2;
>>>          t_hs_prepare_max = 85000 + 6 * ui;
>>>          t_hs_settle = t_hs_prepare_max;
>>> @@ -137,15 +136,14 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>>>
>>>   static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>>                                  struct csiphy_config *cfg,
>>> -                               u32 pixel_clock, u8 bpp, u8 lane_mask)
>>> +                               s64 link_freq, u8 lane_mask)
>>>   {
>>>          struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>>>          u8 settle_cnt;
>>>          u8 val, l = 0;
>>>          int i;
>>>
>>> -       settle_cnt = csiphy_settle_cnt_calc(pixel_clock, bpp, c->num_data,
>>> -                                           csiphy->timer_clk_rate);
>>> +       settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>>>
>>>          val = BIT(c->clk.pos);
>>>          for (i = 0; i < c->num_data; i++)
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> index 509c9a59c09c..9b5fe6fc7664 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> @@ -102,23 +102,23 @@ static u8 csiphy_get_bpp(const struct csiphy_format *formats,
>>>   static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>>>   {
>>>          struct device *dev = csiphy->camss->dev;
>>> -       u32 pixel_clock;
>>> +       s64 link_freq;
>>>          int i, j;
>>>          int ret;
>>>
>>> -       ret = camss_get_pixel_clock(&csiphy->subdev.entity, &pixel_clock);
>>> -       if (ret)
>>> -               pixel_clock = 0;
>>> +       u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
>>> +                               csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>>> +       u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>>> +       link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>>> +                                       2 * num_lanes);
>>> +       if (link_freq < 0)
>>> +               link_freq  = 0;
>>>
>>>          for (i = 0; i < csiphy->nclocks; i++) {
>>>                  struct camss_clock *clock = &csiphy->clock[i];
>>>
>>>                  if (csiphy->rate_set[i]) {
>>> -                       u8 bpp = csiphy_get_bpp(csiphy->formats,
>>> -                                       csiphy->nformats,
>>> -                                       csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>>> -                       u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>>> -                       u64 min_rate = pixel_clock * bpp / (2 * num_lanes * 4);
>>> +                       u64 min_rate = link_freq / 4;
>>>                          long round_rate;
>>>
>>>                          camss_add_clock_margin(&min_rate);
>>> @@ -238,22 +238,18 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>>>   static int csiphy_stream_on(struct csiphy_device *csiphy)
>>>   {
>>>          struct csiphy_config *cfg = &csiphy->cfg;
>>> -       u32 pixel_clock;
>>> +       s64 link_freq;
>>
>> Checkpatch throws the following error:
>>
>> WARNING: Missing a blank line after declarations
>> #211: FILE: drivers/media/platform/qcom/camss/camss-csiphy.c:112:
>> +       u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>> +       link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>>

OK, I'll fix the checkpatch warnings in v2.

Thanks,
Andrey

>>
>>>          u8 lane_mask = csiphy_get_lane_mask(&cfg->csi2->lane_cfg);
>>>          u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
>>>                                  csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>>> +       u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>>>          u8 val;
>>> -       int ret;
>>>
>>> -       ret = camss_get_pixel_clock(&csiphy->subdev.entity, &pixel_clock);
>>> -       if (ret) {
>>> -               dev_err(csiphy->camss->dev,
>>> -                       "Cannot get CSI2 transmitter's pixel clock\n");
>>> -               return -EINVAL;
>>> -       }
>>> -       if (!pixel_clock) {
>>> +       link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>>> +                                       2 * num_lanes);
>>> +       if (link_freq < 0) {
>>>                  dev_err(csiphy->camss->dev,
>>> -                       "Got pixel clock == 0, cannot continue\n");
>>> +                       "Cannot get CSI2 transmitter's link frequency\n");
>>>                  return -EINVAL;
>>>          }
>>>
>>> @@ -268,7 +264,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>>>          writel_relaxed(val, csiphy->base_clk_mux);
>>>          wmb();
>>>
>>> -       csiphy->ops->lanes_enable(csiphy, cfg, pixel_clock, bpp, lane_mask);
>>> +       csiphy->ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
>>>
>>>          return 0;
>>>   }
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
>>> index f7967ef836dc..d71b8bc6ec00 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
>>> @@ -50,7 +50,7 @@ struct csiphy_hw_ops {
>>>          void (*reset)(struct csiphy_device *csiphy);
>>>          void (*lanes_enable)(struct csiphy_device *csiphy,
>>>                               struct csiphy_config *cfg,
>>> -                            u32 pixel_clock, u8 bpp, u8 lane_mask);
>>> +                            s64 link_freq, u8 lane_mask);
>>>          void (*lanes_disable)(struct csiphy_device *csiphy,
>>>                                struct csiphy_config *cfg);
>>>          irqreturn_t (*isr)(int irq, void *dev);
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>>> index 7c0f669f8aa6..2888c7ef2303 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -548,6 +548,29 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
>>>          }
>>>   }
>>>
>>> +/**
>>> + * camss_get_link_freq - Get link frequency from sensor
>>> + * @entity: Media entity in the current pipeline
>>> + * @bpp: Number of bits per pixel for the current format
>>> + * @lanes: Number of lanes in the link to the sensor
>>> + *
>>> + * Return link frequency on success or a negative error code otherwise
>>> + */
>>> +s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>>> +                       unsigned int lanes)
>>> +{
>>> +       struct media_entity *sensor;
>>> +       struct v4l2_subdev *subdev;
>>> +
>>> +       sensor = camss_find_sensor(entity);
>>> +       if (!sensor)
>>> +               return -ENODEV;
>>> +
>>> +       subdev = media_entity_to_v4l2_subdev(sensor);
>>> +
>>> +       return v4l2_get_link_freq(subdev->ctrl_handler, bpp, lanes);
>>> +}
>>> +
>>>   /*
>>>    * camss_get_pixel_clock - Get pixel clock rate from sensor
>>>    * @entity: Media entity in the current pipeline
>>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>>> index 3a0484683cd6..86cdc25189eb 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.h
>>> +++ b/drivers/media/platform/qcom/camss/camss.h
>>> @@ -108,6 +108,8 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>>>                          struct device *dev);
>>>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>>>   struct media_entity *camss_find_sensor(struct media_entity *entity);
>>> +s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>>> +                       unsigned int lanes);
>>>   int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
>>>   int camss_pm_domain_on(struct camss *camss, int id);
>>>   void camss_pm_domain_off(struct camss *camss, int id);
>>> --
>>> 2.17.1
>>>
