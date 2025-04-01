Return-Path: <linux-media+bounces-29098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB34A773D9
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 07:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A9D616A3AB
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 05:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE9F1D7E35;
	Tue,  1 Apr 2025 05:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TC901ysN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36AF1A7253;
	Tue,  1 Apr 2025 05:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743485051; cv=none; b=k4BCZy+wsVuYN1MNmfTUIKYiesIVopTriv/0OmI7j1sTddFGPe/anHKX4C/DitlsshsLc6ty7z4sndXikL8v6VNe+kxOiCeMvwQ65xXu2+tssQwpaeX+mkDt+0voVSktzA2B7KLq/OLENRqKQ0olskduhB1BfT8eDW/6COfT7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743485051; c=relaxed/simple;
	bh=2wJVbMoxjxszsRjYtF6uqBmDvBvV7lZ2qBUy738xXyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pEhXW1WpfxQrxBzuam1wTUYiM4E+FiLwdxw58r4dntfGishp6Oo3Fgo9dcuUwjR9qikZG5Qc/PQiSeKAC5xdko0XX7ApAZ3/jbiVrWBj99lk8uf47FuUO8okBYyshS9OFLGEyF4H5VpXcowm5UNFNBHs/WuPicuO7YpiB4miyVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TC901ysN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDAAo007966;
	Tue, 1 Apr 2025 05:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wFRii4/e0YhNQngKg6mI3Yl9kf1cVlDnYHH60blEroU=; b=TC901ysNimfF/VWj
	sPUXIuNtUdigNK6osXykq06A1f2+0bBe1zT5wDrIbAn8gG03dXpXJHb90GvpMidO
	2/UMzVya5vLvrlxvdF31rfLXJC4NnqSXkNr2tqY9C/crzOaZVzsVDHQA3ykbQUEB
	F2W/wl9aFl9BSOH5/RJrhNAEsVbw0up8GrURmkn7Js8k8nrTqwO5r+rcyJ7LV2cv
	9RLO9AZKFg0BFvbtvtQc6RqALgEDhvtn0zUQOwVB4nrczPu3WDYDj28W5yC06Zxq
	GJDti2dNi47JtWV6wfm5n4RJZ65EvQVlpwJ0RfS5FP6fIG/1Eng5LFf6QOuTk0In
	GhUm+g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nxfek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 05:24:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5315O4rt012835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 05:24:04 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 22:24:01 -0700
Message-ID: <9717a8a2-8c5a-07c3-da06-f7bd7a2bb130@quicinc.com>
Date: Tue, 1 Apr 2025 10:53:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
Content-Language: en-US
To: <neil.armstrong@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        <stanimir.k.varbanov@gmail.com>, <hverkuil@xs4all.nl>,
        <quic_dikshita@quicinc.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
 <82674b8f-4fc3-4fd2-bc7d-f573d2d11b58@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <82674b8f-4fc3-4fd2-bc7d-f573d2d11b58@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vIzkGKQqlqZRmyuvU0G6F05UY1Xp-bpP
X-Proofpoint-GUID: vIzkGKQqlqZRmyuvU0G6F05UY1Xp-bpP
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67eb7875 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=MyXx5G-aDKqKHfeEvZYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010034


On 3/31/2025 12:16 PM, neil.armstrong@linaro.org wrote:
> On 29/03/2025 02:26, Bryan O'Donoghue wrote:
>> I'd like to help out getting patches reviewed and merged for both of these
>> drivers.
Why ? Is IRIS patches not getting reviewed or being merged ? We already have the
reviewers and maintainers here, at this point, i do not see any need to add more
to the list.

Regards,
Vikash
>>
>> +M for venus
>> +R for iris
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>> Bryan O'Donoghue (2):
>>        media: MAINTAINERS: Switch from venus Reviewer to Maintainer
>>        media: MAINTAINERS: Add myself to iris Reviewers
>>
>>   MAINTAINERS | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> ---
>> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
>> change-id:
>> 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
>>
>> Best regards,
> 
> I have no power here, but get my:
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

