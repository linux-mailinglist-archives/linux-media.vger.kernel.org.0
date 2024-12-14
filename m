Return-Path: <linux-media+bounces-23409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABA9F1B7C
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 01:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03FB416B1D9
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 00:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E98110A1E;
	Sat, 14 Dec 2024 00:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LRnV8jwO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF98C2C6
	for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734137398; cv=none; b=LijpUbnFC9DfaOZIYK8VT+rlpqxYwUkxuNdjqZn3GjCI7zi4Xod305Qm0Kj8m9ffYjh+ibdcrqJxEvQIyGtbE2O+CHx4Gh7+MpkZn5ejnnyaw9sP8Sfredqtw2qK8S1P9r/OdgrIQgygCOU+WZs3cgm9qAdFJGEnuX+F3PhuNrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734137398; c=relaxed/simple;
	bh=LF9f2q7wQ5vyQD4uKD7ZO6qHf8a3O2obFR51imVhytg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9G8JKi03C97o9DhuID1+Un8MgCFo+X35YSF1Mgx1Fyg0FKJz4fKn5fZyRECA9oz8BvfzKZRfbFZrl+lZHEoweQ23Z+8ik/n8K9Epclr5QgLQZuYioUyskx6/l6/nkAXpDs8KPSkK96oxv6NSwMVznGvxeVjbMpIREVkrUrS7yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LRnV8jwO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso2520879f8f.2
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 16:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734137395; x=1734742195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZHQT3+1AXOHwySh7rmIQ56owPwbOS+jVtet/I/oewQ=;
        b=LRnV8jwOV0SG5IWaihuzl1//P4nNulgNrK6O9E3pUa6+cJN/VVgaE2c9QgnFMe4+mC
         /Fhk1SKuSyOX28ryvEPjT+bq1zM9YOWYznKUlObqG/fa9HC02KW/rnD49jQ7XR4rTPEI
         o2TljLwj7MGTe5fCz4EgFG7PVU2OjNVqLfJJEZ8HaReM0dHFlUehhvdLtxl8CzW/qBdS
         x4ANxNQZ6ipRfet0D8fGjMDsQ1jBabuaCbAj5rGjq6w3IzO7RoDfRrAiazHbKWq4KV2N
         jnIpkkM+dwJz3GSB1KOhZ19RBk+OjprgptwoWngOBb3CbRJJKyzdiY6LH3X0MsEt0/7T
         necg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137395; x=1734742195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZHQT3+1AXOHwySh7rmIQ56owPwbOS+jVtet/I/oewQ=;
        b=ZkvY6MQvU7vvDX/fGwwYxgvnfIyOWu2ZcL6kWf+6GyVW1DBL4qcw37As4T5DINRETO
         YsBecrmwg/dRN8pg5QnZNoqWbhQnI9H9ahmGTtQorS1vsimfH9Hbqzcy+q5XwLORlWLn
         uVY/gGSC2uonzlhwGMh/8gI7PLHiybfRn62nwX5mtkC8UHUEivFzWfk13qXcPQdyNYMk
         oQfoSITyZK7jvQebKr/nYdgZsHus+OhBLkLBO0UPh/CvOE+9PU4BwQt8Vpy+HvptWHrf
         cuC24Ti78lYGJlMqTG4T+GuKnxHeN4k6ISdY+2fe5Zb/e/BMCDTsqFyH0Z6DiHjNxKr8
         rD6w==
X-Forwarded-Encrypted: i=1; AJvYcCU3XZqxIdNrwLBlU+DgG5Pe4LBBZF+2A78L7Hj6BIEKoCxBIVTMMN91i7UWFSziuyAEQf0VLXCDRyOsdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0hJSCI5iaQM75e5eg+ZF3rRQMzqENoRmVT2cu42aqq9ZU3FAp
	4+wqB2e3mTDX3JuEMndMLa6725I5TROhuvG/czsWrvHmjGpX30bdyE6RJOrNtKw=
X-Gm-Gg: ASbGncsG20FdCzowzGgExwOR6zjLUELWrWa1Y2fTILGwB58Bb3klwU+JHDGl0/kaMSD
	nf+ox8+zHIjvuVO7Ju5DITRmeWpBTPP4C85YQBk6OCVavmqpjbEs157lx3Q8oz3rdHIzfAF5K6j
	NnoBdXLBrixPCkszJMnvFRGUa8a4V+vtV6uPGYWmtkhmktU+BKtWgmZWMnrOa9SCfA/WnsBZeq9
	YluXmJhnRhNrYPCfdd9/bNwU1XuRSM0GSMkdT7Gqxf5PQDyvxBcMcEoUV9R/tS+iheVvA==
X-Google-Smtp-Source: AGHT+IHGByL+SnFZLh6TJ7bPmNjCMhZaO4qaTKsbRPxcaxQjrB96T87kcly1ELijtAI4mJfcF9Gh8g==
X-Received: by 2002:a5d:5985:0:b0:385:df73:2f42 with SMTP id ffacd0b85a97d-38880ae14c3mr3370858f8f.32.1734137395326;
        Fri, 13 Dec 2024 16:49:55 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80165c5sm995925f8f.25.2024.12.13.16.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 16:49:54 -0800 (PST)
Message-ID: <08241f60-a6a1-4b69-bdb9-c9b83ec504f3@linaro.org>
Date: Sat, 14 Dec 2024 00:49:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: qcom: camss: Add sc7280 support
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2024 19:18, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
> CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> 
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> We have tested this on qcs6490-rb3gen2-vision-mezzanine board having IMX577
> sensor. Verified both TPG and IMX577 sensor.
> 
> Used following tools for the sanity check of these changes.
You should state in your cover-letter that you depend on a prior series.

Unfortunately I found a bug in your depends series:

https://lore.kernel.org/linux-arm-msm/1a570c17-c501-4a29-a4f7-020f41563f3d@linaro.org

v9 will have to be gated on that series being fixed.

---
bod

