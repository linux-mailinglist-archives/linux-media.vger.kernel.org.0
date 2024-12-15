Return-Path: <linux-media+bounces-23425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B26FB9F2195
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 01:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C52B1885864
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 00:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F1A15D1;
	Sun, 15 Dec 2024 00:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ohEIJBoL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2751936C
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 00:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734222215; cv=none; b=QZkUjWCu0LbonnkjTHDzXfOOVD9eH7ETXjIBpX3V5zt+Vf4eX1UBH+r2jXVUW9kcl0Oa6/L4rYR/GcJoQShB3JlcMmCylPqs7A00519VZQgrliQcArZ2LS1soD7ywba9U8n9IqkiqxsH8YrG/ANvi9DasUvjOox9rzKC15rwbHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734222215; c=relaxed/simple;
	bh=6OLX7+p6C4VaWJfs3oSt7FIzrOUWmvkxb831oidGlvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ULNufkssVL505D4VLP9ENFG0NOHA4p/dDzXr0J10n3kUN9sWwjnlNPET2b623kaEMK4mJpQTAlGantr16SyLRzvDrbS7jn24fg71G5u3NNlXJNEIUVTkvLTRJau3apBnuCwDM/Lz1poy2/Q8pbMng1N+aEukFjgf3S63QCvKIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ohEIJBoL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso18102765e9.1
        for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 16:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734222211; x=1734827011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qA91UOzKmZKnce14Bm0LJOP/0EteSrXXGG1aZs3ywA=;
        b=ohEIJBoLSRrfoVOIcg2uL1mbmIhF44QzcVItbRGXYO7mr7aBfWtpNndg2xrbgrIoS3
         xsq0AJLkxJ9R5kjNbjjyRp/sPeCql1EfLjhgkmI68bGUTVmLmbZVXEaN2NahghtJSzfb
         ivY/np3rjmCONnZ5a7BV0XXatUcrPBzFQyO98MfcK5IxvSYLq7Fh/Uzj6PeQTPttbFnn
         5jb9oOhmBstQ69ZpvL/GzoVFiPFyQgqXlrbJGs7wDhdPZLGjqbo24WcJaId1olWejZWU
         plFSdgNOeLMJkG/GagCeWT+aNeTW0gTivyqM6hbyqy4/jQT2HJK2ul+J8pO0nlGQ7MKA
         wvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734222211; x=1734827011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qA91UOzKmZKnce14Bm0LJOP/0EteSrXXGG1aZs3ywA=;
        b=VkDY7T8sopTevQ20gfbLfl0AoRLeBqahPuTn8RdlWQ7WIMa22BvjvUQtb8c7rT9V2+
         ZW3SnL6Zg5+oqkYoWp45an25D+aLMPvgpF8ktow/3bTXIrCasEeWscdh6hZgjxW6lVnw
         O46ad/Xif1BBbkgLSbmlACjaaocWDplML3d66Vc/8jzcogd02vQLoWQr7Jlg5OIhlGEr
         GDOA7Q4z6V/NXvTgBe/aiNTLddMpyEP8PNLAaooPQS/dZhQL3yEEqa31EJvTJUxGQBKD
         mYajWzwG9jh3nJCO56ZW0vxgpEaHUPvFASnH9XN9MKeYhWqm4VA8ZY+euBoUob3yV5NJ
         7W2A==
X-Gm-Message-State: AOJu0Ywsf1v96lqmMuwfHRySba6o7ctI9mQTmQabtdsVMXASpYiygL6H
	AheyZJdW5ODH8JLmq6xZ4nnDeUF1MHNfeS5TAsbb5z5EO+45ePSOABM3MdbgFoHoP14aSnk83iA
	J
X-Gm-Gg: ASbGncvuxEX4v4PFxx4LPVK8W/4HqrAvKNudsw5Ekugpmyjz3p2sE/ucfpUhuiHb8Ue
	yPzFwVslh3AHQwG1IHism++4FUlPmjuSJHOpDoyYZaSpAOOxYdJheZkZmuGSoia0TIZdaHMeS3D
	otSL3zrsvi2LfjkqPnFoxZeuQDm9I2KpVJ9oyfoVaeR7px0ImKMfnnTzLBBNQcw6aBYHmclkm2Z
	d5p5bVg9zXpNPv4o2k7tZz6XH0tp+JoGoRkIDjc8CE+WoupGbGnawNz83ejgrbBVzWLOA==
X-Google-Smtp-Source: AGHT+IE0YZehaI4ktspEFjyIJQiI2jNzS/YcAnsGx4LXzq/OtdsJp+dBWF5z6pTK4LkEZ964XeVS1Q==
X-Received: by 2002:a05:600c:4e10:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-4362b10f320mr61604125e9.6.1734222211209;
        Sat, 14 Dec 2024 16:23:31 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ec46sm94429295e9.20.2024.12.14.16.23.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 16:23:30 -0800 (PST)
Message-ID: <64b0ede0-fb88-4473-9229-3d2abfd53a16@linaro.org>
Date: Sun, 15 Dec 2024 00:23:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Revert "media: qcom: camss: Restructure camss_link_entities"
To: linux-media@vger.kernel.org
References: <20241214-b4-linux-next-revert-link-freq-v1-1-5e970d05dfcd@linaro.org>
 <675e1c0a.020a0220.7d53.0d77@mx.google.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <675e1c0a.020a0220.7d53.0d77@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/12/2024 00:00, Patchwork Integration wrote:
> WARNING: Commit cc1ecabe67d92a2da0b0402f715598e8dbdc3b9e found in the stable tree, butstable@vger.kernel.org not in Cc:

cc1ecabe67d92a2da0b0402f715598e8dbdc3b9e is not in stable right now 
that's a SHA from linux-next !

That's also why I didn't cc stable.

---
bod



