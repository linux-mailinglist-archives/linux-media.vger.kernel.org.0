Return-Path: <linux-media+bounces-14142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F0F9174E9
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 01:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E080E1C20A9B
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 23:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6EA1802A5;
	Tue, 25 Jun 2024 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVJ1oPak"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82639143C6A
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 23:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719359367; cv=none; b=eib/IcPbSheb509KfbDiq4cD8eN7NizIIUH8yHsOB0TosJzuglFJndbT0gPIh+M0nBmqQeJfC6kaR2+RpwcwWpzSXIb3XinvqtxB7OuXSS6AgoFSAjfNpIOzWU6k18ah91IUmnfj5PEopaL3BMA1EmEv2w6uaLFyfRbZVLufWuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719359367; c=relaxed/simple;
	bh=2ZFq/h/cdDU27DXX0AmZ/Rf/mFbsafxBM9Z04LggrFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGuB0N5UvGInU4ZZahkRB5y1p9Td3ld0TfAH5Z9XNbulj9tjOUUJPumSXVSGi98gazYbF0ULRisYIv53UD3nhntZw0L4TzVeuBjKSFmp0ZtM2nYpwOjVEfPz/7hXqBie25wYW5CteZfq4PbU2SytGMKrPJA3RqapDwGge3dWqEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVJ1oPak; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-424ad991cbbso2349095e9.0
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719359363; x=1719964163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOxs9q/KRWV6ovXgAREtQ7mXRlDPaMH/Kc3byJkLH+o=;
        b=GVJ1oPakpgne40Ae/T+aVqhJx71YOugP6H2+3Nn17d8cN+rJee3TcmEfyn3cPNYLNU
         HCygAcdj2CnXu0ptY3b/a7xcBXylJOplqblrrIYWGc8p2boE6SUru8VZNwdDeu8nLjlU
         4W9r4CK8p7VxBI661+1CLFmmFVDRnvOGKDJD9xqq2WaTtHS49mKDmUvwbeEXqo0/R/GY
         a7TBFL/m5taAYU/aGQN3oXS4ULEZBSIdolrSOpaqCSaUKdaGs2ys4VWv2mqv3dazOlho
         WSaHVtN6in1ePDDNbw+OlWMaWb0F3lgVfXpKJetdPsM2zVoG4CHBWPMtGHnnaN6VTpqL
         fj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719359363; x=1719964163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOxs9q/KRWV6ovXgAREtQ7mXRlDPaMH/Kc3byJkLH+o=;
        b=kXC+n+dGTVvZ81CTL1H8j4h21VvgwHT9q1cXfBurwW/w4XdkGRfuJ2qQP4Zm3sV69d
         Y/h2CUF5ppkqR+ZQNsNvbM5a6jnvaOLTecmfPxgDDNnFzQAK+7nxDb4hmithKxVIDif+
         mg9eiJHJUbhh6AZOgjoQi28yqIXSLfbjmnbDh/uIlCBtO5aHr4pT0KFfU+dnC7j6jnK8
         1BJAw9DuZvV4dtVo4o5Pn27Vbp37uzXJUp3TJ9HIRdmKic9v+HZY425lqGrNkfhSuMYt
         S1IqqKvSGD/+rqFqGjFWmmDfTecxKM7iKIvxbd7pfAxBaaHg5EZGVKrTzrCYwDQfFAGh
         8gxw==
X-Gm-Message-State: AOJu0YwvrgDIPLds17ORfs8+TUY7CiiuoGhO6muLRjHui1RuWMINAW80
	wGYRUg1DG9XvHnOwsoootvybr8KLuxqQ8YiOqeCZuZBXg6XJ+47PRj09blZY0/OZMjEEIIma7Eb
	gVtALhVtq
X-Google-Smtp-Source: AGHT+IE300h3oYgIh4+YcZq9y1SiitbL6hkufbwWeabZwmZQrEHKJL1469s/fCZ0jlsaVjC07ffmXw==
X-Received: by 2002:a5d:4a0f:0:b0:360:8e71:627f with SMTP id ffacd0b85a97d-366e962fb68mr5516528f8f.59.1719359362915;
        Tue, 25 Jun 2024 16:49:22 -0700 (PDT)
Received: from [192.168.0.16] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c789esm14227767f8f.91.2024.06.25.16.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 16:49:22 -0700 (PDT)
Message-ID: <47997e61-26e5-4643-ac69-17db09be9bb1@linaro.org>
Date: Wed, 26 Jun 2024 00:49:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 5/5] arm64: dts: qcom: sc7180: camss: Add CAMSS
 block definition
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-5-89ece6471431@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v3-5-89ece6471431@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> From: George Chan<gchan9527@gmail.com>
> 
> Introduce camss subsys support to sc7180 family soc.
> 
> Signed-off-by: George Chan<gchan9527@gmail.com>

This looks fine to me.

Where is the CCI and sensor stuff - could you post a link to your 
working kernel tree in your next cover letter ?

i.e. I see the clean kernel tree

https://github.com/torvalds/linux/compare/master...99degree:linux:camss

but it'd be nice to see the tree with the sensor wired up too

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

