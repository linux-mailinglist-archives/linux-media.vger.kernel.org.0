Return-Path: <linux-media+bounces-47515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 477EFC75667
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 17:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 279172AD20
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 16:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9D7350A22;
	Thu, 20 Nov 2025 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RF86o/3S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C283358DB
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763656695; cv=none; b=rMBmHE5IA7LtCtpNPiN1UNcUPqqJeJ3Why+SHOfM18hvhLcgZv9MXlBenEKhduIYhcF2gMT6ooew4LckM5eL4mZIO5yTVwpRn9LpJtEOc1+DYBLvqiuX93okT5rSlT4O9oeFEUu3KBDmdcDcnIgjr2RbZirHAfqwX28NRjdWd4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763656695; c=relaxed/simple;
	bh=iGiIBYa0NBcSIpWy5SXi32+sauXjWvTFHJHh39U7yCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ino7LVeyc3yxleskvq2dHc9lSZAdaeUvxpIjtv/UACgSqCZMrtrxy1/vhVKztHF0ZMjN0TU8v+sUwaIydW2zP/jVr/FD5c1S00GayRq/ujr4u/N+c5V3rl0mZ8IEpiZY+mh6t3F/QmrztDfFSoKORPMxvyZcqmBzo7kV0NMFLsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RF86o/3S; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-949042bca69so39152539f.1
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763656693; x=1764261493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X75AjjLP+vyOEN4Xf6Af+k36jmXjymd+XLckkrAVbrM=;
        b=RF86o/3SPG7XrXEDba2iyDFeBzVosN28lU2makWNbHkDXvA8w14Z3Hrp42Nz6GF9/4
         0utImDz7DMLG+PoGppQmnGUWVFRB0Y1TBOi10ctS9OcKWArObFRxN3PfpEU+ENHoBP3S
         NVzQiqjQs1UKolIPquGuzXidMwFjXa3qAotGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763656693; x=1764261493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X75AjjLP+vyOEN4Xf6Af+k36jmXjymd+XLckkrAVbrM=;
        b=dWmYVYgt44N4PJpID+0J+UxtoeD5Dq0QxHJEOyB9tuIfqWJg6YFtxxRGbngJPCK3Ee
         UBeMv7L1om6amPhIGnrSdhjTunSi0cJWyG9TTXOlD4G1RvGEenIQwJb9vkY5ycgr2fV2
         3SosFYFyhcaBTj8uRIecHoCzb94GgG7h22gfEyqO8qDegg0OLMFqs/0+XH5xjd8Gk6L5
         PKf/ZSMDbRsV23E7UjUF33F42xNWoqbUKaI5bna9RbFZOjgHqv24GBgnlKNzG8ElD2YH
         WqJ7S2HYDbZETWkO3UHbjdHwPJ8+6rFdLUv7azGim7fWSo7BmPCAnsdPUy0iBG9KKSnP
         P26A==
X-Forwarded-Encrypted: i=1; AJvYcCVoCJNxHAi6lJ0PV/zb8fM7gmM0MQGbvN6b7D3BUTffivI5h09daPochTABBqPJEjGqfotOQPy/BZncIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlDOFCbQjLqc+dH4daw7lPJcKTtafn1hv1N4G97rZ34+DpCyWN
	OcdFc0/f0se/x62XfABQ2lOWRXmVllY7yZ2/kV0G0qiNWmGZDEWmFFb8RBIGup7SrBg=
X-Gm-Gg: ASbGncvHOKkeSsgQFXWjFDy0dJZc26Ak91o6Ud5ZNERTwkxTNEQSBgpin+5LzvlaDDZ
	ZW3AgByVWv+WhqnlQOi8MfzrnEUPABuhO55fxt2YTms5Fd9CecqjgBKm9CJ/feJFfmHMH3ai0EB
	1DDrMQiVgFFBndusgZQHhxzUdoWCtUbdMXaq86Z461VTC0TeE8nyUIklcxlf5znW6rAjhMualMt
	F1hxkNl71lSHniSK5IEy3TZAxGfAEHv3f03Ajuey3kFgF9LPJsbVuhC5RgOqSbiXnBEZKwePSZU
	hfO8r23xm1sYdQ5supWiyxX07hjzNQFEpiK1BAV7PSzOtqH7Pl/CCHkKCsWFpD0pV3NVf4K+lZ3
	x4stro1WMCaK9pVtuSyDQFWVQpotEQMBv6Cqk8jD+FhjXNUCWZw3qM+SbUvHbY0RLNz1igCmS77
	zWNR5/fBty0yUzbjipdGeTvYY=
X-Google-Smtp-Source: AGHT+IGpthQzGpAldA5xSa3l4SRIzx3LodaPO93/vN0f9phJeu6UpyBbVzsX5Ox6ai7zw1VzxviwmA==
X-Received: by 2002:a05:6602:6d89:b0:948:9e18:7d7b with SMTP id ca18e2360f4ac-94938b15050mr282794439f.19.1763656692782;
        Thu, 20 Nov 2025 08:38:12 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385d2651sm99489139f.7.2025.11.20.08.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 08:38:12 -0800 (PST)
Message-ID: <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
Date: Thu, 20 Nov 2025 09:38:10 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: kieran.bingham@ideasonboard.com, mchehab@kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Pavan Bobba <opensource206@gmail.com>
References: <20251120084926.18620-1-opensource206@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251120084926.18620-1-opensource206@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/25 01:49, Pavan Bobba wrote:
> This series extends the vimc test driver with a new RGB/YUV input entity,
> pipeline enhancements, and documentation updates.
> 
> Patch 1 adds an RGB/YUV input entity that can be used to simulate pipelines
> starting after a real debayer stage.
> 
> Patch 2 adds V4L2_FIELD_ALTERNATE support to vimc-sensor, allowing it to
> simulate interlaced sources.
> 
> Patch 3 extends the debayer to support multiple RGB output formats.
> 
> Patch 4 allows vimc-capture to accept custom bytesperline values so users can
> exercise padded strides when testing the RGB/YUV path.
> 
> Patch 5 updates the vimc documentation with the RGB/YUV input entity and
> revised media-ctl/v4l2-ctl examples.
> 
> Tested with:
>    - vimc.0 on x86_64 using media-ctl and v4l2-ctl pipelines
> 
> Pavan Bobba (5):
>    media: vimc: add RGB/YUV input entity implementation
>    media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
>    media: vimc: debayer: add support for multiple RGB formats
>    media: vimc: capture: support custom bytesperline values
>    docs: media: vimc: document RGB/YUV input entity
> 
>   Documentation/admin-guide/media/vimc.rst      |  39 +++-
>   drivers/media/test-drivers/vimc/Makefile      |   3 +-
>   .../media/test-drivers/vimc/vimc-capture.c    |  15 +-
>   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
>   drivers/media/test-drivers/vimc/vimc-core.c   |   3 +-
>   .../media/test-drivers/vimc/vimc-debayer.c    | 113 ++++++++--
>   drivers/media/test-drivers/vimc/vimc-input.c  | 210 ++++++++++++++++++
>   drivers/media/test-drivers/vimc/vimc-sensor.c |   9 +-
>   8 files changed, 352 insertions(+), 41 deletions(-)
>   create mode 100644 drivers/media/test-drivers/vimc/vimc-input.c
> 

Kieran and Hans, Do you have any feedback on this patch series?

thanks,
-- Shuah


