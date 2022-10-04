Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5E05F3FE1
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 11:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbiJDJhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 05:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbiJDJh2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 05:37:28 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFCC59273
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 02:34:05 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id s2so7442129edd.2
        for <linux-media@vger.kernel.org>; Tue, 04 Oct 2022 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=0goDFNMPsT99iN8llarqCHNagY3YEGP5VCKUutrZQYM=;
        b=UDVAXidYVE9W9cqXfBdX8CmCQfEtdZsMnDKdcafeoOGi7uDR1DgBnL+DBhPIDfN5LH
         3GAWvrIggnmY2oai8wkayFuxagIUWIAoLGoKBf7PJUgaLIcEYwAZySWjqhh6rEfzXwDI
         Aq0aw0il8nFfk1NRFw9D5mkFmlXfvX+0NPXobLzxjIWI39l8622IUBowHC7tPP4Xpc8Y
         CEhtOddBq0dD0PmBGVh1H9TU094xnS6Ikc4fPrJtQPNuY4uJG/X2yl/FISSnrRA+BRTq
         jt+AtWrVZisBJw7Ren93nbeNUjQHu2CKV84ZDwMsuFOrvPP75mynNofqlTL6z63jhgSi
         JS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=0goDFNMPsT99iN8llarqCHNagY3YEGP5VCKUutrZQYM=;
        b=nRixn7B6Q2EDNiqZlUOtlL+LVcdJhLEj3feRmc3OhwJVa1+t5SfQ8vNj+AWKevfEek
         VOnXQfbxRLZM5eWopoX3rkn4lBVq0sR6ahpDgUGMrHM5KARGl8D013m6OOQT1zSv31a4
         m7VWY02lIRHXfOxkVL/lENhYAR2z7wJ1zNEj7qSFLkJgMHap77Vq09IE6Nl48HUaR9Y/
         sM5niQH7mJBv/G6jpg86Oe3YwkKBpu7dRuhaolPg6LxO+JJPMGXLEkZ71WifG80T/HFx
         LlJnZFy0e4imgA73VuuWQlfqC5gRcGy++8SBese8smef0S5/bjXHiBYE6EvoHdf4Kfa4
         /0uw==
X-Gm-Message-State: ACrzQf18dKsMZaWSWtR4uzWARxRv5Ll7oYO1Fk2goOirqjIg9iRQXnIF
        a1ncwLIM2Ha0tCc6kPaaelGHc4IymbGvAW3p1btm6A==
X-Google-Smtp-Source: AMsMyM4z8e6AP33o/Tru35I4pfQLLntd9RGI5OB0u7FySG9Xy48vxch2xC5ZpEFjnnZBFJrpc2jGFQ/aXZEsFRQqhyU=
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr22563164edz.240.1664876042577; Tue, 04
 Oct 2022 02:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220926142505.1827-1-quic_mmitkov@quicinc.com> <20220926142505.1827-2-quic_mmitkov@quicinc.com>
In-Reply-To: <20220926142505.1827-2-quic_mmitkov@quicinc.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 4 Oct 2022 11:33:51 +0200
Message-ID: <CAG3jFytLqaBhsnJ8Ktc_Aaimaiq5HX2BL9=7ABBJ2gPNgSo9Ng@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: camss: sm8250: Virtual channels for CSID
To:     quic_mmitkov@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Milen,

Thanks for submitting this series.

On Mon, 26 Sept 2022 at 16:25, <quic_mmitkov@quicinc.com> wrote:
>
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>
> CSID hardware on SM8250 can demux up to 4 simultaneous streams
> based on virtual channel (vc) or datatype (dt).
> The CSID subdevice entity now has 4 source ports that can be
> enabled/disabled and thus can control which virtual channels
> are enabled. Datatype demuxing not tested.
>
> The implicit propagation of port formats has been removed
> (e.g. previously setting sink port format would set the same format
> to source port), because the source port is now not guaranteed to
> follow the same  format as the sink port.
> So port formats have to be set explicitly.
>
> CSID's s_stream is called when any stream is started or stopped.
> It will call configure_streams() that will rewrite IRQ settings to HW.
> When multiple streams are running simultaneously there is an issue
> when writing IRQ settings for one stream while another is still
> running, thus avoid re-writing settings if they were not changed
> in link setup, or by fully powering off the CSID hardware.
>
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> ---
>  .../platform/qcom/camss/camss-csid-gen2.c     | 55 ++++++++++++-------
>  .../media/platform/qcom/camss/camss-csid.c    | 41 ++++++++------
>  .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>  3 files changed, 68 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2031bde13a93..feb0f2ba982c 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -334,13 +334,14 @@ static const struct csid_format csid_formats[] = {
>         },
>  };
>
> -static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 channel)
>  {
>         struct csid_testgen_config *tg = &csid->testgen;
>         u32 val;
>         u32 phy_sel = 0;
>         u8 lane_cnt = csid->phy.lane_cnt;
> -       struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_SRC];
> +       /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
> +       struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + channel];
>         const struct csid_format *format = csid_get_fmt_entry(csid->formats, csid->nformats,
>                                                               input_format->code);
>
> @@ -351,8 +352,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>                 phy_sel = csid->phy.csiphy_id;
>
>         if (enable) {
> -               u8 vc = 0; /* Virtual Channel 0 */
> -               u8 dt_id = vc * 4;
> +               u8 vc = channel; /* mapping between virtual channel and RDIn index */

Is there any reason for having two variables (vc & channel)
representing the same thing? If not, let's keep just keep vc.

> +               u8 dt_id = vc;
>
>                 if (tg->enabled) {
>                         /* Config Test Generator */
> @@ -395,42 +396,42 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>                 val |= format->data_type << RDI_CFG0_DATA_TYPE;
>                 val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>                 val |= dt_id << RDI_CFG0_DT_ID;
> -               writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_CFG0(channel));
>
>                 /* CSID_TIMESTAMP_STB_POST_IRQ */
>                 val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
> -               writel_relaxed(val, csid->base + CSID_RDI_CFG1(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_CFG1(channel));
>
>                 val = 1;
> -               writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(channel));
>
>                 val = 0;
> -               writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(channel));
>
>                 val = 1;
> -               writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(channel));
>
>                 val = 0;
> -               writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(channel));
>
>                 val = 1;
> -               writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(channel));
>
>                 val = 0;
> -               writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(channel));
>
>                 val = 1;
> -               writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(channel));
>
>                 val = 0;
> -               writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(channel));
>
>                 val = 0;
> -               writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_CTRL(channel));
>
> -               val = readl_relaxed(csid->base + CSID_RDI_CFG0(0));
> +               val = readl_relaxed(csid->base + CSID_RDI_CFG0(channel));
>                 val |=  1 << RDI_CFG0_ENABLE;
> -               writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_CFG0(channel));
>         }
>
>         if (tg->enabled) {
> @@ -456,7 +457,16 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>                 val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
>         else
>                 val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
> -       writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
> +       writel_relaxed(val, csid->base + CSID_RDI_CTRL(channel));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +       u8 i;
> +       /* Loop through all enabled VCs and configure stream for each */
> +       for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +               if (csid->phy.en_vc & BIT(i))
> +                       __csid_configure_stream(csid, enable, i);
>  }
>
>  static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
> @@ -502,6 +512,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>         struct csid_device *csid = dev;
>         u32 val;
>         u8 reset_done;
> +       int i;
>
>         val = readl_relaxed(csid->base + CSID_TOP_IRQ_STATUS);
>         writel_relaxed(val, csid->base + CSID_TOP_IRQ_CLEAR);
> @@ -510,8 +521,12 @@ static irqreturn_t csid_isr(int irq, void *dev)
>         val = readl_relaxed(csid->base + CSID_CSI2_RX_IRQ_STATUS);
>         writel_relaxed(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
>
> -       val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(0));
> -       writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(0));
> +       /* Read and clear IRQ status for each enabled RDI channel */
> +       for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +               if (csid->phy.en_vc & BIT(i)) {
> +                       val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +                       writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +               }
>
>         val = 1 << IRQ_CMD_CLEAR;
>         writel_relaxed(val, csid->base + CSID_IRQ_CMD);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 88f188e0f750..fdb636f70010 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -209,6 +209,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>                 }
>
>                 csid->ops->hw_version(csid);
> +
> +               csid->phy.need_vc_update = true;
>         } else {
>                 disable_irq(csid->irq);
>                 camss_disable_clocks(csid->nclocks, csid->clock);
> @@ -249,7 +251,10 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>                         return -ENOLINK;
>         }
>
> -       csid->ops->configure_stream(csid, enable);
> +       if (csid->phy.need_vc_update) {
> +               csid->ops->configure_stream(csid, enable);
> +               csid->phy.need_vc_update = false;
> +       }
>
>         return 0;
>  }
> @@ -468,16 +473,6 @@ static int csid_set_format(struct v4l2_subdev *sd,
>         csid_try_format(csid, sd_state, fmt->pad, &fmt->format, fmt->which);
>         *format = fmt->format;
>
> -       /* Propagate the format from sink to source */
> -       if (fmt->pad == MSM_CSID_PAD_SINK) {
> -               format = __csid_get_format(csid, sd_state, MSM_CSID_PAD_SRC,
> -                                          fmt->which);
> -
> -               *format = fmt->format;
> -               csid_try_format(csid, sd_state, MSM_CSID_PAD_SRC, format,
> -                               fmt->which);
> -       }
> -
>         return 0;
>  }
>
> @@ -738,7 +733,6 @@ static int csid_link_setup(struct media_entity *entity,
>                 struct csid_device *csid;
>                 struct csiphy_device *csiphy;
>                 struct csiphy_lanes_cfg *lane_cfg;
> -               struct v4l2_subdev_format format = { 0 };
>
>                 sd = media_entity_to_v4l2_subdev(entity);
>                 csid = v4l2_get_subdevdata(sd);
> @@ -761,11 +755,22 @@ static int csid_link_setup(struct media_entity *entity,
>                 lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>                 csid->phy.lane_cnt = lane_cfg->num_data;
>                 csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
> +       }
> +       /* Decide which virtual channels to enable based on which source pads are enabled */
> +       if (local->flags & MEDIA_PAD_FL_SOURCE) {
> +               struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +               struct csid_device *csid = v4l2_get_subdevdata(sd);
> +               struct device *dev = csid->camss->dev;
> +
> +               if (flags & MEDIA_LNK_FL_ENABLED)
> +                       csid->phy.en_vc |= BIT(local->index - 1);
> +               else
> +                       csid->phy.en_vc &= ~BIT(local->index - 1);
>
> -               /* Reset format on source pad to sink pad format */
> -               format.pad = MSM_CSID_PAD_SRC;
> -               format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -               csid_set_format(&csid->subdev, NULL, &format);
> +               csid->phy.need_vc_update = true;
> +
> +               dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x\n",
> +                       __func__, csid->phy.en_vc);
>         }
>
>         return 0;
> @@ -816,6 +821,7 @@ int msm_csid_register_entity(struct csid_device *csid,
>         struct v4l2_subdev *sd = &csid->subdev;
>         struct media_pad *pads = csid->pads;
>         struct device *dev = csid->camss->dev;
> +       int i;
>         int ret;
>
>         v4l2_subdev_init(sd, &csid_v4l2_ops);
> @@ -852,7 +858,8 @@ int msm_csid_register_entity(struct csid_device *csid,
>         }
>
>         pads[MSM_CSID_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> -       pads[MSM_CSID_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +       for (i = MSM_CSID_PAD_FIRST_SRC; i < MSM_CSID_PADS_NUM; ++i)
> +               pads[i].flags = MEDIA_PAD_FL_SOURCE;
>
>         sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>         sd->entity.ops = &csid_media_ops;
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index f06040e44c51..d4b48432a097 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -19,8 +19,13 @@
>  #include <media/v4l2-subdev.h>
>
>  #define MSM_CSID_PAD_SINK 0
> -#define MSM_CSID_PAD_SRC 1
> -#define MSM_CSID_PADS_NUM 2
> +#define MSM_CSID_PAD_FIRST_SRC 1
> +#define MSM_CSID_PADS_NUM 5
> +
> +#define MSM_CSID_PAD_SRC (MSM_CSID_PAD_FIRST_SRC)
> +
> +/* CSID hardware can demultiplex up to 4 outputs */
> +#define MSM_CSID_MAX_SRC_STREAMS       4
>
>  #define DATA_TYPE_EMBEDDED_DATA_8BIT   0x12
>  #define DATA_TYPE_YUV420_8BIT          0x18
> @@ -81,6 +86,8 @@ struct csid_phy_config {
>         u8 csiphy_id;
>         u8 lane_cnt;
>         u32 lane_assign;
> +       u32 en_vc;
> +       u8 need_vc_update;
>  };
>
>  struct csid_device;
> --
> 2.37.3q
>

With the above fixed, please add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
