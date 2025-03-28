Return-Path: <linux-media+bounces-28916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DABA744D5
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 08:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28858189D87A
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70567212B2E;
	Fri, 28 Mar 2025 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojvxDjOm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F0211A23
	for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148512; cv=none; b=C8E0SCM86ZAz2HzZaZdtw/ef7ZEW9N4SB3VHZ9h7K9N9XOxXZfQlbTbY4B6UKjxaA5kKXK5/AD1ULbH22GN35covZ8POG/6VI8PP5DVihMk29LkdaJ55FpRzPOfPJJr608vKXE2A0kqwBp+eDFwOP7ElyBoy4iIJh6cMDFizjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148512; c=relaxed/simple;
	bh=xV3ubWRSP9X27kr+HNSp53Ck7rd6mxMunNt/PfznILI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wt2GyJ1GMtAzdXBwy3rtvZglkzUIrqRAqjvPrTo6r3kHxG62SGXb2tJfCcZCQpG4A4hDlsys2JayLB69RDTiL4bdZD0enA5SZ4/POuX3UIAj+49+7Icz8EVBddCGg5IH5rbeICCMrLBME5KNw5gI/0DFybdIkCg94qeMl7o6Pag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ojvxDjOm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf861f936so3081955e9.3
        for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 00:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743148509; x=1743753309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=solx7Dis0gE+7JYNYmQ2OzOUHyi3j61zlr/j0iOPP3M=;
        b=ojvxDjOmvlpZuyTzgEjboOYKlXODyZFw0e5CZsqXHqnLfuN4HrjnghcrYpJ43Fxm5M
         95dhg6kC7qSsh0gqFOmZWhI08FxjIkZjZ359h/24fg79Z7pYTnNAvclrEXXwurLpWWHE
         6I7F4A/DNIbPOhd2pzSEfV3j6Wrg0s3sz/6b3dn5wBZjyDvx1FB7g2P3s5sa4nXY9qTH
         eGaFlML/YmbWm1Pt3asJcant/QOxuCP+xZBi9eJ1yQi1gFmqQPLKuX5P1Pxa2M/Rvken
         f/EXQPjYimddW394jiQRKt/rNNhVKKR/ksOEjOaWoswTXgiDIhPdK81k1thUePZ3Gk+4
         1FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148509; x=1743753309;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=solx7Dis0gE+7JYNYmQ2OzOUHyi3j61zlr/j0iOPP3M=;
        b=eny3ojHvQwP4UUbuWH34HWet2V0rAp3h5/j9a3ZH9D6d/DXM2vSPFGHQbvDzvHbRRf
         1PHGDlER0nyy89m/aYFFTyVeBdEFs9ynOnaTEt5xJe6E9RXiUFu35c4bKePFreZ/3BX1
         gLE+lG4aEhEjNY09m14WT9+Y8/nYF9tEG56vs/0gY4tKt8P4xifrhyhXc1/wZMkrJkNu
         7exNprCgghTzPE0T72BZfblqcRDC+xtCwKqBLbomi2uM69rJwFQ0Rjyt/NYFeZ1zR9Pv
         I/akiOPPzpvyvy0oM+N5Lav2A6vCYX/sSvNVxilyMfggEKgGd95vACi4UqZ0dcxO4kac
         xYrw==
X-Forwarded-Encrypted: i=1; AJvYcCVQT6HkJvqPFLTLTdZeogh/pj5TCvExkk4RnbUjM6nzD9p3dIM9LdSt8pXr1ssnz244G+aa8ZxIrp0eZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNfFFY9OdUk4jAU6d2jMP2rZPkCdLnXwjtyoyhDvMCI7NBjOk
	BonXyWibtrZJfstMHMjkDMw9LVzXAvDyLMQDvpS+wXzXYd5QfvR3hy2WLfPQEhI=
X-Gm-Gg: ASbGncucvpm7StAvUMfCA40VMjWb9Y6qWZLiobHJd+VyeNERzW2MydJa6agoURa5AS3
	DTyxfrehkSqDvCbELcIj0jsRfKot5b+TVpSd40gnL/yTYcgaAWTnrJAN2sumvKoqHwkuXqWP/MQ
	0zlOYyHFOvUViPiTm0t50Seb9WUdNRd/vXNJFruUliYAwc9PO5eye841ELgYqVzOQjhKQLwdKNr
	1q/zm9cOwtaHosmujKX8OZf4Dm6xh76CdR46LQj5tqxXKO+oyprWL5/BDCN27co4KEuga1UqFzu
	ezdjI6yvAxgBzZqsvf5+ip6tt+n10xGin9bHvCsSvSBHsohKeGkK+G2mW2QDYIo=
X-Google-Smtp-Source: AGHT+IEHvndLMnB2b6pDkNOguSz5DRtNg/YozvR6Axjr+4e3jS+kVAnROVX86gyToM29NdSFUXff7g==
X-Received: by 2002:a05:600c:1f8b:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-43d85c9fbd9mr23445045e9.1.1743148509503;
        Fri, 28 Mar 2025 00:55:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314b5e7sm63183575e9.35.2025.03.28.00.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 00:55:09 -0700 (PDT)
Message-ID: <3943aa01-103c-4947-9492-27f6d9eb3df0@linaro.org>
Date: Fri, 28 Mar 2025 08:55:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] media: platform: cros-ec: Add Moxie to the match
 table
To: Ken Lin <kenlin5@quanta.corp-partner.google.com>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
 groeck@chromium.org, hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, tzungbi@kernel.org,
 u.kleine-koenig@baylibre.com
References: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
 <20250328104619.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250328104619.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2025 04:09, Ken Lin wrote:
> The Google Moxie device uses the same approach as the Google Brask
> which enables the HDMI CEC via the cros-ec-cec driver.
> 
>            Hans Verkuil <hverkuil-cisco@xs4all.nl>,
>            Mauro Carvalho Chehab <mchehab@kernel.org>,
>            Reka Norman <rekanorman@chromium.org>,
>            Stefan Adolfsson <sadolfsson@chromium.org>,
> 
Third email, no improvements.

Can you please slow down and read the comments, respond to them or
implement them?

Best regards,
Krzysztof

