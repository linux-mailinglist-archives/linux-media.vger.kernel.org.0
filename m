Return-Path: <linux-media+bounces-14238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12791A4E4
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 668301F214A8
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 11:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0409149C60;
	Thu, 27 Jun 2024 11:17:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EB41487DF;
	Thu, 27 Jun 2024 11:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487079; cv=none; b=mnGl4TGnfOAku8j1/EGnxVB4mL8xXhmMOWvYJMkJ2wmYkaRk8kT3nhhwc2enmHQJ26OaO+3SpmkepiZLmXRi0iO5l3M2j3Fc6rSfCoJ5EpMjVUcEC085QL38GZof/9OcDMvWGi10N12BIggl4WBITR6k09RlBLESI2jI6C8Pqq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487079; c=relaxed/simple;
	bh=Uw/ST8RwoFKi35yz0tv1FTezFhU4uD4p5g3xrk6hzdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpwfY34d/qHq6z20eVPGn3WjBp2qKvW9x3iG3oEWgbBNDQ1KWALWP3yu3cOsFH++rKvjgmEMYB1Kvb4ddf9laAm2eB5egQzLp8oCkC2lVqFyzVxfuQHqPH8/b3EtmNhUDVAdqwfPSV+fVuv53gkZzBbKZ2YvQJMrTpJD8fy9vfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D731CC32786;
	Thu, 27 Jun 2024 11:17:56 +0000 (UTC)
Message-ID: <8587b6cd-2d04-4a2e-b298-e57c792332f1@xs4all.nl>
Date: Thu, 27 Jun 2024 13:17:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: stm32: dcmipp: correct error handling in
 dcmipp_create_subdevs
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: stable@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240624084123.3009122-1-alain.volmat@foss.st.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240624084123.3009122-1-alain.volmat@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2024 10:41, Alain Volmat wrote:
> Correct error handling within the dcmipp_create_subdevs by properly
> decrementing the i counter when releasing the subdeves.
> 
> Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index 4acc3b90d03a..4924ee36cfda 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -202,7 +202,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
>  	return 0;
>  
>  err_init_entity:
> -	while (i > 0)
> +	while (i-- > 0)
>  		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
>  	return ret;
>  }

I accidentally merged this one, but this patch isn't right.

After this change the [i - 1] indices should be changed to [i].
If i == 1, then the while condition is true, but now i == 0 in the
actual statement, so you access out-of-bounds values.

I decided to revert it, since it is better to just get stuck in the
while loop, then to crash.

But a new patch is needed for this.

Regards,

	Hans

