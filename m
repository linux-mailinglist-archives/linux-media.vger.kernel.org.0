Return-Path: <linux-media+bounces-19510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D120C99B917
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 12:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C61B1C20ADD
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 10:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B92E13C67C;
	Sun, 13 Oct 2024 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/3WvY/U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A59139D0B
	for <linux-media@vger.kernel.org>; Sun, 13 Oct 2024 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728816270; cv=none; b=W2xg0XVxSphOg+Q8NhNDLk+4aov8re2+OpU42Y3Ijv4b7HA+ICmDSnfROT/mAQjHAXWSZRZEVOifuedlnV2nAJ320UdNB6IFRrD2HDfof1uqQjU4U5L6/ryjJUfSHGMFJXABt3MJ2z2LUs7/94QdO1tTFixgrc/L0nb8/0bTtLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728816270; c=relaxed/simple;
	bh=X/WzFSNG9UXVDe5ObTkY2Z9LAkPpAaQBZa/87PdOLYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ki9F+ETEI9s/MiKIsDaCcUmLIoTPmKE11KQhDwLaSC/CxT/McbHAWJ09thQarEbLbD9IItAHv0iHEXuRm6QJ8FCVvL6Yqnq1MOV0pi1lnDMp4sm67uc2mJAADJ3eEX+OLcjyZlZe8/1OSlrx+eXdj1IJdqkl3QgpC3esHSZWsBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/3WvY/U; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c942815197so2145314a12.1
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2024 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728816268; x=1729421068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts1R90nEHJoQVeK5SWtRBNEDE+lrpIhze62//d5StiQ=;
        b=m/3WvY/U3e1yH8+HXzdih45aEZclBSn2ZxMJwaWEwR7kqo3cTPTt4S93bpaBZNyiov
         rdAgqySW/7s+a4E81NDlWyqz3KZgLbyCo4Eq8ArE7z1z7Fo0Q8GiWXYdVEwKGNC0j1/Q
         /+Zh3JiFUbPx5SYunAO5NPYxX3I5F/5Mc1Z2aoZhe2yjZpsLIxVcvwe+tNlJBH4VYjEr
         QNAq2mJByL1zqtConkbqyp/zebQdlLwdpb0UCRO4GYv/MM7FrC4xasY6aJe1OyRwHJ/S
         L9W9tIcxqWZSUqNcd4flaYltP0Ym7k1C/nZarSBNB4HvWGUTZYvzbyctlZRTt2ZBrpda
         9AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728816268; x=1729421068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts1R90nEHJoQVeK5SWtRBNEDE+lrpIhze62//d5StiQ=;
        b=ewBDYQXBceObcPHIqj2kDdq0OilUfqcMTFxD94R+/Gcanwk7AI5nwqXW6Fr3KcpN8L
         cJ/3c1Lu2Cj5hGSxjhpuImjoCtsztWS+h0t3fF86YO2uNj/ztQFBCDjrDaOR8mmpLIXd
         Upv3IMlV9Kt0VexqXC2uS51e9mB6FpKZcanQrYilDm7Su0QxH8bKoPfLh337aTmZhb87
         ElqI/nJirwDYKxx5fSEL58mIqsaIDltBZrp09NksE9eRmOeRg0JPIu+yyJUMQRfeZ9ra
         8g98Q80ViAx0Ao8+1+ZGmuV2qPV3Y8PINjvPrpIPMZ8J5hU6qhELK4vqz2hoxiWt37KP
         7dAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4/GtFaISmQIhXsXMNzPNyzpQRoIkrDc7euYohSrRrd0SVrRfVBV+cb2bmyC032DXluedqoZdV+ZyreQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPTy5DVL8jju/IzZpZCPUJswNIDP76iYVPmSE9tzA2MoaFQW/
	lI4ilWJTachTE/fHBldzznbfF6YgRewpQR/XX21oMeVlXTN90wcvFrXQHF/UqHw=
X-Google-Smtp-Source: AGHT+IFiRsrwKX/5PtJcK4cGmlJ2UJ7yOCgzC+qEpTHb5ZJ+6wBKnUiuR8gg5WwUrpxesrYe7fLvbQ==
X-Received: by 2002:a05:6402:c41:b0:5c5:b7fd:170a with SMTP id 4fb4d7f45d1cf-5c95ac50794mr8118037a12.28.1728816267533;
        Sun, 13 Oct 2024 03:44:27 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f8dbd6d0sm122556866b.200.2024.10.13.03.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 03:44:27 -0700 (PDT)
Message-ID: <aa140a74-b473-408c-8529-e12f0e285759@linaro.org>
Date: Sun, 13 Oct 2024 11:44:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <20241012180935.GC5212@pendragon.ideasonboard.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241012180935.GC5212@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2024 19:09, Laurent Pinchart wrote:
>> +          clock-lanes: true
> This shouldn't be needed, as the sensor doesn't support clock lane
> remapping. Could we drop the clock-lanes property from upstream device
> tree sources instead ?

Yes probably.

---
bod

