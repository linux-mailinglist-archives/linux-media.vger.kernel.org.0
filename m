Return-Path: <linux-media+bounces-18237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9436977834
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 07:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A31B1286CA4
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 05:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA5A154BFC;
	Fri, 13 Sep 2024 05:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="bin4cJWu";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="bin4cJWu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E224A07;
	Fri, 13 Sep 2024 05:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726204347; cv=none; b=sVF5L51kPatv38KbYGP2/59Xwa/RaTLTWN+EnTgeqjVcNAy8GLv5LXUQfZJe+s125AnyAh+nr6kNJ4jRShPJ8f+0JVt3PRqjzVnB2RrZiG2LEe2s8YQa5uPFizjzR3/ywkBE1/fmaw2kj+CAufCRlmlVYYSdvnpdmWBTGTsTuo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726204347; c=relaxed/simple;
	bh=zKWRrgAFSWuhGcaRCQ3nngkM1N/MGL7JF+DDMTRquU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5036VJBOXjgJanV+QnDjusLlGAig1ZSJXWz8mgeM3l8If7yoar3VmTkU7vzOQSlXss7nTjZhmLY8dusvuMhR3mjDK2XosmOvQULe/Dl/csOa7PrDQOTshuOGQpQAxRwSur1oCe4Vo52y3q4qM2taJod/eMG2CPbULzaAbVEvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=bin4cJWu; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=bin4cJWu; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1726203978; bh=zKWRrgAFSWuhGcaRCQ3nngkM1N/MGL7JF+DDMTRquU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bin4cJWuoAYuwjiR4RzoFv/5MJlf4pw3UjMEcEpF1T8Aoy6ynq1ynlqyDeiKFGTmR
	 Cs4Ima/M57RvsPdD+Iambt2AAC3F8Gq10J6zu3z/Kzn99RuzBmEqEn5gXWSTHT/qPn
	 jPOhBXMk0FNLv3c/TbL6iVLdpq2RIhjHPha4ReJ+kqSnroqwuoSq1wPBWTmNyfXuOJ
	 /2z/odadxW6sObiookQbcKmoibNmSCxbJEQennDD87LE8pxXLTRZgyTI8d0gEwZcpS
	 fH/OBwqS8W8cq6AiQOAdq/LmtJ/UYmGtyMRQHmqDu/lyDiTgRxHeXxi/JBwD1Jh0c6
	 DOZCo7VmQTVUQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9A13F381854;
	Fri, 13 Sep 2024 05:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1726203978; bh=zKWRrgAFSWuhGcaRCQ3nngkM1N/MGL7JF+DDMTRquU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bin4cJWuoAYuwjiR4RzoFv/5MJlf4pw3UjMEcEpF1T8Aoy6ynq1ynlqyDeiKFGTmR
	 Cs4Ima/M57RvsPdD+Iambt2AAC3F8Gq10J6zu3z/Kzn99RuzBmEqEn5gXWSTHT/qPn
	 jPOhBXMk0FNLv3c/TbL6iVLdpq2RIhjHPha4ReJ+kqSnroqwuoSq1wPBWTmNyfXuOJ
	 /2z/odadxW6sObiookQbcKmoibNmSCxbJEQennDD87LE8pxXLTRZgyTI8d0gEwZcpS
	 fH/OBwqS8W8cq6AiQOAdq/LmtJ/UYmGtyMRQHmqDu/lyDiTgRxHeXxi/JBwD1Jh0c6
	 DOZCo7VmQTVUQ==
Message-ID: <cab95caa-9ffb-446a-858b-342939e80811@mleia.com>
Date: Fri, 13 Sep 2024 08:06:17 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
 <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
 <da60cf71-13a4-465d-a0ee-ca2ad3775262@linaro.org>
 <97e4f888-1ed7-4d82-b972-3e0b95610198@linaro.org>
 <6eadc285-f413-4bf0-8795-59ff19c734da@linaro.org>
 <6562a958-47e9-4a49-b235-fe8deba3c051@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <6562a958-47e9-4a49-b235-fe8deba3c051@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20240913_050618_659088_184595F4 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message. 

On 9/13/24 01:41, Bryan O'Donoghue wrote:
> On 12/09/2024 21:57, Vladimir Zapolskiy wrote:
>>> 3. Required not optional in the yaml
>>>
>>>       => You can't use the PHY without its regulators
>>
>> No, the supplies shall be optional, since it's absolutely possible to have
>> such a board, where supplies are merely not connected to the SoC.
> 
> For any _used_ PHY both supplies are certainly required.
> 
> That's what the yaml/dts check for this should achieve.

I believe it is technically possible by writing an enormously complex
scheme, when all possible "port" cases and combinations are listed.

Do you see any simpler way? Do you insist that it is utterly needed?

In any case, there are optional and required device tree properties,
the CAMSS supplies shall be split into multiple ones and become optional.

That's exactly the point of my first message in the discussion, so far
nothing has been added or changed.

--
Best wishes,
Vladimir

