Return-Path: <linux-media+bounces-15700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801C944A2D
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 13:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A023A1C23306
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 11:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23D6189518;
	Thu,  1 Aug 2024 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUUCegfa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F33187FE5
	for <linux-media@vger.kernel.org>; Thu,  1 Aug 2024 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510850; cv=none; b=pivxlYoIYBuFR+qxRnSvFZ0T3sHuT307peg2W3gCk12PqP4Agv9Rr4rd2fPq+pobeI+V4Eo1ovTis1ijKx7JctbA9xwGqkYCEJ/sjOgSSwADZV80TVR4CSbwJfQdOvLnkjdNuUTSxERoi2jPOYY8Of+zSvuRjDQHl3elXTxfEhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510850; c=relaxed/simple;
	bh=6DYUWyLVmKcg1VgyRdUByoU1wdW8WA65O99hCIRsLbA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NsagNNPeXdjeP/5mqaNjuDX5HVp3zTZNR4ehiDa7/HbR77IWT4WDmxTTaFTcVm3sYo+zVAzKrHkMOCHdF7ojdDCAQGEwCmQSMFQLbO37uu4/HvBJ2dmZcK8crneGZXiuQQQtCWxkyI2hk156HYO4rp6hsMgIltgI2VbukbLDxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUUCegfa; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f040733086so79127191fa.1
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2024 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722510847; x=1723115647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/AImUD+QPcEp27+UY62mj5/c2+FU0r6hvbsaspRuyks=;
        b=FUUCegfazF00olHxmYckRNPDkkXo8e7MYfsTq8oKy7OWyl0r1jSDITf4q7C3dAq5Cb
         w2p8pumNeMXgHUnj75njZCn7YInaRDuyk+JF4YrmCH8nHBOcwRjfOgONK5+G9Z8Igzid
         ZMnMeOVYbCcOVBvIfxIgVQoM84GZTER0DIZRQ4G1T2gLy9L4BRwlUTWgTipQX1lTdyw+
         clUriWdGhAsBN1bk7PACAN4Zh43aO1bHlLdqjWGvn13HXbDDCEjs9Eta8xjlEnKUabJf
         xUdZj/WatoaKnI6vv9kdf+YyuTyb9n7/gCl8SRk543+Wt94hw/PIioXz3r9ACWWOy2ll
         c8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722510847; x=1723115647;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AImUD+QPcEp27+UY62mj5/c2+FU0r6hvbsaspRuyks=;
        b=dcPuhDmIDOdbp/3/wetvqor7MCy8NLqpBwOW1rxg7JkCfkZl75e4MzibAGTYZnZiGD
         1dtO62r2obFS75wJ8BOpRo4NhM3kmPoZVOzfO4l8UOL4vcgDCLelO0TW1hRUUKkfkTju
         kPrR3PRWe59W0CR/nWbDCfjgk+jOzktpQLpeb91PBDBHBzOkMOPha3uzoK468btK9MkQ
         I8d0Zj/RtPwtkS3W7BUe7deOYfOWqvt5HX+xcFNE7ITCPH9wq5xUvmt6qik14TPhiK8z
         LDvvJVGp9lyZFh9dIaUXJtwz99cIZAjqDjLbGs/YlDfI1aG0EpHE102DL1o/gU3PwIiX
         xclw==
X-Forwarded-Encrypted: i=1; AJvYcCVdPtmz6iI6/dp7CSRn6hB/Zx5njG/t3ruA1xcb9OlDVu0O0qIZNB7fAs6fa/tCmSlHFGwd8q3iRtzv3MSuf5037bHSaO9Ba1UMScU=
X-Gm-Message-State: AOJu0YyzWVhugtI86JYXtffvab60rCx3fVqWEGSfSGsA2THRCvQ99HTD
	cypHhnGI9Syaxb4+kD/+XPQpEGFF0qbx1Gp3HYdEBmgIGzw+jPz/UW3v5YodIUY=
X-Google-Smtp-Source: AGHT+IHoqN9siHGzx2PErZ6ySMd5YwTj/nGbNmvJYtXIDVhQLKxwiGn0mDVq+yG3K1PkplijNm0gvQ==
X-Received: by 2002:a05:651c:1988:b0:2ef:2617:8952 with SMTP id 38308e7fff4ca-2f1530ec05amr18159041fa.18.1722510846510;
        Thu, 01 Aug 2024 04:14:06 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282baa9071sm53607045e9.13.2024.08.01.04.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 04:14:06 -0700 (PDT)
Message-ID: <4cd4ff3a-5d90-4a5d-aae1-6017199e00c3@linaro.org>
Date: Thu, 1 Aug 2024 12:14:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Depeng Shao <quic_depengs@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
 <3011c561-d39e-4ce5-a544-33f24ca7a67c@quicinc.com>
 <bd6f3613-5a96-438a-a2df-cb2728e30c29@linaro.org>
 <30d56910-df7b-4459-b557-effc21ffa132@quicinc.com>
 <ff128062-5c1f-4abe-8582-543063d5e526@linaro.org>
Content-Language: en-US
In-Reply-To: <ff128062-5c1f-4abe-8582-543063d5e526@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2024 11:59, Bryan O'Donoghue wrote:
> for preference every single patch applies and builds warning free.

Oops mistyped

- Every patch must apply cleanly
- You could make an argument for some specific cases that
   a patch can generate a warning provided
- By the end of your set everything must be warning free

In this case though, I don't believe you need to make that case since, 
the problem you describe about probe() isn't a problem at all as you 
have no upstream dts that can drive the probe() at this point.

Just do the dts at the end and no problem.

---
bod

