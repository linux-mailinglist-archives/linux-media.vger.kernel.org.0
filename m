Return-Path: <linux-media+bounces-12278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 828488D5256
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B36281C23860
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFDF45BFD;
	Thu, 30 May 2024 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FyiCxBx2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8414B976
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097402; cv=none; b=EM6Owy1dSPGbQCNBQbQcTf0mX+GJay+Nkh7FbAYkwdbtx9ag5pqhN4cKFBBuv7HscXyEdEi7npSnSuiAcHm90xxlQVmLqHGAbIqL2D0MtRZfGiufSSTYtg7E3j2IMYl21OllCf7sQaXJKZc7uSxmnNX+3bLpUXErm0fFAJpPUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097402; c=relaxed/simple;
	bh=UXBwNQTh9k+vQX2HRCEdWGBhpmkJXl3fD/Eg2WyPA6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gW1SVcVsYAwVdjtKTHjDokckAhmGwaaarcZzKvKUKw/C29wxeeXRKM5gehP6rn7Gtl5CWE/4vm1qORlqgalaUfT7Q1Q+w+spPghjA9spwO9393Q0ch1mmmMSwyCs2svz0qoHLEnxsRlasQWLVbHtitLjCFryjRCAhlSLDrx8oLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FyiCxBx2; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7ea12d448ffso6411839f.1
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 12:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717097400; x=1717702200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LanQG3qcNZJXTXylUNajFz92qUkPHOG92EiRz28gD9U=;
        b=FyiCxBx2P2BsBxJNDfqPfX4FtzFRLkY5VO8PGlrPMZCbra+rZc6POC4Rs3LLcxbGgV
         7/I/VbTnRDGB0HMKqW4skdlsjt8eJSJALPN47xLF4pTzZt9NQqnRD+lL3sCZ4SrD3IhX
         lFJCfKYHfNMvLC0UOMuoL+iFblYJgAqU4a0Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097400; x=1717702200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LanQG3qcNZJXTXylUNajFz92qUkPHOG92EiRz28gD9U=;
        b=uVcPgGW3RfjkUOr97mVQSqv8iRahfH4HlPNMSJDSZsIIhGFJM8s6CFO8Go17o9pFAh
         YYnPDlriAg9L4SO7t8AMw9DpZGKpFa0ZzK6HRiRqAnN1Wx29uXxmaDJwBlQV4ZdUbJCU
         rmfHLGYKWIzzBmVvyRXZsJW1OOY1K6W2nUhJud4Es3JJNFh1jV3gQ0G65EBFwfHU1dF+
         iTKVuQRdKZZ3th1jkEA6fR5ME3cQtUA7lhxvVki8yNreNQYIdHswLcNxFTaZVepzxLzl
         fANCZPpI5HeC0gqlaKDpteb2N8I7OtxtYKZZ6PoRXz8HREWeCIWGj0n3SSsB80OFkDlf
         4nSA==
X-Forwarded-Encrypted: i=1; AJvYcCWzhZ4vMX4+zlbdWbSKkREgAW1daV7p5575UPhueTj/TL2D49Cem74OaAHke8Cm/709xpDQANtorMjFCC+/34JTHTApzRxnh35q4tg=
X-Gm-Message-State: AOJu0YxuAIAjc5gCUJC0hX8A/+W7bAsOr+9EDnLosq9DxfI9oyiTHkTe
	TG/6JnN027TcXdfisJ7PbYTvqRjNusLbrdMjaxyNWjm3Fd8hD4ufzbd9mr4CpjIZg/ys+sTfS0s
	h
X-Google-Smtp-Source: AGHT+IG9OwliKKCAmOnNpV+wi7TGccVEnPSm3bghmW6++bq4vLDZ1a0iJfjP+Eb5AF6wUxbyf0ubVg==
X-Received: by 2002:a05:6602:4287:b0:7e1:b4c8:774d with SMTP id ca18e2360f4ac-7eaf5b719b3mr341191239f.0.1717097400068;
        Thu, 30 May 2024 12:30:00 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b4881d61fcsm76534173.60.2024.05.30.12.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:29:59 -0700 (PDT)
Message-ID: <e0005fa5-fcf4-4bce-a986-8098077eb9d3@linuxfoundation.org>
Date: Thu, 30 May 2024 13:29:58 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/9] media: vimc: scaler: Rename vic_sca_pad enum to
 vimc_scaler_pad
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-5-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240424235741.17093-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 17:57, Laurent Pinchart wrote:
> The vic_sca_pad enum's name has been shortened to the extreme for no
> good reason. Rename it to vimc_scaler_pad.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-scaler.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
> index 3e32cfb79c64..013cd84f82be 100644
> --- a/drivers/media/test-drivers/vimc/vimc-scaler.c
> +++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
> @@ -15,7 +15,7 @@
>   #include "vimc-common.h"
>   
>   /* Pad identifier */
> -enum vic_sca_pad {
> +enum vimc_scaler_pad {
>   	VIMC_SCALER_SINK = 0,
>   	VIMC_SCALER_SRC = 1,
>   };

Looks good to me.

thanks,
-- Shuah


