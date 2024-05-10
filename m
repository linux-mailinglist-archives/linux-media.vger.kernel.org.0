Return-Path: <linux-media+bounces-11345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5C98C29D3
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 20:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 591482841FA
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 18:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E15828DCB;
	Fri, 10 May 2024 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fPtFgsqh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0607925779
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365642; cv=none; b=Q55Ju/eZB1IG8K9oZZmEB0xdV/ca/W/wjjEhwsnV4V+K0qe2TWgU7W/awJLj7iWqA9RGO5okkLpG8ffTgVYl+G9YFFiQrsE1hvedPxVu1ee8fOvDIIJPUQEs5g9U6pQ3SAqZU1VepVsNwaNUHCn8e0DCGav8LlaexGhryBBuJdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365642; c=relaxed/simple;
	bh=SjX/kCfSrJi2GY2ka8pKL65+RnH5+NTpFGW2SRgh7jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nz9cby088MQSa31Ea0uyFTlmOUmWhdEcjNg/stnYZQZpHL7IIReZX7Z38Bnb5VKSHWk03bGq116oi1HF0vMKEdUJXLBK0r/ihNI0GtrsoiSDUMonC9dJrCcnHfFwq1Ax1kiCKab7m86A+r07xVodutBp8DAbUxZmaTaYB8c1e4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fPtFgsqh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34d9c9f2cf0so1895719f8f.3
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 11:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365639; x=1715970439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBvdzVQWJU8MypKGBKD1JTF1bR2eY0ug4Y9S+vmlZ9s=;
        b=fPtFgsqhuXB4ZOxfuYGN3ld2R+L1HwXave8/w4i8d3f6AZFxU1R+razLqqnZG4j/fu
         IozTPVIl1LYmMn0qK39saGRaRVURBCVB53zgWLgLUw5KWoI5xky8QdLcJmMYUUtfr0/p
         qQmpsGUIogtYQM5kWcJp9fuR5S0P+N1T5NBm/LdeFNMl7soTG3YJISSnJDU7WIh20Wb/
         qY8VNI4a9+wqkBXd6qRRDbossrDZ4CXAwNcsDPPlCvXFLRdTc+pcf64ay4Ty0IjLZqrC
         e1RPbTNOT037+VbSowRmBfBd6/G/9/G/QpCGT7sRMAol+4ciYZIjR/gY+WPmAJ52JHMj
         WAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365639; x=1715970439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBvdzVQWJU8MypKGBKD1JTF1bR2eY0ug4Y9S+vmlZ9s=;
        b=h5QfYxRFR/Ign4pC1JF10aZ385isiEkWrOh80Hxtp9yMbE5/zMf2G2+GcrpegUrUTs
         Ccr1dbcd7QW781PAS4kuAvn4ern598Okck3ko5wN3BanVOWmumFQ2MW1gELh1zqkS5zm
         whSg/fM/peVmf82Vhjrrl1XFQ95yqDjmACHyBt2cwCwXJL8e+Kx8K2AAc3fG9qtZ0H8G
         JXTTjTpRtBlWGllf73jmfskfHH/lkkJ561rbhLaq8rVN83KnqjxrD7meX3eaEt3D+VIR
         mfggyBxZ1yxlt1d+OZdRH12156/qNd3VHnAaIEIZNGRpVEfh6/bDgatFz9YoaHjV+sIg
         fCoA==
X-Gm-Message-State: AOJu0YzyVSRMVclgLKGNn8NiWIPKQH/UHpXuJmQxPe1ibm87Uu91byVh
	1ikgh0hOf/8NN0NNTtThjJ0DTp8iSLTVnUxDLOAKcK7TAXzXnyR8rM+Vd5P3km8=
X-Google-Smtp-Source: AGHT+IGm3ZJPZIaVeyhqvPKG3KsEL8oP5CEmzp6dKKS61dLQ3zEWx23D8sgmpT/NRgTHUEHS0ibzUQ==
X-Received: by 2002:a5d:5490:0:b0:34a:4227:e9e8 with SMTP id ffacd0b85a97d-3504a9694f2mr3126219f8f.47.1715365638824;
        Fri, 10 May 2024 11:27:18 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a791esm5198463f8f.64.2024.05.10.11.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:27:18 -0700 (PDT)
Message-ID: <320ba508-56aa-4ef2-9fab-3752f4181da1@linaro.org>
Date: Fri, 10 May 2024 19:27:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: qcom: camss: Attach formats to VFE
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-3-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-3-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Video node formats have direct dependency by the sub-device pad formats.
> Remove dependency for SoC version and move format definitions in device
> which creates video node.
> 
> This commit attaches a struct to the VFE resources that holds format
> description, so it is much easier to assign them to the video node.
> No need to use a switch-case.
> 
> NOTE: The mbus_bpp is used to calculate the clock rates and is different
> from bpp which is the bits per pixel written to memory. We need to keep
> both values to not break the calcualtions.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


