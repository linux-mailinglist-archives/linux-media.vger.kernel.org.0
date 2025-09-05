Return-Path: <linux-media+bounces-41804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E5B44FB5
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3AD117AEA3
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 07:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0952EB5BF;
	Fri,  5 Sep 2025 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a7cwugNv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C582D8DA9
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757057355; cv=none; b=K8XCmsTi+014hY5xwgZYh6QJmh3FD6Er93BhneygrQCHtbR4yyLVII+TL9Jy7bHi5j65eutcNqsKgyOsNi3qIr0DuEfvJTszmVoZodn7EG+pNu08BHI+Q+sFcO3E+T2clFT80YJDAVw3UMslqWwfS9tSgzrcg2qpJ1jWBQ23k14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757057355; c=relaxed/simple;
	bh=BvIjxGo6igUuV2U2V2asqezbGgLHP43cOsxtnrrmHX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HbVrdedmYSQKuwNaq+lr46dIRCrb0kphUvrl8SZdHsyDxiuicM9KucqshitOF1mNk26NQvG0Z2mu0J9hMKCqaQlgeiDHmwm6njRl729IhvthIXHjXDuoaMIsuiEmexmTVSLsjX5jZZp3qJU/OIS9xubBbtMTzWygEjI0kFpd1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a7cwugNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857DOJ5002342;
	Fri, 5 Sep 2025 07:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/N+HDfATpUfaI+ETDZv8h6jQJjr3bp4faafz3I1A48=; b=a7cwugNvqNVB+SER
	dPfLkBuTAz4NHfIK5X6FG4/QtwQWrBFtbV0cV8oE7ehZCJuoV2uDVQFy0zuRfpG2
	9UeDutUi68UyomoBMy9QHZmjjXy03Qu2L0YUmB67mvIUwvD7yYsIryYbYjzzxRzR
	akZUTFetU6nFzj/WdPIxHCTvgHNYzmALDqrhPFqRDrQhaxLkkz/OyXgex29kyVci
	fCsTjUBJcF5qEe7eMnl+lIuxkRZeNZ+i9s+4coB6PJ2ZqxQ83pE75q6HxD6T46NX
	FixyVFbaW5xdDG25qDE59etKNocp5ZjtxSfleCbMjejHYW2qtEc9Zg/TCk5JnXtn
	LAoZPg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3a50r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 07:29:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5857T9Kh013337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Sep 2025 07:29:09 GMT
Received: from [10.216.14.209] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 5 Sep
 2025 00:29:06 -0700
Message-ID: <7fb5dff2-56f1-02d7-b401-a6b3044dda52@quicinc.com>
Date: Fri, 5 Sep 2025 12:59:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] media: MAINTAINERS: Update Vikash Garodia's email
 address
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux-media@vger.kernel.org>,
        <nicolas@ndufresne.ca>
CC: <vikash.garodia@oss.qualcomm.com>
References: <20250904190003.2478464-1-quic_vgarodia@quicinc.com>
 <1a7dd8b2-925d-4873-a9c8-a3a562abb804@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <1a7dd8b2-925d-4873-a9c8-a3a562abb804@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX2PFOPli3gJEB
 mwYXE8ok7ojPgxGiuzLm4YixtHPgAoeVz39B1kUsGLDa7ZksvQy0HtkEJFoGADdOMLqmCeay6aG
 bWHK41IV+icgTaj1facIHZivevcGL578WjnRwSZmpE4Rt4llN2Rg5H1EcPkCu8WALo/GmJmi51E
 VL6AaHG2zoSjwok1y3SihXSYLcBTzi+eFEZjoF2i8K1hjnb6gq2gcR0goFnney3Gejw3ZeaWI+x
 zFBMf/NgqpfGydV4VIMNLte8Objk2iszfX0INW1hiEGZ8ZS+tfLPdzFfQsjb6db3BSOpN6hybVD
 kftXHH3iCAlSjlB+cMW9sHOuQoriAXBTIOK72eu2j6BLeaAT6F00AaECtzpbcWMSc3qMKdVSXW0
 xGRaxSLM
X-Proofpoint-ORIG-GUID: B-V1jCqacgIEwHUHfMLAwGkv6dn21ZDh
X-Proofpoint-GUID: B-V1jCqacgIEwHUHfMLAwGkv6dn21ZDh
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68ba9146 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=uXoPbtGjc5eXSKknrm4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032


On 9/5/2025 12:21 PM, Krzysztof Kozlowski wrote:
> On 04/09/2025 21:00, Vikash Garodia wrote:
>> Replace my quicinc.com address with oss.qualcomm.com email in the
>> MAINTAINERS file for both IRIS and VENUS video accelerator drivers.
>> Also update mailmap to ensure proper attribution across historical
>> commits.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>> Changes in v2:
>> - Added MAINTAINERS file update (Krzysztof)
>> - Dropped multiple SOB (Krzysztof)
> 
> 
> The problem was that 2 days ago when you sent v1 that new email did not
> work, so please confirm that this was fixed.

Yes, its functional now. I expected it to be working little earlier than it
actually did, i could have tested with a test email though :(

Regards,
Vikash

