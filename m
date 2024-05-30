Return-Path: <linux-media+bounces-12277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 475758D5254
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC638286BCF
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0C414B97A;
	Thu, 30 May 2024 19:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LvwCA6QW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2302B14B953
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 19:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097359; cv=none; b=Ml64daEfK9/hSpNdsVg5rVNAhd3IZxgwlHUVnkfBqIsn9UI3yblti85852SR+4vng+jm0re3l9kvcq9FHO8N+UNVGcrcgLV8oIiIE3JHf5WfAm3tCfygr+9xUsJQjlx578cSz2odjMZ0zZTGfEcRGpysMUq/MX8zo0bqMDhEf3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097359; c=relaxed/simple;
	bh=qUxYww3FQDIxiwRI1KAFOqnNZKD4+X6KTKKa1POiC9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfcBWq5tE3gC1SOlzGTxsVNUrQhCU13mbDmlRs1vV6z2HHy1/JZ/BwRGohOqrq0GJbBc3hnd9qJMuxLLbemst/l9yivukrE0KVMYkPw6okqiqqCx9F33nFzqQaD+req7VFMTBBDpaeSoypzM3fl7oB0gsGn12fjPZ4XQ6GcxoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LvwCA6QW; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3745600bb97so737815ab.0
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 12:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717097357; x=1717702157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+hyjhAzg7idan65vBJ2RS2nxjc3fc+3SpLyGqwnyrY=;
        b=LvwCA6QWngg6dEDRBTkGDnOI1OObfPOJO1sLFSRm+/80cpMJXuY7YFgQQ/zLp0/bO9
         V6HoW2xTVdROfEZY1APPznDZ5d3pgW3kB/13GZxkfBNEnel1OpZ2u5sPPZLKY3qb8d73
         6TqF/wru1bizqhDrWunzItr2QZUJsa/ZKzjVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097357; x=1717702157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+hyjhAzg7idan65vBJ2RS2nxjc3fc+3SpLyGqwnyrY=;
        b=dcU87mTwjaSkiLFYLLBaLUuihHgTYn7YHZtiDcJsgR0RvDQdMmA4BX3euu4zQ6lfUN
         CPW3nhTplS0JrSGaDRXssWAzwXLH8GxjMqsuA1zn7rXBAJGTg1Tunv/blkmQ6gMr3NH6
         c71ESyOkUcB/wC59ydoiaGz+cvtuFHeCHeGjaz4LT/Oy5MZKAMGuslmAJxSa+9YdlwyR
         HkvhAE3FNdLprC7wGK7eldL3N7ZQOaT6NPNMXZEazpCl/hVNy+FKi00fXOko44TMFjbo
         lZ1UBuamrxYJ+uQ9iCh/rltirfjgL0+bGrriWqhhYatloZ96VaijH6Wz9sBz9zKLgDP/
         PBwg==
X-Forwarded-Encrypted: i=1; AJvYcCVQHxwg3lfaTbJzAeellJZTUA8H14Gyzgkr3P8luzveY2DeIUVNG7pZa8iXZPu8JwykQnZD4Q3dZlf6BGiBTCT7gHGexGUPcqfxDT0=
X-Gm-Message-State: AOJu0Yzei8CWEOKDWNmKSCUYcSaj/oWuGS97mUofs3AacvoZya0XX1Lt
	i4WNjjgSPuVoeBiLrCDrn1NN9tOHMGmkNzJcGmEjw1m5ZiMNeExq+ZEFjdOrDhA=
X-Google-Smtp-Source: AGHT+IG0SHi7hoQkDt4zw9tqOs7t581g5B6tHBUwHFAd9iDr0kzmFXEPDTsFtj4iSupyqvf999t0oA==
X-Received: by 2002:a5d:8601:0:b0:7d9:eeb8:ddeb with SMTP id ca18e2360f4ac-7eaf5d91d5fmr339390139f.2.1717097357171;
        Thu, 30 May 2024 12:29:17 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b488e4b3casm76979173.81.2024.05.30.12.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:29:16 -0700 (PDT)
Message-ID: <4221465a-1ade-4de1-b1e9-135b8a65672a@linuxfoundation.org>
Date: Thu, 30 May 2024 13:29:16 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] media: vimc: Constify the ent_config array
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-4-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240424235741.17093-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 17:57, Laurent Pinchart wrote:
> The ent_config array contains data that is never modified. Make it
> const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> index af127476e920..2083c60e34d6 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -81,7 +81,7 @@ struct vimc_pipeline_config {
>    * Topology Configuration
>    */
>   
> -static struct vimc_ent_config ent_config[] = {
> +static const struct vimc_ent_config ent_config[] = {
>   	[SENSOR_A] = {
>   		.name = "Sensor A",
>   		.type = &vimc_sensor_type

Looks good to me.

thanks,
-- Shuah

