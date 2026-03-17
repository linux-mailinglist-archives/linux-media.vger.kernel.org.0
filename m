Return-Path: <linux-media+bounces-56070-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDHnFaBTuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56070-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:14:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD94B2AAA0F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59C1C30B5AF1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12A13CC9EC;
	Tue, 17 Mar 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6mEsLvw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D43CA4BE;
	Tue, 17 Mar 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752830; cv=none; b=o4570k+lKENJzwnKXqkQPCg/jthtebsDwwq4IVP7DwzA0j4sSe+pD6G+e7HaCXhd+v1uAieBXxw3OYvgfZGFQ39KDQhQNZ/RQAV10U1SxkqDb0UmjzNAX5KwxsqAl+dgphwia2/dPQM5denhpOgtWXKk2Fwf6tsAxiMB6WPnYJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752830; c=relaxed/simple;
	bh=KmcgSTxz7w7mmjFxqazZSCEK651A9zD2vDZo98XmCSo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rNLF+ord+rKNJO60Am0YYmoKUw1fKKBVVFMMo1Gb8jXuP3yChatKVCkLboFuygM0B2otNDP6LkRATjHDWbteljfw1MwvQIay3aYs0PGvXqOi1C4V2vS5xyLOpFQF6RPatkSLsy1grNfbpEKlEkTRZQTJUXvWeeDV/IfG4HaY6yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6mEsLvw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAB8C2BCB1;
	Tue, 17 Mar 2026 13:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773752830;
	bh=KmcgSTxz7w7mmjFxqazZSCEK651A9zD2vDZo98XmCSo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Y6mEsLvw0HjgINO+BkpG8IHIrxqi7esuBBNnqDVhNdRJL+vpVecX7VEo5+af491hJ
	 xJI/IaoSxYBl8TgiDdF3Mbuxl7S7fdulja7JxcXkuLOysBDMvpfAmYDBqPnD7qHJxH
	 ccaV+znkTGbUkulDS4GmKQwFuMBY2baiMoTFqvYX30jjitALutRxNN09zacHFHk2Rp
	 fCr/etuWMukfaM0QGDwJZeSRMGwclzD3r6voLpQrZkHRcIdGu6JPjUI71VXL4XlzcS
	 Pdrm6vGXBjdnQjIBDAH/UoYiE0Fz72apkCKCWZF7frVfdENmv5RjEuYMbs0mJ9c0K3
	 q32XZe3mCBicw==
Message-ID: <31e56301-2764-4d3b-bc21-555227248e5f@kernel.org>
Date: Tue, 17 Mar 2026 14:07:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Mikko Perttunen
 <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260303084239.15007-1-clamor95@gmail.com>
 <20260303084239.15007-6-clamor95@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260303084239.15007-6-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56070-lists,linux-media=lfdr.de,cisco];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,bootlin.com:email,provider.np:url]
X-Rspamd-Queue-Id: BD94B2AAA0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Svyatoslav, Mikko, Thierry,

On 03/03/2026 09:42, Svyatoslav Ryhel wrote:
> Convert existing MIPI code to use operation function pointers, a necessary
> step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> that is SoC-independent remains in mipi.c, while all SoC-specific code is
> moved to tegra114-mipi.c (The naming matches the first SoC generation with
> a dedicated calibration block). Shared structures and function calls are
> placed into tegra-mipi-cal.h.
> 
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Mikko Perttunen <mperttunen@nvidia.com>

I would like to merge this series, but in the v5 series there was a discussion about
this host1x split:

https://lore.kernel.org/linux-media/CAPVz0n0fkMYV-O4xWTBELd6HtKR83wrs+DS1wTVDOXdWuAK2OA@mail.gmail.com/

Mikko Acked this patch, but Thierry objected. However, I saw no further updates on
this, and I do agree with Svyatoslav that this patch makes sense.

If there are no objections, then I plan to merge series this on Monday for v7.1.

Regards,

	Hans

> ---
>  drivers/gpu/drm/tegra/dsi.c             |   1 +
>  drivers/gpu/host1x/Makefile             |   1 +
>  drivers/gpu/host1x/mipi.c               | 592 +++++-------------------
>  drivers/gpu/host1x/tegra114-mipi.c      | 483 +++++++++++++++++++
>  drivers/staging/media/tegra-video/csi.c |   1 +
>  include/linux/host1x.h                  |  10 -
>  include/linux/tegra-mipi-cal.h          |  57 +++
>  7 files changed, 666 insertions(+), 479 deletions(-)
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h
> 
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 2c5aefe9621a..7f25c50621c9 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -14,6 +14,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> +#include <linux/tegra-mipi-cal.h>
>  
>  #include <video/mipi_display.h>
>  
> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> index ee5286ffe08d..fead483af0b4 100644
> --- a/drivers/gpu/host1x/Makefile
> +++ b/drivers/gpu/host1x/Makefile
> @@ -9,6 +9,7 @@ host1x-y = \
>  	job.o \
>  	debug.o \
>  	mipi.o \
> +	tegra114-mipi.o \
>  	fence.o \
>  	hw/host1x01.o \
>  	hw/host1x02.o \
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index fea9f491df66..01513b775d89 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -1,215 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2013 NVIDIA Corporation
> - *
> - * Permission to use, copy, modify, distribute, and sell this software and its
> - * documentation for any purpose is hereby granted without fee, provided that
> - * the above copyright notice appear in all copies and that both that copyright
> - * notice and this permission notice appear in supporting documentation, and
> - * that the name of the copyright holders not be used in advertising or
> - * publicity pertaining to distribution of the software without specific,
> - * written prior permission.  The copyright holders make no representations
> - * about the suitability of this software for any purpose.  It is provided "as
> - * is" without express or implied warranty.
> - *
> - * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> - * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> - * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> - * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> - * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> - * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> - * OF THIS SOFTWARE.
> + * Copyright (C) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
>   */
>  
>  #include <linux/clk.h>
> -#include <linux/host1x.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/tegra-mipi-cal.h>
>  
> -#include "dev.h"
> -
> -#define MIPI_CAL_CTRL			0x00
> -#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
> -#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
> -#define MIPI_CAL_CTRL_CLKEN_OVR		(1 << 4)
> -#define MIPI_CAL_CTRL_START		(1 << 0)
> -
> -#define MIPI_CAL_AUTOCAL_CTRL		0x01
> -
> -#define MIPI_CAL_STATUS			0x02
> -#define MIPI_CAL_STATUS_DONE		(1 << 16)
> -#define MIPI_CAL_STATUS_ACTIVE		(1 <<  0)
> -
> -#define MIPI_CAL_CONFIG_CSIA		0x05
> -#define MIPI_CAL_CONFIG_CSIB		0x06
> -#define MIPI_CAL_CONFIG_CSIC		0x07
> -#define MIPI_CAL_CONFIG_CSID		0x08
> -#define MIPI_CAL_CONFIG_CSIE		0x09
> -#define MIPI_CAL_CONFIG_CSIF		0x0a
> -#define MIPI_CAL_CONFIG_DSIA		0x0e
> -#define MIPI_CAL_CONFIG_DSIB		0x0f
> -#define MIPI_CAL_CONFIG_DSIC		0x10
> -#define MIPI_CAL_CONFIG_DSID		0x11
> -
> -#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
> -#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
> -#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> -#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
> -#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> -#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
> -#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> -
> -/* for data and clock lanes */
> -#define MIPI_CAL_CONFIG_SELECT		(1 << 21)
> -
> -/* for data lanes */
> -#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
> -#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
> -#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
> -
> -/* for clock lanes */
> -#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
> -#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG0		0x16
> -#define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
> -#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG1		0x17
> -#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
> -#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG2		0x18
> -#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
> -#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
> -#define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
> -
> -struct tegra_mipi_pad {
> -	unsigned long data;
> -	unsigned long clk;
> -};
> -
> -struct tegra_mipi_soc {
> -	bool has_clk_lane;
> -	const struct tegra_mipi_pad *pads;
> -	unsigned int num_pads;
> -
> -	bool clock_enable_override;
> -	bool needs_vclamp_ref;
> -
> -	/* bias pad configuration settings */
> -	u8 pad_drive_down_ref;
> -	u8 pad_drive_up_ref;
> +/* only need to support one provider */
> +static struct {
> +	struct device_node *np;
> +	const struct tegra_mipi_ops *ops;
> +} provider;
>  
> -	u8 pad_vclamp_level;
> -	u8 pad_vauxp_level;
> -
> -	/* calibration settings for data lanes */
> -	u8 hspdos;
> -	u8 hspuos;
> -	u8 termos;
> -
> -	/* calibration settings for clock lanes */
> -	u8 hsclkpdos;
> -	u8 hsclkpuos;
> -};
> -
> -struct tegra_mipi {
> -	const struct tegra_mipi_soc *soc;
> -	struct device *dev;
> -	void __iomem *regs;
> -	struct mutex lock;
> -	struct clk *clk;
> -
> -	unsigned long usage_count;
> -};
> -
> -struct tegra_mipi_device {
> -	struct platform_device *pdev;
> -	struct tegra_mipi *mipi;
> -	struct device *device;
> -	unsigned long pads;
> -};
> -
> -static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> -				   unsigned long offset)
> +/**
> + * tegra_mipi_enable - Enable the Tegra MIPI calibration device.
> + * @device: Handle to the Tegra MIPI calibration device.
> + *
> + * This calls the enable sequence for the Tegra MIPI calibration device.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int tegra_mipi_enable(struct tegra_mipi_device *device)
>  {
> -	return readl(mipi->regs + (offset << 2));
> -}
> +	if (device->ops->enable)
> +		return device->ops->enable(device);
>  
> -static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
> -				     unsigned long offset)
> -{
> -	writel(value, mipi->regs + (offset << 2));
> +	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_enable);
>  
> -static int tegra_mipi_power_up(struct tegra_mipi *mipi)
> +/**
> + * tegra_mipi_disable - Disable the Tegra MIPI calibration device.
> + * @device: Handle to the Tegra MIPI calibration device.
> + *
> + * This calls the disable sequence for the Tegra MIPI calibration device.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int tegra_mipi_disable(struct tegra_mipi_device *device)
>  {
> -	u32 value;
> -	int err;
> -
> -	err = clk_enable(mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> -	value &= ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> -
> -	if (mipi->soc->needs_vclamp_ref)
> -		value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> -
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> -
> -	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	clk_disable(mipi->clk);
> +	if (device->ops->disable)
> +		return device->ops->disable(device);
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_disable);
>  
> -static int tegra_mipi_power_down(struct tegra_mipi *mipi)
> +/**
> + * tegra_mipi_start_calibration - Start the Tegra MIPI calibration sequence.
> + * @device: Handle to the Tegra MIPI calibration device.
> + *
> + * This initiates the calibration of CSI/DSI interfaces via the Tegra MIPI
> + * calibration device.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>  {
> -	u32 value;
> -	int err;
> -
> -	err = clk_enable(mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	/*
> -	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
> -	 * supplies the DSI pads. This must be kept enabled until none of the
> -	 * DSI lanes are used anymore.
> -	 */
> -	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value |= MIPI_CAL_BIAS_PAD_PDVREG;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	/*
> -	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
> -	 * control a regulator that supplies current to the pre-driver logic.
> -	 * Powering down this regulator causes DSI to fail, so it must remain
> -	 * powered on until none of the DSI lanes are used anymore.
> -	 */
> -	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> +	if (device->ops->start_calibration)
> +		return device->ops->start_calibration(device);
>  
> -	if (mipi->soc->needs_vclamp_ref)
> -		value &= ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_mipi_start_calibration);
>  
> -	value |= MIPI_CAL_BIAS_PAD_PDVCLAMP;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +/**
> + * tegra_mipi_finish_calibration - Finish the Tegra MIPI calibration sequence.
> + * @device: Handle to the Tegra MIPI calibration device.
> + *
> + * This completes the calibration of CSI/DSI interfaces via the Tegra MIPI
> + * calibration device.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> +{
> +	if (device->ops->finish_calibration)
> +		return device->ops->finish_calibration(device);
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_finish_calibration);
>  
> +/**
> + * tegra_mipi_request - Request a Tegra MIPI calibration device.
> + * @device: Handle of the device requesting the MIPI calibration function.
> + * @np: Device node pointer of the device requesting the MIPI calibration
> + *	function.
> + *
> + * This function requests a reference to a Tegra MIPI calibration device.
> + *
> + * Returns a pointer to the Tegra MIPI calibration device on success,
> + * or an ERR_PTR-encoded error code on failure.
> + */
>  struct tegra_mipi_device *tegra_mipi_request(struct device *device,
>  					     struct device_node *np)
>  {
> -	struct tegra_mipi_device *dev;
> +	struct tegra_mipi_device *mipidev;
>  	struct of_phandle_args args;
>  	int err;
>  
> @@ -219,321 +114,80 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
>  	if (err < 0)
>  		return ERR_PTR(err);
>  
> -	dev = kzalloc_obj(*dev);
> -	if (!dev) {
> +	if (provider.np != args.np)
> +		return ERR_PTR(-ENODEV);
> +
> +	mipidev = kzalloc_obj(*mipidev);
> +	if (!mipidev) {
>  		err = -ENOMEM;
>  		goto out;
>  	}
>  
> -	dev->pdev = of_find_device_by_node(args.np);
> -	if (!dev->pdev) {
> +	mipidev->pdev = of_find_device_by_node(args.np);
> +	if (!mipidev->pdev) {
>  		err = -ENODEV;
>  		goto free;
>  	}
>  
> -	dev->mipi = platform_get_drvdata(dev->pdev);
> -	if (!dev->mipi) {
> -		err = -EPROBE_DEFER;
> -		goto put;
> -	}
> -
>  	of_node_put(args.np);
>  
> -	dev->pads = args.args[0];
> -	dev->device = device;
> +	mipidev->ops = provider.ops;
> +	mipidev->pads = args.args[0];
>  
> -	return dev;
> +	return mipidev;
>  
> -put:
> -	platform_device_put(dev->pdev);
>  free:
> -	kfree(dev);
> +	kfree(mipidev);
>  out:
>  	of_node_put(args.np);
>  	return ERR_PTR(err);
>  }
>  EXPORT_SYMBOL(tegra_mipi_request);
>  
> -void tegra_mipi_free(struct tegra_mipi_device *device)
> +/**
> + * tegra_mipi_free - Free a Tegra MIPI calibration device.
> + * @mipidev: Handle to the Tegra MIPI calibration device.
> + *
> + * This function releases a reference to a Tegra MIPI calibration device
> + * previously requested by tegra_mipi_request().
> + */
> +void tegra_mipi_free(struct tegra_mipi_device *mipidev)
>  {
> -	platform_device_put(device->pdev);
> -	kfree(device);
> +	platform_device_put(mipidev->pdev);
> +	kfree(mipidev);
>  }
>  EXPORT_SYMBOL(tegra_mipi_free);
>  
> -int tegra_mipi_enable(struct tegra_mipi_device *dev)
> +static void tegra_mipi_remove_provider(void *data)
>  {
> -	int err = 0;
> -
> -	mutex_lock(&dev->mipi->lock);
> -
> -	if (dev->mipi->usage_count++ == 0)
> -		err = tegra_mipi_power_up(dev->mipi);
> -
> -	mutex_unlock(&dev->mipi->lock);
> -
> -	return err;
> -
> -}
> -EXPORT_SYMBOL(tegra_mipi_enable);
> -
> -int tegra_mipi_disable(struct tegra_mipi_device *dev)
> -{
> -	int err = 0;
> -
> -	mutex_lock(&dev->mipi->lock);
> -
> -	if (--dev->mipi->usage_count == 0)
> -		err = tegra_mipi_power_down(dev->mipi);
> -
> -	mutex_unlock(&dev->mipi->lock);
> -
> -	return err;
> -
> -}
> -EXPORT_SYMBOL(tegra_mipi_disable);
> -
> -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> -{
> -	struct tegra_mipi *mipi = device->mipi;
> -	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
> -	u32 value;
> -	int err;
> -
> -	err = readl_relaxed_poll_timeout(status_reg, value,
> -					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
> -					 (value & MIPI_CAL_STATUS_DONE), 50,
> -					 250000);
> -	mutex_unlock(&device->mipi->lock);
> -	clk_disable(device->mipi->clk);
> -
> -	return err;
> +	provider.np = NULL;
> +	provider.ops = NULL;
>  }
> -EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> -
> -int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
> -{
> -	const struct tegra_mipi_soc *soc = device->mipi->soc;
> -	unsigned int i;
> -	u32 value;
> -	int err;
> -
> -	err = clk_enable(device->mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	mutex_lock(&device->mipi->lock);
> -
> -	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> -		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
> -
> -	value = tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value &= ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
> -	value &= ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
> -	value |= MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
> -	value |= MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	for (i = 0; i < soc->num_pads; i++) {
> -		u32 clk = 0, data = 0;
> -
> -		if (device->pads & BIT(i)) {
> -			data = MIPI_CAL_CONFIG_SELECT |
> -			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> -			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
> -			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
> -			clk = MIPI_CAL_CONFIG_SELECT |
> -			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
> -			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
> -		}
>  
> -		tegra_mipi_writel(device->mipi, data, soc->pads[i].data);
> -
> -		if (soc->has_clk_lane && soc->pads[i].clk != 0)
> -			tegra_mipi_writel(device->mipi, clk, soc->pads[i].clk);
> -	}
> -
> -	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
> -	value &= ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
> -	value &= ~MIPI_CAL_CTRL_PRESCALE(0x3);
> -	value |= MIPI_CAL_CTRL_NOISE_FILTER(0xa);
> -	value |= MIPI_CAL_CTRL_PRESCALE(0x2);
> -
> -	if (!soc->clock_enable_override)
> -		value &= ~MIPI_CAL_CTRL_CLKEN_OVR;
> -	else
> -		value |= MIPI_CAL_CTRL_CLKEN_OVR;
> -
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> -
> -	/* clear any pending status bits */
> -	value = tegra_mipi_readl(device->mipi, MIPI_CAL_STATUS);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_STATUS);
> -
> -	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
> -	value |= MIPI_CAL_CTRL_START;
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> -
> -	/*
> -	 * Wait for min 72uS to let calibration logic finish calibration
> -	 * sequence codes before waiting for pads idle state to apply the
> -	 * results.
> -	 */
> -	usleep_range(75, 80);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(tegra_mipi_start_calibration);
> -
> -static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
> -	{ .data = MIPI_CAL_CONFIG_CSIA },
> -	{ .data = MIPI_CAL_CONFIG_CSIB },
> -	{ .data = MIPI_CAL_CONFIG_CSIC },
> -	{ .data = MIPI_CAL_CONFIG_CSID },
> -	{ .data = MIPI_CAL_CONFIG_CSIE },
> -	{ .data = MIPI_CAL_CONFIG_DSIA },
> -	{ .data = MIPI_CAL_CONFIG_DSIB },
> -	{ .data = MIPI_CAL_CONFIG_DSIC },
> -	{ .data = MIPI_CAL_CONFIG_DSID },
> -};
> -
> -static const struct tegra_mipi_soc tegra114_mipi_soc = {
> -	.has_clk_lane = false,
> -	.pads = tegra114_mipi_pads,
> -	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
> -	.clock_enable_override = true,
> -	.needs_vclamp_ref = true,
> -	.pad_drive_down_ref = 0x2,
> -	.pad_drive_up_ref = 0x0,
> -	.pad_vclamp_level = 0x0,
> -	.pad_vauxp_level = 0x0,
> -	.hspdos = 0x0,
> -	.hspuos = 0x4,
> -	.termos = 0x5,
> -	.hsclkpdos = 0x0,
> -	.hsclkpuos = 0x4,
> -};
> -
> -static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
> -	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
> -	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
> -	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
> -	{ .data = MIPI_CAL_CONFIG_CSID, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
> -	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = MIPI_CAL_CONFIG_CSIE_CLK  },
> -	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK  },
> -	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK  },
> -};
> -
> -static const struct tegra_mipi_soc tegra124_mipi_soc = {
> -	.has_clk_lane = true,
> -	.pads = tegra124_mipi_pads,
> -	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
> -	.clock_enable_override = true,
> -	.needs_vclamp_ref = true,
> -	.pad_drive_down_ref = 0x2,
> -	.pad_drive_up_ref = 0x0,
> -	.pad_vclamp_level = 0x0,
> -	.pad_vauxp_level = 0x0,
> -	.hspdos = 0x0,
> -	.hspuos = 0x0,
> -	.termos = 0x0,
> -	.hsclkpdos = 0x1,
> -	.hsclkpuos = 0x2,
> -};
> -
> -static const struct tegra_mipi_soc tegra132_mipi_soc = {
> -	.has_clk_lane = true,
> -	.pads = tegra124_mipi_pads,
> -	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
> -	.clock_enable_override = false,
> -	.needs_vclamp_ref = false,
> -	.pad_drive_down_ref = 0x0,
> -	.pad_drive_up_ref = 0x3,
> -	.pad_vclamp_level = 0x0,
> -	.pad_vauxp_level = 0x0,
> -	.hspdos = 0x0,
> -	.hspuos = 0x0,
> -	.termos = 0x0,
> -	.hsclkpdos = 0x3,
> -	.hsclkpuos = 0x2,
> -};
> -
> -static const struct tegra_mipi_pad tegra210_mipi_pads[] = {
> -	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = 0 },
> -	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = 0 },
> -	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = 0 },
> -	{ .data = MIPI_CAL_CONFIG_CSID, .clk = 0 },
> -	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = 0 },
> -	{ .data = MIPI_CAL_CONFIG_CSIF, .clk = 0 },
> -	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK },
> -	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK },
> -	{ .data = MIPI_CAL_CONFIG_DSIC, .clk = MIPI_CAL_CONFIG_DSIC_CLK },
> -	{ .data = MIPI_CAL_CONFIG_DSID, .clk = MIPI_CAL_CONFIG_DSID_CLK },
> -};
> -
> -static const struct tegra_mipi_soc tegra210_mipi_soc = {
> -	.has_clk_lane = true,
> -	.pads = tegra210_mipi_pads,
> -	.num_pads = ARRAY_SIZE(tegra210_mipi_pads),
> -	.clock_enable_override = true,
> -	.needs_vclamp_ref = false,
> -	.pad_drive_down_ref = 0x0,
> -	.pad_drive_up_ref = 0x3,
> -	.pad_vclamp_level = 0x1,
> -	.pad_vauxp_level = 0x1,
> -	.hspdos = 0x0,
> -	.hspuos = 0x2,
> -	.termos = 0x0,
> -	.hsclkpdos = 0x0,
> -	.hsclkpuos = 0x2,
> -};
> -
> -static const struct of_device_id tegra_mipi_of_match[] = {
> -	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
> -	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
> -	{ .compatible = "nvidia,tegra132-mipi", .data = &tegra132_mipi_soc },
> -	{ .compatible = "nvidia,tegra210-mipi", .data = &tegra210_mipi_soc },
> -	{ },
> -};
> -
> -static int tegra_mipi_probe(struct platform_device *pdev)
> +/**
> + * devm_tegra_mipi_add_provider - Managed registration of a Tegra MIPI
> + *				  calibration function provider.
> + * @device: Handle to the device providing the MIPI calibration function.
> + * @np: Device node pointer of the device providing the MIPI calibration
> + *	function.
> + * @ops: Operations supported by the MIPI calibration device.
> + *
> + * This registers a device that provides MIPI calibration functions.
> + * For Tegra20 and Tegra30, this is the CSI block, while Tegra114 and
> + * newer SoC generations have a dedicated hardware block for these
> + * functions.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int devm_tegra_mipi_add_provider(struct device *device, struct device_node *np,
> +				 const struct tegra_mipi_ops *ops)
>  {
> -	const struct of_device_id *match;
> -	struct tegra_mipi *mipi;
> -
> -	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
> -	if (!match)
> -		return -ENODEV;
> +	if (provider.np)
> +		return -EBUSY;
>  
> -	mipi = devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> -	if (!mipi)
> -		return -ENOMEM;
> +	provider.np = np;
> +	provider.ops = ops;
>  
> -	mipi->soc = match->data;
> -	mipi->dev = &pdev->dev;
> -
> -	mipi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> -	if (IS_ERR(mipi->regs))
> -		return PTR_ERR(mipi->regs);
> -
> -	mutex_init(&mipi->lock);
> -
> -	mipi->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> -	if (IS_ERR(mipi->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
> -		return PTR_ERR(mipi->clk);
> -	}
> -
> -	platform_set_drvdata(pdev, mipi);
> -
> -	return 0;
> +	return devm_add_action_or_reset(device, tegra_mipi_remove_provider, NULL);
>  }
> -
> -struct platform_driver tegra_mipi_driver = {
> -	.driver = {
> -		.name = "tegra-mipi",
> -		.of_match_table = tegra_mipi_of_match,
> -	},
> -	.probe = tegra_mipi_probe,
> -};
> +EXPORT_SYMBOL(devm_tegra_mipi_add_provider);
> diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegra114-mipi.c
> new file mode 100644
> index 000000000000..c084a09784d1
> --- /dev/null
> +++ b/drivers/gpu/host1x/tegra114-mipi.c
> @@ -0,0 +1,483 @@
> +/*
> + * Copyright (C) 2013 NVIDIA Corporation
> + *
> + * Permission to use, copy, modify, distribute, and sell this software and its
> + * documentation for any purpose is hereby granted without fee, provided that
> + * the above copyright notice appear in all copies and that both that copyright
> + * notice and this permission notice appear in supporting documentation, and
> + * that the name of the copyright holders not be used in advertising or
> + * publicity pertaining to distribution of the software without specific,
> + * written prior permission.  The copyright holders make no representations
> + * about the suitability of this software for any purpose.  It is provided "as
> + * is" without express or implied warranty.
> + *
> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> + * OF THIS SOFTWARE.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/host1x.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/tegra-mipi-cal.h>
> +
> +#include "dev.h"
> +
> +#define MIPI_CAL_CTRL			0x00
> +#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
> +#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
> +#define MIPI_CAL_CTRL_CLKEN_OVR		BIT(4)
> +#define MIPI_CAL_CTRL_START		BIT(0)
> +
> +#define MIPI_CAL_AUTOCAL_CTRL		0x01
> +
> +#define MIPI_CAL_STATUS			0x02
> +#define MIPI_CAL_STATUS_DONE		BIT(16)
> +#define MIPI_CAL_STATUS_ACTIVE		BIT(0)
> +
> +#define MIPI_CAL_CONFIG_CSIA		0x05
> +#define MIPI_CAL_CONFIG_CSIB		0x06
> +#define MIPI_CAL_CONFIG_CSIC		0x07
> +#define MIPI_CAL_CONFIG_CSID		0x08
> +#define MIPI_CAL_CONFIG_CSIE		0x09
> +#define MIPI_CAL_CONFIG_CSIF		0x0a
> +#define MIPI_CAL_CONFIG_DSIA		0x0e
> +#define MIPI_CAL_CONFIG_DSIB		0x0f
> +#define MIPI_CAL_CONFIG_DSIC		0x10
> +#define MIPI_CAL_CONFIG_DSID		0x11
> +
> +#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
> +#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
> +#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> +#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
> +#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> +#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
> +#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> +
> +/* for data and clock lanes */
> +#define MIPI_CAL_CONFIG_SELECT		BIT(21)
> +
> +/* for data lanes */
> +#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
> +#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
> +#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
> +
> +/* for clock lanes */
> +#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
> +#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG0		0x16
> +#define MIPI_CAL_BIAS_PAD_PDVCLAMP	BIT(1)
> +#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	BIT(0)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG1		0x17
> +#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
> +#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG2		0x18
> +#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
> +#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
> +#define MIPI_CAL_BIAS_PAD_PDVREG	BIT(1)
> +
> +struct tegra_mipi_pad {
> +	unsigned long data;
> +	unsigned long clk;
> +};
> +
> +struct tegra_mipi_soc {
> +	bool has_clk_lane;
> +	const struct tegra_mipi_pad *pads;
> +	unsigned int num_pads;
> +
> +	bool clock_enable_override;
> +	bool needs_vclamp_ref;
> +
> +	/* bias pad configuration settings */
> +	u8 pad_drive_down_ref;
> +	u8 pad_drive_up_ref;
> +
> +	u8 pad_vclamp_level;
> +	u8 pad_vauxp_level;
> +
> +	/* calibration settings for data lanes */
> +	u8 hspdos;
> +	u8 hspuos;
> +	u8 termos;
> +
> +	/* calibration settings for clock lanes */
> +	u8 hsclkpdos;
> +	u8 hsclkpuos;
> +};
> +
> +struct tegra_mipi {
> +	const struct tegra_mipi_soc *soc;
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct mutex lock; /* for register access */
> +	struct clk *clk;
> +
> +	unsigned long usage_count;
> +};
> +
> +static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> +				   unsigned long offset)
> +{
> +	return readl(mipi->regs + (offset << 2));
> +}
> +
> +static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
> +				     unsigned long offset)
> +{
> +	writel(value, mipi->regs + (offset << 2));
> +}
> +
> +static int tegra114_mipi_power_up(struct tegra_mipi *mipi)
> +{
> +	u32 value;
> +	int err;
> +
> +	err = clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> +	value &= ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> +
> +	if (mipi->soc->needs_vclamp_ref)
> +		value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	clk_disable(mipi->clk);
> +
> +	return 0;
> +}
> +
> +static int tegra114_mipi_power_down(struct tegra_mipi *mipi)
> +{
> +	u32 value;
> +	int err;
> +
> +	err = clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	/*
> +	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
> +	 * supplies the DSI pads. This must be kept enabled until none of the
> +	 * DSI lanes are used anymore.
> +	 */
> +	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value |= MIPI_CAL_BIAS_PAD_PDVREG;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	/*
> +	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
> +	 * control a regulator that supplies current to the pre-driver logic.
> +	 * Powering down this regulator causes DSI to fail, so it must remain
> +	 * powered on until none of the DSI lanes are used anymore.
> +	 */
> +	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	if (mipi->soc->needs_vclamp_ref)
> +		value &= ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +
> +	value |= MIPI_CAL_BIAS_PAD_PDVCLAMP;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	return 0;
> +}
> +
> +static int tegra114_mipi_enable(struct tegra_mipi_device *mipidev)
> +{
> +	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
> +	int err = 0;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	if (mipi->usage_count++ == 0)
> +		err = tegra114_mipi_power_up(mipi);
> +
> +	mutex_unlock(&mipi->lock);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_disable(struct tegra_mipi_device *mipidev)
> +{
> +	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
> +	int err = 0;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	if (--mipi->usage_count == 0)
> +		err = tegra114_mipi_power_down(mipi);
> +
> +	mutex_unlock(&mipi->lock);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *mipidev)
> +{
> +	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
> +	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
> +	u32 value;
> +	int err;
> +
> +	err = readl_relaxed_poll_timeout(status_reg, value,
> +					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
> +					 (value & MIPI_CAL_STATUS_DONE), 50,
> +					 250000);
> +	mutex_unlock(&mipi->lock);
> +	clk_disable(mipi->clk);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_start_calibration(struct tegra_mipi_device *mipidev)
> +{
> +	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
> +	const struct tegra_mipi_soc *soc = mipi->soc;
> +	unsigned int i;
> +	u32 value;
> +	int err;
> +
> +	err = clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> +		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
> +
> +	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value &= ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
> +	value &= ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
> +	value |= MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
> +	value |= MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	for (i = 0; i < soc->num_pads; i++) {
> +		u32 clk = 0, data = 0;
> +
> +		if (mipidev->pads & BIT(i)) {
> +			data = MIPI_CAL_CONFIG_SELECT |
> +			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> +			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
> +			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
> +			clk = MIPI_CAL_CONFIG_SELECT |
> +			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
> +			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
> +		}
> +
> +		tegra_mipi_writel(mipi, data, soc->pads[i].data);
> +
> +		if (soc->has_clk_lane && soc->pads[i].clk != 0)
> +			tegra_mipi_writel(mipi, clk, soc->pads[i].clk);
> +	}
> +
> +	value = tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
> +	value &= ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
> +	value &= ~MIPI_CAL_CTRL_PRESCALE(0x3);
> +	value |= MIPI_CAL_CTRL_NOISE_FILTER(0xa);
> +	value |= MIPI_CAL_CTRL_PRESCALE(0x2);
> +
> +	if (!soc->clock_enable_override)
> +		value &= ~MIPI_CAL_CTRL_CLKEN_OVR;
> +	else
> +		value |= MIPI_CAL_CTRL_CLKEN_OVR;
> +
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
> +
> +	/* clear any pending status bits */
> +	value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_STATUS);
> +
> +	value = tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
> +	value |= MIPI_CAL_CTRL_START;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
> +
> +	/*
> +	 * Wait for min 72uS to let calibration logic finish calibration
> +	 * sequence codes before waiting for pads idle state to apply the
> +	 * results.
> +	 */
> +	usleep_range(75, 80);
> +
> +	return 0;
> +}
> +
> +static const struct tegra_mipi_ops tegra114_mipi_ops = {
> +	.enable = tegra114_mipi_enable,
> +	.disable = tegra114_mipi_disable,
> +	.start_calibration = tegra114_mipi_start_calibration,
> +	.finish_calibration = tegra114_mipi_finish_calibration,
> +};
> +
> +static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
> +	{ .data = MIPI_CAL_CONFIG_CSIA },
> +	{ .data = MIPI_CAL_CONFIG_CSIB },
> +	{ .data = MIPI_CAL_CONFIG_CSIC },
> +	{ .data = MIPI_CAL_CONFIG_CSID },
> +	{ .data = MIPI_CAL_CONFIG_CSIE },
> +	{ .data = MIPI_CAL_CONFIG_DSIA },
> +	{ .data = MIPI_CAL_CONFIG_DSIB },
> +	{ .data = MIPI_CAL_CONFIG_DSIC },
> +	{ .data = MIPI_CAL_CONFIG_DSID },
> +};
> +
> +static const struct tegra_mipi_soc tegra114_mipi_soc = {
> +	.has_clk_lane = false,
> +	.pads = tegra114_mipi_pads,
> +	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
> +	.clock_enable_override = true,
> +	.needs_vclamp_ref = true,
> +	.pad_drive_down_ref = 0x2,
> +	.pad_drive_up_ref = 0x0,
> +	.pad_vclamp_level = 0x0,
> +	.pad_vauxp_level = 0x0,
> +	.hspdos = 0x0,
> +	.hspuos = 0x4,
> +	.termos = 0x5,
> +	.hsclkpdos = 0x0,
> +	.hsclkpuos = 0x4,
> +};
> +
> +static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
> +	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
> +	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
> +	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
> +	{ .data = MIPI_CAL_CONFIG_CSID, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
> +	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = MIPI_CAL_CONFIG_CSIE_CLK  },
> +	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK  },
> +	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK  },
> +};
> +
> +static const struct tegra_mipi_soc tegra124_mipi_soc = {
> +	.has_clk_lane = true,
> +	.pads = tegra124_mipi_pads,
> +	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
> +	.clock_enable_override = true,
> +	.needs_vclamp_ref = true,
> +	.pad_drive_down_ref = 0x2,
> +	.pad_drive_up_ref = 0x0,
> +	.pad_vclamp_level = 0x0,
> +	.pad_vauxp_level = 0x0,
> +	.hspdos = 0x0,
> +	.hspuos = 0x0,
> +	.termos = 0x0,
> +	.hsclkpdos = 0x1,
> +	.hsclkpuos = 0x2,
> +};
> +
> +static const struct tegra_mipi_soc tegra132_mipi_soc = {
> +	.has_clk_lane = true,
> +	.pads = tegra124_mipi_pads,
> +	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
> +	.clock_enable_override = false,
> +	.needs_vclamp_ref = false,
> +	.pad_drive_down_ref = 0x0,
> +	.pad_drive_up_ref = 0x3,
> +	.pad_vclamp_level = 0x0,
> +	.pad_vauxp_level = 0x0,
> +	.hspdos = 0x0,
> +	.hspuos = 0x0,
> +	.termos = 0x0,
> +	.hsclkpdos = 0x3,
> +	.hsclkpuos = 0x2,
> +};
> +
> +static const struct tegra_mipi_pad tegra210_mipi_pads[] = {
> +	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = 0 },
> +	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = 0 },
> +	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = 0 },
> +	{ .data = MIPI_CAL_CONFIG_CSID, .clk = 0 },
> +	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = 0 },
> +	{ .data = MIPI_CAL_CONFIG_CSIF, .clk = 0 },
> +	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK },
> +	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK },
> +	{ .data = MIPI_CAL_CONFIG_DSIC, .clk = MIPI_CAL_CONFIG_DSIC_CLK },
> +	{ .data = MIPI_CAL_CONFIG_DSID, .clk = MIPI_CAL_CONFIG_DSID_CLK },
> +};
> +
> +static const struct tegra_mipi_soc tegra210_mipi_soc = {
> +	.has_clk_lane = true,
> +	.pads = tegra210_mipi_pads,
> +	.num_pads = ARRAY_SIZE(tegra210_mipi_pads),
> +	.clock_enable_override = true,
> +	.needs_vclamp_ref = false,
> +	.pad_drive_down_ref = 0x0,
> +	.pad_drive_up_ref = 0x3,
> +	.pad_vclamp_level = 0x1,
> +	.pad_vauxp_level = 0x1,
> +	.hspdos = 0x0,
> +	.hspuos = 0x2,
> +	.termos = 0x0,
> +	.hsclkpdos = 0x0,
> +	.hsclkpuos = 0x2,
> +};
> +
> +static const struct of_device_id tegra_mipi_of_match[] = {
> +	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
> +	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
> +	{ .compatible = "nvidia,tegra132-mipi", .data = &tegra132_mipi_soc },
> +	{ .compatible = "nvidia,tegra210-mipi", .data = &tegra210_mipi_soc },
> +	{ },
> +};
> +
> +static int tegra_mipi_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct tegra_mipi *mipi;
> +
> +	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
> +	if (!match)
> +		return -ENODEV;
> +
> +	mipi = devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> +	if (!mipi)
> +		return -ENOMEM;
> +
> +	mipi->soc = match->data;
> +	mipi->dev = &pdev->dev;
> +
> +	mipi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(mipi->regs))
> +		return PTR_ERR(mipi->regs);
> +
> +	mutex_init(&mipi->lock);
> +
> +	mipi->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(mipi->clk)) {
> +		dev_err(&pdev->dev, "failed to get clock\n");
> +		return PTR_ERR(mipi->clk);
> +	}
> +
> +	platform_set_drvdata(pdev, mipi);
> +
> +	return devm_tegra_mipi_add_provider(&pdev->dev, pdev->dev.of_node,
> +					    &tegra114_mipi_ops);
> +}
> +
> +struct platform_driver tegra_mipi_driver = {
> +	.driver = {
> +		.name = "tegra-mipi",
> +		.of_match_table = tegra_mipi_of_match,
> +	},
> +	.probe = tegra_mipi_probe,
> +};
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> index f858c05ce6c9..bcaea20c3025 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/tegra-mipi-cal.h>
>  
>  #include <media/v4l2-fwnode.h>
>  
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 5e7a63143a4a..1f5f55917d1c 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client *client);
>  int host1x_client_suspend(struct host1x_client *client);
>  int host1x_client_resume(struct host1x_client *client);
>  
> -struct tegra_mipi_device;
> -
> -struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> -					     struct device_node *np);
> -void tegra_mipi_free(struct tegra_mipi_device *device);
> -int tegra_mipi_enable(struct tegra_mipi_device *device);
> -int tegra_mipi_disable(struct tegra_mipi_device *device);
> -int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> -
>  /* host1x memory contexts */
>  
>  struct host1x_memory_context {
> diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-cal.h
> new file mode 100644
> index 000000000000..2a540b50f65d
> --- /dev/null
> +++ b/include/linux/tegra-mipi-cal.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __TEGRA_MIPI_CAL_H_
> +#define __TEGRA_MIPI_CAL_H_
> +
> +struct tegra_mipi_device {
> +	const struct tegra_mipi_ops *ops;
> +	struct platform_device *pdev;
> +	unsigned long pads;
> +};
> +
> +/**
> + * Operations for Tegra MIPI calibration device
> + */
> +struct tegra_mipi_ops {
> +	/**
> +	 * @enable:
> +	 *
> +	 * Enable MIPI calibration device
> +	 */
> +	int (*enable)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @disable:
> +	 *
> +	 * Disable MIPI calibration device
> +	 */
> +	int (*disable)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @start_calibration:
> +	 *
> +	 * Start MIPI calibration
> +	 */
> +	int (*start_calibration)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @finish_calibration:
> +	 *
> +	 * Finish MIPI calibration
> +	 */
> +	int (*finish_calibration)(struct tegra_mipi_device *device);
> +};
> +
> +int devm_tegra_mipi_add_provider(struct device *device, struct device_node *np,
> +				 const struct tegra_mipi_ops *ops);
> +
> +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> +					     struct device_node *np);
> +void tegra_mipi_free(struct tegra_mipi_device *device);
> +
> +int tegra_mipi_enable(struct tegra_mipi_device *device);
> +int tegra_mipi_disable(struct tegra_mipi_device *device);
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> +
> +#endif /* __TEGRA_MIPI_CAL_H_ */


