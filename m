Return-Path: <linux-media+bounces-58081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKu8Hfw402kwgAcAu9opvQ
	(envelope-from <linux-media+bounces-58081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 06:39:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D01023A1745
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 06:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D97FB300D6B9
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 04:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA99332610;
	Mon,  6 Apr 2026 04:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDX/karK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxNpd9NI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891103090F4
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 04:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775450349; cv=none; b=jzD9Qea495IPGb3GbeQZeExCZCw79UHRTeN4lYAb6Di4diX3IPdUXQe1s3nAKrHT90rNsIy+rNyyXO79AkVq6evW3z4ZIsidD9XzrH8F7k+ql3c5khX0g8mviG2dAF1byBFTLTkO4+yzNW9MR9vyZLjjUTqysPd/6r3bBNqo/ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775450349; c=relaxed/simple;
	bh=hYzlhM/t+dDRTUfbfx6zAk8nn50uMAuvgykUfLAEznw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j698jTg56Ta4wCF1ZzqjmaRYSY5mwokcN/mfgF6CSNAZekvJuG2BHltGlbkloR/ble6bunRxdzuX1TVLXFQs5o68oaprF/GeLbD45cVeoCyL9+CMWbo5Jfmmx1M+0uINGbVn98vUUEXW6PFAfiSVvXo3VqHEm3lCFqT41ynE178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDX/karK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxNpd9NI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635MYlR81066225
	for <linux-media@vger.kernel.org>; Mon, 6 Apr 2026 04:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ErGZ9VGt485klsK/g/5Yj2oyGp2dAuXoJriTQiswEyQ=; b=aDX/karKvYmPtB5E
	ZFzkJ4/tawXZhF55uWZwsPOFHXAirMRJk4eEple/+0j2HijDm9BCh2aithOdvobR
	zBqot8XcvpYSnhWCiNfRyMLbZpOK8r5NAuS3rkZ+iUDsOnA6EpQuKbz+EoIXrNLR
	p45gI5vvbbdKDPNW81FIL5SfBswQV8ELidtvugTxbDlPG4RbCA8zLtXfi/lFk9tl
	d+JgZX5/h4krD1m7uakjeutr6xSEn8xqMRDpuztTyvkMGFQvMyRcyzhqHarmT/w7
	r66Nwi3RujeDn8f7iOFL5UISgbIb7190ZbCUiWeoI6XOhDucZA7lQoPSRoaN3+wr
	G39PHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5uw8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 04:39:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2489af602so34674135ad.1
        for <linux-media@vger.kernel.org>; Sun, 05 Apr 2026 21:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775450346; x=1776055146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ErGZ9VGt485klsK/g/5Yj2oyGp2dAuXoJriTQiswEyQ=;
        b=AxNpd9NIj/lrjoffepMv7JI4iTlDDPS/pSa7Och58+vOHW+2drPdIUpMws1CJDKA+p
         mCQZQzcmFjGjZZ4YkY/HACvdgwHJbT+rZzilOMsOO9z5asDv5ne7kjGYHykstIW+2LhS
         AmiQVBFtAUpFuTB3eI1/BsF8gAGLTt4R0cR4SpLDKFcQZmQ1CQXuiU1VyimVlGfwpJn9
         bB39mYrWSohAmzTAFa3bCKy66hv1kkWhmHu49gA2L9PFyQcYmDCxCF2JlkDol8Er3sdG
         QhtO3TmIk0kp4z59PbEYIS3PBh9zYY3CNh+xePR1+orJxt134La5weWqQS8uNtybNYk5
         TcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450346; x=1776055146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErGZ9VGt485klsK/g/5Yj2oyGp2dAuXoJriTQiswEyQ=;
        b=KL+0iaN23ljQyHXFJVqdMb3XKlM/J4hyyaBP5HwTbiL/gvxVYAbeoWNiuKauL1/GRQ
         vraGJP5atWKVrYkLOQuSeBzK6IXqcQZtGfCYrfpzLFvzyiag3GNWwUoF4T88x+9OMEdy
         LZOT+7u5V/quxVDMe2pekJibu1bv7mlkwKUyX9v7YI8H0ShDN3RreXZ++Fo3CLg2AuTc
         WQDGRuVW+FybbRm2aKh+pSyM8FifZ1qytQW0KiVRF6vvXG/uR6vnzwi8imGuGm7a4qog
         MnYvm8T9ojGNkrpXZocR962gLaQ5lKQjS7/DfTbppdllboCK5Sm9LSBicAepbrLkdRAk
         tIBA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+UUGHTBpcx6yDHPofXlwJuF+/ajWii9HSszC2lZtxtbsxyP+u3/nHAVxuf9Ozh/OR/bdIK8/RWZ4Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRkk76Uu0XfMDOpTINJv4DoMbNFjw28loipwOAhoO0eKiAZ1r
	WePqeGODgjj9MFDcA03v0dfKxDWkoxOt9X0qE9RgL2LgrMtA0klV+4gID3uwFKbxdVoLeFJzEXE
	P6Mz82Sk4p1crH0DCM3yG+FHUEq+4lC3aKvAgn/UesWz/xE9sFwrenulxIh8Ybsa2og==
X-Gm-Gg: AeBDieuuTdwhTFcHRLL+WUVnC9zj7WOsargHqTCh+L5QVgTgI1XY0PvY5LpTVpxNqmd
	MWtIL/KH+aaa//01AW74/iFqma9cteGJn8KkiQxszb558c/A3TbXsnCl0dHoTDZfDbmxvvAGSlh
	COXOgk8Wvt7CEqGH4xOAVAaJtBhtDe93uU1EOhByWdwSlaFBtjtn59KrMTWTVF9O3ubFfwuS9iD
	EqJTwLcIr4T3LZL2Pbwj0kf8lbkB9TG6hMvEGnm0rLMqL4IuYoAVP+zWv/dVyw15ArWdl9qmed+
	u4Sg+9+c5TZtu+ja/hupW9A1LTA8hMIh7RF1I2cUmiD+xptyhXjcJrINgGTZ/71PlCXvSIzaZPF
	CT8kFojY3JuJ8y3dXEIYq3YhAspx3nV7zg7Hgmt3tBw49WRTDk+536+Uq
X-Received: by 2002:a17:902:d2c6:b0:2b2:53f5:461f with SMTP id d9443c01a7336-2b277e566a8mr124146695ad.25.1775450346415;
        Sun, 05 Apr 2026 21:39:06 -0700 (PDT)
X-Received: by 2002:a17:902:d2c6:b0:2b2:53f5:461f with SMTP id d9443c01a7336-2b277e566a8mr124146525ad.25.1775450345888;
        Sun, 05 Apr 2026 21:39:05 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm162456115ad.28.2026.04.05.21.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 21:39:05 -0700 (PDT)
Message-ID: <818da0cf-06e8-4a26-955b-67a3d5392e91@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 10:08:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] i2c: qcom-geni: Avoid extra TX DMA TRE for single read
 message in GPI mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260403084135.1300931-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260403084135.1300931-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA0MSBTYWx0ZWRfX4T2ZG2ZQZbXJ
 GvBJkIFEk4FCreija+XnR+XmpBW0k8F6UVrFyZ2UjpX28ZM0aVM3LKNRvH3nuJNWykgmTa0i7vB
 ljlfbFbOVWHiOoZqOv/q+K5qEjPK0j1uMOO/qc3lOQCyhHr6uhk43MOebeBwJlQ8ngE9fIvHCxV
 GAd6NqdybWwhVg7E2b78QUVzGoxERUl4xAs3PLgagHEIJcBgK4yzl1FRLush/SD9TCBn0dejfJ9
 G2lvc6dBXXWJSfVND/8MMNBpzDKLN/RZbMF1AbpzO+0yIbd7LM7Dm6Wj7uax7uGYnFNiJ3Cy083
 stQ/Lx9pzQE+UKHX8X8dul/pSEvyamHEuy3qjl1l/TzUD3WpD4gOJC538cyjGSGjC2P3okELGtp
 7Zw4kQT45OKRstpn7aG64mfv4xLdTg1LqjlSH7Q5S4YAqRLS7ABk0J6StmBHAVibyn0wtYxGfRT
 OrH8Cz/pCPaLT/r7P9A==
X-Proofpoint-ORIG-GUID: hf6oaWu7p94igZ5FIzpwRw-LLW8WlTsp
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d338eb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TIcjmxIkOcpZypuolxMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hf6oaWu7p94igZ5FIzpwRw-LLW8WlTsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-58081-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D01023A1745
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/3/2026 2:11 PM, Aniket Randive wrote:
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
> Changes in v3:
>    - Added comment in the driver for better readability and changed the
>      position of 'skip_dma' label to allow dma engine configuration.
> 
> Changes in v2:
>    - Updated the commit message.
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a4acb78fafb6..78b92db7c7fd 100644
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
> @@ -639,6 +639,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
>   	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
>   
> +	/* Skip TX DMA map for I2C_WRITE operation to avoid unintended write cycle */
Seems you are missing writing important point - For read message ?
Important is to clarity what's the condition we are handling, Skipping 
something is anyway clear from goto skip_dma.
> +	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
> +		peripheral->multi_msg = true;
> +		goto skip_dma;
> +	}
> +
>   	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
>   	if (!dma_buf) {
>   		ret = -ENOMEM;
> @@ -658,6 +664,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   		goto out;
>   	}
>   
> +skip_dma:
Better name - skip_tx_dma_map ?
>   	if (gi2c->is_tx_multi_desc_xfer) {
>   		flags = DMA_CTRL_ACK;
>   
> @@ -740,9 +747,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   	return 0;
>   
>   err_config:
> -	dma_unmap_single(gi2c->se.dev->parent, addr,
> -			 msgs[msg_idx].len, map_dirn);
> -	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +	/* Avoid DMA unmap as the write operation skipped DMA mapping */
> +	if (dma_buf) {
> +		dma_unmap_single(gi2c->se.dev->parent, addr,
> +				 msgs[msg_idx].len, map_dirn);
> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +	}
>   
>   out:
>   	gi2c->err = ret;


