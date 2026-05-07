Return-Path: <linux-media+bounces-60824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB3LHzan/GmwSQAAu9opvQ
	(envelope-from <linux-media+bounces-60824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:52:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D6C4EA96E
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DC6830D90A6
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BF83FBEB3;
	Thu,  7 May 2026 14:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mNzhick4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3F38551D;
	Thu,  7 May 2026 14:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165040; cv=none; b=q5gqEVNQeYe2Ktoz4a9LqIZrp/lED5IFmfCTiLqqHIbTtgrRhVDil7ZjEz390PTHwDuYf9rzR12SXaigN1UDWMCNynuTbNzDV1oVNr/fpiaxyeJB29LtCuAUoGpNMqYuhQfzfQ5ZAh2mJwY/MInCmCxuPE6A/sSZxRyFHcULCjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165040; c=relaxed/simple;
	bh=dFo5ElQ6qw6pUQma62PYCL/5UYYz5oIu800eRuqm3C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2ytC5s5kwDuXepD6jl9gaIJJV1cyIZPVGFeFY1tbV2ddlOE7KEzLaDrBhLSuHcQBnbtbliXJDqEyKCaDQyGCuoK+TdQxEwuMvps3cvpP0gRKYvmuhhkztSTJVWe6haKK5OwXr95YorI0wfgSyZighG3sLVC29jwYZxcjpgeCVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mNzhick4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 936BF1253;
	Thu,  7 May 2026 16:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778165029;
	bh=dFo5ElQ6qw6pUQma62PYCL/5UYYz5oIu800eRuqm3C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNzhick4A0XddyFLn+zGG1DzVFmGyXvBlfTblvqHvvoqs179JCKpTgDa2QC6Xkwiq
	 4TPqurE9bVwFk08bSCTEDToNtHrMgmWzFyNjonuH2B92SGT/qBjMjw96Z3hDVJru2b
	 Rt5AIAbQlpuGlgliAcku0YuKEitMY52H0NpbPeSI=
Date: Thu, 7 May 2026 16:43:51 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 11/13] media: imx355: Use pm_runtime autosuspend_delay
Message-ID: <afylG7EdPgGJdMBh@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-11-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-11-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 40D6C4EA96E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60824-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:email]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:49PM +0100, Dave Stevenson wrote:
> Avoid powering the sensor up and down unnecessarily by using
> pm_runtime's autosuspend_delay feature.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx355.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index d8d7cc0ceab9..c6fcd649c32a 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -1068,7 +1068,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  			goto err_rpm_put;
>  	} else {
>  		imx355_stop_streaming(imx355);
> -		pm_runtime_put(imx355->dev);
> +		pm_runtime_put_autosuspend(imx355->dev);
>  	}
>
>  	/* vflip and hflip cannot change during streaming */
> @@ -1080,7 +1080,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>
>  err_rpm_put:
> -	pm_runtime_put(imx355->dev);
> +	pm_runtime_put_autosuspend(imx355->dev);
>  err_unlock:
>  	mutex_unlock(&imx355->mutex);
>
> @@ -1431,6 +1431,8 @@ static int imx355_probe(struct i2c_client *client)
>  	pm_runtime_set_active(imx355->dev);
>  	pm_runtime_enable(imx355->dev);
>  	pm_runtime_idle(imx355->dev);
> +	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
> +	pm_runtime_use_autosuspend(imx355->dev);
>
>  	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
>  	if (ret < 0)
>
> --
> 2.34.1
>
>

