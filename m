Return-Path: <linux-media+bounces-43226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46087BA1E35
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 00:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 073093B7A21
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 22:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0455A2EAB9D;
	Thu, 25 Sep 2025 22:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YaNMYfh9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F728E579
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 22:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758840536; cv=none; b=IjUQPmKEjYV85ZVoQEzPloa8LG/bU6/dwcPwJOgzpG3vg2kG8mgQvq6twy1jjdFnG8AfrHu2Jay0+ku4tkgWdMIq2q6E0GoTcCMGpWlXlK1HW5FCnU5n7Nnr33gi46n/x3Y3UUvymrzdm/kHxP0KguktzkYuPuWsK1Vxl4gFEgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758840536; c=relaxed/simple;
	bh=NPoSZR2uMPPLcNwoBCjehSgGxL+8Q5GL+E8w6bU+oR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Unetm5HkmdtxR89kU6xO4npI/w5xL09Vg7p4SEQd9OD8akn+tBC2skCxt3F3eN8QTj3E9A6yEfmYSLs/KhmTN4SXgnuWxQG3GDBeHC8brMgzKX6mMXILsL0+SLo6KhrrPij+GdV8Er8UBBiLL+A/FcT8b73p8vZI+7uGZVqEXME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YaNMYfh9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so8697605e9.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758840533; x=1759445333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLb9XJxJIEh9OtipwMXHNHPZ896o6SjHxUKCh9EYw7k=;
        b=YaNMYfh9fqK9HN3QU/N2iNMVP8FpYd53MCQFigHlvl/utETbSQiU3dqCqtd1kfY6md
         MmIubzfgeDZ4OQiqeO682+3J3lPs+UkxFpj9SCm8aMGikuMH08+ThT+zCuQe74wCZbYf
         OT1PwHLuYjg4caKWS4Wjgm2BP3MvjLUAt8F9K7k9Y2ZnT/fj8itm9txBH20ZOoPe4fWA
         7mh5QxkPpEuupV4tI0DWs6aHcLQyv+xuom0gRm5xlurOSRRo2RQFc2jg2jcl+UmGcWdS
         E2ZCV1JXwW0ot5vLTIPYRwHJuAFSIJanayB3jpgFXiqP7uZNBSxkw5m2bNpVbVjPEL4R
         pVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758840533; x=1759445333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLb9XJxJIEh9OtipwMXHNHPZ896o6SjHxUKCh9EYw7k=;
        b=ZI9wD9WShsxKg51Kkmtt2Mz9yao5TPaZQeCHo/G8cyyk6yCq1lprQbG56gEJGhnNHT
         vqOJh5W7b7EUlFBemSHlYmZhFrOOvz31Y82ME35swa+i+nv9reHx8R2TdB1NUMEBeqmz
         Hzl5tLMf2AyhcsrwVnwArX+UkiKBtLIjp/+MDFyHP+3VOFE4XQ3y63YDPzEECggj9x5j
         kdhsDprMTePb1FFom8QopPJEgfI331eKIX6A/ywIR7CqR7Tp37MD/pfLQ/snJcsbOhab
         NookNpRMIUccO6O+vaiIau+FL3NlhMpUdfZlZ1p3sFcnZix9g1YGojM+iOjFvEVupb1z
         eSGg==
X-Forwarded-Encrypted: i=1; AJvYcCWSOZkn4Jp1PciyC37cTqnXl2tr69/zGsWuvnApeMUYVLROO0ouHA0giP7Uha6X2rFKi79xiW+h4uJ9Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78ssEjr+ObU3UaqP0VubIOh9LKbQEPzk+QJjilcsD36Q+DRXj
	FwBxMQf3k8wgdN7aiQEFw0j3j5ElfUpUBWC1WMuY1kzJcWdK7Ie2yoRAbLG0lyAzWY8=
X-Gm-Gg: ASbGncuvqUYV7gRBva6zJTYO/DwDQl7Rq0A3Dur8v3bvPyzTVpUUPcWUkXVGaxG3Mcl
	NQ0j7Ak6YYi4vKYarNY4cA3elcDDbEQTQudfL1zpvskFK9BB9IQGnKapJturOpl1zwzNTKA/NgO
	zL4KDim2bqE+9STN5DKK22kulyIFj5tCEHeyfgf2eeeMRPz87X9x8hOQmStgAtViibWi0UsN2va
	xO6gChGuyeaIf8vHNnYBxAA8snP/w6cvZpwsum0rJv0agCXiNlEVSaAeu3Bfh6FsY++85HIzeHG
	JuBnBMFeKF2vE+L0HCVBYg5ANOD1q8fpxj/JfB0TXi573tOt6niTt3NEep80b2F8VUHIeMimtsF
	d6bD1cj7OM4gJ9Ohi927MRYSlPh4DBvzf8bmU4uuloexi1hYjcPDjNdT+Wr/J20vdaZZcTy73aY
	lhM4ekix2lRjmF1sQCC77P
X-Google-Smtp-Source: AGHT+IHo30/UsDkSnmo85GJxkcE0F22GujIahDdLXdZqAmy+vOn+OIAP8XqbpMnu9c/OCkswPoykwg==
X-Received: by 2002:a05:6000:220b:b0:3ea:6680:8fb9 with SMTP id ffacd0b85a97d-40f5f60d329mr4047618f8f.3.1758840532964;
        Thu, 25 Sep 2025 15:48:52 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9e1b665sm4475800f8f.27.2025.09.25.15.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 15:48:52 -0700 (PDT)
Message-ID: <30f9292e-e6d3-4fd0-8d1c-f10317ca7751@linaro.org>
Date: Thu, 25 Sep 2025 23:48:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: qcom: camss: Add Kaanapali support
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 01:02, Jingyi Wang wrote:
> Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
> modules, with each TFE having multiple RDI ports.
> 
> Kaanapali camera sub system provides
> 
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSI PHY
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
How has this series been tested ?

---
bod

