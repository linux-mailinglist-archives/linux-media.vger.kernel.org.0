Return-Path: <linux-media+bounces-21390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A79CF9C79DA
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 18:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60C89B33D66
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 16:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470FC14F114;
	Wed, 13 Nov 2024 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ETD9WU0o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D577E111
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731516343; cv=none; b=Z55CSCLbwHxbBZk/WBV+O8NTrkqeK/RpZ2vvVAnbaM2WdEZNJywqqBu5ZPhJ5t8HwJUp/bx3I2YERjwF7S6t4hGzO2dX4g6NOyXslpZcXgVZ21Ig026SpiZvIjCp+IXJVdPWoaUJ39MUVomP9t9LC6H6swlkAAp85zc3UkoxmWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731516343; c=relaxed/simple;
	bh=QTPjno+2Co8ClCqdkv3+r5AS/3KRpmu8xbiZeVLi6lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkRajU8DTskF04aQ6WbtQYIsV4yKmblfH2i0aqvRpYxbaI1RGHJa1fniLHwGEKvSF+bdxzUpN64n3+WEp/PwIR0/+eWtZ0VRHyQJtIlOy0L7WSR/cuY3O6isSGTyuvRcUXFqTjKFmla/i37Q5rHV/OgvpP4lDF9IIq4Qeqk7hVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ETD9WU0o; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43161c0068bso61194625e9.1
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 08:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731516339; x=1732121139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1op2LOAlj+eAirTUXFxolzNN0nAw5qrpfB/86rSjz4=;
        b=ETD9WU0oroDs0hR+otuzxRWi4Ojl4kUEduwIN7I5Ueyq51m4xwohN5jpsE/DrQqbg3
         pjSxSjp2rlVS0nRlFlDbS5FnqfbNpwpCWr0MG8zEBipWLK9N9A9vo6qli6ge4qNK/LXG
         P8KYCFo5pbbwzKF6tuyXZ67Y1wOnr9HnN8yqx95FsK6rvujNCOBvZxoeSSbtWgnlpiN7
         XPKwHUvZ+b1i48sC6vO1cICxuF5SwZ+62gn0hAOyHlYJuBFA+egEG71yUJJfD20GRV3t
         HG/TKUI/0JZVz3ES9vHtwqvNDRCvp7wyIfq/VGPcC8f7cfUSPQ9Ut75DF4scN2+cg1mk
         LqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731516339; x=1732121139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1op2LOAlj+eAirTUXFxolzNN0nAw5qrpfB/86rSjz4=;
        b=TfkaS53U/CdcL06+qM1YfXI1Zr3/gmfo3NBN1YEKwN/BWUqUWnCDjbYUzOVFK7ILPC
         GTBZ08SouNk4r0HSk2W7tJNmMhTkKL8i+30M8o5b1A10kuNNrZKXY3a6Cc0jVoFVpxs7
         RDpj8cbnj0hvwglM7Aj43VV811Yaj9aw64sJ7RJoGXltA6tzuaOV1zJ8CcGaKPQUb365
         GNV1S6m/NRqFt+1wkR76z0mikSflYgRifetg5L4/aq4j4575Gk4yVa285eZRDvMVjzot
         yB2+j5Ho3aEAhvXEt/ywUS2WjrT2HAjEKw1PPSIcquGUOj/m2R2F4oV8vuFLjOG+zN9f
         5w8A==
X-Gm-Message-State: AOJu0YxkEtRuUlcqLhE3tqMClmhkHS2c0HC6i4hkUFBsBJua2T0Ovp/I
	AdV0jpHjAAdsmrZ5DtkkhaNeRV0ueULVPCPs06V5WjxaAbKEXGGWMYy34fjIc+M=
X-Google-Smtp-Source: AGHT+IHqqp0aFwxKahmkIFeK1sHiHkIAg+CVabKxaL5zjVLCGxDgxZwCgkjrpVMDOnlIOoeDiEBSiQ==
X-Received: by 2002:a05:600c:5107:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-432b7503dc6mr185962055e9.8.1731516339363;
        Wed, 13 Nov 2024 08:45:39 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54f82cdsm31026715e9.14.2024.11.13.08.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 08:45:38 -0800 (PST)
Message-ID: <dd5a8b15-8560-497a-b969-d293c63b8bd9@linaro.org>
Date: Wed, 13 Nov 2024 16:45:37 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: add venus node for the qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-3-e67947f957af@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241112-add-venus-for-qcs615-v2-3-e67947f957af@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 11:47, Renjiang Han wrote:
> Add venus node into devicetree for the qcs615 video.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

