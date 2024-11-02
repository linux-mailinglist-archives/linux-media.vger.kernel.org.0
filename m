Return-Path: <linux-media+bounces-20715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B7F9B9F6B
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 12:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C76A1F220AA
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 11:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184F2177998;
	Sat,  2 Nov 2024 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hs+apn1o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CF6175D29
	for <linux-media@vger.kernel.org>; Sat,  2 Nov 2024 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730547666; cv=none; b=fR8WdCH6/hHBqSSJJlIfke0thoWuZck/YT18I4J3Di6uwDq8EfzjDDOdeHl78o6jg98vA+5cDSO0TVBb81PbnOregUul1GVjdUGYxD10qU05OW7CWObibq/2BXmNp/eiq8Kh2OlWiPQGspQXodeTYxDGSChfXV2pEvgrHmQ0SDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730547666; c=relaxed/simple;
	bh=GMLYsyPr4xumLfGGfYRjRM3ZXtmHZmJVFx7uijw7R9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isU1IiFttdhe4HeNPb9CwpQrPe5QbgcRpBceHgTpO9LVoW818AE4QPQrw/lAx6FNv4firLpprqXIlbrIkjCv45cpjQP0iFlA5cWp0rLl9cq+nZrRuEsdWUM6X723Mb0rHlUtOVJz6eR5SIW/3HHeXwzyadVHQJDlKut1hPpFhfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hs+apn1o; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so1736767f8f.2
        for <linux-media@vger.kernel.org>; Sat, 02 Nov 2024 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730547663; x=1731152463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMLYsyPr4xumLfGGfYRjRM3ZXtmHZmJVFx7uijw7R9Q=;
        b=hs+apn1oEkYHALiFkALDU+4DsKeI9p1q/7abUILcNjkgFniFTr+tSgxOyU7EkBxuiQ
         nIeJekaVIMMjWFC9WpmHGuTTOt8bqBeKfs2xoBRGLxXLbTSW1ajbHg3F58dMYRs9qUAW
         cd7zWeCH1jHRSttgzSTO6sytjUFaWP7ESxkEO7fkTREEPBgOtwxMf3j4NsY2n+zktI6W
         GFbS6GUZrZkdXxepPdLZr47fxWB6M+PL5NM73oO6YZb6Hf8ED1GyhQiFLstam/MtXnbr
         GIeoacV6EzrRY5dQdhNMCgYDV6LCw48MT4cnpxkedljoXKFZtvAKt3k/aexDb9w+gEGh
         FbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547663; x=1731152463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMLYsyPr4xumLfGGfYRjRM3ZXtmHZmJVFx7uijw7R9Q=;
        b=u9pwvwKL+G3J9xVSxro/83HNrw/WMbBQdFWMAXDEWZhKZaTY/rAduRchRxXCiCq82I
         ORa4pHTQDAF2cT9G4y1jP6c7CofEX4bNQUlU2jqHZ+Cg/FYU0hzHz+ktwJnaqOSWpaLe
         X2bczWLdARMsOVx4UZw0VMmdWcvSjjrmonCG77/ukPKcQFjDe5AKbNoR0229pg8KBNTb
         hNK3ulsJklhh8Qdv0h1MuP8dzDsoA3G3ZSL+Rug8mclflpwlY+ZsG+dSi/ml0KVT/hKA
         N8gmdG46QlON7mSBJWGGOv1LzE088Rhz5ZbBitc1l+GS++9TlS1SAvmerwBBoKFiT/3o
         bthg==
X-Gm-Message-State: AOJu0YzyJLSiHhBZVdGBJ31Kzq87JjZ50Ru7shcTmJ2CaFNbOxZ1cBq0
	DlffpEX+WcRcdaFDyqwVGTqkkEYzrp6Bmhibxyzy6tn3TXxM2VB3I9jHckGhu40=
X-Google-Smtp-Source: AGHT+IHGujsdxA97CT882qkCpdMoVH8GsT1n46/t2DVN9orVppO/tTsrbNq0fjx3WgBIeTcFlLazow==
X-Received: by 2002:a05:6000:4029:b0:37e:d2b7:acd5 with SMTP id ffacd0b85a97d-381c7a476a8mr5356689f8f.8.1730547663353;
        Sat, 02 Nov 2024 04:41:03 -0700 (PDT)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e694sm7879785f8f.86.2024.11.02.04.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 04:41:02 -0700 (PDT)
Message-ID: <1d24c5a4-5059-4420-ad69-a72cceb5657a@linaro.org>
Date: Sat, 2 Nov 2024 11:41:01 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: camss: vfe: implement pm domain ops for
 v4.1
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
 <20241102-camss-msm8953-v2-1-837310e4541c@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241102-camss-msm8953-v2-1-837310e4541c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/11/2024 01:32, Barnabás Czémán wrote:
> have to be power on/off explicitly.

"powered on/off"

Pardon me I missed this @ v1.

Please amend.

---
bod

