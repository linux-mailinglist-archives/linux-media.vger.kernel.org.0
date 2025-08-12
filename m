Return-Path: <linux-media+bounces-39550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F97B2224C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E1E3A68CE
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77142E613F;
	Tue, 12 Aug 2025 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ss0GfxD3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB324291B
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989256; cv=none; b=G7G0Z0QQiS7cx7WosvdttcY76tTw9M2Yzk3pBFz0TNoUe5Xi0W+f7HIZWQejNLWkTM0TY361ulrrQE2U7z43qIJh6S3+MCUEL4+QvqLSMYrFIpkx6NfZYNGGy8kAG/rnI/tyDjw3buhJ1XjAepBVNij5gUevUVqJWXw5q/VIwKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989256; c=relaxed/simple;
	bh=fy78Jp4P1LO4rZbIIu+gNVO4SGVSEz4RbE4x7iWiTBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adFbcBiNCN7pk5DDBo2/xneFgm/Wqgba/uMfX0tnNL8QviqzdktFQr/H7uggTtcBbfJnn/b77My0udcdSU4HqHGip4k5NqAD77qfmNvD9CpOKNUbqFeVSrKwgJOckh5Lp4V49+8p58WSWw9PGTyz1HEtZ3GhFP0IxIK27YUw9uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ss0GfxD3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9141866dcso131346f8f.2
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754989253; x=1755594053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fy78Jp4P1LO4rZbIIu+gNVO4SGVSEz4RbE4x7iWiTBE=;
        b=ss0GfxD3Sx4ct1z7Rir5420EkNnhdjtF10preYgo/GrIMjy4MONS+jhW8qa7U6YlGu
         m6fAOSKpP6RNvlnSmCutCZ5wbQdXKHIL34kyXQloZl5jutH7/o8Onwn/ciTEbW4oIBr3
         o9PbUPeiiBNMs5xxMkH0jNXahHY5Rj7UsnZj8oJNNPOXbOdMTvQAC9E3Tj1MDU5O8AbK
         MrUbBKwEe9QofoJFGKD7zVKComDgnEO152wZMSMROq+mkzPq62AENkI5zl8Q8+KqbfTV
         je1SCSsrh97BJ1m5XFab+ZqG/Lx+VoVOqD0N9v4Is+hopU+Jh0PmQl5KR5MHVI652JT3
         5xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989253; x=1755594053;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fy78Jp4P1LO4rZbIIu+gNVO4SGVSEz4RbE4x7iWiTBE=;
        b=nMQaJxLV3yHuEoJedMinBhzl7tldwOTIvj2K4U1lLiEQFQUBosDFZmafqnJg2rBq5f
         6eUF5tuq8xzGFZ2ZdG//1BP0kbi1NN8tgBd1UZNTchduM/tuJK+50MCYUOxtgAx38pWF
         BHOsQiXr+w37kj8G4Q7f834DpqLE9veW/5ksXQ52ZupBSdJTExl+LAbotTvARi7ByLLb
         sdsy4LLweS58/hFFjZuQYCAPgdlWUK9dREc7eGa5XYHG7hhz7gkD3vm4uN9dzUDZ1P3h
         D/WvVGn4RJtRYethF7HwUIZufDzZxUJELV1G9Ep9lgXdx3BhSRDnHfcdX9HupM/iCQwy
         wXNA==
X-Gm-Message-State: AOJu0YwZq00En74Vsg3tvNkSbNv0GuRISC8gO9VtgE+nXLZxTRNS2fc4
	k7K96cihd+MppkgPd0RAmPmhdE5eARpBW/O5ecWgVXeDwwogeoNTIb6XYK09wFpBp20jKVCP49n
	gsL60abk=
X-Gm-Gg: ASbGnct6bHy8xeDTQmMPup9YqgVbpLeU8AVFOjskEF6xOZiaaxntvwfGHALsTDCHjuS
	DTxtQ+Ocp+B+jDKM9jB/gdEAC8XYoHyPZdRq2ylbk8jwG7I4DHXS/Y+F4T9sa7wZS/klhnHMI0E
	OijEKDzuMNUQWbTT2TOe8Z7e+7edhegCqcTGS2wrBU09JXMOfgc89tS+yV36Es3By6bZlhTym25
	lemC8rODvHo7et7EVb5XqQk3wCBc5N7QbrWDHSGay+WOu+KEsuCHJGztTb9BleL1AlHFlVGZYmE
	uzcwOOxKpzRDR5kErxQzYfCX6NvY/z5P+N5kh6hjM8O5r9bwzM+9roJ2XQitcdtxKSd+Eb9nlUA
	9DiuiTTczptEJM/3ALx4Dpl2IEb336ayxV92DBu1g+HbT488kJ27gfl5yvTf9vWU=
X-Google-Smtp-Source: AGHT+IGgf6IE5QU7F/5cEqMJuSiQxnLhtBPDTGDlyRH9YPXSIH/Jdg+r30fMZEER57XN0t3TVHpcCA==
X-Received: by 2002:a05:6000:144d:b0:3b4:9b82:d432 with SMTP id ffacd0b85a97d-3b910f8cf54mr2290237f8f.0.1754989252722;
        Tue, 12 Aug 2025 02:00:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e0e70218sm315924085e9.20.2025.08.12.02.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:00:52 -0700 (PDT)
Message-ID: <af4cd1f0-9f3a-4eb9-8cd4-ad20506c7a9b@linaro.org>
Date: Tue, 12 Aug 2025 10:00:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2025 08:48, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.

Can you confirm this is the sequence you want for sm8750 also ?

---
bod

