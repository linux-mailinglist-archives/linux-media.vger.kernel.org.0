Return-Path: <linux-media+bounces-14386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFDC91CC99
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 13:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC9B7B21E04
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 11:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF434745D5;
	Sat, 29 Jun 2024 11:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQvilf/n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD37373441
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719662018; cv=none; b=u4Xj+ZG6ePGak1zVfbKNmdbB+Pmlo9OiwJx2GiM0H/kanSaWGCMRksykwjq7JnCJYDAA+ttSqsCHsb7JLk6HWAs/i6p2VGAbsKXXZbePrbes/s6Cn8yoJ7FSAZBapnRmz+FuIGGyshvUk8FRm3PZke974VidM02bQjYBju6wM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719662018; c=relaxed/simple;
	bh=UbW5VL7aSa1hgKnV9lDs4v940Pz0n7ElVXgY/D4jBAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxjGAbMsX02g+28RGv7OfW/Uzf0E43Jt5eKGeRbj5/Z94ZkZV0ZD/OJx4m0l3z+53MymW/aisEw+CceczN9/D3UL5bUYh7Agguams8jv9BUt9YP/ic8wmQX6k4zv8ZfzWx+Lx36cVkCa52U8kURlRLQDcdz7koqkkqyDtaTxOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQvilf/n; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cd87277d8so1511697e87.2
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719662015; x=1720266815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ATHMh5/H1vZRHirTenpuAs/sN2H2934t5NqxWY6ds4=;
        b=FQvilf/ndhqn7bnF3Sc+iOzAXgP04tV/fUdxQPG6CwK0ZR4FIZm4pNKEv/H0v/jKoN
         /RcWy1OJ5Eq9A7he2UyiKnM8bzFVtN0dFOR9enooqyUzD2NESxqtBg3NKkl+aNC9lePv
         /D7YNSeW2jfvR+XVfDSZBrn8mzmTcJJ2LM2kRlKWP5j5z12r0uiQoke2KSKvqmKI2bKE
         Ks2BfKVub9f1reUwtl+4ZzL7JXgykl3YuP5UKCQKWEZoewEKDOPWcKUKZ7Qzkx4CTDd3
         sfEMskOiKzuRPfV+J0EffSNiiwhp4XOnyBP+TeqgD3DZ7yLG+tqUYiVKnfZYizQ9s51t
         Z7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719662015; x=1720266815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ATHMh5/H1vZRHirTenpuAs/sN2H2934t5NqxWY6ds4=;
        b=iHSPEaitztlNmQt2HhLOgsMgecUJxpZhPs5s+dJ936fp+Ue68cXi/qeYtNU18Z9d/4
         DpxGtknuedl/LzwPwbdlNk5WcQ2yq/bFTic/BUN1fTRn9cNFlr0I9/zp260eRka6Yxar
         uut7Tu8VBRp+5t5f9daHBJzK4zaXsIwTeOWao+37yXkYimsx7XEIPskTws/m5yezF1J2
         r9HWDzLKBJ+8vMdBFWY42DtrdU9/5oa6NUojVWgKwyF4YmpWivOaywDkLECkrSB7kVz2
         /lIArqyzTqBmmiEkeTFwVR2hGaIw2NfkXX1j/84NKUmHl7xtfMUmKjpw1Y1fPMZgFVzO
         MDLw==
X-Forwarded-Encrypted: i=1; AJvYcCWbpBxRlImqqnruY7Y4jjKTfmpmUyFQTd6vbUEc03XWKD+3mK3PPejclhEYFbSxLXH0XZaSV7c5+MsX/i+Hg0ykQn21k5q/A1xDaN0=
X-Gm-Message-State: AOJu0Yz8vOTGrVciGbzJShDoLiKwBM1RAvK4xTEn9+jxT4cC/2tUavDx
	bDoBbt0DCx9gBl0rCuSSDrkhJOn/doEjrGgeRGHv2iHHTUCZH8IEhtxcY9iGRS4=
X-Google-Smtp-Source: AGHT+IHKoL94pLcsMI7QP+3lZDqkLV7sHYZhKQLx78VMLc+Pq1ZBED67zoxq06OAHmRWOXzc9VSZag==
X-Received: by 2002:a05:6512:39ca:b0:52c:cd0b:f0a9 with SMTP id 2adb3069b0e04-52e8274ffc9mr670858e87.58.1719662014897;
        Sat, 29 Jun 2024 04:53:34 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc412sm4751177f8f.70.2024.06.29.04.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:53:34 -0700 (PDT)
Message-ID: <da278419-f8dd-4f8a-a8e9-06ffbbe3fbe7@linaro.org>
Date: Sat, 29 Jun 2024 12:53:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-2-bc798edabc3a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-2-bc798edabc3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2024 19:32, Vikram Sharma wrote:
> +			reg = <0x0 0x0acaf000 0x0 0x5200>,
> +			      <0x0 0x0acb6000 0x0 0x5200>,
> +			      <0x0 0x0acbd000 0x0 0x5200>,
> +			      <0x0 0x0acc4000 0x0 0x5000>,
> +			      <0x0 0x0accb000 0x0 0x5000>,
> +			      <0x0 0x0ace0000 0x0 0x2000>,
> +			      <0x0 0x0ace2000 0x0 0x2000>,
> +			      <0x0 0x0ace4000 0x0 0x2000>,
> +			      <0x0 0x0ace6000 0x0 0x2000>,
> +			      <0x0 0x0ace8000 0x0 0x2000>;
> +
> +			reg-names = "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4";

Per my comment in the last patch for this series.

In V2 we should see csid and csid_lite registers defined in the dts and 
yaml, with the offset enabling code being dropped as a result.

---
bod

