Return-Path: <linux-media+bounces-13951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E54279128E4
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A39E3288BB5
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 15:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB5159168;
	Fri, 21 Jun 2024 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTMVMmOc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026436F307
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982331; cv=none; b=LOpJApRL5KqR1xPD3Ru4aBG3mWS2fXNw78WEQf/KGP33y5LUIYqIdBCOaKGv7lw/+UohaEpwj4Bk87HPFPr3NIdx3oysI7OK6bbrTwx9B9xrKfEckZRUL4WJ3WRrXd4o97k8pt+i4YQM7lRu07ybj23g9FMGTUJMii9sDWqNzUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982331; c=relaxed/simple;
	bh=bOj5UPR7uGvTDSm6/Hm6MKK5DkaF+lLU+lIDaS+NiC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzlcUazRdoAh7BpSxLZDGKZGJWQUDGjM1JvHCh3UFxUB7Q1aabpoM0fkdNuKMd345oj1nEfc1grbKODUPHBbdrDBRDPj+DB/TV5uJpmozI9ronYftXmIS3fXbqSRBOKHk9F+dKyIwi84KeLo5N79w4R3F826nhmyUWPsPNs75bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTMVMmOc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso23759985e9.2
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982328; x=1719587128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1TYwLT66lKYhmjjBA7z8foIE3VtS5NpDYz2xtS89X0=;
        b=OTMVMmOcyuEeocbc8harq73664lDEbi+41F6KUd764rJRc7rB3JHIpfXI+aMRmytT+
         OgfZD8TqS6d0LJ5t8wi0ZcOEYA3dBaSmOwuRRMxqy7J+lwNJQ1TylLDBN/r0Ldg1s2nU
         WYYYQ6JgGSgSPL4OIYMobHwAuDKJJAHI3iT7mJPpLsKbScsgL3289ZnJZCLH8hAtQDYI
         1svmqvoB7+OkDzOwrDN1mgCWKXrTyOapbSBw47Xj8iZpuiCevJt8W/q8/X9Id/j6TYZY
         L/iRsIPjvO6nCBavc3CCALok4GI2q9MTUh/T64o4AnAfwOk0cJYCTcdP0xLQua3ruD72
         SsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982328; x=1719587128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1TYwLT66lKYhmjjBA7z8foIE3VtS5NpDYz2xtS89X0=;
        b=Rhr3FXw838wJCh/33Y7UevI2KfDlS0AZExqerkhQJll9TQ14MJa1Z0m6IyUwEUPxZ1
         3AjZWimI0BzK9IAaqv+7uMRjLP05ZShOjyS6qEPh60IMedoM73Ponqni5hY+f+zLUfVX
         f54zSgLdqs2V2lktNrypQAXrVpIZy3jyoimqY8udft4EGGt6H0QPwHufcs9pfwX/huU+
         vGlts3L/e/+ooOKo2cSm4AQmCAWEJaa68eLmOLx+xBHr6PRS527XKj4wP9qFyObjeiCs
         qh1Z6maMFUMYD4rEWQAOZdAdYZ/49oKOeOPXZ6boQ8LI1xQ0Ev+2KBu291+HGgL0y9sa
         lAUg==
X-Gm-Message-State: AOJu0YzdYirsOFm+nSS4x7zkN7T9qeEDmXVif8yHWx4PHglO9TxkhvRe
	QZEhVoYQmOu+fTAyipl6a0ITBytsB1NI3yx5ds6q02VyXiJk8Uvgw/SnwJLbg20=
X-Google-Smtp-Source: AGHT+IHfKTUiCaM7HKKv7iAXRlbY3zu76w3GE8NRButuhgfAq0oxqmhJDKjpLPzj9LYuhqapyu5QRg==
X-Received: by 2002:a05:600c:4853:b0:421:7bb1:eb9b with SMTP id 5b1f17b1804b1-42475296a7amr78559795e9.28.1718982328689;
        Fri, 21 Jun 2024 08:05:28 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910fc9sm30774605e9.33.2024.06.21.08.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:05:28 -0700 (PDT)
Message-ID: <0b1223fd-220d-44e9-b010-bb535d481dd0@linaro.org>
Date: Fri, 21 Jun 2024 16:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] media: qcom: camss: Move format related functions
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-6-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-6-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Move out the format related helper functions from vfe and video in a
> separate file. The goal here is to create a format API.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


