Return-Path: <linux-media+bounces-52003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JFkHPyCgGnE8wIAu9opvQ
	(envelope-from <linux-media+bounces-52003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:57:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F3CB4E5
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DAB33017F94
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102CD35CBB3;
	Mon,  2 Feb 2026 10:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlSP/4XY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U71+b/f5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10028333438
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029804; cv=none; b=Z8Ky+YSGbZRQMw8M+X5m+/+CrlrFNKMbPl2Yf2QGLzOv2FI8CLQIEENWHXHg8RlSnRXx6AmXCtp4etExcMy9nyIHWqx/iyvYMQsOkbNzdo6y/w1d/Fc4ttiu/QPNzamqAC9ueY5la6Yuo7/AWoUFdx/NpIxUcl3iIV+HUUrgyQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029804; c=relaxed/simple;
	bh=q66RPD2oOJwfCVDjgotrvDTzNwrnipJAVBK9XKsirOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYvXptBiMomvnlTPrvLuV+svCLurapFH+aFhVRSysNUIOmTC4/Nhnrt3fDUNxXXfl5z3iIrfx+IqHh3SxA0xoUcFM6O+Wi4O++voI/CQm4+URbett3PW5Et+GGlKJS9snkUcIFIn8wWNZw1lvvICXM7VxGyQxg4xf/tcLGDrIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlSP/4XY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U71+b/f5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61284Toc1997319
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7w2p63ZPTwKUNcs0zkPpFjjBdO4n5Is3TFmtV2iGM3w=; b=UlSP/4XYPoQ9fx5v
	0AvNG533wA+WA3Ye78zPpERxE0ShGNyad7qnrA/W0pFr5MEUVzvMsoitzhRfbL27
	NcpUEq7sczlohdSbVIfOLo1qWNtbz5egH+csgU+5kRBNmEmOX30WMvsdhxIgHCwC
	9JvEP5U6edT2Erure7Jlcjcri1knST/85JNU565yFeaONVSY0rOcYHbkqUD4kEKh
	n4bhfwFO8/42oC0zhn47geVyi/kAn6Fo2HQyaiD6bqQ0exR7EILFEE13JRjxp3FN
	g8y0uro5E7Vua7cEO4epR5jahs99y3TqNeeG5s7oPDNGjs0BOq1sCENFDD2SedGT
	0Jbclw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnn5c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:56:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7701b6328so115346295ad.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029801; x=1770634601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7w2p63ZPTwKUNcs0zkPpFjjBdO4n5Is3TFmtV2iGM3w=;
        b=U71+b/f589sFQeECUjyknHKaHe7FbkfFZJLq3FbCLMxpKxPi7ojkwfcLGcc05x0uXp
         DHwvIKARmuKUwTkM8RfQwxXvkzLSIyM6aBVM0Qkp2c2GOs62rWTGh0CTM4wRZkdUu8j7
         Sm44DXXBZoPzjucqH84hvKSwX99YP6TpEA34Eb7w5tswlZXnEJVAGPhJT4pqr8s45naw
         ixw4usjwLG413AHACO5aB4dOT0ByGpuTrGRNvQE5ZS7RQFVJT/EDJnTz8z5z3qQeO28K
         FRBhRrZf0SKZguyJtpzNGftG127kheZ3VmLlEhD+hikonamczAxPJFZRQjAidmD4m2zf
         JhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029801; x=1770634601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7w2p63ZPTwKUNcs0zkPpFjjBdO4n5Is3TFmtV2iGM3w=;
        b=V9s4l1NyrDgBBIaY/JBG0ZqKJez3eCUqdnLMttaFi+5Fg9IzYuDPiJekC3UfZMO76Y
         s0nFlKc1hkPsFciILrtueJ/6wxTUxHZ5CeOoxbwcswLtsuhBUNLnRMsY3wDcK6KCVEn3
         F3raRXZXGJIG9PwdXkF2dXSgiZkwG7ryCv7kAcoSEvpNvQdw8tcoSAYZJcxEch0SbgRc
         t92lmPPliFEe0EPhURgMyl6aRcBYTP2tmL+rc0U2ZBhRf+Twv+bIpOhD5i6t9d4+Hysv
         vGsc346dmNFpDvi7Qf9Hmt/XFFaw6Ct0wGj3azwvYL188QlFM2PORc1z9/8Y1DvlJ+OJ
         056Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHR4XXWfywS2sh3Ekgbi8Vl/5mQU1Y3wEnKzskHc0I9T0RwIuXo/xhJ08BOtZXNnaZQK61aro9dkgAog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuvMi8V+4QoRi9c8cOqnGsnSK/60cBHbXk+PmiKFhpCKOS88DD
	YMQKMUWZoiq4a0ciUQNOwfNkB0VEYcvODlCSAa/XyYzE31yWoE/OCDWvQ7sWYcSV8KUnJSdUc6H
	b3fLHzs5PI31GBGQpJ7Ca59B5imlns9ZW2Kvukf5YvgMFSpZbroUORLnFWQZWoJ88VQ==
X-Gm-Gg: AZuq6aIbApOLEm78fxPIOpTKn5Z8O3xxVsrttxVN2P1P1MgwOyM0AJg59xBhQQnk4yb
	nOoO/41GG6u5KGDFudO3GChgDbzlJnCPLePDyQmOwVc7DztC0Bda4iBUUG/WyJpc09LvmeJZoX+
	IAuXeZzqvT6gI1Hi1OvdKerkpMt+XpSXr46a5oPGTUhyLcG1DAucZjzO9pt8HMJvMyGgMAgNVMs
	YUcF7ZGyfRecZXr/V6QsZUK0q5UZIbizMQLLIrjXF2bYUCjWw8KZqiiiSaObY5ba4pbyT64HV4/
	eRL6cs126qKv9TwAZemGYdChxYFVctaRCfhy8Sbp8G0Vr4eCJ3RglQG/r4rU42nTqb9u+xglIT7
	a1JRakQk5lYbexgxFUlEuz0Cuf0M/gu2xyheXiGH7kFd8
X-Received: by 2002:a17:902:f78f:b0:2a9:410:2400 with SMTP id d9443c01a7336-2a90410270amr48497815ad.28.1770029801015;
        Mon, 02 Feb 2026 02:56:41 -0800 (PST)
X-Received: by 2002:a17:902:f78f:b0:2a9:410:2400 with SMTP id d9443c01a7336-2a90410270amr48497625ad.28.1770029800618;
        Mon, 02 Feb 2026 02:56:40 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b41390bsm141408555ad.23.2026.02.02.02.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:56:40 -0800 (PST)
Message-ID: <10ea031e-b803-4a4d-a0fb-c18a34b37e47@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 16:26:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] of/iommu: add multi-map support
To: Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
 <hunwsdkmeo6efpv3yt3izkgmarelnubd74dywj3scryxrreq6p@njijwtoyjh46>
 <78ffd1ce-5408-4bf5-a782-0c4ca14017b1@arm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <78ffd1ce-5408-4bf5-a782-0c4ca14017b1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _yu9W89EM7mml-6HIcjp0PHzeRHwSoj_
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=698082e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dOfmg-3FkkVntAroJ4EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _yu9W89EM7mml-6HIcjp0PHzeRHwSoj_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX8gA+zPDMZXVs
 t8WrAnc1pTjeFhoSyoKsuJwVEIts1cV8bEmbvvDDvdAN5tzpbZNS2/dikKvqh1zVCEy++fbPine
 m5+u5uYPNWlX8HeO8sJSeT4yWlXQUsTQnK2b3STLzbr1Y/vPjh03iwaR9er157cVLiybShTb62Q
 nZPbkqiSCWD0qFX3avFBF6NRtABfiXOKPnXEpkeE3xlnwZrhqsikzsDpXWcgdCyUwoeC0kwp4Yl
 ECcBQUiH4oudoe1YV3i7r8CkWuRvzpILq29Ho4VwE61fozHV+PshBha1ky2FLc7cijURjcAs6Ul
 u5jYVfWuMBXA29INKn4fq+lCHVkieOgs/THwr43avvHFxR1k150QH+uDrQhVdZanJnQgQ4KMbUm
 7BlDntphuklz09LKRLpgAoY+1G/erUs8sotWT/3zvYz+haQZRQVJofWijEepclD2f/cD39uDmkS
 9upnFmfOn4p3+7eZHwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088
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
	TAGGED_FROM(0.00)[bounces-52003-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E57F3CB4E5
X-Rspamd-Action: no action



On 1/27/2026 7:50 PM, Robin Murphy wrote:
> On 2026-01-27 11:45 am, Dmitry Baryshkov wrote:
>> On Mon, Jan 26, 2026 at 05:55:46PM +0530, Vikash Garodia wrote:
>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>
>>> When multiple mappings are present for an input id, linux matches just
>>> the first one. There is a usecase[1] where all the mappings are to be
>>> maintained in parallel for an iommu-map entry of a same input id.
>>
>> This contradicts the IOMMU idealogy (at least as far as I understood it
>> fom the maintainers): the device (driver) doesn't control which IOMMUs
>> are getting used. Instead _all_ defined entries should get used. For
>> iommu-map it means that if the map defines several entries for a single
>> function, then all entries should always get mapped.
> 
> Indeed there is no concept of "multi-map" - if a single input ID represents more than one thing then that notion of "input ID" is fundamentally wrong. A single *device* may have multiple IDs, as in the case of PCI bridge aliasing, but in that case there are multiple things to map.
> 

vpu hardware do have video decode and encode usecases that would generate multiple Stream ID's.
So, all these Stream ID's would need to be represented using single input id as mentioned
in dt binding.

Referring patch [1/7] in this series

iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
            <0x100 &apps_smmu 0x1a20 0x0 0x1>,
	    <0x100 &apps_smmu 0x1944 0x0 0x1>;
		
Here, IRIS_CB_NON_SECURE_NON_PIXEL [1] is the input id.

enum iris_iommu_map_function_id {
  IRIS_CB_NON_SECURE_NON_PIXEL  = 0x100,

[1] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-5-e2646246bfc1@oss.qualcomm.com/ 

Thanks,
Vijay

> Thanks,
> Robin.


