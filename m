Return-Path: <linux-media+bounces-6569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0431873652
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 13:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 747FA28245F
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 12:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA9B80607;
	Wed,  6 Mar 2024 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cb+cqJ38"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED53B80025
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728135; cv=none; b=kPrZVbiYLXj90/sOhKaLWdeC7jMDLO5E6cDHD8gY2Ah6j/lGXt8T/jS6qJazfvhlwVP5MSitFGG7va2XEPy9LFOXm3Ixm/HvG8cia9IcfAXGgl6Yg/FdIuHG/vJDVLVkLE+5IdGNMGe5GeQAddi+gqey8PQyY9pixAwHy0cf43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728135; c=relaxed/simple;
	bh=VLOS2vVv4IuuAP5UT08HBwa1ioaWzhky52552bmm8wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcVhcHDwh3tsrRQF6YSs4bzdgAEDSj4zrT8bSS8jsNW2nBUhyYHFzOE0PRKEORdVVT6AbpclOx1mXjWWdKa6LQ6MTBEgd42tFGL4KgO7gG2pCDXlIMz61bfVf7ChjKUHSC4XzJn42Gc2tOTIdeOTG9FvA+wD59LUPnX3Xg9NJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cb+cqJ38; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33e162b1b71so1518207f8f.1
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 04:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709728131; x=1710332931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+jaysDx7kzbPxogzlLwhX0qb8dGOpg3gc0tLTZPBlI=;
        b=cb+cqJ38c1aCH1KZE9dDqMAPRf2KsGg1F/Sjs7SSjJ9ZwndKtMS3818jQgyMnNjt5U
         vrdcvlzexDa1x0n/A7LpfQC/40xacFfmPmmLUl875z7AmzEW4CAmGi0/9CBet7GB0bo6
         aTjz2Kbw08q7tm+ENW/8DUJAi4Z5UkIKJjoKkPjOOMXFHgsps6jzrSU16IjpwMdkDLOM
         +VooXQwcghTlAa3AWxYDtqUJbJfTG/xfCYlgC6z9oDIs7HXEGYWysoU/CbuCjODnA1ZM
         OCCJkoInaq0NZNT3hlQUqns2Nu6ErVfMRKPU++RNG9b0NXmTCcqi0DwbF65Eojyky7lw
         Nr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728131; x=1710332931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+jaysDx7kzbPxogzlLwhX0qb8dGOpg3gc0tLTZPBlI=;
        b=UwW9KZR+0XET53xBFYXYBsDuauSFY8w6xkGFA6m7tjtmFpzWdO3/5uHfMfWfZSEHSO
         uNIbLSE3aGinbmRypbdTXYrghfMMTx4kP5YWd6zdFDuE+WTDl65ro0TxYX5yR6MaLqyr
         MtEp3Op0e5iRg/vw9ufrMsfRxa7PKCIx6aZDhdi1ULon6283lvRlXDRu+/LWhYAKOij3
         m+e5vX544/aj2GWtHzDUZTbMT2A/Tyz5PJXny3GB38t+P67CUUFGC/gJQhQeLaJ6s1He
         7+yATnLqxgPJibAD+pi/ScOhdrE87pVuA660cEpEmik0ygDHBBar62hPKhpyhJ/7dcPW
         Lk2w==
X-Forwarded-Encrypted: i=1; AJvYcCWyH+l284G65/LWtKeiD5MJaCcR7T6753q35usy1i2+blE2hWd1c796u/aJPVAxdHhpcSLYc81PrvkOWiZifGgvQ7pUE6xW/CHKiyM=
X-Gm-Message-State: AOJu0YyzBZqHUTxLCcl1p7tYJ/Qg9omg871IXR6Oc/f8RZfL/CG48GPA
	43uxfCgvyzkAuGepvV8a8UvzTRWfT6NU3DulmrwsEC51hWS/4o+9O62vx3cA1hl9WFf9S6B+OTt
	3
X-Google-Smtp-Source: AGHT+IETdEzABGZ5rA7uZ90k0itisYxcBiZM3vaWPWgmQKh0tg8Z9BR1QWHuNS2bjWtsUYHHAWSJ+w==
X-Received: by 2002:a05:6000:4c7:b0:33e:8fd:1173 with SMTP id h7-20020a05600004c700b0033e08fd1173mr11966388wri.60.1709728131322;
        Wed, 06 Mar 2024 04:28:51 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bn20-20020a056000061400b0033e43756d11sm6811932wrb.85.2024.03.06.04.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:28:51 -0800 (PST)
Message-ID: <865ba063-e5a8-4a24-af92-3742834b31ea@linaro.org>
Date: Wed, 6 Mar 2024 12:28:49 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] media: venus: core: Deduplicate OPP genpd names
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-8-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-8-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> Instead of redefining the same literals over and over again, define
> them once and point the reference to that definition.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


