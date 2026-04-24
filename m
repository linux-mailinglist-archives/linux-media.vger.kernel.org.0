Return-Path: <linux-media+bounces-59540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DGXBjGd62lFPQAAu9opvQ
	(envelope-from <linux-media+bounces-59540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:41:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF3D461597
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5BA3300751C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 16:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F7A3E2749;
	Fri, 24 Apr 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTSqdamw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0R/qiQ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D873E1D02
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777048877; cv=none; b=bYRQTgaclBqgO0Pn4EauRYpM0/SWKKX7K+5BBrC4h9pwdcYSrBnmyA7Mn18PBHqTriBM44k9huAVHLyS2nAW6qeVTzmI7AOj+JBM7+WlJtel4R8KBP06dcxl2cMClxNT406grUjtGM4qQuBFYE0EZoY+euqzMok5BPuzVcT/uwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777048877; c=relaxed/simple;
	bh=jQ/5iV3NcxNIjNq4NJAWgTrBlzhII3dS9XKJUKy6PHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDgflvChkhPrtf1//NM+BCDYoJKDuqx0A9r64B7+sxyCwrx6LPc1kt3OYHEkT7x2El+oep8NXLmIsS5cSoTPy22MOe2XLG+JduW5xMBU8LGnKONoGPtisJJ9RWhJuBlWnMuG+4NazJWDwtYrnDISg33AEnzeNE8DXm1phXN3XQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTSqdamw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0R/qiQ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAfkPb1959136
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eltpKz/vHGzdVltnYjt3RwZNW4ucKi/6/+2SCBIudcA=; b=dTSqdamwixelTx2H
	ATfV1RW82rZYb+yMxshg5gurfKGBenY2S+4490x+DvVDwjno5hT+bINhtZv2zuoa
	p4bcdkR0uUEO7w8JRUTXuJM+V12dn/3GD7bRVab9LrGH4IrbzLrmtTQ9qRh93+cJ
	YJFuTzbrYPF2155OeQXvoesjaP0q58uxifPK1za+Ir5D4a3/XGwGZN7tw9HBdrcv
	6I+DtZdenGYWnjAKYHNvgAENWGMNyHXFWayBdyFZxRDAm4C6XJIk1Kopu0jw3yDJ
	QbU+kCBkpiSDoYyO03JXXlrnvby0iizFtV0/mlrtBr0Mgbf1WwtnE/CGsC+bF1rV
	UjCBUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrjp7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:41:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da86144daso7911666a91.3
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777048874; x=1777653674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eltpKz/vHGzdVltnYjt3RwZNW4ucKi/6/+2SCBIudcA=;
        b=H0R/qiQ/UFr4+5Le8JpgtFHjPSlwlYCaaVQShxX+Lr6AirgA9PaIZYmmN2cyLUChW4
         IN7yjqjcCsgCr7MDeaQZDmGcLMguWfR+KtYHGjuTT4WVvcDolGSSAphTtxIfejY6a/b7
         3HILALXkjffRjIdOe2hJVD5HhcTHipr7+QhzD4vBpaMztAIOTQrgGNXDRh5E5srGZvY+
         v1V6zXahYpMLMWVHMLHY5uVMkXvlzxll9nojs/olF7u/ZAuipWLAkBTjNytkHgeQ8mVe
         Hl+u+HXIEb55gxZvi7eSUe+13gRlL93bmBkE+hN3TXVBIjRPIPf2pPXmlO+qvi46ak4z
         szRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777048874; x=1777653674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eltpKz/vHGzdVltnYjt3RwZNW4ucKi/6/+2SCBIudcA=;
        b=ANacl2Gp9FTuSanHUp3ViENo/OHfGfUsv7Gr9MBP1/U5YPYTQ3Ymd4PFK33OIdN+Vj
         v6l3uheCCfaDRvl3eqJF1LsqabUjohywubOf8OGQp0BwrqYB+SarxRsAkBOH8x4T7iee
         sIYISX8ByYGSK+B/MKoP0wNyFzwsVellZyC7eY1yDaq05A+tPnLmbAAT/Wz8yFO4D275
         FiLW0J+dFwcrwrzU4boKPGaMSwFY4uxtjILcbuZ2KVlGOu0Gx3hf+CV9KCGvVZjwwfEZ
         eOJ8lKiZcWMDS8vTK8i89m1UfLUKSQ/L0izKUDo4/5YEQz0yUNUQIaPGo4K7I4bmJxxB
         UDfw==
X-Forwarded-Encrypted: i=1; AFNElJ/pEExA+XVaS5uq48UduGd/mLvLPSq2yEksJUFzoqdm31j37u9WqgEQLrGEFPVHpJ4PDv9dZ3ZE0w5/mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc4s2ae9wXPYV7PFI/RhhebX5BJctsYOVgaFeNrwRsi6MovuD2
	1i69qckLOAeOsvvVx6giatCPHoPplQgS6vNOLCb8Nr0noKuFayOa3O8TYwOYj7tALBuf/+u1TRu
	owlQ7vXi+PX37Zef35ETeFOpfB0lrp8R1LTugT5XGHEz4Uo8zKCnQc6uNlhhW4sgprw==
X-Gm-Gg: AeBDieuHb2KwZ5Qd5ndZE3wl9oM/NhDanxTbJ8p16xGjnLYXNyuDuSgNDsxWkriyNOz
	d8PaTiAE90+viPQI1lZfcqZw/8e8pDVfulz2A+GQ19lxEKv4RErBwpW1sxzi4qsXpMT28BY/TTS
	Ljnky4VmKCfjfMLHJ5pz8QDlu+WkjCpi3ZDQZBms9DTfKbB7qIXxRMI8rb+cFbcgJMBk3TQuV07
	l5VMdgdz23lXG5r/62yYw6cEXNAjgfzIWnn+dPg+eHm6rqiO8U5Mn/ZcqXk1y4MMs+LQxOJn1Xc
	RRrTYs9noIS5Wl14Ea8Ilnw6LxDxSpTzf3cbQAWh74zvgy7RA5mbX07yEuk6pHxw0WcmBsEiV97
	0dPbYL/WuwaePVeEp8Zk97l7/zz/9/mTOW5YbMZEemJHLyP2W8M0yaw+sAjU+paZ6
X-Received: by 2002:a17:90b:3c0f:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-3614046c9f7mr32840182a91.17.1777048874068;
        Fri, 24 Apr 2026 09:41:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0f:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-3614046c9f7mr32840139a91.17.1777048873514;
        Fri, 24 Apr 2026 09:41:13 -0700 (PDT)
Received: from [10.239.60.18] ([106.192.26.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361418c3944sm30414672a91.8.2026.04.24.09.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 09:41:13 -0700 (PDT)
Message-ID: <eceae566-93da-a0e2-cac0-1f5abdbbe661@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 22:10:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
 <2026042422-deem-chemist-8d0f@gregkh>
 <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com>
 <2026042428-blemish-helpline-7d8d@gregkh>
 <1e039dd5-da3f-19b2-ef98-29e64fdd925d@oss.qualcomm.com>
 <2026042442-luxurious-antonym-f20c@gregkh>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <2026042442-luxurious-antonym-f20c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE2MiBTYWx0ZWRfXxob8shDumL8E
 Xzq2ec7viskdzIRKTJVfBkLYhsiAY/tixi4qyteKZr7bw++B6v0Wm+9PXy9tqomDa+6VFZ4qqQ+
 pN7TAvpjKU5AWyi9+UT+T6uIXyRayfBjYuHf3J9LgY9URmXgRgkN9/6MMM+d4YgPYnbNT/xy9au
 npf+WfttAo6m0o0BxRpZQa84UuFC2kvOvQat3/O+4Fdaq5oAMbQxVgskpcXotzyXBqrG90IF2Gh
 QAP2YGBbGDifNPAIHd21qmCTMTlmvMygzwLfVBWQXb6pqrEn7tUCmwEw38yvhpi7PftffsSd409
 fe922Y8lqGrPc7V2NKwE9aqNKGrVNgEWobLSAghLEJRGpSiB1/Sn1/JI1djdF5XFPdgvnIRr/uD
 QuNojEx8mwxYm9uueaM48GAEZRyr0tZ6z222Anis3lXUfoR7hzfNW3bGYSOkWwm9311DKvhyYKy
 zf16/bR3L2jvmVvHDWg==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb9d2a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=K3jt3zD9TrcZs+Uyli2v9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=TCXhiZJuOe0p4lytgSYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 8JbxyftmvFIOIE-zLikcK0uFVe-g2Nkz
X-Proofpoint-GUID: 8JbxyftmvFIOIE-zLikcK0uFVe-g2Nkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240162
X-Rspamd-Queue-Id: 9EF3D461597
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-59540-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/24/2026 7:04 PM, Greg Kroah-Hartman wrote:
> On Fri, Apr 24, 2026 at 06:12:09PM +0530, Vishnu Reddy wrote:
>> On 4/24/2026 5:25 PM, Greg Kroah-Hartman wrote:
>>> On Fri, Apr 24, 2026 at 05:15:02PM +0530, Vishnu Reddy wrote:
>>>> On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
>>>>> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
>>>>>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
>>>>>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
>>>>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> When a driver needs to create virtual device at runtime and map it to
>>>>>>>> an IOMMU context for memory isolation, there is no common bus available
>>>>>>>> for this purpose. Each driver ends up implementing its own bus type,
>>>>>>>> leading to duplicated logic across multiple drivers.
>>>>>>>>
>>>>>>>> host1x driver implemented its own bus type to attach an IOMMU context to
>>>>>>>> a dynamically created device. The Iris VPU driver now has the same
>>>>>>>> requirement. Rather than duplicating the same bus logic again, a shared
>>>>>>>> bus type is introduced under drivers/base that multiple drivers can use
>>>>>>>> directly.
>>>>>>>>
>>>>>>>> The bus takes care of creating a device and attaching the IOMMU context
>>>>>>>> to it based on the client inputs.
>>>>>>>>
>>>>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/base/Kconfig            |  3 ++
>>>>>>>>  drivers/base/Makefile           |  1 +
>>>>>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>>>>>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>>>>>>>>  4 files changed, 107 insertions(+)
>>>>>>> as you can not have a device on multiple busses at the same time, this
>>>>>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
>>>>>>> please add it to the bus that you are wanting it for.  It can't be a
>>>>>>> generic bus as that just doesn't work.
>>>>>>>
>>>>>>> Or what am I missing here?
>>>>>>>
>>>>>>> And why is DMA somehow "special" here from any other hardware attribute?
>>>>>> Let me give brief information which was discussed, in the initial series,
>>>>>> the iris VPU used platform bus for dynamically created devices and we got
>>>>>> the comment/suggestion from Robin to implement a proper bus_type with a
>>>>>> .dma_configure callback.
>>>>>>
>>>>>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
>>>>>>
>>>>>> based on the discussion, implemented the dma_context_bus and used for iris
>>>>>> VPU devices instead of platform bus.
>>>>> Why not make a irus_vpu_bus where you can do what you want?
>>>> Initially iris_vpu_bus was introduced, and it was made generic based on the
>>>> discussion,
>>>>
>>>> https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
>>> I don't really see that request here, I see a "make this better and more
>>> generic for other busses" but that does not mean "dump it into
>>> drivers/bus/ for someone else to maintain" :)
>>>
>>>>>> Here, the device have only one bus (dma_context_bus), not multiple buses.
>>>>>>
>>>>>> Regarding the "DMA" naming, the core operation of this bus is its
>>>>>> .dma_configure callback, which calls of_dma_configure_id() to map the device
>>>>>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
>>>>>> purpose.
>>>>>>
>>>>>> I am open to suggestions from you or Robin or anyone else, if there is a
>>>>>> better or preferred way to achieve this, I am happy to consider it and
>>>>>> rework the implementation accordingly.
>>>>> As there is only one user, just make this your own bus please and do all
>>>>> of the needed bus operations for your devices there (i.e. don't hang an
>>>>> "empty" device off of it.)
>>>> The reasoning behind to make it generic was to have more users - host1x,
>>>> Iris VPU, QDA on the generic context bus, instead of each of them having
>>>> their own. Let me know if you suggest to have the iris_vpu_bus.
>>> But you did not add such users here, so how would we know this?
>>>
>>> And still, I have no idea what this bus really is doing.  Is it dynamic?
>>> Is it self-describing?  Why not just use aux-bus?  What is it supposed
>>> to be doing and used for?
>> This bus will allow users to create a dynamic device and map to IOMMU stream
>> ID via .dma_configure callback which calls the of_dma_confgure_id() based on
>> the user inputs. This bus is under the iommu_buses list to register for bus
>> notifier callbacks for iommu_probe_device() and iommu_release_device() during
>> add and remove.
> But a device is nothing on its own.  You can not just have a random
> 'struct device' hanging out there that does nothing but iommu, right?
> It should be doing something else that is very "bus" specific.
>
> Again, why not create a bus for your hardware type and have that control
> the bindings of drivers to the devices, like it should be done.  You
> better not be creating platform devices for these things :)

Creating a dedicated bus for iris_vpu is indeed possible, and we had actually
explored this direction in a one of the series. A patch implementing an
iris_vpu bus was posted earlier here,
https://lore.kernel.org/all/20260313-kaanapali-iris-v3-3-9c0d1a67af4b@oss.qualcomm.com/

I'll bring back that approach. Before that, I'll wait a few days to gather any
further opinions or suggestions from anyone else. Then, I'll proceed with
posting the next revision with the iris_vpu bus in place.

>> auxilary bus don't have the .dma_callback and bus notifier callbacks where it
>> can do iommu_probe_device() and iommu_release_device(). iommu_release_device(),
>> being a static api, need to be called from bus notifier callbacks which should
>> be under the list of iommu_buses.
> True, because aux bus devices don't do that directly, they are "sharing"
> resources with their parent device and something has to mediate for it.
> So yes, you are right, that is not a good idea.  Make a custom bus type
> instead please.
>
> thanks,
>
> greg k-h

