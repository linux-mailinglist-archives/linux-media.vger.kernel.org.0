Return-Path: <linux-media+bounces-30837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0E1A99481
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E001927F4E
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B152E202F8D;
	Wed, 23 Apr 2025 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NH7V23Pn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7F11714B4
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424549; cv=none; b=R8E8YWNqtg912bbhGfBQ8HknY7imJuijSGxUqWcmIoiKUlMJfnFagLcXhr5A6odbUKnfZmfxTTxDZx4tj05DL4nJ+aDF+pmpFp0F2yQzWn9b691N4/Xku9hRdZA1bzchiivmAFIJMHfgVnYd8Cf2IrQ+YXRgE9+X5bFkgw/fRr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424549; c=relaxed/simple;
	bh=6C2WruQbnruVUvUmNXf0D+YaVW6T/QQf/Sp/kmZLHXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBhyY6FD/mPm4jG349pm0bUQBSqRtULUQfMcFubVXhZ+YrwITQTr9fjrWF4P3quD0js30bTeSliMgDlsvjaZkESKTixIWmjLmDOdz87Ly3GqKEfNbfLV9x5fjZz6eBAv6NiD3soqOTYxNBjMfVsMFNv8vrTdppVgwp2SWZCxxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NH7V23Pn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso29740f8f.1
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745424545; x=1746029345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORF2CP6OomLWk1e3FvUJDGLD2Zyr1DBGn5dtUvbKU8k=;
        b=NH7V23PniSMOHIH0enPZd43lAHQWYV/F57q9+jtie9LLBIvz7ypkuH/etPZxLCIgIG
         XM6wYvExR7tCxKJ+rOk/RcAoLRJE0ZfBGVULsQYudSSqFr4DsLRCWGm53w0ClP2lpAPn
         6itrEnf9rjc1glviVLUiSy/Pwa7bGZXFj0mUcSh8/oqXDQInSAKZ9BZf9s4IWuUMeJY6
         OwOyNmGHRzcGXhkxXMikUcAsq7hzwaUVd1hfG9NQwARJp+1oPsrGuycYtCvETm+YXKjv
         MClsKxiYToPmYkJofYIFB1v5m54LnumJNfAPocE6PLtQFPCMCy1j8yBmeeUYHynu/F/J
         wpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424545; x=1746029345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORF2CP6OomLWk1e3FvUJDGLD2Zyr1DBGn5dtUvbKU8k=;
        b=GHELMbdpc47qz7NoQnZQbFCJ8SX0DIzjF0op7kOpfiHET57VncuexvITmNEJPNcDTC
         hYobbIHJmphWZ2tnINO37DAGc4a3FurwArNVCtpLAe8xt5PtNxesCTnLIuD2yYF17H9g
         xkblViCyfKjLJi/9bsRZUsvJ7GNJo3pqlZP+q85EDlyJBnbid21397dXsEMNZXA5wA5O
         SY7sxNmMGYZxOyhqcvJmkglyUMX11k99WCXCmi5u5ZDXvkLqke1pdFBdnSdQW4pSQ2l5
         seKjfgSskwXbNGeowaEGvjzZyLYurBeQLepdoJ2lpKpwo3pouSpqSxhxP/ltnWOdGfnP
         WvAg==
X-Forwarded-Encrypted: i=1; AJvYcCUm6mrwgNygEeidPRwAreaQ2m0pgxn+IZ09LNLDET25g9Lcj31OsAYREBQD7HTfudrFmOuooSCEjqzBww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy71yIh4fOd+XU5vA8cdmuBT4kJlVFaCnHenz+E3DPk96LkUL/S
	s4mHJzQBpblnAPZX/vP7vbbsCjgfpoEf41Rq4+lHdmYcUCGpzuHynXrAo9CWiOQ=
X-Gm-Gg: ASbGncs9QQrjGMk3GV7z2BXC7o+8yrkTq0V3jLkVTHAeGsUpozF1CtC/s0rfCGWfTPm
	91BujmQu3f5TLErHVPjQRrU7orK30eBMHNiovXEET9AqMzQ5uCkkhwrzfu6qgei08g7kG7FjHdK
	S/C53vfRCyUIuqd3AslO3KGdLoD3Gk+ajPawlbg68D0ey+biHeMOXCLLCsHeNmWzCwvb/TdyNeM
	c2iY9sW7uPGnSuwlE4ZxbfUwy+ydizq/xUfGEf77C8EJvQG1FveuYAUkTzmUHIzxgG5LXic2lb+
	lzswNFLwVepwkDZBivQfnxiMlt7/ZmQbiou3DHADQYIKfAW3lpShKLhRig/nIpFid61dmjYUFLS
	bnZjjbYY7o5t2K2xR
X-Google-Smtp-Source: AGHT+IFD1qn4MEpH3wlqbTJMbw5sAArPinlMyJX/VVOG6Uxi7wIwgbVxMU66H+xq9iPQlQCcNDplcw==
X-Received: by 2002:a05:6000:420d:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-3a0672927f4mr3220079f8f.24.1745424545592;
        Wed, 23 Apr 2025 09:09:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa421c79sm19064267f8f.1.2025.04.23.09.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 09:09:05 -0700 (PDT)
Message-ID: <55f49107-e7bd-45dd-af1c-5d9a5b2020a4@linaro.org>
Date: Wed, 23 Apr 2025 17:09:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] media: qcom: camss: Add support for TFE (Spectra
 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250423072044.234024-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 08:20, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

