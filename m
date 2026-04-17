Return-Path: <linux-media+bounces-59029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKfxHOFR4mnx4QAAu9opvQ
	(envelope-from <linux-media+bounces-59029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:29:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91241C9D6
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED659307B37C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 15:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD03632939C;
	Fri, 17 Apr 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oi6Te+Y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HydNxlpw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F773327C13
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439734; cv=none; b=tfW9fXoiECKGe5wFF05+xKgZiUpfFSQRph785GZHWCeVNzWyoC6mkklbUx+L6K1ORWpk9h8fl2ackQJ+/an0G8RGG6U003ZIA+MqDDWqu514p5UD0WWghKnxZGQ77G52FXd+RIoc6OFPcfu/fOB71bblOda3uXpBGlAjwU2QvtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439734; c=relaxed/simple;
	bh=i77yRE8WUhFEs7+CBpzlx+r5MC6ikp723zTT7FvNvsY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o1FePCwCUG8/JlKsXNkVE3KCreHO/Pduq5pvfP8skRYgIw38DRRQZG+U5WEBVEc3eFNoXI2/nJd0MwXhAkytSRYfryqyJicGjD7QsMwniSH4SXwoOLgrr4HgWupae6XTJQKHcupTLHHRQ75sRT+MbnnNUDs50A2y+jeE52grtb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oi6Te+Y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HydNxlpw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HEt8tk1981934
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=; b=Oi6Te+Y4gE+h0ub7
	y6aiT0wkH1YE3pSd7X7Ii27zAY28xopCKQ2iKgZRr2E6SRo8QkUVJ/+Ni5SRfIDX
	yU031UGE+uu+vU0DOnu/Q/N19ULH3dh7Opl0eGDK3cPr5Sn3vIIF8mla8L/BXsw/
	CPfJScm8mdfCWW4woWqKudKGRSeH66BjgSb2hEtGZvcEtMECVaTATqhnKtEgP1U9
	Qk/SjyAFQKKRNoXCb7zvwC8cT+aaQOV6Ly4SbRFObHEhfjIrw57aR+zqaF90BkAH
	AGqwmKriE3TxwqSy1Dh07XRxg1br9hsrYGqP0MTssygjLus7onGHP5mjHSOxPhxX
	0AEFaA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jkxnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:28:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so943976a91.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439731; x=1777044531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=;
        b=HydNxlpwja+/pvZkZEbdMf/EwdroItGwZocSFOT74slwHFAznCuDZkwUUTFz2xvLii
         M4+3wLeTQ+yjPZZbP4/gba6wAsg1B2uGVC169a42TaRWAmJxt0ZPjPMMO13efbkSE6Mr
         Nq1UrCh1jSUEzmNTeNXaMd6gDOu2BqVmiBmlSmFFponlssszsNIez0fxAsmiq3wNU98M
         AJxPsyvElSQJ4p0Iouaf1scNMt1GjCY0FHl7SO2yGbzraeERBY/3q22AW9NPdt2FWGbf
         2kO+9WonmdkNlHVks+u6roGOvKAiv65kbyo8r3Z/NHL68cMoLXZox0fYX/H6kSyfeLav
         3jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439731; x=1777044531;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=;
        b=ladmjFf8md7KJLUvzBKiAobMPmPhJCPS85wWDH/Pl5x7AvyqaP3b6I1sR4xewI09FR
         lvAaZ3xmkuQSAYGN4eqfe4dadrZE8czU2UObsFCfYlMCeRq1xgUBwq0aKhQ3CVQI09r8
         pALVBp8K9HDL6uqmLQnCQMDJI2D9wT2YpgpWviTDaFJAtbz/+Ksw3n8fDPQnXYv5qQnx
         spzpTAeAnCC0SnO2HUfhuKlDz+IxTq62yvKFGE9ptEhH6QAik1RMH2v3ccFJ12i0icaJ
         Y/32VEd9bBpt06udF3tSDm1dc0C0yDcIF2yHXnhD8bfzQYVN2xWHdITAN/tlKvCYQwZW
         q9xA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y4unNPgQNvC5Ig8AgMGS03/Wsh6dqBxoyNoUErh1tiMQV151RAeYrqoLaA7DM9ZLpbP7mSFaXKqGifA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkpVUOozqVel+e008h8a96RmI6KoojKLIqRMYIhG9tcMUbPt5
	mHjGehMslKuZ2yB3AOOspH92xOj1tBk5uTsuO9PXHZS/gsCixP/IjmaatnX2tNvAphAggvo6BZZ
	5ZMIY0qv8/BSu8CnIdN07EB740ZIt8tYvh4r6ZdtMZ4VAzJieu6CwkOk/UrDAS4G2AQ==
X-Gm-Gg: AeBDieu23+wOSFI7NSlEixdipg2dUPciIUVRs97N44HfcSQ8jXpG98oEPbzQGQFWE0C
	Xy/oaaME0GY7Lcoznn7JxWnreMyYduwBLLQ6byaAeUucfwlaVjsTd5UWarbyoFquMeAZU3/ZMeV
	GJAYs4Lyid5jQHX5liSGtYUikgGjuL0N4YwmQgov4OwXrbGHdRFieQrjKKv3hjnUHyZNCt+lpbx
	UrNDmChV5Es7/yoYV0eGKFvkRl9DhxK3jwcdOUfc/VLg3I6wHpKf/1iQK3oPyJh24qvzD55UuRM
	6fvYmkwBBPbJGP9CCLTX0lKNWBs7VSlvficfdYfCh1Jpqv4cyeCmDnO4xqOrK7wF9u1IzZ/Boof
	phHVa0j8fmvCTCsz4C30DloPpoomrxYSIEzH64muVfc9DREHBw5ZGZImy4z38f82L
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr2683456a91.5.1776439730732;
        Fri, 17 Apr 2026 08:28:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr2683418a91.5.1776439730131;
        Fri, 17 Apr 2026 08:28:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9fbsm3284378a91.11.2026.04.17.08.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:28:49 -0700 (PDT)
Message-ID: <7cd1a0ff-53be-7eb7-7de7-420dd1ae7cf4@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063325.f3yag6gnmaysddkp@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260414063325.f3yag6gnmaysddkp@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e251b3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Xy_6AgtP5T3jK3p2aAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: R4TmGlAGSlfvkwFnTT6Sl6DlqpntKsCF
X-Proofpoint-ORIG-GUID: R4TmGlAGSlfvkwFnTT6Sl6DlqpntKsCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NSBTYWx0ZWRfX/NfuOvbAOe2b
 yMex0/m+BBwA2HCzyxKsPFltYRS+aZ4HTro3aWNNL3gOPtPQJhcerIybYiGtFcO5Ykrdr63UKlS
 lgVg2o6KsICDbX1kxS/H8LrldgrHl2kml+9cJj6cIqTqp8OcX9TqF8h4CfKAbivyX0dJhqpwAe+
 9ZhCSBcnzclBUvQFVobEzFXmi0c0jo9iSzdAUy19XRxxOHSj8ofLL2qygFZLq+/a5ddCm784sK0
 snsuBBuE4r3lFiDNWhulimMwjTZTiplrWQnVdpOTxzpLGyyradh/ubOtav1xR+WBtyi6B7aWaFl
 +Z66W+JfPHgeO/yJqehyq7ClKA5KmnwTfNVB/9OO6ejvxBLzuKEly3OV+lfOBpHMJtxwehiQ0Xc
 5xgC3jbmm88sOVYe8529+pb/RxWdkExjCEJJook+HqXjaGE7j2J+Kyyj+aYtjuiT8Mw3aXnTXmq
 v8cKa0lZcxfiV8P1mpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170155
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59029-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA91241C9D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 12:03 PM, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
>>
>> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> If this is a fix, should be the first patch in the series., so that it
> can be applied independently.

Ack, I'll move it accordingly.

>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 548e5f1727fd..bfd1e762c38e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>>   	iris_vpu_setup_ucregion_memory_map(core);
>>   
>>   	writel(ctrl_init, core->reg_base + CTRL_INIT);
>> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>>   
>>   	while (!ctrl_status && count < max_tries) {
>>   		ctrl_status = readl(core->reg_base + CTRL_STATUS);
>>
>> -- 
>> 2.34.1
>>

