Return-Path: <linux-media+bounces-32697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EFCABAC99
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 23:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BBB63A9E93
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 21:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A89266B4B;
	Sat, 17 May 2025 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsdATuH8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B53224728A
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747518099; cv=none; b=OEHwwhSqP7l6BhpqrALpIMoLC1s+QCa1cZ8rpgInm26uxpq+OCk4qnhlLNBxQJ6QGtrRkCMTGKKf2qgWkizAOtYWGEhaVk40gvW83w+TsD0l1QPRgGM3JPTzQBmcKDxUe+xQWs+92T3xg9krRARynJhC5UVXWXusm7er8kGFouc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747518099; c=relaxed/simple;
	bh=rgf3AmO0KzSB0QITDvORX+Y0fa0RiFi81JHdrxxkzEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGJesSPWokGXtzK2vmCHjyrKs48Xcm/TU7781jKwzj2EQiQXpD6yaWEAgq0hppvm5/VmUf7DuRLGFJnJKgeTotuL8XN9Sep5vXKT14rrPVlDeoxIYqDZvH6GJrx39VTFPc74UW1gHDuJaql7mWeEj3evqE1zNMQYEO+mkUePEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsdATuH8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so33531585e9.2
        for <linux-media@vger.kernel.org>; Sat, 17 May 2025 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747518095; x=1748122895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bY76AEEcyf1ZaP0Q4E8CqeVAvvQqjzY+efsftGL0QMU=;
        b=gsdATuH8YVlgoetNJoOdL4qdoHuo7aeQzZcjQfwhholFOFSiT48g+ir1YOpkAd2Gix
         laCenLPlpn7Dq7jnLcpBijYIZVbricScxpaAqyBm3DkmFtfiwlO5azXswn0AYQpz8S2G
         tW8LKo9CyKvMnBswbMtgI/I3i1Q6cUiuS7d967NGSUETHQ4LseNd5NrQCChl0sgijZk2
         euw+D4YX11O3FiGGN1YC3Y1FQAMeQB0WomsSpHz9O4h2QaUsA+d8mBOojDBR16rgU5JD
         m8hVU1l72cUq/3ubTfQ+AfSTjC/psj2iz2xunUX42qPEGKzLkV9Fxi8NbHspDWtVVnaL
         MsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747518095; x=1748122895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bY76AEEcyf1ZaP0Q4E8CqeVAvvQqjzY+efsftGL0QMU=;
        b=uM3dJzCRG6F3X+gJpV/TSONK+8C84TIqMgrmDVguStayEikn5jUW0/KNikxYFN6P0u
         I0Y7kuS0fd/L+MpXJB41DAGcoHAw4yj1nt2ggIVaA+kgmNbp0bHRDbvTe3jqQidOjD50
         guVV8SyDvUBcwZSrPoh/6z/XmEFH/wUicBd/zIp8Rwtfbjl+37KdVX5TxWRb7snmjNVn
         yGCJe7eVeYOebgfyLlCfXha+WTH/RK1ZDoTC1QIFIefWr87xh7ZKt+TdySsJFro/XlOM
         EtC95mP4EOZNpxB2XzUv/JYAwJLMTTTc9ZtzVmrySq6QDV9ohtJrLPCwJN1zmzjuvbgb
         q2nw==
X-Gm-Message-State: AOJu0YxH6pm5lGWxuu52sB+vORENV8T/EAzNv9gFU+w9fli4/CZB8i4M
	LG4Svc5rQy1x9KW7AbyNdWuMB54F0yDasYWRc/sPI662SgJpAZ8pL/VbxhiuRNT0fd8=
X-Gm-Gg: ASbGnctfLt9vReM0q4HYng0e5SFeFTrh+Scn+kRBRzwIIpy6XsJfitsJZsU9bA66N1b
	77xws7QeFenSlvDAd0LDGpaTsbgY64kJMR53AECJQuglOod3CiPJx/fOAk5kKDQHj2z41QjEXNc
	xc1mzCxFg8L6i1oCQDbxl/KqHPoWzL4s/LBBNqIIeLEjDN+sqHQ0nECseEwEpT1PykVyPchHRwW
	hZdT5xv6lE6yv/lYhSBkLyzVKib2oXXkseH/xzMaoXvwKmV+GXoECej9eN2v1TWPEt4JyDkjnKQ
	x5YCE7G3o2UmznI+PFqeyGKHN6hUYgBn+nlpsP4B3onKxczb77mY1Ju2GP/StJrP9IeDHR45cIk
	ZN1rxgCRcfGQK7nnm
X-Google-Smtp-Source: AGHT+IEfLRMthem1h4Iqf+AVyw92a10FVG/gJvB+jnvXapWRtPRHbKjdboZGt4Z0ylILdnQ8uegkeg==
X-Received: by 2002:a05:600c:a105:b0:441:ac58:eb31 with SMTP id 5b1f17b1804b1-442fda3038amr54007955e9.20.1747518095254;
        Sat, 17 May 2025 14:41:35 -0700 (PDT)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e852fsm163281875e9.27.2025.05.17.14.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 14:41:34 -0700 (PDT)
Message-ID: <f39310ec-ff30-45b4-ae80-768f252b7ed5@linaro.org>
Date: Sat, 17 May 2025 22:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: venus: Fix OOB read due to missing payload
 bound check
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 14:38, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Currently, The event_seq_changed() handler processes a variable number
> of properties sent by the firmware. The number of properties is indicated
> by the firmware and used to iterate over the payload. However, the
> payload size is not being validated against the actual message length.
> 
> This can lead to out-of-bounds memory access if the firmware provides a
> property count that exceeds the data available in the payload. Such a
> condition can result in kernel crashes or potential information leaks if
> memory beyond the buffer is accessed.
> 
> Fix this by properly validating the remaining size of the payload before
> each property access and updating bounds accordingly as properties are
> parsed.
> 
> This ensures that property parsing is safely bounded within the received
> message buffer and protects against malformed or malicious firmware
> behavior.
> 
> Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

