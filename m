Return-Path: <linux-media+bounces-31591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A5AA741A
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E47C44C0182
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 13:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787A8255F32;
	Fri,  2 May 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NUFALEr8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7DB1474DA;
	Fri,  2 May 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193534; cv=none; b=Xs5GcBlNN2a+S8sV5ijMOFM22uFnp75XChry4t6lf9sOmGs0wwaTjg/ABhhdJT1YQRo5pXV6q2rkrIZmZgm9mcRPddB60qzSX2laPZ8b9CIVXwb4bXhyZ4WogaUz0NcEqLv6zFUKQiCuvgn6ugid02dozD5+lkFHfW+EkINNxXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193534; c=relaxed/simple;
	bh=odBsd8OOefsLhvmtI/QyybmT0n5dZ2Nsnaqdl13KW7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h9HsF4uWYRJXwFbbYVPCKOzTjgZN6BIRK3F3VnVwD/6KTy2OHu5hILtS1SdfvNbYSi+7MuLWqawNlon/r7JIIpBoavFi2zRyAiFAsYsXwcU+maYLFTO5NvsXoQs5AAlASj8q1yCl1rlEGjUqBftKraSxGkGzbajkhIxPqlI0CJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NUFALEr8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NR81010420;
	Fri, 2 May 2025 13:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjlv5XaJd+MrBgWuCB32swhUU5yAHYALuWdbB8bcKzE=; b=NUFALEr8HIiYMiPi
	LzhpRbo6Xb8/Ascq/0NnSIR8jf7Rp82rIk7PGghlEkkBfvOp3ooXZNkbuWAOBVUJ
	9vMHh6jTAy6DtEAgvXVv4VZKG8AwRv3cpXh5tZK72pyCeVu77bbHaKN0oK2LyBW0
	cbVJNEptgVw+YZNnsg5dbYbp9hLftrNtDTA1We3PjajnuqTn295JWeEjZlWSGyxx
	us4kVdpAuzhJ5+w5jcGr3pZyX6U1niE6wKgxdsmUKotAOLqnT8qGAAYcbccHpjxr
	nkSIynla0TcaB3xWc4f7wnDBEJq0B/98Y8APusS5W6TcaO66IweOUPcC2pGknh8f
	zFFZMg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubrgxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 13:45:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542DjRaJ029255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 13:45:27 GMT
Received: from [10.50.25.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 06:45:21 -0700
Message-ID: <35b1a256-f3fd-9ada-3385-e1ac4dc4a68f@quicinc.com>
Date: Fri, 2 May 2025 19:15:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 06/23] media: iris: Remove deprecated property setting
 to firmware
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-6-552158a10a7d@quicinc.com>
 <f9aacef3-eed2-4a0b-a543-b26342c4d3f1@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <f9aacef3-eed2-4a0b-a543-b26342c4d3f1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: seodNYEnccKd1jvAiQ1VGPlyOTz7kZl8
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6814cc78 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=tShw72k2IWi_z6KUo_8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwOSBTYWx0ZWRfXy+QSEl+YQ+Xi R/8X8g8zOdmYmOHF6DcB2JZh8sovLJsQT85V6OpzvBD8zHMwIFz7mE/SfLiiaDgsfYCMGydROD3 /pGXQ/PQluS40vhw9533KRT1Uvftc74PoAtLrXtpKnFBb+bdToTU1e3PC1JXE/Y97PGjiMRhSkV
 Ua9m+H5JZ9m/KbyyRAtCJ1FZ9kwCqAR1iI4vP0QqB+XjUi1QilD4UhnwkD1eo3xnDeXsRy1m5sU VAn2neaSiIbCqzjkONHPu0F52totjCahb9X54UbzJnFZAT89D7CRP5mckYTGZNB1Ma+FKEpaD+o 0+YNigyN+Hf9NStGRWXsvj7Y/2iV4TQ1y1TsyPSAvB7DEx9s6NFLmRdv0rjmXPvEPLABcstKx3Z
 vD4cUTig6c2iKxbSgcxIqZOSKBxLRAdJAEJRhJMY4fxU71TaT7RfJ+QTmjZLks1ciTutGuuN
X-Proofpoint-ORIG-GUID: seodNYEnccKd1jvAiQ1VGPlyOTz7kZl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020109



On 5/2/2025 5:57 PM, Bryan O'Donoghue wrote:
> On 01/05/2025 20:13, Dikshita Agarwal wrote:
>> HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER is deprecated and no longer
>> supported on current firmware, remove setting the same to firmware.
> 
> What about older firmware - what's the effect there ?
if you are referring to firmware being used in venus, its the same.
This property was never supported on SM8250 firmware.
> 
>> At the same time, remove the check for non-zero number of v4l2 controls
>> as some SOC might not expose any capability which requires v4l2 control.
> 
> Please break up patches like this one patch removing your legacy
> functionality - assuming that makes sense another patch amending your
> non-zero number of v4l2 controls.
> 
Ok, will split.

Thanks,
Dikshita
> Generally any commit log or patch title that requires "do this and do that"
> should be broken up @ the and.
> 
> ---
> bod

