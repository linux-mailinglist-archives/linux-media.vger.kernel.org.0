Return-Path: <linux-media+bounces-23230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F14CE9ED925
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 22:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E7801654A3
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 21:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898321EC4D6;
	Wed, 11 Dec 2024 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yVEY8Hdc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1881EC4D2
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954257; cv=none; b=KuVwix6W+04yyXOrnEM+ayqepEp2H8W/Y+o6TkrsJd7Nsphacef1Geh9Fj5StlvgHL3HAyp1ExGM17KDh8whVANBveVnD0bUHcxcqy0192JQlM4jMdUVB97ppdE/RGae6kfoiyR9ViDcJgAyibSkxM7ThIA8oEflC33B3r3BbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954257; c=relaxed/simple;
	bh=NoocTxI69ryT8lgZX5nyYh4EyrV+I82c3ZNBMnlnPK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDFJwel6IwXQ69flgU7ANwZ3nbhVNq4GgBVHyQtJLZ1iMAVzcdtd7OkZOG473mCXXB8k6FIcKDP2Z9gT0UvQ1gU9evfofSK0N9oynQ0ylTBlMGJ1a8DaoGKF515ThyYESPsSjLBRNgwmTNlQq+x7DO06AQeE7p/MN2JYcQNHE2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yVEY8Hdc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so6824695e9.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 13:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733954253; x=1734559053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiMsT5ZPIfov52Mx3AVw33KMoPobt05c+bdtT6TpK0A=;
        b=yVEY8HdcZOYUsY8g7PVKHe0lDXk3YDPcwh9j/FVqXDQeuG5JXI9H44c7FvUgkzmnXy
         Vi0zZNrR5+QCTiI48idYjYWHFk/+VXfP20fYQ3I/jDnJJhLjJ0TBxIHl7fuSd+7EMkas
         EZ1r+tnMHEiWKvbWve0zH19pvHXHVMV8Wg7FOBgM/POhelOnRZ4GV0EjBjDgAConf+ql
         +Nsa+qUvY03LKOy+8ZSWMZp+hs8UMbG+PQrvQ4dkVc9R5XhCJ7l2SuQ1tjWugIzkf9rA
         Zh+nhhf5We/++/Qiy8af9tEdSuZBsAPq3YIxQiKKIkPxJ9J/l5dZb8RMiD/QxvDTkMFf
         XokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954253; x=1734559053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiMsT5ZPIfov52Mx3AVw33KMoPobt05c+bdtT6TpK0A=;
        b=KNCGFngfCdJqMgNESV4Vw2qNs/nf4hfZouZvbhfckTzb6knnvfplhMSftNnXGN1aIn
         6cEGo0TlcYluCU+p0veYtiHoFZqMmPGaG2u9R6FPMDiqFUxn8gRW6323CyI5InXff/vc
         iSKSnmF4VHlEkoH+I1QfA4ezg+XW8BbGjKVKdZvfkAKo3tNWFBURO9Ydl4ws1h/9zaAz
         y2TsW0ETyLSXuTTZ9k1ixC+oDl20WSmSgOqKxjh893pDptE+uVw5nakM2LxfEKcXWMNk
         G7WS2zhvwSlt/bFE/N0UFx8F0DqndLetrfjBguSLvBiwGa6zjndiDRlxFU7cVmWbKJ0z
         psdA==
X-Forwarded-Encrypted: i=1; AJvYcCXZxWDpvDhhC0LjbD3eneXpwj0TJW29BYGCssGPPZmZ5MhvRMdx+NW3eSoxeyoCx4e/YwXZleZ+ZwG8dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy412Fn+NmBU6zE1CnTPIIggbwICf3Md79m6vDRX/C1YBTrRmHJ
	6Fb6tiDa1o0Dx8lhPTqbKDM7RLuD7B+JoAPdhEybI4MYXW4kbhyfWREnin5ud4XYlcueHb6D5xb
	d
X-Gm-Gg: ASbGncvUR9HQUBnROpDonjS3tz7M5sphUqxlx3p0VhQYPCdIU/1/nFhAXKQLrK+yeJ0
	9K9dtPLVkxc/P1wuuTL8QrXd5X4hoPiyKDG+T3bN4DesckR3UOV7utqSJErjFws14R9CTu4DV5L
	1+UrWKZSsseuaHGVwFa5+XJELgIT1jgIPQhoV14tD9jI5DPJYxvgsXy2vCPPrVxXncJ+Eb8X5P1
	iwtAJDwaqjAE+tKB0l7NW7YE5elnlKhzv14a9rUo3a0QhBNPH1QePXThxRDGaDXx/4=
X-Google-Smtp-Source: AGHT+IFFp+r/vdKuglbxh8YThlHAVZQ6EWL6sTWl2g1jqrOQgWrFNPXYNjeb7DaZjcHoAt35YUmQpQ==
X-Received: by 2002:a05:6000:1543:b0:386:2e8c:e26d with SMTP id ffacd0b85a97d-3878840808emr704391f8f.0.1733954253597;
        Wed, 11 Dec 2024 13:57:33 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361d1cd906sm33498175e9.12.2024.12.11.13.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 13:57:33 -0800 (PST)
Message-ID: <138cc2e5-6b31-49d9-b70e-400a3f3c3bfa@linaro.org>
Date: Wed, 11 Dec 2024 21:57:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] media: qcom: camss: Add CSID 780 support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-16-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241211140738.3835588-16-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 14:07, Depeng Shao wrote:
> +static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
> +{
> +	return 0;
> +}

Could we avoid this empty callback by checking csid->ctrl in csid.c ?

If so, please make that change.

If not, it's fine.

For either case.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

