Return-Path: <linux-media+bounces-59275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JPnIp5o6GlZKAIAu9opvQ
	(envelope-from <linux-media+bounces-59275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:20:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E26442595
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FEE130158AF
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726B32BFC60;
	Wed, 22 Apr 2026 06:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9yUAedo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVSmpaCJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD41A704B
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838751; cv=none; b=Kx/49Lf/Ns/rze8/fCon12H4ksryMRbxyM8oNpTSPvbHYaaJLv3ZN6IkF2CZKA0wyZEoqiz1yWi4MSoqjs3C4xLUL1SZWw40oRYaLFyUqIkIznTCcgrXD7CA2oBlIuzvCTqQnZX8N2y7Zc0HcNk0jkr93bLWHfP/nJ3HpH9Lh/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838751; c=relaxed/simple;
	bh=GhLCn87lDg0zVWE5r8YDpyCLm1zvULHLCWK8oqFTnb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chBVfKj6L0JoXmfYffykPjiH88aL36wNK3d7Nfie9MZ1+Nyft6rCEUbtL7rGc3f0U5DHxyor/TbLdc9qOEqsl+l7PZ8Ju7AWehsh/wWxaY6rcMxtMI/FjdJrypTJXpgmcfYOly8V7KanyyWy8QKWgk04NFX6PsHfl0xqjKvuJYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9yUAedo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVSmpaCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5cHjH2965802
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmV+ExxZZmmRYLRISOrru0LTP1LO55qj5WfaayyYBTM=; b=W9yUAedoabsC3bk6
	gbUygCcbqobtVjb7siSk7sFG0SisKopS0MwHeZnbi3Zcihwl2/OTt+/kYS18l/WE
	VF1QWwNA+CvcaXcJ+GzKHZ9KHyyZ4p4iBM1J9RFLNBXzBSfjMk9pNwyl5zv1iSAu
	vpqNH6BHyctX7zM5OZqAZw5PB6M3pu6UW83jELWOwFQPE72F91jsrzLGBzNqUc8s
	v0ifP1t9CV4fTrK7RyPnDPHSPA7YbyBqZVXv1Fs9JlLbcph7040B8LczNIXG1YAX
	6P4AnXZN6FZMMDeDGxKQQOM+yiUwA37UAT1CGjZSo/Hqy6GRJPmXWHSg0b8WnqUF
	uqunDw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfhxbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:19:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70dd30025fso6347941a12.2
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 23:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776838749; x=1777443549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmV+ExxZZmmRYLRISOrru0LTP1LO55qj5WfaayyYBTM=;
        b=GVSmpaCJD85GhjDukyKnUJIeLOkmHpg6OHnnlKWk2wTzdAt4HYE9Lx8APKj5VDk5jA
         WTPYYm/zc5jEQ8MEfNXd2YaT/JBM+AerTOHeRRhg45QDoEg/LOcaPbvQkiPcJiJ8Vlp1
         T3g9VmT1qBKqUzI45CuHm1HhYULTs9tvc+sqQ21X+wWiOGohpEB4pOLuwAq4m3BQgcFU
         9Fp9IsshjzAVaf30+YaL2nzRuE6Esrvwim3wsb9zN1ThR4Vxx526/1HSCbh31Zt19BAE
         BbhCqjXH8v8nEqQmzMiYjwQbuY+W64tl2PPiYxGBcpUhaA6kBcYdKQ7G4fvLEZMICw9R
         lMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838749; x=1777443549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmV+ExxZZmmRYLRISOrru0LTP1LO55qj5WfaayyYBTM=;
        b=D6bUYlS5+wSfxoqQNfWGHfSWVr+Y3/ngcFmt8QnoyFOnPR6hU43B2XXAe/PMhFTlUp
         uKbroGtUmq9o/5bxqFuHBalqy/z1sbPCsxVzA+Xz7dCQW+sdXszTmtOwP7dnwarBHy9b
         JYXA9sgc/NmCSA7nMhq8dI6Smzo9hqqKjvY/2waJ/+Cyg9jcWQULfE22jr1Zv5nI0SKo
         ncrJ4IqzKRV2VlEB51PzQy5l2rtfkf7hKHJ4IsGoprgdohbfL6LZdLkNJi4bFb0wPksO
         gmMWG0PMGGorQ3TpMEDNImVFXxqKy/iAcsWoAGNr1k2SxvKZnke9XOuOtPeCpoPmpNhf
         6+UA==
X-Forwarded-Encrypted: i=1; AFNElJ/sjEJu/wNGyw5zCktB8+REvj+AFSNwSrMqzrWwTuN65n9xCEMswZNK5kU+QQdoNklXLhE2/UpMO7bSog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvGgnq4nabctNjoORWxSJVWDv4KRBkPDhSWsoXt5e8toWwehpk
	G8JqjBFBgUr9gUrTVQ+7T+8s9H5BaGSj9LZFpdedOS06Z/tNt5pUo+pPKHqJmOGC5/t1wtOgy4j
	ydtKlTchAnZT9c0BsQXUlB+eLCslTksEbVQ1ZfAQYYl3QqRgsCAaS30YgSrPg8aaljQ==
X-Gm-Gg: AeBDiesOc0YTG+b4B/4Go+cY92mPWPjMJyH5DSwFi8dHzcj/RpUkeKPIj1iXw/4/EAQ
	IiTwxCadyG84AzQHmgz4I80RniyZRmpj7auzTBJ9Uwh623sD8BJ/eJTJYz//7SsqaiuXm0YexA9
	VyXG0Q27bz062gfww4HEIMCuXS0WlLLuKlydsXq+2hIEMA+ULZB/Gjek4T3TXfSdYvSaSs9y+bk
	mSBQ2dewmMYX3qPpDrKsHOkUJ9//hnnj//uck0QBMoHWYv8vVt7KtpWBDKXu5RooP4j0g9wgMmr
	umoKqY4ek4vdjSAMX1g6288XGEG7qlqo4YB3lGpj5VQUfcy12lIr+AXP3v6hZLk5BzT6FGPOMcY
	y5XmL2nvBIkZQjAR2Qb//ghMUW3GHG5y9CCszNN4Utp1yBpAnSU62XWFMjB6F9bCo
X-Received: by 2002:a05:6a00:8715:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-82fa89ee99fmr9654272b3a.14.1776838749040;
        Tue, 21 Apr 2026 23:19:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:8715:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-82fa89ee99fmr9654234b3a.14.1776838748498;
        Tue, 21 Apr 2026 23:19:08 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbcfd7sm19942638b3a.32.2026.04.21.23.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:19:07 -0700 (PDT)
Message-ID: <9c76be4a-e907-b5b6-e50f-0f37738752da@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:49:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
 <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
 <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
 <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
 <bab7f899-dc05-7c9d-aed5-fed1910aa32b@oss.qualcomm.com>
 <cucl4m3h2wkosvzuyxdwyjec3v5n6vpa5g3osvo5y4farpewtn@jw6kzf3f3eyj>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <cucl4m3h2wkosvzuyxdwyjec3v5n6vpa5g3osvo5y4farpewtn@jw6kzf3f3eyj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Y6rIdBeN c=1 sm=1 tr=0 ts=69e8685d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S1jlUsJdER8BTHAalKsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NyBTYWx0ZWRfX1dO+kRUsuQA+
 zVhiAQ32yH+zLhseL5Zb3yCUE/BJVz9mEENK3TfjpRC+hfPF9tIEGBSMBrplSZuBNP1pPPLBWy0
 LUCqxsojVlDzBRsf/hdcbCnwHSA4ngAfb1DyCu9peKi4pzclFzUdjdou0jCZ1Xvss0hnMD/811I
 Zg5JCeDhfyCwxMHqhsnpeVj878wW7omnBzGHaTCxPxn/1vOuxJ05F7PFgev1ijUbmliN3UPOVCw
 Sty7titArUzsJcE8cxAMbR0vjOU316CKZXUSCDnqrJBllSOJGG/IMP6TCaaJf6OZ+if902QjV/l
 31LPrfN4ztCDlLrYcWiamT1pZqt2PYsajCyJ6ZdNEbnp4gKSmQuI1GmA76LzwJcDd2YTS4wYGSE
 gMFj38yv9YtCLMKr89oaKUwbXTUbMy4bu1+Gp/65ad6SKpxSgKnqxXdEMbXvwFz6JKOcJzqxL8h
 JBZbk0aCZoImMGHJ7kg==
X-Proofpoint-GUID: zZaW3eY1ZT0Y6garQgnkWwQ-rCx433h4
X-Proofpoint-ORIG-GUID: zZaW3eY1ZT0Y6garQgnkWwQ-rCx433h4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220057
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59275-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5E26442595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/20/2026 11:26 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 07:33:01PM +0530, Vishnu Reddy wrote:
>> On 4/17/2026 11:53 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 17, 2026 at 08:49:44PM +0530, Vishnu Reddy wrote:
>>>> On 4/14/2026 8:48 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Apr 14, 2026 at 10:30:00AM +0530, Vishnu Reddy wrote:
>>>>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>>>
>>>>>> Add a helper function to allocate and register context bank (CB) device
>>>>>> on the iris vpu bus. The function ID associated with the CB is specified
>>>>>> from the platform data, allowing the bus dma_configure callback to apply
>>>>>> correct stream ID mapping when device is registered.
>>>>>>
>>>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>>>>>> ---
>>>>>>   drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
>>>>>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>>>>>>   2 files changed, 34 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>>>>>> index 773f6548370a..a25e0f2e9d26 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>>>>>> @@ -6,6 +6,7 @@
>>>>>>   #include <linux/clk.h>
>>>>>>   #include <linux/devfreq.h>
>>>>>>   #include <linux/interconnect.h>
>>>>>> +#include <linux/iris_vpu_bus.h>
>>>>>>   #include <linux/pm_domain.h>
>>>>>>   #include <linux/pm_opp.h>
>>>>>>   #include <linux/pm_runtime.h>
>>>>>> @@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>>>>>>   	return 0;
>>>>>>   }
>>>>>> +
>>>>>> +static void iris_release_cb_dev(struct device *dev)
>>>>>> +{
>>>>>> +	kfree(dev);
>>>>>> +}
>>>>>> +
>>>>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
>>>>> Please move into the bus code and make it generic enough.
>>>> Do you suggest to add a wrapper to pass the varying inputs to the generic
>>>> bus, something like this
>>>> struct device* create_and_register_device(dma_mask, parent_dev, *release,
>>>> dev_name,...)
>>> Definitely not the release function. The devname is also not that
>>> important. The rest, yes, you are correct.
>>>
>>>>>> +{
>>>>>> +	struct device *dev;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	dev = kzalloc_obj(*dev);
>>>>>> +	if (!dev)
>>>>>> +		return ERR_PTR(-ENOMEM);
>>>>>> +
>>>>>> +	dev->release = iris_release_cb_dev;
>>>>>> +	dev->bus = &iris_vpu_bus_type;
>>>>>> +	dev->parent = core->dev;
>>>>>> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
>>>>>> +	dev->dma_mask = &dev->coherent_dma_mask;
>>>>> Would you also need to set the of_node? See
>>>>> device_set_of_node_from_dev()
>>>> It might be needed for FastRPC as they are following sub node approach, Iris
>>>> does not need.
>>> Wouldn't it save you from passing it to of_dma_configure_id()?
>> Iris will pass parent device of_node, setting parent device is enough.
> Set the of node and pass NULL to of_dma_configure_id.

Passing of_node as NULL to of_dma_configure_id() won’t map the SID to device,
If a dt sub node exists with iommus, the child’s of_node can be used.
Otherwise, the parent’s of_node must be passed with a valid function ID present
in iommu-map.

>>>>>> +
>>>>>> +	dev_set_name(dev, "%s", name);
>>>>>> +	dev_set_drvdata(dev, (void *)f_id);
>>>>>> +
>>>>>> +	ret = device_register(dev);
>>>>>> +	if (ret) {
>>>>>> +		put_device(dev);
>>>>>> +		return ERR_PTR(ret);
>>>>>> +	}
>>>>>> +
>>>>>> +	return dev;
>>>>>> +}
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
>>>>>> index 6bfbd2dc6db0..4a494627ff23 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>>>>>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>>>>>>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>>>>>   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>>>>   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
>>>>>>   #endif
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>

