Return-Path: <linux-media+bounces-8313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE494894756
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47D1EB219CA
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 22:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFA756473;
	Mon,  1 Apr 2024 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOeUK2SB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E848F6F
	for <linux-media@vger.kernel.org>; Mon,  1 Apr 2024 22:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712010632; cv=none; b=Sy772tr2TrnujFsZZRxeuOxPeIDMB9yKOFlIKKsucs8nJ/AK/GcGUDNM4ukuusQywhF4KHal/s46kWwgbpG+/x9LkNESBPb2551fYc9iEPhUJNcsa+KG0om3DC2brQ5YAGoJeEWSTjo8dA1a/6OFp+5pkKe8sZx+FT+VhzIbgas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712010632; c=relaxed/simple;
	bh=AGtcxhiBL3iMSUu5OngGq6sVbaFB/izhrzI/JTU7NgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRqLSqPVaIRD2Qq1Z/QbC0svgF3vFTbFv4DS+maBCpRcReZeLqTuueU4nLTeCqBam/CeJl8MQwapL+Xoqk+0HTS0NCgYcGBbg9GO8dglbFFQLGyVieTwiqY+yJoDVzu1pdJ1dQETSzC4/uSzDVGM4TC87WabYEny4ai82Ei/KJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOeUK2SB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-341730bfc46so3237465f8f.3
        for <linux-media@vger.kernel.org>; Mon, 01 Apr 2024 15:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712010629; x=1712615429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZEEEP3WLdyzsBOF4rzSyiDMnZY/6RPAhCk5qQkVLQU=;
        b=dOeUK2SBb2QttdB5GeFffoNbmvrSpEhPNcmIy9b+LzuHPUVIcC1VSt0T8wTNobsZtr
         ANzkTfLBaW9PSqSzNHXTLsYr6MspliE6GPYdPx71yea19il96Ak5GQdcNRu6esB2tvIW
         gC7G1NR4ptXkQlXgptPN76vxkxM360TQlqlwVtpN35HSxDrw9qdOxwFAq9Hy2K0ngTEV
         BLxBOCwF8m7U69RnWjH4F3AYYR+vVu7K6aUcYY41kPlRlfgss2jJgdZa2ZJd53Kc4kw0
         Hp+3ZII+o0FtFZGe277T3T/FIYyAzF7lQKMq0I7R2euSja1ROipryCjj4CW4iDrloDqN
         N2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712010629; x=1712615429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZEEEP3WLdyzsBOF4rzSyiDMnZY/6RPAhCk5qQkVLQU=;
        b=xHSUSquFN1iqy9t5hhP3oQCLm13AHh6Sz7SICaQlVKYkKmSW4l2RMu/JIRwjypOtDf
         YnE7JYQr9wmeGvvb8THi4V13PEQ4urK2fpZBLdfayQ2U+WbxOtTf/K2FFPORKuUHdg6D
         MWMnQc16MuYkhJq+avbjIobOaH9QZvXPIXyVYlBSSJlmKk+wwUslSHCEeWK9r8rUyeik
         xSDkq6K3WXJqPiuQuhYkS222LnYFovsw737i+gtFpsLVd5M/w0OOp1cpjD6en3RNFYsG
         /MlE/JyR7+b8Z2MTEg6U2nmEcQRocp/vKruJhTPnXhIT1+fgx0DTV4xpsVXm+eyobDi2
         oZnA==
X-Gm-Message-State: AOJu0Yyw4rhLy3et/Osl36YdxoSuKrVFm3ySPElE4XvP4h6ykjIGvpzv
	MpwHs7RDOHYcBJJsNtgHfZOFCTGld0KkzD4uAFIere8bwU2bfs1AMpKtJVifEDU=
X-Google-Smtp-Source: AGHT+IG+ZdFIcfD/b3TocEugIXWKQcUK9JvEnxxkCO8yj9ks7X3SQRNT1uHEIFteQ1t4L3d82zw8yQ==
X-Received: by 2002:a5d:6505:0:b0:33e:7a1f:5824 with SMTP id x5-20020a5d6505000000b0033e7a1f5824mr7279820wru.0.1712010629385;
        Mon, 01 Apr 2024 15:30:29 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b00414688af147sm19132258wms.20.2024.04.01.15.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 15:30:28 -0700 (PDT)
Message-ID: <a54e7d95-79d3-40fa-8975-f0e107aeeb36@linaro.org>
Date: Mon, 1 Apr 2024 23:30:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: qcom: camss: Add per sub-device type
 resources
Content-Language: en-US
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240319173935.481-1-quic_grosikop@quicinc.com>
 <20240319173935.481-2-quic_grosikop@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240319173935.481-2-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/03/2024 17:39, Gjorgji Rosikopulos wrote:
> +		.csid = {
> +			.hw_ops = &csid_ops_gen2
> +		}

Thanks for rebasing

rb3, rb5 and db410c all went well with my testing but x13s showed a few 
missing resource entries - which I fixed and then it worked fine on x13s 
too.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/sc8280xp-6.9-rc1-camss-resource-change-verification?ref_type=heads

Could you guys make a pass through these resource structs again - 
especially for sc8280xp, sdm660 and 8996 and make sure there's nothing 
else missing.

---
bod

