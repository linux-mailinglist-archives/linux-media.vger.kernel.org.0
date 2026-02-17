Return-Path: <linux-media+bounces-52982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBTRH7mKlGnTFQIAu9opvQ
	(envelope-from <linux-media+bounces-52982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:35:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB914D97E
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0D41300E146
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 15:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96F536C5B6;
	Tue, 17 Feb 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hybi/tIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TebiQMG3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95719254B18
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342505; cv=none; b=XwxSbA/flc33bs2RClq73TAI8UqUMvUycNbju/YE8ipX0HP3hAzdX8wwzm+cxJqGTcGara3he8m1jemnwK6KAXfUWrIURQhMULg8R9V8SH7w0c/rdHSpwZINOht3etI58oaRUUWiL72mMdWmDsZL7cYICQNFl0C05Dny/zmIDvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342505; c=relaxed/simple;
	bh=s/UCEVRgEYfNEzZ71RHuEOGWTZxbw6VaGhQmxYLphh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JV7o3EGJuv4fZTB1RFIbeWyUPNVG0hNeNxoCOL8FS22Cf8ji4JaO1ei2y57jzoIWocmlHplnXmGrX1TNgBtcDrD0tcmWUY2fY6h1HrwEg7OwUC/NoETSOVE5enAoIumow2pWxH7Ig4lRgUMSDBqrf0qauboKcuhDsK8Ls2dqUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hybi/tIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TebiQMG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HCFsBq1441859
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 15:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iSuBcgCjBQ+kBQhdKe5EhYzO4nkXBajZ+4DR5vCa/w=; b=Hybi/tIycvdrFtRe
	JPN8ykQ6yHimUGhtFFiwCOnQrnL/QvPtZ/TOLBbpyqdclDhFzLVSimibcODdq9iq
	oGBrxzck4lJ0m60b+FQR3iPhAB9PvKsuyamZpsMZq1nCVmNCEfrRJylllcOhtR8K
	QH/tBKDGA3MmNCIs3W0UnaR/AR9Doun/5/3yFW1mtOQBvjSXgwNlVKPkas/P0Mqi
	q+GBL4ccEZ3P15ZeWP3R8YTR+Nsvism6YGSEK891jvhsiCQnd0y3l3jh/VLu0NJK
	/3FNs5eACEComL8+ARRFfNNype6qGVjxGRwMTHWcpCyETw5t0kzboQBpoLzDeVQB
	hvfC6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9tw2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 15:35:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad5fec175so170429725ad.2
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771342501; x=1771947301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2iSuBcgCjBQ+kBQhdKe5EhYzO4nkXBajZ+4DR5vCa/w=;
        b=TebiQMG3qiIJYp2C6IbqUWMjWvPE0lFk5vt31MThSOuAaZiQbMr0KRkBvl1O8bk9zr
         QvsVnYpJzelOwpSs17PSobg0QwA0OY9qLz5f3+FgL8rUDB27e+UEsYOX8r9WdA9ZIOMm
         DjP+Q8Dg2c/BZA5dkMEx2e5UVGd4Q2YJFdwWrc1VnxNnvLYZfM8KsRXI51yjqFAGt5xM
         e2aVG40e+fqTY0Cyu3v1Q59138L/1KFhOjsq2lHRn69+Yumu8yvtc0Bcx55q6di+FX3S
         EgAdIZ8lbC32hQmOa0o1Ypm48DtRrrqap1uwrPQ+M0nqmj0kwsEBSqGcJxzmykaYfZgU
         xGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342501; x=1771947301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iSuBcgCjBQ+kBQhdKe5EhYzO4nkXBajZ+4DR5vCa/w=;
        b=aJ37JIDum+pF3t9rP8YBX1hUIX9HWExHytVIQGE8ZrqkPndthKOoIJLjNIXgeiHJDe
         mXkc9eGO3FiKJrCwCguJZU3/qrcaraCoIHN4WETJgmBbvkxtuI1s9e4E4PrJyVPvd0+I
         lPsrgCr9kjy2M3Cb7fTp6eN6f7EpA6IUiagcRcn+GN9EDvVEnX1Z4UBDbipdmX5Pj79v
         0haqZmEterSrMOVlV+KOwNensBQ2vnFE2pFV4NoyqyAb7uBoGTA4B9nBx3mGnp0jCNhS
         Ucqnis6nzwvxFUGz4zyl/1R+ZnD5N7IiuS+Oyt36BubOIMRQsVqSFc4Lov/JV7QFoSAD
         ds4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPEOkNrvWJcYE2dLoI94/J9W8an+Y6XbrqJRH25XdNwgCdzSUBFtaWNI/yXmDh6Q6quVoSWlNRSHesqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgVuLEp4qjhinuSeBzJJ7L+0WFVTxNiSVthFwV6Dmr4Vd2SHNu
	h8tctT3m1kIvr2qaCtTMubOPfRvp/06g96efZ+pEQiONFuFEhoD1Z1OMEl581+5B/cU+SwgJlt0
	f4xg1OjUJZgdl6CVmd5WHdVdlE+cZZwGzM4e4eV1q4u5PiMV497JVkvUL07eBxXZh1g==
X-Gm-Gg: AZuq6aJph7VfsXomOYqUnkED+aleyGDIp+miRSw+2EbOIF+DwSFpLf+jbacmtIJtpSU
	4vZwHddfi4oyxpKTJPj4biAYeQgMa6DPhZ6u/71aVuR2m4XK86bJwZac1n5bAebOkFia6SWL19N
	2LcGD6t52AILO2e3E49ylzTf3KrOYZ4lDBYRvLB55Us2fH2vgEddattoqeD9ue2So4yTodTee3f
	nTEThQcFDrQhYbHyJOu4Jy9NGQf0IJDdzw2k0wLFEj+5ghbhsCduQIpXGlh5hNpVo3qeQUr/Y9A
	4WPy1vfdtWx0CNScrS0kVhn85cXOb0piW7rau66+mdI7jkxtHpCDEf0SRlDbc9sFvWeRaXvVMpW
	xVYQayMJCshJDqHBcTFQR1jSWO9XAzee34SvHmx1pVuhzoJZI6huixw==
X-Received: by 2002:a17:902:e787:b0:2aa:d11d:5c36 with SMTP id d9443c01a7336-2ab50598a38mr147079425ad.30.1771342501434;
        Tue, 17 Feb 2026 07:35:01 -0800 (PST)
X-Received: by 2002:a17:902:e787:b0:2aa:d11d:5c36 with SMTP id d9443c01a7336-2ab50598a38mr147078955ad.30.1771342500876;
        Tue, 17 Feb 2026 07:35:00 -0800 (PST)
Received: from [10.204.100.45] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a72e444sm112400885ad.34.2026.02.17.07.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 07:35:00 -0800 (PST)
Message-ID: <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 21:04:52 +0530
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
 <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
 <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyNSBTYWx0ZWRfX1Ci3l6fgGtTT
 66hZ/9qRjx63CJGCfZ70yJBE43pyGdDA07b0w78EcWKRHZ0z0mjf6fi92M8126faezWNIh9IGTJ
 vMQRE6lW5jTUjXfMchKfu6DqSk5N7oG+oKyCKiGspLrYyO06Kec/Wb1nzArVM/wD0vcFZCWx2Yc
 KDftl2oAmfoMoti5MhBktnqgqsjiDpx9be7bZ7KQCA6ujxLSCoW1mOFsvuU2r1YnIKM7vYVrm7p
 B8meFurKMI9NFZEuU4+6/UO1gq47JmiJEiOa9t4bwcD3BSjTwfDGeHXRDkqnmTDgquz5Anx3aZU
 CT3/yyF+0iLf0iUuMkeOjkkn6GpdU1bWPKVGw7OaY3FQGAGdFif3Bf0oCxRP3vm4nHkkS+awPOY
 rU4bvYJOedSM0OLeizZBYPOKISUDELAMa5BIils+Y2TzCcYGf+6fMoGJs28v7oPT7TwAxiipMCX
 z/z08+Dqw+kyXJso5ZQ==
X-Proofpoint-GUID: 5J2Tkr9fVvY0RScxCDsGjRPKk9lFRcz9
X-Proofpoint-ORIG-GUID: 5J2Tkr9fVvY0RScxCDsGjRPKk9lFRcz9
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69948aa6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=FBmHkFZO9mc88S3EoQsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52982-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35BB914D97E
X-Rspamd-Action: no action


On 2/17/2026 8:06 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 07:13:39PM +0530, Vikash Garodia wrote:
>>
>> On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>     (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> iommu-map include all the different stream-ids which can be possibly
>>>> generated by vpu4 hardware.
>>>
>>> It's not how it can be defined.
>>
>> Do you mean to elaborate the different entries within iommu-map or to
>> elaborate the different stream ids and how they are grouped into different
>> functions ?
> 
> The comment was sent three weeks ago.

yeah, if you could still recollect, you can comment.

> 
>>
>>>
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
>>>>    1 file changed, 234 insertions(+)
>>>>
>>>> +
>>>> +  iommu-map: true
>>>
>>> This is totally underspecifified.
>>
>> oneof would be a better approach describing the possible stream-ids.
> 
> oneOf of what? It is items with the definition of each item.

something like below,

properties:
   iommu-map:
     description: |
       List of IOMMU stream IDs corresponding to hardware function IDs.
       The number of entries depends on the SoC variant.
     type: array
     oneOf:
       - minItems: 8
         maxItems: 8
         items:
           type: integer
           description: IOMMU stream IDs

       - minItems: 9
         maxItems: 9
         items:
           type: integer
           description: IOMMU stream IDs
> 
>>
>>>
>>>> +
>>>> +  memory-region:
>>>> +    maxItems: 1
>>>> +
>>>
>>>> +
>>>> +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
>>>> +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
>>>> +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
>>>> +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
>>>> +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
>>>> +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
>>>> +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
>>>> +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
>>>> +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
>>>
>>> #define the functions in the ABI, provide them in the bindings.
>>
>> Ack. will introduce a new header at [1] and define these functions
>>
>> [1] https://github.com/torvalds/linux/tree/master/include/dt-bindings/media
>>
>> Regards,
>> Vikash
>>
>>>
>>>> +
>>>
>>
> 


