Return-Path: <linux-media+bounces-14138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A39174BE
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 01:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D1C283051
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 23:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9480314AD20;
	Tue, 25 Jun 2024 23:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wqe0p4IP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F11487C0
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 23:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719358418; cv=none; b=TYc721Nu4sJAaBkOPvaeom5Ro8qB8zsBEnhZlf5HNarPUBCcTXgPaqF6mXdlRp7eYbFhF6SmGXFenT9qEAk9/oqrPk0rhEU5B5sCdC45UYoLBz/STEyZhO4pu1qDNKLgBRKYPj/zxuoCCV/fHHR2DI9O9Wznp2nqsc/zSaLb5t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719358418; c=relaxed/simple;
	bh=FI8eUaDFu/zwqz9DJp2crsHcZnGTTPmeP/vL/b3wFjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2nr05MFuuNdej+uFm7wJZ7Q7lVMUz6DRmoK+jB7M+R8FQYLl9gB4Z0tKZnahGp3eEAmBUeMeFbxskLt1c8jja9TSwnBTbXbHhtJReJkVU+m3oxAfVrCMV5QEWlYtqa2XHeMxlBHiwb3KX13S0T49OT/9QCuAQ/2Gu8kUmw/XHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wqe0p4IP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4217d451f69so52124975e9.0
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 16:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719358415; x=1719963215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Opwcw7VLCQZgGe8FSyQVMYscWh3VCg4kBZbjrQC8nk=;
        b=Wqe0p4IPqSb8Ja4MdcN4LgLLJmQuSmiHODq+9L1YdNwwj8PYT1jnA2EKHMrI9CwKi8
         dgPvoPGCMOkHnfTgTtQFpp+w+0hxoHas+H+DPgNNBMIMCTulJA0JJnE11VH9Ha7sOIcQ
         jurkZO0O+9OGNOb7nzJVcVUqQsuJG93QRaqmGgpYYWe03Og6E+XjzfmKfxZ3xHUlHExn
         zBpVvcCG1N7v4UslvVF3bUEA3S0cNrhu0KiC4VlSY6Rw4LehKnrq6pF7+3CNa7cPFzuN
         4M/u5x96qAEoRP/UUoDRjZGyovObkd6lWFNoVl2w0oatUNBHyXNuA64a0bfexVP45bbs
         9mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719358415; x=1719963215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Opwcw7VLCQZgGe8FSyQVMYscWh3VCg4kBZbjrQC8nk=;
        b=IYZoHavKNdpQgHSejelz6NL3LhM8a5sA/1VNEkX1KDv2Kwza3wYEfRd0ma33y0Xjc4
         I/80j72WRRMgVC6iMRprRkWaKWmV4jnrp5UBxqPfReQQEy5u/D9pGMl825nqAM9f9W9T
         2GfHHrmsquRg1co31kmSk1zMOWfPWTZKPNfsphVo8TsedrZfPE8bAe9w/AdKv91jFGFq
         S3jPOWeVc7UeI4bDRJbf4u7k64V8bn1rFQWsN+DxGGhBCdd3rF+e7wH7mQQOQHFF6od+
         tlEerEaBUAU4gaI7Kwq/cI46CWxY6AjM22DM0dPXaMyIP3jm59HiZ2grl1SdqnhCKLyx
         CrwA==
X-Gm-Message-State: AOJu0YzP0xBjYSsYLtZugLqBks4bR11G9GYC+egoVk4XYXTamDvYEeZN
	ZQt7FanV1MrdtgY+ADpD5oEnB1PkPs405t5LTpxrZ20h3+H+qx3QdmPUv5Lj0LI=
X-Google-Smtp-Source: AGHT+IFAxAnH1S3nzfdk6CbSDoIT9ih3OBbf4y1Msoor49NuRYZvR265y7WIQbcL04xfeRakzSfkGw==
X-Received: by 2002:a5d:640e:0:b0:362:52d8:6788 with SMTP id ffacd0b85a97d-366e9465a16mr5839347f8f.2.1719358414867;
        Tue, 25 Jun 2024 16:33:34 -0700 (PDT)
Received: from [192.168.0.16] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8597sm14101891f8f.36.2024.06.25.16.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 16:33:34 -0700 (PDT)
Message-ID: <a167c931-576a-4055-9eb0-38e919884401@linaro.org>
Date: Wed, 26 Jun 2024 00:34:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 2/5] media: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
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
 <20240624-b4-sc7180-camss-v3-2-89ece6471431@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v3-2-89ece6471431@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> From: George Chan <gchan9527@gmail.com>
> 
> Add a PHY configuration sequence for the sc7180 which uses a Qualcomm
> Gen 2 version 1.2.2 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports two-phase D-PHY mode.
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


