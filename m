Return-Path: <linux-media+bounces-23616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D09F50D0
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B8417248F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 16:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7B21F8666;
	Tue, 17 Dec 2024 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QzKGxsaS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2351F6671
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451961; cv=none; b=HkmWAFjNwqeurTdJcm1T2Nggm5EwCXiDLhKUZpGJRg/NBiighz9xHk2QOFCmq9B7sc9DEAS7eN+FR8aF5rIBEC7+7WHnVIZHoQYIJ4rADRGqrvKlZ+e8HNbDva4Qb7T2LTmDW1VWiIfWc/1Fo81pH5JJYYoWKaBAiABgeoJ8HR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451961; c=relaxed/simple;
	bh=sqzKG9IUExlr9KeYwf2YH/lDQlNJlbVgJNgZtw7i//0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKw12MKj8i04f5TqqbuiLNLI1CHhgP55pS2y6m5FEov/gfBZgHpQDKwLtxcXjqPIwpb0EJqt5ooNTiy+eK7GXQtyLUmz8sTD+p7s/7E8wCqfFKSWK6hFm3uiK4CA3PaprxiHCV51JZKCSVQjxBi3Pz/uGuZXu7pPueCenbDiUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QzKGxsaS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e2880606so5061911f8f.3
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 08:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734451956; x=1735056756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0MSBSw6+OhbTrh1m9W9JgXC4AYYLnaI//MfIF3U6z0=;
        b=QzKGxsaSswGje4kZD0R4Uajytp/h/lQAEKFim8aFhWa+n32/EK0wf+zYoI5ZlP+v24
         iauG68+ofWySIyrDnXySuesBjw+5F/MSuRIJy15QGcW1zK5Gj2FMibX5LZKD47B1YEgb
         HwDHHiQYySWYkwX6TgR3nwRsG0ilwNbjlhkuOyiW1Oc9c0FLqvCISzG/aFWEmWx4EhuV
         eZYm2VY+RffJDJfxGnivgX2MO+sZtGH83SzqjbreeeiQNZAskGKr/fl1XAinCY6K/sHl
         2xvdQL30cfOIriDH1E86opyq9eb/YcKs94Cz5bySpYt2ddN32lFoQW+NDtRN/CSKgTya
         eJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734451956; x=1735056756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0MSBSw6+OhbTrh1m9W9JgXC4AYYLnaI//MfIF3U6z0=;
        b=T6qg8jMXPJJ1oC/DdNzs5vU2k1RA6HQjC+WBWdAHXWlnV790kOSFIM51eytfZ0V5og
         0sja2vsGR//SrVBkcilezzBfMOMFz0cK1QgbDmw3n6qFA/klzbOjHjtnt6SrKnG00nWj
         c8Tn8lzyOjPG1v5c8TQgRmrGpKyfFtcJrsYtWIi/fOaWzRcD+f9V2mUI4bQMYniMe8k6
         az4W3YuPGGOLoY4FmfS7l8JOSrygjCmGsELwyLwTop2MUT2cZdyfXL9UsGD2rnIkEgQC
         dKIK33Pr0YiuJtqNIa/PP2ujoKVGWfE6YKbGEVoNjB/gp7AsmnIQCOje6yUy9FxA6Qw8
         T2HA==
X-Forwarded-Encrypted: i=1; AJvYcCWXswaHrilmsS0LCOE8b6VziXd7Qx+2yg9DO+haodpmqs+rfc1mmCbcDIIPxOcQQxp6eVKk+ZB1Rt05/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcHlvC9bCvYXII93tjSyRY6wPo7TlrWeCHJz3JOOah7r6Nv7vy
	682H+04hfa0Jaynp5Kx7RS/MXpcvqeRRKg2YukvnC4Ul6k4CLSm/dq1oQlATz4U=
X-Gm-Gg: ASbGncvXkdy/l1P6M+qqB5amrypY7tRGU2BFsnAPHLrrRbXlydkgfKz6okDFFd/Xq0M
	fIn7F1qHYSWVgsCIqTUU/8xd5P/F9q/8ZMHKRvWCrtmTBeQaRUgKJOD3KUoFE18VmD6fSbeuwpR
	6JGyOM0OzDOWRuTbi6SVnCxVaXciZOBTvCHjACBm0v+5uG76Df7hQ8fJQJS8aKM5Yobps+DZKW2
	XdbNHdiBlIUQhvNdAwDKSSgZW1eaD27vhKJC72pFiWV0tWTkQtjtN0zejmIgWaBogD8wA==
X-Google-Smtp-Source: AGHT+IGNQ7hhBEySJuTG7bF8w2ZzmrZV4ZxMbtUaczoA4N/EwDXYjOiMdMzulLRJCZ/qQh7rX7Zo2Q==
X-Received: by 2002:a05:6000:18c6:b0:385:fe66:9f32 with SMTP id ffacd0b85a97d-3888e0bfcc4mr12807413f8f.52.1734451956514;
        Tue, 17 Dec 2024 08:12:36 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c05sm11739012f8f.73.2024.12.17.08.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 08:12:36 -0800 (PST)
Message-ID: <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
Date: Tue, 17 Dec 2024 16:12:34 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/12/2024 14:10, Krzysztof Kozlowski wrote:
> On 17/12/2024 15:06, Vikram Sharma wrote:
>> This patch change clock names to make it consistent with
>> existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
>> This also adds gcc_axi_sf and remove gcc_camera_ahb.
> 
> Don't combine ABI changes with some less important things.
> 
> You miss here explanation why doing the ABI change in the first place.
> Without that explanation I find it rather churn. But anyway, reason for
> ABI break and impact should be documented in commit msg.
> 
>>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
> 
> Best regards,
> Krzysztof

This change should be fine since we haven't committed and upstream dtsi, 
so there's no ABI to break yet.

Agree the cover letter should have been explicit in explaining.

---
bod

