Return-Path: <linux-media+bounces-32518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0B2AB70FE
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 18:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C232A4A1D25
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 16:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5216F1DF27C;
	Wed, 14 May 2025 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VJ8/jxmT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EA741C7F;
	Wed, 14 May 2025 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239375; cv=none; b=HnJWe8J4lNWVSxjK2TblyVVbXvbfRlgHgaclw00L9eXjQczxHg8yaiYffmkQ+O3lqPPDQ/VvDFCNpg8pOfHE9dlO7+aY4j7hzseDAwhMzl6PMUUDMYoroNIx69C0kLEl3K3xVE17kgfOJJuNfgD7el9SDsgULqcilUwqwE/lhX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239375; c=relaxed/simple;
	bh=L56BHg7idQInNPACvdXlMxVfabEdIqucYp+BwdLRpRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBZNNJBY0Yep0icxzbeasNlDtDbvApTMZIWLkca4H6JiUp+zrezFCU39eU1/dMpOz26Xv974wx3vXyMJ0e6WGUkk6Z/T5P+JlNar1QEzuea9+epnkyZjiJjPE80ooIWUof4AiCDRMSoYDScDYmMEj2TZJVTuPAHkhcSnYS4EKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VJ8/jxmT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747239371;
	bh=L56BHg7idQInNPACvdXlMxVfabEdIqucYp+BwdLRpRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VJ8/jxmT0KYTMC1m66xSDfazeaaGbaktNYbLyMSS6DpuTRumu/b+yhz+lo/xURPvD
	 osduEWzKC8asqNi0+cGkLVKlwRwic1kAXMysIK6y1p+Nhtz+eBJYlrZtZARGNV8z4F
	 Oty4Y37A0RFLspWtATxRce3S2ATWQD4aBuQjGOOwRzg0kwMygmuYraRVeWkKwy3CTM
	 JWvEhMrshMFtx7gPiYGXqxcas1dUC4ke1fE2OMFj0PowRO4Qgj9khoebTCbuH+Apn4
	 Um4wNauKGtMuMiQOStajteiV52cbKUgJgBQLS0LI+Qje95025d4XYxxskVX2RYyvB9
	 bnG6B9t07O4eQ==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B72C17E0CD1;
	Wed, 14 May 2025 18:16:11 +0200 (CEST)
Message-ID: <ced4b6b2-69c4-4d84-ab8b-7360d2b80ebb@collabora.com>
Date: Wed, 14 May 2025 18:16:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx415: Request the sensor clock without a
 name
To: Matthias Fend <matthias.fend@emfend.at>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250514-imx415-v1-1-bb29fa622bb1@emfend.at>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20250514-imx415-v1-1-bb29fa622bb1@emfend.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Matthias,

Thanks for giving this patch a spin.

FTR some context here:
https://lore.kernel.org/all/20241130141716.1007115-1-matthias.fend@emfend.at/

On 5/14/25 12:51, Matthias Fend wrote:
> Request the sensor clock without specifying a name so that the driver
> behaves as described in the imx415 bindings.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  drivers/media/i2c/imx415.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 9f37779bd6111f434c198ad1cf70c14b80724042..278e743646ea15819d5a79577e786b47c259dbfa 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1251,7 +1251,7 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
>  		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
>  				     "failed to get reset GPIO\n");
>  
> -	sensor->clk = devm_clk_get(sensor->dev, "inck");
> +	sensor->clk = devm_clk_get(sensor->dev, NULL);
>  	if (IS_ERR(sensor->clk))
>  		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
>  				     "failed to get clock\n");
> 
> ---
> base-commit: 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
> change-id: 20250514-imx415-c65889e55211
> 
> Best regards,


