Return-Path: <linux-media+bounces-48821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584BCBF7FA
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 20:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 278D63030DB8
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 19:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E16327790;
	Mon, 15 Dec 2025 19:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WdoD1ifz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A66325719
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765825841; cv=none; b=t75YcgSAYQAgagVkY5TAwZbt3Zwrekm0w36/nl1Ichui1f2i9NUw8QMQvEm5iKRYh97yqw2ka9L9pUE5W+pHGSpJC2Y202Va3UFyaX8INloOlooOdAGGHbJ/FOwkHO9RmTp2jx9eKye6ZDC1nbxpid3zKA5wOPeA4rqfTkhl0xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765825841; c=relaxed/simple;
	bh=yrm8EeB25T6FHnpnOItAorgBEtV9pg3xemC0OkJQgU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCFHToYhs+bVd5ytPd0iPqcq5HW/rqCfMN2sUj6I+MID43hyysvE38MNcEE/m7UM3xPJZFx4RPAnbjXtGbTwpuEbrey/B616dF6hEefkxStB1ImAJOVYL5YIun6c810RFMUiWCK4jtjwG0IyXT2K3WudYzTtOIU0kX2FZxtjjfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WdoD1ifz; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c6dbdaced8so3168602a34.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 11:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765825839; x=1766430639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUz0/ZXP0b/u38oR7VCuNI3KI4/vEY3ixnbLJk7FSaI=;
        b=WdoD1ifzDv8IKeyCl4ht5fV7Mrv3inVUBfzn3S5c+w+yBOGQ/KdTZ2S9oFKvFn64cb
         OnjUUoopWSkYa4QFksEDB1S/OckJnuPWYuG9/3jQuS50YK/z0K1g88zoDC3jN0K8LKnz
         4m1ZWF0grp3/orzWi2cR1bzBAT6oie7xrQdYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765825839; x=1766430639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUz0/ZXP0b/u38oR7VCuNI3KI4/vEY3ixnbLJk7FSaI=;
        b=sz5FOpbtM7RFW2QaJQKD5+OZJq+EujmP97xZZDUKGBm6ApymhO0pkHeEZeqGpMSrrp
         vHYM2N7/JTFgTstnSi/qlM6LuQTeMPAcoWp9P+ngubGKLdVWo8ih/oRfvV0cVC0JtdF1
         GQqJXV6Ug4zhxkOPexxPuFjEfiDFPzsi1H3QE2edS13NCSxUMaKZxToPEIhYLo7OW6aj
         VAoiG2F1HrhLIRcilD+doVmUMI3AF59AfbEGioIDNkVtnjMqKkXcpcdWlG86dtyT9eEJ
         9jAT9pmiL1rnbG7Q7p5cxXQMMVx4ru1cy7g+YbQNwtdXWsX/hjjaRv5oP9QY904k7daA
         IhXw==
X-Forwarded-Encrypted: i=1; AJvYcCURMXnrvG/4VQPohXcDJuZ2AYtiUqfVZkObpzc2Upm+DyMVFe9JX2JBMCwsfE2Q1S4ylnVTTVUnX6CTiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3awZsQyB2A16EDONA7/43dYKX4Zkr6uuHh5/swNSNcObuk7a
	xfNJ9bKI8bn70OPb/n3y5Zfu+7K0qNS2fBXum4MJx9dFc9S7FbJJdtwf/3AZjBLGpLE=
X-Gm-Gg: AY/fxX70YamxayN+OhD59CKTLG1Gp0aDDnSSA2HV5N6fBCn5TNtmtcqtJigbNEypPI2
	KAgCvhW/4GlvmaIkuRAWoe6Ag/Sw2m65T4yPcK74facuFZTcEPp1LzaN1hW4RbSFC2ww66mu2uR
	aC0HIQ9SqaKuCY6WcbDYKKD/SUpz7cikPGiPGErcAZBX6SJQnkCbja3N9ugpueLRLPrHLD17M3c
	ZW/pIf2ALgQHzOz0qYNZXvNMV0Ud+zZUYcAj0uZYNIRbGfE+IW3yn3B/P8nCpWe/I2C+AYURlZy
	ySp8gC17wHxnJzf0Ssf89DRf14AD6W4YdrmnTA0eSSYxXAVC66QX8zLuYrNyCpNU+UjubsOLu+S
	zC/A0QNMt9S96iT0GsA/O3Vllas4wPuGRqKk7i4rnybVMfJE06kHZ2CWlxl4KnwG+oaGMkKh4Me
	kX2p/nEnZLrx0VyXa6XyOV2wg=
X-Google-Smtp-Source: AGHT+IGxMF8FVmXFuGiH8zuzegODcHTRQDhM27u7ENnyUL+vaux4m/w1TLzXqjgaM6dqgEqvsjPODQ==
X-Received: by 2002:a05:6830:270b:b0:7c7:5991:3c7b with SMTP id 46e09a7af769-7cae837454emr5606983a34.30.1765825838921;
        Mon, 15 Dec 2025 11:10:38 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cadb1d0facsm10106393a34.3.2025.12.15.11.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 11:10:38 -0800 (PST)
Message-ID: <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
Date: Mon, 15 Dec 2025 12:10:37 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: opensource india <opensource206@gmail.com>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
 <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
 <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/8/25 22:04, opensource india wrote:
> On Fri, Nov 28, 2025 at 8:41 AM opensource india
> <opensource206@gmail.com> wrote:
>>
>> On Thu, Nov 20, 2025 at 10:08 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> On 11/20/25 01:49, Pavan Bobba wrote:
>>>> This series extends the vimc test driver with a new RGB/YUV input entity,
>>>> pipeline enhancements, and documentation updates.
>>>> Pavan Bobba (5):
>>>>     media: vimc: add RGB/YUV input entity implementation
>>>>     media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
>>>>     media: vimc: debayer: add support for multiple RGB formats
>>>>     media: vimc: capture: support custom bytesperline values
>>>>     docs: media: vimc: document RGB/YUV input entity
>>>>
>>>>    Documentation/admin-guide/media/vimc.rst      |  39 +++-
>>>>    drivers/media/test-drivers/vimc/Makefile      |   3 +-
>>>>    .../media/test-drivers/vimc/vimc-capture.c    |  15 +-
>>>>    drivers/media/test-drivers/vimc/vimc-common.h |   1 +
>>>>    drivers/media/test-drivers/vimc/vimc-core.c   |   3 +-
>>>>    .../media/test-drivers/vimc/vimc-debayer.c    | 113 ++++++++--
>>>>    drivers/media/test-drivers/vimc/vimc-input.c  | 210 ++++++++++++++++++
>>>>    drivers/media/test-drivers/vimc/vimc-sensor.c |   9 +-
>>>>    8 files changed, 352 insertions(+), 41 deletions(-)
>>>>    create mode 100644 drivers/media/test-drivers/vimc/vimc-input.c
>>>>
>>>
>>> Kieran and Hans, Do you have any feedback on this patch series?
>>>
>>> thanks,
>>> -- Shuah
>>>
>>
>> Hi Kieran and Hans,
>> can you please review?
> 
> Hi team, can someone please review?

I will send these up in my pull request to Mauro - it might be
later in December of early January.

thanks,
-- Shuah


