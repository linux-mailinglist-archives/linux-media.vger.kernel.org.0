Return-Path: <linux-media+bounces-52978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJdsOaRwlGk0DwIAu9opvQ
	(envelope-from <linux-media+bounces-52978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 14:44:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7114CB9B
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 14:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92F8B30046B2
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354E336AB79;
	Tue, 17 Feb 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+eExs9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQwU5ez0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8BE355039
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335832; cv=none; b=FL+1dPKRJX+mNmtU3g16gqqSxq+1PyHPVoxXfwUFTM7IkTaLQOPgns9+kLU3XP++Ko5VFtzB6vllrAWcuP5sLR7lqnQhIGiaFCBKitiiLAFtscK8J0fnOocELazsc93sNHkPYdk5T6NObdHQLERHH8TPyhsP8VrtgM27rkRDBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335832; c=relaxed/simple;
	bh=En5rcXsu0Sg3nwqT6oI2lc7tr410B+YGJFZy+mJPGrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEy70sXG8Dlf5tuar+Y8D0l8ZSkD1hX1lxCTqA4PkJj43Z2XPGZoyWuYJQIJAJ1QRVFsABNLjkNhA3toGg84ApovdZjYZt3bcstOakhzctjX+BdKVOFZJYUewgtcRXUvZZkMP0kVN39tSNf3CTjQJhCCCBqOi/KBj3FBF5RoLnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+eExs9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQwU5ez0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H4ENKg2960656
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FIlG1kC6o/WTPSLRgURjMIM1d/Naj5KT0hsIvFpSLA=; b=B+eExs9p86C1dHeP
	B68eEXvrCm/BEIaDYxHDdNawbT3HYWomtDHiPRE6MUPCxaZFl1p0VK4ozUXAxbF7
	ULTPouUYBCJj/MQpx9Q3+5Xz+yskXREgxZZCqnmNA5k5G/NpgLMP/TdHe7sgTOMM
	1T9D0fkuS6HZSR8f+9X26tf6/DBifaaU4sjRZDaJSUCNtPszAwTj3n9heMkPltWK
	c1s+7a/TiD+zcDjOXkckT1cR2omQYNiJ/F+zEygdER9myp9NylNfK0vcXvEo9TXW
	E9RTcjvRAQ1rEcs5Mxb8b1gAkz8uTFcsl6ETIodcaC2nu65diBvakIv1Ns7HzV/k
	kfhwww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmaefe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:43:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a946c0e441so43247745ad.1
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 05:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771335829; x=1771940629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0FIlG1kC6o/WTPSLRgURjMIM1d/Naj5KT0hsIvFpSLA=;
        b=YQwU5ez0tGUi13aPUjj/1vp55fBkwY8JYwPu2p0mIFbn5UqtHxtSE3KJzUaoxU3uBX
         TI0KDwE2RJzTpCH25HBvzfx57nWZKIoUpe4WJ+8uh93ckFow/vXM0DBj+qY5ZloEMALK
         FzS3m19mcfdSeb5XD+DyK5Nu5IK1InT7c5kKOuLZHlZu8zpkQuR8WXy5/bZTBNt4wFvj
         A0ekE9u/kksbcwb63RJ/l8v7FiAHV1ansN2rb8yn416Wz206fthMFfkWOf238WnUt2y4
         FNRQ1nwD6hogZCGYDeHdj0+MazDsOY4z3wUuceETNEsmJy+0XUHd2PuCgJAhQOD42DcK
         AYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335829; x=1771940629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FIlG1kC6o/WTPSLRgURjMIM1d/Naj5KT0hsIvFpSLA=;
        b=ll8fUINECDN9Qzbn0xB2OtxiW0bM8KA6o+stwQLi3Uakd1Mt1eWSZUK/vUgZHonEcl
         Xr3vXp/TomkN0xYE6W0QRt2qntGcYebcolSc4keaSqrXCR0OpSRh/eYbZ1MCnTWo01U6
         gYLOJDrhEA1jXsKl3nd1PXkDXo2L4MJEouS/uGS9+XPqxX1nh0nBcRPr9z0NFyx4QSmN
         rPAYdaEueHMCX3XlY+8f+iKPTnZmbTEyrAd0kql06aQxET4K/XZRPV86AF+ezZ/0EqVk
         A4bA3P8QG2pqzmH6w7R03ZA+DU2hmuDQok1ar0QAmJM5JGjKWaJWnfz2NjRYokbyHmjU
         p/+w==
X-Forwarded-Encrypted: i=1; AJvYcCV94sa7PARqdlpQnVum3uXVvyRlQpLxZVKwHC1lYcUZjAB00ltLp3bYfHBX+E8wVD7ZaWFw16lllt9Cgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7oGEapjsWJ8IpBsCxbVckEirJwdxIdMEo+lvcOm7Tvdt8elU+
	0Cxueo0XyP8XAnkKVHanLgBUZ1DxAUZmANfHOe8UDMSBh0fGC0wwNGgGTyFdwmND1474p88NTSu
	pJBmUVrcnQhNC9biXUz1+uu/QfTW+1Ot9O7HtrpUkZ2UEXZXJ56QXaYYalJZ5xR0Uxg==
X-Gm-Gg: AZuq6aL8JpJM4BHN2DiGUHiU4DdU2vWWvqF8y6zpdE+IV45sR/ilP71cQlctDbu3Rai
	0DZbsgUOotapc2r2R/OQaybkwwooFfSOa5CzRMYH/KObilQFqP0V6aIK9Fgg/b4akyxxH9PlFjW
	6A8Y7ZWnPM91ZKnUlKtcLjnPB9HphT2Hlca96U1QlXWVL40cPGFJio0ft23jyNPgMOYSsZ+GZxv
	SfBj2E5wKl2y7EZzUeQygRU8C5kEs72MtgRmNjWjwKRj2oPSGtyA6V3tpW1FRzwVLmlYDASXVac
	92R0fQ/3HWjmE0NLhtVu/4NGy24yE9jkhwn2kSlTgzi5cjwePrxN2ljYV+bMCT62NvhmCvKega2
	S+anZ5v8cbFRaX5m3L35p0d7OC3vgA5eTfFt7eHkj57Wk0HeVkzBm5A==
X-Received: by 2002:a17:903:2352:b0:2a9:30d4:2b0b with SMTP id d9443c01a7336-2ab505d1726mr138802935ad.52.1771335829327;
        Tue, 17 Feb 2026 05:43:49 -0800 (PST)
X-Received: by 2002:a17:903:2352:b0:2a9:30d4:2b0b with SMTP id d9443c01a7336-2ab505d1726mr138802575ad.52.1771335828776;
        Tue, 17 Feb 2026 05:43:48 -0800 (PST)
Received: from [10.204.100.45] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a713e8bsm141004585ad.28.2026.02.17.05.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:43:48 -0800 (PST)
Message-ID: <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 19:13:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
 <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GV5RjPli2lxK7tf0dBa4nXNz0IXXGJPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExMSBTYWx0ZWRfX3XiC+f8TzNoG
 p8DqDbaxGb+XaoKkQBzT0eYrSgVHCQc0tCr5lNGm2A3Vj3Vg9ldxdZFmxDorVEF3YzVHKS4JnW/
 MKBrKqGaCt/U47wsmtYy4TF3Xn1p1MBe31JZZzCwHXN3w8ggn0jWKrL3Zph/s9hxQ3Q8flfB5ip
 GX4nU30KBxjLUZc4KQfircCx2+nRfnmQ/8uGRL8Fws4rFg6urAgKKtWtN+e9u2DP5n/on21mhlh
 cvViBRDue+fZPi7NqRFcfmvkGvTAbapCm/RJVbuEQciy+bMAPw4qQ8J1LHCu0UAs3EyJTLxaQVt
 5lXG+3K3Z7UPFKIaarDnuRDf8zDmN+TKnFn26YaeOcYPEmq3pO5TeNxRmqjRhFk1YApYEA+XDPS
 AzCMeysG6G2dWb5/C0Doe7EqtyYsNb8F/uJ9RGjpwRCutlZAM3iBruKM5Ba9UHjETvG9+knunam
 UU7UXKv8TorKAX4NLQA==
X-Proofpoint-ORIG-GUID: GV5RjPli2lxK7tf0dBa4nXNz0IXXGJPR
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69947096 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=vKLMDgmPB5ZtIlX7G1kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52978-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47C7114CB9B
X-Rspamd-Action: no action


On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>    (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> iommu-map include all the different stream-ids which can be possibly
>> generated by vpu4 hardware.
> 
> It's not how it can be defined.

Do you mean to elaborate the different entries within iommu-map or to 
elaborate the different stream ids and how they are grouped into 
different functions ?

> 
>>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
>>   1 file changed, 234 insertions(+)
>>
>> +
>> +  iommu-map: true
> 
> This is totally underspecifified.

oneof would be a better approach describing the possible stream-ids.

> 
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
> 
>> +
>> +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
>> +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
>> +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
>> +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
>> +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
>> +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
>> +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
>> +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
>> +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
> 
> #define the functions in the ABI, provide them in the bindings.

Ack. will introduce a new header at [1] and define these functions

[1] https://github.com/torvalds/linux/tree/master/include/dt-bindings/media

Regards,
Vikash

> 
>> +
> 


