Return-Path: <linux-media+bounces-22330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 496C29DC2C9
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAF80B2269D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A44E199FAC;
	Fri, 29 Nov 2024 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCRIb0eL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418E6199953
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732879413; cv=none; b=shfVyIUcwM01cbu+rRXJCZPbcSTwLdbpqAynZKexGXPAIfQ9tHCLyjsTfaA2jDGhvv62KtWamqwQdn7PfBiPPQxPDINFXp1lvGHjiYSwZB395i8So03tkhtpUliMULC+7sWysufYIL9OESj8Axom4s+eh/tRaSrSxkLHxFadj1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732879413; c=relaxed/simple;
	bh=HI5FQjIfiAkbmFy8K6SF1Wgbfg+NQpVtdyas5DXYWcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6nJZ1nQLCQdaoN2GtWCZrin+cKxCgB9+8RRW/MBNoJb6jQcWLwmg1VtDBpfiRzKRo0Xr2RKSSbP1ZNQPuwUNVVUPOYqfBiFb/q5V2igkzj1y+LIkEtgfuRTVSFfpYsMzWuJJY+MYnFeL3N0a63uOeHoEcC7gls6LP8UeEwjE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCRIb0eL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3822ba3cdbcso1188511f8f.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 03:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732879409; x=1733484209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wehBO9wd7/4qEClAe5Z+1iGP3dGbLJy57UrveIk2Hpc=;
        b=TCRIb0eLVfJZfBu2eRcX4tqBOCUTp8QcFS1oVlVFfdxllJ7Ta+WGM80fj4tfD+FAKS
         6amCjjSndnZp3qBuXmy4lZzBrHD07qvc6W4uCE8WJGZo5uYzsTRxY/6u/K/ty5EhG+2i
         0t23FXp/BXk4oL/29FTgVkVzKvjMW1OQ/rqKTmmOTBbW3QDAEl2BHVegWK/LqFy93R4W
         OytmqD39oP1MCAq7c66M5SC3jgGf1le2R8iw73xW7l6leXmqwM6BhlWLF/I7+SuPeOvo
         PbZ62uLpWVfspmrZpl0dzg5tCGIwkMzVWD2QY32sB7Bd7s9ALFYFLyw1gDUaaroRM30i
         kESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879409; x=1733484209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wehBO9wd7/4qEClAe5Z+1iGP3dGbLJy57UrveIk2Hpc=;
        b=eYwvytNF5o2faw833FUoRCSGc/aXAK/eWVPuYx2UZXsRewP+Xz8hE+sb+pRwtmzLrt
         XchPoWRcEztmjf608d2KQ5hRrj86ae6XNbx21PRv8pWwbq4c+iovJzMxU/Z2PeQABRL4
         icw14IF2iXFO5nYyiB86F0QRXL6KUuPbH+6vkIPdtLjvUMuRq0UBzaQ8GKrJGF3/gmJE
         a8ELodm83N00RYIuR3IkNl1/BU3LPjBCBN8oyfHph/W9+A0c+RPcnc18m/q5QWWEm3hH
         T8bQri211GhXVXPF2AOlik0RvqbnP8+ZfZZf84njyhzsjxhI7SPSxku/nyKp0mErHD0+
         PCoQ==
X-Gm-Message-State: AOJu0Yx8hQ+S4khaO6nz82dtLOrdWgqzBmVBG8kFwqIqapQqLkRPH8iK
	E/DhqEayVS+3fArgl2QjjxZvXgRrVKue1sxOXpNf7ZoPP6oLaI4Safi+4FlDTfw=
X-Gm-Gg: ASbGncuuQYPOUyGdLOeofX5vMdrCP9koj3vDeFtcnInvZIq0a/MNZwALtD5MnJJihYf
	o9HFQUWd2BLFZEBPFTF85rtS4vAlKxmW7W+26h27R1dSmCIb+WZF9sbvsKWycGa/AQZ7uvHWYJI
	JOHo4EhYreqVAYuZevnOONS3oj41spIoTXDxgU+DYwwokXZha5hG3F/rOAjE8mZU2YtKX3B8OnB
	d5sKV2ngDVhZTVaRCJWyZC5NLQkdRbOpawTo4lEpcHTpTMENleTDQtyALBQ6ww=
X-Google-Smtp-Source: AGHT+IEAXNy/RWJn3Zcpg6BCPHgms/2bmga++LC07nE1WotVMszhnyHL0BPNUcD3C6x+4g0hwK/XgQ==
X-Received: by 2002:a5d:6d8b:0:b0:382:49f9:74c0 with SMTP id ffacd0b85a97d-385c6eddb90mr9570707f8f.38.1732879409622;
        Fri, 29 Nov 2024 03:23:29 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78120dsm80940945e9.24.2024.11.29.03.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:23:29 -0800 (PST)
Message-ID: <02029a14-3cc0-453e-b1ea-ec7dd30dbb33@linaro.org>
Date: Fri, 29 Nov 2024 11:23:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 11:20, Vladimir Zapolskiy wrote:
> There should be no room for suppositions, the source code is open.
> 
> If the described by you case is true, and vfe_pm_domain_on() fails,
> then vfe_pm_domain_off() shall not be called, otherwise that's the
> real problem and it shall be fixed instead of being veiled by the
> proposed change.

Maybe, maybe not I'd like to hear more from Barnabás on that, who is in 
a position to replicate this bug.

---
bod

