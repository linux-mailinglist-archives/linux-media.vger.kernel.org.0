Return-Path: <linux-media+bounces-14139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA459174C6
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 01:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9437282F25
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 23:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EA31802AB;
	Tue, 25 Jun 2024 23:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIrzG9LK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C9B14AD20
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 23:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719358457; cv=none; b=Poyf82Wa6bE2BdD63ccr7Dkqn+aCCTdft3IC5v3ZQ0jEj7U9KAteUOxmNbpyACaOcT/ClqLxwCzatVepIZPfazM3Kj88VLfhha4TyjUU6PK7uTjXmKPf2NYpl6LEQI/DBeZhfHhseVfz4N8GPFNd/vgVpKE2BZir82vBXlnwxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719358457; c=relaxed/simple;
	bh=mLn0tpfY3wX6n2AZATrUrDOBcvWcfAJkUXJ0j1VJo/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIkUREpa2akBTG6r+d4it5Ck41vyhnWlR+m+LzDzF1/kw0RGyfk53Lb4rmUec0SC087/bc2b3TOJUBXEtgKLQrPYZAmq8n5iywRZbfCs1/pl501U/T3pm02IuuENLLBMaz2aGCv7COZ/uzgcd2CxVZC0aHKN60viGPe3ZDdsWHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wIrzG9LK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-424720e73e0so52886945e9.0
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 16:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719358454; x=1719963254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4S59UsIAd6V+gz5kWV7ca9NMbFFR68wP023dmjma5c=;
        b=wIrzG9LKa6P9klbogAxbqsvT2TzRcs4zmM7LRl/GsIeTuHdjLVFxGZsPrpIjrKWlOJ
         a81JJnbFIH9iQckGNai1EWJTet0AyvP/4mlAXBrPBcA+NqavfxE5jrOcI/VsTKa6M5F3
         +VVUBGjck29KEpoX11GsVlu2CYzg61tnl2zjN3n7rwc5ew28kU3ovIalja1TgWv2qbAD
         iKjR/RJ+GIk7D9b4jsUkVqfplGNlvDcNBbTUBzIpVJrvUDmtWDxhHvHWUPoi7hUMDgfH
         bOXZ3Z9+bjTgSM2Ad+0u+M9QGBK70oixzRLsvGD7jsWkjyV6qLIyjXBUGJs3+y0/NIWQ
         Boaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719358454; x=1719963254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4S59UsIAd6V+gz5kWV7ca9NMbFFR68wP023dmjma5c=;
        b=ct2nmwBA2GS49LjVSxTKJItUypD+SEx5LE8cfU8amsim3kSpSwr73KWh+uv1x+9p0L
         nGkbaLAkwyaBxerHPgmhTOzdu10DocB+JNy2ssCZhZ82zFeVpporZeHtT+hned9r73H/
         jdv0Irho66b2YWspHJyg3LvM5nrJEr9z7lumuKbSxTlv8v1sEjFfqgNeh34sUWfru1sL
         lNGw1YDjmlrkS2n5Rrhy6bqnR0VOjkcFZahjW19m1SS08oWNx8LbIOD2z60M2XFoVvB9
         DCw6EKY3RQhx7U7NpScwzKp7x7fiMQAW/OyCldd1kN4me06iuR/6VEpUYCrbKABc+ukU
         xLDw==
X-Gm-Message-State: AOJu0YwUsqgi+QJA0LJQWA25x0M3T/+emzyAo56HhdSCIyi77qApdopm
	Q/wpYrhr3Ypiqb9AXCmuYuMScxOLqRgkgpeTe/5Ez7zVifrrCYFT0Pj2knDUCgY=
X-Google-Smtp-Source: AGHT+IEBFIf+f3kcb0SEbYjs6ai6O7dsJYZEHjFOa0a/zD5yBYLeLKqNNOIpaHNOZ2LoqzUJijnEZw==
X-Received: by 2002:a05:600c:4fc8:b0:41b:fc3a:f1ef with SMTP id 5b1f17b1804b1-4248b9e9a6amr54479405e9.33.1719358454034;
        Tue, 25 Jun 2024 16:34:14 -0700 (PDT)
Received: from [192.168.0.16] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8265796sm4083815e9.18.2024.06.25.16.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 16:34:13 -0700 (PDT)
Message-ID: <a9f94dc2-ea70-423f-8ced-97b9e9a07d65@linaro.org>
Date: Wed, 26 Jun 2024 00:34:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 3/5] media: qcom: camss: Add sc7180 support
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
 <20240624-b4-sc7180-camss-v3-3-89ece6471431@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v3-3-89ece6471431@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> From: George Chan <gchan9527@gmail.com>
> 
> Add in functional logic throughout the code to support the sc7180.
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


