Return-Path: <linux-media+bounces-11267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A08C1A16
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 01:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 145501C22FCA
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 23:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9F6131BB7;
	Thu,  9 May 2024 23:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/PmO4f3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96820130E54
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715298960; cv=none; b=HL9wob1NNEWcHPU/1wMOvoO3GQEwjzXF/l7fyWR60VFsDkzYMYm4AjIZuBWl8rddqv+R4XBtOhCOIUH4LVqNN8hAC5lea52nS/LnYBkaN0AL/qQh2mP9cb9QefXWfbjVQorxn0amlwYdWJ7HPEjavjOt5K1UBr5HZEFFrPhZY+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715298960; c=relaxed/simple;
	bh=UELlES2ACAhJ+mM1o0XO08v+CHkaw8b0lYLbPsI3QG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rI5fAq2llHVHdS+ZPPct6k3OFkrYLsyrZ4Khl854xoqgzYaYRDaWVtde/Dsi8djRsznfh8EeqqoIJrbEZMrsfKPSIc/kq94WmfLSe/uhlpjj7EaUhsTPub8NpbXWMEuajvGvBgSbGQ1AeP7FvNsvc+Nfjj9ho+szDRATe9Jbr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/PmO4f3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34da04e44a2so990822f8f.1
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 16:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715298957; x=1715903757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fb74xBYRIqFq/c6DAFovtzCXTBDOLi3/e8KUftSNAMs=;
        b=a/PmO4f3GsR5OW05O+LTKCZVK6FHw3ga2S2Ha3lHtTElGwTMKAe3t8TIKC/5aXHv1j
         bsKrb5rmoGpJ7h3u12SnsIpf8UFt9Sid8+kbiqpmV+MBbKdotl9+8HyC/3W6A95L+KL3
         39fXyt3vCuKvAX8ngfQV0AJ+v0GzHJqu/UrmbDZ+m2SzrHW+0tIXEihxowYshX0QFHoh
         daqWdRMqHeBIZwOPmGsYZ2iNyA+RpCvGPMSlENR8zxRDiI76ZOJSD042U78lD2o1cXN2
         LElE5GJ8vO/WD6nsFZHJykH60e33uC5ZClWpVsnQF3ABunYB/0egRs1+qEGNKj/yU5Xp
         GJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715298957; x=1715903757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fb74xBYRIqFq/c6DAFovtzCXTBDOLi3/e8KUftSNAMs=;
        b=qSJzA4NqeI74enVZQEcgi0Y2hv/L2eDndyoglFqkSl/nQqqKeRWI0siPb4KC7Ob4aE
         5e8WDmR3ULlDj9LPAhxyz1EpHymFaNx/ibtlzKVCA2HnsE4+4z4nqoN1trK4HnXsVsOl
         TrI6iD+/oTZw+PWBfHu/bawlCs1+mvsnHdy2LU8kMuPdlLv11Vi6138wbXe+6yfZRzbt
         N3s5jCurCYZRrbVBiK7DrMpgwHWdmVNHXNNN40/HP0LPyrcxYGPl2h032/Krs6SqUhI6
         jEJExTucgSiK0pJ6zXE0JHka9Hm2q7bBNFmKJAqbmeW/XQ5wOjJJ0FzAki4NZMy2QWdd
         DQaQ==
X-Gm-Message-State: AOJu0Yw10ivL1sLibvH5fOB0QjJyTIrRkay3vgCowimybfmEj4mCyzvm
	XIwryU4ht57PLzVp1RfMXFQo0Yw3U93Qf3VIX7CO/ehB8yTCm4rApoojUZojLq8=
X-Google-Smtp-Source: AGHT+IHHTos/0O6mSj0vcqtxpJUzThg3PhGLr+9dwKKxXxyrjutvQ+cZS1AVYmAw4ywi/ws1vni/mQ==
X-Received: by 2002:a5d:5490:0:b0:34d:95e2:c5cb with SMTP id ffacd0b85a97d-3504a61d36amr646271f8f.3.1715298957086;
        Thu, 09 May 2024 16:55:57 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad058sm2909803f8f.66.2024.05.09.16.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:55:56 -0700 (PDT)
Message-ID: <0e6ad5e7-ab20-495c-aa76-77531a53d459@linaro.org>
Date: Fri, 10 May 2024 00:55:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/18] media: venus: Remove unused structs
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-9-7aea262cf065@chromium.org>
 <5eec6d69-badd-46f8-9da6-a578d5f7c3ba@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5eec6d69-badd-46f8-9da6-a578d5f7c3ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2024 00:35, Bryan O'Donoghue wrote:
> I think these structures should just have the "[1] -> []" conversion 
> done and be retained instead.

They won't have the same sizeof() then so ignore that thought.

I still would suggest dropping the `something[1]` in favour of 
`something` because these structures document the protocol between host 
and firmware and therefore are useful even if unused in the code.

---
bod

