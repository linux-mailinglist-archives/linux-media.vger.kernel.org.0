Return-Path: <linux-media+bounces-31840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079CAAC2C2
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 13:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA260522626
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 11:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C279B27B51F;
	Tue,  6 May 2025 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTvKmk9K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C1B27AC57
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531163; cv=none; b=EBawzt6KT/Lt5VjRlvdT+E8J5v7tcNkYpHR5TdHQFDFtMT12BaVKgNCoSn5ncdwukVeQ4yARfOGaC3JOMRpIwuZhAFX2e0Cwd1p8Hmqbu1cwHQtHaXI3xpY9QEmewXPJbJVPxDzEaAqdMlJcuuh4hrVflh1WbuP+59ie1zsYyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531163; c=relaxed/simple;
	bh=wgdAEoTSiOxWP+EKRKfL5Lx5Umr33FPeJxeC6izneu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwIjenklU+T3m3XMcmA4SVkZOEEo5xWBYMPA6QP+L7Jrg4fY/L06IJfj6ESMEOWcqfLeXv+bha5DSJ5bEP5pyuR6hGVTSatoMtOycG9vt4bLC0g0BffY5RxS81hutr8zY1iRXjn66RhT0JTxlVByeWvSTLj+lCly/pmhfYoWv/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTvKmk9K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5467IbP2014813
	for <linux-media@vger.kernel.org>; Tue, 6 May 2025 11:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fwl7sL+33/f+eH9L4tdGLHOE
	I3/YzHIvUjaSA4mATTQ=; b=KTvKmk9K+OE0l3LiE+I2xJI5LLXAXDQORpHxQXel
	CDhBIsjrUo7truGbI7eoVJ9L5pKyt/BsNcA5ye6UKiUe5vfdT0ybVmrjQE/9rYrg
	7+PMrAJ5Ar/zsZGyNAmkkDiU9eJnuuPleQ+PTMcRvI+F8VWBkDLdkGp879GxVJzg
	Bf0/ChKVzesdbW+zHFjKL8Kx2cT3JVfCRpre2aGhDNN1U0BZZYBBCIlJcBBChpx3
	D4MQ5dN6D5UJViMSwg2PMa44dBNc9UoDQRyJydVJ8ouLc4IuO5QvkiJzWIC7z3Tl
	c1cWLYeW019GLMkF7fugxOLzFAy/bnn9ROWNO9Xb9L6lyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fdwtrs7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 May 2025 11:32:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee990715so394594185a.3
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 04:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531152; x=1747135952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwl7sL+33/f+eH9L4tdGLHOEI3/YzHIvUjaSA4mATTQ=;
        b=IwiDu5R9IlWo9hbOY0tVWpsKXvHOKL3oUlXDKta2pHDRQZi19X9HjNqIuNBSaarZVz
         nMvn3Cz7esMDRkjLZoh+dvXGqcEZHV5pF2u5T8uOKy1fGYj42RnhyvoLrwx41hOFneyH
         aPFpoqTQrOBcXXTSPauJhWklR3RIOl/0I/yv4DIxJ8feJ6hHEak8e14rKC3e62ZE+KFF
         BCy1kXJIkw95FWZCoBM4JbMBZ+fFF61pCxehzLKcA2Mc9ffNwGyTctccnIvoXeuZcdNi
         18P2lg2KgYxSghODsuFJFxRkUd37HJlCNiUVFBB6j/YVDNCHoBDDLcgRL8K5ooFyTn9N
         nEQw==
X-Forwarded-Encrypted: i=1; AJvYcCX2GkwSgvKGgwDkpv0rz7nR5OhsJF42oAw7tZiskIjSDci4HJGAqxfMkFbsNrhFbEqkRDYd7Q8ONAmO9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5xiKQZWL98vxsRuQRKSLJCOJCJKsQ9F+4IizWTFdCqVg9g7v+
	be7D9oxWq/KRVfA3y7FAjGoHzlJ7J1yJ1N01xKLg9oO6lGx97GkD3nWqoqnYAFinrCIXwl9jcDU
	18ACZ2aZqJ2OpZqYA/IABbD7BlCazzfsZ+z/gGk0pileA2Tc7tpy5/nSCMnSYiw==
X-Gm-Gg: ASbGncuA7jajHWZuYQ0UC+B4+PWhXOm1JJkOn9B6fnIrL/8hk/uze+W8CATdCbhOsHg
	IuNc8CVwn/XYGp3Ohti1+NUzWpdpadH0ZfKWbNkAl2/RodzqYv0AUE/VIiFXVGhDqQPcftavgLH
	i0lTZ2hMLwV8pEZ3eR1KD0YWRqSTAqynNr6mfK9CLY1z+WYJw4WMAbujBRHp+8KL1pkD9HxMpZ4
	BXIq0bwKHEByQdwqTq9Mjw2yBbufdys3p+dHv70ToamKMdbLbnNI1liPili1FYAo0CvBNaf87O/
	wFl9oFR/R+8HAgTNq6AwyMk1YBXyK2cbjZTM6jvHgrRCDvDRZOE2wui2y6Jc+gvkv4uX3/p5tzo
	=
X-Received: by 2002:a05:620a:170a:b0:7c5:4d2e:4d2d with SMTP id af79cd13be357-7cae3b0ca45mr1565852385a.50.1746531152615;
        Tue, 06 May 2025 04:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh5sYkZSzYvTbugryEFcZleW6v/iZDEThUuz+Ah7LtSsuWl3cmvTZ0zKAiaQcydSJfq0ywvQ==
X-Received: by 2002:a05:620a:170a:b0:7c5:4d2e:4d2d with SMTP id af79cd13be357-7cae3b0ca45mr1565849285a.50.1746531152291;
        Tue, 06 May 2025 04:32:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c0897sm2039490e87.83.2025.05.06.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:32:31 -0700 (PDT)
Date: Tue, 6 May 2025 14:32:29 +0300
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
Subject: Re: [PATCH v6 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <ze5y6llgo2qx4nvilaqcmkam5ywqa76d6uetn34iblz4nefpeu@ozbgzwbyd54u>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-2-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506111844.1726-2-quic_jseerapu@quicinc.com>
X-Authority-Analysis: v=2.4 cv=VPPdn8PX c=1 sm=1 tr=0 ts=6819f358 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QOsQMPsNCkuRs1RMv08A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dPFeIjP4JEqLfWTfd416ab8HJHrMY79V
X-Proofpoint-ORIG-GUID: dPFeIjP4JEqLfWTfd416ab8HJHrMY79V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExMSBTYWx0ZWRfX8f6tk+N1Hfhm
 iHs/H65ulWB1PAugu4MFSoDKwEj1ZB6+BYdzXexUJYEGsJCLl18JtNafnUd7Aib5D5yLsCgNYLK
 OeIxEWMf232FOJQCpvtZL2E7lBzed21jVLkMju43l+lR2pSpxo+hgU0XAV3gCrEoeV4pGIodex5
 +p9bnc7n0HrhT5DZ44GGsewISxsWYfr7dQwFglXNu1rhY7tFJaLyk6y8ABBuuilFRQhBZeh1BZE
 puj9sd4c0hjU3iqpzPBxusaOPtdmnU2EEbQO6O7h//UtcNLbX2hgCMfriT2tUfNpSarmsh7Wsdw
 bxnB7OmdsDZVeJuN30WUf20nKLqOjmUVtu2NIm0AFKnZmkIQueb0cQhfAfHLs4KOIAbdmyNL080
 E+DqAToW+8264SB/4o/bQqlG/Ee1V11ZBjhaVwjKVhL/zz//KiTTO6I3ph5PmIdwuWKO99tH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060111

On Tue, May 06, 2025 at 04:48:43PM +0530, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8 messages internally and so interrupts are not expected for
> the first 7 message completions, only the last message triggers
> an interrupt, indicating the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
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
>  drivers/dma/qcom/gpi.c           | 3 +++
>  include/linux/dma/qcom-gpi-dma.h | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index b1f0001cc99c..7e511f54166a 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>  	}
>  
>  	for (i = 0; i < tre_idx; i++)
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..ebac0d3edff2 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -65,6 +65,7 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @dma_flags: Flags indicating DMA capabilities
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	unsigned int dma_flags;

Why do you need extra field instead of using
dma_async_tx_descriptor.flags?

>  };
>  
>  #endif /* QCOM_GPI_DMA_H */
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

