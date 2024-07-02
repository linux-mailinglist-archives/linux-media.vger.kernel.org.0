Return-Path: <linux-media+bounces-14524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36182923B9A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 12:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79D1281295
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 10:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE844158DCA;
	Tue,  2 Jul 2024 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E7egtoHO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3B158A3D
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916807; cv=none; b=SJyljwIiLQe9k5UCk3UEqejRVaIPW1IUhop0AUdQX+3SJTZUScfBL8mxxPlvolXvjeiVvIYTFJ8gc9rSxkoxnxfBfbxyugSFBmiRSZQqu42nbtbUQBrxUollSsTE/FIHhRhZik+wiN5HYT5l3BQo1UFw9KiJacBzKML9RHL6tYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916807; c=relaxed/simple;
	bh=TDppq3QndM8JNkDjO8u2RbRC5OpWh1V4tH234IJdXFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxRlUgQqJsLzdZAkd6tlZGUSCihfJWXnaqhE+FI4ogndiWR3NgSndGs4bfQys3By6LhibZsjd2Z1Ucc6a20yFDBtJlQYLSOk/HzoeD9orBKRaxOqGm0N+TmJlhHa67vTalBYYieIamMVJl+HN2UlaLMQ+CJrXvYrHglyJiWeuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E7egtoHO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719916804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCa6DSiwjRz2Wd6vpRX6uDoKcE2Oans70T8xfVyVyaw=;
	b=E7egtoHOpMqp2B8J0k3FfvCQO39yipQs+OlzdagVk5sFt8XB+L/Nl2/tbi8VKE8q6s9enf
	7dIA4IBE2HupSzqf4wtoaAStLD5joX/TUMIsd7C9khacZBHDnFDJmh7fUVhHNTmhmIqaRp
	Pri8iRvbAOClJK2EYWwLr9Fjp5elino=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-yiyH3cPlPx6XBcJ31W5d3Q-1; Tue, 02 Jul 2024 06:40:03 -0400
X-MC-Unique: yiyH3cPlPx6XBcJ31W5d3Q-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ec681f9c54so37323161fa.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 03:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719916801; x=1720521601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCa6DSiwjRz2Wd6vpRX6uDoKcE2Oans70T8xfVyVyaw=;
        b=Ni1Tdc9D4izVTeJlGo7amelnN6ZWpWB99NqYWj+owB3QwZLJ9+6nT8M4mUOuyzuEk+
         wcSSQG9mcHHWraWEfo7rDEEV+weU9aj5GYqxIZKBAeRDlwuMql6Zsw8+bsapN6zQ9qDX
         yXdGZh2XBcFG0Hj0NFDabTbjzkvzLNwz3y+nm9YYEPlEE4FtCH6JpIZMnY7z5R5IS/l8
         Bg/deIJ5Rq5c//XocO0n4vR0yyvk41cEuPCv7mRbIQ7jwNFqeRcUdM4xEVvoPQ/6zW2r
         S8lAZcUCp4diw4//hABwK/KO3QgYInmMyfSg329uPdQdzuBFUSWIJLhR2wsaSD1QiP+v
         +mdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaljeWno57dzdj+KDV7PLOjZPMxZcBbEQKSqGowtURVV/qe4CwInBhuJzfVwS4qoZJ7nowfKoxVEztui94+k+gPDGSWlZt06pEtcc=
X-Gm-Message-State: AOJu0Yz+89QYQ7Y7fHzbBCl1iCBhHHEGRJ1BCtPWYY9IO38zZMq/R/HI
	BpKnYknVBY3Da+iuWPo5GIJMKq4NO5iag2zwAuhFjJazt4PhkbdaYPXApwnZySaFq5pFfBAMRyD
	A8BoK4JN4Y19GZfwndqdgobl8qqa9++6UIUD4wGEqPbG91IE+Bi4h/H2FVgfiaq1MRtKS
X-Received: by 2002:a2e:a80c:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2ee5e337772mr60944941fa.7.1719916801658;
        Tue, 02 Jul 2024 03:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA9HFaqbpR5DiqdWlJr4mBoVmkGsxDa/lEzaGV1FtuE5tObmfGOuCe6wTUqiDmvlGM/Qax6w==
X-Received: by 2002:a2e:a80c:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2ee5e337772mr60944751fa.7.1719916801202;
        Tue, 02 Jul 2024 03:40:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324eb41sm5532223a12.30.2024.07.02.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:40:00 -0700 (PDT)
Message-ID: <2ac685f1-d46d-4639-b045-605bf95ed2ba@redhat.com>
Date: Tue, 2 Jul 2024 12:40:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: atomisp: Fix spelling mistake "pipline" ->
 "pipeline"
To: Colin Ian King <colin.i.king@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240429075146.1073869-1-colin.i.king@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240429075146.1073869-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/29/24 9:51 AM, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index effc71b5a439..d7e8a9871522 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -894,7 +894,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	ret = __media_pipeline_start(&asd->video_out.vdev.entity.pads[0], &asd->video_out.pipe);
>  	mutex_unlock(&isp->media_dev.graph_mutex);
>  	if (ret) {
> -		dev_err(isp->dev, "Error starting mc pipline: %d\n", ret);
> +		dev_err(isp->dev, "Error starting mc pipeline: %d\n", ret);
>  		goto out_unlock;
>  	}
>  


