Return-Path: <linux-media+bounces-63526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qnVyN27mH2o/sAAAu9opvQ
	(envelope-from <linux-media+bounces-63526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:31:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB59635B86
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:31:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=M5sgPR7G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63526-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63526-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3B383062185
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AE941B37D;
	Wed,  3 Jun 2026 08:27:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C29413220;
	Wed,  3 Jun 2026 08:27:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475273; cv=none; b=khjTkD5NuNUgYdHR97CJjRwkgd2jXL7RIn0oIg6y0WqOug7IQczS4Kwzm3srIcGyl3kLvAMx0WR2kFYJhjVs9+sTMy/Lqb74Yl+CeyvMvfqRcZs26F76qugfcWf3j/BcTrTxHLueaNu5fxU1TOhGf1cogluksaKTusWOVNREA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475273; c=relaxed/simple;
	bh=ckLt37X2YPy6N/1CHjV5B6UynNBgU0FukrXwnhP9jxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaVCQaGregh5OPhrZYA8tNlJfnFPcX1C2ZCWslk73YRM3tNhA8GHbAP05jeGofbuQGOhxkJ1IGNBsT8n+XtNijLH3E1nwBlIN/qk9tX5HY9xdSuLl26Hx/FBwmBnNaKt9W9AqKVZgbFI8MGv2uzlBo2Pa0bI2VAPR6V/GomMCq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M5sgPR7G; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFEE6DF3;
	Wed,  3 Jun 2026 10:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780475245;
	bh=ckLt37X2YPy6N/1CHjV5B6UynNBgU0FukrXwnhP9jxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5sgPR7GUonaQ7WjVm4Y/nBlafJHotXXmwzjwyr59sb2dN5Ghr68sDIYh4UYUUkpK
	 cf3bo8m8BQ4hmGNyJ1/I1Sxqe94dLxoX3ypANH7pK0OsrWUfXjMk5IjGyTjr2fT695
	 4UjBf3CXerGbfBkwsCzLeky+rpiPnQeQMUI55elM=
Date: Wed, 3 Jun 2026 10:27:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v8 02/14] media: rppx1: Add framework to support Dreamchip
 RPPX1 ISP
Message-ID: <ah_kud7fRe_DN7Mx@zed>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-3-niklas.soderlund+renesas@ragnatech.se>
 <afrxmrw2BZLT1tRJ@zed>
 <20260516151718.GV332351@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516151718.GV332351@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63526-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:from_mime,ideasonboard.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,zed:mid,ragnatech.se:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CB59635B86

Hi Niklas

On Sat, May 16, 2026 at 05:17:18PM +0200, Niklas Söderlund wrote:
> Hello Jacopo,
>

[snip]

> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c b/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
> > > new file mode 100644
> > > index 000000000000..5bec022e8f05
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
> > > @@ -0,0 +1,64 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright 2025 Renesas Electronics Corp.
> > > + * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define SHRPCNR_VERSION_REG				0x0000
> > > +
> > > +#define SHRPCNR_CTRL_REG				0x0004
> > > +#define SHRPCNR_CTRL_CAD_EN				BIT(3)
> > > +#define SHRPCNR_CTRL_DESAT_EN				BIT(2)
> > > +#define SHRPCNR_CTRL_CNR_EN				BIT(1)
> > > +#define SHRPCNR_CTRL_SHARPEN_EN				BIT(0)
> > > +
> > > +#define SHRPCNR_PARAM_REG				0x0008
> > > +#define SHRPCNR_PARAM_SHARP_FACTOR_MASK			GENMASK(19, 12)
> > > +#define SHRPCNR_PARAM_CORING_THR_MASK			GENMASK(11, 0)
> > > +
> > > +#define SHRPCNR_MAT_1_REG				0x000c
> > > +#define SHRPCNR_MAT_2_REG				0x0010
> > > +#define SHRPCNR_CLB_LINESIZE_REG			0x0014
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_0_REG		0x0018
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_1_REG		0x001c
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_2_REG		0x0020
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_3_REG		0x0024
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_4_REG		0x0028
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_5_REG		0x002c
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_6_REG		0x0030
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_7_REG		0x0034
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_8_REG		0x0038
> > > +#define SHRPCNR_YUV2RGB_CCOR_OFFSET_R_REG		0x003c
> > > +#define SHRPCNR_YUV2RGB_CCOR_OFFSET_G_REG		0x0040
> > > +#define SHRPCNR_YUV2RGB_CCOR_OFFSET_B_REG		0x0044
> > > +
> > > +#define SHRPCNR_CNR_THRES_REG				0x0048
> > > +#define SHRPCNR_CNR_THRES_CNR_THRES_CR_MASK		GENMASK(27, 16)
> > > +#define SHRPCNR_CNR_THRES_CNR_THRES_CB_MASK		GENMASK(11, 0)
> > > +
> > > +#define SHRPCNR_CRED_THRES_REG				0x004c
> > > +#define SHRPCNR_CRED_SLOPE_REG				0x0050
> > > +#define SHRPCNR_CAD_RESTORE_LVL_REG			0x0054
> > > +#define SHRPCNR_CAD_THRESH_V_UNEG_REG			0x0058
> > > +#define SHRPCNR_CAD_THRESH_V_UPOS_REG			0x005c
> > > +#define SHRPCNR_CAD_THRESH_U_REG			0x0060
> > > +
> > > +static int rppx1_shrp_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, SHRPCNR_VERSION_REG)) {
> > > +	case 2:
> > > +		mod->info.shrp.colorbits = 12;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_shrp_ops = {
> > > +	.probe = rppx1_shrp_probe,
> > > +};
> >
> > There are quite some modules here that have no corresponding user in
> > libcamera and which are not exercized.
> >
> > As long as we don't have a userspace user, I would refrein from adding
> > them to the driver to avoid committing to a uAPI before anyone
> > actually uses it.
>
> I do have user-space that exercise each uAPI exposed by this series in
> the form of unit-tests. But I know you feel strongly about libcamera
> support so I will drop the uAPI from the ones not used by libcamera from
> this series.
>

More than libcamera itself, I think it's safer to make sure we can
exercize the user API before committing to them. The best way to do
that is to have an algorithm in libcamera indeed

> Before the switch to the RPPX1 dedicated format the RkISP1 IPA in
> libcamera did use more of the enabled blocks together with some sensors.

yeah, but thinking about denoise in example, I wouldn't fully commit
to that yet as we know that algorithm is just very basic


> So for my core use-cases dropping them will not lose me much
> functionality. And as this series now structures uAPI together with the
> code moving modules in out is easy :-)
>
> I will drop the following blocks:
>
> - BLS - statistics reporting.
> - DB
> - BD
>
> >
> > If you want to keep the kernel module, fine, but no ABI for blocks
> > without a userspace user.
>
> The probe and static init config (that instructs the ISP pipeline to
> bypass the module) I will keep. I will drop all logic and uAPU
> structures.

Thank you!

>
> >
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> > > new file mode 100644
> > > index 000000000000..3d197d914d07
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> > > @@ -0,0 +1,61 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright 2025 Renesas Electronics Corp.
> > > + * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define AWB_MEAS_VERSION_REG			0x0000
> > > +
> > > +#define AWB_MEAS_PROP_REG			0x0004
> > > +#define AWB_MEAS_PROP_MEAS_MODE_RGB		BIT(16) /* 0: YCbCr 1: RGB */
> > > +#define AWB_MEAS_PROP_YMAX			BIT(2)
> > > +#define AWB_MEAS_PROP_AWB_MODE_ON		BIT(1)
> > > +
> > > +#define AWB_MEAS_H_OFFS_REG			0x0008
> > > +#define AWB_MEAS_V_OFFS_REG			0x000c
> > > +#define AWB_MEAS_H_SIZE_REG			0x0010
> > > +#define AWB_MEAS_V_SIZE_REG			0x0014
> > > +#define AWB_MEAS_FRAMES_REG			0x0018
> > > +#define AWB_MEAS_REF_CB_MAX_B_REG		0x001c
> > > +#define AWB_MEAS_REF_CR_MAX_R_REG		0x0020
> > > +#define AWB_MEAS_MAX_Y_REG			0x0024
> > > +#define AWB_MEAS_MIN_Y_MAX_G_REG		0x0028
> > > +#define AWB_MEAS_MAX_CSUM_REG			0x002c
> > > +#define AWB_MEAS_MIN_C_REG			0x0030
> > > +#define AWB_MEAS_WHITE_CNT_REG			0x0034
> > > +#define AWB_MEAS_MEAN_Y_G_REG			0x0038
> > > +#define AWB_MEAS_MEAN_CB_B_REG			0x003c
> > > +#define AWB_MEAS_MEAN_CR_R_REG			0x0040
> > > +
> > > +#define AWB_MEAS_CCOR_COEFF_NUM			9
> > > +#define AWB_MEAS_CCOR_COEFF_REG(n)		(0x0044 + (4 * (n)))
> > > +
> > > +#define AWB_MEAS_CCOR_OFFSET_R_REG		0x0068
> > > +#define AWB_MEAS_CCOR_OFFSET_G_REG		0x006c
> > > +#define AWB_MEAS_CCOR_OFFSET_B_REG		0x0070
> > > +
> > > +static int rppx1_wbmeas_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, AWB_MEAS_VERSION_REG)) {
> > > +	case 1:
> > > +		mod->info.wbmeas.colorbits = 8;
> > > +		break;
> > > +	case 2:
> > > +		mod->info.wbmeas.colorbits = 20;
> > > +		break;
> > > +	case 3:
> > > +		mod->info.wbmeas.colorbits = 24;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_wbmeas_ops = {
> > > +	.probe = rppx1_wbmeas_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c b/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
> > > new file mode 100644
> > > index 000000000000..73789c48c057
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
> > > @@ -0,0 +1,26 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright 2025 Renesas Electronics Corp.
> > > + * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define XYZ2LUV_VERSION_REG			0x0000
> > > +#define XYZ2LUV_U_REF_REG			0x0004
> > > +#define XYZ2LUV_V_REF_REG			0x0008
> > > +#define XYZ2LUV_LUMA_OUT_FAC_REG		0x000c
> > > +#define XYZ2LUV_CHROMA_OUT_FAC_REG		0x0010
> > > +
> > > +static int rppx1_xyz2luv_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, XYZ2LUV_VERSION_REG) != 4)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_xyz2luv_ops = {
> > > +	.probe = rppx1_xyz2luv_probe,
> > > +};
> > > diff --git a/include/media/rppx1.h b/include/media/rppx1.h
> > > new file mode 100644
> > > index 000000000000..cb3470c27ceb
> > > --- /dev/null
> > > +++ b/include/media/rppx1.h
> > > @@ -0,0 +1,34 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright 2025 Renesas Electronics Corp.
> > > + * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > > + */
> > > +#ifndef __MEDIA_DCT_RPPX1_H__
> > > +#define __MEDIA_DCT_RPPX1_H__
> > > +
> > > +#include <linux/v4l2-mediabus.h>
> > > +#include <linux/media/dreamchip/rppx1-config.h>
> > > +
> > > +#include <media/videobuf2-core.h>
> > > +
> > > +struct rppx1;
> > > +
> > > +struct rppx1 *rppx1_create(void __iomem *base, struct device *dev);
> > > +
> > > +void rppx1_destroy(struct rppx1 *rpp);
> > > +
> > > +int rppx1_start(struct rppx1 *rpp, const struct v4l2_mbus_framefmt *input,
> > > +		const struct v4l2_mbus_framefmt *hv,
> > > +		const struct v4l2_mbus_framefmt *mv);
> > > +
> > > +int rppx1_stop(struct rppx1 *rpp);
> > > +
> > > +bool rppx1_interrupt(struct rppx1 *rpp, u32 *isc);
> > > +
> > > +typedef int (*rppx1_reg_write)(void *priv, u32 offset, u32 value);
> > > +int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> > > +		 rppx1_reg_write write, void *priv);
> > > +
> > > +void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf);
> > > +
> > > +#endif /* __MEDIA_DCT_RPPX1_H__ */
> > > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > new file mode 100644
> > > index 000000000000..26627be6f483
> > > --- /dev/null
> > > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> >
> > As said, I don't think it makes much sense to add an almost empty uapi
> > file.
> >
> > I would add it in one commit.
> >
> > Please retain Jai's authorship and add my Co-developed-by tag as I
> > rewrote most of the documentation and reworked most blocks.
>
> As discussed above, I really like adding the uAPI together with the
> logic. I will retain the scaffolding as a separate commit from Jai and
> add the Co-developed tags.

Fine with me then!

Thanks
  j

>
> >
> > > @@ -0,0 +1,66 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > +/*
> > > + * Dreamchip RPP-X1 ISP Driver - Userspace API
> > > + *
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#ifndef __UAPI_RPP_X1_CONFIG_H
> > > +#define __UAPI_RPP_X1_CONFIG_H
> > > +
> > > +#include <linux/types.h>
> > > +#include <linux/media/v4l2-isp.h>
> > > +
> > > +/**
> > > + * struct rppx1_window - Measurement window
> > > + *
> > > + * RPP-X1 measurement window. Different blocks use a window or multiple
> > > + * windows for measurement purposes. This defines a common type for all of
> > > + * them. The number of relevant bits depends on the block where the window is
> > > + * used and is specified in the per-block description
> > > + *
> > > + * @h_offs: horizontal offset from the left of the frame in pixels
> > > + * @v_offs: vertical offset from the top of the frame in pixels
> > > + * @h_size: horizontal size of the window in pixels
> > > + * @v_size: vertical size of the window in pixels
> > > + */
> > > +struct rppx1_window {
> > > +	__u16 h_offs;
> > > +	__u16 v_offs;
> > > +	__u16 h_size;
> > > +	__u16 v_size;
> > > +};
> > > +
> > > +/* ---------------------------------------------------------------------------
> > > + * Parameter Structures
> > > + *
> > > + * Native RPP-X1 precision. Fields use __u32 where the hardware provides
> > > + * wider-than-8-bit results.
> >
> > I think you could drop the first part: of course the RPP-X1 uAPI
> > header uses the RPP-X1 precision. You could add:
> >
> >       The same ISP block might be instantiated in multiple pipeliness
> >       and operate on a different bitdepth/precision. For fields of
> >       varying length among different instances of the same block, use
> >       a data type that can accommodate the larger bitdepth/precision.
> >
> > Or something similar
>
> Thanks, this should of course be updated now that we have a native RPPX1
> format.
>
> >
> > > + */
> > > +
> > > +/**
> > > + * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> > > + *
> > > + * Some types are reported twice as the same block might be instantiated in
> > > + * multiple pipes.
> > > + */
> > > +#define RPPX1_PARAMS_MAX_SIZE 0
> > > +
> > > +/* ---------------------------------------------------------------------------
> > > + * Statistics Structures
> > > + *
> > > + * Native RPP-X1 precision. Fields use __u32 where the hardware provides
> > > + * wider-than-8-bit results.
> >
> > Same here
>
> Ditto.
>
> >
> > > + */
> > > +
> > > +/**
> > > + * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
> > > + *
> > > + * Some types are reported twice as the same block might be instantiated in
> > > + * multiple pipes.
> > > + */
> > > +#define RPPX1_STATS_MAX_SIZE 0
> > > +
> > > +#endif /* __UAPI_RPP_X1_CONFIG_H */
> > > --
> > > 2.54.0
> > >
>
> --
> Kind Regards,
> Niklas Söderlund
>

