Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF79018C911
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 09:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgCTIno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 04:43:44 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33402 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgCTInn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 04:43:43 -0400
Received: by mail-oi1-f193.google.com with SMTP id r7so5736978oij.0;
        Fri, 20 Mar 2020 01:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+P765H39wM9m+abyGE0nl8gMB3A8ga2ms+iMRowiZ8k=;
        b=g1eDUwWUjjsUSnOE6iHtTvigzWwALw8QL7AzobAj+zd8brftEfXA9+yd8KPPlpot+y
         DuXR/wJxU7seIlObmYaLgFoGiQXFuBKjb4ZbSsM5c0o7rrdSEiy+11db/ReiBuL5uqK4
         Jw77etFXuV24IHq+TntYsOUauBJlS28NV4IA4IFzo5QCWJgQX/7pzajqQMs7Pc74yaqr
         Si/yHq8pjhkqw7lTzkQ747f9LPIHLPz51BBKvL4LsvHo3HPK6ew0RLsM6r5jdFnfaPU7
         ifVfAeFHDfamxd0jpB6wHMAT7WcJq1+uzSLu9FGrLi0cNC0qFmfE3MABXRuICZa5opAP
         lY4Q==
X-Gm-Message-State: ANhLgQ3VnoyL2KxtPuuy3a/F0pspUb8rn8UlgtR2Fghvti9tAb/K2RjA
        d1y3wltybqYIUoMoe7V5DXvMp0g1LzRCHv/fU4w=
X-Google-Smtp-Source: ADFU+vv04HuiaDqBvziE4RdKS2mt/DGa83Te8DpzwucVswld+IotS8nnMQ6rX0cqkPagKXH3xdy8kJQWpk2rrOT2mz8=
X-Received: by 2002:aca:5ed4:: with SMTP id s203mr5753865oib.102.1584693820681;
 Fri, 20 Mar 2020 01:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584639664.git.alexander.riesen@cetitec.com> <252bb433f47b0ccb61bb077abdbd892091abc550.1584639664.git.alexander.riesen@cetitec.com>
In-Reply-To: <252bb433f47b0ccb61bb077abdbd892091abc550.1584639664.git.alexander.riesen@cetitec.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Mar 2020 09:43:29 +0100
Message-ID: <CAMuHMdXOAQtuxCAfb=sZKodyJWwSrf-GO-pdV3HYkOytQW4ENg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] media: adv748x: add support for HDMI audio
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

CC linux-clk for the clock provider.

On Thu, Mar 19, 2020 at 6:42 PM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
> This adds an implemention of SoC DAI driver which provides access to the
> I2S port of the device.
>
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>

Thanks for your patch!

One comment below.

> ---
>  drivers/media/i2c/adv748x/Makefile       |   3 +-
>  drivers/media/i2c/adv748x/adv748x-core.c |   9 +-
>  drivers/media/i2c/adv748x/adv748x-dai.c  | 256 +++++++++++++++++++++++
>  drivers/media/i2c/adv748x/adv748x.h      |  16 +-
>  4 files changed, 281 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/i2c/adv748x/adv748x-dai.c
>
> diff --git a/drivers/media/i2c/adv748x/Makefile b/drivers/media/i2c/adv748x/Makefile
> index 93844f14cb10..6e7a302ef199 100644
> --- a/drivers/media/i2c/adv748x/Makefile
> +++ b/drivers/media/i2c/adv748x/Makefile
> @@ -3,6 +3,7 @@ adv748x-objs    := \
>                 adv748x-afe.o \
>                 adv748x-core.o \
>                 adv748x-csi2.o \
> -               adv748x-hdmi.o
> +               adv748x-hdmi.o \
> +               adv748x-dai.o
>
>  obj-$(CONFIG_VIDEO_ADV748X)    += adv748x.o
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 36164a254d7b..2c0bd58038e6 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -765,8 +765,14 @@ static int adv748x_probe(struct i2c_client *client)
>                 goto err_cleanup_txa;
>         }
>
> +       ret = adv748x_dai_init(&state->dai);
> +       if (ret) {
> +               adv_err(state, "Failed to probe DAI\n");
> +               goto err_cleanup_txb;
> +       }
>         return 0;
> -
> +err_cleanup_txb:
> +       adv748x_csi2_cleanup(&state->txb);
>  err_cleanup_txa:
>         adv748x_csi2_cleanup(&state->txa);
>  err_cleanup_afe:
> @@ -787,6 +793,7 @@ static int adv748x_remove(struct i2c_client *client)
>  {
>         struct adv748x_state *state = i2c_get_clientdata(client);
>
> +       adv748x_dai_cleanup(&state->dai);
>         adv748x_afe_cleanup(&state->afe);
>         adv748x_hdmi_cleanup(&state->hdmi);
>
> diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
> new file mode 100644
> index 000000000000..4775a0c7ed7f
> --- /dev/null
> +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Analog Devices ADV748X HDMI receiver with AFE
> + * The implementation of DAI.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <sound/pcm_params.h>
> +
> +#include "adv748x.h"
> +
> +#define state_of(soc_dai) \
> +       adv748x_dai_to_state(container_of((soc_dai)->driver, \
> +                                         struct adv748x_dai, \
> +                                         drv))
> +
> +static const char ADV748X_DAI_NAME[] = "adv748x-i2s";
> +
> +static int set_audio_pads_state(struct adv748x_state *state, int on)
> +{
> +       return io_update(state, ADV748X_IO_PAD_CONTROLS,
> +                        ADV748X_IO_PAD_CONTROLS_TRI_AUD |
> +                        ADV748X_IO_PAD_CONTROLS_PDN_AUD,
> +                        on ? 0 : 0xff);
> +}
> +
> +static int set_dpll_mclk_fs(struct adv748x_state *state, int fs)
> +{
> +       return dpll_update(state, ADV748X_DPLL_MCLK_FS,
> +                          ADV748X_DPLL_MCLK_FS_N_MASK, (fs / 128) - 1);
> +}
> +
> +static int set_i2s_format(struct adv748x_state *state, uint outmode,
> +                         uint bitwidth)
> +{
> +       return hdmi_update(state, ADV748X_HDMI_I2S,
> +                          ADV748X_HDMI_I2SBITWIDTH_MASK |
> +                          ADV748X_HDMI_I2SOUTMODE_MASK,
> +                          (outmode << ADV748X_HDMI_I2SOUTMODE_SHIFT) |
> +                          bitwidth);
> +}
> +
> +static int set_i2s_tdm_mode(struct adv748x_state *state, int is_tdm)
> +{
> +       int ret;
> +
> +       ret = hdmi_update(state, ADV748X_HDMI_AUDIO_MUTE_SPEED,
> +                         ADV748X_MAN_AUDIO_DL_BYPASS |
> +                         ADV748X_AUDIO_DELAY_LINE_BYPASS,
> +                         is_tdm ? 0xff : 0);
> +       if (ret < 0)
> +               return ret;
> +       ret = hdmi_update(state, ADV748X_HDMI_REG_6D,
> +                         ADV748X_I2S_TDM_MODE_ENABLE,
> +                         is_tdm ? 0xff : 0);
> +       return ret;
> +}
> +
> +static int set_audio_mute(struct adv748x_state *state, int enable)
> +{
> +       return hdmi_update(state, ADV748X_HDMI_MUTE_CTRL,
> +                          ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO,
> +                          enable ? 0xff : 0);
> +}
> +
> +static int adv748x_dai_set_sysclk(struct snd_soc_dai *dai,
> +                                 int clk_id, unsigned int freq, int dir)
> +{
> +       struct adv748x_state *state = state_of(dai);
> +
> +       /* currently supporting only one fixed rate clock */
> +       if (clk_id != 0 || freq != clk_get_rate(state->dai.mclk)) {
> +               dev_err(dai->dev, "invalid clock (%d) or frequency (%u, dir %d)\n",
> +                       clk_id, freq, dir);
> +               return -EINVAL;
> +       }
> +       state->dai.freq = freq;
> +       return 0;
> +}
> +
> +static int adv748x_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +       struct adv748x_state *state = state_of(dai);
> +       int ret = 0;
> +
> +       if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBM_CFM) {
> +               dev_err(dai->dev, "only I2S master clock mode supported\n");
> +               ret = -EINVAL;
> +               goto done;
> +       }
> +       switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +       case SND_SOC_DAI_FORMAT_I2S:
> +               state->dai.tdm = 0;
> +               state->dai.fmt = ADV748X_I2SOUTMODE_I2S;
> +               break;
> +       case SND_SOC_DAI_FORMAT_RIGHT_J:
> +               state->dai.tdm = 1;
> +               state->dai.fmt = ADV748X_I2SOUTMODE_RIGHT_J;
> +               break;
> +       case SND_SOC_DAI_FORMAT_LEFT_J:
> +               state->dai.tdm = 1;
> +               state->dai.fmt = ADV748X_I2SOUTMODE_LEFT_J;
> +               break;
> +       default:
> +               dev_err(dai->dev, "only i2s, left_j and right_j supported\n");
> +               ret = -EINVAL;
> +               goto done;
> +       }
> +       if ((fmt & SND_SOC_DAIFMT_INV_MASK) != SND_SOC_DAIFMT_NB_NF) {
> +               dev_err(dai->dev, "only normal bit clock + frame supported\n");
> +               ret = -EINVAL;
> +       }
> +done:
> +       return ret;
> +}
> +
> +static int adv748x_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
> +{
> +       struct adv748x_state *state = state_of(dai);
> +
> +       if (sub->stream != SNDRV_PCM_STREAM_CAPTURE)
> +               return -EINVAL;
> +       return set_audio_pads_state(state, 1);
> +}
> +
> +static int adv748x_dai_hw_params(struct snd_pcm_substream *sub,
> +                                struct snd_pcm_hw_params *params,
> +                                struct snd_soc_dai *dai)
> +{
> +       int ret;
> +       struct adv748x_state *state = state_of(dai);
> +       uint fs = state->dai.freq / params_rate(params);
> +
> +       dev_dbg(dai->dev, "dai %s substream %s rate=%u (fs=%u), channels=%u sample width=%u(%u)\n",
> +               dai->name, sub->name,
> +               params_rate(params), fs,
> +               params_channels(params),
> +               params_width(params),
> +               params_physical_width(params));
> +       switch (fs) {
> +       case 128:
> +       case 256:
> +       case 384:
> +       case 512:
> +       case 640:
> +       case 768:
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               dev_err(dai->dev, "invalid clock frequency (%u) or rate (%u)\n",
> +                       state->dai.freq, params_rate(params));
> +               goto done;
> +       }
> +       ret = set_dpll_mclk_fs(state, fs);
> +       if (ret)
> +               goto done;
> +       ret = set_i2s_tdm_mode(state, state->dai.tdm);
> +       if (ret)
> +               goto done;
> +       ret = set_i2s_format(state, state->dai.fmt, params_width(params));
> +done:
> +       return ret;
> +}
> +
> +static int adv748x_dai_mute_stream(struct snd_soc_dai *dai, int mute, int dir)
> +{
> +       struct adv748x_state *state = state_of(dai);
> +
> +       return set_audio_mute(state, mute);
> +}
> +
> +static void adv748x_dai_shutdown(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
> +{
> +       struct adv748x_state *state = state_of(dai);
> +
> +       set_audio_pads_state(state, 0);
> +}
> +
> +static const struct snd_soc_dai_ops adv748x_dai_ops = {
> +       .set_sysclk = adv748x_dai_set_sysclk,
> +       .set_fmt = adv748x_dai_set_fmt,
> +       .startup = adv748x_dai_startup,
> +       .hw_params = adv748x_dai_hw_params,
> +       .mute_stream = adv748x_dai_mute_stream,
> +       .shutdown = adv748x_dai_shutdown,
> +};
> +
> +static int adv748x_of_xlate_dai_name(struct snd_soc_component *component,
> +                                     struct of_phandle_args *args,
> +                                     const char **dai_name)
> +{
> +       if (dai_name)
> +               *dai_name = ADV748X_DAI_NAME;
> +       return 0;
> +}
> +
> +static const struct snd_soc_component_driver adv748x_codec = {
> +       .of_xlate_dai_name = adv748x_of_xlate_dai_name,
> +};
> +
> +int adv748x_dai_init(struct adv748x_dai *dai)
> +{
> +       int ret;
> +       struct adv748x_state *state = adv748x_dai_to_state(dai);
> +
> +       dai->mclk = clk_register_fixed_rate(state->dev,
> +                                           "adv748x-hdmi-i2s-mclk",

I assume there can be multiple adv748x instances in the system?
Hence the clock name should be unique for each instance.

> +                                           NULL /* parent_name */,
> +                                           0 /* flags */,
> +                                           12288000 /* rate */);
> +       if (IS_ERR_OR_NULL(dai->mclk)) {
> +               ret = PTR_ERR(dai->mclk);
> +               adv_err(state, "Failed to register MCLK (%d)\n", ret);
> +               goto fail;
> +       }
> +       ret = of_clk_add_provider(state->dev->of_node, of_clk_src_simple_get,
> +                                 dai->mclk);
> +       if (ret < 0) {
> +               adv_err(state, "Failed to add MCLK provider (%d)\n", ret);
> +               goto unreg_mclk;
> +       }
> +       dai->drv.name = ADV748X_DAI_NAME;
> +       dai->drv.ops = &adv748x_dai_ops;
> +       dai->drv.capture = (struct snd_soc_pcm_stream){
> +               .stream_name    = "Capture",
> +               .channels_min   = 8,
> +               .channels_max   = 8,
> +               .rates = SNDRV_PCM_RATE_48000,
> +               .formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE,
> +       };
> +
> +       ret = devm_snd_soc_register_component(state->dev, &adv748x_codec,
> +                                             &dai->drv, 1);
> +       if (ret < 0) {
> +               adv_err(state, "Failed to register the codec (%d)\n", ret);
> +               goto cleanup_mclk;
> +       }
> +       return 0;
> +
> +cleanup_mclk:
> +       of_clk_del_provider(state->dev->of_node);
> +unreg_mclk:
> +       clk_unregister_fixed_rate(dai->mclk);
> +fail:
> +       return ret;
> +}
> +
> +void adv748x_dai_cleanup(struct adv748x_dai *dai)
> +{
> +       struct adv748x_state *state = adv748x_dai_to_state(dai);
> +
> +       of_clk_del_provider(state->dev->of_node);
> +       clk_unregister_fixed_rate(dai->mclk);
> +}
> +
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index 7bc1bb0b3756..af70632926b5 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -19,6 +19,7 @@
>   */
>
>  #include <linux/i2c.h>
> +#include <sound/soc.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>
> @@ -63,7 +64,8 @@ enum adv748x_ports {
>         ADV748X_PORT_TTL = 9,
>         ADV748X_PORT_TXA = 10,
>         ADV748X_PORT_TXB = 11,
> -       ADV748X_PORT_MAX = 12,
> +       ADV748X_PORT_I2S = 12,
> +       ADV748X_PORT_MAX = 13,
>  };
>
>  enum adv748x_csi2_pads {
> @@ -166,6 +168,12 @@ struct adv748x_afe {
>         container_of(ctrl->handler, struct adv748x_afe, ctrl_hdl)
>  #define adv748x_sd_to_afe(sd) container_of(sd, struct adv748x_afe, sd)
>
> +struct adv748x_dai {
> +       struct snd_soc_dai_driver drv;
> +       struct clk *mclk;
> +       unsigned int freq, fmt, tdm;
> +};
> +
>  /**
>   * struct adv748x_state - State of ADV748X
>   * @dev:               (OF) device
> @@ -182,6 +190,7 @@ struct adv748x_afe {
>   * @afe:               state of AFE receiver context
>   * @txa:               state of TXA transmitter context
>   * @txb:               state of TXB transmitter context
> + * @mclk:              MCLK clock of the I2S port
>   */
>  struct adv748x_state {
>         struct device *dev;
> @@ -197,10 +206,12 @@ struct adv748x_state {
>         struct adv748x_afe afe;
>         struct adv748x_csi2 txa;
>         struct adv748x_csi2 txb;
> +       struct adv748x_dai dai;
>  };
>
>  #define adv748x_hdmi_to_state(h) container_of(h, struct adv748x_state, hdmi)
>  #define adv748x_afe_to_state(a) container_of(a, struct adv748x_state, afe)
> +#define adv748x_dai_to_state(p) container_of(p, struct adv748x_state, dai)
>
>  #define adv_err(a, fmt, arg...)        dev_err(a->dev, fmt, ##arg)
>  #define adv_info(a, fmt, arg...) dev_info(a->dev, fmt, ##arg)
> @@ -485,4 +496,7 @@ int adv748x_csi2_set_pixelrate(struct v4l2_subdev *sd, s64 rate);
>  int adv748x_hdmi_init(struct adv748x_hdmi *hdmi);
>  void adv748x_hdmi_cleanup(struct adv748x_hdmi *hdmi);
>
> +int adv748x_dai_init(struct adv748x_dai *);
> +void adv748x_dai_cleanup(struct adv748x_dai *);
> +
>  #endif /* _ADV748X_H_ */
> --
> 2.25.1.25.g9ecbe7eb18

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
