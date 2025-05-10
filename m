Return-Path: <linux-media+bounces-32215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B050AB2204
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 10:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C42661BA4BA1
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 08:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C5C20FA97;
	Sat, 10 May 2025 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m3X3XSsr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E56D1E9B31;
	Sat, 10 May 2025 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863920; cv=none; b=LpUJV/XvxiDgDoV020dHEHsVGCQMuuNAuvTt7YyYQMcWrKHxDUHXlAYEAUHANQO5A6z2OOmD5rVmLTXCDapdywwpbHotMe3kJYWeX0tcIHV7K20L0e5pNdOo7luyTHldabnxC/3I+lUvRZ+PjygJ+3Z4h/HiQmmqgXZkRGezQcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863920; c=relaxed/simple;
	bh=IOMjYybCNa4VIYxpu0/TU90XZnL6Kch3/vV5iu45em0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uH+WZAVKJQPr0nQ2naNRWXPK0hrusETusWywMuK8e3ahvLIqrcIk7nIofImWOcS52iReaaH881RktxuntLahg8UuCwcq5wwGRoimP0Wzg00LWpveDHYFpjWxVDG/n1EcsQRh4w62HFhweaET45uiy+LqWpNxJ2GmCt79Hs/1wPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m3X3XSsr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54A60Me5031215;
	Sat, 10 May 2025 07:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uFby0lNzqHbnplT4Q8bV6dsWxUrWFLJbcAudtU0fbw=; b=m3X3XSsrRjWwjUT4
	Dr0VY/Oq4QqSjtPmrJCfPltWPRcsBgF1HrXFSjgo9hDtPM+ujSw/aG6AMoyNpL5A
	o/VQ2ZUMk25wH21y4NHwMVOmXFrKMraDgc18eCnT1bmDfazOsH62/93eap4pOpGj
	8ZUIj7OMQX9A+Z0e8eLYjF5OLalcbrGn5+5TnJ7cvQ4FfO1rBvvKW5lc/vFfZI7v
	gTfiJjkRqgX5B1VYe1756BziLwMHJwvCZ91IhBeHN/fP0AUeFGujy8/geirfhx1p
	pbpYScbqbBWprHwIH/E38Mb0/x6CqZXP5yeL8Hf2a4uUX8xIFREQzo//plzG9Bli
	TERIIg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt90ccv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 May 2025 07:58:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54A7wRDX027113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 May 2025 07:58:27 GMT
Received: from [10.204.73.14] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 10 May
 2025 00:58:22 -0700
Message-ID: <fd4a66f6-1d64-4047-b6ea-cbcf6720ef70@quicinc.com>
Date: Sat, 10 May 2025 13:28:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 7/9] media: qcom: camss: Add support for CSID
 for sa8775p
To: Vikram Sharma <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-8-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Suresh Vankadara <quic_svankada@quicinc.com>
In-Reply-To: <20250427070135.884623-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEwMDA3OSBTYWx0ZWRfX3MereqBUYSsq
 HtVdMe4OsifMb47syvhIUN2dlsMwS+ZAzeqrjxNo/fwN4lx0gPooJOq45Q2buL87FMg2H6qo67l
 E3HrjhBRCNgW6549nDA4lKHy8XJZfzgbspiYrwum2dON45Vrch7kcxJBFTT1m7w6bIsKqk4/n3W
 Rjmeya/BjDuLyoopIJ4CyRsty8vcSu1wWwcfVUL+Db4RfRj6S5XLqW7I1sUFdphAeLbABhBMjCn
 RyIwAu9zGZXeHniOO07PqHRU87yjvEPOu3ChC/OGTFy3EDS0pjtcfoY/lt719oto9fsY6EHXXk6
 RQs2HjvYr9k8dUe/FvhluK9XH1fCmFX06YZ6UfmN8i2golSuWaytOQ44A+xF+U1WsWKgAKlsz7K
 parm63RNUQdC8p2s26cAZ+ovLacrGTNq7j2kdsguED6zOYas3oUiLu8zJH4cNnpRgSpJY4Ey
X-Proofpoint-ORIG-GUID: cEbBw-yNHMCGuQk_8daleBt3w1yBXQvx
X-Proofpoint-GUID: cEbBw-yNHMCGuQk_8daleBt3w1yBXQvx
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=681f0724 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=E8EaJ-78P5yFifbjexQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-10_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505100079



On 4/27/2025 12:31 PM, Vikram Sharma wrote:
> The CSID in sa8775p is version 690, This csid is different from
> csid 780 w.r.t few bit-fields.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-csid-gen3.c     |  31 +++-
>   drivers/media/platform/qcom/camss/camss.c     | 151 ++++++++++++++++++
>   2 files changed, 175 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index b66105f7b901..4f9471523a08 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -48,8 +48,12 @@
>   #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>   #define CSID_CSI2_RX_IRQ_SET		0xA8
>   
> +#define IS_CSID_690(csid)	(csid->camss->res->version ==\
> +					CAMSS_8775P ? true : false)
>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
> -#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
> +#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
> +						1 : (IS_CSID_690(csid) ?\
> +						13 : 14))
This becomes more complex if more number of chipsets under csid gen3 are 
added.inline function helps for readability. It should return with 1, 13 
or 14. This comment is applicable at all places in csid.

>   
> -#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
> -#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
> -
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +							(0x348 + 0x100 * (rdi)) :\
> +							(0x548 + 0x100 * (rdi)))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +							(0x34C + 0x100 * (rdi)) :\
> +							(0x54C + 0x100 * (rdi)))
Subsample pattern is not used in driver. Remove?

>   #define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
>   
>   static void __csid_configure_rx(struct csid_device *csid,
> @@ -103,6 +117,9 @@ static void __csid_configure_rx(struct csid_device *csid,
>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>   	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
>   
> +	if (IS_CSID_690(csid) && (vc > 3))
> +		val |= 1 << CSI2_RX_CFG0_VC_MODE;
Is VC greater than 3? in which case?

> +static const struct camss_subdev_resources csid_res_8775p[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
> +
> +		.reg = { "csid0", "csid_top" },
Align name with DTS for csid_top. Comment is applicable for all 
instances for this target.

> +	/* CSID2 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
Align with DTS comment in clock name. Applicable for all CSID lites for 
this target.


Regards,
Suresh Vankadara.



