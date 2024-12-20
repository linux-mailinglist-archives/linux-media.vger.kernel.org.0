Return-Path: <linux-media+bounces-23918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BB49F943F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49F4188CA3B
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92949216386;
	Fri, 20 Dec 2024 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzGjiYYx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA84215F41
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734704865; cv=none; b=D+1PEyqy9ao9IRO+lP7Lq88G7Vnu1z3mLCfe2r5YY13b5WrIu5EHxdqfEauafYwr5JS59FL7aoxut7CjShpBwWCYGJ4N9X9TGK8nUzyesDN01Xlw4eUaMX1NXyUuaOm8IKpVpT8Bztr7w6Uz1johfLN7wtmtefGsUmHnjCrQXfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734704865; c=relaxed/simple;
	bh=ugKfoPcP/Xu1opaEj+SOndwzDz876K4Yqkk4LtsRg3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+FyjJMkHy1Poh3E5B113Ucbh3+rsPRGSSQbKsj31QAwmw4Iv3HFuqJExFNk4cmj6iZSsg5aFH8WPkLLNm24Bucmy8KspF0noBPrnYEQn53dMk/jaQBkWHTTyoiszTLetj2uUKupSPK/xWt9+TRc0wuW9L0fGvUn+u0aaPhd6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzGjiYYx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso13621065e9.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734704862; x=1735309662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpzRfQq/fw6JeEhzNuIJIHVIFokJcrYlcF6FJ0wY2cg=;
        b=EzGjiYYxybvisuNgHyKnm5qeyt47YAgSI4h21d4k+BudwMlDRgqO1fidzpRch5Xrr3
         Fd3UCZu2bbyD6+pLjn1nRuJ/m/rcMoHta6rH3zJVqTq/ojmep7+462oLr1Z78j41MVVU
         ThVCBxuhdmSre9zCssDJmTG6+ATkqDr3w9t0NzZvLhJLR1vwT4E14Gjj73oCBu5/hZTd
         wOB5MEFh0W9Ka1c/9iwb+KYNDSBs6d6XXytjSp6DbP2hBsXrnYxaXTasz8vVOf9SmDZn
         qi6LEOHZGWEwbkOVq/R8XQmG4ZbAwGQ5fBO09JtQ/tSJytGWMXaRtlBwqQytlrD0alUV
         KYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734704862; x=1735309662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpzRfQq/fw6JeEhzNuIJIHVIFokJcrYlcF6FJ0wY2cg=;
        b=v4GOjdIJNElP/xN1HWgWiEMfEDtHe2Hs3VSGcx75QZ5OiCrwwOE4+TwLf1lPDOHBB5
         Pa/Mw+5o8kPmYJzoHl+WOYVOZrhdVZz0tYufS0i7glv3MT2h0hCE/KqrVJF9ob5sbKcN
         b48uNH2iCAXI7HHKbrVhzC+t9QNu+HU10zriaiuZqp89f2VuUi2561q0A+H+76rZJFxh
         4xhMhuzaiq/DInkuZhDK+B68R0LvoKuPcqQZYNi77yd+AzUWTNfpo+37onMBsyNxoMu8
         titv40/RvFyxGW9RZ9aBlTOsbrbvIIxSjkuAGfhadPVjDpbPc+cgISTLZ10LEObe5wmC
         BqRw==
X-Forwarded-Encrypted: i=1; AJvYcCWT6lDanHZ37EOAU5nkIUTae18wiWP3b4mIzv7oyUG2xXYBjm1PV7/FSqFycYybKeg4rex3CF2WFWfGIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuvQs39lgERW4jVAtPPnnZUohEe/7qIqWvE71vwSx7VivpImpM
	bvBnCrjwLpx1B68wBwWY3gs0kyuVP63oGtiql4fj3Mn/75E7Ou6CD/YZjZ7Qo5k=
X-Gm-Gg: ASbGncsglzrQv0toMsBWAyLgvKgmn4EWIiAJwrYJBpmmjfY3Kkn3x6Mlkuy0JC7Y7Ex
	7qhLxIm+ljbwN3AuwBLFYvnUjB2UKAvU5ErT/APeoytV2JgzgGLbVAEjAPLlxtGrWSvhU+87gYa
	am0bH59t5OtpKSYqmHTQ/L1N+R8iIck3eZLQQAVK5M4aGgKwdvINQMrYg9Z4pas+U8vOGNal9CV
	dUvPQGNnUrm9XSBsoOaZTK5PVkLeV0P/PugTb6XQSmx7Xzi+H3rmTrVSUtsGW9F7BttGQ==
X-Google-Smtp-Source: AGHT+IHzB2iopqh68lwwJkReMOJidpYHyl7rCqoRSWwwx9c7+No0HlNEgDyCviSrRyhppUcJ190CqA==
X-Received: by 2002:a5d:6d8c:0:b0:386:62f:cf18 with SMTP id ffacd0b85a97d-38a22408cc9mr2979556f8f.49.1734704861729;
        Fri, 20 Dec 2024 06:27:41 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea423sm48112535e9.2.2024.12.20.06.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:27:41 -0800 (PST)
Message-ID: <2349c1b9-0cdd-4759-9f2a-68ae53f22391@linaro.org>
Date: Fri, 20 Dec 2024 14:27:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: ov08x40: Properly turn sensor on/off when
 runtime-suspended
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-2-hdegoede@redhat.com>
 <a2efc7e7-6e73-41b0-b8df-ae28175d7dda@linaro.org>
 <e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com>
 <c9f237bc-40c6-4b41-a963-abac306458bd@linaro.org>
 <a2fd753f-a999-4d17-b799-be4a6ece7bea@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a2fd753f-a999-4d17-b799-be4a6ece7bea@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 13:59, Hans de Goede wrote:
> I guess you are going to test the rest of the series and then provided
> a Tested-by?
> 
> If yes then I'll wait with posting v2 until you're done testing.

I can give you Tested-by: for the series now + the change we discussed.

---
bod

