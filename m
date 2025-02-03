Return-Path: <linux-media+bounces-25575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4679A258D3
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FA12164CB8
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641252066FB;
	Mon,  3 Feb 2025 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UY++Gbq5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885152063F5
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583773; cv=none; b=JDGFhbUyfLeK/PAbjC2sk78mn+nKRbu9YP09ag+KF+/o1vbZgCclkdJGYIevCQnzmaBu2VUQvHTorFl0JWy07cqqir6d/Znh6H+vELLtphMXXQ1vdcUW9/TKBlf0+qudMn+o5Ke04aGv99VvpBlNM2DWYv/GhROshjagXtZ0j+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583773; c=relaxed/simple;
	bh=5VO8qxHdPv1GlCfSqdK9sL6Lqc78mt2FtDInjR+r4xE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=STzXzAenSMqWqXFDKuP5idcz+MOiZuBQbfNNuTl2gpL4LN1sJZDCi0bjLFKkAZYnlFvFNpoKeruaIQThdNcM2V3KvLUTYAdzkHlnY7wKRjLUATne/SWulc1yNz5a52TQiavq79DxdhxkkJmSkTk0Ig/toGNBcJCnUjKTRTY4wFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UY++Gbq5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4363299010dso5645295e9.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583770; x=1739188570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf+nXVuq0n7+9Hzbsc1pHZN283D6/tls331wlf2T5UA=;
        b=UY++Gbq5oALjic2kiOL6Y6hx3NYz7TLaTEuDiFgSUfyOd/d5KoeixoJEi0gmy8Bpbd
         RAc4vqJkhwL+BIrCT1teZYSX0kEof3cFT61U1ZL9GDqTE3x8qfK5+g33EddyXkzCmIgI
         QakZntsvRsbN8TyFRl2O43OKnHuPTskB/5702h5bZzjupoHlZmIKHY0YBljxaGrWmyzi
         povy+oQIk3MeQthGJj91UNlkbLdn8blPqaJL8EPoJPCgqA6SpNkV1k6WZQF8oiuKqxIk
         DHDge6l9jKS6mn+ZFPQgW2O5oQl2tzP5BGeAHVj138Sv3onnk/MA9UL7qVu5ghlT73K8
         KM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583770; x=1739188570;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hf+nXVuq0n7+9Hzbsc1pHZN283D6/tls331wlf2T5UA=;
        b=Mt9VSnc2UAkBf+r05Lx3j95AMzsfXy1u3Zf4vR1FrdlODkV03//4DJs2i0cxKV7fGx
         v4SUd6+PyCxDsSydicWms7voAA+i6ZQ4D4cc2z7X9fYZOwYD55vI5RDVe+R4R0IDH/6d
         WvD9BRrEiij6KIW2IvYc8pEPMh+xe9K/IIo0iBSxfFsVmWSVOQKfJnKbqdne+XoHUnd8
         C8iYrjlsR3XvBoENQAKMEYuJNiPlSPfwhu3X6CZlPQ6Uuwh86tv02qD7wNRpuPh+G3HO
         tt3wDb8AtIsSPqyQ1jDiYEc30CoVnVGn933tgvrSg62L5vLOUGHRtLi/E9cylcGE0vpB
         gjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPP4mjii7aWodJYyOYxkdSWYpOonkvAZZmSTbTOkaJpgLpmJU1t5LS/A9X5w2rWPPx1VDMLJUGmsCPkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2e2R8wMMaJVnD9SzHZEJkdFUR3DL0mDsw5Sy/O+jQmoe88C6T
	hgh+bAESH7tj5TnGAo20hJWPGB+s3+68ArWpKQy5NlSAUNmckQwibSn4Wu6gjjM=
X-Gm-Gg: ASbGnctXZ3Cbo2caUwmv4k29HmDLoSRuNx045IQWmfw7q/7MvE4Da4TdIzza0uPc27G
	sA0YSa+h75BadPbT6iBNWpsD92AdioAA4nNfuFqBkK427fedNLiR75iShuIfaED5JgeyZn5W0Xo
	QrbWKPgLzd+eDKZeVSU182f9HaOR3nUxguCuqYAhF/m4ePfabv059EnPTqdMk7FvM6JjFOJMN0m
	SYhyMd6TB7GOhIdFBaDFq7oigpLd4aJK/yMjeWGpN87AOVCX3fmJ+wWX1/mo90psQ9FogotTUV9
	S1vNR6ZbUjWvEXM016h6W6Jk79z/T1M=
X-Google-Smtp-Source: AGHT+IFQbSU80i6YQYi6YzPYyBsllYWbDkIcbgELZu/FC2dJYOz3ZShx5Senfvr4yJ63Nm+XoGt8PA==
X-Received: by 2002:a05:600c:1994:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-438dc331eb2mr74266625e9.0.1738583769775;
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7558ba2sm166790545e9.0.2025.02.03.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, netdev@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Huisong Li <lihuisong@huawei.com>
Cc: oss-drivers@corigine.com, matt@ranostay.sg, mchehab@kernel.org, 
 irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 louis.peens@corigine.com, hkallweit1@gmail.com, linux@armlinux.org.uk, 
 kabel@kernel.org, alexandre.belloni@bootlin.com, krzk@kernel.org, 
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
In-Reply-To: <20250124022635.16647-9-lihuisong@huawei.com>
References: <20250124022635.16647-1-lihuisong@huawei.com>
 <20250124022635.16647-9-lihuisong@huawei.com>
Subject: Re: (subset) [PATCH v1 8/9] w1: w1_therm: w1: Use
 HWMON_CHANNEL_INFO macro to simplify code
Message-Id: <173858376808.132674.4568544450122043067.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:56:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 24 Jan 2025 10:26:34 +0800, Huisong Li wrote:
> Use HWMON_CHANNEL_INFO macro to simplify code.
> 
> 

Applied, thanks!

[8/9] w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
      https://git.kernel.org/krzk/linux-w1/c/33c145297840dddf0dc23d5822159c26aba920d3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


