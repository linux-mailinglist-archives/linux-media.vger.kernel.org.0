Return-Path: <linux-media+bounces-14060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDA914F1D
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 15:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E4DB2832E8
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF97513FD94;
	Mon, 24 Jun 2024 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rof1ZWoj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD3613F44A
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237043; cv=none; b=nhKUzVZeJgu1uAIHDgrqMElHs3UOkyjTXNYQdLkgbuhdyEjkKXcmSIqVHUHt+SXyydlkAkzBwKf9KtN6loMZZUUzs0QGWCXMy4JmKf5u1BdrEM6QPy1/qQq1CFjB6EVyLxpf6ZSlWIvV7aS30oRxE0qA5jRYvWUC21ejRkZYIFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237043; c=relaxed/simple;
	bh=z/BP83XswNHp6PKHMVxMubSbUIJXlLjkKrnsqidS72A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRPP+84YmREkSlP5qAGP6x9/HEsJwspZ6bIk9JTYmAovisJKyHId1ObGvdEg0BINg/osDrz7ekGvIlWn22HLYzdiPaFf6/sQxWFhvK4CO9CwoTkZgy3fnVDWxXDWNC6SHW32QfYq16x9Uebo9/hY8fkf0PVBTSB48e60YbgVSUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rof1ZWoj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42172ed3597so25736175e9.0
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719237040; x=1719841840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/BP83XswNHp6PKHMVxMubSbUIJXlLjkKrnsqidS72A=;
        b=rof1ZWojpIIVFC/eolnsqhgcuAvtBrfMVyLuWO7oSY8oYou1sET6JPh8hpYTPXNMrr
         G5E4jHjfPNabx9e+2V59lb3g34rNddCLFVCTCVDE1/qup6t3bVsa8H9n3QcbVM3Ih89u
         75EGeeYcWhC+fo4KoCY5P1+vHiMFSlwkvljyK7/6Moe6vPVxstpcK6zPMoMZC2U1uLY/
         JgncHpdCZtLvCt+336+hZIH4yFBi21oL+0HfRmeYFWXFa/Ty4ENTSLNkBjPWNxyhiAbj
         ryKbkc/xoS421ihJX7HCIIfDFo4SVqcSUOa9FMr6glMNbTO5dkp9/wYQuP6RwZ2+d/bD
         0PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237040; x=1719841840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/BP83XswNHp6PKHMVxMubSbUIJXlLjkKrnsqidS72A=;
        b=XDI+V4x1sqT2B0OQk/+dGAM2drUqF9vosERKuQsKfkHmonsjy+xVV2QgV38qxET3Lk
         GxJK+WMFrtgz+MOCW9E/fkGP5qluicyvNFlIJx7uiVyASoShZZsKxInOLZ2y0NSbLgYR
         kRtNflvMVDC+IEA0+MZvlqSh0PXNPR+kNS2B2SoRC5/VoZFF2mnQMkyKpqrwl77Wc2eP
         cQXmUKd4uQn1o3AGDQMMv3nIP4eOXNE80cCIUYuylXV4xg7FuHl8Do76pJ6h/xOkLZtt
         tEmacr8aQbDHSph8kMj2iZxyUxGUxNzpmGH/KMOrGEsWXYb0tdLBKxPFIOJmjk3O7tO1
         uE5g==
X-Gm-Message-State: AOJu0YyB2AFA904XqbPKRz5m8HNmJSN1O6FsDz/zaAJcoXoDMdZH1tnx
	v8XjXmBuK3upc3SUcS/UumwtY2s21jGOCITu7fuu8a30uiWKutpT9vjfO65HPKs=
X-Google-Smtp-Source: AGHT+IH0UOtcj7+Y/gX1YrYCTnHSIxnGgjDowvhX2IrtJQXZnFX5JX7IQwW3SiXT2NAml6AWjrCWcQ==
X-Received: by 2002:a05:600c:450e:b0:424:8836:310c with SMTP id 5b1f17b1804b1-424893f0aa9mr49757345e9.5.1719237040128;
        Mon, 24 Jun 2024 06:50:40 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247b608f94sm88234675e9.0.2024.06.24.06.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 06:50:39 -0700 (PDT)
Message-ID: <4d2f4a52-826e-44be-b242-55b50708692d@linaro.org>
Date: Mon, 24 Jun 2024 14:50:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 0/5] Add sc7180 camss subsys support
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> - Add RFT tag to all patches, since no tested-by at all.

Have you not tested this updated series ?

---
bod

