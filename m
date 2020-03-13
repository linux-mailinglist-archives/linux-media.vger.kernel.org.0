Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0568118424B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 09:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMIQU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 04:16:20 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:60833 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726371AbgCMIQU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 04:16:20 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CfUKj1GG5hVf8CfUNjO8bW; Fri, 13 Mar 2020 09:16:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584087377; bh=nP79N0yOwSx8yKGwqAW504OdT/Y72TUWVCiVmG3B1A4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QWyeXvAy9Guf59EIPaFULSKa6qK31U3k2LLk7Jock2ge5n5DcKjiyCTebt+wY8iz1
         BOCkCRQPC1aitJ0UL/eF6RWWKCG2725+S9vqRv31s2TGXnBC8Tqq5HgU1U7Der+LeX
         qd3qz19cif3ZAIg7IbVli7020SRQxbBZoLqOp9yFEIdbZfQNYsZt1Ngt6SvzkfScTn
         IzamoCLGQMk8EPt6pkUrU9BGRhGd0v+Xml4j0pe/lO+1EdC/+jzu8oyeanidqaG56R
         vDWS8xf6qIHxSPjn2qRqa47Qer494bH6E4VBXxOj3QrJuRIzEbPyIkew5hsWK1mgoz
         bDw/pKJVyAwpQ==
Subject: Re: [PATCH 2/8] media: adv748x: add audio mute control and output
 selection ioctls
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141521.GC3606@pflmari>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ff34078d-895d-08c8-c64f-768e75388038@xs4all.nl>
Date:   Fri, 13 Mar 2020 09:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200113141521.GC3606@pflmari>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKfeYNFFGRobPFSOTEI7B9w8TK8aojO5c062aoWeZ3/mtuWJfxdHCSCOUpa16sOCyNspr5wgKwX5TT40iEWHjUh+S5npKQCL8BLzkTwNpIyskWxt7HgN
 hxFnIp1iMExxpo95KQnf1bWvjbsLiCVONyJ3XK+4j3GlqPn4IujImFC+Wb7FqDBzFtAy+9CdSbjMDN4kLWphnYL9QwjzLEw+RNXZLWCGPF4nUag6TV1jDsJN
 TkakaYHL6wsXTi95DfE1puENWphP4SR12XK7wM9OOfjJ+i6WiQ4LDrckS1zzpY+yTLWXYx1OQne/p/q+CG8d6LH+fgWhQKFTIvMJ0lCH6rlSmNHTwS4kSmms
 HNUoDJSF46NxoHf6ZMsthh5eXpPJYVexb/SgxgYEM0pPvBVFR+KcdCiKwimsvozXxFmEwFErjro38ULkqxAWgA6OA+WBv+ZIf5dbSNRMSK+2Y0Vf2kHRPdiO
 UN4MqYGa2MX1p6TQqCatFZl5XLmGq6CrHQZhhfK0rBQdPg4yupf7Od+AsD6wATpQhXAxqm7RLDTiV90pK9dravuzk55J85hIrbyfeXN7ueSLS7l62HRgtxzB
 620=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

I apologize for the (very) slow reply, but better late than never.

On 1/13/20 3:15 PM, Alex Riesen wrote:
> This change implements audio-related V4L2 ioctls for the HDMI subdevice.

This is really where things go wrong. These V4L2 audio ioctls are meant for
old PCI TV tuner devices where the audio was implemented as audio jack outputs
that are typically looped back to audio inputs on a (PCI) soundcard. And when
these ioctls were designed ALSA didn't even exist.

None of that applies here.

Generally an hdmi driver will configure the i2s audio automatically, which is
typically connected to the SoC and controlled by the ALSA driver of the SoC,
but there may well be missing features (audio never got a lot of attention in
hdmi receivers). So what I would like to know is: what features are missing?

Anything missing can likely be resolved by adding HDMI audio specific V4L2 controls,
which would be the right approach for this.

So I would expect to see a proposal for V4L2_CID_DV_RX_AUDIO_ controls to be
added here:

https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/ext-ctrls-dv.html

Regards,

	Hans

> 
> The master audio clock is configured for 256fs, as supported by the only
> device available at the moment. For the same reason, the TDM slot is
> formatted using left justification of its bits.
> 
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-core.c |   6 +
>  drivers/media/i2c/adv748x/adv748x-hdmi.c | 182 +++++++++++++++++++++++
>  drivers/media/i2c/adv748x/adv748x.h      |  42 ++++++
>  3 files changed, 230 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index bc49aa93793c..b6067ffb1e0d 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -150,6 +150,12 @@ static int adv748x_write_check(struct adv748x_state *state, u8 page, u8 reg,
>  	return *error;
>  }
>  
> +int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg, u8 mask,
> +			u8 value)
> +{
> +	return regmap_update_bits(state->regmap[page], reg, mask, value);
> +}
> +
>  /* adv748x_write_block(): Write raw data with a maximum of I2C_SMBUS_BLOCK_MAX
>   * size to one or more registers.
>   *
> diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
> index c557f8fdf11a..9bc9237c9116 100644
> --- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
> +++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   */
>  
> +#include <linux/version.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> @@ -603,11 +604,186 @@ static const struct v4l2_subdev_pad_ops adv748x_pad_ops_hdmi = {
>  	.enum_dv_timings = adv748x_hdmi_enum_dv_timings,
>  };
>  
> +static int adv748x_hdmi_audio_mute(struct adv748x_hdmi *hdmi, int enable)
> +{
> +	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
> +
> +	return hdmi_update(state, ADV748X_HDMI_MUTE_CTRL,
> +			   ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO,
> +			   enable ? 0xff : 0);
> +}
> +
> +
> +#define HDMI_AOUT_NONE 0
> +#define HDMI_AOUT_I2S 1
> +#define HDMI_AOUT_I2S_TDM 2
> +
> +static int adv748x_hdmi_enumaudout(struct adv748x_hdmi *hdmi,
> +				   struct v4l2_audioout *a)
> +{
> +	switch (a->index) {
> +	case HDMI_AOUT_NONE:
> +		strlcpy(a->name, "None", sizeof(a->name));
> +		break;
> +	case HDMI_AOUT_I2S:
> +		strlcpy(a->name, "I2S/stereo", sizeof(a->name));
> +		break;
> +	case HDMI_AOUT_I2S_TDM:
> +		strlcpy(a->name, "I2S-TDM/multichannel", sizeof(a->name));
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int adv748x_hdmi_g_audout(struct adv748x_hdmi *hdmi,
> +				 struct v4l2_audioout *a)
> +{
> +	a->index = hdmi->audio_out;
> +	return adv748x_hdmi_enumaudout(hdmi, a);
> +}
> +
> +static int set_audio_pads_state(struct adv748x_state *state, int on)
> +{
> +	return io_update(state, ADV748X_IO_PAD_CONTROLS,
> +			 ADV748X_IO_PAD_CONTROLS_TRI_AUD |
> +			 ADV748X_IO_PAD_CONTROLS_PDN_AUD,
> +			 on ? 0 : 0xff);
> +}
> +
> +static int set_dpll_mclk_fs(struct adv748x_state *state, int fs)
> +{
> +	if (fs % 128 || fs > 768)
> +		return -EINVAL;
> +	return dpll_update(state, ADV748X_DPLL_MCLK_FS,
> +			   ADV748X_DPLL_MCLK_FS_N_MASK, (fs / 128) - 1);
> +}
> +
> +static int set_i2s_format(struct adv748x_state *state, uint outmode,
> +			  uint bitwidth)
> +{
> +	return hdmi_update(state, ADV748X_HDMI_I2S,
> +			   ADV748X_HDMI_I2SBITWIDTH_MASK |
> +			   ADV748X_HDMI_I2SOUTMODE_MASK,
> +			   (outmode << ADV748X_HDMI_I2SOUTMODE_SHIFT) |
> +			   bitwidth);
> +}
> +
> +static int set_i2s_tdm_mode(struct adv748x_state *state, int is_tdm)
> +{
> +	int ret;
> +
> +	ret = hdmi_update(state, ADV748X_HDMI_AUDIO_MUTE_SPEED,
> +			  ADV748X_MAN_AUDIO_DL_BYPASS |
> +			  ADV748X_AUDIO_DELAY_LINE_BYPASS,
> +			  is_tdm ? 0xff : 0);
> +	if (ret < 0)
> +		goto fail;
> +	ret = hdmi_update(state, ADV748X_HDMI_REG_6D,
> +			  ADV748X_I2S_TDM_MODE_ENABLE,
> +			  is_tdm ? 0xff : 0);
> +	if (ret < 0)
> +		goto fail;
> +	ret = set_i2s_format(state, ADV748X_I2SOUTMODE_LEFT_J, 24);
> +fail:
> +	return ret;
> +}
> +
> +static int set_audio_out(struct adv748x_state *state, int aout)
> +{
> +	int ret;
> +
> +	switch (aout) {
> +	case HDMI_AOUT_NONE:
> +		ret = set_audio_pads_state(state, 0);
> +		break;
> +	case HDMI_AOUT_I2S:
> +		ret = set_dpll_mclk_fs(state, 256);
> +		if (ret < 0)
> +			goto fail;
> +		ret = set_i2s_tdm_mode(state, 1);
> +		if (ret < 0)
> +			goto fail;
> +		ret = set_audio_pads_state(state, 1);
> +		if (ret < 0)
> +			goto fail;
> +		break;
> +	case HDMI_AOUT_I2S_TDM:
> +		ret = set_dpll_mclk_fs(state, 256);
> +		if (ret < 0)
> +			goto fail;
> +		ret = set_i2s_tdm_mode(state, 1);
> +		if (ret < 0)
> +			goto fail;
> +		ret = set_audio_pads_state(state, 1);
> +		if (ret < 0)
> +			goto fail;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto fail;
> +	}
> +	return 0;
> +fail:
> +	return ret;
> +}
> +
> +static int adv748x_hdmi_s_audout(struct adv748x_hdmi *hdmi,
> +				 const struct v4l2_audioout *a)
> +{
> +	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
> +	int ret = set_audio_out(state, a->index);
> +
> +	if (ret == 0)
> +		hdmi->audio_out = a->index;
> +	return ret;
> +}
> +
> +static long adv748x_hdmi_querycap(struct adv748x_hdmi *hdmi,
> +				  struct v4l2_capability *cap)
> +{
> +	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
> +
> +	cap->version = LINUX_VERSION_CODE;
> +	strlcpy(cap->driver, state->dev->driver->name, sizeof(cap->driver));
> +	strlcpy(cap->card, "hdmi", sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "i2c:%d-%04x",
> +		 i2c_adapter_id(state->client->adapter),
> +		 state->client->addr);
> +	cap->device_caps = V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
> +	cap->capabilities = V4L2_CAP_DEVICE_CAPS;
> +	return 0;
> +}
> +
> +static long adv748x_hdmi_ioctl(struct v4l2_subdev *sd,
> +			       unsigned int cmd, void *arg)
> +{
> +	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
> +
> +	switch (cmd) {
> +	case VIDIOC_ENUMAUDOUT:
> +		return adv748x_hdmi_enumaudout(hdmi, arg);
> +	case VIDIOC_S_AUDOUT:
> +		return adv748x_hdmi_s_audout(hdmi, arg);
> +	case VIDIOC_G_AUDOUT:
> +		return adv748x_hdmi_g_audout(hdmi, arg);
> +	case VIDIOC_QUERYCAP:
> +		return adv748x_hdmi_querycap(hdmi, arg);
> +	}
> +	return -ENOTTY;
> +}
> +
> +static const struct v4l2_subdev_core_ops adv748x_core_ops_hdmi = {
> +	.ioctl = adv748x_hdmi_ioctl,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * v4l2_subdev_ops
>   */
>  
>  static const struct v4l2_subdev_ops adv748x_ops_hdmi = {
> +	.core = &adv748x_core_ops_hdmi,
>  	.video = &adv748x_video_ops_hdmi,
>  	.pad = &adv748x_pad_ops_hdmi,
>  };
> @@ -633,6 +809,8 @@ static int adv748x_hdmi_s_ctrl(struct v4l2_ctrl *ctrl)
>  	int ret;
>  	u8 pattern;
>  
> +	if (ctrl->id == V4L2_CID_AUDIO_MUTE)
> +		return adv748x_hdmi_audio_mute(hdmi, ctrl->val);
>  	/* Enable video adjustment first */
>  	ret = cp_clrset(state, ADV748X_CP_VID_ADJ,
>  			ADV748X_CP_VID_ADJ_ENABLE,
> @@ -697,6 +875,8 @@ static int adv748x_hdmi_init_controls(struct adv748x_hdmi *hdmi)
>  	v4l2_ctrl_new_std(&hdmi->ctrl_hdl, &adv748x_hdmi_ctrl_ops,
>  			  V4L2_CID_HUE, ADV748X_CP_HUE_MIN,
>  			  ADV748X_CP_HUE_MAX, 1, ADV748X_CP_HUE_DEF);
> +	v4l2_ctrl_new_std(&hdmi->ctrl_hdl, &adv748x_hdmi_ctrl_ops,
> +			  V4L2_CID_AUDIO_MUTE, 0, 1, 1, 1);
>  
>  	/*
>  	 * Todo: V4L2_CID_DV_RX_POWER_PRESENT should also be supported when
> @@ -755,6 +935,8 @@ int adv748x_hdmi_init(struct adv748x_hdmi *hdmi)
>  
>  void adv748x_hdmi_cleanup(struct adv748x_hdmi *hdmi)
>  {
> +	adv748x_hdmi_audio_mute(hdmi, 1);
> +	set_audio_out(adv748x_hdmi_to_state(hdmi), HDMI_AOUT_NONE);
>  	v4l2_device_unregister_subdev(&hdmi->sd);
>  	media_entity_cleanup(&hdmi->sd.entity);
>  	v4l2_ctrl_handler_free(&hdmi->ctrl_hdl);
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index db6346a06351..fdda6982e437 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -128,6 +128,7 @@ struct adv748x_hdmi {
>  		u32 present;
>  		unsigned int blocks;
>  	} edid;
> +	int audio_out;
>  };
>  
>  #define adv748x_ctrl_to_hdmi(ctrl) \
> @@ -224,6 +225,11 @@ struct adv748x_state {
>  
>  #define ADV748X_IO_VID_STD		0x05
>  
> +#define ADV748X_IO_PAD_CONTROLS		0x0e
> +#define ADV748X_IO_PAD_CONTROLS_TRI_AUD	BIT(5)
> +#define ADV748X_IO_PAD_CONTROLS_PDN_AUD	BIT(1)
> +#define ADV748X_IO_PAD_CONTROLS1	0x1d
> +
>  #define ADV748X_IO_10			0x10	/* io_reg_10 */
>  #define ADV748X_IO_10_CSI4_EN		BIT(7)
>  #define ADV748X_IO_10_CSI1_EN		BIT(6)
> @@ -246,7 +252,21 @@ struct adv748x_state {
>  #define ADV748X_IO_REG_FF		0xff
>  #define ADV748X_IO_REG_FF_MAIN_RESET	0xff
>  
> +/* DPLL Map */
> +#define ADV748X_DPLL_MCLK_FS		0xb5
> +#define ADV748X_DPLL_MCLK_FS_N_MASK	GENMASK(2, 0)
> +
>  /* HDMI RX Map */
> +#define ADV748X_HDMI_I2S		0x03	/* I2S mode and width */
> +#define ADV748X_HDMI_I2SBITWIDTH_MASK	GENMASK(4, 0)
> +#define ADV748X_HDMI_I2SOUTMODE_SHIFT	5
> +#define ADV748X_HDMI_I2SOUTMODE_MASK	\
> +	GENMASK(6, ADV748X_HDMI_I2SOUTMODE_SHIFT)
> +#define ADV748X_I2SOUTMODE_I2S 0
> +#define ADV748X_I2SOUTMODE_RIGHT_J 1
> +#define ADV748X_I2SOUTMODE_LEFT_J 2
> +#define ADV748X_I2SOUTMODE_SPDIF 3
> +
>  #define ADV748X_HDMI_LW1		0x07	/* line width_1 */
>  #define ADV748X_HDMI_LW1_VERT_FILTER	BIT(7)
>  #define ADV748X_HDMI_LW1_DE_REGEN	BIT(5)
> @@ -258,6 +278,16 @@ struct adv748x_state {
>  #define ADV748X_HDMI_F1H1		0x0b	/* field1 height_1 */
>  #define ADV748X_HDMI_F1H1_INTERLACED	BIT(5)
>  
> +#define ADV748X_HDMI_MUTE_CTRL		0x1a
> +#define ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO BIT(4)
> +#define ADV748X_HDMI_MUTE_CTRL_WAIT_UNMUTE_MASK	GENMASK(3, 1)
> +#define ADV748X_HDMI_MUTE_CTRL_NOT_AUTO_UNMUTE	BIT(0)
> +
> +#define ADV748X_HDMI_AUDIO_MUTE_SPEED	0x0f
> +#define ADV748X_HDMI_AUDIO_MUTE_SPEED_MASK	GENMASK(4, 0)
> +#define ADV748X_MAN_AUDIO_DL_BYPASS BIT(7)
> +#define ADV748X_AUDIO_DELAY_LINE_BYPASS BIT(6)
> +
>  #define ADV748X_HDMI_HFRONT_PORCH	0x20	/* hsync_front_porch_1 */
>  #define ADV748X_HDMI_HFRONT_PORCH_MASK	0x1fff
>  
> @@ -279,6 +309,9 @@ struct adv748x_state {
>  #define ADV748X_HDMI_TMDS_1		0x51	/* hdmi_reg_51 */
>  #define ADV748X_HDMI_TMDS_2		0x52	/* hdmi_reg_52 */
>  
> +#define ADV748X_HDMI_REG_6D		0x6d	/* hdmi_reg_6d */
> +#define ADV748X_I2S_TDM_MODE_ENABLE BIT(7)
> +
>  /* HDMI RX Repeater Map */
>  #define ADV748X_REPEATER_EDID_SZ	0x70	/* primary_edid_size */
>  #define ADV748X_REPEATER_EDID_SZ_SHIFT	4
> @@ -393,14 +426,23 @@ int adv748x_write(struct adv748x_state *state, u8 page, u8 reg, u8 value);
>  int adv748x_write_block(struct adv748x_state *state, int client_page,
>  			unsigned int init_reg, const void *val,
>  			size_t val_len);
> +int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg,
> +			u8 mask, u8 value);
>  
>  #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
>  #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
>  #define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~m) | v)
> +#define io_update(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
>  
>  #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
>  #define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, r+1)) & m)
>  #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
> +#define hdmi_update(s, r, m, v) \
> +	adv748x_update_bits(s, ADV748X_PAGE_HDMI, r, m, v)
> +
> +#define dpll_read(s, r) adv748x_read(s, ADV748X_PAGE_DPLL, r)
> +#define dpll_update(s, r, m, v) \
> +	adv748x_update_bits(s, ADV748X_PAGE_DPLL, r, m, v)
>  
>  #define repeater_read(s, r) adv748x_read(s, ADV748X_PAGE_REPEATER, r)
>  #define repeater_write(s, r, v) adv748x_write(s, ADV748X_PAGE_REPEATER, r, v)
> 

