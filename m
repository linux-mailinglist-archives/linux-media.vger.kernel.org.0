Return-Path: <linux-media+bounces-36131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95901AEBDFA
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 19:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 459C9564137
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2943F2EB5A6;
	Fri, 27 Jun 2025 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dUlKVrBB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4572EACEE;
	Fri, 27 Jun 2025 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043689; cv=none; b=LgR5J9vXI40dIRTF6iK9skQR5XWmal32I9rB/KqXhgCcjDC6CyM2r6pawBgJUkHeEiVEXZ7eNT0Azc3JxG4qYiwxCtEotmstoc46OShmMJyZdrvIgD4ZEyAZp/LOQYtSfFduEzA9HJFD3QP8rj/MhhgMcoPgDU7IIExDHPhPEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043689; c=relaxed/simple;
	bh=6f3tVgP2MLR8AUZbYTqhucyur2AusJBPWY2FYtWij3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J6HXipONHC/8QUs4Wn7J4bXfziR+w/18i1Enz2l2Ym0Y03jvyC5kVw5YUr4tbDGTc5bDAu4wyHjiaYMuOe9vGQK1aO0e1R8qPonH1cmPfavb3RpUvBbUAgx2BVJ+8oQI2CSIfkrNZ5oQPMXMyeH94yFa2j/gROMkjX7PnyV2018=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dUlKVrBB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBq2Zc028862;
	Fri, 27 Jun 2025 17:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66HzoUAyUCupfEkLPSykmXZ3bg7T/djHe6L0jVhT+Yg=; b=dUlKVrBBR5EUEAQR
	RLwKNFcYygq6vHsYG65AfQIzlqduQNz4DwCiDIH//6gKZ5ze7l4oZn72UC50uhvk
	bk23sZ3a2lF5n5ohYJjdJrtOouqXOk1SELhHaQlJlEcqw51EgMtVD92d3HHGzTMQ
	mywAzyNkFiAhHarmYXtXuh6kKtsIypn7zsr0z2H8PAq/mK9hJ0iD9t6ubm92Ol4+
	X/zcK6CSZuunvKef0RPM9PJAnx8Ewyh5m9dbv6CcSMQYFKuOmhirohZtMWmD1JCz
	HtJzFJXDAfSMDCpkGDh/qcGmO6j8C2MbFxgC+Lx6wwQPQzBqWfJkPByS5t2I2Asw
	CC8axQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbj7aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 17:01:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RH1CmQ031486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 17:01:12 GMT
Received: from [10.50.11.187] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 10:00:35 -0700
Message-ID: <4db91e5b-9bbf-ce59-3880-30dd6efa9c92@quicinc.com>
Date: Fri, 27 Jun 2025 22:30:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <306223e7-b760-4d37-b5d2-ac04e3c98842@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <306223e7-b760-4d37-b5d2-ac04e3c98842@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzOCBTYWx0ZWRfX95XFtW7RCgQU
 hfC8WnsLnBd3CPvv0P4KpzuIne1SHTiep14u+JooKFs9eebuBvfuB/FQLNpu9XUCMU8FO1E75cZ
 mhRj2YoolUl4Dx6GSUe/AqOtG/Pw4hmAbODfhjd83M4oSZnastcvK73QOczvVO6siIU5CZWk4aw
 nhKjsGpsde6DwhlEVnEj5ap0TCwUIYwlQljEgz/0tiw1iA1Bv13E6wToZXILLY+RuO/HuSMsMtS
 4K143blqldbfVWhXXljVxcEDOYjLScxth7/DZFqYqTOt3JePwpmN9oLgVIv4iS4NGlIYUSGR6/I
 Rvs4ZqA/TzkI0q23JDhI25CXOXuFkxCVTYRT2Cs86AaxL0Sm9/yL5XM00YfT7CHMZJCaE8Ppi2O
 z7E1Zu9qCS3VjghSMgB6yaF2HS9fPe/L9HZ9OZLAIJ5T2fI2CpfKCvVPLeqbWcTmc6ICZhbI
X-Proofpoint-GUID: I7oicxnUsrOxhlPRcG---j2_OLvBoKVQ
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685ece59 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=S8hidplFpqv_CiXkyBkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: I7oicxnUsrOxhlPRcG---j2_OLvBoKVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270138


On 6/27/2025 10:00 PM, Bryan O'Donoghue wrote:
> On 27/06/2025 16:48, Vikash Garodia wrote:
>> Changes in v3:
>> - Add info about change in iommus binding (Thanks Krzysztof)
>> - Link to
>> v2:https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com
> 
> Hmm.
> 
> I would be nice to see what also _wasn't_ done i.e. why you didn't do what
> Dmitry was suggesting, IMO that's as important as stating what you did change.
> 
> Not a huge deal you explained in a response email your logic already but just as
> suggestion for future, I think its good practice to go through each point and
> say what you did do, what you didn't do, perhaps what you tried and then decided
> to do in a different way.
I see your point here, and it would be certainly good to document (as a summary
in cover letter) the design approaches which was not considered stating the
limitations as well to drop them out.

Regards,
Vikash
> 
> ---
> bod

