Return-Path: <linux-media+bounces-19772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292389A17EC
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 03:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EBB1B24EF8
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 01:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D886838F82;
	Thu, 17 Oct 2024 01:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="2IVnqOvP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D46922612
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 01:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128399; cv=none; b=T97HVC0WWKL8V5JYdU45/lht8pNrSZ3jvzr20snWQn3SZOkxhWSiLFU6JtKq9q5Wgbza8TWvkiqnEB3X5EvwMk1LNYynhlGU6OFYUQcj8Q2Bj6T/L7sTiZrNQvTJV+PqGBpO8538ojnrK9X0ss1SA5Kd+0HJXv6/D4bofH/FrDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128399; c=relaxed/simple;
	bh=syDeYdswZ1nqEcLbBS8Gr/cgwasqBdpO5kvggc+aC24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JT3ZE+t4LGG1GPDqkOkkR/cwHOM0MsQjw1iotuc6hq2EZhKkkSMXVOF7dUSfIA5wGpB5g7tLXkYmVE4VzLgzdibI94KTjTw5TSxlU2jtXiAst6LeRKJffBBqDh1RqI4NMyHVJjQmfZDnCFLP4Ym31o0n7WXeo/llMSXfkLFSRnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=2IVnqOvP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso49349066b.1
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 18:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1729128395; x=1729733195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=za4Wo2XnfAAnoxtIT6vqzShAynxd89kmxit532DGMfc=;
        b=2IVnqOvPDnc+eXhMo4pwMyhEkQtuOSoFSkWxd8biuGz0O1SRTz/6Rfox/k4qq1iQz7
         1AgLUp/s3KHcgqMfZcXfKWVK6cwU+Xolvr0xM33CzjBEner4wikIlZanHNJAIpXqtqqH
         S+aFKR2mHuAQB8WcF/k+afsU4loXOFmiGRR4TlCftoUM+Z1wMzbnmRtN2Yj4JxzHxEQY
         cOEivqSZyzouC24xT6mNvElnDLtiuJPnn0CcY8pdXrPAFbxJ1+V+bdCVVQjC5XRI8mE8
         fwFY5U9ujGBkC+JzjumJmgd0b5aGSB+Bh/JMkApZRKRSQ9J8PfcnjSqAeW2HLmlKvQ/u
         BVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729128395; x=1729733195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=za4Wo2XnfAAnoxtIT6vqzShAynxd89kmxit532DGMfc=;
        b=l2UWipuXHW+7M3AeIY8coplEWNdcz2XIaKzfpI2oboDLWvZvpzs3P8Mf5Qw4UaOxZ9
         Eljm7Uzn818FfsQ9X69B3SfwJaVCsTA7SBcI2f8GYLXL0lWash+OfIGr6MZcSGXm6Y+X
         +Zuikd1DG21l7OyI5JovhKVQYQc76wcnihpkfp9mGawL1r6MOEaR4FXr/ng9RXpfajWn
         021q3exL5Hjuz3NfviOygOwseARmgVeUiqQHTb2+UwejwL8hEn4+Hb/9FatC8JAtMSg4
         7V9Uyc/T9iOyr4NRE5n4CmBq48+VR+fPCkQHKc9LtF6fXwiO9vCE+xB9/SHxesq6CuIP
         uZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCV9M9F9Tg+cbGBRwQEc9veEq49fGNQGyPaE9pkbk8bbJmcQFXC6i5xJZnXm/9O8K/uGxboIyTzQi1PCWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCVFQPeEpHs2EiWAiBet1qtwsYR9pP82tzx6/0esFkPpyo8DHa
	QPzfWSnM72ubTwS0MY8e2fnRWjYX52iGGQ3MR+bvccfhJjATLKG0s1gK2GhIlkc=
X-Google-Smtp-Source: AGHT+IEWipWWI+w17zBRsvJ2a1SVUFVwULgiFjGs2lqP9zfHlHZrgmKYspeYgKe8crsh+sSoe9SBJg==
X-Received: by 2002:a17:907:efd3:b0:a9a:421:720 with SMTP id a640c23a62f3a-a9a34dfb311mr463599066b.46.1729128395453;
        Wed, 16 Oct 2024 18:26:35 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a298443b9sm233768166b.170.2024.10.16.18.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 18:26:34 -0700 (PDT)
Message-ID: <cde3f0e8-7098-43ee-a0f6-6b7dd9a9abfb@nexus-software.ie>
Date: Thu, 17 Oct 2024 02:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/28] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 10:07, Dikshita Agarwal wrote:
> Introduce support for Qualcomm new video acceleration hardware i.e.
> iris, used for video stream decoding.

Its a nit-pick but I'd suggest good practice is to email everybody 
directly whom you call out in your log as having given and received 
action on previous review comments.

i.e. you should email me, Dmitry, Krzysztof, Neil, Nicholas and Hans.

---
bod

