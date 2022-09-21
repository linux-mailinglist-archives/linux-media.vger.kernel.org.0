Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF9E25C0217
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 17:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbiIUPr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 11:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbiIUPrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 11:47:31 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BDD9A68E
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 08:47:14 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id d12-20020a05600c3acc00b003b4c12e47f3so4020679wms.4
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hB5g2vr6Ss8VPiTPDgJNz2gUIO0z7KdIb9GL1r4XaRg=;
        b=oAKls05VRfjET6MPWOxP+Z4SLTj4faFVQuRpRXQgfb4utRk/TofVS0rT2r0AXUlZc7
         Jmtkehx/QpyS5xSLV6TK5wYQfrt8kfpxSPLOLHrD6Om2M7I2VUO5TH1GqGSGVfMO0kJQ
         oUc75LgeMu6/7iwJbit6NevJ+5wQjvuEfB8zpXbnmW+a8pe034rgqKqyObvC6YYaJq0z
         1/4u+QFAK0I8RAMxAM2+sPISV+IkVz+BWRHFBLFI29tWd0rpVHM38gAa3UwbUzemKE1g
         nrlTvdXzRU/krK0geMyY3G9hmr6JJGkZi3rlctuf81csOUMq0Q+wIm+1eIkXMXHoyYE6
         +adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hB5g2vr6Ss8VPiTPDgJNz2gUIO0z7KdIb9GL1r4XaRg=;
        b=IgeXZ8ZUXL1sUdHH/wqu+MzYuQXLpEaTpInLh6iKHt0M+E5jgEyyfK4MAOWasLUpRx
         qLoUVkHpwjqinCsU19d+JLscxyEeRlAHnCwcZToDSjWN856nawIWVNgpsRdmXLuUykf0
         0u3h4aEB1HSuIPQ6+pEGqSdXeWLRTbz39934i+HunLsANPogBT9tBB27jH/ilr8sp+xC
         IZ4x/3HFK/0tdXhq7dlkJpcAcyFVRTPjvb0/Fn0LUAsZE59SEd5nvgplnGQyim5ZIBGy
         EAymjLdjwNQuBmbynZVH/4L/Vh+oSkfJTIgkOhpY4YLBo0Bpp2uuOGoDqHCuaBNDw6J+
         AS5Q==
X-Gm-Message-State: ACrzQf1xZqSa45aeFxh4+WYxpfQJZN7rVRMkYXPRiGV7DeR4owopFpaF
        6IEvx1OMyoVWNY6UgiXTi9v1Hg==
X-Google-Smtp-Source: AMsMyM4BpRzlXzpJAJ+oO67Vh1511ZtKDDuRn/12COoHBRa0SK1n43nwoygeQaVIhEsQWUsn/DQkcQ==
X-Received: by 2002:a05:600c:19d2:b0:3b4:a4cb:2416 with SMTP id u18-20020a05600c19d200b003b4a4cb2416mr6456939wmq.6.1663775231958;
        Wed, 21 Sep 2022 08:47:11 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bs11-20020a056000070b00b00226dba960b4sm2896410wrb.3.2022.09.21.08.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 08:47:11 -0700 (PDT)
Message-ID: <4f5e64c9-c510-cadf-af59-96c99ecb20be@linaro.org>
Date:   Wed, 21 Sep 2022 16:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] media: camss: sm8250: Virtual channels for CSID
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org
References: <20220921141012.1709-1-quic_mmitkov@quicinc.com>
 <20220921141012.1709-2-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220921141012.1709-2-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2022 15:10, quic_mmitkov@quicinc.com wrote:
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
>   .../platform/qcom/camss/camss-csid-gen2.c     | 55 ++++++++++++-------
>   .../media/platform/qcom/camss/camss-csid.c    | 41 ++++++++------
>   .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>   3 files changed, 68 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2031bde13a93..9f8a3b71394a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -334,13 +334,14 @@ static const struct csid_format csid_formats[] = {
>   	},
>   };
>   
> -static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 channel)
>   {
>   	struct csid_testgen_config *tg = &csid->testgen;
>   	u32 val;
>   	u32 phy_sel = 0;
>   	u8 lane_cnt = csid->phy.lane_cnt;
> -	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_SRC];
> +	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + channel];
>   	const struct csid_format *format = csid_get_fmt_entry(csid->formats, csid->nformats,
>   							      input_format->code);
>   
> @@ -351,8 +352,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		phy_sel = csid->phy.csiphy_id;
>   
>   	if (enable) {
> -		u8 vc = 0; /* Virtual Channel 0 */
> -		u8 dt_id = vc * 4;
> +		u8 vc = channel; /* mapping between virtual channel and RDIn index */
> +		u8 dt_id = vc;
>   
>   		if (tg->enabled) {
>   			/* Config Test Generator */
> @@ -395,42 +396,42 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		val |= format->data_type << RDI_CFG0_DATA_TYPE;
>   		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>   		val |= dt_id << RDI_CFG0_DT_ID;
> -		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_CFG0(channel));
>   
>   		/* CSID_TIMESTAMP_STB_POST_IRQ */
>   		val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
> -		writel_relaxed(val, csid->base + CSID_RDI_CFG1(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_CFG1(channel));
>   
>   		val = 1;
> -		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(channel));
>   
>   		val = 0;
> -		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(channel));
>   
>   		val = 1;
> -		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(channel));
>   
>   		val = 0;
> -		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(channel));
>   
>   		val = 1;
> -		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(channel));
>   
>   		val = 0;
> -		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(channel));
>   
>   		val = 1;
> -		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(channel));
>   
>   		val = 0;
> -		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(channel));
>   
>   		val = 0;
> -		writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_CTRL(channel));
>   
> -		val = readl_relaxed(csid->base + CSID_RDI_CFG0(0));
> +		val = readl_relaxed(csid->base + CSID_RDI_CFG0(channel));
>   		val |=  1 << RDI_CFG0_ENABLE;
> -		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
> +		writel_relaxed(val, csid->base + CSID_RDI_CFG0(channel));
>   	}
>   
>   	if (tg->enabled) {
> @@ -456,7 +457,16 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
>   	else
>   		val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
> -	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
> +	writel_relaxed(val, csid->base + CSID_RDI_CTRL(channel));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i;
> +	/* Loop through all enabled VCs and configure stream for each */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & (1 << i))

You should use BIT(n) instead of the shift, same comment for your shifts 
below.

> +			__csid_configure_stream(csid, enable, i);
>   }
>   
>   static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
> @@ -502,6 +512,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   	struct csid_device *csid = dev;
>   	u32 val;
>   	u8 reset_done;
> +	int i;
>   
>   	val = readl_relaxed(csid->base + CSID_TOP_IRQ_STATUS);
>   	writel_relaxed(val, csid->base + CSID_TOP_IRQ_CLEAR);
> @@ -510,8 +521,12 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   	val = readl_relaxed(csid->base + CSID_CSI2_RX_IRQ_STATUS);
>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
>   
> -	val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(0));
> -	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(0));
> +	/* Read and clear IRQ status for each enabled RDI channel */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & (1 << i)) {
> +			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +		}
>   
>   	val = 1 << IRQ_CMD_CLEAR;
>   	writel_relaxed(val, csid->base + CSID_IRQ_CMD);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 88f188e0f750..2ee425b4277f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -209,6 +209,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>   		}
>   
>   		csid->ops->hw_version(csid);
> +
> +		csid->phy.need_vc_update = true;
>   	} else {
>   		disable_irq(csid->irq);
>   		camss_disable_clocks(csid->nclocks, csid->clock);
> @@ -249,7 +251,10 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>   			return -ENOLINK;
>   	}
>   
> -	csid->ops->configure_stream(csid, enable);
> +	if (csid->phy.need_vc_update) {
> +		csid->ops->configure_stream(csid, enable);
> +		csid->phy.need_vc_update = false;
> +	}
>   
>   	return 0;
>   }
> @@ -468,16 +473,6 @@ static int csid_set_format(struct v4l2_subdev *sd,
>   	csid_try_format(csid, sd_state, fmt->pad, &fmt->format, fmt->which);
>   	*format = fmt->format;
>   
> -	/* Propagate the format from sink to source */
> -	if (fmt->pad == MSM_CSID_PAD_SINK) {
> -		format = __csid_get_format(csid, sd_state, MSM_CSID_PAD_SRC,
> -					   fmt->which);
> -
> -		*format = fmt->format;
> -		csid_try_format(csid, sd_state, MSM_CSID_PAD_SRC, format,
> -				fmt->which);
> -	}
> -
>   	return 0;
>   }
>   
> @@ -738,7 +733,6 @@ static int csid_link_setup(struct media_entity *entity,
>   		struct csid_device *csid;
>   		struct csiphy_device *csiphy;
>   		struct csiphy_lanes_cfg *lane_cfg;
> -		struct v4l2_subdev_format format = { 0 };
>   
>   		sd = media_entity_to_v4l2_subdev(entity);
>   		csid = v4l2_get_subdevdata(sd);
> @@ -761,11 +755,22 @@ static int csid_link_setup(struct media_entity *entity,
>   		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>   		csid->phy.lane_cnt = lane_cfg->num_data;
>   		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
> +	}
> +	/* Decide which virtual channels to enable based on which source pads are enabled */
> +	if (local->flags & MEDIA_PAD_FL_SOURCE) {
> +		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +		struct csid_device *csid = v4l2_get_subdevdata(sd);
> +		struct device *dev = csid->camss->dev;
> +
> +		if (flags & MEDIA_LNK_FL_ENABLED)
> +			csid->phy.en_vc |= 1 << (local->index - 1);
> +		else
> +			csid->phy.en_vc &= ~(1 << (local->index - 1));

This is just easier to read and reason about with BIT(n)

>   
> -		/* Reset format on source pad to sink pad format */
> -		format.pad = MSM_CSID_PAD_SRC;
> -		format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -		csid_set_format(&csid->subdev, NULL, &format);
> +		csid->phy.need_vc_update = true;
> +
> +		dev_info(dev, "%s: Enabled CSID virtual channels mask 0x%x\n",
> +			 __func__, csid->phy.en_vc);

Should this be an info() or a dbg() ?

---
bod
