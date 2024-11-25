Return-Path: <linux-media+bounces-21954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B688B9D829D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BC2D2877F8
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F4C196D8F;
	Mon, 25 Nov 2024 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfFPD5Oc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691819258E
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527363; cv=none; b=m/MVfKI8kLo4bcI6R5LbOohtAWvNEVcqGg6lA/AzAXvVWKbPgp7DLk2e0kty706D7lxA6o3kk2hs4BcOJXm0DXZN2/87ix0Uq/S0QNC+LBEAceofypCx1VN8aUjH18zHqufqb9QDEqP+kFij/dxayV+lzeTBXZPuuOFG2b8si7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527363; c=relaxed/simple;
	bh=SN1ke6h10N1tpIjFi42fcVYTTBA9mbS9XqPXAsZIIgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srtBFS4XlpYCkEyhyp5DKbmAQeLqKEZa8RM4mEHZ+rCGKqktvUSHYSF5U2HP0nVW5rHfpbWSrzPDAXnqCySBY2UNtBZYxmzeIuEOsvCqzrqGIibk8zzRbPAik1JmJkFeWsUk3xVzIEb1bKoQWRblhB2Gf1lgDDFGCvbl/2bO0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfFPD5Oc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso8152895e9.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 01:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732527360; x=1733132160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SN1ke6h10N1tpIjFi42fcVYTTBA9mbS9XqPXAsZIIgU=;
        b=EfFPD5OcRby8/avfdKh+W4e1LF5kp1IiC3AVaUpPdRVW0T4K5dcKT+aqcxMo+Jfcip
         9b2hgOtXTY7D2OX4LNZR9S1KLT9IZGDiKsZlmTloQHt9jOWmsRcvwXwhUn8+r0va1ZjS
         rJ6D2kIJga+EqekfQkH9W/OrIsWWOrP08zb8uu4b/89uvs7krbfYgpMe6VK4Qg/I1u8j
         HxUAYlOGv68XJ5jrEYQm9LXROnMuKCpRUXkZoXJLd+loA6JcZ9C2fTGQyMe9FzqFYGc0
         iD9hYl+dbzuGLQZLUeViMnjepLBglwqla9RxSMsCzNMG+7qLkruQ9J/XaW6BmcC1tMd0
         U16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732527360; x=1733132160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN1ke6h10N1tpIjFi42fcVYTTBA9mbS9XqPXAsZIIgU=;
        b=CVn5C4aIbtCVA0eBMpoCDMQRAaTdV8vK0gzUjuTSRfsm4tBcUrdtLGMaGULQVs7Kzj
         2TsryXDRlXQ30Y0Ooutv99zGhrfiAYmSEF7yI0Ji2Gy/FyulGdJKPdkYt1M+wczIVrOX
         v7bhYbCmG//MJrQ1hxJGP4IdW9TWnZ86HIN1xix/LSoIQ/ztgp1j67ORv2sShwFAbt7L
         RcIz+JfD4rgGBMO5AF2pc+vqOY3g+Lfxr2gTO02QqIp3VaO4aCMIr/WUjchvwzqGW3IB
         T5BJiK3I1cmJN5Iq7jz+VDX1kl64b694xXcj4Qw5oWxkyv83HmpfFaR77Nz7X3rXxTb6
         d5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCW9SBLzw5VAOcctRHK/Zoh8UX9DB0uRsgzT5s48OO0AfXIsgQ63z5h9fofH5yb9XpE8/NNa4nFUO7SQaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0S60vqZwJF3Uk7s0Nj0kfVVfjdwVMbvD0hpLt7QY9D6MHCA0p
	tyqoXgvykdZfPTWkrQicd1VVIHvJ4tQ0eSAnDqlB+d17SPay4c3QtckKjb7Arro=
X-Gm-Gg: ASbGncsYzzv60tubPSTa1e14NnOsRwOzEDvP1bwoX35H/Kl3QZb4ykcXbKz0cJUA2Ax
	ZMvkmhg7L1cB6hpC6tc8oIbB+qpCKoW3Vw5kkvC2DTQaRrNlTDOhtJ1SXj5ewUoIqZCh4JwWVIV
	TztHo/25NBPZvnbwhDMujVGK+pD8cgEYzEaaC+coJJd8mjqehfhSjRL1DNd4zWDkpb5KuQjXqCE
	+XVIaR3JdenDr2QtyJtS9DUfDJicaAjaFD58UQ5SgMuQHq8PXxAe4eqvctWLlQ=
X-Google-Smtp-Source: AGHT+IGGanB6M26FvTKDaJXED8zAo9zRUZhfKFIRCk7WD5/Sjbv4DRD3EJV+JM26XNm588PaSZdgMQ==
X-Received: by 2002:a05:600c:4704:b0:431:5a0e:fa2e with SMTP id 5b1f17b1804b1-433ce49128cmr97088715e9.21.1732527360218;
        Mon, 25 Nov 2024 01:36:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349dd9a597sm45357745e9.5.2024.11.25.01.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 01:35:59 -0800 (PST)
Message-ID: <970a37f0-ccb4-4c23-972f-4100cb6c4e81@linaro.org>
Date: Mon, 25 Nov 2024 09:35:59 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Use APIs in gdsc genpd to switch gdsc mode for venus
 v4 core
To: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "Taniya Das (QUIC)" <quic_tdas@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <f7c31279-8492-484c-94c4-893d98f53afb@linaro.org>
 <2212eace0ed44c439da117fb05f2b1db@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2212eace0ed44c439da117fb05f2b1db@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 03:49, Renjiang Han (QUIC) wrote:
>> What help do you need ?
> Since the GDSC flag has been changed to HW_CTRL_TRIGGER, the v4 core needs to use
> dev_pm_genpd_set_hwmode to switch the GDSC mode like v6. The video codec has
> been verified on SC7180 and the result is OK. The same verification has been done on
> the latest QCS615 and the result is also OK.
> In addition, since the videocc of QCS615 uses the HW_CTRL_TRIGGER flag, QCS615 and
> SC7180 both use the v4 core in venus. So the v4 core needs to use
> dev_pm_genpd_set_hwmode to switch the GDSC mode like v6.

I think you need this tested on sdm845.

I can do that for you.

---
bod

