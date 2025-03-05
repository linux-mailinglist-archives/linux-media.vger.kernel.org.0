Return-Path: <linux-media+bounces-27661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2241FA50CB3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 21:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3C627A334B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 20:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414502566DB;
	Wed,  5 Mar 2025 20:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cas72uP4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BB1FC12
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741207460; cv=none; b=Bj5J6TxdXVEhxOxmZvL3AusAGpa948Z2Zi1N61AWbCwIWw9FgkDzJYc+zZPRQdujsu4X6t8ZuoU6osPWwd+lEjCf1dd2pM9o5qFfdaIqiKAvTbg3WUtHgKUlCidoqNkT+juH5zqiS+JM4thYkyfQn9eSCJFeN/leV9GmroXoQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741207460; c=relaxed/simple;
	bh=uBiu/q+tZsa0gP4L7tZmIGYWrBiby7aTZSxyh/yRlQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsHOWqUcLZC+1CIqDOZzgiSEyK06ileTPp+cACxVYV2gHD9tRFyTNy9Mp0xo3KbhRs44p71W3Oo/Y4iwl3S9IT4P65QHmYQMn8e02P0N57d7vcAiJUzhJSyYKD7DbNwYzUBnpgbnfASUknkM5GWgWgsLu38tn2MRieYVkX9BGOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cas72uP4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30ba563a6d1so14736741fa.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 12:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741207456; x=1741812256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNdiW6NwgPN019oEVN4C32QrEjKTlign/S0WBpecrZc=;
        b=cas72uP47srT3rT/xE/UP1wwgiw4uBleT9VzbILnEtYmFx37KrEtEDI3PTojoJdrM3
         GBlESaiaUh1Cre7NdDMa5rhkiczA6jWJwtWeJxxIA+MaHQptyYmR7WutZM4fhJK3auow
         BU/gWu5NawElIEbamBuZcDyvYyMZPyMnmEcVt/vFBVEO9vYMc1gOi/OjoXrGX9C9eDG9
         IBJJlG4eOi35pRCS2qIIxsY/ISLob3ZM4KsRY44gXRI4R/7Ayroz8LuPebgudEEu4yFx
         h6fujTRLlnGkcDENsaaqFCwvkT1pGeSF/XGSX3OAxl5VpbUFWvEloveizyIlQFMoS+6q
         gOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741207456; x=1741812256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNdiW6NwgPN019oEVN4C32QrEjKTlign/S0WBpecrZc=;
        b=egoTqOc+3CWQrCdZUann8Ry7AhFcC3lSF1KYzRSFHrDkCEU62KOFxbWhxQVef967aa
         zOzX7xjMNF3O1lkzfQE9D22wx8uLsFFKo4jolKKLRevlocuu+UpfhqnLBw2IixaWEjKL
         8fPzgHuE8ounDmUOh39eUT+I500wWlnOBzXAkwuj7GDQqvacVWvGFyUbfSdQ++iz7wMZ
         NnuloUxNWfzEOqlv63NFuSqOsMGtn3muZd/F8o47t6V2ylz6Z+3rNuXnefJ7rnUEZIe+
         t41v3/u/2SNJRtLs26g7rd1t9kMd0F6wK5TCuQkwj57yjJYo7x4ohxEDFD7QD1GI917G
         Zr7A==
X-Forwarded-Encrypted: i=1; AJvYcCVZtBl0gn4DH6BIKKx4Yzqbr8SwtnGmvXGxotmLaGVFNmVwTRQCF7UJeVLqduM1498N7sesR6gcv2XhMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/+1XyI/S21j1u4qnOozsrBB3Nb21K/jOzi6FhX+viU38b4KX
	RMnWBotISPTVqhBB+WmoZyoezbEzMNK3Y96wCbdlkMQJZAjdQ/0v0k6n7yX/0zA=
X-Gm-Gg: ASbGnctoCzqqyc+9kDNnVh5AZz63cZSVtT6fOb6OTyxN/wtB3Y9R2K551KfuZd9dKok
	x/45SPCdfMDzdDY1eP9VGvN/32FfonjH+WBaQ4CJWP0SH5g1SHc6hve9qwgFNq8yAZts1ZoB01B
	tZiG0DthO8kEdx5o4lzPiylWSK2TPPhdfNfM8ppuZpcVYIdeqRVjcpHhMNzmIWmzN97ud8DoPs6
	zZQFAQ3jkFdhj4ENte30X3v3LnEq2MFqDWYDcj9AE0cLc+U5IPUQizmoYZfj9zqTwZT8JbgSTrS
	Ib2Icl0Z6CZ34DWJYwVvKnNCbx3vBvW/qe5JMvejN4tC3ea3X/3BHOhokPefnM1K0yowTjMz8Fw
	1249ymuOUrv7pcqXuMCHV5+Md
X-Google-Smtp-Source: AGHT+IFczkI3MTzyRZfvWgh/m7rUtd4PnjEbD7z5Jr0gFGe3Qx3ssOoX6oc3c7cd0UiybO63WkVYGQ==
X-Received: by 2002:a2e:bea1:0:b0:30b:c608:22bf with SMTP id 38308e7fff4ca-30be341a1e8mr3100481fa.9.1741207455704;
        Wed, 05 Mar 2025 12:44:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867ca1dfsm20636091fa.58.2025.03.05.12.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:44:14 -0800 (PST)
Date: Wed, 5 Mar 2025 22:44:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: quic_vgarodia@quicinc.com, quic_abhinavk@quicinc.com, 
	mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 05/12] media: iris: Skip destroying internal buffer
 if not dequeued
Message-ID: <aevtzaqo3pqi5kwufdwciocybibuketxlfy6revxc6r6bzxdai@njgt56fev2vq>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-6-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305104335.3629945-6-quic_dikshita@quicinc.com>

On Wed, Mar 05, 2025 at 04:13:28PM +0530, Dikshita Agarwal wrote:
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Please add FIxes tag and move closer to the top.

> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 8c9d5b7fe75c..305b630ca269 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -399,6 +399,13 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>  	for (i = 0; i < len; i++) {
>  		buffers = &inst->buffers[internal_buf_type[i]];
>  		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			/*
> +			 * skip destroying internal(DPB) buffer if firmware
> +			 * did not return it.
> +			 */
> +			if (buf->attr & BUF_ATTR_QUEUED)
> +				continue;
> +
>  			ret = iris_destroy_internal_buffer(inst, buf);
>  			if (ret)
>  				return ret;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

