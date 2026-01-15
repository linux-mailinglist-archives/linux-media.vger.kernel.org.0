Return-Path: <linux-media+bounces-50756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD219D23026
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 09:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62806305502D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 08:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186AA32C92E;
	Thu, 15 Jan 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V40aoCI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yr/mRmkl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2432E32D0E8
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768464498; cv=none; b=lvaj0hmZJNgfjmE4qa3tQesB6Y8Oq/Sh+mk8ZQN5+hqPlCVfoV2ow220J+Ou+JX4dZ7EHbGbtzc77lIMU8fRprNQXq1NjMGX0fREWgJm0JETXOiBazOegO2BUW8pxxaAz3Pci7jSp3XmIJVZBP/cGk5Lr9KFbEgzqSUfdSn67vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768464498; c=relaxed/simple;
	bh=8nx1G6fzmnPE7anK0AcvZ03pFQSbqG823Osvd1oFCRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAhvAwuT6JN3/jhQJ+vqheeoDswDSlD1/p+G3iWpHtA7zcXQlP+XdFaUUIgoYAZu/6vgewr5u/yPmXXN3/xNvyPUaP2KncnwyvO6xMLNOJwjaWRDD/K1XFeyokDaQMq6MRL59yiO53o8nh9Fwh32nLIgAESbpBq4Ne0cKXTLUs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V40aoCI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yr/mRmkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fxDT1991708
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 08:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KJKUj6azlC7SlDOaxCEBUbjv
	lpTDwtgV7Ulfhgt11H4=; b=V40aoCI+hFNgA8ZMOjEtzNCA/d3JhmEOiduJorsH
	ENRSAJ01iEVNJRxiVw9sazgpd3/1P2Ncfj7ZKENxY6JCDBi6guy6LZV9XIfPbEAZ
	zaOH6usE1g6ugPuEp1jx4tg24kaDsEAMynvfqlGDOqcrBjxUo8xfkUH4VpTiD3Ik
	jd5/PrpPdiDq41JchEy5Owl87K4puYLzWrgDyQgm/eAqDNpj+8bi0+zGHx4+MXGA
	4qRWYRLn6X4a9Kl66w82+WeZeUMyGKS+lypJJI4oiTxhxHLwZjcyJb3gLr7GcKOB
	CIY63KIRWBOd0wQMTlxCPOHWfTzeR19ihQFzwMv6ap7rrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbu5a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 08:08:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd4cca2so167324685a.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 00:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768464495; x=1769069295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJKUj6azlC7SlDOaxCEBUbjvlpTDwtgV7Ulfhgt11H4=;
        b=Yr/mRmkl06KGNTnATA9oVu4e5YC0/wXDUF/3j2ABPdGVtqh/4wcWJNYPDB5h5kr6ur
         XYj3jrOirTajUJKbG5mY3rMutPapgn7fCySe4vbmvMvNz4CYnWNYvnvl6zfFjhZ/Mwj2
         kos3m+CNTVN/2rFEAckO9ZrIvka2cZsqg3mA7S6nXjKqZF6IC87eNQ1S8XHX2vQmhf0B
         +VEa4qB0+HsKrNWtj+5naDUc5HGEOr9JT43hHWaPZXF9B60ExAM38PaKEbvuNDcMDmso
         NkZ+UJPlhBTKy9/dE0935BRY9qHOz6tJsjSWaCiCaOnJtBDSuV7qlKoZiLgZwXiYtUz/
         nXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464495; x=1769069295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJKUj6azlC7SlDOaxCEBUbjvlpTDwtgV7Ulfhgt11H4=;
        b=hDlc0NY0+/eSYKCuoe7eVZn700cMlOrIgQ7sK9pSjZDMzNMv2Kbq3aYPhNz5F5ZH83
         xrE5CG0Iec1SKjfOQoUouqlgKYwSvIyIC8MewBZVgNVRJAmdXBn0xFmgLJC5cyJ1ZQrp
         chiQtEVwQ9myhBWL07AWAMkRVC/e5IZ7pMys2RoetvMQjnfoJmveyzkfLWvxbkbOM8zp
         pQIyV6xOJopvkBm1kZIbn7vFyaxY4RoFAKna8ZE7BInV1xmS6S8DZgzGN68rziIeyDoD
         QrgvMK8yB7yqnuW3zAkEjkKSKifvmznClmc8XwM16DLFNOWW4txUotXCz25w9dr1Nukw
         WNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCYDaD/tvDYMTrSLF7OnS5hadmVRAZFfni5BX9Y9NP9U2qeZPHckkRO4nwHDPdBOdIr+x/0br6jisS3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNNzy3M/yliJHNcL9B0sEgnDneNgGrWUdRhytjD/R5DA0Exmvm
	ZtQfyEccrZepkocSLrArmNfx7hSWYc1RQcriYpm2jLDi2vHPyxwcRbX+Txkkpe+Os5A38TEMtPD
	uwEUh+/Pk33FGdB2BhMVIV9FKic0uNubdQqYaj4EybgBXQujwcPtF46PemmrLj0QHww==
X-Gm-Gg: AY/fxX4T3xHOzna+J5FdknRDSUsqRGegVKJgZUnt9o/bunUAA3AO4rXSHEz8W6c5+EO
	RIGdaY40WNfwpzuqCouFPr0Y3mrBrJvbPb8w7JxENJ3bpJR79TyG3GcFdjCHZrxI+vu7YRGZNE6
	xueLzopBVxp0P6foftpvMfeBX71zO6EsNSTEQTKJqCX7GPQ+w3QQ1UwD+T4F0KrU6Ndj11x4y4o
	RsqwxMOVyJw3qOVFeTCo6W+lPisWd0W/MZwweK4S0yXOTLAWO5IHqbcHxJjT5OSoB3zx0Y38x4y
	XJulFNnqUt5OD9SHYC/MdF02xZO28Iv4bMpDB3pZhRefId8wbzMUDxyzZ3CJ78NSHfdiGpVmgdy
	A0SwPpXBk1taPJKqK2SSbTbIu3mU5CNsIgRtOYvszAIcrd2uFlE9AYim2SmTK306tKcDKfTsFrj
	fSmNqK9SkNaV41vYMUW6tcNvg=
X-Received: by 2002:a05:620a:40c7:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8c52fbe8018mr763794385a.74.1768464495301;
        Thu, 15 Jan 2026 00:08:15 -0800 (PST)
X-Received: by 2002:a05:620a:40c7:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8c52fbe8018mr763792585a.74.1768464494799;
        Thu, 15 Jan 2026 00:08:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1045bb2sm1438574e87.76.2026.01.15.00.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:08:12 -0800 (PST)
Date: Thu, 15 Jan 2026 10:08:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
Message-ID: <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968a06f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CdEaSrd-WWRwSzuxfYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CUwKBx_Nwwt1qXl_ur2vxcZv5AP0qgGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NCBTYWx0ZWRfX8PK1y+wFdCvD
 n1SLTvDmh4jQ1f5V/oovps8DcLZMJ9GOsFvCo5UdDnoxplMXgxrjaX2gB74lz9MMJEhZeKM9KjV
 C1W0lia6EcxezLo5EFjK3Wd1G1EogiZHktM5yqppC8VaHwr7jkYZP0h9tTSGu1WLHkXsRNDZ6Yp
 D9IU9431/tMLPyqy/tAvJx7bUcGx1BR5NhR0Xyd8W8lZhBHIJ8lXOVgwifmq5Jt477G2Kly/hFU
 NAQguCjNAWHtCXGXGRaAiINyg1BA/hGTI+2fd/W+iD4t8khiq0jKmVgHpHSldVLfYEwvuvufWhP
 zRkigyIoEh9CMRCwuplzCH5kscacXm37q9GN4IXbbUZ6oafYULS8IllESzrwm4viRoz41rmYhxF
 hR+81kvH8MeuOHbb50w6R+ANiGTY5BRrxX44eW13Xo0L7Oqrno4aQ6yLvaR3mL7eZmg9NlbDdkk
 HCKwxt6o5nRnhRwgTBA==
X-Proofpoint-GUID: CUwKBx_Nwwt1qXl_ur2vxcZv5AP0qgGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150054

On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> Add support for the QC08C color format in both the encoder and decoder 
> paths of the iris driver. The changes include:
> 
> - Adding QC08C format handling in the driver for both encoding and 
> decoding.
> - Updating format enumeration to properly return supported formats.
> - Ensuring the correct HFI format is set for firmware communication.
> -Making all related changes required for seamless integration of QC08C 
> support.
> 
> The changes have been validated using v4l2-ctl, compliance, and GStreamer (GST) tests.
> Both GST and v4l2-ctl tests were performed using the NV12 format, as 
> these clients do not support the QCOM-specific QC08C format, and all 
> tests passed successfully.
> 
> During v4l2-ctl testing, a regression was observed when using the NV12 
> color format after adding QC08C support. A fix for this regression has 
> also been posted [1].
> 
> [1]: https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u 
> 
> Changes in v2:
> - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> - Updated commit text to indicate QC08C is NV12 with UBWC compression (Bryan, Dmitry)
> - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
> Dikshita Agarwal (3):
>       media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
>       media: iris: Add support for QC08C format for decoder
>       media: iris: Add support for QC08C format for encoder
> 

Looking at the series again... What is the definition of V4L formats?
Are they expected to be self-compatible? Transferable between machines?
In DRM world we made a mistake, making use of a single non-parametrized
UBWC modifier, and then later we had to introduce OOB values to
represent different params of UBWC compressed images.

So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
should we have different format values (at least for different swizzle
and macrotile modes)?

-- 
With best wishes
Dmitry

