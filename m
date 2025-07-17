Return-Path: <linux-media+bounces-38016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94837B08D9A
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6B797BA93B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239142D77E9;
	Thu, 17 Jul 2025 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrMlycHp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98C2D4B47
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756864; cv=none; b=JYUenYeRg19EQr9zompFOtn7TSJv9Jur4rXkRR3a9rSGk2l9fBrDqxyKSB82qxX+mSjM/kEOi6ojy1eRRZHiawyxzqVl+EY/bJYO1uuFicSRRUZkQ/1NX+aYzf7Twra4volP1ZU9iWxALbgrqOEZjaNexCi2R8WwbzGb1TdZN4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756864; c=relaxed/simple;
	bh=z+X8A9P+G8blqjkqdD7ikKkiAkXVI7kyhvLjlBrrHu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgMYSITUAWGMB9YoWxFMS1Jzp37s2smk1AFrCpSRS+kpwePo1RbfW16HDrY2lnyvR9lqwetwFsMB3RkLp9vLWT9+cz0WVhPzqyVH/JzqZV36BYE4DV8ZWGLL+dOWNbBAs8rt79pZcq2XcmWJ4G+WIC7TVpRes5LZmX9zt48o74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrMlycHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBGX6U022439
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8+U+AdtRViJLGrgNvdoFy3geTUrpbdX4fYqj2cMJg=; b=hrMlycHpVroEaQWv
	kvr7GMs0/d5F2a2bWEpuQjEeAcymkwr8AR7f+kkqFutISuf8c5VOhdsnRDiij3MU
	xv8/AXzwFDEz5wgcKNOcRdr7io0UYfSSN66IhgRHw5aqREFiV4/eTgYhOa+IBuwE
	tHWBE0qnQaZKQYbyuOkiBsaCk97Zx21Mx/6TCTrTmH0kzGFgCbZc1Eq4UlFwXnjx
	RVDECAhnZ7ndwfDBS8a/87WusyGFWL1AFqGT56KzR3lifZ0k1AtBAknaHJ/mQO5H
	sLoEPrFCkGytbPijhTLD3NnnSu7k1YKo9x2Q83p72Evc/4AkyuGuZzq/eM5AZyGC
	R2SApg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy7kuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:54:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso3673196d6.1
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756861; x=1753361661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vY8+U+AdtRViJLGrgNvdoFy3geTUrpbdX4fYqj2cMJg=;
        b=QTHb8GfznWbOQ7xegpzerFFUKmQevj+gk4wH27MqjTMSaIl00FKKtlM7TWyp98kfvF
         FlPTCs1HvD6E0aWSEDnCTnIAodSoY3F55V/ucPa0MHOfN0E/WoH9LNDdrpr9Z3UYDDjX
         CWba+5Fh5rUfhtADMlDgGs7wEoWOvd124io8rVI6k1jkuUyFOy7GLqp1KgXQkiVaRxYR
         bgCFf65ZQEzdXJaG5k2gyQXY/lvt8ylso2AE8V++jza3djPBAdkfqaLhCEPULphAfDbL
         KrLOxAY5ue0DZm4adTVU5X/ImqeLZFKbIks4QLnsllpnGNNRTHXztF/+mWx2YPzS7vv9
         ODGw==
X-Forwarded-Encrypted: i=1; AJvYcCVcdEhcrMZZXJZvVPIfKMxitywzUSUVF0l/VpMQ1Dfc+oF+XfO37nHQNKCWTq72fSeBde+jzfos2NxeZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGqrKy4RWnBZaWHH7an05mf6CXtaurka+Nc3uED8Ij0Rm99d9X
	K0UqjfzcLt+lpAJvelndyEBVhAFSF+vm9HTKoBX9eVhZIkGxRwTUpRMKglVbvTGHFqXL3QmDjET
	Ch3t52Vfj+L1S09Qw9ihNODvAoJhyr2MCGWVhTrTWCFWLdsI3kROy4DZu2FHj6e9L2VL4sTBKMQ
	==
X-Gm-Gg: ASbGnctM7GUggePE3u5WKWdKP8s8kpZ2JKZ6ogQcq558sKMGiY1nIkj7xnHP3uZZxPH
	XGP2AUCLy8HkryHshQJD06YrSSJvpMCIQ61G3WGUXBg+hF2zzDJP86rbmPVaN0OoWq5QzYjwXzR
	bYabr5wCZlQs6m6bMfVeKwiBBCxyQnwxnbo7RKi9p+fWTnQiETMMwUP7SGfXgNPCmGIjktbvNf+
	cBJ2RK2/UXoJLBlnw8ayGymKUcwxKS8L0E9xZPLnyHsGXNWRbS12MeMyT4u1PXiUTtxSXHH1+E/
	OATYTJisOOCkrQbGDn4CIN2ZE9G6f74e/sSUoKq6QqeC/QJ19UVhfCF9+G0YZAcem1BhGTCYAa8
	iYMqCGP039siu1ZDz/u6I
X-Received: by 2002:a05:620a:2949:b0:7d5:d01f:602 with SMTP id af79cd13be357-7e342b68dd0mr446381285a.14.1752756860527;
        Thu, 17 Jul 2025 05:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIHZdErHUxcQSzMlX3jaAJn024q0jCOwgH+lHrqH9oe6WV/+qWTPGrVNeWc8ZrO5OBCGW2Tg==
X-Received: by 2002:a05:620a:2949:b0:7d5:d01f:602 with SMTP id af79cd13be357-7e342b68dd0mr446379985a.14.1752756860098;
        Thu, 17 Jul 2025 05:54:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82dedc0sm1354487066b.160.2025.07.17.05.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:54:19 -0700 (PDT)
Message-ID: <e1335aff-00b4-4505-bcf5-0eb8f2974a75@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 14:54:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-3-a2538659349c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-lemans_tpg-v2-3-a2538659349c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMyBTYWx0ZWRfX0zqKwvIC9Jck
 T2pI40+4KPp/0mhOQzcdkVHF2Jjs4/VZzlex8s+jGn7N0SsyP6Wpc/buO3XIs3siYmgRUGQZG2O
 /dT4bmCb3pwSKeuxisiIxhDZ+l3vTNHUL0wBygo4GbiS1A4XY9CR1giIwBMwsFXw5B180c8eCp7
 u9Q+c3FIz/UttsOIn3Wg2My949WzVStLrrX8DF0QayMikjPDkYXNBIOdQHWKfT/Ut1RwCBYrsEA
 GyqNKnU6moVhzmBnzbWcM6bn7iB5BfTYF2NKzlMZAaz+k/hSIH08EDf2eIPW+sN6gdK6nXTzqSq
 3Qbh9RuXSa74dU60MGSjeGM8E6VCZBwMAT826ux9OD9gghM/MlYzKUJ4i6SmP0vZXiLEBAk9f3n
 7FQwGjtjOJPn2TRnGg8SNLs6jPJySw7YsOKvgDHxm5GJ9Ri0/M/FA4hGuO7yRv+qjzY3HJTx
X-Proofpoint-GUID: ukx29DBVnGmNtB-5ECAOTvffXAkGBMtE
X-Proofpoint-ORIG-GUID: ukx29DBVnGmNtB-5ECAOTvffXAkGBMtE
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6878f27e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=pSl5WCw3oxHEiR9bIskA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170113

On 7/17/25 5:20 AM, Wenmeng Liu wrote:
> Add support for TPG found on SA8775P.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +static int tpg_stream_on(struct tpg_device *tpg)
> +{
> +	struct tpg_testgen_config *tg = &tpg->testgen;
> +	struct v4l2_mbus_framefmt *input_format;
> +	const struct tpg_format_info *format;
> +	u8 lane_cnt = tpg->res->lane_cnt;
> +	u8 i;
> +	u8 dt_cnt = 0;
> +	u32 val;
> +
> +	/* Loop through all enabled VCs and configure stream for each */
> +	for (i = 0; i < tpg->res->vc_cnt; i++) {
> +		input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
> +		format = tpg_get_fmt_entry(tpg->res->formats->formats,
> +					   tpg->res->formats->nformats,
> +					   input_format->code);
> +
> +		val = (input_format->height & 0xffff) << TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT;
> +		val |= (input_format->width & 0xffff) << TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH;
> +		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
> +
> +		val = format->data_type << TPG_VC_m_DT_n_CFG_1_DATA_TYPE;
> +		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
> +
> +		val = (tg->mode - 1) << TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE;
> +		val |= 0xBE << TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD;
> +		val |= format->encode_format << TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT;
> +		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
> +
> +		writel_relaxed(0xA00, tpg->base + TPG_VC_n_COLOR_BARS_CFG(i));
> +
> +		writel_relaxed(0x4701, tpg->base + TPG_VC_n_HBI_CFG(i));
> +		writel_relaxed(0x438, tpg->base + TPG_VC_n_VBI_CFG(i));

Please provide context for the magic numbers> +
> +		writel_relaxed(0x12345678, tpg->base + TPG_VC_n_LSFR_SEED(i));
> +
> +		/* configure one DT, infinite frames */
> +		val = i << TPG_VC_n_CFG0_VC_NUM;
> +		val |= 0 << TPG_VC_n_CFG0_NUM_FRAMES;
> +		writel_relaxed(val, tpg->base + TPG_VC_n_CFG0(i));
> +	}
> +
> +	writel_relaxed(1, tpg->base + TPG_TOP_IRQ_MASK);
> +
> +	val = 1 << TPG_CTRL_TEST_EN;
> +	val |= 0 << TPG_CTRL_PHY_SEL;
> +	val |= (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LANES;
> +	val |= 0 << TPG_CTRL_VC_DT_PATTERN_ID;
> +	val |= (tpg->res->vc_cnt - 1) << TPG_CTRL_NUM_ACTIVE_VC;
> +	writel_relaxed(val, tpg->base + TPG_CTRL);

You want the last writel here (and in _off()) to *not* be relaxed,
so that all the prior accesses would have been sent off to the hw

[...]

> +static u32 tpg_hw_version(struct tpg_device *tpg)
> +{
> +	u32 hw_version;
> +	u32 hw_gen;
> +	u32 hw_rev;
> +	u32 hw_step;
> +
> +	hw_version = readl_relaxed(tpg->base + TPG_HW_VERSION);
> +	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
> +	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
> +	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;

FIELD_GET()

> +	dev_dbg(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
> +		hw_gen, hw_rev, hw_step);

dev_dbg_once()

[...]

> +static int tpg_reset(struct tpg_device *tpg)
> +{
> +	writel_relaxed(0, tpg->base + TPG_CTRL);
> +	writel_relaxed(0, tpg->base + TPG_TOP_IRQ_MASK);
> +	writel_relaxed(1, tpg->base + TPG_TOP_IRQ_CLEAR);
> +	writel_relaxed(1, tpg->base + TPG_IRQ_CMD);
> +	writel_relaxed(1, tpg->base + TPG_CLEAR);

similar comment as before

Konrad

