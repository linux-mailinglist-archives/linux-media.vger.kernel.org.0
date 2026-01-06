Return-Path: <linux-media+bounces-50047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE4CF93FD
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 17:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C1AF3097956
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 15:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93243126CD;
	Tue,  6 Jan 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r/sq2PBq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E592DA75C
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715080; cv=none; b=nSMw6rnYt/eVtCzp0OGusIlM7Obqc2JZAKHSu1ij3IL0b/UpMjAWR9/g5esZsO4UT6CJFboMlXhWhjaifG6HCpq6wXTtc4+2u+rGPRaf6NtKlK5t/K+718Twv0TEbXPwPgX85u702nFJTXuQnQqaQ5FAnNga9v10Qv3wCq6C90g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715080; c=relaxed/simple;
	bh=rS2kEN+l5lBWD9HEj0zmuZJoqSCVqudIyrokemU7S3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojmOoQVeCZAzhKKjyIUb4pPTYn8IoSb0bAcDEYHploMkeX16TutaBfXoYk2JixLfAQwejmco/UJcLasChsA8q31haHJb2MqEZ3uKdRGeew7e+Ha4oSdmyRb3QXi2+mN0R197AiPaIYvoYUswBbMwgPPJwGNbLrv7wWhP/BuaKKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r/sq2PBq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so760570f8f.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 07:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767715076; x=1768319876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTn5UN9IF89s1t/TYllEdz6u2Ql6Y5//aGwbSQnngsM=;
        b=r/sq2PBqM3uFLd02ebf76BXuQDbb5a9ZlxPcoxrtUydmhsRA/F0mESo8nIsWu+fz/S
         cpD8UhuUIDdUK5bzFbHjli7g+1sGT3jG7aBsJif93xyv5jEtrYNcy8KYVe97CHMztMM9
         DSxH7FRWgt+6l/AmmHc2x+PTKfGB15FoVF03JMqYS2taNypVXpihA1P+JCeG+RU7p7de
         4r3eNkJTn/N3mME8EjXyKbBBUr8K6MvM7lHYt3k+rfgzz01uXMqBIAG+E/Gl1iq/rv7p
         gXT2ACATGdxnvl+uIzlqajieuXsgAYp+Y5LSm9/YZ8Xk3rwruOBvor7ogCBOpcOmsGrx
         kRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715076; x=1768319876;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTn5UN9IF89s1t/TYllEdz6u2Ql6Y5//aGwbSQnngsM=;
        b=dmHV5NEG8/hrDH5kY1IOI3wQ2xPfAQnDULwTtJ/Z5MABVUIMTbmtcTJ1DAHBXYKYGC
         snwhhprSF6zsSVzuDb6bks4XrTLpSymUYqlxBrIww3f0sGxEdSTNyR4RNMGPGWZVTnGW
         KkIo3l9glkgq9T6B33RmeyV7en3I8JENqgnzEZXyXyQyosRM6Up4O1b9s0XqY7eDu8Ko
         pPY2nwXDqRhdzV5YItjPbbdIL7hd8DQRxUtbNXIiDMtKAUAOyJg4Qxjih/RFV216DK6i
         CmJLqEznqxQr+YamK++4EIqtzSbbw1t3S2EVSXJYWrIGAFA5XukuBqDEt2FvnmGjyHbJ
         tITw==
X-Gm-Message-State: AOJu0Yytt/AWzD0xabpbRyD/6EiFEoPUZ5til6xmvFoNGnsk27Q1W1vA
	Qv1a2YEbTyVPrMixgibBUbQK0Q31ug/UxHFm5+vak4bwMiINeBHnHB206+Ts8pDJLds=
X-Gm-Gg: AY/fxX6ylpVPuAujT/GpZpqyWmEntu7dMS6O/lo/sdq5Kwoh4/sbLQoqRSYl++z3qF5
	QSRFbQsE8svl/yvTIdgDjDHVhvfu2PesU30R9vY6oi3PshIte5Vlp0+w7Rfq5gEcoM5uMiHfO3W
	BV2ThcyAUCsLyVJhOWFZLmWrS1orHuyAEqdjlQOJbJqEJcS5zk+9emF6n6I4ipNZZM1U96OSg8W
	BCkdqwryAZgUoKWTFHjII6BxaxnsIh2y23S/cr5zGlqbLMBkzpLjW304HuaEHqxQYfsh0EJA9+p
	r9H/Fo1IgeZA85Mw0KuWOPR1EdacY8KNkLjOMVWOXxtoD4urKpMKAz5Hz0a4TalKW4Nun5jmsHQ
	x8GJZfp43vCkGI9J3cxuUNsQvy5gO1UXG9eTdXm4KNtMF0s5VM59/WzgVbMd+1ZfeLk7ry77p7l
	nz55NkL0IzW6GbK3WILbE75nFjTWrmxL7F+BuXO7nUstve+FKHhbqM
X-Google-Smtp-Source: AGHT+IGQnz5PEx8LxOfGK9LkP+QK7fQMiZ5NijpaoybNg98oXmt5YfVveFTA2OQMNZn/dfHJVeSvTg==
X-Received: by 2002:a05:6000:22c6:b0:430:f62e:d95b with SMTP id ffacd0b85a97d-432bc9d0f75mr4987371f8f.15.1767715075853;
        Tue, 06 Jan 2026 07:57:55 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm5211662f8f.17.2026.01.06.07.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 07:57:55 -0800 (PST)
Message-ID: <20632cd0-30e4-40ec-83bb-56d915c4ddad@linaro.org>
Date: Tue, 6 Jan 2026 15:57:53 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
 <20260106-sm6150-camss-v3-1-d1d5c4d02b0b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260106-sm6150-camss-v3-1-d1d5c4d02b0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:04, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem on the SM6150 SoC
> 
> The SM6150 platform provides:
> - 2 x VFE (version 170), each with 3 RDI
> - 1 x VFE Lite (version 170), each with 4 RDI
> - 2 x CSID (version 170)
> - 1 x CSID Lite (version 170)
> - 3 x CSIPHY (version 2.0.0)
> - 1 x BPS (Bayer Processing Segment)
> - 1 x ICP (Imaging Control Processor)
> - 1 x IPE (Image Postprocessing Engine)
> - 1 x JPEG Encoder/Decoder
> - 1 x LRME (Low Resolution Motion Estimation)
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

