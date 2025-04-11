Return-Path: <linux-media+bounces-30015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3BAA85C44
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 13:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0B0646589E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 11:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAD729AAEB;
	Fri, 11 Apr 2025 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJJeqFET"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954C02989AD
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372333; cv=none; b=MpvcvhWBDMa/50x/fHKpdLTw0M98zp+OXwvvmm0PGOS5QBmvPNr4DCezKUNzaVTo7g/RewM0bJGS/wrv2cLdvnjoESbAbDyusi4GGvuhcpc23nEu5/fuxvFAikm55+4Y/PgLJwJ0tfosIOgoJMindm+/G6dFiU37TfwSc/pRBuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372333; c=relaxed/simple;
	bh=xl8pYd1ICKUbfI8bR/MoNAxS2Yv5qFYEOJdtbYDx6hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5BUsYfIbQoV268336m0EZ9fiy1QVeoaRx/XkXZFk/lsDJXfBzZyJKS/1+8vIegW7j7cIQ57HyhHnyH2mzQoK1lOhHQI/GxvGmq4CQ5zXBgsf4FXmZq6iZVVTJcm5/pEMcrqjiwT1jvmgnyD+CKHBpPG01RUYvicFJuS5JzV1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJJeqFET; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so20009685e9.1
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744372330; x=1744977130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5HVy/7nosTmDrt0FNCHkltOQQArKbp0G/tf2pSSqz3k=;
        b=DJJeqFET+W5ud+joBHyEAp51CWQVCrIUPkDjBV23bi5x9du538YpsU+bUMHe/RiCJf
         Kiqy93IjOZo0j24BZhGC/iY1vnyZmtDOU6YMJ1WQ+MtOuniB+wsCXI8IQW5ZMwMo9mmv
         yUdh1W8aZqDfWlv+dg/KbVgUoutChw15J8H0vEFHtgdKcNu+gpB7F/G7M4ZjbKIf8ZNB
         KEQ78Gc9KxtXGWktBLdcEX8bKfjxGzu+DKPZs2Jl6FwcfNSq89x3v0HzJjAbXRC/6Nfm
         4a/hbXR+4r/WmTyYyecP+SChh1WQeTMT3XiGzIu2+kzvsTgypOs7Hz1Wn3ScleN3wAIb
         qbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372330; x=1744977130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HVy/7nosTmDrt0FNCHkltOQQArKbp0G/tf2pSSqz3k=;
        b=jzd8bUGOqfK0o1g388px00vc7aMiSJ/iSUnFbTAK//kObD4MNBjYZ3fZvB70XLcq3i
         GmzW6dD0SkrtzyTfgKB3yRiTcO0+TnFGKyE7S6dkh5NCMy+94TvO74+zrbBlfUoZpWJJ
         o9LHQ2L0s7l7UT1HMxMYuiGk69m7nUkIgrJslpnJEFyxuutv39A3JvPvSgjHFJXrjYij
         yxhBVUxSYOLgoDvVVKXmr+Ouk6cUU362mmvuM7gShRGWNRgOHAWvRsmXhSHgq+Wnnde4
         ILFEVyc817uHIG5Rv3ZWrkXmzoss9ls2pfPD9T8e+6n1VxbOQ5VojC+ePn11nou1uphu
         cpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd2hW9Hp7O2mD2La8ljlIwAT2zrj02+gHVfztoi406JIgVeNY7NurXvJv4mVcCkDTru60OHvIDqZlJRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlNOj2mK4stnBbmFZFB/Jxs8ukMATqBVGzu5k2lXP6TwqjgO+
	YdfrAn73nuDxzAOnhAatI0FFP5oLsSqaPbAetS5aUuoZlpbCPLETfdXpzd3eEqQ=
X-Gm-Gg: ASbGncsFDqMZvriNkjOq3a6KwiDQVf2pK1eeOwFQmUwhSdJmA0dm/VoIPVzitaTOF2+
	G4kYWMYzpCN5gqdTMp3yjRjWmr8LdzRujvxQX87oXrfkeafCPTCHeKOFGzHPEmjgGZL6ac0leuj
	1N7NcOn87IRkserSWjHCdxLSyUVX18Oj8UxmUJQNwdOe2BTA6Ili+6/fsKuG2w5ku2p+LkRgbTS
	+bhqM1QqrTbiUPOs3c/O8bmeCqAOMJoq5ZSeJjoSmB4vGvuc97ggDDsqPFGouDbq00YFrAQMijS
	lesFuE1834Fwrobw/NGfKT8pYcTAsmFWq6FU0Gm2kmwjxW8uen5ig8VnfeanubYcmVEtjNLyDIR
	prynlhw==
X-Google-Smtp-Source: AGHT+IGzWSil6xEbNUfevW8M1sWzZW1l6nSFBVdrW8vg7rvy79cA0XlcgS4RI4O6ocfdrpULPe2L4w==
X-Received: by 2002:a05:600c:34cc:b0:43d:fa59:bcee with SMTP id 5b1f17b1804b1-43f3a9c025fmr19884005e9.33.1744372329911;
        Fri, 11 Apr 2025 04:52:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44577dsm1782251f8f.94.2025.04.11.04.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:52:09 -0700 (PDT)
Message-ID: <23cb349e-6fd0-460e-9f11-7f57609be9c6@linaro.org>
Date: Fri, 11 Apr 2025 12:52:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 2/8] media: qcom: iris: move sm8550 to gen2 catalog
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <3pe2YgIPZDCWHxBWThGQ5xqa-pGXmJC_-sPtFTNKIGg7NoAdMhRl70BzWLZE5B2_zGnnYvimmhqB2Q--OCXwuA==@protonmail.internalid>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-2-44a431574c25@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-2-44a431574c25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 17:30, Neil Armstrong wrote:
> Re-organize the platform support core into a gen2 catalog C file
> declaring common platform structure and include platform headers
> containing platform specific entries and iris_platform_data
> structure.
> 
> The goal is to share most of the structure while having
> clear and separate per-SoC catalog files.
> 
> The organization is based on the current drm/msm dpu1 catalog
> entries.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Same comment on alphanumeric sort and header __PREFIXES__ fixup then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

