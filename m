Return-Path: <linux-media+bounces-59028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO4MLN1S4mnx4QAAu9opvQ
	(envelope-from <linux-media+bounces-59028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:33:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 192EB41CA8C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73D5E305E1C4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 15:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18E83290BD;
	Fri, 17 Apr 2026 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSv0OfTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7I1ge1i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715D325707
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439636; cv=none; b=a2vsWNWdIEyP4JX7iewKF8eZLU9Jrprc0UFIrGCZWEc1y7FmdC0MLczxABms7035BGWOdHsIMPdF5gJiS/lDqqe6pDSFh/43/vlNywlNbHYZ3jJ3O6BUDv53DVx3z57F80WwgEhdJ7SlfM7LnQBmGn3SvupeU2GKkiLMydW/v1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439636; c=relaxed/simple;
	bh=8xUoq/FcQMwK95XsLEn5fWvjT6G37wtVq/UJvhQw2aE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iPIhWUNdQAxpEE8a8YxKo4NwTMeD9oEwuB5jq3QAmqijgnJnBNUBJAmSNL8O3NL81JGdlq+x38DqttmGlZy4pfAs8FUalieAbGHrz2BfXprGHd6C+mnkYfLr4KL/00vLASoA3bNHSNw9sCp8u//i9w+ifVPDiKsZdqmMLAi3x10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSv0OfTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7I1ge1i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HEubEV065748
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nGgbgd9dtTM4zTNUJr6OpLpNRnt6f6nmr9bUgf0LEuw=; b=oSv0OfTzab2KnkrI
	CDH9iorgZionOmjok19ij0EUUe7WR70gJNlEHE0ZLpHgRmGxNloBb9KaP6m7Wv7p
	mSdCKTMl5Ugo7VvtIVYBokiuvr6UUffjSKLBdLITsWZ+nzVjBRcaM0pOcPVJf9Qn
	3cu0nPFvjYeOc2FKWmJNL9dCqdPKneZSnqEPY3MsrR7IwnylKJwal8DpB47R+scH
	m8Ou5QrnUM/bsdOJonfyhcAsjN81hp7D7a5DTd/ZCSnzhK/4Ff//aeos5pwRPaZI
	0l6hsj8O3x/4aw7Il+ogAdESllfc5ljMWq2dIsyFPPukw5T493xVlSDro36zK+iZ
	GjbD8A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk3af4aq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:27:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so1030737a91.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439633; x=1777044433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGgbgd9dtTM4zTNUJr6OpLpNRnt6f6nmr9bUgf0LEuw=;
        b=J7I1ge1i3gThtc/q2pZgpm5igO+ZJGsmtQMVubtC9tPlrLbGQZ+R7nqN0/4alAtd2u
         Z1VMNQfYjpNQzYljToflLzwErjBNX9oF7oVi85yVgt9CyFGMzPjSqTRr30QX9wnpZ1QO
         Yxk5QB4Wsh+VRJ1U6wKHJGhfMnkdUFgOX/W8WhKCgBPGqWpOy0DiC1v2X230fzzB4yt6
         SR4IR9R09+Zxd4EowvJBiGXIORxZyV4UcI96kcWu8Z21TrxhWdT+o4ONLAV4Uyul8QY9
         Ius67F7G0tngl5UKU2q4WSXMYzXR2BQztCnSx9MRSYJIdc3a14KQeTICsju1ZyaE0Fti
         865g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439633; x=1777044433;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGgbgd9dtTM4zTNUJr6OpLpNRnt6f6nmr9bUgf0LEuw=;
        b=UOqixYywsi9XlYk/mvp3Zdh4dqhOtakeD3cTyfrS/4rLsmheJlJz1yPzHQ3JYzecNp
         5aDKkUo0WJnv3t+/nn0O60S8GG72FpzP+MzZNqPEuc8OIgzLoAd++EoDo6Iw11B0KZk2
         3GZ11vecsG0WB33IrBVrlJmMXhPHiATCrOAD0ERZX7Dm6VrTQdQ07B60uwZMGsvDxnrW
         WU3ZZbA5uSztvW29a048pmdDNn2O8xCuoYDmcSUjkSUtA2MB/WMRx8sk1VGj9z1FXyFc
         kA98TNyVZ4o3A2yYkDpidaA9nFbyYk26AdwmOT63BDUQgga40+YxShKdtvPa1o6c3UXa
         Dt6w==
X-Gm-Message-State: AOJu0Yz3zTim1ex+8Bs66Zoi5CK6f70gbW1xG706BbfAzEIwHryJKHHt
	yw/O+Pcf9/UqojDEnWd2UjDa/cjo8KD2KKHwuhjrV4HImEpBfJxg7TQjS38LWFKuNRf0vKfDxGv
	SXiJ0SnjdZgXCYVsEVfB6molRVslds75jmx84cYTfZBhTdpJafwErgcjiKw9na2VkSg==
X-Gm-Gg: AeBDieuxwvM1wCqXqzz2CbJYL9RilmhFGxCkEETN3qKatwSNfNaHdYaVbHrdcwKc1i/
	xtIl3SnraWmbZOLMSwCH6O8Uf6LeGp2JB0Mu1GZFs643BvRMgYq0CjRiKBAW5zcPUbbsi9zkLz9
	YDRNd3H0KxWY7iYoscyTfPiD6HoEguWl9jPBZDZkgQqbTjf4ANQsJ7jNppuufxOF2hCNicQzpyZ
	1YPY16s4+dmZl3HAo5CRWNUr4K3WlG6DMdkv64aw/4z4W76klgfEPOQ6Yd0smdJ4fILBqKAJV4e
	m+Eoopq4rsk++MH3LQK0DtDp+RMm9cdW430ZtTAoNgD/RkjhOA91p8iiPVH3O0VxXCNNZvOmsm4
	1iYaxM83IXj02efUVMtsXK8na63cwDkuz2Y3IcZDhN1l7thEvEeIGba/ZOsQ25SRN
X-Received: by 2002:a17:90a:d0f:b0:361:45df:114 with SMTP id 98e67ed59e1d1-36145df0462mr906265a91.19.1776439633289;
        Fri, 17 Apr 2026 08:27:13 -0700 (PDT)
X-Received: by 2002:a17:90a:d0f:b0:361:45df:114 with SMTP id 98e67ed59e1d1-36145df0462mr906229a91.19.1776439632683;
        Fri, 17 Apr 2026 08:27:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc575bsm2478649a91.4.2026.04.17.08.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:27:12 -0700 (PDT)
Message-ID: <987f1ac3-1725-11d6-d257-9bc7192b2fb4@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:57:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
 <809e2ad6-258c-49ac-9f3b-4ced32807203@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <809e2ad6-258c-49ac-9f3b-4ced32807203@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NSBTYWx0ZWRfX/Em4SXexM6IZ
 hNEiooqHg3b1/njY0iSgjhKIP+528ua+cjhhTdAC1buffaAFqgOrOgrA9/c/mw2c/WD5QEnjnHK
 Il4/zq+DO3BjzAxx9XbWuLHRVo89Ykw9qTCQz7VdMnutkP970GohTQ6GRn8o+w87eV8m8GvBxT/
 DTfKugjexdpHdZ/DBlkZJb545GBTjtEYBQ4MXx2u86wpVHmiG238WxVKlp98gRagwtNpJDycg9R
 9BobgOYKwA/ZM6cV2xKA/V2dWgUpPeDdrXdCQUlEYYnoxJK/NgOWrFnlNzZRUm7nQqduim/h0hc
 qsueTMowEqqRjayqaVg1dOiEdF61RJajwD5l81tiQYy7kkhhZRW91XZMGtC0GnTS2ruA35ja/ht
 Z3ePZcvbBaJpoPdl9EG65Z5MuxadwCFGteRtPg73E9rAVI/8uJHcOj8s4OKPh5Onv9qlD5oH/sI
 /A0Brq/BT/3PM6XYiKw==
X-Proofpoint-ORIG-GUID: FGcFW3GP3nahW3KoxSW3R9nZ5895DSzg
X-Proofpoint-GUID: FGcFW3GP3nahW3KoxSW3R9nZ5895DSzg
X-Authority-Analysis: v=2.4 cv=DfInbPtW c=1 sm=1 tr=0 ts=69e25152 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0AyAw_TJNaHdl9VPQ8YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170155
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59028-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 192EB41CA8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 7:39 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> From: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
>>
>> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
>> or QHEE), which typically handles IOMMU configuration. This includes
>> mapping memory regions and device memory resources for remote processors
>> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
>> later removed during teardown. Additionally, SHM bridge setup is required
>> to enable memory protection for both remoteproc metadata and its memory
>> regions.
>>
>> When the hypervisor is absent, the operating system must perform these
>> configurations instead.
>>
>> Support for handling IOMMU and SHM setup in the absence of a hypervisor
>> is now in place. Extend the Iris driver to enable this functionality on
>> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
>>
>> Additionally, the Iris driver must map the firmware and its required
>> resources to the firmware SID, which is now specified via iommu-map in
>> the device tree.
>>
>> Co-developed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
> [...]
>
>>   static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>   {
>> +	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;
> Maybe:
>
> struct device *fw_dev = core->dev_fw ?: core->dev;
>
> and preserve *dev to be the main Iris device?

That's better, ack.

Thanks,
Vishnu Reddy.

> Konrad

