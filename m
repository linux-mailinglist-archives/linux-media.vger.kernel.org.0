Return-Path: <linux-media+bounces-61575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKOgHjGJBWrGYAIAu9opvQ
	(envelope-from <linux-media+bounces-61575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:34:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1806053F5F8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB0CB3016B46
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7356138C40B;
	Thu, 14 May 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kyhMhAiN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9CB3DD51A;
	Thu, 14 May 2026 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747688; cv=none; b=nluPA6h8L9oBMLV2yJ5BczQKHoeDR4ypfbwPDQbBOhbFwFb+13QItSabT0ZBkWRZilY4gu3AHN/ueIF37OFU22gTsyPm7tq/jllpZxvWXjulUFCNbE4vK9DuxvRfRFxWlXv99iI0hqLfQIvTWRIP6QFYaPFu4aIJuCClbsfmvJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747688; c=relaxed/simple;
	bh=r8hDWHYRE+z0cmdQ3N18SBCfACpuuHnCzXWnYv2bU9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StAFbEZLOMy/cgIbzXKHZboRrcBpTiA8d3LT8Fqyh+OE09HjADsYA+m6O84AjAx0IMj4zvXYSaRZ1+PUkzGPbNLkx0gH/0A5/JU6d0S/NdXueRANn+wHzboTE2wFNl5CoEDo3z/QJtV67mtTbR/2um/4Gm99OoVRot/zsNm0Dg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kyhMhAiN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 674AD8E0;
	Thu, 14 May 2026 10:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778747674;
	bh=r8hDWHYRE+z0cmdQ3N18SBCfACpuuHnCzXWnYv2bU9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyhMhAiN07VEQlbWZ1ThWKLI6p68OWV6SWLCdz8CZ2ywnnGDlu7nxB7MtVm3HrxUf
	 8OTBH5Yti0ZzGAUv7rkRnv5Eaf/W2tFvhdzT+2aU/Td/+OMx0Qb9DFn68tIqU1DMlF
	 HUGcHZCX/zbXconnsHiFh2JrmXtkSXPriCbYGj04=
Date: Thu, 14 May 2026 10:34:40 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] media: i2c: ov5640: Document AWB control registers
Message-ID: <agWJBNKMi8R5Yh26@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-8-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-8-0869a7802a33@ideasonboard.com>
X-Rspamd-Queue-Id: 1806053F5F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61575-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Ah sorry,
  I would squash this with the previous one. If you prefer to keep
  them separate, add my tag to 07 as well.

On Fri, May 01, 2026 at 04:39:10PM +0100, Kieran Bingham wrote:
> Identify and map the registers that are controlling the AWB and
> document their current impact inline in the register set.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 61 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 47 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 4b6804fc47e1..34fe7f51e17b 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -112,6 +112,34 @@
>  #define OV5640_REG_PCLK_PERIOD		0x4837
>  #define OV5640_REG_ISP_FORMAT_MUX_CTRL	0x501f
>  #define OV5640_REG_PRE_ISP_TEST_SET1	0x503d
> +
> +#define OV5640_REG_AWB_CONTROL_00	0x5180 /* AWB B block */
> +#define OV5640_REG_AWB_CONTROL_01	0x5181 /* AWB Step and Slope control */
> +#define OV5640_REG_AWB_CONTROL_02	0x5182 /* 7:4 Max local counter 3:0 mas fast counter */
> +#define OV5640_REG_AWB_CONTROL_03	0x5183 /* AWB Simple/Advanced control */
> +#define OV5640_REG_AWB_CONTROL_04	0x5184 /* Count and G enable */
> +#define OV5640_REG_AWB_CONTROL_05	0x5185 /* Stable Range Thresholds */
> +
> +#define OV5640_REG_AWB_CONTROL_17	0x5191 /* AWB Top limit */
> +#define OV5640_REG_AWB_CONTROL_18	0x5192 /* AWB Bottom limit */
> +#define OV5640_REG_AWB_CONTROL_19	0x5193 /* Red limit */
> +#define OV5640_REG_AWB_CONTROL_20	0x5194 /* Green limit */
> +#define OV5640_REG_AWB_CONTROL_21	0x5195 /* Blue limit */
> +
> +#define OV5640_REG_AWB_CONTROL_22	0x5196 /* AWB Freeze and Simple Selection */
> +#define OV5640_AWB_FREEZE		BIT(5) /* AWB freeze */
> +#define OV5640_AWB_SIMPLE_SELECT_MASK	GENMASK(3, 2)
> +#define OV5640_AWB_SIMPLE_AFTER_AWB_0	0 /* AWB simple from after AWB gain */
> +#define OV5640_AWB_SIMPLE_AFTER_GMA_0	1 /* AWB simple from after RAW GMA */
> +#define OV5640_AWB_SIMPLE_AFTER_GMA_1	2 /* AWB simple from after RAW GMA */
> +#define OV5640_AWB_SIMPLE_AFTER_AWB_1	3 /* AWB simple from after AWB gain */
> +#define OV5640_AWB_FAST_ENABLE		BIT(1) /* AWB fast enable */
> +#define OV5640_AWB_BIAS_STAT		BIT(0)
> +
> +#define OV5640_REG_AWB_CONTROL_23	0x5197 /* Local Limit */
> +
> +#define OV5640_REG_AWB_CONTROL_30	0x519e /* Local limit and Stable Select */
> +
>  #define OV5640_REG_SDE_CTRL0		0x5580
>  #define OV5640_REG_SDE_CTRL1		0x5581
>  #define OV5640_REG_SDE_CTRL3		0x5583
> @@ -576,12 +604,14 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x5000, 0xa7, 0, 0}, {0x5001, 0xa3, 0, 0},
>
>  	/* AWB Control */
> -	{0x5180, 0xff, 0, 0},
> -	{0x5181, 0xf2, 0, 0},
> -	{0x5182, 0x00, 0, 0},
> -	{0x5183, 0x14, 0, 0},
> -	{0x5184, 0x25, 0, 0},
> -	{0x5185, 0x24, 0, 0},
> +	{OV5640_REG_AWB_CONTROL_00, 0xff, 0, 0}, /* AWB B Block */
> +	{OV5640_REG_AWB_CONTROL_01, 0xf2, 0, 0}, /* Step and Slope  - one zone, 0 slope, step fast=step local = 3 */
> +	{OV5640_REG_AWB_CONTROL_02, 0x00, 0, 0}, /* Local/Fast counters @ 0 */
> +	{OV5640_REG_AWB_CONTROL_03, 0x14, 0, 0}, /* Advanced AWB: AWB SIMF, AWB Win = 1 */
> +	{OV5640_REG_AWB_CONTROL_04, 0x25, 0, 0}, /* G-Enable, Count-limit=1, count threshold=1 */
> +	{OV5640_REG_AWB_CONTROL_05, 0x24, 0, 0}, /* Stable Ranges: Threshold for [7:4] unstable to stable [3:0] stable to unstable */
> +
> +	/* AWB Advanced Control - Undocumented */
>  	{0x5186, 0x09, 0, 0},
>  	{0x5187, 0x09, 0, 0},
>  	{0x5188, 0x09, 0, 0},
> @@ -593,20 +623,23 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x518e, 0x34, 0, 0},
>  	{0x518f, 0x6b, 0, 0},
>  	{0x5190, 0x46, 0, 0},
> -	{0x5191, 0xf8, 0, 0},
> -	{0x5192, 0x04, 0, 0},
> -	{0x5193, 0x70, 0, 0},
> -	{0x5194, 0xf0, 0, 0},
> -	{0x5195, 0xf0, 0, 0},
> -	{0x5196, 0x03, 0, 0},
> -	{0x5197, 0x01, 0, 0},
> +
> +	{OV5640_REG_AWB_CONTROL_17, 0xf8, 0, 0}, /* AWB Top limit (Default 0xff)*/
> +	{OV5640_REG_AWB_CONTROL_18, 0x04, 0, 0}, /* AWB Bottom limit (Default 0x00) */
> +	{OV5640_REG_AWB_CONTROL_19, 0x70, 0, 0}, /* Red limit (Default 0xf0) */
> +	{OV5640_REG_AWB_CONTROL_20, 0xf0, 0, 0}, /* Green Limit (Default 0xf0) */
> +	{OV5640_REG_AWB_CONTROL_21, 0xf0, 0, 0}, /* Blue limit (Default 0xf0) */
> +	{OV5640_REG_AWB_CONTROL_22, 0x03, 0, 0}, /* AWB after AWB gain; Fast enable; Bias stat; */
> +	{OV5640_REG_AWB_CONTROL_23, 0x01, 0, 0}, /* Local limit (Default 0x02) */
> +
> +	/* Debug mode - Undocumented */
>  	{0x5198, 0x04, 0, 0},
>  	{0x5199, 0x6c, 0, 0},
>  	{0x519a, 0x04, 0, 0},
>  	{0x519b, 0x00, 0, 0},
>  	{0x519c, 0x09, 0, 0},
>  	{0x519d, 0x2b, 0, 0},
> -	{0x519e, 0x38, 0, 0},
> +	{OV5640_REG_AWB_CONTROL_30, 0x38, 0, 0}, /* [7:4] Debug = 3; [3] Local Limit Select = 1; [2] Simple stable select=0; [1:0] Debug=0 */
>
>  	{0x5381, 0x1e, 0, 0}, {0x5382, 0x5b, 0, 0}, {0x5383, 0x08, 0, 0},
>  	{0x5384, 0x0a, 0, 0}, {0x5385, 0x7e, 0, 0}, {0x5386, 0x88, 0, 0},
>
> --
> 2.52.0
>
>

