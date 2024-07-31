Return-Path: <linux-media+bounces-15665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B7943950
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 01:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC9ADB21F23
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 23:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3798916CD0E;
	Wed, 31 Jul 2024 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pt5m1/4p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5FD16C695
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467780; cv=none; b=n/QY1ytqMZXjvCYPP8+iPeZaFckeYHFlx14yuS9+36OG1kcKdUDkiYTofiwDT91DGjjhDLJAnKad6X2p86jde7HnI6Ntsb08cGjiBMAxATlj/ixzUyeLj4jpAKGsgJn+Yx2SPSuiGMan0S2LcqAfJKTHPk4n/pWWVCWF5kLIDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467780; c=relaxed/simple;
	bh=tCZ+7U4gvlAIglfZR61b5pOiWsgsslmYDZ8AIeIP8JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pg5vlBoOCwO8QzQc7yVXPyyC4k8q0PPI5ajkzOZnxSn92vLXshyB9GTO2fGZHkbfa9MkkeawuL9xwmk0osTkK1w20bp+LbG25uXOuTehFd1G3672b5evdZTb3gD/rqjQmCnCmCuQBVmLbvoqFp3lQqtGOKcKQXHKI+Z4uPHT1AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pt5m1/4p; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef260c4467so12175091fa.0
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 16:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722467777; x=1723072577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JavNCLotRK4KQxq9lyYjaiEtUxB6+1luGLfLNHw6Wfg=;
        b=pt5m1/4pjp6DGaWkf22mW90B3kDJZdg7hw706XpCesTC8XawrwAEH39eTjs8XanoD1
         +83v4gxHhFbwwpI8/IRmKf6Gg/VWie1Ute40pjQd92qI4+GLwm77n4ea95ieaw6ocbG8
         OpJTWQEyjovECuxn7j1RwfHGecX55ndQnbWfzBw9qjXPHBvSfLR9XbDA0umL8eDkf8Xw
         3V3ASeCsIwEAHdS7LYaNT0VDUIsyTfdHR4w6Vl1JbVUMdUb/pR6+clbLbyW/0FNGuqO/
         T70bo9T7ZlM1jq0C4nxhEOqTVt4BJNE9enEovA/1yQbegN3HdDdjCQ652lgQPIFrzM86
         zAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722467777; x=1723072577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JavNCLotRK4KQxq9lyYjaiEtUxB6+1luGLfLNHw6Wfg=;
        b=HIkQ6VM2DAjnV1sM4d3o1QHZe+nfoTIsxOYD8ekWkE2c2ZZjfGpHYAnloxAHimon7c
         JT9KDlExgFavgSnUyPAbgg/FYALx1wn/NO7FNbKzvbRW2DM62RgIVSnVw3mYYWiX/Ffk
         v1adHNp7mKFtya+geZEwp9PpIwNd1B6HPpaILO34nTSOKrgEXo4Hr/vngWrJ63J8+cyA
         22xyzmPUkyY/DpFlbQiot+BGhd3C73+8cxEyQRTCpiqE6zMYH4r8RD+bK0/IiMF4NyAc
         qLiUOYGUIwe9AIQl3BGaqYhsA1Ezs+3ec61qxcT7ArsxlVxbtBs1p7kAiEAQx1lrl0jS
         8ApQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtoh+xJLnNVRldd2riabeZv+ZI3Fdx9v3U+PsnUJQGFsF+1AY/G7iM/oqNoXED7E+ZU0HDknu6lEicmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwInCbaDBf19jhtbMQRDUOBdwoHFBqa5ED1wxNSZ8O2duRBt1oZ
	qhNKRndv1O5RjuaTHbAui5HekK19IR0bNOKMTHcfVQoDhZgdXVIRSpQRC+J0KIE=
X-Google-Smtp-Source: AGHT+IEaVpI3qrTHxRrOBmgtzDaETYctHshvQkpYcpqnhSaAHYd2SYlV0Bd+Ukxx1gkWOWC9hVGEIw==
X-Received: by 2002:a2e:3a17:0:b0:2ef:307d:1f with SMTP id 38308e7fff4ca-2f1530e12c3mr2586031fa.1.1722467777056;
        Wed, 31 Jul 2024 16:16:17 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf55c77sm19782501fa.62.2024.07.31.16.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:16:16 -0700 (PDT)
Message-ID: <f56063e9-1db0-4d67-b08c-dcb8140d5b8e@linaro.org>
Date: Thu, 1 Aug 2024 02:16:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] media: qcom: camss: csiphy-3ph: Fix trivial
 indentation fault in defines
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-2-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240709160656.31146-2-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/24 19:06, Depeng Shao wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Replace space with tab in define indentations.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

