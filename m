Return-Path: <linux-media+bounces-9483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D9F8A653A
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 09:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B02C5283E4F
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 07:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CE578C8E;
	Tue, 16 Apr 2024 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9+WlSdS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6927E7EEFD
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713253042; cv=none; b=YC9rMlk+RYPFsluyZ4FzM7wlIc/oWNjkRhHcs48FZXkjFva2IhmMJwKgYU0IooR7i28i/EJN+zwHN4ByGRaEFrw0S6J6MpzgWeJq5ITXXLxmG1ME7Q+RTD4KsjxuECgYwvjCtmdxVzzMYHtzeGrb99zTnNUmBJIynMQKj/zxp2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713253042; c=relaxed/simple;
	bh=BIpOJSTxOK0JfNqFwhleSJ0Efyt0sHPGszihSmkHs2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXZUTydT7Q6GxiFrURjw0JSqC083Z9jMtiwXNDCSfV8B56bJtJV54gPs42xGAUJUUrXrXa3Vz+aAJoKeNCKNy16HqE/Grwd4EXqA1WmnJsDJBNqUn9Gqm+/vc+LZSawF9k1r1owf0yPdvn0SWhOe57Ivv+pvqE8UBTutGKwcQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9+WlSdS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a51a7d4466bso460682966b.2
        for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713253039; x=1713857839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=;
        b=b9+WlSdSiA5XyauSwQE5H9UMIrdQO+qgy9vXhMooxlkNWj7lPNWRENP1vRvJTZ48Jv
         Cmz3hPo4dfQoMFwERWiBfSnjJGHOf1O41S/J7g/ExXuusCXjX85bP8l1CfojFRt080Q+
         Ebt18aRnezj5aZdTWSNNjdALJ97ZEO3hyXgqBJx9CwbgU1TxaTBFw9YySmRzVCXtz4lG
         ye9WtUzkRUFrAJjYUnTAXeSH+VnbhKKwZ4Z0+QM7cRMj9DiehaeGohhS8IB1DTtIxf9l
         rBH5F9j2PkVWOUDer8bH+oKBql3Vc0AyQH7Yq2qg9aztgmQ8nluh0roA5IGZN8dBWW2Y
         iAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713253039; x=1713857839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=;
        b=hrwubtAI+C7gg+btaqN7PCx9cwzfiW1ysRC35R6VKUXoiycgq4XErTHiTcCflX21xP
         vCJGhBbZUMOBVb4/a4bAkq61YpxFjjMb2NoYsFDU+JQOd0ozZY7EPdwGzvR9sMfsj3k0
         isuAwTmRvn8hT/mGT9VDkzbyLeUCslzbgoB3TX/j4zAaZtv2E+a+6N/3mhD/ZWbtxhH5
         7WO1yY9IHhvb8tc3uSBddjchLkX1ezk2Eb5q9y8L4Bfmci5QyDRTIAMSbibhhR/JWjQM
         i9/CyuKegkVZw8+jrjSYvoRG5xdCmidJlQ8eT3xAzIAi7cIcpqP4ydy3IOKi25NIpXDZ
         Jh7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdQdbPv4ppOBeDDNn3VYeepugs+bZyLBfMJwobVie3VpanKrl+BK8RuYHxy0TeBq1y17DhKNvUBERD7qhZpbhdA5K/9PSKvRhoYLU=
X-Gm-Message-State: AOJu0Yw+PEVRRaPP9n+KxXTVRyGB6tFE82xYLIvKuZR55gGSuvPyDlL/
	JAE+zJQ7RKjEAMi/Nb3Fdpp/qADIVu2bC0mz/+AatRB7WxJSzZcuXhhsdGnv6IA=
X-Google-Smtp-Source: AGHT+IF7djK9Gp7QvHWuOZzhp3iyt4a4kh6gE+5Chee7fTPBiXusYHzH5iP8LrBy89Sq7/Zoad7L6g==
X-Received: by 2002:a17:906:3488:b0:a52:e86:ae62 with SMTP id g8-20020a170906348800b00a520e86ae62mr7767532ejb.54.1713253038496;
        Tue, 16 Apr 2024 00:37:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gt43-20020a1709072dab00b00a5242ec4573sm4507206ejc.29.2024.04.16.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:37:18 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:37:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/35] media: staging: sun6i-isp: Remove redundant printk
Message-ID: <b8a5cc23-240f-4fe9-9b25-b534f618506e@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:24PM +0000, Ricardo Ribalda wrote:
> platform_get_irq() already prints an error for us.
> 
> Found by cocci:
> drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> index 5c0a45394cba..a6424fe7023b 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> @@ -386,7 +386,6 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
>  
>  	irq = platform_get_irq(platform_dev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "failed to get interrupt\n");
>  		ret = -ENXIO;

This is more fall out from when irq functions used to return zero (16
years ago).  Instead of ret = -ENXIO, set ret = irq.

regards,
dan carpenter

