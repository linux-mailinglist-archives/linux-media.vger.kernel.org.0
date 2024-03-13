Return-Path: <linux-media+bounces-6981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B13AC87A516
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 10:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C5B1F21F11
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 09:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCC820B3D;
	Wed, 13 Mar 2024 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BWIsLizc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE821798C
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710322836; cv=none; b=SwDarcb1pQ+qW/5x/Oxq6euttPi5r5TEvPgtfFDXKZAuijA5G45IWaX186P7PzfuMIaRXP0mSx0gLRYGPFv0ybMuJCjtA7OJC+7ZA8nZnYJwkTsOpRzwt6ZdjjUrwdgcaDcFsmI95tDupxeTzCstLCJwMlPAhi52R48Dk8TDLZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710322836; c=relaxed/simple;
	bh=uWdxNR0l47efwcSWGCnh52hhCvuS4pDYYJrfqE8GyF8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pDElg0dchPvJyY5ZVaCb1opp9lnm+Fbj+5E5nMsH8FIy1tCR9RfgCX9/SuTZJNG7fypWTO+3SzKoJH4c3nRuRySofSJAVDEC/cWBmGm+dmUu8nSBpodF4Bn83dqdOn5hqJVak6XaSQTZNkLEaBE6HPftg8Dpwr9NKocJJoZxklU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BWIsLizc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52FEB720;
	Wed, 13 Mar 2024 10:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710322268;
	bh=uWdxNR0l47efwcSWGCnh52hhCvuS4pDYYJrfqE8GyF8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BWIsLizcJFHWWIV1TBsrkg9AbEwht57GwHasfh0zzkTXvyNPyJ9xbEIxqeoKFuO9P
	 Po/J1AGSvR09qduSplbgBXoECP9j7kK49yCjoEY1qSt/LgUAHk2yGcotKzxZFGaqzd
	 K/pb0Nz4kyviCQB+mqAE76dha0IfmraxydIuTkUo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240313072516.241106-19-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com> <20240313072516.241106-19-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v8 18/38] media: ccs: No need to set streaming to false in power off
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl, Andrey Konovalov <andrey.konovalov@linaro.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Dmitry Perchanov <dmitry.perchanov@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 13 Mar 2024 09:31:27 +0000
Message-ID: <171032228781.3710789.18168037788329287072@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Sakari Ailus (2024-03-13 07:24:56)
> Streaming will have been stopped by the sensor is powered off, and so

by the time the sensor

or

before the sensor

> sensor->streaming is also false already. Do not set it as part of the
> runtime suspend callback.
>=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs=
-core.c
> index e21287d50c15..671540a8ab6a 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1710,7 +1710,6 @@ static int ccs_power_off(struct device *dev)
>         usleep_range(5000, 5000);
>         regulator_bulk_disable(ARRAY_SIZE(ccs_regulators),
>                                sensor->regulators);
> -       sensor->streaming =3D false;
> =20
>         return 0;
>  }
> --=20
> 2.39.2
>

