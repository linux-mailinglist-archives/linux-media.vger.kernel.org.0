Return-Path: <linux-media+bounces-61496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMBGAcHDBGoxNwIAu9opvQ
	(envelope-from <linux-media+bounces-61496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:32:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70C538FCF
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2C183008D5D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19FE3A9879;
	Wed, 13 May 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZJC58cJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0E32D6E44
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697148; cv=none; b=MFfChTUOHBwENhbAlCpzngBLh56jYZuAr/paUS7Xxl5P1fT4928UJDrtTjLJssjxC+qEE4dplW5H5NO+fPvTADjmarRUpbBL1DfRlM7lqTSFmYH0ooa7YGwgtKu2a4A5/8Nd689yfvkLmiuNvBAKyRdXLyZCKBjpgfztNjKiQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697148; c=relaxed/simple;
	bh=u5JRG5XfU6If/WcZoYnS0P1yGT4GqSECcyMb3oWX52A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VudW35mYmzUQTP+UwF+bcYE6eHNR8vdqiIh2Iqu8F8ezKHxBkV51fQEJZYWe7KhD0Jve3dRHeZJhSlqmJmAemoiHydwrr7xeTNh0EQcOCkdofH8Ryc5ooyDz2D0VHkbvgo/bpBheRZ48BGnjkqZu2G4HMphb8jadSwth7M2HgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZJC58cJ; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8bb09239328so58983366d6.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778697146; x=1779301946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5PQtScpRYLYS64n5yuVSHFswu1XocSJbgMfVsZcyBT4=;
        b=kZJC58cJQhqR2XHtKrLs7VVfT7/szi2lTakWrtyC8X5wZfYLkW+/4vBcF5MFrWA2sq
         XMS4dHprXK5izhsov/ZQrUu8sg7IlHKsUT/jPoJaxYU4DM7ySAusSmXyJagbGTaxzTm6
         n975RtUbjUnzrCu/04Dsp+72tixIyHV4cPTMBjbsLGxSBOjno1QRDlgaglr2FaRsIYUC
         6QXFbLQCVwVL5OBmxf2oOhbOHGJYay82JIUuzM8s4fZOb+7fuYAELtn/PVm7tALZ5hud
         Toi+r6BcptdPWwSOeJiS2501MBQJKZc3qo7qk55JVuiiuKlVffuaf6uj7K7GdpDO5yUi
         tHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697146; x=1779301946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PQtScpRYLYS64n5yuVSHFswu1XocSJbgMfVsZcyBT4=;
        b=WyVJcH9j7s8mAsK3KvJAVs8/WYfuSD+ddmcsAuITb3Q4JUky8Skr6hI4H9DYx3XAev
         HWoUvMSEaKJZtn+82ezaFeoW/KKq+O0JIJtBOVjiiNYwczbijOh2wRnwdb4V99MK8sep
         /CxvpSnK8VEQ/0tv4fSSmdTOEPo6gjFVJCrWR1ihod895+SbnKCu8iUqavOP+fd4PYEZ
         GCGFSLtZRXU3S4b3ZDPolzTZdXDX79bM0IdsZuLL8AzJBmVfVfkqGnJfUcxwJRZKqTAg
         yiIw62WK80WYZpixxwVnu1CTCHhRlpJficAqsyXvdPm1fEYdbxidyS4gNQJar+BqBWoU
         +BKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZAcCKgeO/M8gEOa/erRw3orTZgPs1iZXIBwlzXcyr/Pg0E4Cf2duu6xjUxdyjYFz9r6caIJZ8bpwjdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw449QzaUkiF4ATWx7gd9aJ9tT24Q9H58TgMn6ZHuQyzjaHNIHg
	akC2tFpY5e9S65DEfVIvwtYiGlUeLdAFjEy7/qmdc5odKnJTUGZo72GT
X-Gm-Gg: Acq92OHCbZj+xwYYOMmo1O6dN5jZOtvYhz5+qav9hH5Q8IvXZ8EOJO6vXHmzR7aCDJY
	EPGyP5LitajZs02rN1UQ6zf5Bi7dFXFMARUF4HVEknqaEjSluN3mmLZaaOrm6mh9hgVNFp8GE+t
	jsoLQM7HxBKaKM99i4hQOENL+6eaFycNcvcD2WU4GeVikkFC97p+vpUXeqWKJiLbJj2ckRgCgQ3
	eNwsAcJpmvn0idurbslR9v5mAIcXcwlsLclSv2KqEwW5faeyXakSNstlXG2sVa+/lo2NXk1kOfO
	jvqKBIpH/IhMIoDqBsU/fZInhE7nueNgYdfzA5Ax3mviXCSzhf0wFBpfBI0nO9qe3r+UliQjBfD
	5Kis12biTEcbmeJb3p06pXLnMftt6rSSRDjjZAMJC9iovN5dOupkZ8s0I2gnik5zPm4rY+x4Ouv
	WdAw3QoXBCHUHoVjUfHQ9s/epNQQ==
X-Received: by 2002:a05:6214:4289:b0:8c2:f420:4d60 with SMTP id 6a1803df08f44-8c7bcfed2e8mr74364196d6.38.1778697145955;
        Wed, 13 May 2026 11:32:25 -0700 (PDT)
Received: from localhost ([142.181.178.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90874e490sm3243946d6.1.2026.05.13.11.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:32:25 -0700 (PDT)
Date: Wed, 13 May 2026 14:33:20 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>,
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 13/13] media: imx355: Support 2 lane readout.
Message-ID: <agTD8L3gZczj8Eu2@rdacayan>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-13-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-13-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 9B70C538FCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61496-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,raspberrypi.com:email]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 07:23:51PM +0100, Dave Stevenson wrote:
> The sensor supports 2 or 4 lane readout, but the driver only allowed
> for 4 lanes. Add 2 lane support.
> 
> The clock tree was set to use single PLL mode to feed both IOP (MIPI)
> and IVT (Pixel array).
> 2 lane mode supports a MIPI link frequency of up to 445MHz (890Mbit/s)
> cf 360MHz (720Mbit/s) for 4lane, but that requires switching to dual
> PLL mode as the rates can't be achieved with simple divisors.
> The LLP values are extended for each mode to account for the increased
> time per line over the MIPI link.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx355.c | 135 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 84 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index d0e0e81d1e7c..fa1d1c86d5b0 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
(snip)
> @@ -1192,13 +1220,18 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>  	if (!cfg)
>  		goto out_err;
>  
> -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
> +	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4)
>  		goto out_err;

Now we know that the sensor supports a configuration with 2 lanes.
Previously, there was a question whether there was a configuration with
a different number of data lanes (from
https://lore.kernel.org/linux-arm-msm/3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org/ ):

	Does IMX355 sensor hardware support any other number of lanes?

	1) If no, then it makes no practical sense to check for data lanes number
	given by firmware, there can be any stored value, but it's known that the
	number of sensor data lanes is 4.

	2) If yes, then please return to the sensor dt bindings, and reflect any
	other options, right now it is set strictly to 4 lanes only. In case if
	'data-lanes' property is omitted, you can use 4 lanes as a default number
	of data lanes, and this information shall be documented in the dt bindings.

We should adjust the dt-bindings to accept a devicetree with 2 lanes.

