Return-Path: <linux-media+bounces-45776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6ACC13D73
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4FE1A24972
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2E83043A2;
	Tue, 28 Oct 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgpzSpBj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097AD30216D
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644085; cv=none; b=iaPxILMtOkQ4i4kBcMpgn4ZDfgzXt0ZR7E4nytfsEbfZab+3zhYGNIRV0chJT1AuHBbgOlMRSST3zxQwfXdUlTo1+sNriAb8LpHhYfMlUU32auIJkzN7scoiaL9a7aQsuoqK8Ynfn8AkSPAGrBnn87tWHHyuPCcdj71b+76WI7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644085; c=relaxed/simple;
	bh=ac2cQky0IwlGiqpgXPO1XMOU5eK87nY3Jt30oDW649I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZG+6zeVviRd7sr4c005XOCDAQjIupJsoWJfmjdTxqs0agGaUN3SGgDU4UngN6bVE5U7EyXuRpj7bi46tGglgYuINgAl3qIL84vtDXLzQVcMsfG7mKjgmVOSj79vcfN4DdQJEAbTX4VDofnl0Wq9X0NV7Msm+Vf6tuNhpsZ9hCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WgpzSpBj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso20152245e9.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761644082; x=1762248882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/LALU22bj87w78nI48Ei34YpYAmoKYu+jDE6VBCbPs=;
        b=WgpzSpBj+JIL7I6HAeFZQbV2knyhoxIDxKIQXQlem26fBvtp5VZCsL+UdiQ3lRQJ5n
         fBmdFDBVq0U4XKlPmxhnl+CjylN+Oum+WPBrQIF/AH1qFA3cPEZbFO9hptZ2j5G2OjDl
         vY3QG/pwW3ZzqzZXpITH37aZIF+SB5y5anwQPUK70WQaz2vhTEO8OSYqV9Q45FLEq2fZ
         Dwha8fMKi5/uAjbSvNJNvW+rdwVkdt8iBV9TAxVyzG4lee+AL5V98MU3juWJVGC4aYt+
         H5YpOydx9D9f/0BJbNkB3H47HODBIjcll4M4CheeND0pEGm4TnZo5un15H9oP//tbFfV
         rm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644082; x=1762248882;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/LALU22bj87w78nI48Ei34YpYAmoKYu+jDE6VBCbPs=;
        b=FffTqirBybty0ODR21HydN3giJESOQDWpZZNAfKJhX8VhI5w7Ad4GlLx1V6/Aky+YC
         0FHiOcMy/E6aeGbdtH5/jDuwEY226o09XXe9LQIeHv+KYmD1tUOxMNLf1qSOVzU/Ci6a
         RpGQtqE5+zN5Lu0i5yfkM32WLjdNPcAB0B9yJJxbVeXp/n5dcOjBU5hVcZx+EWt1D9e9
         B2tzkE3UU1p1nUqRWzZRyQtId7X1FSJ5KIPNGddWbUkaNt32yigbRO0lSZ2fddL4Qq/j
         wuQGU5J1GYG8eoTjLsaTbBiycYXtHONQKwRj1RHkFHzJPsr7pmrj9T1ZXpp19klyn/03
         iXLw==
X-Forwarded-Encrypted: i=1; AJvYcCXmoooSX3TJ1qvljK/lqB4U8jyF+5g8fwMfMqeoBYLiLZkF6WipmkLTkmBp8aEBIljcAh5l4KToHTdamQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ywq+RyOJ5oHlzDNxVhGtQo9GPyxDRDygBNsBLa/n8bN1x8cg
	Sj0EZbZxSlF21nJbu2on6YJ7sAdtUjWxOcbnuz1i1TXVwxAKZOK3ruW4862dY7SJRoQ=
X-Gm-Gg: ASbGncvRUxoK/ho3aOa2XZ7Iej3ot8eD4CwWUE0WF4QONOG1GHtwzBNFPXXqyCWH2Hx
	aXGD14Cl1S8wFVpCtw2sLASL3SJZsl+dt6ivv/83+TiDKpOj9c3qyLRGoSnTIHAmKLfRi2x6rWk
	D5MSwS55vkS5CDkFuhwkqA8xpN2+u+N1UkN1uKCPDmRU1gXIiPum7ok/hFMoWNjhCX+LCKMninZ
	802KKO94QoZerhZE/8gPC3/0iLHjdrV+ZHO7UabhNKb7xA2ep6Zjn+iLsrdf4P2F8fSHe59DDcb
	HvxcChkCBoABetpkm+XYp6di8Pav7eIX4JjGMYxE8SRSXvL44BOGy8S7JAHhnUaGhTlk7vOpKx+
	VrlPPyjIteJV+oipohXxS2vXKLKL8k+9mSTUn3WEsvNavAUNlzL8Ae6veKszsv/qR7CZRHo7XQy
	NOIuThYXLxt8D2Dz60YWOpRbKjJ30FnPno51L3M/v8E30=
X-Google-Smtp-Source: AGHT+IEBsjbGhxSIADHKU/jkeoO1PtNiYWdQlg9Ym9NskralvCLvbd/sbcWeV6cauCEQmOzMHU/aag==
X-Received: by 2002:a05:600c:4691:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47717e414a3mr19737305e9.26.1761644082274;
        Tue, 28 Oct 2025 02:34:42 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da12dsm19563607f8f.29.2025.10.28.02.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:34:41 -0700 (PDT)
Message-ID: <22f63af8-281d-4783-b770-36cb1feb4732@linaro.org>
Date: Tue, 28 Oct 2025 09:34:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: camss: Add Kaanapali support
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2025 10:14, Hangxiang Ma wrote:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSI PHY
> 
> This series has been tested using the following commands with a
> downstream driver for S5KJN5 sensor.

A few comments here:

Publish the code ! Its actually in your interests to do so.

> 
> - media-ctl --reset
> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Good to see, it would be nice if you guys could also start running the 
RDI path through libcamera - softisp soon gpuisp and start showing some 
realworld results.

Not a requirement to merge this series but, a strong suggestion for your 
own verification purposes.

---
bod



