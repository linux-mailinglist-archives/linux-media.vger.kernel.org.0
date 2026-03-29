Return-Path: <linux-media+bounces-57471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iImjJ7hyyGnVmAUAu9opvQ
	(envelope-from <linux-media+bounces-57471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:30:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 000EB3504C9
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62353302BA4B
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 00:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067FF1A6837;
	Sun, 29 Mar 2026 00:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLDj8BN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qviii7GM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4218787A
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744149; cv=none; b=gaPteyVyrqhyigSD1X0RqlH45wWZpNTdbp+obhl0yaH3pJwIdWDG4Z9vUEZJLo6/FHszmhZgIQkbwUlVgPd6Z3yqcImlzIlT02TPsfAXe2NG2DJzxFNgQUHWqzcl7GjJ59Wy95gqn1NNY4Y5eMBLwcRKpj6aP6RXujFcQ4SbypI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744149; c=relaxed/simple;
	bh=elDdznpCSRqzU5VIhlNo0P196uCTRQLn0x0FwxL2ul0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfaPty6BVPFUUf/LnHQiNjvCvAPWmLmnHvXrhFGlGtXO1odg0VuCB6BVuLZJadiandfMHg20g0r6dXbFvsSTaLYSeopLIK43Ck/ilJqxpRuI+xRtMC3jFpEunrKy9UoGASb0szSS5wTgNIJLnazwNacBhM/WZLSxe3FgM6grlJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLDj8BN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qviii7GM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S3Pman2056465
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZkU7aasVRrXZNc/v8lfJfyTh
	imm2Ym1Bzg+L/7Q1M7A=; b=MLDj8BN5JIRwygQRWsC73fDvCIXNvf9r0Knv0911
	2hKHC88PUR6EYA/P0X5N8NknNPqq2EUgxoadLm3GrBiKQl0h7vCxwW/+9C4rX9lE
	zyLMqk67oK1x7AZbbAve+jD5ub4qw+lncKf2q8oNQmIVYpGg1jGK6LBtDDmreSpq
	XmG9c6RuRopZ1ym9jD+965gQbI5UE1HfSKMZZoXMR5WksYgMncL/70bhlV0KxJIF
	cNkLKpYa4DwaFfp4zbM7JfROryFm3S7JumPVK4PZWor2Ep60khhChvJh7sCzAsBz
	7zwwzLiZT1+y9nE/owrjuM1XQqgMUELcCAka/E7CyVakHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672u9sp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:29:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso95669421cf.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744146; x=1775348946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkU7aasVRrXZNc/v8lfJfyThimm2Ym1Bzg+L/7Q1M7A=;
        b=Qviii7GMBw8U6UsN/DjsOCr6+R+u7lFVn1OU0jn+rVAQBBuiSPHH+AE9GiYFZVv57S
         fOxrDOsiB72aJijGEKCbiGl7hZkK8ju94TSTNVarOpb3Bu8lQie9KT1LKEpjiaLKEQgP
         uUkICmVt4OnS2KUhSSWAKCnR2irjOmm80wMp+1At+kpq73SwcplSNDal+aJAfni4rVPS
         Ye64+Do/QFxJmvkf5c4S9o+xAnlq/vrVimKVYnS9QeYBED6hwu5u609tvNnAFkRW8d/7
         Xl8OHB9ZlsRSLwSU6RzOdMhB1sIQiuTlP1Efg6ex37JRGS3JxPZ+8s8Jlnw1qGotBlZX
         pAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744146; x=1775348946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkU7aasVRrXZNc/v8lfJfyThimm2Ym1Bzg+L/7Q1M7A=;
        b=h4TxCD/xR8tOOJ02jvO4ynXU0V5ZfYNIzkzSA/TDbunFh5Lawky4BgeZUGn2WDXtr5
         Bwv7+EWtC0p+tsgjN+r8qI+TfyWrnDnOudsVfpxaSQu0c317L2I0aXLTGwMRKdAgpZKb
         DpgdZxCZVIVcXPm4chM0ld4D2MHSOgIz2Is1CaUfWgq92zNzEcDQN9J/BXGN7dfqKM6X
         Gxsbx4zuZMzpFxakU5XPLtNhL8aWqL7pFPodqByPy53d/cI5tp92QWsH+0Ws8a/i7YtY
         JEW6jxs+dsF1PXF8LFc0Tq11WTTDFVUKKuJcjtp4jmcty5ezVvZMpwFsH/Y/m+vuXeQs
         s3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXGPYJFwINVinzOG0FVR3XOQiTrvrS3nohbrKJXrtCl/B0/883JbW+22fi57olZvJXFdcafEbC9Zr3HSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMJwxO7/oRmqZl5PPjtK/D45fR+YAxZydKhObKgNm6XIn3UUL
	N2q/zFmbtG/XxY1FGBYp4eDqMOKU+zypQ5+NigI2T8klpWY/+7AmUfmqg4lhvUKuGAujWwOBLD7
	Xiv+NZVb4vZbfnuba1z4Fst7Q+OtPkHYtpdbNRaoCt9L4q3G0Qc6l/HcniOvD00GmbQ==
X-Gm-Gg: ATEYQzzD5ce6wi6H6FPPoBLy64kbM0e9KwZlkirkza6Kxk88sM7NiOaJNSLauKPlqST
	mO4BkGW0xLUqX3kG9fuqajEN4PnCjXUFbbXUzgl3ZBzbP1tDGguF5mipUaFFWaok8OUjm5UrDo8
	zDEVjKjmY2U3I/JEmlLEmzIVZ6kHY9R27TcWh1lpZu0qOqeaVnuwmto96yKy+2RVeUOl7C4r5IP
	pfOsw3RwgnVqdmwrMwxSS1FgX7GZvi9y0a6N5tjy/v8j2gbb1SAv+YaUL9TNk3EcTLqxIni5K69
	3ssnhYLxJsB8WXpGlKp40trak9D1AmKbThWp79nZMJ2qycXFu4rKr0K/5eWgpPK4noAGzEonmHe
	UTTkFNDHlxEXYIsr42eGE3ZYUu0l8qrqYmYalfo8sWGG2LFo++V6yEp2jqnYg9G3VBUGWRELOvy
	AvfIx9/lrHM/Bv21VkwrQApuSt0Q4jL7xuang=
X-Received: by 2002:ac8:7f0d:0:b0:50b:3be7:afd with SMTP id d75a77b69052e-50ba39fffe4mr110748071cf.65.1774744146038;
        Sat, 28 Mar 2026 17:29:06 -0700 (PDT)
X-Received: by 2002:ac8:7f0d:0:b0:50b:3be7:afd with SMTP id d75a77b69052e-50ba39fffe4mr110747801cf.65.1774744145620;
        Sat, 28 Mar 2026 17:29:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f48sm6770301fa.6.2026.03.28.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:29:03 -0700 (PDT)
Date: Sun, 29 Mar 2026 02:29:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 11/11] media: qcom: iris: extract firmware
 description data
Message-ID: <uoazld45weaugzeante6z4g6qu7wwsns3yi5f6dtt6w54ehdfb@byiekorkqn65>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
 <20260328-iris-platform-data-v10-11-46b92bfe7b52@oss.qualcomm.com>
 <3fe34754-e691-9fd9-7fab-1c81f98ef534@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe34754-e691-9fd9-7fab-1c81f98ef534@oss.qualcomm.com>
X-Proofpoint-GUID: _kbpKU63-GIrP6tuR7q1d-2PrDnMe3g5
X-Proofpoint-ORIG-GUID: _kbpKU63-GIrP6tuR7q1d-2PrDnMe3g5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMSBTYWx0ZWRfX6kEAsq0dc+of
 42GpJrJf/8x4OBBNJrJI7kXdfGDEGcDWHACf2pFBeNW0v9wAgJRYsGaniuAgVAwJ9ZtX0gQJT3I
 k9kwTcdAfoaO8TjwlNDiKNejoheOuVTrLiJQem7iTyBRRXX0+5R6y45A0I4ATKuMLSsnq7HfS+C
 NE1bnUffjVFpEFKVdtvuX9wmsolyVmQmSXUNYRhrYIESKNhnFfB7IYvwfC/vSxI9EPFmKQV8snh
 f7wRNXcj6JCKZCHRQ4AfxLEecrRFtLVuuHBQN23EqlwSzGG2qoCv6xujKS8julCceZN7yerfR9w
 RtLr+GxADMbYwn3T9zWnVDfsYEgiBoWQR3rStR7mT7uFtk8BWiWkHsT6LMQyWYQxhrpw8F1bp17
 oP2TLxf+gBPq72MsbznDhypbMJcGuvSz+vF41AlO3u4gcUO9jxvJ5kNa7qriIgFAcbUuDTdCqgz
 KIQCH6Q1L1YYC6V7pXg==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c87252 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2YJWv8jhSmvSyXWFslQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290001
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57471-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 000EB3504C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 11:55:49AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/28/2026 4:58 AM, Dmitry Baryshkov wrote:
> > In preparation to adding support for several firmware revisions to be
> > used for a platform, extract the firmware description data. It
> > incorporates firmware name, HFI ops and buffer requirements of the
> > particular firmware build.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
> >  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
> >  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
> >  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
> >  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
> >  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
> >  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
> >  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
> >  8 files changed, 57 insertions(+), 29 deletions(-)
> > 
> >  	struct reset_control_bulk_data		*controller_resets;
> >  	const struct iris_platform_data		*iris_platform_data;
> >  	const struct iris_firmware_data		*iris_firmware_data;
> > +	const struct iris_firmware_desc		*iris_firmware_desc;
> >  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
> >  	enum iris_core_state			state;
> >  	dma_addr_t				iface_q_table_daddr;
> 
> This is still missing the doc update I pointed out in v8/v9 as well.
> With that fixed,

Sorry.

> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry

