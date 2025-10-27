Return-Path: <linux-media+bounces-45724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB04C11EBD
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 23:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9ED94F87EC
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 22:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8FD301037;
	Mon, 27 Oct 2025 22:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="GPS73RO4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359F92D97AA
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605835; cv=none; b=a8+Ew0SM+ReCjquApcdK6tfKRZSqB3puVc0HWCQV8EjK7HtiIY/0Kz2h7B/vThXeQRxijEzR2q/JnEu1/iBtme+OzdFpM7FLCMPTorm6WSy3aLWRZvaWq395VsfciQ2y/biVcwEpzJ5sV5NlCpa2ISTpyTlvfr7zmboGz2kB3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605835; c=relaxed/simple;
	bh=RbgbmRKiII5Ao0R77HENK2nhkZb2TNN+Mr7QeadAS6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klwVNOvsavQ8r5U3kYp/5daY3Xkm3+HZfLMQlgWCd8dduzQuUkCRaqFPhOeYbfcJIZSnb+Qr+9/Eix7Jw32neFu+KKEUUP7ktGDZWOXxcNTx8e9N8UC0bts/yI5DrqCxybZ4TBFg69oFRyMP4j696WEHlD3C19qdzn+fWUSQufo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=GPS73RO4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso9047120a12.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 15:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1761605830; x=1762210630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFdl4ZmTWATcoFU8X+kQFEdA63hl2cxFFo3h5RSrR3U=;
        b=GPS73RO48st2zL9tAmUneLaI0A2tr9N8nX+Ys5qCW1ieaMffJPUX/eY/1+jTjovzrV
         YE68FuT1gpEwMV5SfnMzVkDuzbjYWUz687gMw0dYw5Nr2oNXuIgcz78ftEULwXUhEQkc
         YZcNS7Gb28LxPb7k1Ugu+FPoBeEwo+aYJMa67CWuAs+o+OncfpjBFt9LsBUMBs/4SYUx
         z2VOitgNSOICn9kBixteJwY1vMXfVB0Ns3KWWX9/GgAXb1XM0diJ61Zilbfcjm7oB+SZ
         zcjdKtHhseCa+yP9YoqXL4TkqF5CosXQ+6GmEibSsXD5dL0mNlJfUjYa1K+yK/qZEB7b
         6u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605830; x=1762210630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fFdl4ZmTWATcoFU8X+kQFEdA63hl2cxFFo3h5RSrR3U=;
        b=CXjajVhlJeLsR1B1sqdRT7Vx5xkW0aYAg5zeylZ/Bf7lh+lq02IGgZvYuJzTFQRsfI
         hTuQIpuSJ/Ee0EB21i+XIzN0HG6wd4UrT6BkOXpFoUo3+u7f4TK6xZ/IAeX2LrtgII+/
         isEBmOKeAbgb56Nr1HAn0+rS1ecoOUIRz5c9E3mj03WhpqPec2ZDKqChbltipjKtnKnF
         vTPWhqxfXZpqb9EVYqYH6SZYzkmvm8pbCKJrgDb0jxaO7ls8q+r3BrdjgCg8ZtA/Z/Be
         9w4QC9e7FoQduOGaxXXpDBp6RMyTZsee99r4ZgMdXE5zQFkGEBcPghJH0MSnV3Esv+T1
         5aKg==
X-Forwarded-Encrypted: i=1; AJvYcCVMEiWHN9t+EBRCCHRcEc82AnY8t+y8MYXdC0Oq0R/yOvTcfUzLVR7ENgmcrJjsghhgdrBKIUAFg38dzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy1OkuQwpxs6cTRCYqQnC7L8tcJrvsnKJlb8ZXlldVTmB8vt9p
	NMd+nW2T1zeHnqkRbQLx88sMfl6nIhYHazwMHEiUGzo2ynT/Msar/ZWfiYrnG/eybUU=
X-Gm-Gg: ASbGnctXQcD/zfHFMIsWYX9vFdxxervXYk1AqxAkrjp7jgptsp1LSlIdJNhOW/EYu+v
	6M4FnOHZKXAD0Wc7sPfVDmjAruw1Q8+B/CrwDeacP+1BR4LpDyCi0TZjGTwzFjJQ5aa4Im1e8d9
	DJseV3LReGO2hVAW6wlMHvthrWSOBVNvdqgHUzv4aXc1zvcLEufwcKNCQjnLoYvMDGPLjahCJR8
	ZtMzAWDu15vgg6neC/rCF2CfJukt+JjGt9H915peYKaLCseE6C5jXDEzJm0O8LpQko4KB6Tz0B9
	1s5LQ6MmwldVBTuPq2iVa8YRQ0thj0uaEYcK5b2rn03vuKZUp9bUw3Mv4iadxklleprufmzhWPA
	4P6r+5E+hDfJNRHwUHFnUHct67OEp5qKguY4L4bmvwqHqT1+AgX6pKqA3AgzibwYTQzdfTE+duH
	KDjLO1VxrUJG/xNYmZRC2L3SXjJRBkQnUfYg==
X-Google-Smtp-Source: AGHT+IGbQFjuStndCCaKR4261I4iaoz/JO8/XzOkp528toduF4S7yedYyO+RXOpk7sO39YsAF2rxfQ==
X-Received: by 2002:a05:6402:34cb:b0:63c:3efe:d970 with SMTP id 4fb4d7f45d1cf-63ed84dcd85mr1490392a12.31.1761605830413;
        Mon, 27 Oct 2025 15:57:10 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::b25? ([2a02:810a:b98:a000::b25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef95b7asm7465709a12.18.2025.10.27.15.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 15:57:10 -0700 (PDT)
Message-ID: <4f517225-3850-4a83-b05a-eff08c88691d@cogentembedded.com>
Date: Mon, 27 Oct 2025 23:57:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/25] media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq()
 NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
 <20251015075353.22625-19-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20251015075353.22625-19-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The v4l2_m2m_get_vq() function never returns NULL.
> 
> In the set format handler, the check may have been intended to catch
> invalid format types, but that's not needed as the V4L2 core picks the
> appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
> type can't be incorrect.
> 
> In the get and try format handlers, the return value is not used for any
> purpose other than the NULL check, which was therefore probably intended
> to catch invalid format types. That's not needed for the same reason as
> in the set format handler.
> 
> Drop the unneeded return value check and, as the function has no side
> effect, the unneeded function calls as well.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

