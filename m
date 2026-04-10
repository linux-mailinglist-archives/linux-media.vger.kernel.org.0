Return-Path: <linux-media+bounces-58541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aChvCnXd2GnHjAgAu9opvQ
	(envelope-from <linux-media+bounces-58541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:22:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C35C3D61C5
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47993302F6B8
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B60539DBF5;
	Fri, 10 Apr 2026 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GeBFTT3N"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529583368AD;
	Fri, 10 Apr 2026 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820137; cv=none; b=tixxzLpNxNsfs/NUT1L1i0Uk01LLzWKNmpJjG30VeKUyMFe38fIFlpXoXN+e4S1k+N0GM6pJJ9I/8DclrLzIIVdzODlvuUt0rhGWz7De4NeNN7H+yOvTsHgH8HXQ6KFQV8hP5naTCIbyWbUNz6d181CuwoDd40ggWY2ZtN3kN5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820137; c=relaxed/simple;
	bh=AFizT5GVNVe2FldoQ43+LGGJ4wnlbEN5uTfJ16jDjgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N/aQLTIepnjxQLMhm+5wlnMS+ad0EG3NpVFJAQtFE6SUwjzWngIxBOU3Kghf0gqnwJMV/cLcwbxR7gZdWXP6aqfp+2bWJtTd7qMwtvGGhe3npkWQozfTKdggjg8ld/hnEPs0fxQ5eB+LhxpH0E6UxBo5QCZzuRmR7vmvmBG1z2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GeBFTT3N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AADVLm1925453;
	Fri, 10 Apr 2026 11:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXCDEuWxbaerERvBelLzYgqdWH9OXFRHW+vN3cYatsk=; b=GeBFTT3NU1FSM6Hj
	2H/Q7pmlAT4qe7QOhaKVrZ75sFot43vQAH/ZP7Y33Vu+BaMZmQfkzDAawcDzGOeD
	KOA8vlG50i+byMO8TqcO0eeTh97OqkzFO4SIhfX4xyBxCkoqXxunKyJRhPFNSgcM
	VFXvlJvAtM1Y76kpZ2mGh8ChBdQ5A4KiL/x4mIMmBjVT/P+qvtGIJRuSlxLSObAm
	MHmBZvI1qHXlRK6EOYMDiw3Q/4E70nZqOLx3reTJd6hAx3DoHXUkKrq7qakIkCNK
	CLiSB5yef4Rch6kFbaLlTn/3YeWAOdDDTAi34BJ0fXSreoIR7Uxa+CJFtaM6pjDg
	b11yxg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjs5ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 11:22:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 63ABM9nl017097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 11:22:09 GMT
Received: from [10.216.26.180] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Apr
 2026 04:22:05 -0700
Message-ID: <fb37aa8d-bc61-48fe-9c82-828e7fd642f9@quicinc.com>
Date: Fri, 10 Apr 2026 16:52:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] i2c: qcom-geni: Avoid extra TX DMA TRE for single read
 message in GPI mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        <mukesh.savaliya@oss.qualcomm.com>, <viken.dadhaniya@oss.qualcomm.com>,
        <andi.shyti@kernel.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <naresh.maramaina@oss.qualcomm.com>
References: <20260410101949.2315058-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20260410101949.2315058-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d8dd61 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2ZZFV4PajdD4Tf-m3e0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gRq6W0F6IGuJAnJhHlCPTtFpLZTjLa7V
X-Proofpoint-ORIG-GUID: gRq6W0F6IGuJAnJhHlCPTtFpLZTjLa7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwNiBTYWx0ZWRfXwOqFuikj+wsJ
 Nns3Qy0glre0sxugk1cvT+ttj1yIvRP3n8VhRfH4xTL5Sbk80NaB/UX4AAZbjlantZO+ozfjSB/
 MsfzSZ+sWAaSfJmhgc36qRY7u0V4PJgEjGNTQTaNvJIBXrUED/YvY6THa83wQH+XdFDm5p2IDcb
 hRfTXzv6ePnBnA7KzYQ3xS/baN+CeUjaXJeiwyHXMxXmI7c/gsyF+QTxANvKv3xtkU95qE9pa3Q
 GBh2WNEao+QEhmAS+CPijjNGjTo7L+aTonS2oz1mxUMQl3QYyWfey0SSmBUy6+CJf3FWjs/rXGN
 JLmS9ttJw15Qzd3C0bn+oDOxL/R+6w3L7kdNBPJlBMomd6w5bABAT31XI5bel2waNNtyzSLoil8
 ZouoRu7+3VexVNpIRfYX4axBgB6CJ6i8ipbT74oN5ApCEyLzH0ojaE3fwY7mTf5fyp4szp2lFuk
 rtMM+1Odb6UoEYuo7zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-58541-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:dkim,quicinc.com:mid];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_msavaliy@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C35C3D61C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 3:49 PM, Aniket Randive wrote:
> In GPI mode, the I2C GENI driver programs an extra TX DMA transfer
> descriptor (TRE) on the TX channel when handling a single read message.
> This results in an unintended write phase being issued on the I2C bus,
> even though a read transaction does not require any TX data.
> 
> For a single-byte read, the correct hardware sequence consists of the
> CONFIG and GO commands followed by a single RX DMA TRE. Programming an
> additional TX DMA TRE is redundant, causes unnecessary DMA buffer
> mapping on the TX channel, and may lead to incorrect bus behavior.
> 
> Update the transfer logic to avoid programming a TX DMA TRE for single
> read messages in GPI mode.
> 
> Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
> 
> Changes in v4:
>    - Added some more description in comment and changed the label name.
> Changes in v3:
>    - Added comment in the driver for better readability and changed the
>      position of 'skip_dma' label to allow dma engine configuration.
> Changes in v2:
>    - Updated the commit message.
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a4acb78fafb6..a482a4c60744 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -625,8 +625,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],

[...]


