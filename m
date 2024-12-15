Return-Path: <linux-media+bounces-23430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE19F238D
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 13:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62E531885EDB
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 12:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CE315B0F2;
	Sun, 15 Dec 2024 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eA+2/hjk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E7E38384
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734264232; cv=none; b=ZI8cRiTkQaUX6cAk+P3rVPNf0hHdJfYCNzdNQ38mfILX0IVuUSClQCcZ6u7nj0+kPHgbEVv/tHt1O77B0ZUQsyPZy4Vwjs0vi9T1PRluzHvEr6UME+4ttpiRP8+wxfAwzcVb2wBu6NaxeWhx6T7ZQlNi9obRJhzLRmu7eDThaig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734264232; c=relaxed/simple;
	bh=aGpiOGREIUcShpcp8ShVC5e2TvYuN9RPLMTv9UtamMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6NwXD4xeKWU3E19+LJEq1tETegyEyDUOJtf4nHJM1kZYVc3ZaBa0rlafT79raGftM52ou3IMwLdkNlVSzcJfe1w6qT6pwDBXf0dglo2Mz+A4ewh29zMMtnIgsEUHrrv0DAfoYroT8Xzrb7nMjGhbkrCgEGoQMpDKYkpuckqmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eA+2/hjk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862a921123so2454049f8f.3
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734264229; x=1734869029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MS0JrlD/MIP9EaVqJjdQNvfB2tn7DETWLm6kEprczwQ=;
        b=eA+2/hjkzWvPwpHMu1ip6KzFEc70WIAPC5jR73P4uzT9MLBQq47MPZqIQlw1QEL1b/
         ptrRAMOPK0ZBl/rG15iro7vHULH24jmoA+7yqqH7XrCCWc774GUKoHEeauCnwTlx0xBh
         PbsKn9+x1LH17YbDeIaUZ+nIjlAumI3CnDwQaAG+FrwOhMYRCzEAuqqZjtgGjI1/liW9
         McFkCMFxCMVHEw83Sk0T672fl10vUynG/ABPJ629M8VcPKfj7ORb4d1cH7c5tVWPYMaz
         Ifj5IoaNIXvbwYx0h7P5MLWOnqjXeV0SGbF2xapKngPs3XdW3KJjuci0ZRMKN1Ck460a
         W2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734264229; x=1734869029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MS0JrlD/MIP9EaVqJjdQNvfB2tn7DETWLm6kEprczwQ=;
        b=EQ3HXTBZU0eP4hYskdQrlHAdJtKdhsDL10wfcDowVy31RoafUJqh9r/95ZUWUgzUGu
         62PsmHbv9PFiDXo9yH43EcY4vOqolAdA2zC2U9Qgh333nQ/5iXC5bT7SMgifKnn34/1a
         ROTm7VHRzl34iDYouAbX8LWS6Kx4twrvDhPyuWU+m7JVzfHJCvto+O5fjiMNZeuE9TwC
         y77onXhtXpYPOFClmXydegQcRj+XL06lo5A1XCELNsLeNxUcJSG8NJ+pMIIgLb98Qpou
         +pPdR2fUNTnrY3HbQIwFVL/U0LbJ6jUn61+QfDp9LBramq3mv7qSOYtlLJmGebayy5D4
         OgyA==
X-Gm-Message-State: AOJu0YxL25Nx6YPjdECdDe1/7TFiY8rco0g+BmfcYWh+Z2hHkxXLZF/f
	vIbf54A34/FNHPVyDAIcj6xID88WBaKgA7okdlPSzu/BKlYOLHrE0ZNmaT0wgYs=
X-Gm-Gg: ASbGncs88yb+mpl+x4XQOsqSuDot83UMlPmuzD06BA4tBlg29ez/JEhWnJWQVPZdAo7
	wRCQGa5bQfTA555Lc6SU8NBhwSsJ0vlJ7Oe6maokwPBQbMUBb1FW/7dTj/+3OPEfBgjoan8vuer
	Vdz0eY26lvA2biFx3pA/ePvw8r4vbnvqEO4ErSbbMt1uVWB7RKyepR5YhjUPtsTbpIKlE2bRZYL
	wDhS5mQip2gs+TXgxGQiLxlwc3kNJviII+/Rjq/nZFVmPDmQwwUqv30nAhK298vSNPTZA==
X-Google-Smtp-Source: AGHT+IHdf+axtUaBvNo+jZg5gVqNEZh7fpsNxrZqvb0qpatqR6zQGoIT4kFiRZ3VvH03TdccPTyjiA==
X-Received: by 2002:a5d:47ae:0:b0:382:3754:38fa with SMTP id ffacd0b85a97d-3888e0ba9a7mr7465978f8f.51.1734264229096;
        Sun, 15 Dec 2024 04:03:49 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80120dcsm5216297f8f.8.2024.12.15.04.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 04:03:48 -0800 (PST)
Message-ID: <ee6bbbb3-f91b-4568-aeec-11d773ae4df3@linaro.org>
Date: Sun, 15 Dec 2024 12:03:47 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "media: qcom: camss: Restructure
 camss_link_entities"
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241215-b4-linux-next-revert-link-freq-v2-1-62d5660004ea@linaro.org>
 <60bfe389-cea9-4aea-9175-fc80f1e9f594@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <60bfe389-cea9-4aea-9175-fc80f1e9f594@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/12/2024 11:58, Vladimir Zapolskiy wrote:
> On 12/15/24 02:33, Bryan O'Donoghue wrote:
>> This reverts commit cc1ecabe67d92a2da0b0402f715598e8dbdc3b9e.
>>
>> This commit has a basic flaw in that it relies on camss->res->csid_num 
>> as a
>> control to index the array camss->vfe[i].
>>
>> Testing on a platform where csid_num > vfe_num showed this bug up.
>>
>> camss->vfe should only be indexed by camss->res->vfe_num. Since this 
>> commit
>> is meant to make the code be more readable reverting will simply restore
>> the previous correct bounds checking.
>>
>> We can make another pass at making camss_link_entities look prettier but,
>> for now we should zap the bug introduced.
>>
>> Fixes: cc1ecabe67d9 ("media: qcom: camss: Restructure 
>> camss_link_entities")
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This change is very welcome.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> -- 
> Best wishes,
> Vladimir

Mauro.

Hans would normally merge for us in CAMSS but, he's on Xmas holidays.

Could I impose upon you to pick this one up directly ?

---
bod

