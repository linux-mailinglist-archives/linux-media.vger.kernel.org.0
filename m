Return-Path: <linux-media+bounces-11349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A88C29DF
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 20:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D2162842E6
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 18:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2263BB2E;
	Fri, 10 May 2024 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kOASB9/O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE054436C
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365734; cv=none; b=MV6kWNLQk5DQxocIJUo/I40BR2G81NT4r9ivUhshtpIQ5ObSEaeDaJ/FzywNuXG6Q/QSPLlEEca3OZGLJ6O1hBrr9RLd8cn2uQlDPI4nqRmAB0S3L95psURqd4hIW2sGpKp2QXAsMyD3pYGbPFvC7JxXf5XQxHr0Lg3Wyq3JXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365734; c=relaxed/simple;
	bh=epoXW1waP+MwH99xf6rC682FICComy7UfCT9VhplzdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2HwjUhPBkbIE2dKzBhIM1ig8K9BjPctwpVheqC4cSGQW7LN/QYIcnM/bxJwPKbKMMjmigMCrNFbpouHaKDRQCYaMaOAJGcIYkI7yJsBxDVtNjjd+b49eBQsDCrwskP/lPJJDp7XojTjGKzpVfiBMyHnrQTOxDbpC90wwc53O5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kOASB9/O; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f60817e34so2778510e87.2
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 11:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365731; x=1715970531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFg4ayAexiWKOzOXFoyc3idLGyKV44tIY5d5O3liHs0=;
        b=kOASB9/OV8cpiKeoCrqdZop/lZXYUfjcOQfuCDvv04nwcjeltsiR6gdZFSCRp87LSc
         Wmi4ZXkKiu0/42CP1MAr64Tj/MbeY85pdse4Nrv0YaWJjYCR/J8H6NDICHeZlXXtXAN3
         accFAiD7vhU37gaHjUkCq4eyRzWtlnAUBxb8xAiVG45s2viMAXYscusFKSNo2ZR5TXOO
         jx6uErkIpy8iSb4DKOaKymoApFj6PmftfhDFaqDiERfre56fWoEhXmbQ3yAeykEL8oGl
         ccgG/Y2bnPOAWXjvD3NnUSDg/PAm1zuNAn232FJuf/8X9LeIVNDQ5K7WLbBxQ/KOD6J1
         7S5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365731; x=1715970531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFg4ayAexiWKOzOXFoyc3idLGyKV44tIY5d5O3liHs0=;
        b=bwtjllF3m8/w70xYvQgyG3iYK/ialNJXbz09VBov/7USMIjjk/RKrfsKAObmGFWzpw
         SuQHBmAYge38ilVwzEUuCwpQ9BH25+Gpz/xxApLdaKGU8FBepRkw+Zc56D3/UZVvDedp
         uesD4FdBWbjHigyxUDTeUcNnlKHLDxykzwup5JDVz/fdwA40/cX5mTrc/KQc7qSXfjY9
         mIaIjOVyPE+GMLxp2SuOf9GtzXPx72HOlyecHRCUpu7UXfEjDRdKAP6JQaWSFiuLZM3O
         qnKaWb017GZNozr1mSNl0kJA2hErGXH8u5me/2yaTNc4mrFI1rXG6wAlXFwraDVyCfx2
         h7Ig==
X-Gm-Message-State: AOJu0YwoofGZhRouS2DNn8RFwH9OF8raF4xgWHyN3pWgFmFO8KD1mFk5
	9fR/S1dqSNz15AmEOLheLHcCbkCN2kFupJdLynZstkXaB5iyZTMPPQHW9rVrKmo=
X-Google-Smtp-Source: AGHT+IFTTIXd6P+2xpMOVHOVAj9yA/GxgU12mKxNlNuyXL9J+PwnVML97iLnokLxyBdelRuQZ25D3Q==
X-Received: by 2002:a19:6b0b:0:b0:51d:97e8:d2ea with SMTP id 2adb3069b0e04-5220fb77411mr2139996e87.30.1715365730768;
        Fri, 10 May 2024 11:28:50 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad02csm5148688f8f.67.2024.05.10.11.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:28:50 -0700 (PDT)
Message-ID: <be76c36a-2233-4fcb-87be-d6a5fe5b0c93@linaro.org>
Date: Fri, 10 May 2024 19:28:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] media: qcom: camss: Split testgen, RDI and RX for
 CSID 170
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-7-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-7-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> Split the RAW interface (RDI), the CSID receiver (RX)
> and test pattern generator (testgen), configurations
> for CSID on Titan 170
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


