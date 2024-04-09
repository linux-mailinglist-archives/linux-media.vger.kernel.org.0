Return-Path: <linux-media+bounces-8938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0F289DFBD
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 17:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8611B36314
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A2913D889;
	Tue,  9 Apr 2024 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uHsfcDCm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A21C13D623
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676956; cv=none; b=m7a0pOPKDzWt0PIz27fXfM/MSJJvbS1cIVyo0QEp5vRXJYTqYgi90xwYMlzy4x4melHVFbjV75EpewW5DCjmAa/Q7DNh31AhTm0cbtdbNI7sr2mmg1zQCrUNTNYzT+YLtjDr8OIBbWCgAAA8OKmxeB+qH3yCLQgK0+set4RY210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676956; c=relaxed/simple;
	bh=z5AF5xY1j5K4ShCi88r9SGOibb/8QoN3dzNf4V00bdo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sl1ip7/8+mbRSTTzaNEhemvAdhsNq5avHGjVFzP9/YFsoGBASSpYKbTcJ5bFNKTowZ5DOGmee9cXpjufL8OHEDAAAATgh93CsW4jHPIpMUT1CyEC6e44VUf900qjn5+U+48usjGrKf9skcXQzetyGDEsNv4q4zTdTKyK+6fcVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uHsfcDCm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-345e1c64695so1038947f8f.1
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676953; x=1713281753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RO/ZWp4a+TbCWiJJVnk1jNMrTa4t5wCjsm2zT6QGFvI=;
        b=uHsfcDCmErwWXuaCw+jBvo8ARW1yf0HFm4QkOMqc5tHfP+g72fazGhJfIsUnCt8xpe
         mp/xRZsIg0mgOZqJhTG8cT7McPXGJ1ukft0WWdaIUS+eWaDA2zXp8vzYYaWFVJ1n4c3f
         SCKvonjGJfPXnUNxwdImPJFX79k8bQBPCc+4An4JmfWG/NfhIaNniA8hj56CNjbaFfps
         zd1uD1WICyi/4n/5GXUDYbTz3/piVvk+Bvrj9mW0yKGLaG3FVKLIUKSdcta23cxqKwRN
         dydlEQziVshhvzTl9Kd5bJ8PPzPHlRyIBKwjcFbpdJ+No1jeRPUwmtUSN+f7b0r6q86a
         xMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676953; x=1713281753;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RO/ZWp4a+TbCWiJJVnk1jNMrTa4t5wCjsm2zT6QGFvI=;
        b=JT6gzW00oAg2Qjxy1e26pnwd8oo8CDf1/pDCxHOgyD0wLgNJJOiVO4R31/VYaPYTt9
         p82ig/tKTHnRU/a/vmXo39wCW/ON75IHX5RpgOkAgWPdIHQrLxFoQfC9D1rcLMV/SHcE
         YJmmLyE+abHLDNmgrLg7alPX8GkXaJKxsbIMzN2DNOAxF/a6f2v4Xh8zyjqjJKiue069
         gpOeKN6bGhpL5KUZ2sL10NmHkp1pIy7Hq2ZB/jBxtEOawSbg6w46gOC7Oq1rXLnmcy7G
         1SlZW90/zp6/gPWDWRxhEvy2hNiBzu6qS4+FOvU9pup6t4JRVXo+I/j3ar4UinHttu2P
         idcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPk/FdLEK0whH29QAXa9nQ0HcSdEnzGWVKL9htRayBhAmgjz/uOXJb+EtFCjTLO8Bq891GOu6I52NUoszOH4phD6sCEo+pEP5Gm9Y=
X-Gm-Message-State: AOJu0Yyk6ccf2FxyqZYCTe2HlhljK2RjJKLwxTbERtUHcdzsAfgf0g88
	QZpfZnSaMACELOtsBzYv862f4h2YXZ3WY3jsuiDtWbyDFt+vmTc4SFEdB6uh4Ec=
X-Google-Smtp-Source: AGHT+IH1MlVadqwVn3deyEvCrPmhxyitZBrEegAplbcQczNk+NJd5X1pH7M68uHU5nX6fsvXs4PUJg==
X-Received: by 2002:a5d:4088:0:b0:343:7a53:16cf with SMTP id o8-20020a5d4088000000b003437a5316cfmr65352wrp.41.1712676952870;
        Tue, 09 Apr 2024 08:35:52 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d4ec7000000b0033dd2a7167fsm11760977wrv.29.2024.04.09.08.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:35:52 -0700 (PDT)
Message-ID: <d9453d32-c83e-42e2-b269-29f1d649c0df@linaro.org>
Date: Tue, 9 Apr 2024 16:35:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: qcom: camss: Add new VFE driver for SM8550
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-7-quic_depengs@quicinc.com>
 <18837b02-27af-4d0c-a772-bb7ce787a4c0@linaro.org>
Content-Language: en-US
In-Reply-To: <18837b02-27af-4d0c-a772-bb7ce787a4c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2024 14:39, Bryan O'Donoghue wrote:
> 1. Please use 'rdi' not 'n' as the parameter here and

Ignore this comment 'n' is the right value here - you've already used 
'rdi' in CSID which is the appropriate place 'n' is correct here.

---
bod

