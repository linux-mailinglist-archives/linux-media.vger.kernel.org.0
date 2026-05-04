Return-Path: <linux-media+bounces-60232-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOM8EY08+GkArwIAu9opvQ
	(envelope-from <linux-media+bounces-60232-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:28:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD04B8E4C
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D64453021E89
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720DD2BE65B;
	Mon,  4 May 2026 06:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVRgQ9cL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F5291864;
	Mon,  4 May 2026 06:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777876009; cv=none; b=S2FF5xbVu+huQfHOgwM1Ov+wysQwg58B1dcguxrO80K5+fLks9W7C4aKJozaTdEgfWzahCRkMZBzdFFjAA02iOt9Ktw9sZJv9ITDJ7uyd8KfrtfiCd9ZjAH/MPJkl1/fHmKIQYFvr8knXpmJpS+9AF4gthqJ71YerH6j4i0C41o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777876009; c=relaxed/simple;
	bh=w8uW0JIMf6iNf9fhLKflxzuTV4K4KD7+m7fDNu8iGLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxJ7yDMU95U68paHzZGOyTjBoCDWCm9j45GX7pkVennfR+5ez2T5b8n+z4P16r/yk/PH3BX1+lN2gi7Oj/usoKrs10oa35xrjK4aseHMGuqO5hARDEXr2IkHl/wZDh6cq/F9LM7jPUs1md06jKcT1R6WkyYxS6ZzlNmrx2601tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVRgQ9cL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777876008; x=1809412008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w8uW0JIMf6iNf9fhLKflxzuTV4K4KD7+m7fDNu8iGLw=;
  b=TVRgQ9cLaBJNEwc+/ru6CygxZTM2KjUoUQBJPAXsZIumOKF36oWKeQbV
   b5o3shYG94IVwawSOtcwWQz3gBSZIWMNYpmy9esC71naqA+zrhZuFJ+f4
   0gGx9ADf9NCS02ibvrDX3PfKbmXIrYCKYnDuyhivQW8PgHodBGogMx1Ce
   JYQMEYx3Ljl+2wCMTpJfvubabDNHHB+WA4V5ma4fEv+tT9YnN9Do/Ydot
   kL69BjAPgN77RCFSJWKMvzaUAl7McyBCFL9FESMOu9lngUML0VVyHCfC/
   QAktZvk6YLA8zYCDXt8xlO5C1gF4dkrDYm+wnhxIZ67/8R2pwNqIq7mls
   w==;
X-CSE-ConnectionGUID: jVzM9yVbTu6xAciVC7M9yA==
X-CSE-MsgGUID: sNg0SN9hQxCwHxaXIyH21Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="90190315"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="90190315"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:26:47 -0700
X-CSE-ConnectionGUID: lNXbd6M3QAyE5RqfuQjf3w==
X-CSE-MsgGUID: 98alwmYYRE6KNl0VD4jUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240417519"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:26:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7BD47121CC4;
	Mon, 04 May 2026 09:26:44 +0300 (EEST)
Date: Mon, 4 May 2026 09:26:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 3/6] media: i2c: lm3560: Optimize mutex lock usage
Message-ID: <afg8JPS3KGMO4xj9@kekkonen.localdomain>
References: <20260503164445.215540-1-clamor95@gmail.com>
 <20260503164445.215540-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503164445.215540-4-clamor95@gmail.com>
X-Rspamd-Queue-Id: A6BD04B8E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60232-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_SENDER_MAILLIST(0.00)[]

Hi Svyatoslav,

On Sun, May 03, 2026 at 07:44:42PM +0300, Svyatoslav Ryhel wrote:
> Pass the device's own mutex lock to the control handler so that the media
> framework can handle control access instead of managing it manually. The
> lock must be common to both sub-devices since they share same hardware,
> so the individual sub-device locks will not work here.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/lm3560.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> index edfb07587cab..5b568ed9536b 100644
> --- a/drivers/media/i2c/lm3560.c
> +++ b/drivers/media/i2c/lm3560.c
> @@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
>  	int rval = -EINVAL;
>  
> -	mutex_lock(&flash->lock);
> -
>  	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
>  		s32 fault = 0;
>  		unsigned int reg_val;
>  		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
>  		if (rval < 0)
> -			goto out;
> +			return rval;
>  		if (reg_val & FAULT_SHORT_CIRCUIT)
>  			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
>  		if (reg_val & FAULT_OVERTEMP)
> @@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  		ctrl->cur.val = fault;
>  	}
>  
> -out:
> -	mutex_unlock(&flash->lock);
>  	return rval;
>  }
>  
> @@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  	u8 tout_bits;
>  	int rval = -EINVAL;
>  
> -	mutex_lock(&flash->lock);
> -
>  	switch (ctrl->id) {
>  	case V4L2_CID_FLASH_LED_MODE:
>  		flash->led_mode = ctrl->val;
> @@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  	case V4L2_CID_FLASH_STROBE_SOURCE:
>  		rval = regmap_update_bits(flash->regmap,
>  					  REG_CONFIG1, 0x04, (ctrl->val) << 2);
> -		if (rval < 0)
> -			goto err_out;
>  		break;
>  
>  	case V4L2_CID_FLASH_STROBE:
>  		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
>  			rval = -EBUSY;
> -			goto err_out;
> +			break;
>  		}
>  		flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
>  		rval = lm3560_mode_ctrl(flash);
> @@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  	case V4L2_CID_FLASH_STROBE_STOP:
>  		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
>  			rval = -EBUSY;
> -			goto err_out;
> +			break;
>  		}
>  		flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
>  		rval = lm3560_mode_ctrl(flash);
> @@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  		break;
>  	}
>  
> -err_out:
> -	mutex_unlock(&flash->lock);
>  	return rval;
>  }
>  
> @@ -328,6 +318,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
>  	if (fault != NULL)
>  		fault->flags |= V4L2_CTRL_FLAG_VOLATILE;
>  
> +	hdl->lock = &flash->lock;
> +
>  	if (hdl->error)
>  		return hdl->error;
>  
> @@ -363,6 +355,7 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
>  	if (rval < 0)
>  		goto err_out;
>  	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
> +	flash->subdev_led[led_no].state_lock = &flash->lock;

I must have missed it earlier but you can use the control handler's mutex
here. As a result, I believe you can drop the driver's own mutex
altogether.

>  
>  	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
>  	if (rval < 0) {

-- 
Kind regards,

Sakari Ailus

