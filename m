Return-Path: <linux-media+bounces-53324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M6dNynPnmnwXQQAu9opvQ
	(envelope-from <linux-media+bounces-53324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 11:30:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52422195C5E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 11:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 397A430790A5
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 10:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0866E39283D;
	Wed, 25 Feb 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E3D+Toiu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37661F09B3;
	Wed, 25 Feb 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015272; cv=none; b=LJoV1XMtOkRD05miEez6UNfIlroXcmh69VLUb4/X6COb3t6Nk7TfIjHnGlNOIKwUJxD32iEXdU3u+S4LGGHCHKfxTHAJJ2+Zar2pzF6NV4j47Njf8UUiDdTS0LNJP4WxV0e3PClHk65+mzfTpLYyNUAc8Md6enJRl0ux/eYauXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015272; c=relaxed/simple;
	bh=5Q73fS3LK+prOMnlhYI+ruwH86dKsKgpwqhRpGzoXuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9kRFStvl2GJoDMpyl0WwsbAgORj5EUebvmw6BN0tF2cfdHD62Q6Q+fnej1EVqwQqvWs5N57Z6x4FF9VqrEILySyVjZ9nKDYzc8uRFsmKRQu/wDrP6lb9t5fTSBWdD2BG4hXpMunfmT+uKg4uZbs3nXV6SmLpFd8t16nPfs4eTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E3D+Toiu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65B60E47;
	Wed, 25 Feb 2026 11:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772015211;
	bh=5Q73fS3LK+prOMnlhYI+ruwH86dKsKgpwqhRpGzoXuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3D+ToiuW3oRIRWPDQc+THsjwRcj9Dohoble6QRDZT0NqlVixdb1LLK5WHZvXjjvk
	 6Z2Ddp1iaFOmC3ZT/fG1mrHpM+m3/bL7Q9kyYHGh0sWiDunzhQbkoJnse1TAPdFMxg
	 H+gSxZcupQXy3CX8dbhl6Rt4pPu3gurwkkCvWLYM=
Date: Wed, 25 Feb 2026 11:27:37 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io, 
	laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com, jacopo@jmondi.org, 
	mchehab@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	hverkuil+cisco@kernel.org, johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl, 
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5647: Fix runtime PM refcount leak in
 s_ctrl
Message-ID: <aZ7Og9Uq9tCMLi2U@zed>
References: <20260225085621.1756643-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225085621.1756643-1-xiaolei.wang@windriver.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53324-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 52422195C5E
X-Rspamd-Action: no action

Hello Xiaolei

On Wed, Feb 25, 2026 at 04:56:21PM +0800, Xiaolei Wang wrote:
> Three control cases (AUTOGAIN, EXPOSURE_AUTO, ANALOGUE_GAIN) directly
> return without calling pm_runtime_put(), causing runtime PM reference
> count leaks.
>
> Change these cases from 'return' to 'ret = ... break' pattern to ensure
> pm_runtime_put() is always called before function exit.
>
> Fixes: 4f66f36388d5 ("media: i2c: ov5647: Convert to CCI register access helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/ov5647.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 6a46ef7233ac..db9bd2892140 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -967,21 +967,21 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_AUTOGAIN:
>  		/* Non-zero turns on AGC by clearing bit 1.*/
> -		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
> -				       ctrl->val ? 0 : BIT(1), NULL);
> +		ret = cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
> +				      ctrl->val ? 0 : BIT(1), NULL);
>  		break;
>  	case V4L2_CID_EXPOSURE_AUTO:
>  		/*
>  		 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
>  		 * clearing bit 0.
>  		 */
> -		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
> -				       ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
> +		ret = cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
> +				      ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
>  		break;
>  	case V4L2_CID_ANALOGUE_GAIN:
>  		/* 10 bits of gain, 2 in the high register. */
> -		return cci_write(sensor->regmap, OV5647_REG_GAIN,
> -				 ctrl->val & 0x3ff, NULL);
> +		ret = cci_write(sensor->regmap, OV5647_REG_GAIN,
> +				ctrl->val & 0x3ff, NULL);
>  		break;
>  	case V4L2_CID_EXPOSURE:
>  		/*
> --
> 2.43.0
>

