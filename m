Return-Path: <linux-media+bounces-37757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0355B0556B
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE7643A459F
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C942D29CD;
	Tue, 15 Jul 2025 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rSrW7lcY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE011917F0
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569568; cv=none; b=IO0l69VstLmApmiwbbhEt5BHebFS1Ho8dzZ27fy2CvBTI+afJH6zplNjD/k4+cXAyenj4gvMx6qp3kRp8ne7LBannpjDUJ7u4n4j9s9jheI03odj/pAO8SrNTc/gOvX9PvEyucKgr/ORjEQd1zcwl407s8lpXJCwOKvLjovwUw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569568; c=relaxed/simple;
	bh=tCPF0RbYVIG8Wen+lc8XBwf0grPpjFwaKYR+SRTM4GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ie9jnxqdr9u6a99sdERIaN76NDt3KAz3Sl9Vd76MSoLrefGGaBaGB9onz/WE2UO3/G1f87oefqCdAv+5b9rRhR4WYggbx9cE9fBqCnMQigr/8uNrUpeFK5APi4YB+Gb/URCObiV61pi9q75VBLyIiHC0Vxb89kwKu86BseeguSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rSrW7lcY; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so3398680f8f.0
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752569565; x=1753174365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rnVY1GAF/N5LWVPltTjR6zDyfcKdsovhZ7bcU1CtiQ=;
        b=rSrW7lcYuXCjUuprr75Sd+gnAQyaIXARnFrg6tL9BiMdZnhhmEcAKdS/MPk8Be/bCI
         uMBkbke0zKry9BHJVh3r1vevhKvkyZhQtEkEM/TGU1PUZwab4q08FfvCxrD9PfK2RIZ6
         vB05Fs7ox3nw+4PaLP3HJOwz4B/6kmnYFwY+gGEPrf1kJor83xIMwSdrTOptnD8ORRyG
         vxLno5T/K8hrCsXHICVKxgahF6ffvUlgIu5y4aK8oWK8TfPXSH5gXsPx7re7uvMpBGfq
         1tv8995yoyoOMHgiZsrnI5+ZuxSAKZZZ5ovd8owOITIcqKjieMGnLCPp/o9hXyRJDdbw
         iLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752569565; x=1753174365;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rnVY1GAF/N5LWVPltTjR6zDyfcKdsovhZ7bcU1CtiQ=;
        b=la6Px0JqPpumj4PWXsTIKWm9ZwWqYyd82wuipAuL2qbNoAUh6Iaw1zJNCIiH6AKiPC
         igGK4bNNc7ENkAs82YH/1IDmxuT+f6WC4oRctOL/oSol1zkDnngrj0AdcwzW37haOq9e
         nydxc8dQqSBahCXaU3PU1AJ9wx9lfFTk4rj20GjQMKcvzqSsBUP6/TsmBq0FbE55wnz4
         EdrFDfCg+78GXs4KZFt6BatPNVtgL7oxWtX1rduhHFgRRIiDR36FSy4n6YZdt6YeeELg
         2UBZiNhcs5FqgTnnDni8pQcTCNQHmn7ZAwLxFQWB9pt4NGc8eTnxHYGK+1YednrwGMVY
         aPhA==
X-Forwarded-Encrypted: i=1; AJvYcCW0AetbdT7161wyvVgecKC8j9U9xqTQRoTiqNZRS0Z6eINDd8FggOd6wpRKW5Re16U3jFsXr+0MMiUqrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrOr+ApiD1eJev0pvXc97/w29H9Ei1Uq3u5oR+5DtTAnOwaMUU
	vAoffl5lmnyusqTKzO3BuDZlzJn/VAs51S+JypNXOYl/UAwizsvFxgldiinx8+ylv8U=
X-Gm-Gg: ASbGnctvsCdgDMCncUEInDLG+wdOPXy0g1wkfu/jvP26yRVYt93N/VpulqtJu6ewE95
	RdvlVzy1AuV/s9gpGUZM5q+d/5EyxZp4c5TrOxAFMjoO3ysTjtl4harB+KUcD1KftpBdk6axMrc
	WHrDx4YVgcxt7Rl5MjQtzXxgpdxfrNJ83NTCRmFmQGjQZGaICDEkePTfi7CZvPkHIn3sHEfOPxb
	GuCvfilXHExetn2qDbAQqo6i/mTXpSlTi236TV2BEjyOb6iRaaYiuG122Rt/K8UyRWzg7Rf6CMS
	Ah2AfQd5Ow4kDRITRXpr+YKfb8brTRM4qCY2hLCPiooFYSQAnTDpSYbrX73FIHils/qHwL3LeYT
	OKa1w1pf84OJ+ALwNBjoiFWwy2WIsbzolnkNkptLY0Gz3JPs+Ne+n6/hCe6pNlQXZKSTNEZUbCA
	==
X-Google-Smtp-Source: AGHT+IFaQahPDaZUOJPsVC+qijtYvVYI6IpgA7gJn52e340/+24c8CKkEgyMH3/OfrM26Bc8TF0EMg==
X-Received: by 2002:a05:6000:2289:b0:3b5:e077:af52 with SMTP id ffacd0b85a97d-3b60953435fmr2397025f8f.25.1752569565440;
        Tue, 15 Jul 2025 01:52:45 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26daasm14882980f8f.91.2025.07.15.01.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 01:52:44 -0700 (PDT)
Message-ID: <2f9c8b96-8051-4270-b151-661c569823df@linaro.org>
Date: Tue, 15 Jul 2025 09:52:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY
 Combo schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
 <8ed5eeee-78a2-4b26-989f-03676a9e5da7@linaro.org>
 <01080f5f-f3e6-4989-ac84-766c030dda35@linaro.org>
 <dd3c2fea-2c85-4a4e-b048-68f95f4a7d5d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <dd3c2fea-2c85-4a4e-b048-68f95f4a7d5d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 07:40, Vladimir Zapolskiy wrote:
>>>
>>> There is no ports at all, which makes the device tree node unusable,
>>> since you can not provide a way to connect any sensors to the phy.
>>
>> data-ports should go from sensor to the consumer of the data camss/csid
>> not to the PHY.
> 
> No, this is an invalid description of links between hardware IPs, and
> this mistake shall not be copied to CSIPHY/CAMSS.

Why is it an invalid description ?

https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com/

TBH I took a look at the rockchip stuff and said "nice, excellent, let's 
do it that way".

I'm happy to shamelessly copy their stuff.

---
bod

