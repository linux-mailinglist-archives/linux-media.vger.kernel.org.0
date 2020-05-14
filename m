Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9FA1D3FCF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 23:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgENVPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 17:15:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:45518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgENVPX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 17:15:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF0042065C;
        Thu, 14 May 2020 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589490921;
        bh=cIrW1apDcIn0hmKtW8dVFxzMGNgBn0WktMObcrcu3r4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GnmIdRH581xRpG67PyphnzYWof0VwVUhH01lvW0Q4G9t0LSksP0RtymU/DYqP+1sf
         2krmAkr7V/lpS28CJkHXPUDPz8VJFQnOomwe/QA1017s/K8UTUnJPpIKECYeF1CABH
         8baH61lOZKnNL2ctcmOpXv5aDkZ0gfFHPFXeUqdk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200511195534.1207927-3-lkundrak@v3.sk>
References: <20200511195534.1207927-1-lkundrak@v3.sk> <20200511195534.1207927-3-lkundrak@v3.sk>
Subject: Re: [PATCH 2/2] clk: mmp2: Add audio clock controller driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 14 May 2020 14:15:20 -0700
Message-ID: <158949092023.215346.2636797537388292572@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Lubomir Rintel (2020-05-11 12:55:34)
> diff --git a/drivers/clk/mmp/clk-audio.c b/drivers/clk/mmp/clk-audio.c
> new file mode 100644
> index 000000000000..ee89b97dc09a
> --- /dev/null
> +++ b/drivers/clk/mmp/clk-audio.c
> @@ -0,0 +1,563 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * MMP Audio Clock Controller driver
> + *
> + * Copyright (C) 2020 Lubomir Rintel <lkundrak@v3.sk>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>

Preferably this isn't a clk consumer and a clk provider. If a clk is
needed to read/write registers then look at using pm_clk code to make
this driver runtime PM aware and turn on clks when necessary.

> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <dt-bindings/clock/marvell,mmp2-audio.h>
> +
> +enum {
> +       SSPA_AUD_CTRL           =3D 0x04,
> +       SSPA_AUD_PLL_CTRL0      =3D 0x08,
> +       SSPA_AUD_PLL_CTRL1      =3D 0x0c,
> +};

Just make defines instead of enum please.

> +
> +/* SSPA Audio Control Register */
> +#define SSPA_AUD_CTRL_SYSCLK_SHIFT             0
> +#define SSPA_AUD_CTRL_SSPA0_MUX_SHIFT          7
> +#define SSPA_AUD_CTRL_SSPA0_SHIFT              8
> +#define SSPA_AUD_CTRL_SSPA1_SHIFT              16
> +#define SSPA_AUD_CTRL_SSPA1_MUX_SHIFT          23
> +#define SSPA_AUD_CTRL_DIV_MASK                 0x7e
> +
> +/* SSPA Audio PLL Control 0 Register */
> +#define SSPA_AUD_PLL_CTRL0_DIV_OCLK_MODULO_MASK (0x7 << 28)
> +#define SSPA_AUD_PLL_CTRL0_DIV_OCLK_MODULO(x)  ((x) << 28)
> +#define SSPA_AUD_PLL_CTRL0_FRACT_MASK          (0xfffff << 8)
> +#define SSPA_AUD_PLL_CTRL0_FRACT(x)            ((x) << 8)
> +#define SSPA_AUD_PLL_CTRL0_ENA_DITHER          (1 << 7)
> +#define SSPA_AUD_PLL_CTRL0_ICP_2UA             (0 << 5)
> +#define SSPA_AUD_PLL_CTRL0_ICP_5UA             (1 << 5)
> +#define SSPA_AUD_PLL_CTRL0_ICP_7UA             (2 << 5)
> +#define SSPA_AUD_PLL_CTRL0_ICP_10UA            (3 << 5)
> +#define SSPA_AUD_PLL_CTRL0_DIV_FBCCLK_MASK     (0x3 << 3)
> +#define SSPA_AUD_PLL_CTRL0_DIV_FBCCLK(x)       ((x) << 3)
> +#define SSPA_AUD_PLL_CTRL0_DIV_MCLK_MASK       (0x1 << 2)
> +#define SSPA_AUD_PLL_CTRL0_DIV_MCLK(x)         ((x) << 2)
> +#define SSPA_AUD_PLL_CTRL0_PD_OVPROT_DIS       (1 << 1)
> +#define SSPA_AUD_PLL_CTRL0_PU                  (1 << 0)
> +
> +/* SSPA Audio PLL Control 1 Register */
> +#define SSPA_AUD_PLL_CTRL1_SEL_FAST_CLK                (1 << 24)
> +#define SSPA_AUD_PLL_CTRL1_CLK_SEL_MASK                (1 << 11)
> +#define SSPA_AUD_PLL_CTRL1_CLK_SEL_AUDIO_PLL   (1 << 11)
> +#define SSPA_AUD_PLL_CTRL1_CLK_SEL_VCXO                (0 << 11)
> +#define SSPA_AUD_PLL_CTRL1_DIV_OCLK_PATTERN_MASK (0x7ff << 0)
> +#define SSPA_AUD_PLL_CTRL1_DIV_OCLK_PATTERN(x) ((x) << 0)
> +
> +struct mmp_audio_mux {
> +       struct clk_hw hw;
> +       struct mmp2_audio_clk *priv;
> +       u8 shift;
> +       u8 flags;
> +       int index;

unsigned int index?

> +};
> +
> +#define to_mmp_audio_mux(_hw) container_of(_hw, struct mmp_audio_mux, hw)
> +
> +struct mmp_audio_div {
> +       struct clk_hw hw;
> +       struct mmp2_audio_clk *priv;
> +       u8 shift;
> +       int value;

unsigned int value?

> +};
> +
> +#define to_mmp_audio_div(_hw) container_of(_hw, struct mmp_audio_div, hw)
> +
> +struct mmp_audio_pll {
> +       struct clk_hw hw;
> +       struct mmp2_audio_clk *priv;
> +       u32 ctrl0;
> +       u32 ctrl1;
> +};
> +
> +#define to_mmp_audio_pll(_hw) container_of(_hw, struct mmp_audio_pll, hw)
> +
> +struct mmp2_audio_clk {
> +       void __iomem *mmio_base;
> +
> +       struct clk *audio_clk;
> +       struct clk *vctcxo_clk;
> +       struct clk *i2s0_clk;
> +       struct clk *i2s1_clk;
> +
> +       struct mmp_audio_pll audio_pll;
> +       struct mmp_audio_mux sspa_mux;
> +       struct mmp_audio_mux sspa1_mux;
> +       struct mmp_audio_div sysclk;
> +       struct mmp_audio_div sspa0;
> +       struct mmp_audio_div sspa1;
> +
> +       struct clk *clk_table[3];
> +       struct clk_onecell_data clk_data;
> +
> +       spinlock_t lock;
> +};
> +
> +static struct {

Can this be const?

> +       unsigned long parent_rate;
> +       unsigned long freq_vco;
> +       unsigned char mclk;
> +       unsigned char fbcclk;
> +       unsigned short fract;
> +} predivs[] =3D {
> +       { 26000000, 135475200, 0, 0, 0x8a18 },
> +       { 26000000, 147456000, 0, 1, 0x0da1 },
> +       { 38400000, 135475200, 1, 2, 0x8208 },
> +       { 38400000, 147456000, 1, 3, 0xaaaa },
> +};
> +
> +static struct {

Can this be const?

> +       unsigned char divisor;
> +       unsigned char modulo;
> +       unsigned char pattern;
> +} postdivs[] =3D {
> +       {   1,  3,  0, },
> +       {   2,  5,  0, },
> +       {   4,  0,  0, },
> +       {   6,  1,  1, },
> +       {   8,  1,  0, },
> +       {   9,  1,  2, },
> +       {  12,  2,  1, },
> +       {  16,  2,  0, },
> +       {  18,  2,  2, },
> +       {  24,  4,  1, },
> +       {  36,  4,  2, },
> +       {  48,  6,  1, },
> +       {  72,  6,  2, },
> +};
> +
> +static unsigned long mmp_audio_pll_recalc_rate(struct clk_hw *hw,
> +                                              unsigned long parent_rate)
> +{
> +       struct mmp_audio_pll *pll =3D to_mmp_audio_pll(hw);
> +       unsigned int prediv;
> +       unsigned int postdiv;
> +
> +       for (prediv =3D 0; prediv < ARRAY_SIZE(predivs); prediv++) {
> +               if (predivs[prediv].parent_rate !=3D parent_rate)
> +                       continue;
> +               for (postdiv =3D 0; postdiv < ARRAY_SIZE(postdivs); postd=
iv++) {
> +                       unsigned long freq;
> +                       u32 val;
> +
> +                       val =3D SSPA_AUD_PLL_CTRL0_ENA_DITHER;
> +                       val |=3D SSPA_AUD_PLL_CTRL0_PU;
> +                       val |=3D SSPA_AUD_PLL_CTRL0_DIV_OCLK_MODULO(postd=
ivs[postdiv].modulo);
> +                       val |=3D SSPA_AUD_PLL_CTRL0_FRACT(predivs[prediv]=
.fract);
> +                       val |=3D SSPA_AUD_PLL_CTRL0_DIV_FBCCLK(predivs[pr=
ediv].fbcclk);
> +                       val |=3D SSPA_AUD_PLL_CTRL0_DIV_MCLK(predivs[pred=
iv].mclk);
> +                       if (val !=3D pll->ctrl0)
> +                               continue;
> +
> +                       val =3D SSPA_AUD_PLL_CTRL1_CLK_SEL_AUDIO_PLL;
> +                       val |=3D SSPA_AUD_PLL_CTRL1_DIV_OCLK_PATTERN(post=
divs[postdiv].pattern);
> +                       if (val !=3D pll->ctrl1)
> +                               continue;
> +
> +                       freq =3D predivs[prediv].freq_vco;
> +                       freq /=3D postdivs[postdiv].divisor;
> +                       return freq;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static long mmp_audio_pll_round_rate(struct clk_hw *hw, unsigned long ra=
te,
> +                                    unsigned long *parent_rate)
> +{
> +       unsigned int prediv;
> +       unsigned int postdiv;
> +       long rounded =3D 0;
> +
> +       for (prediv =3D 0; prediv < ARRAY_SIZE(predivs); prediv++) {
> +               if (predivs[prediv].parent_rate !=3D *parent_rate)
> +                       continue;
> +               for (postdiv =3D 0; postdiv < ARRAY_SIZE(postdivs); postd=
iv++) {
> +                       long freq =3D predivs[prediv].freq_vco;
> +
> +                       freq /=3D postdivs[postdiv].divisor;
> +                       if (freq =3D=3D rate)
> +                               return rate;
> +                       if (freq < rate)
> +                               continue;
> +                       if (rounded && freq > rounded)
> +                               continue;
> +                       rounded =3D freq;
> +               }
> +       }
> +
> +       return rounded;
> +}
> +
> +static void mmp_audio_pll_write_rate(struct mmp_audio_pll *pll)
> +{
> +       struct mmp2_audio_clk *priv =3D pll->priv;
> +
> +       __raw_writel(pll->ctrl0, priv->mmio_base + SSPA_AUD_PLL_CTRL0);
> +       __raw_writel(pll->ctrl1, priv->mmio_base + SSPA_AUD_PLL_CTRL1);
> +}
> +
> +static int mmp_audio_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                 unsigned long parent_rate)
> +{
> +       struct mmp_audio_pll *pll =3D to_mmp_audio_pll(hw);
> +       struct mmp2_audio_clk *priv =3D pll->priv;
> +       unsigned int prediv;
> +       unsigned int postdiv;
> +
> +       for (prediv =3D 0; prediv < ARRAY_SIZE(predivs); prediv++) {
> +               if (predivs[prediv].parent_rate !=3D parent_rate)
> +                       continue;
> +
> +               for (postdiv =3D 0; postdiv < ARRAY_SIZE(postdivs); postd=
iv++) {
> +                       if (rate * postdivs[postdiv].divisor !=3D predivs=
[prediv].freq_vco)
> +                               continue;
> +
> +                       pll->ctrl0 =3D SSPA_AUD_PLL_CTRL0_ENA_DITHER;
> +                       pll->ctrl0 |=3D SSPA_AUD_PLL_CTRL0_PU;
> +                       pll->ctrl0 |=3D SSPA_AUD_PLL_CTRL0_DIV_OCLK_MODUL=
O(postdivs[postdiv].modulo);
> +                       pll->ctrl0 |=3D SSPA_AUD_PLL_CTRL0_FRACT(predivs[=
prediv].fract);
> +                       pll->ctrl0 |=3D SSPA_AUD_PLL_CTRL0_DIV_FBCCLK(pre=
divs[prediv].fbcclk);
> +                       pll->ctrl0 |=3D SSPA_AUD_PLL_CTRL0_DIV_MCLK(predi=
vs[prediv].mclk);
> +
> +                       pll->ctrl1 =3D SSPA_AUD_PLL_CTRL1_CLK_SEL_AUDIO_P=
LL;
> +                       pll->ctrl1 |=3D SSPA_AUD_PLL_CTRL1_DIV_OCLK_PATTE=
RN(postdivs[postdiv].pattern);
> +
> +                       if (__clk_is_enabled(priv->audio_clk))
> +                               mmp_audio_pll_write_rate(pll);
> +
> +                       return 0;
> +               }
> +       }
> +
> +       return -ERANGE;
> +}
> +
> +static int mmp_audio_pll_enable(struct clk_hw *hw)
> +{
> +       struct mmp_audio_pll *pll =3D to_mmp_audio_pll(hw);
> +       struct mmp2_audio_clk *priv =3D pll->priv;
> +
> +       clk_prepare_enable(priv->audio_clk);
> +       mmp_audio_pll_write_rate(pll);
> +       return 0;
> +}
> +
> +static void mmp_audio_pll_disable(struct clk_hw *hw)
> +{
> +       struct mmp_audio_pll *pll =3D to_mmp_audio_pll(hw);
> +       struct mmp2_audio_clk *priv =3D pll->priv;
> +
> +       clk_disable_unprepare(priv->audio_clk);
> +}
> +
> +const struct clk_ops mmp_audio_pll_ops =3D {
> +       .enable =3D mmp_audio_pll_enable,
> +       .disable =3D mmp_audio_pll_disable,
> +       .recalc_rate =3D mmp_audio_pll_recalc_rate,
> +       .round_rate =3D mmp_audio_pll_round_rate,
> +       .set_rate =3D mmp_audio_pll_set_rate,
> +};
> +
> +static u8 mmp_audio_mux_get_parent(struct clk_hw *hw)
> +{
> +       struct mmp_audio_mux *mux =3D to_mmp_audio_mux(hw);
> +       struct mmp2_audio_clk *priv =3D mux->priv;
> +       u32 val;
> +
> +       if (__clk_is_enabled(priv->audio_clk)) {
> +               val =3D __raw_readl(priv->mmio_base + SSPA_AUD_CTRL);
> +               val >>=3D mux->shift;
> +               val &=3D 1;
> +       } else {
> +               val =3D 0;
> +       }
> +       mux->index =3D val;
> +
> +       return mux->index;
> +}
> +
> +static void mmp_audio_mux_write_parent(struct mmp_audio_mux *mux)
> +{
> +       struct mmp2_audio_clk *priv =3D mux->priv;
> +       unsigned long flags =3D 0;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +       reg =3D __raw_readl(priv->mmio_base + SSPA_AUD_CTRL);
> +       reg &=3D ~(1 << mux->shift);
> +       reg |=3D mux->index << mux->shift;
> +       __raw_writel(reg, priv->mmio_base + SSPA_AUD_CTRL);
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +}
> +
> +static int mmp_audio_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct mmp_audio_mux *mux =3D to_mmp_audio_mux(hw);
> +       struct mmp2_audio_clk *priv =3D mux->priv;
> +
> +       mux->index =3D index;
> +       if (__clk_is_enabled(priv->audio_clk))
> +               mmp_audio_mux_write_parent(mux);
> +
> +       return 0;
> +}
> +
> +static int mmp_audio_mux_determine_rate(struct clk_hw *hw,
> +                                       struct clk_rate_request *req)
> +{
> +       return clk_mux_determine_rate_flags(hw, req, 0);
> +}
> +
> +static int mmp_audio_mux_enable(struct clk_hw *hw)
> +{
> +       struct mmp_audio_mux *mux =3D to_mmp_audio_mux(hw);
> +       struct mmp2_audio_clk *priv =3D mux->priv;
> +
> +       clk_prepare_enable(priv->audio_clk);
> +       mmp_audio_mux_write_parent(mux);
> +       return 0;
> +}
> +
> +static void mmp_audio_mux_disable(struct clk_hw *hw)
> +{
> +       struct mmp_audio_mux *mux =3D to_mmp_audio_mux(hw);
> +       struct mmp2_audio_clk *priv =3D mux->priv;
> +
> +       clk_disable_unprepare(priv->audio_clk);
> +}
> +
> +const struct clk_ops mmp_audio_mux_ops =3D {

static?

> +       .enable =3D mmp_audio_mux_enable,
> +       .disable =3D mmp_audio_mux_disable,
> +
> +       .get_parent =3D mmp_audio_mux_get_parent,
> +       .set_parent =3D mmp_audio_mux_set_parent,
> +       .determine_rate =3D mmp_audio_mux_determine_rate,
> +};
> +
[...]
> +
> +static void mmp_audio_div_write_rate(struct mmp_audio_div *div, int enab=
le)
> +{
> +       struct mmp2_audio_clk *priv =3D div->priv;
> +       u32 val;
> +
> +       clk_prepare_enable(priv->audio_clk);
> +       val =3D __raw_readl(priv->mmio_base + SSPA_AUD_CTRL);

Please don't use __raw IO accessors as they don't do proper endian
swaps and are thus not portable. Use the relaxed accessors if you're
trying to avoid the barrier semantics, but most likely that is overkill
too and can just be readl()/writel().

> +       val &=3D ~(SSPA_AUD_CTRL_DIV_MASK << div->shift);
> +       val |=3D (u32)div->value << (div->shift + 1);

Why cast to u32? Should it be a u32 already?

> +       val |=3D enable << div->shift;
> +       __raw_writel(val, priv->mmio_base + SSPA_AUD_CTRL);
> +       clk_disable_unprepare(priv->audio_clk);
> +}
> +
> +static int mmp_audio_div_enable(struct clk_hw *hw)
> +{
> +       struct mmp_audio_div *div =3D to_mmp_audio_div(hw);
> +       struct mmp2_audio_clk *priv =3D div->priv;
> +
> +       clk_prepare_enable(priv->audio_clk);

What is this clk being enabled and prepared for? Is it needed to access
registers inside the device?

> +       mmp_audio_div_write_rate(div, 1);
> +       return 0;
> +}
> +
> +static void mmp_audio_div_disable(struct clk_hw *hw)
> +{
> +       struct mmp_audio_div *div =3D to_mmp_audio_div(hw);
> +       struct mmp2_audio_clk *priv =3D div->priv;
> +       unsigned long flags =3D 0;

Please drop assignment to 0.

> +       u32 val;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +       val =3D __raw_readl(priv->mmio_base + SSPA_AUD_CTRL);
> +       val &=3D ~(1 << div->shift);
> +       __raw_writel(val, priv->mmio_base + SSPA_AUD_CTRL);
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +       clk_disable_unprepare(priv->audio_clk);
> +}
> +
> +static int mmp_audio_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long parent_rate)
> +{
> +       struct mmp_audio_div *div =3D to_mmp_audio_div(hw);
> +       struct mmp2_audio_clk *priv =3D div->priv;
> +       int value;
> +
> +       if (rate =3D=3D 0) {
> +               value =3D 0;
> +       } else {
> +               value =3D divider_get_val(rate, parent_rate, NULL, 6,
> +                                       CLK_DIVIDER_ONE_BASED |
> +                                       CLK_DIVIDER_ROUND_CLOSEST |
> +                                       CLK_DIVIDER_ALLOW_ZERO);
> +               if (value < 0)
> +                       return value;
> +       }
> +
> +       div->value =3D value;
> +       if (__clk_is_enabled(priv->audio_clk))
> +               mmp_audio_div_write_rate(div, 0);
> +
> +       return 0;
> +}
> +
> +const struct clk_ops mmp_audio_div_ops =3D {

static?

> +       .enable =3D mmp_audio_div_enable,
> +       .disable =3D mmp_audio_div_disable,
> +
> +       .recalc_rate =3D mmp_audio_div_recalc_rate,
> +       .round_rate =3D mmp_audio_div_round_rate,
> +       .set_rate =3D mmp_audio_div_set_rate,
> +};
> +
> +static int mmp2_audio_clk_probe(struct platform_device *pdev)
> +{
> +       const struct clk_hw *sspa_mux_parents[2];
> +       const struct clk_hw *sspa1_mux_parents[2];
> +       struct mmp2_audio_clk *priv;
> +       int ret;
> +
> +       priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->lock);
> +
> +       priv->mmio_base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->mmio_base))
> +               return PTR_ERR(priv->mmio_base);
> +
> +       priv->audio_clk =3D devm_clk_get(&pdev->dev, "audio");
> +       if (IS_ERR(priv->audio_clk))
> +               return PTR_ERR(priv->audio_clk);
> +
> +       priv->i2s0_clk =3D devm_clk_get(&pdev->dev, "i2s0");
> +       if (IS_ERR(priv->i2s0_clk))
> +               return PTR_ERR(priv->i2s0_clk);
> +
> +       priv->i2s1_clk =3D devm_clk_get(&pdev->dev, "i2s1");
> +       if (IS_ERR(priv->i2s1_clk))
> +               return PTR_ERR(priv->i2s1_clk);
> +
> +       priv->vctcxo_clk =3D devm_clk_get(&pdev->dev, "vctcxo");
> +       if (IS_ERR(priv->vctcxo_clk))
> +               return PTR_ERR(priv->vctcxo_clk);
> +
> +       priv->audio_pll.hw.init =3D
> +               CLK_HW_INIT_HW("audio_pll", __clk_get_hw(priv->vctcxo_clk=
),

Usage of __clk_get_hw() is probably wrong here. Are these clks provided
outside this node in DT? Please specify them as .fw_name parents so clk
core can match up clks to their parents at runtime.

> +                              &mmp_audio_pll_ops, CLK_SET_RATE_PARENT);
> +       priv->audio_pll.priv =3D priv;
> +       ret =3D devm_clk_hw_register(&pdev->dev, &priv->audio_pll.hw);
> +       if (ret)
> +               return ret;
> +
> +       sspa_mux_parents[0] =3D &priv->audio_pll.hw;
> +       sspa_mux_parents[1] =3D __clk_get_hw(priv->i2s0_clk);
> +       priv->sspa_mux.hw.init =3D
> +               CLK_HW_INIT_PARENTS_HW("sspa_mux", sspa_mux_parents,
> +                                      &mmp_audio_mux_ops, CLK_SET_RATE_P=
ARENT);
> +       priv->sspa_mux.priv =3D priv;
> +       priv->sspa_mux.shift =3D SSPA_AUD_CTRL_SSPA0_MUX_SHIFT;
> +       ret =3D devm_clk_hw_register(&pdev->dev, &priv->sspa_mux.hw);
> +       if (ret)
> +               return ret;
> +
> +       priv->sysclk.hw.init =3D
> +               CLK_HW_INIT_HW("sysclk", &priv->sspa_mux.hw,
> +                              &mmp_audio_div_ops, CLK_SET_RATE_PARENT);
> +       priv->sysclk.priv =3D priv;
> +       priv->sysclk.shift =3D SSPA_AUD_CTRL_SYSCLK_SHIFT;
> +       ret =3D devm_clk_hw_register(&pdev->dev, &priv->sysclk.hw);
> +       if (ret)
> +               return ret;
> +
> +       priv->sspa0.hw.init =3D
> +               CLK_HW_INIT_HW("sspa0", &priv->sspa_mux.hw,
> +                              &mmp_audio_div_ops, 0);
> +       priv->sspa0.priv =3D priv;
> +       priv->sspa0.shift =3D SSPA_AUD_CTRL_SSPA0_SHIFT;
> +       ret =3D devm_clk_hw_register(&pdev->dev, &priv->sspa0.hw);
> +       if (ret)
> +               return ret;
> +
> +       sspa1_mux_parents[0] =3D &priv->audio_pll.hw;
> +       sspa1_mux_parents[1] =3D __clk_get_hw(priv->i2s1_clk);
> +       priv->sspa1_mux.hw.init =3D
> +               CLK_HW_INIT_PARENTS_HW("sspa1_mux", sspa1_mux_parents,
> +                                      &mmp_audio_mux_ops, CLK_SET_RATE_P=
ARENT);
> +       priv->sspa1_mux.priv =3D priv;
> +       priv->sspa1_mux.shift =3D SSPA_AUD_CTRL_SSPA1_MUX_SHIFT;
> +       ret =3D devm_clk_hw_register(&pdev->dev, &priv->sspa1_mux.hw);
> +       if (ret)
> +               return ret;
> +
> +       priv->sspa1.hw.init =3D
> +               CLK_HW_INIT_HW("sspa1", &priv->sspa1_mux.hw,
> +                              &mmp_audio_div_ops, 0);
> +       priv->sspa1.priv =3D priv;
> +       priv->sspa1.shift =3D SSPA_AUD_CTRL_SSPA1_SHIFT;
> +       ret =3D devm_clk_hw_register(&pdev->dev, &priv->sspa1.hw);
> +       if (ret)
> +               return ret;
> +
> +       priv->clk_table[MMP2_CLK_AUDIO_SYSCLK] =3D priv->sysclk.hw.clk;
> +       priv->clk_table[MMP2_CLK_AUDIO_SSPA0] =3D priv->sspa0.hw.clk;
> +       priv->clk_table[MMP2_CLK_AUDIO_SSPA1] =3D priv->sspa1.hw.clk;
> +       priv->clk_data.clks =3D priv->clk_table;
> +       priv->clk_data.clk_num =3D ARRAY_SIZE(priv->clk_table);
> +
> +       return of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_=
get,

Please add a clk_hw provider and not a clk provider. We're trying to
remove that API.

> +                                  &priv->clk_data);
> +}
> +
> +static const struct of_device_id mmp2_audio_clk_of_match[] =3D {
> +       { .compatible =3D "marvell,mmp2-audio-clock" },
> +       {},

Nitpick: Drop comma so nothing can come after this.

> +};
> +
> +MODULE_DEVICE_TABLE(of, mmp2_audio_clk_of_match);
> +
> +static struct platform_driver mmp2_audio_clk_driver =3D {
> +       .driver =3D {
> +               .name =3D "mmp2-audio-clock",
> +               .of_match_table =3D of_match_ptr(mmp2_audio_clk_of_match),
> +       },
> +       .probe =3D mmp2_audio_clk_probe,
> +};
> +

Nitpick: Drop newline here so it sits next to the driver.

> +module_platform_driver(mmp2_audio_clk_driver);
> +
> +MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
> +MODULE_DESCRIPTION("Clock driver for MMP2 Audio subsystem");
> +MODULE_LICENSE("GPL");
