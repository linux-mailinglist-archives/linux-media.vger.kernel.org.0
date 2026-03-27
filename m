Return-Path: <linux-media+bounces-57193-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAhyEZIlxmnQGwUAu9opvQ
	(envelope-from <linux-media+bounces-57193-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 07:37:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29433FDC1
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 07:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7008A312D9BE
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 06:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9365E384239;
	Fri, 27 Mar 2026 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RB/aqBUb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C038737E;
	Fri, 27 Mar 2026 06:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774592751; cv=none; b=LlL56gmYkrxHxbqo0h29t6J2Q50hcIYgNLpMjNxM3s7p893ddNIDJEysgLB93CYBWl2OvisIhNSCO2jcTTs7RFMnh/O4vW5KvuD58WkMQBTtvFsDz1A0l6AmxFuRGukexfcUOWzJP6XH9+UAi6yhD1Pe/kQrN+fz83N9XNftqKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774592751; c=relaxed/simple;
	bh=K4Q3qQjpxosCmWZI/SO3Yt6stgpZ57GXLDLHKKODRg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LpJjuo3MU/AVv54E1Pm9xmbegee54WzqwvsB7OsSSeW5Y/zV5M3YxA6Y3/y713R4vbG68AEEVOj9njNw6u3coosBeULxNsyCkHwtwn2Lak5u/bwFfFLy3HVIeEFAAF8mEoLuQBXrL2Ul3gauty05/IUGGQEogkXe/ZGgaVOIAS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RB/aqBUb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R4A5XA3341501;
	Fri, 27 Mar 2026 06:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSzXm+RZAa9Rqyx7SbN6v7Cf13JatYH15U/iDOUtR48=; b=RB/aqBUbAIIEFFOU
	c4kMCFtneX801+z8GuXWH1f7pGJr/9byBXrII71fj5Sz7Ta96kdxaERnWneaDLbi
	EGhEjHiqBR3D1Zn3j94OzxJFnj0MmFTAxL6Pewjtk+1r0WaHSQAkfzVaE4HbIemI
	4c93ZvL3OaqY4ieLfJ5DIYga0kHNh/Km+B9cWAD7XgLTl6VTBl2QGSVJfGSUm/ms
	LF+A/AmZp564ZyAPY+xyo7rBYpAztwoFhzlNm7Y0vdiCLcEuofolRGHXCM9Ax3cq
	ZwzQI08gIaSGMt1af59bfUg5bN0YbkPSZtSeKsadoeV+MQghH7PYDkfxLbOmmHnJ
	hbbE0A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q20g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 06:21:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 62R6LcXr014950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 06:21:38 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 23:21:34 -0700
Message-ID: <341f2f06-eae0-44b1-b513-61a4a129bae2@quicinc.com>
Date: Fri, 27 Mar 2026 11:51:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: qcom-geni: Skip extra TX DMA TRE for single read
 message in GPI mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Mukesh Kumar Savaliya
	<mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya
	<viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Sumit Semwal" <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
References: <20260326-skip_extra_dma_tre-v1-1-deef018895dc@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20260326-skip_extra_dma_tre-v1-1-deef018895dc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O8eAz8RP_v7e5AXmdYACo4b6E9ip1Q8b
X-Proofpoint-ORIG-GUID: O8eAz8RP_v7e5AXmdYACo4b6E9ip1Q8b
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c621f3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DM0cx9kTKsjz1JukrIkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA0NiBTYWx0ZWRfX6ZnL9fiECyZ7
 LMHimHdcXT+aA+1MibCeLVfagtST8511dCr1a3vtURNVnZEw4xHiwvvRhNvN3SSih1yvlx1XKVU
 pAToEwg1xvFa4h6hRW+pf96/YoiLdY87Xy+/AWg9/HsN/XKdkpY8f0ZXLGhLgVnVp1oM/jidyoF
 DuTeWboq70Z62uvuKk9UEZhRMGDmie++KvEI9Flgnm2QR5A7Gxr86XNmR2vNj8WgTkDL6AaGbfR
 5bbT8pTBIkqgvJGiO9XixXpZuKCwK0HJkrCQHqWHd+Rhbc0hLXPYuqpeW/0U+7y+IGZWydWaJwy
 pgdTTkTwxJGJHz7AtGJ5z+aqGud8orhprJWpnyN60E/4tjD5kmZa4jkkfXvMCOQj5ytvgyPLfI9
 DRBZKb0LtQSbJTjb1A48ngeJikYaTQGF1JfvJgsBazv4Vue2p3MVbgOGOHjgxFjlg4n5n3RAKQ/
 Gsi3MwCAsC9s9N4Y32g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-57193-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:dkim,quicinc.com:mid];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_msavaliy@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA29433FDC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/2026 10:01 AM, Aniket Randive wrote:
> In GPI mode, the I2C GENI driver incorrectly generates an extra TX DMA
> TRE on the TX channel during single read message transfer. This results
What's the impact of this extra DMA TRE ? do you see failure/timeout, 
anything ?
> in an unnecessary write operation on the I2C bus, which is not required.
> 
> Update the logic to avoid generating the extra TX DMA TRE for single
> read message, ensuring correct behavior and preventing redundant
> transfers.
> 
So for read, we do unwanted write too ? if so, please write it 
accordingly.  Correct behavior needs to be justified against wrong.
> Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a4acb78fafb6..2706309bbebb 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -625,8 +625,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   {
>   	struct gpi_i2c_config *peripheral;
>   	unsigned int flags;
> -	void *dma_buf;
> -	dma_addr_t addr;
> +	void *dma_buf = NULL;
> +	dma_addr_t addr = 0;
>   	enum dma_data_direction map_dirn;
>   	enum dma_transfer_direction dma_dirn;
>   	struct dma_async_tx_descriptor *desc;
> @@ -639,6 +639,11 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
>   	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
>   
> +	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
> +		peripheral->multi_msg = true;
what's the actual meaning of multi_msg here ? IIUC, this multi_msg is 
set to true for single transfer  ? any better name if so ? Yes, need to 
change it out of this patch.
> +		goto skip_dma;
> +	}
> +
>   	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
>   	if (!dma_buf) {
>   		ret = -ENOMEM;
> @@ -668,6 +673,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   		flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>   	}
>   
> +skip_dma:
>   	/* set the length as message for rx txn */
>   	peripheral->rx_len = msgs[msg_idx].len;
>   	peripheral->op = op;
> @@ -740,9 +746,11 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   	return 0;
>   
>   err_config:
> -	dma_unmap_single(gi2c->se.dev->parent, addr,
> -			 msgs[msg_idx].len, map_dirn);
> -	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +	if (op == I2C_WRITE && (msgs[msg_idx].flags & I2C_M_RD)) {
> +		dma_unmap_single(gi2c->se.dev->parent, addr,
> +				 msgs[msg_idx].len, map_dirn);
> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +	}
>   
>   out:
>   	gi2c->err = ret;
> 
> ---
> base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
> change-id: 20260325-skip_extra_dma_tre-a3cf22f81d9b
> 
> Best regards,
> --
> Aniket Randive <aniket.randive@oss.qualcomm.com>
> 
> 


