Return-Path: <linux-media+bounces-3104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDFA820ADF
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1FB1C20D42
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 09:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78D13211;
	Sun, 31 Dec 2023 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NMpcWZdq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE6233CE
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EuKW/WiYTJxSI9VLFVMNPYnkyJG0fGJhGRmQq6BzIUI=;
	b=NMpcWZdqIN05g3gmtr6KD8jz5fzD3TD7h3JS0MA6iDGjMxJdg3ZSfx9B4+htZpXnKcCajJ
	EKsndKZyDcw1kggrEDwRsudQDxqqBav+E6ynHtfzw4NYCE6JhRcZlDIW1L7gFaMlmMg6I5
	Io3lYsm0Xa2ONu+xzlDSyAH5mgb1KOo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-ehn_SblBNJiDDRKhrxWmfQ-1; Sun, 31 Dec 2023 04:44:22 -0500
X-MC-Unique: ehn_SblBNJiDDRKhrxWmfQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9fd0a58549bso845663466b.0
        for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 01:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015861; x=1704620661;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuKW/WiYTJxSI9VLFVMNPYnkyJG0fGJhGRmQq6BzIUI=;
        b=jrkomzRvy4STfOxjGglso3zCyxbjU/SM/vlh/eG8kpH+Ak7TJjegMj9cqRPAMM7WC/
         0KlYtks5jR0NhPdJA0Uvxk8D7baNTV8UkbbKx7g6zG6D/OeFlk8OcjJcP6T8igXvODaD
         A03em8Y+wrBeyjkGX010drqD+fSoCkLaF6PMQhM7EPNB+RZ2LsBzueZWHkCY7190VETT
         18xXF/GaI8Fz0XwJtKt7V4Yj+d9eiMdaOGpRuF1u1zku085tkni9Dnnx9pcET+WrhNLI
         BuRTEsVwS3epFCXJRhA5G0JmFZuL/P60CbHYhEh/isevllLlKmeo9W6AikqsZKSo7P2G
         JAvw==
X-Gm-Message-State: AOJu0YzaECqmnvvdTzCsUnCrXLJfNPS1U8c0tnTA0rdphdCzigTVDDpL
	ys/R3JHmx9nCN07phI/nPw5rl23wGV+7hAO4XkrI0heodYyZWfBDvjtUEzwCC5D8ulZUs2v9Xw8
	PqaWmBxcbcP4UxpMW6lW/a4WjaspWILc=
X-Received: by 2002:a17:907:3ac2:b0:a23:5893:1ac8 with SMTP id fi2-20020a1709073ac200b00a2358931ac8mr12276787ejc.27.1704015861773;
        Sun, 31 Dec 2023 01:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/zizKMwsqQrr7Yg28UomwhUJDmAq2ZJO9CDn6qhcdAiFIo1fEqPPVWqvKf+f4ihpRARn9xA==
X-Received: by 2002:a17:907:3ac2:b0:a23:5893:1ac8 with SMTP id fi2-20020a1709073ac200b00a2358931ac8mr12276778ejc.27.1704015861469;
        Sun, 31 Dec 2023 01:44:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906715100b00a26966683e3sm10072345ejj.144.2023.12.31.01.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:44:21 -0800 (PST)
Message-ID: <91b0ae65-eefc-44f7-a801-fbe3ee6073a5@redhat.com>
Date: Sun, 31 Dec 2023 10:44:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/base/circbuf/interface: Fix
 spelling mistake in ia_css_circbuf.h
Content-Language: en-US, nl
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223061647.78669-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223061647.78669-1-kdipendra88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 07:16, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in ia_css_circbuf.h as below:
> 
> '''
> ./base/circbuf/interface/ia_css_circbuf.h:76: poistion ==> position
> '''
> This patch fixes this spelling mistake.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  .../media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
> index 0579deac5535..e9846951f4ed 100644
> --- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
> +++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
> @@ -73,7 +73,7 @@ uint32_t ia_css_circbuf_pop(
>  
>  /**
>   * @brief Extract a value out of the circular buffer.
> - * Get a value at an arbitrary poistion in the circular
> + * Get a value at an arbitrary position in the circular
>   * buffer. The user should call "ia_css_circbuf_is_empty()"
>   * to avoid accessing to an empty buffer.
>   *


