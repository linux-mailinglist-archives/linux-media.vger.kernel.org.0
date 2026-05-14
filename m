Return-Path: <linux-media+bounces-61573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD2jKaeGBWr5XwIAu9opvQ
	(envelope-from <linux-media+bounces-61573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:24:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F34AB53F395
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12CA33017240
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2773D8120;
	Thu, 14 May 2026 08:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uqbmRNdM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184003A9851;
	Thu, 14 May 2026 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747037; cv=none; b=e9nsvIFXjAuivWbbpWMOg2akFOiJVmSM6VOStc//cvxJK1O/NQYlmEk9TEvZszVxW+w7GhBS3dQDgpae5KqkaQim8uUN2+eUQr2kjRLthhAtv0fX01qv7B8V2UtDtG7Hl3RAdZ5ETEtk2Yx18WrhFlXxWSNCMC8tlR8Qw0U1/5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747037; c=relaxed/simple;
	bh=+8waOwkutzpco34bO4oHAgNXAvDP73jd5SxCVCTvcZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4rkHuy+3IL6nPiFGXZ4U5GsF4WSsGGZ0f9CL7mfW1shMNuUN9W+J706RgL+0XQA+lghfRtO+Ijun5B/ANPfGjoXfhp7LfbcwJaqK1GXzMbZ1+m3vwLQlmLcWOfGQe/tEymNF1FrURCyqN74AXitOLqG+Bmlu6eiIMphJnPicBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uqbmRNdM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 638518E0;
	Thu, 14 May 2026 10:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778747024;
	bh=+8waOwkutzpco34bO4oHAgNXAvDP73jd5SxCVCTvcZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqbmRNdMILaeN94ZB+k+x44Fzm0ECjKXuH3vSziAx1WvfrT1L456NbbeCs38XxlV7
	 XzcpC4mXEEyNtTD0YJQgFkSgwoK4ZqeMXMSC/ADuVzbe7XZxMIKJD1o+1xPaIog48f
	 HYSwVCe5fHTqc8QgAiYTqdfrNkkzY/eUWjtDYHbQ=
Date: Thu, 14 May 2026 10:23:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] media: i2c: ov5640: split out the LSC registers
Message-ID: <agWGc0cN8XhFNF2T@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-6-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-6-0869a7802a33@ideasonboard.com>
X-Rspamd-Queue-Id: F34AB53F395
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61573-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Kieran

On Fri, May 01, 2026 at 04:39:08PM +0100, Kieran Bingham wrote:
> Lens shading is a characteristic which is specific to the lens of a
> given module.
>
> Separate the Lens Shading Calibration registers from the init_setting
> to identify the registers which must be updated when changing a lens.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> ---
>
> The ordering of the table entries here are maintained and not resorted
> (i.e. that first line) to make it easy to confirm that no adjustment is
> made to the data here.
>
> I've also moved the LSC 'above' the init table as otherwise the diff
> becomes unreviewable - as it shows a different hunk being conceptually
> moved instead and hides the ability to see what is moving.
>
> Though that itself also confirms that the values don't change here, so
> I'm happy to move it down if requested.
> ---
>  drivers/media/i2c/ov5640.c | 51 +++++++++++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index e1e253730206..b4e1ec4364df 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -522,6 +522,31 @@ static const struct v4l2_mbus_framefmt ov5640_dvp_default_fmt = {
>  	.field = V4L2_FIELD_NONE,
>  };
>
> +static const struct reg_value ov5640_lsc[] = {
> +	/* Lens Shading Correction */
> +	{0x5800, 0x23, 0, 0}, {0x5801, 0x14, 0, 0},
> +	{0x5802, 0x0f, 0, 0}, {0x5803, 0x0f, 0, 0}, {0x5804, 0x12, 0, 0},
> +	{0x5805, 0x26, 0, 0}, {0x5806, 0x0c, 0, 0}, {0x5807, 0x08, 0, 0},
> +	{0x5808, 0x05, 0, 0}, {0x5809, 0x05, 0, 0}, {0x580a, 0x08, 0, 0},
> +	{0x580b, 0x0d, 0, 0}, {0x580c, 0x08, 0, 0}, {0x580d, 0x03, 0, 0},
> +	{0x580e, 0x00, 0, 0}, {0x580f, 0x00, 0, 0}, {0x5810, 0x03, 0, 0},
> +	{0x5811, 0x09, 0, 0}, {0x5812, 0x07, 0, 0}, {0x5813, 0x03, 0, 0},
> +	{0x5814, 0x00, 0, 0}, {0x5815, 0x01, 0, 0}, {0x5816, 0x03, 0, 0},
> +	{0x5817, 0x08, 0, 0}, {0x5818, 0x0d, 0, 0}, {0x5819, 0x08, 0, 0},
> +	{0x581a, 0x05, 0, 0}, {0x581b, 0x06, 0, 0}, {0x581c, 0x08, 0, 0},
> +	{0x581d, 0x0e, 0, 0}, {0x581e, 0x29, 0, 0}, {0x581f, 0x17, 0, 0},
> +	{0x5820, 0x11, 0, 0}, {0x5821, 0x11, 0, 0}, {0x5822, 0x15, 0, 0},
> +	{0x5823, 0x28, 0, 0}, {0x5824, 0x46, 0, 0}, {0x5825, 0x26, 0, 0},
> +	{0x5826, 0x08, 0, 0}, {0x5827, 0x26, 0, 0}, {0x5828, 0x64, 0, 0},
> +	{0x5829, 0x26, 0, 0}, {0x582a, 0x24, 0, 0}, {0x582b, 0x22, 0, 0},
> +	{0x582c, 0x24, 0, 0}, {0x582d, 0x24, 0, 0}, {0x582e, 0x06, 0, 0},
> +	{0x582f, 0x22, 0, 0}, {0x5830, 0x40, 0, 0}, {0x5831, 0x42, 0, 0},
> +	{0x5832, 0x24, 0, 0}, {0x5833, 0x26, 0, 0}, {0x5834, 0x24, 0, 0},
> +	{0x5835, 0x22, 0, 0}, {0x5836, 0x22, 0, 0}, {0x5837, 0x26, 0, 0},
> +	{0x5838, 0x44, 0, 0}, {0x5839, 0x24, 0, 0}, {0x583a, 0x26, 0, 0},
> +	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
> +};
> +
>  static const struct reg_value ov5640_init_setting[] = {
>  	{0x3103, 0x11, 0, 0},
>  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
> @@ -574,27 +599,8 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x548d, 0xcd, 0, 0}, {0x548e, 0xdd, 0, 0}, {0x548f, 0xea, 0, 0},
>  	{0x5490, 0x1d, 0, 0}, {0x5580, 0x02, 0, 0}, {0x5583, 0x40, 0, 0},
>  	{0x5584, 0x10, 0, 0}, {0x5589, 0x10, 0, 0}, {0x558a, 0x00, 0, 0},
> -	{0x558b, 0xf8, 0, 0}, {0x5800, 0x23, 0, 0}, {0x5801, 0x14, 0, 0},
> -	{0x5802, 0x0f, 0, 0}, {0x5803, 0x0f, 0, 0}, {0x5804, 0x12, 0, 0},
> -	{0x5805, 0x26, 0, 0}, {0x5806, 0x0c, 0, 0}, {0x5807, 0x08, 0, 0},
> -	{0x5808, 0x05, 0, 0}, {0x5809, 0x05, 0, 0}, {0x580a, 0x08, 0, 0},
> -	{0x580b, 0x0d, 0, 0}, {0x580c, 0x08, 0, 0}, {0x580d, 0x03, 0, 0},
> -	{0x580e, 0x00, 0, 0}, {0x580f, 0x00, 0, 0}, {0x5810, 0x03, 0, 0},
> -	{0x5811, 0x09, 0, 0}, {0x5812, 0x07, 0, 0}, {0x5813, 0x03, 0, 0},
> -	{0x5814, 0x00, 0, 0}, {0x5815, 0x01, 0, 0}, {0x5816, 0x03, 0, 0},
> -	{0x5817, 0x08, 0, 0}, {0x5818, 0x0d, 0, 0}, {0x5819, 0x08, 0, 0},
> -	{0x581a, 0x05, 0, 0}, {0x581b, 0x06, 0, 0}, {0x581c, 0x08, 0, 0},
> -	{0x581d, 0x0e, 0, 0}, {0x581e, 0x29, 0, 0}, {0x581f, 0x17, 0, 0},
> -	{0x5820, 0x11, 0, 0}, {0x5821, 0x11, 0, 0}, {0x5822, 0x15, 0, 0},
> -	{0x5823, 0x28, 0, 0}, {0x5824, 0x46, 0, 0}, {0x5825, 0x26, 0, 0},
> -	{0x5826, 0x08, 0, 0}, {0x5827, 0x26, 0, 0}, {0x5828, 0x64, 0, 0},
> -	{0x5829, 0x26, 0, 0}, {0x582a, 0x24, 0, 0}, {0x582b, 0x22, 0, 0},
> -	{0x582c, 0x24, 0, 0}, {0x582d, 0x24, 0, 0}, {0x582e, 0x06, 0, 0},
> -	{0x582f, 0x22, 0, 0}, {0x5830, 0x40, 0, 0}, {0x5831, 0x42, 0, 0},
> -	{0x5832, 0x24, 0, 0}, {0x5833, 0x26, 0, 0}, {0x5834, 0x24, 0, 0},
> -	{0x5835, 0x22, 0, 0}, {0x5836, 0x22, 0, 0}, {0x5837, 0x26, 0, 0},
> -	{0x5838, 0x44, 0, 0}, {0x5839, 0x24, 0, 0}, {0x583a, 0x26, 0, 0},
> -	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
> +	{0x558b, 0xf8, 0, 0},
> +

I'm wondering if the empty line here is intentional.
Regardless:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>  	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
>  	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
>  	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
> @@ -2396,6 +2402,9 @@ static int ov5640_restore_mode(struct ov5640_dev *sensor)
>  	ov5640_load_regs(sensor, ov5640_init_setting,
>  			 ARRAY_SIZE(ov5640_init_setting));
>
> +	/* Load the Lens Shading Correction Table */
> +	ov5640_load_regs(sensor, ov5640_lsc, ARRAY_SIZE(ov5640_lsc));
> +
>  	ret = ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
>  			     (ilog2(OV5640_SCLK2X_ROOT_DIV) << 2) |
>  			     ilog2(OV5640_SCLK_ROOT_DIV));
>
> --
> 2.52.0
>
>

