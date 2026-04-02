Return-Path: <linux-media+bounces-57943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIsMKRJazmkxnAYAu9opvQ
	(envelope-from <linux-media+bounces-57943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 13:59:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A39388B21
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 13:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3B0930FE015
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 11:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DD03DBD4F;
	Thu,  2 Apr 2026 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W5a1lv0S"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF553D2FE5;
	Thu,  2 Apr 2026 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130515; cv=none; b=UPAStnAxqAPlW01oJdaPtP1QhKbn7cFEbQhNl0b7pnr3uG608mxjytuZI0tmYTPQsNji0LabvCWCai/czl5fQPwl0nSPgl/F+KKhtOvKNwazrktVX3OmdhnYnqeaW4bMxaYU7F2AozB4FqKK5ogSLFer6MZf40CXPNVkDCtlpQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130515; c=relaxed/simple;
	bh=hjsTz94W/FU3W+rxv1wbZe+pKdrTxjn6nGps7v6/69k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E3r/AB9qA4VFi2IbzKROXk+K468JdV21nBzwAc5HSrDWJpYxXlyqFMOpORyvdHFCogPKZS5+vtDfy2KlSmyv4QljP2QckCU4/T2WByPevgxXzukxefarZeY02saqVTUOlGaB1wLbeuVNe4lfsWBbrw08AnKxwOKMJMfKfOLlr88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W5a1lv0S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326kx2h1128979;
	Thu, 2 Apr 2026 11:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpG6Cu6x0DLbK2fCQlZY8r8FMGd7+Z5GDMsj5vEk7Fs=; b=W5a1lv0SmlVzi5Y1
	VgGEK88zsvOdKcDaZUwjI8J8kVj3zFkgmwwflQxF8H/FyCNHWDmuuiVBonJNzQRw
	cp/QdAGgQDZBPmTijs9HAOFHYPDLQfDaPiFbbip44MCIQbHNK6lMqbwg47guKl/N
	7mrmKVZhmqNKaOm5MoRDRijIHbLH+bvB9WZZVLgedPuKUapxReM7Uji62+CI7oeE
	zkVruHevcu/xzr7WDqP4xHUE3z+OLv4aG5Yyws5ea1r30TGNuNPHmFf3KQ6JUE8r
	1PXCrxgJ6n7/6KPqq7w7aSZ8vjbHO7mYUTz4Y1KksL1t5fqGSCKSNEOc0tDT1PCI
	u0uJWg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9bvg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 11:48:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 632BmIrB028841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Apr 2026 11:48:18 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 04:48:13 -0700
Message-ID: <cd4b91f5-65b6-4506-b14f-735b68e63c37@quicinc.com>
Date: Thu, 2 Apr 2026 17:18:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] i2c: qcom-geni: Avoid extra TX DMA TRE for single read
 message in GPI mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        <mukesh.savaliya@oss.qualcomm.com>, <viken.dadhaniya@oss.qualcomm.com>,
        <andi.shyti@kernel.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <naresh.maramaina@oss.qualcomm.com>
References: <20260401101352.4065798-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20260401101352.4065798-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce5783 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mJbE5N3llsyo5S9VNswA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4k3cJ72lzlLULyTLEjCrCmKTKtrhyLVl
X-Proofpoint-GUID: 4k3cJ72lzlLULyTLEjCrCmKTKtrhyLVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX/OxJpWeVtSoM
 u9MvPJlVhrAHHllJ8Q2GY0woVikA7g6IJS0/tSiJ52ZJQ/LdwUDavyDkEawIEAkAOFpIhGH5oLE
 I1rQkCva0+dvHpO6fRpTV0MVX/9HGcmonxd+s2yQf6xg6XLP5/uiCX2vCCnCwKA/ErW6uCa2wzj
 TEQf8X3dDwRyPiyXx8KsXqxuJX9LrzGlLmUfp6onqDPlV2/eZgAj6wtt9+zqn7msIEq83Sdf2Oo
 Uh9qhpCPyS0vIOEK8hqSwlMFzzVoIZ4nEXgsCQTqbWXLCaMyhPpq30e98damxUukCakLYeiZZ1v
 YgHAwX/XLsFbvEMPrd+ACOE2MeuMl+q0VybfUkxwZYtyL5NqSwk6I5unuSSvrerJjOOak+kUG/1
 Wj3zs9R0oWAhYGGfAUJs7zBGJRO+c+Vq4gTwucpUr3sEPlA3t/WYOl3oFBd2YtFlLom2tSwCG4O
 zot/a5W12ezcD/o/CeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_msavaliy@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57943-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[quicinc.com:+]
X-Rspamd-Queue-Id: 15A39388B21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 3:43 PM, Aniket Randive wrote:
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
> ---
> 
> Changes in v2:
>    - Updated the commit message.
> 
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
Add an explicit comment explaining this condition.
e.g. Read message causing write operation. something like that which 
justifies the condition.
> +	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
> +		peripheral->multi_msg = true;
> +		goto skip_dma;
> +	}
> +

[...]

>   err_config:
> -	dma_unmap_single(gi2c->se.dev->parent, addr,
> -			 msgs[msg_idx].len, map_dirn);
> -	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);

same as above
> +	if (op == I2C_WRITE && (msgs[msg_idx].flags & I2C_M_RD)) {
> +		dma_unmap_single(gi2c->se.dev->parent, addr,
> +				 msgs[msg_idx].len, map_dirn);
> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +	}
>   
>   out:
>   	gi2c->err = ret;


