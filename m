Return-Path: <linux-media+bounces-41645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF1BB419DB
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3CE682F33
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73692F0C6C;
	Wed,  3 Sep 2025 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqWMLX4t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68F32EC558
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891545; cv=none; b=DU8Oes1IFHcYH6TbFSNpOPnWzlXNbIhGM3Yp8a1FkM7FNC6bjj9au9/3khmCXWtdk2VoufzSQ+2E9BBL/oeNt2TpqrLbM7tLz9L9Jji1IxPbyuZ4KiK5G0rPdDBUPiG3SgH6UpDbsQl/SeIqfNDtkfr1pJ2QcQYg/30GQOV5zGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891545; c=relaxed/simple;
	bh=G3KruQfuGQZbnwyFFVg7lnm/oURLCwtkXpoaHPhMKhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsF6+sPmEaaA3GBBsSVQXfHja1uVgvLV/LT9XiZzqhVg9OnwMmtCez+f6eJSZ/m/+XfeOUK/CAYG5yPCz25O+X7YUT9PLhQvKFEylRJTt7zkrXPDvZ7JN0CZ+6FET83muGjOSAS9SPy/9dDk38eqBdlctViZQP6yChAnawhCjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqWMLX4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832dP6Q024018
	for <linux-media@vger.kernel.org>; Wed, 3 Sep 2025 09:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qiSfzdg4mC017dQavh2saF3D
	nvq/ylNZxxXLO3pOk3Y=; b=jqWMLX4t8mAWThwfHqlfOQL+5UkXlSPfUK0Ti7YJ
	tJunk2I2Xg/w5+Yt0BgvCAwhKQjj06lSKt3AbovqMDZO1m5oLvhz92QXlUo3H7ij
	0+kNYH/Kb6FMq5eC7zb2vwuzi8hmt4pcDYZJYZmE7dXBncAIzmeKDfEM0IG8TB8A
	E8zm9Cu5t7QBGI3nkXenmXc7jXQrCobgopq7Zha5M18tJBtQLbzgtBBEzIs/koyo
	4QHBicW8kV0eXtsvi9pNlrJ9AK8c73cW63kA9GfqVExDCgmegkq8BTQmHnuC2jtv
	ZqYQovft3xMcTrVZpK+CPabjifkiu/Z8fmsZn8XyB7WxOw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush32vm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 09:25:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72631c2c2f7so3774176d6.0
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 02:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891541; x=1757496341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiSfzdg4mC017dQavh2saF3Dnvq/ylNZxxXLO3pOk3Y=;
        b=o+OdsNCgJe7XtH4xy4ubSgxFlPRWhX0TyHfNz/p9tvXdAZq+8BwYX9i8MxElC8WRIJ
         w/7TK4dn9nBFmiSVGq44wHEQ9PYpmgCULKe/Pa+2AFlDceoIcjYRV0HMQv4CFEQC93gh
         tUdegiDQCnXbT0CpDmMXqzRSVIiH0keOJW9fNGc/o39Gttu/ZbmkZs5QgtrrksD+38CY
         Jv6zcH7AtuwA4AqdT0ID94RMTRy7K6djXNiDzN458w3HX0eaNmeYJzsqFm9YmOjHpzcD
         I9YSu6qffJoUcVFV3AUbs4GEY8XTEFmMAKQ+qpRiC+cbtRfLnWN92TjLCx4NS7XUkyVY
         3b+g==
X-Forwarded-Encrypted: i=1; AJvYcCVJZclzX9fbbFjrdQ/znLhAqmNZ6YlXoPSEcl0FXoAVr5vsFVq7VrfNvyItFXAipYG1ODBlfJPgcvU/Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSUu0aj+DZdF/p8Jhy4gfQfSFdMejFWByAEAvRnUdFjIC5FNn
	yVTI0RfOXZoY5SSz6nS2pEQrbbiemMvQoqHXv1nABjSU6EVQ2/LEVNCTZ6+QMDqk0swBt8CpHKV
	LFqWCtnrnazcQfytOGB7S5SjIG6zWIZeGs6RU0C3KTt7hAmD33QS5PLtjES532YySvw==
X-Gm-Gg: ASbGnctS9zA5xuky5d/sTKyRfSDcbvqIqHRBzk3cIrN8J6zeTNxxe8Q76mJmhZGOSsW
	lXS/HwIA7eno3W0VFUjConTPF0eCcSqDpCbE4he4dJOhEjiBJOwCt8PJSHGaco0zSN3sJlnIAkS
	NI+CgjBmiMKsgsTZ2hhosyLiF1lc2LbKtn2x75j2aktEGxyTIjxVBHPyLMINu04fFkcQ6n2C+v5
	Iky3YEQ++1CULn3RucPyn6P8LVPvUbMTmgjmOJljGqEfyvUh43VyG5V6wNOYu0EQSVQ2pQTapFR
	p2GQO1hO+kTn/sqjvAhqd+HVplbPA9GK962S0edjiRDOaibjf44gex199e10PkXMOeb5o0Co8kN
	8r4Fv/4gqTg6bq8Tr4yjAWMUfcppHZj8eGNeniLiADH4FQM5Fzqgm
X-Received: by 2002:a05:6214:29cd:b0:71c:53c0:564f with SMTP id 6a1803df08f44-71c53c05df2mr85543016d6.6.1756891541016;
        Wed, 03 Sep 2025 02:25:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEffBRG/vxF0pIEnmq/bDAD2fvhoCl8Yhqv0aQxeuHDILYhYTHgkBcj5YQbmS8/TtFPfMC5A==
X-Received: by 2002:a05:6214:29cd:b0:71c:53c0:564f with SMTP id 6a1803df08f44-71c53c05df2mr85542856d6.6.1756891540533;
        Wed, 03 Sep 2025 02:25:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c7esm390417e87.65.2025.09.03.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 02:25:39 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:25:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v7 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <xy2jgnearfsoln7tmjbb7l6zuwm7sq74wohsxj77eeval5wig5@kisng4ufgbuo>
References: <20250903073059.2151837-1-quic_jseerapu@quicinc.com>
 <20250903073059.2151837-2-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903073059.2151837-2-quic_jseerapu@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX9yJ5D2UyGQO5
 1HSR0zrTVejluErwgNQsYZR+/j3qiebm63G6w6geLJX1zaxN1+astcuBXKRKacvdhzxPjIyNCLn
 yW5wMYIYgsRAG5cj3KBtal0bY6/KyrdnlXZ/UpPsCyvqUy2t+rNtkXjk9+HYEVP0qjqc8lKDG42
 Yzn2PW4aOR94vf0Zi11b1I+AZcR2Ekh3OaqcOLBgBEm+S3QFrHxzApoCytXs31OMdr9V5e1YNvw
 razCKidxNaIwJuKoGN4BRZZb5xNAk5ak1TX98P0BRmnIUChPd1bJ0K2FHagitRaEBtOt639SaMs
 jPvocMPNFjZvrHcJhyr4UTUXjMqIq/PUJPG6Te3RKYD9ubcLUmWuLGv1VarawOYSkOhAuoBKLDb
 3csbj+c2
X-Proofpoint-ORIG-GUID: yF9wA21PENrAuKChg3HPOfzu43CKDzP9
X-Proofpoint-GUID: yF9wA21PENrAuKChg3HPOfzu43CKDzP9
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b80996 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=JXAtfvraFxK_IdIfcZsA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On Wed, Sep 03, 2025 at 01:00:58PM +0530, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> This BEI mechanism enhances overall transfer efficiency.

Duplicate phrase.

> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v6 -> v7:
>    - The design has been modified to configure BEI for interrupt
>      generation either:
>      After the last I2C message, if sufficient TREs are available, or
>      After a specific I2C message, when no further TREs are available.
>    - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function
>      and so avoided using external variables for DMA_PREP_INTERRUPT status.
> 
> v5 ->v6:
>   - For updating the block event interrupt bit, instead of relying on
>     bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
> 
> v4 -> v5:
>   - BEI flag naming changed from flags to bei_flag.
>   - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
>     file, and Block event interrupt support is checked with bei_flag.
> 
> v3 -> v4:
>   - API's added for Block event interrupt with multi descriptor support for
>     I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>   - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>     I2C driver.
> 
> v2-> v3:
>    - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>    - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>    - Added documentation for newly added changes in "qcom-gpi-dma.h" file
>    - Updated commit description.
> 
> v1 -> v2:
>    - Changed dma_addr type from array of pointers to array.
>    - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>      updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
> 
>  drivers/dma/qcom/gpi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 8e87738086b2..66bfea1f156d 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1619,7 +1619,8 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
>  }
>  
>  static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
> -			      struct scatterlist *sgl, enum dma_transfer_direction direction)
> +			      struct scatterlist *sgl, enum dma_transfer_direction direction,
> +			      unsigned long flags)
>  {
>  	struct gpi_i2c_config *i2c = chan->config;
>  	struct device *dev = chan->gpii->gpi_dev->dev;
> @@ -1684,6 +1685,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (!(flags & DMA_PREP_INTERRUPT))
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>  	}
>  
>  	for (i = 0; i < tre_idx; i++)
> @@ -1827,6 +1831,9 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>  		return NULL;
>  	}
>  
> +	if (!(flags & DMA_PREP_INTERRUPT) && (nr - nr_tre < 2))
> +		return NULL;

Comment in the source file.

> +
>  	gpi_desc = kzalloc(sizeof(*gpi_desc), GFP_NOWAIT);
>  	if (!gpi_desc)
>  		return NULL;
> @@ -1835,7 +1842,7 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>  	if (gchan->protocol == QCOM_GPI_SPI) {
>  		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
>  	} else if (gchan->protocol == QCOM_GPI_I2C) {
> -		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction);
> +		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
>  	} else {
>  		dev_err(dev, "invalid peripheral: %d\n", gchan->protocol);
>  		kfree(gpi_desc);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

