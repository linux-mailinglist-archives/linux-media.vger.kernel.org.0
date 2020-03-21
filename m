Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B2A18DD0F
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2020 02:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgCUBJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 21:09:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgCUBJd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 21:09:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 120862072C;
        Sat, 21 Mar 2020 01:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584752972;
        bh=1TMSACbNS6snXsOh2chfn6p2kjbS1jSTgaqql6DheHw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=yeIm/T7/7y1KH1Gbu+UR/1UIDDnUApqSCB7y14Yi+8X2cQl3dY9W9sm2U07WBj0uS
         YZhyyKsgTUn+hlTiw1pI5dvaYofvwEaMovHPdIpHnq6KqA+eB9sN61MicN5adBFcez
         YR7zPDRPAXKXRrhzra4E66H0cDSb5fXLTf7R80S4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <82828e89ccf4173de4e5e52dcecacc4d5168315c.1584720678.git.alexander.riesen@cetitec.com>
References: <cover.1584720678.git.alexander.riesen@cetitec.com> <82828e89ccf4173de4e5e52dcecacc4d5168315c.1584720678.git.alexander.riesen@cetitec.com>
Subject: Re: [PATCH v3 05/11] media: adv748x: add support for HDMI audio
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Date:   Fri, 20 Mar 2020 18:09:31 -0700
Message-ID: <158475297119.125146.8177273856843293558@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Alex Riesen (2020-03-20 09:12:00)
> diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/=
adv748x/adv748x-dai.c
> new file mode 100644
> index 000000000000..6fce7d000423
> --- /dev/null
> +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Analog Devices ADV748X HDMI receiver with AFE
> + * The implementation of DAI.
> + */
> +
> +#include "adv748x.h"
> +
> +#include <linux/clk.h>

Is this include used? Please try to make a clk provider or a clk
consumer and not both unless necessary.

> +#include <linux/clk-provider.h>
> +#include <sound/pcm_params.h>
> +
> +#define state_of(soc_dai) \
> +       adv748x_dai_to_state(container_of((soc_dai)->driver, \
> +                                         struct adv748x_dai, \
> +                                         drv))
> +
> +static const char ADV748X_DAI_NAME[] =3D "adv748x-i2s";
> +
[...]
> +       .set_sysclk =3D adv748x_dai_set_sysclk,
> +       .set_fmt =3D adv748x_dai_set_fmt,
> +       .startup =3D adv748x_dai_startup,
> +       .hw_params =3D adv748x_dai_hw_params,
> +       .mute_stream =3D adv748x_dai_mute_stream,
> +       .shutdown =3D adv748x_dai_shutdown,
> +};
> +
> +static int adv748x_of_xlate_dai_name(struct snd_soc_component *component,
> +                                     struct of_phandle_args *args,
> +                                     const char **dai_name)
> +{
> +       if (dai_name)
> +               *dai_name =3D ADV748X_DAI_NAME;
> +       return 0;
> +}
> +
> +static const struct snd_soc_component_driver adv748x_codec =3D {
> +       .of_xlate_dai_name =3D adv748x_of_xlate_dai_name,
> +};
> +
> +int adv748x_dai_init(struct adv748x_dai *dai)
> +{
> +       int ret;
> +       struct adv748x_state *state =3D adv748x_dai_to_state(dai);
> +
> +       dai->mclk_name =3D kasprintf(GFP_KERNEL, "%s.%s-i2s-mclk",
> +                                  state->dev->driver->name,
> +                                  dev_name(state->dev));
> +       if (!dai->mclk_name) {
> +               ret =3D -ENOMEM;
> +               adv_err(state, "No memory for MCLK\n");
> +               goto fail;
> +       }
> +       dai->mclk =3D clk_register_fixed_rate(state->dev,

Please register with clk_hw_register_fixed_rate() instead.

> +                                           dai->mclk_name,
> +                                           NULL /* parent_name */,
> +                                           0 /* flags */,
> +                                           12288000 /* rate */);

Not sure these comments are useful.

> +       if (IS_ERR_OR_NULL(dai->mclk)) {
> +               ret =3D PTR_ERR(dai->mclk);
> +               adv_err(state, "Failed to register MCLK (%d)\n", ret);
> +               goto fail;
> +       }
> +       ret =3D of_clk_add_provider(state->dev->of_node, of_clk_src_simpl=
e_get,
> +                                 dai->mclk);
> +       if (ret < 0) {
> +               adv_err(state, "Failed to add MCLK provider (%d)\n", ret);
> +               goto unreg_mclk;
> +       }
> +       dai->drv.name =3D ADV748X_DAI_NAME;
> +       dai->drv.ops =3D &adv748x_dai_ops;
> +       dai->drv.capture =3D (struct snd_soc_pcm_stream){

Can this be const?

> +               .stream_name    =3D "Capture",
> +               .channels_min   =3D 8,
> +               .channels_max   =3D 8,
> +               .rates =3D SNDRV_PCM_RATE_48000,
> +               .formats =3D SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U=
24_LE,
> +       };
> +
> +       ret =3D devm_snd_soc_register_component(state->dev, &adv748x_code=
c,
> +                                             &dai->drv, 1);
> +       if (ret < 0) {
> +               adv_err(state, "Failed to register the codec (%d)\n", ret=
);
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
> +       struct adv748x_state *state =3D adv748x_dai_to_state(dai);
> +
> +       of_clk_del_provider(state->dev->of_node);
> +       clk_unregister_fixed_rate(dai->mclk);
> +       kfree(dai->mclk_name);
> +}
> +

Please drop extra newline at end of file.
