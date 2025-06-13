Return-Path: <linux-media+bounces-34720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0263AD8728
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4575C7AE075
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23144279DCA;
	Fri, 13 Jun 2025 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HvjuJMbP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C725226B752
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 09:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805622; cv=none; b=GgNvC1ZKaagD2tJG0aK/SzZwwZ2gF77lw+9slFb0bjUCOzx38JxhooxYHs3l6YIiafgdgKMFF71vw2YSv0EaReES+W6qarjSQKf0Brimjd7J0j4LlG1tgafZuqT99/30nq6UCiCm4ZAhP5F7yWuXn9VSmKuZ7axFhwpME/VUBFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805622; c=relaxed/simple;
	bh=8v8z1FWUX57maURUPqyPWtz5XnEw8s5WyBdF090ukaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RtYm1BJJXULpGrgsNGbBnuHgwv6ZwYMVn7I51Lse/Eb9QsX3jZddO8D4WnyP8rJkgZiG6m5PvYVU87nBA18JKQfUxxpEcbBze1TndHmixfMi5oGl2jQJMZHREZEsht1vhoQYjdiRiqPRsD0ZNZdrkXo91JVUJc9ss2yp4cxH6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HvjuJMbP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso1182204f8f.2
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805618; x=1750410418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAaLTxJxQSOBPK00di1TiVD2/+bDYxSeLtNf4ACwwZ8=;
        b=HvjuJMbP4zRa9mzC7FnrPO+1VPy2z6aD7J65FW7MjGkmq1+gQ+3vbxCZqmWtqix2lk
         mj2/tFrR++a6upnzkYGEVSROXbdGGMVhbYD3HVO9CrpbJkfwr0GL17Jry9fsXcfROoPQ
         33mgjbDHFy4ZnbKPiMGOTNifJ4bRsDtYxIRG9gkIVOpwYf/Zdr8wLT5bv5FAW/t5kIpG
         qqkSX1ADfEYzVnLW0CX/xh3gns0opLRBDsrJgV3efWqN1SSmRL9OMgVDjyx5CnyrU3zN
         jF32I5nxduTV+101a9XPTDr0jgU72Bu4JS1ktN6bpGjZZ2E0iQV9VilQlJh43Rfj/fir
         /nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805618; x=1750410418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAaLTxJxQSOBPK00di1TiVD2/+bDYxSeLtNf4ACwwZ8=;
        b=h355HBcvIr84aciosQAVa35IBRTwkZeIgYGamjG4AHcDq7meYwPPgJcYdPlUWpkrA7
         UJF/t6WM38rla2e+J/U/H0tAJrbw21OlGv/irE9CnNAvwL8vY0PnY4KqFjxXgiV2Tbm/
         zA/u3VRR/J+K692DKqaXha8gy36XIovydRw34HtIE4InLi7y+Qfq3MCAZmqmUdTTXk7C
         8Ghj1ePAPrhSRVDe82y3B0sUL6ulte/KOYlPkmsMUVNx9emkTbCUaln732Hs0jHt7TN9
         6Dkoe2c69XjAbSiYwMBdUjv4DaPY+FWUErGG0fythzMOIEqMUUnKAfn1QzCJ3P8LR39v
         y3Pg==
X-Gm-Message-State: AOJu0Yxn1EeK2fHS1nDA/NWx+YN9xTHAhaxhJda6uM0ByO7n9Ni+SO2A
	SGUYmTHpy8lCAqoSf4GieBq26RPdLfN0gcAYirmkcaqKWSxiqH0txnx1kxsok445o/Y=
X-Gm-Gg: ASbGncssjkf/iYOTj120/XTFuKszoBzpTO48qJo96YD9bIn30s22FL2PxWwnI6+yOjE
	fQHrC2mbj15aZCN23U7WlGrSfJnN0UGxl2RJ2rlFZamC+hpmyPAd1W44iTTO7OI6BQx7fWoiaIJ
	SsNV7S6x9DNSpsFynoT/m5s6YqtLZrHL1bYBKttpxcCXxuX3IdjtcGDlfs0ZPpmwEc9n8Fd8nfw
	6HwxIu3lwudNrECySUeZ8/01gJl/ztN9lP3RnjslI8266mlLZZ6WwktFfGKpkwxLtZdrJHXGOHI
	GOpz4QyHIWoNFaj7P1awCHrXoGK0mwCWzvC6boqqKVxhdOKJcXSxD76VnpC6mF4HB5IA2PoPg+L
	9KET/PgSY4l7RZUB1f8n5PIU0cgo=
X-Google-Smtp-Source: AGHT+IHKdOCCwC/jAonAVvSzRKtYvh15p1CjD8HlQ5r/BgxWYHTNJHTzjvvWhTBYkJFMfKkTw46zjA==
X-Received: by 2002:a05:6000:24c7:b0:3a4:ed10:c14 with SMTP id ffacd0b85a97d-3a5686f59b4mr2265652f8f.14.1749805618134;
        Fri, 13 Jun 2025 02:06:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60d0fsm1721123f8f.22.2025.06.13.02.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:06:57 -0700 (PDT)
Message-ID: <c6f463dd-f3e1-457c-b83d-29daaf7a8d00@linaro.org>
Date: Fri, 13 Jun 2025 10:06:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] media: qcom: camss: register camss media device
 before subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <vSVeMnj1dcmWmxoKEUeVmrGbtTJrcjhuCtom4Xf8vz4p_o8rEeZNaeyQGylGdx4vE1lgUmUwTCYq1aWf58n_AA==@protonmail.internalid>
 <20250513142353.2572563-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> A media device can and at least for sake of simplicity should be registered
> before V4L2 devices including the ones added on async completion.
> 
> The change removes the second and out of camss_probe() media device
> registration path, and it allows to get a working ISP media device
> independently from connected or not sensor devices.

So are you proposing this change to simply the code or for this 
secondary reason ?

---
bod

