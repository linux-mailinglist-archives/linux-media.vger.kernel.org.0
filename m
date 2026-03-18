Return-Path: <linux-media+bounces-56178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPZIGYZWumm8UQIAu9opvQ
	(envelope-from <linux-media+bounces-56178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:38:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D019F2B7137
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CE0E30837C5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 07:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0315A36AB69;
	Wed, 18 Mar 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0JtHI5f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9435CB6B;
	Wed, 18 Mar 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819378; cv=none; b=T5M3l2Mlg7hcc8bUhv4VAH9kKckkUwIYt5PARI7bJZmw6/IEOvWHuIbRKuKQuxHgyx+ylR5H6vyjtLpurwV2S5JugELuUFPsfy6V1pComPzw4Hbj5WX9ch+pbEKVb68ecS0w2CzNnfsitQ70CWsGg2OR+z7HGAWYiH198UJuPoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819378; c=relaxed/simple;
	bh=GZIUqlYPlwfU8BXVTeU8VMCL99u9Q05TQTUTM6IjGnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THQBwtKPeZs6+0GfnINdW05xoQFjxgcnUG3ABwzQnIlCeZO+JHEnWGnw0T3sVwrKoYA2JLkNvQ41p+9WxzjAVw5EfOzBXEVGBnx+rsIeF1iAGK7Cf8uYzlR2yMu+Qb3hc/Wmr0QWsyM5/YDoky6HBmrJdAqbVjQ28ZRGCd/Arw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0JtHI5f; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773819377; x=1805355377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZIUqlYPlwfU8BXVTeU8VMCL99u9Q05TQTUTM6IjGnU=;
  b=i0JtHI5fsRVBgfJOfAQbCEiBy2CecItL8CrkeIyjzzc3lsY6OWnEG1Ch
   RrotyCbGtLH/I2IKYDLBQBgAEth3bl0Xz05W9WTOv/7Ye6HGzXvUgJk4+
   +y6W487zZUaNrQZzuJrCC7n/I+w0uYiA1uiAJGhJHI3Vd/ZrvV3XV956X
   Xv+tssAMa/7WNIegKRMHj6vLOpalYkU25r56tCi1YdRnH+NSto/5wLElH
   HZHaYcVf2pslUiv7OjcIFEFBebaRoz/1wYT23qXTnKAAKfMLJJ8zfa8Zm
   h81wLMCPIuunzwnx4lrsYFSHq28Hwi0BnjupyuqAsL+pnAlwbKkJAVISw
   A==;
X-CSE-ConnectionGUID: Vd1+f/gSSqap3Px1+vD50w==
X-CSE-MsgGUID: eYJuGcHHTESfmN6oQnxmsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="73886172"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="73886172"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 00:36:16 -0700
X-CSE-ConnectionGUID: 23duq9FzSNu6AGgW5mDkNg==
X-CSE-MsgGUID: pK1sfa1eQrSnYhBN9xBE+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222510865"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.243])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 00:36:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 49131121D3D;
	Wed, 18 Mar 2026 09:36:10 +0200 (EET)
Date: Wed, 18 Mar 2026 09:36:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: laurent.pinchart@ideasonboard.com, tarang.raval@siliconsignals.io,
	jacopo@jmondi.org, mchehab@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
	jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: ov9282: Add test pattern control
Message-ID: <abpV6lostuZsndYw@kekkonen.localdomain>
References: <20260318051618.471375-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318051618.471375-1-xiaolei.wang@windriver.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56178-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,linuxtv.org:url,windriver.com:email]
X-Rspamd-Queue-Id: D019F2B7137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xiaolei,

Thanks for the update.

On Wed, Mar 18, 2026 at 01:16:18PM +0800, Xiaolei Wang wrote:
> Add V4L2_CID_TEST_PATTERN control with bar and solid white patterns.
> Since the OV9282 is a monochrome sensor, white is more useful than
> black for solid pattern testing.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
> 
> Changes in v2:
>  - Rename to "Bar" / "Solid White" since OV9282 is a monochrome
>    sensor (Dave)
>  - Use cci_write instead of cci_update_bits (Dave)
>  - Default solid pattern to white (Dave)
>  Link to v1: https://patchwork.linuxtv.org/project/linux-media/patch/20260316090558.1537823-1-xiaolei.wang@windriver.com/
> 
>  drivers/media/i2c/ov9282.c | 61 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 2167fb73ea41..85f612e7ab28 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -104,6 +104,17 @@
>  #define OV9282_REG_STROBE_FRAME_SPAN		CCI_REG32(0x3925)
>  #define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
>  
> +/* Test Pattern registers */
> +#define OV9282_REG_TEST_PATTERN_BAR	CCI_REG8(0x5e00)
> +#define OV9282_TEST_PATTERN_BAR_EN	BIT(7)
> +#define OV9282_REG_TEST_PATTERN_SOLID	CCI_REG8(0x4320)
> +#define OV9282_TEST_PATTERN_SOLID_EN	BIT(1)
> +#define OV9282_TEST_PATTERN_SOLID_DEFAULT	0x80
> +#define OV9282_REG_SOLID_P1		CCI_REG16(0x4322)
> +#define OV9282_REG_SOLID_P2		CCI_REG16(0x4324)
> +#define OV9282_REG_SOLID_P3		CCI_REG16(0x4328)
> +#define OV9282_REG_SOLID_P4		CCI_REG16(0x4326)
> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE	24000000
>  
> @@ -462,6 +473,18 @@ static const struct ov9282_mode supported_modes[] = {
>  	},
>  };
>  
> +enum {
> +	OV9282_TEST_PATTERN_DISABLED,
> +	OV9282_TEST_PATTERN_BAR,
> +	OV9282_TEST_PATTERN_SOLID_WHITE,
> +};
> +
> +static const char * const ov9282_test_pattern_menu[] = {
> +	"Disabled",
> +	"Bar",
> +	"Solid White",
> +};
> +
>  /**
>   * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
>   * @subdev: pointer to ov9282 V4L2 sub-device
> @@ -586,6 +609,32 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>  	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
>  }
>  
> +static int ov9282_set_ctrl_test_pattern(struct ov9282 *ov9282, int pattern)
> +{
> +	int ret;
> +
> +	ret = cci_write(ov9282->regmap, OV9282_REG_TEST_PATTERN_BAR,
> +			pattern == OV9282_TEST_PATTERN_BAR ?
> +			OV9282_TEST_PATTERN_BAR_EN : 0, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (pattern == OV9282_TEST_PATTERN_SOLID_WHITE) {
> +		/* Set all four pixel values to 0x3ff (white) */
> +		cci_write(ov9282->regmap, OV9282_REG_SOLID_P1, 0x3ff, &ret);
> +		cci_write(ov9282->regmap, OV9282_REG_SOLID_P2, 0x3ff, &ret);
> +		cci_write(ov9282->regmap, OV9282_REG_SOLID_P3, 0x3ff, &ret);
> +		cci_write(ov9282->regmap, OV9282_REG_SOLID_P4, 0x3ff, &ret);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return cci_write(ov9282->regmap, OV9282_REG_TEST_PATTERN_SOLID,
> +			 pattern == OV9282_TEST_PATTERN_SOLID_WHITE ?
> +			 OV9282_TEST_PATTERN_SOLID_DEFAULT | OV9282_TEST_PATTERN_SOLID_EN :
> +			 OV9282_TEST_PATTERN_SOLID_DEFAULT, NULL);

As OV9282_TEST_PATTERN_SOLID_DEFAULT isn't conditional, you can keep it out
of the ternary operator.

> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -662,6 +711,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_FLASH_DURATION:
>  		ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
>  		break;
> +
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov9282_set_ctrl_test_pattern(ov9282, ctrl->val);
> +		break;
> +
>  	default:
>  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>  		ret = -EINVAL;
> @@ -1242,7 +1296,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	u32 lpfr;
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
>  	if (ret)
>  		return ret;
>  
> @@ -1314,6 +1368,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  				  V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
>  				  OV9282_STROBE_FRAME_SPAN_DEFAULT);
>  
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov9282_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov9282_test_pattern_menu) - 1,
> +				     0, 0, ov9282_test_pattern_menu);
> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
Regards,

Sakari Ailus

