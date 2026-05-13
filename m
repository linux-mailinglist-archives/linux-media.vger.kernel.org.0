Return-Path: <linux-media+bounces-61537-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOp6OrToBGrCQQIAu9opvQ
	(envelope-from <linux-media+bounces-61537-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:10:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DBB53ADEF
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FFE6301DEDA
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBA0395AC3;
	Wed, 13 May 2026 21:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuGsLWV2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B34E1E8332;
	Wed, 13 May 2026 21:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706607; cv=none; b=nAJSfV54J8k23P7gUwQwuBCpbYk4aILVC+6DVEGvuIkr2pnvH9cQ+YWyL2TjGKkhpq7HhINxsZGqLjilDOFbP6NzswidxrPxnWoojedS6kSU2PTyDfPA8nxI9JDK+gEYnpkKhr2BUTq0Xw8CF4AuSaG0hXUHj4/bRTLWy370ijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706607; c=relaxed/simple;
	bh=cdESglCN7Id9jI/+xjGchbl/2aSL8C+MEauHTJPIrDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irKU0mweRs3MbsKAjYNQkYOSQg9du1iCowspij7l4Z9k3E7kjguP3UFV6FzdKoaM//G/InxVJSGokl8vs6gDhZUGMmx350LmIp6YVvNjgmZ9b9VJ0w4xnMB0rHjU+QN9FuksfAVJT2OCBPJjcuxctttqwVuKNIQ4gWjud1TA3IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuGsLWV2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778706606; x=1810242606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cdESglCN7Id9jI/+xjGchbl/2aSL8C+MEauHTJPIrDk=;
  b=OuGsLWV2erWThhphv5FP283sRMe87uQ0HWn+zhueH+H3A72MWnnWPgu/
   HuL5D/2iav8/FRjXhqK1e0fenVP3fOHFm+/I6/6TJqoxUccTqyD/n8rEk
   3dFd+GkHc4gw0Zuvh1msuxelFvxtMmzdh9FfBs388BtxzgQ4qL7HFVUd0
   z4I2RAQc3hrcRRkVsgo4PHMc3phchD+ft4PDZ939wgi/neJ3oj5WYfYbi
   Mhpb7qlMglg02GXsEhr8zxwdZ6p57zXJq6WoopnCuXFFvekl6pCc2Nnrg
   hd5C+1VEfJDYzOq4wH82Vbx6cm7AsdsiOv2WWrYUAG6enp0qy+U5tsZp/
   A==;
X-CSE-ConnectionGUID: pltVXNSzTAaDeEH58t3DbQ==
X-CSE-MsgGUID: VdSB8pEzTb2lh012ISHDoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="82212101"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="82212101"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:10:05 -0700
X-CSE-ConnectionGUID: DDktM+DnRPCdsPd/5neUPw==
X-CSE-MsgGUID: ipqSZYNjRaqSbI7UT06MOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261710549"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.188])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:10:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 50A38121C9E;
	Thu, 14 May 2026 00:10:00 +0300 (EEST)
Date: Thu, 14 May 2026 00:10:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <agToqA4rGVmWM7zQ@kekkonen.localdomain>
References: <20260513205949.105444-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513205949.105444-1-Frank.Li@nxp.com>
X-Rspamd-Queue-Id: 79DBB53ADEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61537-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,intel.com:dkim,kekkonen.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Frank,

Thanks for the update. A few minor comments...

On Wed, May 13, 2026 at 04:59:47PM -0400, Frank Li wrote:
> Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
> to reduce codes such as
> 
> 	static const struct imx7_csi_pixfmt pixel_formats[] = {
>         {
>                 .fourcc = V4L2_PIX_FMT_UYVY,
>                 .codes  = IMX_BUS_FMTS(
>                         MEDIA_BUS_FMT_UYVY8_2X8,
>                         MEDIA_BUS_FMT_UYVY8_1X16
>                 ),
>                 .yuv    = true,
>                 .bpp    = 16,
>         },
> 	....
> 
> .bpp can be removed from pixel_formats with this helper function.
> 
> CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> See section 9.4.
> 
> Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
> MIPI defined data type and avoid below duplicated static array in each CSI2
> drivers.
> 
> 	{
> 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> 		.data_type = MIPI_CSI2_DT_YUV422_8B,
> 	}
> 
> Only add known map for dt type. Need update media_bus_fmt_info when new
> mapping used.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v4
> - add space after }
> - fix bpps value when m_nXk (m.n*k)
> - add comments about bpp defination. only convert from suffix of
> MEDIA_BUS_FMT_*
> - move struct media_bus_fmt_info to c file
> - change field name fmt to code
> There are some open at
> https://lore.kernel.org/linux-media/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org/.
> this version just fix known review comments.
> 
> Change in v3:
> - squash two help function patch to one.
> - use media_bus_fmt_info to do map.
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 178 ++++++++++++++++++++++++++
>  include/media/mipi-csi2.h             |  26 ++++
>  2 files changed, 204 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 554c591e11133..6dba7267f0ff5 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -46,6 +46,7 @@
>  #include <linux/uaccess.h>
>  #include <asm/io.h>
>  #include <asm/div64.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ctrls.h>
> @@ -806,3 +807,180 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
>  	return clk_hw->clk;
>  }
>  EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
> +
> +/**
> + * struct media_bus_fmt_info - information about a media bus format
> + * @code: media bus format identifier (MEDIA_BUS_FMT_*)
> + * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
> + * @bpp: bit width per pixel, which is suffix from MEDIA_BUS_FMT_*, no pad. no
> + *	 compressed data.
> + */
> +struct media_bus_fmt_info {
> +	u32 code;
> +	u8 dt;
> +	u8 bpp;
> +};
> +
> +static const struct media_bus_fmt_info media_bus_fmt_info[] = {
> +	{ .code = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18 },
> +	{ .code = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18 },
> +	{ .code = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21 },
> +	{ .code = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30 },
> +	{ .code = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32 },
> +	{ .code = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30 },
> +	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35 },
> +	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36 },
> +	{ .code = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36 },
> +	{ .code = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48 },
> +
> +	{ .code = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30 },
> +	{ .code = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 15 },
> +	{ .code = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32 },
> +	{ .code = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 18 },
> +	{ .code = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36 },
> +	{ .code = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48 },
> +	{ .code = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 24 },
> +
> +	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +
> +	{ .code = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8 },
> +
> +	{ .code = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8 },
> +
> +	{ .code = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 8 },
> +
> +	{ .code = MEDIA_BUS_FMT_META_8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_META_10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_META_12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_META_14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_META_16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_META_20, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_META_24, .bpp = 24 },
> +};
> +
> +static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {

Can be defined here.

> +		if (media_bus_fmt_info[i].code == bus_fmt)
> +			return &media_bus_fmt_info[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +u32 media_bus_fmt_to_csi2_dt(int bus_fmt)

u32 for bus_fmt.

> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	return info ? info->dt : MIPI_CSI2_DT_INVALIDATE;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> +
> +u32 media_bus_fmt_to_csi2_bpp(int bus_fmt)

Ditto.

> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	return info ? info->bpp : 0;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index 40fc0264250d7..bd22d2ae57e81 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h
> @@ -44,4 +44,30 @@
>  #define MIPI_CSI2_DT_RAW20		0x2f
>  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
>  
> +/* Use one undefined value in spec */
> +#define MIPI_CSI2_DT_INVALIDATE		0xff

s/INVALID\KATE//

> +
> +/**
> + * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus format
> + *
> + * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> + *
> + * return MIPI CSI2 data type MIPI_CSI2_DT_*, MIPI_CSI2_DT_INVALIDATE means

 * Return: ...

> + * can't get data type from bus_fmt.
> + */
> +u32 media_bus_fmt_to_csi2_dt(int bus_fmt);

I also realised you'll need linux/types.h for u32.

> +
> +/**
> + * media_bus_fmt_to_csi2_bpp - Get media bus format's bit width per pixel

s/width per pixel/depth/

?

> + *
> + * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> + *
> + * returns bit width per pixel, 0 is invalidate width, which can't get from

Ditto.

> + * bus_fmt.
> + *
> + * Notes: this bpp is suffix from MEDIA_BUS_FMT_*, no pad, not for compressed
> + * data.
> + */
> +u32 media_bus_fmt_to_csi2_bpp(int bus_fmt);
> +
>  #endif /* _MEDIA_MIPI_CSI2_H */

-- 
Kind regards,

Sakari Ailus

