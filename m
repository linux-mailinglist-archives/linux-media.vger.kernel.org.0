Return-Path: <linux-media+bounces-11266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9A88C1A0B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 01:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242C11F242AB
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 23:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB61A130E31;
	Thu,  9 May 2024 23:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LtYPG1Ts"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06811292DC
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 23:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715298199; cv=none; b=L/H80IqnxNC1Ew0Fm0w+dLjuPvuLOknh7/wj6gIGhK/wy2ULGL06revrLZXIBdMCt2x3qXAga8xhDl84mMkra8fiIEZb/+fclHKU1+gQOt1HtP3hRdBaX5nN/rjL6WbCtJF3jvWOIGEIVwnCxz08+9nq6VsKrkYBFoOpeN56pE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715298199; c=relaxed/simple;
	bh=tR7u35z/O3DzUlNxDohM6rNNIcQO7MsfbTygHbV3Iko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RO2vVxkVpDzRxC0sVvr8l7BlddZWiiwZPzv8ysfcgmTdWvBlCt0Y89scXhPBKqrIdDGT/IOpRxrDlbOzy3kIPuVPUU7yVSO7N4b/AEyz8fOGhVvMWr8PeiYp73qY15yTvcEQ9XzfAD4OjljdhjuAP0sfEhiDj4BKnibwCWa9y0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LtYPG1Ts; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41fc5645bb1so11609235e9.1
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 16:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715298196; x=1715902996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9sTIErt9M9JswTN2jkwtlH/RNJOorHYqcXTsUzk8xHA=;
        b=LtYPG1Ts7MAQeN4+DcH+3VjcIDouBkIggf1oNcmllIdc+n3AKeJpsKN8H9d5sqU+Gd
         9YZ+olAIogAhdjL4Q6FmSROU7CAy9gdZqUu5KYJxd6qbRsAhndZAre0ySrE85/jUbqBa
         tviEf5geueHl4eMe0w90XHpqbw4tVSv7mEthPLHfYuhJEqzWLVZg7JgQJReUJOQOKSfR
         OgNCq9RwzAYt/L1ePGgDr4UZYen8gXiigXSgwgvFRnY9lBRqgWOcjSVCy5SkuR8rGGNJ
         2BO1716vY5jINKcWPV0QmKm1L0T74ACTebULUcYsK88+u75xBX/QvyxTR0YoghxiJNoh
         TsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715298196; x=1715902996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sTIErt9M9JswTN2jkwtlH/RNJOorHYqcXTsUzk8xHA=;
        b=bbgoPTuYLprYlEVeLefPk7xFkVx2g3GoxToqUocx0smqbtLe5OIgtlz65zRVDzn41T
         /N51agnRS1tAzyLNz9/cCFAd1et1Y7iuhE1TJRGjUaI8lypQulOA8WUeStjcXVAdxaeu
         ckJlguQflavv2EYFXX/UkJJJ8PKlicOsBe6U2/38i7bxN7Jcz3MBLQJ4kHy0Qb5wUFD8
         kZ3ue1Z64uxqP3LmSmnfW37qngb8vIWIVGhXjjkekbQBBgpywfFZtAIfmyMBD2a8sK3V
         14gg7/thV5W695vDYY0bz6nRr2dVoee6cRntiW2HhcZ5Psnt4VxZGzvne1L5Qx7z0Qpx
         oYhg==
X-Gm-Message-State: AOJu0YxNXeGV8koB99+5F9HLnVarmpxVQZyF3T/fccaPKntnxnu6SSjZ
	A1eHteXIaFdqthGNj1POZaIZrA7hNsBUKN58VBd+JjXT1wpA0xq7a8ciwxnyFuw=
X-Google-Smtp-Source: AGHT+IG8b+2tz7hbEPlBkghjB5Anfa+zpDUXWfEE8VBKaJO4wF1nKq8GtQCyZaOn+d+NiX1BJAFIug==
X-Received: by 2002:a7b:c412:0:b0:41b:13a3:6183 with SMTP id 5b1f17b1804b1-41feab40c32mr7572955e9.24.1715298196057;
        Thu, 09 May 2024 16:43:16 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce25d5sm41222755e9.14.2024.05.09.16.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:43:15 -0700 (PDT)
Message-ID: <81a50925-0c38-435c-b423-6c4c97486b2a@linaro.org>
Date: Fri, 10 May 2024 00:43:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/18] media: venus: Refactor struct
 hfi_session_get_property_pkt
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-12-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-12-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> -	u32 num_properties;
> -	u32 data[1];
> +	u32 one;
> +	u32 data;

The conversion of `data[1]` to plain `data` is fine but, the conversion 
of `num_properties` to `one` doesn't fit the naming convention of this 
code which uses `num_something` extensively.

Please retain the name `num_properties` for that reason.

Then add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

