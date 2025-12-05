Return-Path: <linux-media+bounces-48327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB7CA7F74
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 15:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1502F30EC7D1
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 12:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A51432ED53;
	Fri,  5 Dec 2025 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="ZbgpSJWp"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF3031A046;
	Fri,  5 Dec 2025 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936704; cv=none; b=pTFzD3ocU/Wmmz43mqWfLWSmM3FL3aMP7PBvjblZVRQGLcNl+GPKNM/WqozoY0XoXjKOwz1MmwcRtysV/OdBTvCOKavRuQ/LX23ufzf4L0jFCsFFCDt56JJcXywzgXChUcIib0BH7IQjdhyWnu3HEs3fDJrETCz0JOTaBuCwgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936704; c=relaxed/simple;
	bh=48k4AgX+q3IBIkf0IGLJcXM2KiZiFNbkddmehWxWCIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdtmHM+iJ0uquDKnovSlWir+p3/D75r4yl/JFo5djInt5BRhhswoRK28ZDWpEOjSI8WR/TZdxk4lVbkjh8xbt4fCD2Op22QXeTO0IjxQK6Mbghr//TIQdekBWLBIfMtLlVMYI8kX5CXszowsQQCfq3wD4riFB9atXT4Cb/zUul4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=ZbgpSJWp; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 4EAA653400DF;
	Fri, 05 Dec 2025 13:11:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1764936697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9K3BaIAz1YO5eT1F/Xdh0sXF5lL51JkibNNOPjMJcng=;
	b=ZbgpSJWpOBwS4UeAc0/p6zmcwnX+1JzC94XEZoFKNFCfqR19SzV+PWWHzZi0D0+KTEmRG3
	9ffTmXDX73KnoswkhtzNK3a7liIqCMhgPA202Y3tWFBiXL46Ey4ylMGUuzle4nui977W/j
	0vEpEI3qGjX4naySG+Y6MWZCvip8eDs=
Message-ID: <df1ce093-163d-4d80-a27a-fe42e5cfea53@ixit.cz>
Date: Fri, 5 Dec 2025 13:11:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 CPHY init
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-5-6b35ef8b071e@ixit.cz>
 <b7fac86c-15fd-400b-955a-c331c8bc681d@oss.qualcomm.com>
 <03c137aa-bd31-43d7-aea8-489ec0102ab3@ixit.cz>
 <f04d27a2-88c9-44ac-b4fa-33059a9806b2@oss.qualcomm.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <f04d27a2-88c9-44ac-b4fa-33059a9806b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/12/2025 13:00, Konrad Dybcio wrote:
> On 12/5/25 12:56 PM, David Heidelberg wrote:
>> On 05/12/2025 10:54, Konrad Dybcio wrote:
>>> On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
>>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>>
>>>> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
>>>> Gen 2 version 1.1 CSI-2 PHY.
>>>>
>>>> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
>>>> mode. This configuration supports three-phase C-PHY mode.
>>>>
>>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Co-developed-by: David Heidelberg <david@ixit.cz>
>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>> ---
>>>>    .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 74 +++++++++++++++++++++-
>>>>    1 file changed, 72 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>>> index 3d30cdce33f96..7121aa97a19c4 100644
>>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>>> @@ -145,6 +145,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>>>>    };
>>>>      /* GEN2 1.0 2PH */
>>>> +/* 5 entries: clock + 4 lanes */
>>>>    static const struct
>>>>    csiphy_lane_regs lane_regs_sdm845[] = {
>>>>        {0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>> @@ -219,6 +220,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>>>>        {0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>>    };
>>>>    +/* GEN2 1.0 3PH */
>>>> +/* 3 entries: 3 lanes (C-PHY) */
>>>> +static const struct
>>>> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>>
>>> Here's a downstream snippet which seems to have more up-to-date settings
>>> (checked against a doc and it seems to have changes made at the time of
>>> the last edit of the doc)
>>>
>>> You'll notice it's split into 3 arrays of register sets - that's because
>>> it applies setting for each lane.. something to keep in mind we could
>>> optimize upstream data storage for (they are identical per lane in this
>>> instance) one day
>>
>> see 87c2c2716523 ("media: qcom: camss: csiphy-3ph: Remove redundant PHY init sequence control loop")
>>
>> for the reason to flatten the regs array (thou outside the scope of this patchset).
>>
>> Regarding to the different value, I can test them, can you point to docs regarding why these regs has been changed and what the values means?
>>
>> I thought it's some default seq, but as you show there is multiple versions, it make sense to properly document what these regs do.
> 
> I'll make that point to the relevant folks when they get around to refreshing
> this driver, I'm not sure I can just tell you what all the magic sequences do..
> 
> The high-level description for all post-release PHY sequence updates is pretty
> much always improves robustness as a result of "more better" electrical tuning.
> It's also the case this time around.

Since the original version works, but maybe it could work better (I'll 
do testing), I would do "upgrade" commit, so at least we know tho regs 
setups which works and someone can try deduct or document it in the future.

If you try to poke the right people, that would be awesome.

Thank you for noticing the new regs! :)

David

> 
> Konrad

-- 
David Heidelberg


