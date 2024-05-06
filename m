Return-Path: <linux-media+bounces-10934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86708BD79F
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090861C20ACE
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 22:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23AD158DCD;
	Mon,  6 May 2024 22:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAcqGzvI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF738DE9
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 22:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715034939; cv=none; b=gbTgTqowx261joVxxHi9alIS7ofQx4RlXrgM+VQsPsPWPouGDz9oDEetp/oEYARyaNtTF59535NZJLbKScuO/fu4kQaVT8wF2q1Za8/+N5FUm3hdWKChluhgVpLDFYal9lCmzzix8OFMihnKZWrBwYKFIsxtmN9YNS9gVcmiK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715034939; c=relaxed/simple;
	bh=GcXmkrj997eYvclW9glnQT5AfA2rYiSN+YqNKGTnRRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baefYT4QzQQwBSrFKJjMV3E3D/ca+q+HPimDqMrdm9JD1u+/M0p7JHSlP9fwqzpFTvap/1SaEQdEp0Vbi7hMgEkkdQjXUxds+/pL6H4vkU0by5UsAB0vjaH40rFalhs27cGt8K5s48yDa+UM70kgij3bYYlJkqOW2jJBqO9o50Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAcqGzvI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41b79451128so16642525e9.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 15:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715034936; x=1715639736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GcXmkrj997eYvclW9glnQT5AfA2rYiSN+YqNKGTnRRk=;
        b=OAcqGzvInkx9RkgXyAS+f+n7pk+m4QXHWrM+10SzeiVjdUFLAEaUMvNJk85PKFES8a
         azTE0In4k4JnInGvHRxCdn1sEguJ6lPv/Bt5CsMCOw8MBdir/uEdvl/3tMY38eqfI4ET
         3NmaSgoEGP2tZoWLtqMySUkmlwioUaAEsiJl0M2PsKuBgwyyG0fniE/X4kCyf5REpoHS
         h8GpDELoPYuM4ABIGbq7sCeS3rcsRNRp1NDk67Mbi0u08IfFKx3t+XoFrezGuP0WjZ/W
         /ZYYObUAqxiNd8yykQEnosQedBrkUoOelHWXHuDq3iIEGvzI5nkDmFETnN76UY8yT4gd
         h9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715034936; x=1715639736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcXmkrj997eYvclW9glnQT5AfA2rYiSN+YqNKGTnRRk=;
        b=C7PNZiP+MZlZFX6nkrcY0XzSlYRi1ZFHXoNueXoiBAEwUa8D2e1/3o6ZzpcqjBstIV
         RTVRt3ZVC5Pge57fZ7asvXhaZqtcDkCRvGq9o8EnDQtdoWbRAd6UZfyaNDkpQpZjENPA
         N9AZ8ha5sTGPJgBGPKjAuQ08TV0n1dk0epcmlKliWCvy8e3TBp83/2BvcDV6oB79qCzU
         rTYoQvTLWfUznKXuezu7tpJ+5i3AGp37DetMVR0aMPOPuO3yOrVAEia4HMlgVKFpGuJq
         D1URMSWvcaZRoo3i6XVr1ReNGWXj/yq6xQSc1uCds8LFgNwgxHvNWJKJmVAoJHNGrnr8
         oiJw==
X-Forwarded-Encrypted: i=1; AJvYcCXm4okVp4XjPQvUCIOrZH7qq93I5+4l7KCIkM3iEbTzn+3Acw2tJwEK9mFtlrQ7lFX2jLeLUi6lX9fbn5xoGHOHvla1aleMVVQZRSI=
X-Gm-Message-State: AOJu0Yz9TTW5rflimmiBSJFkx/yQVtT31JQMA3mgNhCPBC61PqWNRroq
	AYUu8OphWrIevUtMK9JjWm1tUhjRrHOGBXxHzboN7SErOauWXGmusUs8KHmhV+0=
X-Google-Smtp-Source: AGHT+IE/a1ImSf9U4M4zZQE3dRok4NlO5aL66sezJ7SrYTYF9oCpKh90NfQdwnmtIv6ceyUnGbg9zA==
X-Received: by 2002:a05:600c:3512:b0:41a:c92:d323 with SMTP id h18-20020a05600c351200b0041a0c92d323mr8415179wmq.10.1715034936053;
        Mon, 06 May 2024 15:35:36 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b0041c097e20f9sm21055228wmp.25.2024.05.06.15.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 15:35:35 -0700 (PDT)
Message-ID: <6058be87-f168-44e5-84f6-df884486e138@linaro.org>
Date: Mon, 6 May 2024 23:35:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Fix imx42 exposure control
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Martina Krasteva <quic_mkrastev@quicinc.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v1-1-4b3a9426bde8@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v1-1-4b3a9426bde8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

bah - imx412 !

