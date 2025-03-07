Return-Path: <linux-media+bounces-27844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2857AA5709F
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 19:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 651DB7A44F6
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 18:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19A22417C3;
	Fri,  7 Mar 2025 18:36:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4861474A9;
	Fri,  7 Mar 2025 18:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741372576; cv=none; b=PbcTOpA5ErBFItVgMPnvVtMGrHIrUttdkqXUIxz2RSVEVek50woGRQOaLlHlTcu8wwt0cqgzAoE67jl1GaiQDmZMsLWJvsbXISYCFHPuZwDmiv4I1WCyLicJXsl2PQ79buLJUq/ei7ZXBiKeg+/h3r8IydcSJAc3ZIppvojGh30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741372576; c=relaxed/simple;
	bh=4NlH+RceHTERjoz+LQcLcSCScyDEwmRA9I5DxzEAGLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQW0mVtpkwOz2jgcqTKmyzH97iPiWYjairKJYy5QH6gqFdcw2cleagDnFK97houjUspxRK4VNB6BXeH6rZBnUEAZ60VkD2DqYEVPZuoeFgvTMBgQTJtFYKDQ9UYrP9YCyGu7o2XFgtaJ5oG2MuQN/P0+oTFE4lYG5sMsjE3Vyw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.15] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id E708C5D0A2;
	Fri, 07 Mar 2025 19:27:16 +0100 (CET)
Message-ID: <d46f9862-ecb2-4e8c-86de-7dcc31bb77d1@gpxsee.org>
Date: Fri, 7 Mar 2025 19:27:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: pci: mgb4: include linux/errno.h
To: Arnd Bergmann <arnd@kernel.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250307102431.73506-1-arnd@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20250307102431.73506-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07. 03. 25 11:24 dop., Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The errno.h header is not always included indirectly, leading
> to rare randconfig build warnings.
> 
> drivers/media/pci/mgb4/mgb4_regs.c:20:11: error: use of undeclared identifier 'EINVAL'
>     20 |                 return -EINVAL;
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/media/pci/mgb4/mgb4_regs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
> index 31befd722d72..b45537dbfafa 100644
> --- a/drivers/media/pci/mgb4/mgb4_regs.c
> +++ b/drivers/media/pci/mgb4/mgb4_regs.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/ioport.h>
> +#include <linux/errno.h>
>   #include "mgb4_regs.h"
>   
>   int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)

Acked-by: Martin Tůma <martin.tuma@digiteqautomotive.com>


