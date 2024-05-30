Return-Path: <linux-media+bounces-12276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A518D5253
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 476731C2213B
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1487714BF8D;
	Thu, 30 May 2024 19:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A8vsF9w6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5CE14B97A
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 19:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097333; cv=none; b=IYrkvkwfHncFohoVLWRokNDsuoLPAaDb+uzO3FMdbkRjXNd2ezFlM7z9OMUld8CsG6b5kRhqQJK6rb49/bTk8TI2yOPU1cE/+YE9dP42hKSW9AJrlC1c9iqPfbB+AGzEwqw6Yu+TBLooQQWIHEApolAPfJh7mvT70jzMaN0+WbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097333; c=relaxed/simple;
	bh=kCq36qSKbaSSCSrZ5JYIgeBRDixrqfYYmilsQum46XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdIZVZec+ymgM0YNgKsipk2kM3WyprWL2LLfexek37HPv+yRL/K8kDep6Jto0yQDw6aOeXcVL7s8hLOe3xfdIMaamkThspGLQ5m127hD/wPyrkK+ZGy02m5afKORWWgEIIaAZKGN3V/W6UeCkXP9LF2HEr3oDQS9FjSHvwrjrVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A8vsF9w6; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-36dd6cbad62so714155ab.3
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717097331; x=1717702131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vb/7IKkywpMHXVCAwvB83VbgVTzQKRbSQHYnoLricpM=;
        b=A8vsF9w6l9LTmisLnR3yq7ALq4UZCItlFnRAKjcrKilg//W2ROtYyky6admcH7aVPy
         fM+9ClLya4Jl+cMvdfTtBBSWCLmezAYeFBXbOo9M1irdzF/Zz7q8LFsi3YwSEecfbzuY
         VlQvXdnlvaB/ENr7CpqY+7EGOojKzT0rBvvmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097331; x=1717702131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vb/7IKkywpMHXVCAwvB83VbgVTzQKRbSQHYnoLricpM=;
        b=DagBU4NJcPP/LmN8IxDLZu2CBNOqeEFLs0TX2gCoi9FiCdsKxoNghwmW9pb2PB3Q/w
         vei4ydHRUsQVd5cL3TTYZGM1cPsQiNVtJ9h+lS/+WuhPVGXjMDZFIny3axcvbjLz++yI
         19m/7mLNZeejMLALQsUbZcDTlVl9N0ycWq4etBNzQvKqXWfA7PMBhHCHre8DJWc0rKgg
         qeNFYfjyIlkYATgG5/tYzKDVnzSqTlV9WiyevxmxVbmbscK1i0rVwliksZ1PhmQkW0vG
         CgbljLvbHM/Qvkerk5yA6SKV6antGa4tDlV7Mz9JI8ZbOD/dfiUbihyZq3nr/6uc41qQ
         v0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFL8weMYu7Zom0DUrjdxUoE/+moG6E3xzOQ48z09XR/jZHs0wmKjhJ6+lnSQJWlTTft1Or9srMii32Ae69mvXwgwTTQMpc3Qf3+M8=
X-Gm-Message-State: AOJu0Yzv/CeZkpGzxFQE7HGETO0gK5ElC14rxaNS+4fkKxBEgfVdj0XM
	6M788HLq2Tl4z+mDSBhOV9scDN4kQtETqDKocmEiyg/Mef2pepT6J0H0/m3fQi8=
X-Google-Smtp-Source: AGHT+IFw0/L25wX58Cnb9XyfLHv82OZvl/3LURmTnN6mWveZJiLLMpHdvouo0A+WHPks/udi0Pm0Ow==
X-Received: by 2002:a5d:8719:0:b0:7ea:fadc:f7ce with SMTP id ca18e2360f4ac-7eafadcfcb4mr200717639f.0.1717097330591;
        Thu, 30 May 2024 12:28:50 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b48b8a69b6sm74212173.92.2024.05.30.12.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:28:50 -0700 (PDT)
Message-ID: <cec036bd-2d58-48fd-882e-169137390946@linuxfoundation.org>
Date: Thu, 30 May 2024 13:28:49 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/9] media: vimc: Constify vimc_ent_type structures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-3-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240424235741.17093-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 17:57, Laurent Pinchart wrote:
> The vimc_ent_type structure contains static pointers to functions, and
> no other information that need to be modified after initialization. Make
> them const to avoid the risk of arbitrary code execution following an
> overflow that would overwrite the structure's contents.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-capture.c |  2 +-
>   drivers/media/test-drivers/vimc/vimc-common.h  | 12 ++++++------
>   drivers/media/test-drivers/vimc/vimc-debayer.c |  2 +-
>   drivers/media/test-drivers/vimc/vimc-lens.c    |  2 +-
>   drivers/media/test-drivers/vimc/vimc-scaler.c  |  2 +-
>   drivers/media/test-drivers/vimc/vimc-sensor.c  |  2 +-
>   6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> index ba7550b8ba7e..89506ae00901 100644
> --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> @@ -494,7 +494,7 @@ static struct vimc_ent_device *vimc_capture_add(struct vimc_device *vimc,
>   	return ERR_PTR(ret);
>   }
>   
> -struct vimc_ent_type vimc_capture_type = {
> +const struct vimc_ent_type vimc_capture_type = {
>   	.add = vimc_capture_add,
>   	.unregister = vimc_capture_unregister,
>   	.release = vimc_capture_release
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> index 7641a101a728..6a76717e0384 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -156,7 +156,7 @@ struct vimc_ent_type {
>    */
>   struct vimc_ent_config {
>   	const char *name;
> -	struct vimc_ent_type *type;
> +	const struct vimc_ent_type *type;
>   };
>   
>   /**
> @@ -167,11 +167,11 @@ struct vimc_ent_config {
>    */
>   bool vimc_is_source(struct media_entity *ent);
>   
> -extern struct vimc_ent_type vimc_sensor_type;
> -extern struct vimc_ent_type vimc_debayer_type;
> -extern struct vimc_ent_type vimc_scaler_type;
> -extern struct vimc_ent_type vimc_capture_type;
> -extern struct vimc_ent_type vimc_lens_type;
> +extern const struct vimc_ent_type vimc_sensor_type;
> +extern const struct vimc_ent_type vimc_debayer_type;
> +extern const struct vimc_ent_type vimc_scaler_type;
> +extern const struct vimc_ent_type vimc_capture_type;
> +extern const struct vimc_ent_type vimc_lens_type;
>   
>   /**
>    * vimc_pix_map_by_index - get vimc_pix_map struct by its index
> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> index e1bf6db73050..e2f12a7fb58f 100644
> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> @@ -622,7 +622,7 @@ static struct vimc_ent_device *vimc_debayer_add(struct vimc_device *vimc,
>   	return ERR_PTR(ret);
>   }
>   
> -struct vimc_ent_type vimc_debayer_type = {
> +const struct vimc_ent_type vimc_debayer_type = {
>   	.add = vimc_debayer_add,
>   	.release = vimc_debayer_release
>   };
> diff --git a/drivers/media/test-drivers/vimc/vimc-lens.c b/drivers/media/test-drivers/vimc/vimc-lens.c
> index 3ce7f4b4d2cc..e7d78fa8ccdb 100644
> --- a/drivers/media/test-drivers/vimc/vimc-lens.c
> +++ b/drivers/media/test-drivers/vimc/vimc-lens.c
> @@ -96,7 +96,7 @@ static void vimc_lens_release(struct vimc_ent_device *ved)
>   	kfree(vlens);
>   }
>   
> -struct vimc_ent_type vimc_lens_type = {
> +const struct vimc_ent_type vimc_lens_type = {
>   	.add = vimc_lens_add,
>   	.release = vimc_lens_release
>   };
> diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
> index afe13d6af321..3e32cfb79c64 100644
> --- a/drivers/media/test-drivers/vimc/vimc-scaler.c
> +++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
> @@ -442,7 +442,7 @@ static struct vimc_ent_device *vimc_scaler_add(struct vimc_device *vimc,
>   	return &vscaler->ved;
>   }
>   
> -struct vimc_ent_type vimc_scaler_type = {
> +const struct vimc_ent_type vimc_scaler_type = {
>   	.add = vimc_scaler_add,
>   	.release = vimc_scaler_release
>   };
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index b535b3ffecff..11df18332865 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -448,7 +448,7 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
>   	return ERR_PTR(ret);
>   }
>   
> -struct vimc_ent_type vimc_sensor_type = {
> +const struct vimc_ent_type vimc_sensor_type = {
>   	.add = vimc_sensor_add,
>   	.release = vimc_sensor_release
>   };

Looks good to me.

thanks,
-- Shuah

