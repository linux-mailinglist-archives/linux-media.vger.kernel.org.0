Return-Path: <linux-media+bounces-26011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5713A310A7
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04EAF188C8ED
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 16:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B33253F2B;
	Tue, 11 Feb 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLmxfzZN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28286253B47
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289880; cv=none; b=VD2IvKqsIUOY4an0U5yQ154mvljRBsNRg0BESTOs81ZoD3uft9qJ90JxoKYQystOcTzGezc8iN+7NJrfJyUr0mli9aShdmUa3jII8IZEi0RXkyM00Wu7aQHjkBMuv38K0IoqGOW/lA3/I4GDrKjrdBfmSj42YyRishiLn6zD5xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289880; c=relaxed/simple;
	bh=JH7ijZNDjNdhRFML1H7hwn6Ylh+jwwnUVby5SKkbOZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUKW1EGwUZJ5zb+hmNr2yFQq3LTx39jVlc3bh6JaSv+RicbX2oFa0xfSdbaSKh5SHgnDMejKTeH8JR6RGMlUcI7bz66JB6pBEYJ7P4i1ht528YM93L+taLqwGPSE+quMhw3UcVvGE7mx7uTMFjiUVs0X053TSVVaWTK9T/glu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dLmxfzZN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43937cf2131so21047655e9.2
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 08:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739289875; x=1739894675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPRSZh3i6FtRdc7ODsguuXOWwzfovZBUq+Z1/sPEyX0=;
        b=dLmxfzZNmUXQZ9Bx69tBjdTbdvcDNY21PN8K1dLjLEWGu9Jv4YMQMCxDU8q9r7U3RX
         MY9viEfz/+hJAvaDBpQzcYJqP3X4c7CgMm3svXyv+cJPtfwW+zZvtZ8JCISlz+Y73nr3
         REI4kkeTc+iXgq9sREILI5BPq0E+0TgUW7uYBeER+zY2A2OoURsIKBBuD/MKBx/MuVy8
         h2/eqaVJk+xNBFEgqcLtWCJb7QRiThBuCylk4pDGNTIiufOO/HeXPHcpgs+VzsXRRTVV
         dufIOtnxwOMJ3O1tI+X/wG0VuW42L+Y6VjaxvZpwdkEUioBqSSd+r4NBFCOAHDEQYIV3
         96CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289875; x=1739894675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPRSZh3i6FtRdc7ODsguuXOWwzfovZBUq+Z1/sPEyX0=;
        b=m8pL8zJv4HX1Mj7ICu91JFgJmGgtS5QSE2UPtLXzCK0fy8PjHm0QPYU+CA1ak0DGtF
         XWP/3/ZCMJeIrQmf8QPG7z4ogJQRFKrtuEn7qP9vET6cHAR/+xqvz0OUoTsbhgfU158G
         MMpaCNCipg963b+XsxRVro+OLua2gIrwPOh3K47GAFAkB5GGflHk49eamFYca4uTfWvl
         00mOgnJONjNmB/Wm9i7uozTagD9BZsLGhV3ZMqZ0gJmFShgfLhkmxU8f7bAfmMcWapTv
         s8jVzEX4hjkv/064t4s3zvtzWHZhpj557B3CxLmDswdsXISiyt3dYyRq4H3yveqdmPSR
         aPkw==
X-Forwarded-Encrypted: i=1; AJvYcCV2rtC+IEdjIE8R6or3sh+IUJBilB6q6sp4k2TrblDSzkEJJzVuwjEm6Yu84P52vtZgJAZKZj2phLC7uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4av4lOmrDnz4HbhRvtPF1d+AI5/lg4PFxZYl2jO1U86okqH1
	S+8mmjl8XZn8qImWjEwNNrZ5yNjhm/uB2DZedvwPOmS+J14/h58nQrPcxO/08RM=
X-Gm-Gg: ASbGncv3C/8jNhEw2XoWkP8NiiaFqJL5kOS2QUKzot/jW8oMdonFqt5hQ5Eix8SXjZP
	n/z3RuQj0lUXCd1svMb1hi5b2MKmXzSIl2XljZYE4s+D01vQDOP2AKQnSPi54fq48FOwTKG04Du
	PLWjmhR/EcgROboyOSS8z2p/tN9Km6rQYCnVRu6QNjq1F7Vw2GwaQ8kzHVvB+mcDVGao49Pe7Th
	s+hu54SRK3mUZtsWWetXmKdL3SyCR2X8XISZCixrx1x0Xa9Jtjy7kFeo8caRgMOkUn7BWE9nIBT
	iAx+vCeW24ST5U1XMrseJUcXcCgfuddmAeLhalbnGHAKzTNgm1pfcYxysg==
X-Google-Smtp-Source: AGHT+IGZ6rqRtEwePiKwnX4xQSPq4bLPiyPcMlt146MZTNkCKpzb/PK7/r6TdTiPg3VS3vFEj4i9OQ==
X-Received: by 2002:a5d:6daf:0:b0:38d:e149:f863 with SMTP id ffacd0b85a97d-38de419408cmr3758370f8f.24.1739289875146;
        Tue, 11 Feb 2025 08:04:35 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6080926sm9084581f8f.83.2025.02.11.08.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:04:34 -0800 (PST)
Message-ID: <a02289bc-fac3-4ea3-b5e1-8557c2b95550@linaro.org>
Date: Tue, 11 Feb 2025 16:04:32 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add SDM670 camera subsystem
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250205035013.206890-5-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250205035013.206890-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2025 03:50, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> Changes since v9 (20241218231729.270137-7-mailingradian@gmail.com):
> - add Reviewed-by from Bryan (2/3)
> - drop applied camcc patches (previously 1/5, 5/5)
> - rebase on media.git branch next and sdm670 dts patches
There's a minor merge splat which I fixed on this tree.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-media-qcom-camss/master?ref_type=heads

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

