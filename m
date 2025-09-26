Return-Path: <linux-media+bounces-43275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8496BA5581
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 00:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC8871B24D68
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 22:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA4528C009;
	Fri, 26 Sep 2025 22:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa4ImZYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E1261393
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758926161; cv=none; b=mwXgmgO5QdPMzYcqR2h82Yc+H8+4tWtodeafBKgN3Ix9TymT6qfDNXFkZ4ZXWu0XlbWRZxNY/D4FtYNVEDzm1Hp9tFSrU5FYxubVAGkV6fVybZfOnuEGKiImc9qdxdrxMC+Gwtaljto8RbFqgnpYk2OcbhNAUgd+9wmLeZglYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758926161; c=relaxed/simple;
	bh=9purHNX1lS082Hyqiy1U7KvnoSCetzFJVKiqA+89V8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYU1NQ9O44jHK+pjC/7HHLlJLe/IIXv/J4VZl8jWR44weT0kIUbF/uQ+CVnr1YcWjuO7PMtEOq37EiscLMduPbkkuCQRGB97ddpifIxraFpX3Kr6kUDyXlWyl4Jd+kVSfkDzimrSVANbRb42EmsanVygjrkWnALFyLeXn23rYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oa4ImZYn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWp6v017378
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 22:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SoeY4l6ebsrYr5pagnV48aNI
	rgnvCjkETPIfrORiaFw=; b=oa4ImZYnM2V3WAMBIsyzs7kAnuckDrb/EzjN8BlA
	CodXqF6dZFTwu74QKBC4wl0XM0onTUVfpBpcmHpfiODxqL12Hjh56fs5QlqY+u9j
	/3K2UIQKxdmAd4SrLs6VpaB+iAJ9Zp6baHDpFL1oXt/5GfxIAgne46tyz5RKaSXa
	CFaA3AWi6O3OUtSL6Q3K4wlCZBwLQC0VwnEsdUCfFy8NE48Ma7K0NimyL/TYQQG0
	3U6zVHpvRD92zoVlV5B532RFk8DbbqpjOwZoHKig2EWoLnscWqarSEE7BAankOPD
	OC3mMibYKu5Bu6IFP5pN6vQXV+a+O4e3oO1LNU/zN8BgOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49dt3g9m9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 22:35:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dd6887656cso31798971cf.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 15:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758926158; x=1759530958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoeY4l6ebsrYr5pagnV48aNIrgnvCjkETPIfrORiaFw=;
        b=xNEoBfDEcT4kDbRPf5NVNeYGyvgenpDEOfM/wJkOrdt4N9WZjnStkptIls+IEjr5u+
         HJ4XEIopQfnKkevB9OeU9PrRhcTZLIpw9I1bc1sqhfnWjANiaYSleTO+nQR+nkCxjXOb
         m724W3ecVbGGIs+O2YaAs3WjQAWr5Y4g8+m60hw/YcBrvZpYUNsr+4Z3kIMTIMDux7wy
         EEdsn9xa3/Lzc6FGyKsPJWpPNq7JKHq+340nIbWkJcUfUEGpI6nMY1ek+x60GyF0yVCL
         ZIC0KKypoJFxqzEvQ2J8rQQjMkbzuKdnQ1mM1PSuO5Qu8sTOGGpZk1G2EIqXSWtPjYrB
         PSfA==
X-Forwarded-Encrypted: i=1; AJvYcCW6XTUpnolAciBPX5kpZA3zV7r3N9qKSF8mQTco5feNSZ4pAz9gNYg8rHcEqtTpBZpTEDHBy8si16dw1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWdFLf5MSkfy4d1Ios7kR6dKsjHYIWUHEknqY79RUSyZPd6T2+
	TcjhkNOfLdOnrquhLxoEskrohZMlaSvdy4nEpfrNvPWkFddoJoOmJMXqAcCqJQs3e4QGATwkaLk
	no9os9BQ84K9XcLjAV9Fbw/02axMRZte1ZUB4P1o8g7FcdEwNORbwMXofh2D5QqvtqQ==
X-Gm-Gg: ASbGnctXQRhJbl5EOMSbudWsn2OoGEGqhN4R2zEuNY1YeP+mfO9/ccSXMSNEYnXCZbm
	IbTvrE6QfZozG+iEHEk2DMEGYdYHBUXGZHtz6yolXVhNZGBFNGXqD7f9vVkaRvUrUq+jxSWZnzz
	kuJst+KkZKTklrh99l1OTH6kZg4F0ZWy5ZqRn0VO6ZjLjuI6M6f+5b3z9IOrVaYE5R7sfuhqXPT
	jqBd/xXHJ46TWOF+2aF8r/wFXBXgYTF0i+A/ocpw/06IGHgEIvK+DhroxRRoUdb2/K3qlu+3cPC
	b4+ub7TuAaX4y0kcUhgtZyx0sMuIGZHWulE51Nvk9qfWn9veaFq/iHJBHIyFbFWWXxRDhRegpti
	UGrZ2WOAATtZl1sXN4+93EfieHMZ0gpVVqsKCLjQqg/JVxMUPNmh+
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id d75a77b69052e-4da47a1a220mr115923121cf.3.1758926157782;
        Fri, 26 Sep 2025 15:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/mVxWB3lmLAFeQC9Fvkdijqlfs9w38uYfGjjdvBN7+TJwGSvqr+pkIUIo3hPrxbde64DYZg==
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id d75a77b69052e-4da47a1a220mr115922721cf.3.1758926157253;
        Fri, 26 Sep 2025 15:35:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430a7dsm2147362e87.22.2025.09.26.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 15:35:55 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:35:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
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
Subject: Re: [PATCH v8 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <vdd33houteml2inilry6vkqdpdm7vykcqb5vf66sdhq5knlfhr@mzlrb5babocx>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=df6NHHXe c=1 sm=1 tr=0 ts=68d7154e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UZ83mHg5h350vH40qggA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ODc3s9QxPr9pJg5t1Qny0GI4YYdxs8JO
X-Proofpoint-GUID: ODc3s9QxPr9pJg5t1Qny0GI4YYdxs8JO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwNiBTYWx0ZWRfX5uBUqptlDynM
 qnHOiY3e+5LzEbwQOuVoBgoKEvmneyKOHgUtkcElnjObEVOjzZjRrWHheJg66xx14JOWxSyOVsC
 TDbkwObNY/6Kd8dIostgHfDxwXvpR72s62sYG32xdNENINLhgoPhWdHmGHczsROn7UDWm3njYHW
 /hHUL+vogOsCdKF4niVbi5xvFh2OlU7g9cIUT+PTx5jo+5JM8WvdZrwc4SI7JWkdmacdeO6sTvr
 EUOsO+hXMjUGRh7njVRwLSniRJyGuBQzNqptUgd7uW2KARw/LJPi28DuagLcOJrO9PsGvAYCUMo
 H0nqx9iREQABSluRIHvDkLc6eMcnTt+iPkGDoKE9ZXZjbL9JWip5rNYEtQn010Wtj1xJwGet0R/
 IxF+dt1H3OnKL2OIHm1n1W9BjP7D1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260106

On Thu, Sep 25, 2025 at 05:30:34PM +0530, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
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
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v7 -> v8:
>    - Removed duplicate sentence in commit description
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

