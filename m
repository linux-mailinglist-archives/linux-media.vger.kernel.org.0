Return-Path: <linux-media+bounces-43906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AABCBC377D
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 08:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 883EB3BE421
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 06:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DBB28C5DE;
	Wed,  8 Oct 2025 06:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyMJn8dA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584EE2E03EB;
	Wed,  8 Oct 2025 06:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904682; cv=none; b=JV2ytI6k029jE800571v/F2WZdl4b6+ZGFnOQNgovYFZputgT6yrRIhjyekqc6kgsv8cmVP6vGfcPO44dRlaH1p1I5sZTBBcmFdrXN/TaCpREkw/vYQdeRqJz+fd4I5kNoUqAdW3WXlkGOQc2vqX7p3vzvHHFmubUwgcFMUmNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904682; c=relaxed/simple;
	bh=XEFGm+iMDKQIFqpoWeiQG2kDqerGGDmwwxtStSAMB6k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iRGJkOQbnJtTTjleYvzi1+K8fRelvLx8tUxt6IDNT7nJH1Ki3RldlqRTot5Hadylj1Wk8rAA2IAUH+IhV/JKgLu4L1fKhBTGuYyYMvQLzx9PebAijU4wxd+sWx+AYsahbjlXpwFpanmiyaeke4onICigwIvKifcmDjhVYA+pBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyMJn8dA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24340C4CEF4;
	Wed,  8 Oct 2025 06:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759904682;
	bh=XEFGm+iMDKQIFqpoWeiQG2kDqerGGDmwwxtStSAMB6k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=IyMJn8dAptZaOcSyiFQEWZ/mgLXh9MGfgHo75QBHsAAR20ZBX5W4jLVcoL+MD6ZX3
	 E6zS3e303kEpM7ijbN4+F8pPUXYitZc/J6fqdk78byLHIdJAOShn4ynbO663Ne/q6H
	 cU/169SNszoKKOvaw4CCFRbjxckSJbyzJGVM3T8exmdXwF8W40Q+qjP8Ldgp8sx84T
	 AZyehTxqPRz9kIjAqgvTAcWpKDFigE9CRH9U4KEY2jLNwDqGpg6HkT8VmIjVa3vUYa
	 a/e6u/LD0F2eQa0F7FqcKsjMWZgQCeBnw3Lus7Xt+nQSaOKM8Ngac59fB+GWSb0pvC
	 7o3xzmQARWfEg==
Message-ID: <50a789ce-bc76-451b-81e4-2286683f6a17@kernel.org>
Date: Wed, 8 Oct 2025 08:24:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 2/3] media: radio: si470x: Fix DRIVER_AUTHOR macro
 definition
To: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, Malcolm Priestley <tvboxspy@gmail.com>,
 Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-2-kees@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251008035938.838263-2-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2025 05:59, Kees Cook wrote:
> The DRIVER_AUTHOR macro incorrectly included a semicolon in its
> string literal definition. Right now, this wasn't causing any real
> problem, but coming changes to the MODULE_INFO() macro make this more
> sensitive. Specifically, when used with MODULE_AUTHOR(), this created
> syntax errors during macro expansion:
> 
>     MODULE_AUTHOR(DRIVER_AUTHOR);
> 
> expands to:
> 
>     MODULE_INFO(author, "Joonyoung Shim <jy0922.shim@samsung.com>";)
>                                                                   ^
>                                                        syntax error
> 
> Remove the trailing semicolon from the DRIVER_AUTHOR definition.
> Semicolons should only appear at the point of use, not in the macro
> definition.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

> ---
> Cc: Hans Verkuil <hverkuil@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Cc: <linux-media@vger.kernel.org>
> ---
>  drivers/media/radio/si470x/radio-si470x-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
> index cdd2ac198f2c..3932a449a1b1 100644
> --- a/drivers/media/radio/si470x/radio-si470x-i2c.c
> +++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
> @@ -10,7 +10,7 @@
>  
>  
>  /* driver definitions */
> -#define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>";
> +#define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>"
>  #define DRIVER_CARD "Silicon Labs Si470x FM Radio"
>  #define DRIVER_DESC "I2C radio driver for Si470x FM Radio Receivers"
>  #define DRIVER_VERSION "1.0.2"


