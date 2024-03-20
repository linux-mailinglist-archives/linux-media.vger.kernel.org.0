Return-Path: <linux-media+bounces-7427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 589BA881490
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 16:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC57CB23212
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 15:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4B754BE9;
	Wed, 20 Mar 2024 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYEWXPhk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE456B85
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710948393; cv=none; b=oUJ+iH83oqbiALWoSlr33ZaLdxjtHVOyEd2dCJ3wsfDEc4Yp+/mjCvRWBpDGZmRgMFEVQAUCX55z2HyB7k0bsO8iuh33zY2yIsznfq89xzLfGpruOGEKHgMT61WyHzr9J3cSTW6B74HMk6Sh8wzWkQGdwGMhj+fXuM6Uk2o/AyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710948393; c=relaxed/simple;
	bh=okdAbZL8gbvmW1RuJit+Oo6Rn59qv0sW8wGn2WEs2l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlj/WElW1UVNpVY4wLQMcn+VtdGSj7TPtr7sj4i4ZE2CPTNFsm6SJlstFrRKyyO41QLb8NBSUPRqdZ+8mPaj/lh4dGnvQQFUP4eh5bAgbbyPo7tS1A2z92unzzoYhpLNyXYf9vGx16p6VKD1cJZssEX5ofVFtyjnla7O6dyK0U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYEWXPhk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4146f2bd5f1so2524845e9.3
        for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710948390; x=1711553190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfhR3PVm9ndcDqY/QyzSomICQ7CgMd9+QltOZaxyBa0=;
        b=zYEWXPhk/LORBsSyCu2zzI6dzZQo4XJBLUHdudG9iQbf5AuYiof+ayaOlSxz6sQOFH
         sMGYZbdWnHMTmloi5f3/J25Ul7/4gUAJuA7lDuNe1h6eIQ5ZqsCf4SFBzPFHcBb1zzu0
         FQ7Z/Uw3CfCSf9TQmchq5SVUd2nXPsqUr8fmBOuOgU3kumGMMCFiJtqH8KmFiWbf/7xU
         +yQW8dDaSKMnWzhS16SmYvZVbIVOPQZUHoDb1OdNa3tt9K25u4/i1ZqYIcDnFSMWcv62
         HY5ZB6QtjwEQDKM06Ikn9T+62vXAkUn/CvC53hwZB/P1Hwij6lNrk/3NZNp4qTov4LqE
         qT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710948390; x=1711553190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfhR3PVm9ndcDqY/QyzSomICQ7CgMd9+QltOZaxyBa0=;
        b=hMu7w6PV7MLy7KqK113Vl4Bci0wWfebiqVHRtf7t2UQGSCmKo6JidzyMhnfhYVIhg3
         egsbd1sAO6xKy/Fw5j+U1GRHdXT5+O46Swp3L/0KWHBeGyguYeGO/7+h3qA9RnB8DyB+
         P2t+/gpmdoZx0wPtbsNkW3mJap2H+HlIxUXRwyc5J98kkuN+YSOk351yR0g1ngVbiIbh
         jqsrU7kNix84Bl4Z8rIY7Z3YI/VvrOKcUTXX7Cj9eKtaykjeB3ZVJjp++oRfZAxtm3v3
         +cooZdidUlzgGc59BKpNNdcdSessApyJXFG9n1cMksC9eVg6xjCmwtZ1FlwyQceQwqmT
         Z1vg==
X-Forwarded-Encrypted: i=1; AJvYcCXf+GCrg87xrr0TLAa9KyriDLmKTJfl6FHstmiLmnGcuykoVGIxT6ZMe8EXBSB15+v9Oy4/dhza0nWD4nUSwRPTs0ci5ZafEEoDGKs=
X-Gm-Message-State: AOJu0YzQi23d/Zvg5s4rgr3xlk4BUAwV6YoLX7cai2Qffkn+Y6cUTESy
	YD4i7vUWadLHnOKT3ny9j76Hnx3y34Ub6QEZHvsMmScV1v/bbpalrDJzQJf3WiI=
X-Google-Smtp-Source: AGHT+IHazk3259IN7ybHaHDxZim315wYlhSKeO7vGqllY2vZhFQJDH/8MknBOLXrK8tIt7kJMXn/3A==
X-Received: by 2002:a05:600c:35d4:b0:414:924:8ff9 with SMTP id r20-20020a05600c35d400b0041409248ff9mr1608850wmq.34.1710948389871;
        Wed, 20 Mar 2024 08:26:29 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id n6-20020a5d4006000000b0033e699fc6b4sm14984569wrp.69.2024.03.20.08.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 08:26:29 -0700 (PDT)
Message-ID: <05dcb857-706e-4674-8221-7d0209e6c1fb@linaro.org>
Date: Wed, 20 Mar 2024 15:26:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: qcom: camss: Add new params for csid_device
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-5-quic_depengs@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240320141136.26827-5-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 14:11, Depeng Shao wrote:
> CSID gen3 has a new register block which is named as
> CSID top, it controls the output of CSID, since the
> CSID can connect to SFE or original VFE in CSID gen3.
> The register update is moved to CSID from VFE in CSID
> gen3.
> So, adding top_base and reg_update variables in csid
> device structure for CSID gen3.

You need to define three letter acronyms (TLAs) - within reason - the 
first time you use them.

There is no concept of an "SFE" upstream - please define what the SFE is 
in the commit log "to the Sensor Front End (SFE)" then you can refer 
back to the acronym liberally.

---
bod

