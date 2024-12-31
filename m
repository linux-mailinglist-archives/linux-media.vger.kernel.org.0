Return-Path: <linux-media+bounces-24195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BC9FEF21
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 12:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFDDD1621A5
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 11:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8967819CC33;
	Tue, 31 Dec 2024 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5dNKcqj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049E18A6D2
	for <linux-media@vger.kernel.org>; Tue, 31 Dec 2024 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735645714; cv=none; b=hu7xVBF6S0TqyUIT7SPg1WTdjysS27yRLacQA8zMaQOQCdjtTfUAbifkMvh4IXvhqPKOejYrIxvw6EXSBJx/+eSGiQDT2b+kKRYfaQBp1xPMG/wEsTJ3O0yueOafFFnALCmURpv/6XOuvr+7rUApFL9U4LiAV5gqzYpNANnCrmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735645714; c=relaxed/simple;
	bh=UfGb538qS6fTheMXDVXwLaYxOh/Fu2Le7j4lot7dN8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AN4F99FyEDqiHdpxOequPsumDP8ecC11V+YfgrCcqfhm+HpOAh0gcQ4sJI2bHohGM92GKDc8gxjnh3F573yFDpnSoCYzLjis1SQhWid1to2Ffj9qK3eSh9Fcj5t5sFg49x6KazyrDXCKlYZe242rg0820uJYfQ8J+t2DUSnNZ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5dNKcqj; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e384d00f4so1705197e87.1
        for <linux-media@vger.kernel.org>; Tue, 31 Dec 2024 03:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735645710; x=1736250510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPcpvSMA+nWrZjqrSVYEniXrHyrlHzlkdD9s2BkwZx0=;
        b=n5dNKcqjq/W1+4mOIsfXadO8n6DVG4L/lPbrbp89BBsFgq5bg8QraiVjlWiu5T9Zhi
         3/nL3O/HLAkmQnBitY+s8H1hk+04iaZKNubizhmKGj3d2PKvVSdNaRs4NWiW4l8omAmm
         kexY5kmifmg6Jhhkl2buX//3ZaZObiiIfoAkzsXgv96+nei9kflhJ44+7N5qhWyRWDvw
         8esDLntCgdoz1kdRHV8KR1/XbZhcY4T3oT2xuZv6ARUd9gFgNw10+V1fBZLVkM115Jhb
         Me6IKSVNlP/8RgdFdE1E65Gc8OGh9Ac5rDjaYbZn+IaB/N31WAO1HzrR9dMwF3mdihAO
         intw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735645710; x=1736250510;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPcpvSMA+nWrZjqrSVYEniXrHyrlHzlkdD9s2BkwZx0=;
        b=ArT/DDShtSiAO9yj+EsU6dJ5cxsll0Wz/wPypiPYOR41bj41bbZT2s7uqPOHlDlB62
         zpUbD1n6tBUiuRxUMaktqML9qdKuI+SRZYhIPlS7uo4fFcXHCsESt3Rv340pkTiJQa9X
         17/dReMWdHXANkzTXA3M7YP1XcR/6975P1OHPzeX1LomI3MLf1FlocrokgvlUEmkwwnd
         JC+/BM95t1h0PYkDZ2vmuDzTx2QOaZbamfiR4o6C+JbshMBbxfrsb5WLCQSqbOh1LBCP
         DOWKLF+PCbMhjaFke6IrOhtPk5CGh+PMKyGiQwOsibAAaz7gPuImkBp5Mdubko4IJMD2
         sHVg==
X-Forwarded-Encrypted: i=1; AJvYcCWexEQZUllNzF9vBZea1R3jL5ab+4YNuDg8k/khiR5SYZAzd3x9pnEMALlrboGk6oXRUAF89TZ4QBmYeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWLzvdeY3avrryJEDDGa9jTa70i7llnRbThBjMHhE3+zyrz68U
	nuKG5EPyakK7a/zksreHLSpUSeHKODCQSJ8OT1dD6EreAxK8713GeF+WAOj1CfA=
X-Gm-Gg: ASbGnctrGENP+vTa61+InYlXuXlQDdozF2oc8WwXtqr+r40IBTs6qcIUPVSyZ6v49Il
	S2HuLhOzrlL0ajAn9G/O1LrE181QeOy3bkLDsi8RWXw+BsSTajg5gb6k+X8S2AmXTYlHhiHwYsB
	yB+47feUotNl4SRzWXLbe/w8O/T2PE77e5nkPJGD1a1YR7/Czz/RhZhw4B3r+ZfyFXVWkq3PvGS
	wTB1URnQZrl04kfJgKCAnOJwI8FBVEr6vGIZSwM9+P739+ICaGPHP8idnWCtAIAAcOt2gjQiXh9
	IpbFym1kEsYmBD70xLTOSn+Gd68rzz5n3LY=
X-Google-Smtp-Source: AGHT+IGw+IBxZDLIPKW1ctolrza83QDB3dHGcJZYelTmKDc4ccY0ytsjd0iQG/jRP+F7A5JDhTDPWA==
X-Received: by 2002:a05:6512:3a8f:b0:53e:3756:80b4 with SMTP id 2adb3069b0e04-5422956b95emr3552488e87.12.1735645710298;
        Tue, 31 Dec 2024 03:48:30 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f61c2sm3323915e87.32.2024.12.31.03.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 03:48:28 -0800 (PST)
Message-ID: <244c58dd-b36a-49a3-901f-8a60dc936726@linaro.org>
Date: Tue, 31 Dec 2024 13:48:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-4-06fdd5a7d5bb@linaro.org>
 <aaead9e5-a978-4b3b-8635-bd8be647ae35@linaro.org>
 <c9d97c40-d3bf-486f-b348-91ffedeece5a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c9d97c40-d3bf-486f-b348-91ffedeece5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/31/24 00:34, Bryan O'Donoghue wrote:
> On 30/12/2024 19:45, Vladimir Zapolskiy wrote:
>>> +            status = "disabled";
>>
>> Please do not disable the clock controller, it was discussed in the
>> past, that
>> all clock controllers should be enabled by default.
> 
> Looks true but, news to me.
> 
> Do you have a link to the discussion?
> 

Please take a look at this discussion:

https://lore.kernel.org/all/c240075d-55d1-28f6-18ad-3897e55f8e59@somainline.org/

--
Best wishes,
Vladimir

