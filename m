Return-Path: <linux-media+bounces-38367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D685B10772
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 12:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DD3D5670DC
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 10:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38C825F97D;
	Thu, 24 Jul 2025 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JZU4xHJx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F0257423;
	Thu, 24 Jul 2025 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351810; cv=none; b=e5Cn1hrbI5SGMtyOJWpTR3l94dkk5LeL1geavcFKBL0we90aAXI5VTO89M2TM2a7ebXOP2S6LmQr9ZeYxNkYdSbmfX7MCAxBgi7IK4rDFnoriR2DGgqtqRPbSJ4/JihM+YqRJxRvKwplvlRwf2m7d2bPmNopSLBDb29NuWtvM7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351810; c=relaxed/simple;
	bh=uQzWvURU4lR+pbczJKLhLxw0bqhAiazUuWm1Gc0CJPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yt8J36HOIiJDncIafjjC7MdiGUvYSeadp9a/H6sCZTJkD9d2mcQulwsK7m1IHbqPfkrMpdFsVI3yK8sfZDfukXX4pDj9viirDU1vusNW/NK/wMVp7VhhqBhnUjYT6Uv3D4MAQTZ0Yfo+EPffC8IuTC6p1ZRyJ3J78G7rgOuIrL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JZU4xHJx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9UsrP022192;
	Thu, 24 Jul 2025 10:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlWxCPBa+jQkIvHdRLN268OyKsYFqTmFZB0uVTu9BqY=; b=JZU4xHJxFyvuefwF
	BgcZLv4QLoFtuUbskr0iZf6YZggolSwm4xC5duUc8uV5DGVfkcbyy0XfUTHAaydL
	26wsusKUqI5LkWeZN0kpdG19L5DCs/OCx5yGckgcjlKa7cz1eVYZhBU0ZbaLCxae
	hogH9G2oqUI9wyF15hBYwzAA5ZzszoqQ8nItUeWrd5cLPWL7pBgb2ll0ya39Vzu8
	l3E8g3Fzq2EU8PldWWBcPAibXq4l3kMnDoYEMs9CQASHoX3wui9Jyy6bHU7jvX2Y
	zh4WyaEeYmPw6P1FSPGODS+MBSVrhxgvMnL7zOEZR9nZ6SrsPLPtKddE6J24wLhb
	pLEXlw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kjypm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 10:10:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56OAA4qD021026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 10:10:04 GMT
Received: from [10.216.10.236] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Jul
 2025 03:10:00 -0700
Message-ID: <665bb169-8942-c3c9-c882-9b281cdca34a@quicinc.com>
Date: Thu, 24 Jul 2025 15:39:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] media: venus: pm_helpers: add fallback for the
 opp-table
Content-Language: en-US
To: Renjiang Han <quic_renjiang@quicinc.com>, <quic_qiweil@quicinc.com>,
        <quic_wangaow@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
References: <20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3NSBTYWx0ZWRfX19eHRWojybXb
 GTBjCToUU5Gpu1lWAQmsCw4jV6b+kfS/cxpgkKZuAsmV0N3yU70YAzxtysm+84CBU24lMK39VDR
 HF9WQF9b8bwA/c0iYIIhTL7OGppnGc1DzDRxp5dm7T0jRCNHLbF0QXIbRbqh4/XJi/gucvJgBYr
 eRUv1UGgimYE6CkKtkuyPhYVvvsNjJ4CuKmaa30011cyJ9AUBAEk2pi2LS38WwjjMD6wu00htyv
 dkmQ03tVY7B9Wm0X8yXDBg/4JiZ0EFQWGVFKHmGdjNp4e1Ve0eJh1pVP/eiPZR8FIFuLSmR3C1H
 1n6ZItpX4OFeFzOvNhOtkSBOhV7AS3dWNw4lfZdC3nkxrMmcsgWZRdx050aelvUljKq8QHuihXX
 /b4xpUhBQtLsTHdAIrZBgo6U6chwkWbgyLcjE0fuBieXmxv9AfdQhG7kOxxFcJvor7KFufy+
X-Proofpoint-ORIG-GUID: 7DGBAtOAhqwxOX0xJe7V60x-8N77iEQ2
X-Proofpoint-GUID: 7DGBAtOAhqwxOX0xJe7V60x-8N77iEQ2
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=6882067d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=iWKRvkjQqEvONqlByQsA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240075


On 7/24/2025 1:23 PM, Renjiang Han wrote:
> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
> do not include an opp-table and have not configured opp-pmdomain, they
> still need to use the frequencies defined in the driver's freq_tbl.
> 
> Both core_power_v1 and core_power_v4 functions require core_clks_enable
> function during POWER_ON. Therefore, in the core_clks_enable function,
> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
> it needs to fall back to the freq_tbl to retrieve the frequency.
> 
> Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for the frequency")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
> contain an opp-table and have not configured opp-pmdomain, they still
> need to use the frequencies defined in the driver's freq_tbl.
> 
> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
> retrieve the frequency.
> 
> Validated this series on QCS615 and msm8916.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

