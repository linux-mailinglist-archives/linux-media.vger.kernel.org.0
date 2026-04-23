Return-Path: <linux-media+bounces-59376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDKkHaXo6Wn+nAIAu9opvQ
	(envelope-from <linux-media+bounces-59376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:38:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF9244FD14
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 040EB3097EF5
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1FF3E4C97;
	Thu, 23 Apr 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnSAa6JA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187463E4C65
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936218; cv=none; b=LElWqua2LUFmaCuc5ApQoER6+rCNEnylHqs25S3aP4PI+J2pyUAnN2GKoPk7rjqZMZlZnEOhvnVdY2nlP1FathDoXq02JOFdj0kRy0cIgL1eTBaxOVIbsOlRGVBsyEISt+zsxIEfgEAftyNnVQECGCpfPSdW+lwzQzGSE2zvcEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936218; c=relaxed/simple;
	bh=53ennj+hj5rWSokWbGEQbLWHb/17dqpf2YXvQKqdVmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWPWx7e0aOgCNjPRUmkVYnNzzljvO9XNcGLOlc3bv1Nav4x4Ltexoy1Gs+htGZQXoIJk0ANdPukJvzeuFkvRKLB2nD9OFM2fRA9+phsDsdL4OPxrxyrPINuDYRqiw7EeAKw3az6IZRBpy6tsOdmGfJmrhYvKPaMUTyUsKsTWQF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nnSAa6JA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso59302855e9.3
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776936215; x=1777541015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pL1SbrFnD2hMqCJhJcMRGY0Wdq8twCe13/ZvMTtbqsQ=;
        b=nnSAa6JAkMlO9I+eelz2YY2WvP1fN6LDHtLdH6OLt3luUoJe7UnBphiQt2IYRiotgS
         rjpGCh7kc90cyQdZ7XpF2QtVhsHEkG2hnZMBN7RgRqhUQaRuDxa36SUr4z5MSi4cAZlC
         Dv4ZNggdFkO+tXFiAMd7P8n2lSUH8rGDpByGD5Cwygy4XytJT+UPgUbegZL40iHH++5R
         DJA7fY6Q8dMxqF/cZo5IiR0rUDzXfBBuKbQ9rAo63Y20uhUbgtSibPBJx+t+qXALqdy/
         jO0v88MJRa7dZ1oMPmQr88llgf0BdCJDvZKk741t/0/gQZ11OKpET728URYKD7MarIX8
         Xg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936215; x=1777541015;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pL1SbrFnD2hMqCJhJcMRGY0Wdq8twCe13/ZvMTtbqsQ=;
        b=eu9ytptD4/5ZfpeLbsRtau8CbPZh40ukUvpUlWkoO5bbvc48/sKljXdTGrJBmwH7uY
         6E+AV7FJ7g4sQFRqID4O9+2Nelf0Vw/9hNTWzmuQ7j7H6N/aQWwE1l/XFIvyt6aluA5R
         9O0lqOflWvn016jXCVwqphw3evB7CrFgpOGV67uywQX+ONH6tMWozhKp6yKkneGCK2jR
         7RMyyctBdEWw+YDkVPdvzVxSx/G6l8V1V9v+MK4EID3cdgAlzGFLqVhHlwZgta88qaaR
         AbckHoX4RCRcuT0y00C2ir1ivIJ8mhfJEw8mUu7qIkH6/aPIa6UMnJm0w/1GFP0VrCqW
         MHtA==
X-Gm-Message-State: AOJu0Yxg61DplT6Dhtgj6ucDUJLugrSnF++Wfn7LKQPiqXbEJ4iQ+wOQ
	caEswogTexeoRgO67Agk5nAdJydKN1t2iP2zg0oGdgzxEYLlzsGQengZqtUGwRQVUn8=
X-Gm-Gg: AeBDieu1I50y/e5DUrRjJOzuKAWJVLUuSRNtMITwdhNbMCcDuBlsgLz8L2ucJfXnKPA
	CXjRdDiHLlytddp+0f6NeLJk8MtclAbkdbG/BXUAn0HLeV7xA/nepICxZR/mD29U91HOjIRzoRO
	eGC1pFewYngU6k18q+BfqkJrTWrvu679H0gyfKVaAhLm75Wt60M9cbaWXWElXHHcxL1k1r5bKwh
	2jwQDfCdHFJk3P5zRrV06ioDipSVSSBcEZeMX4T71rnarHziv2m9YExWekIUmTl7jaCYm4B2xnr
	AcRXE0Cx7hKn+ZALCOHsWKiAwV+C3p4FmQmSEJf7sx9EyWyAifGylukjNNhPs91vkNU/HTrym/X
	uUO45rLr1hDKc3BJ+BTD0sJltDKHsfnTniAQFqFnkQmTQDygr0ZFgrwBqpwtXhQJOCke5e2sJxq
	mkP0+u8/WM9jQT+JqrLhInUpVSmJgv6zfyUqpac5Wodz5QpPWG/dUwAnc=
X-Received: by 2002:a05:600c:5246:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488fb750a1dmr369865355e9.11.1776936215211;
        Thu, 23 Apr 2026 02:23:35 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.41.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5d27d6casm20573705e9.27.2026.04.23.02.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:23:34 -0700 (PDT)
Message-ID: <01851aef-6198-4fc7-8707-eca66bfab63f@linaro.org>
Date: Thu, 23 Apr 2026 10:23:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <lhU_SUvQxoQO3vywvJ-vpfeDCHbEr-433DdDVZOZoUSML8R5OW2p8QjArvT3YbMeIZeOqwV7tolz25aSOxnV-A==@protonmail.internalid>
 <20260422-iris-code-improvement-v1-3-8e150482212d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260422-iris-code-improvement-v1-3-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59376-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 7CF9244FD14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 12:16, Dikshita Agarwal wrote:
> iris_allow_cmd() incorrectly tests a single sub‑state bit using a scalar
> comparison

I don't think scalar is the right term here. You're changing logical 
comparison to bit-wise comparison.

Otherwise

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

