Return-Path: <linux-media+bounces-50639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B4D1CCE3
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00D40305CB15
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 07:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7E335CBDF;
	Wed, 14 Jan 2026 07:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvGWSc+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgsNOfN5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60A535CBBE
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375317; cv=none; b=IxkxTnqwar+yov4DTFeSj+Ad5bxdO5mp3kN9YfUvH4deENRylqKDhuu9kChhRLlP55wVvfnfoZ9IUH+YLyvya+wXhtBK02SfVnWARlepC8PCg1g5P+UZ8in/ZOTLcxYesu+xRt02H1IC7aTjeNf8iWujbXUXkU+OsntPdzQD5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375317; c=relaxed/simple;
	bh=pin1cn/u9jir+M+excFeD+YAXNJE7hBZaT7EnKEdnQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1FfxXMmfCXz7sbymjptTJFyu4aht75y4mOWEvrZvo3tQY0O4eriwg4Z8aEb4TWGzUvC+SE/GIlC464MzOfzFidHN07b9w57lKJEzn1mKH7WbunrXwz8XFLTf82UeCv/CK61M/+gpSPEuS5l4168qSDhrQpfeVO+AZOC1DWgk+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvGWSc+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgsNOfN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E66QXP2579691
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=; b=lvGWSc+MdI+XfEAl
	O0tX2sTXTqZIrLDL8P5OkdFw+MwRsZyDEmsrVgvhr1nLT7F0LjOv8GUeD2+U4jKO
	Imjo1oMDeFUgeQo/JEQitkGDHQdBWjsZO+eK95RRxNmNaePE6FLlXayJbNI7+fE3
	53QM2wRTOsmCcpL+QqP5Zm3SENpt0fK/zkkStwMvuoa0R4VXqITHwdcgrkEjcsRG
	1WoCB+AcrCPGOG0uZ41d9jny9bGwSqUgcCB/42d3kEnO1Jf5exxs0puMvbeljbKC
	CWYwmHTORpuTbe0x1tgAqLbhpcnFoe3A2c8b56eZj13lB2eFIZcM7Aii0EijV5zB
	e1rNVQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v9ttr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:21:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f2b45ecffso39363195ad.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 23:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375306; x=1768980106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=;
        b=RgsNOfN50vJU9S9JpC9RS/eRczWlNQENsjsGnkHca1C+LxgKHkXAxYvvxbKQ1adap1
         zeMZ/4CRCYwbfvrAFS1b4D8Fby4RjW/2IGTeV91uYmEYppT2eIuFZ3geuJ/wtAVtwmwE
         t5m2DWo7f9Tm3aCmV0+Rm4xaz/JwJzCYSJWiqj1/FGdOUDcWjocUT8faM0d12Ee67uSQ
         S5Cv6ndhoGzguOJXgn7cITe2SMP3O7Pi8pk2Jh74BeRp7X8xcYCeuZLrfQf67r4LP2d4
         J+7O6/Ink4DPzyDUNtUezWI7DqsH3pOrZg1HfPvF/6QS26phFI+Ayc+6Pu5Y74KTN2f2
         eKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375306; x=1768980106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=;
        b=aWmievihdRebATcgP+1wT+0PcgtH4blCS+Y023eeKfX1PblfsfNv+DDYTPSEw2Kvft
         +Y0FkFDtBmK2KtvpQ9ujU8Ls+rr0S++6U1xFwELQugSl8lJ3jrm1cpfQDMX1kHttFSxm
         Ki2Jazor7vgMs5YXtGlRl/goeeqlg693vwjpB9wkluWr+4gmRxJ75SOHropbLYcD4lYh
         I78U8yvfFlF+n+xk1YsuHNx+zQSwj4tUIr/r7sTmVlJdoVh/UMuwHbda84B8n0pCIgD4
         AD3KjFK+HlcyYnozz//UJiXimZWwpF3ui2bl7cUCwdRxVUFFUid+xqJ4ABm6r/5zgW4O
         zl4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbqbJSfw6FSmdsEaoCuL/J0zRts5C9CIlnvOu8w+nxq9gSePN2tBZCOZX0Qyf2sa28ENTSbGz2FPABEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysfbCLLIzUfQNUEvKkBKQNJM35q3qHzanHgmlc4kguCrBMx121
	Y14kYP2sRw2wVFoiEPIXwgGkxDylBzQzSQatZLPw3waSvu44fYO+zhbXqMvJLWWuEreksC7bh6U
	JGmXGxSKRDWCFLjv0eFpbT/cerL6EMtrQM8WomS2XaHS5SOC7GpWUwPub/dW2HVdmIg==
X-Gm-Gg: AY/fxX61fX9V3mPEU6mvVEw8kZJMR1PI8vGSJpejhuLaZSRjCmbOGe1Nxf0Thhb0PO1
	+3SgGr59joQjlH13CUcr7ZZzXx69WdM0mliTgeYpTZ3IpaS+6dlU013WXSB87xhfhOhVxgkGIlw
	1zdSEtVUcuxdWZtDQCpE/KXRpAaIKfo/iKPLInX/RWecEhv9NCP0v9TYh6xweLnhFGQm1opC5B1
	42bixItuB+KGatFsmZ33M/jTKZCy4qweSvdmmBDwn2hsC52vwJn7TFqaqFsTLe9n1JkU5bFCqfV
	iT7YDYJiWeqvGfVRIvXAmzV2p1mjXVFxv1PHtWogJeURbrYmkxKITLSJdoMQm14/ayiMU5EfQ7X
	+B7ujPDGhh5spo/BLPUxH5thj/EIVqdT4qTzheFslfsYR
X-Received: by 2002:a17:903:19e8:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a59bb74387mr12706515ad.20.1768375306040;
        Tue, 13 Jan 2026 23:21:46 -0800 (PST)
X-Received: by 2002:a17:903:19e8:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a59bb74387mr12706145ad.20.1768375305597;
        Tue, 13 Jan 2026 23:21:45 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48cc3sm220685455ad.39.2026.01.13.23.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:21:45 -0800 (PST)
Message-ID: <4eb4818f-115b-d0af-cfc8-109984190f5d@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:51:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc
 length
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NiBTYWx0ZWRfX/L+QX/yxyNth
 iUV8Yie8KpZtjA4hFy3DD0DdeKHdbZsWJpfWTNrIrpXMFLNFSeyhgRyePRewwb7shJW861gima2
 z49MRACEx9p5JR7Ur7TVSuikMjdyR5wRvWtyqvokcEQBH3hTFgJFIASQo0byPD/f2B5vrBQrhmi
 b1nnynXMdgtsoLdTSmyPWVJ6SxiDyZCl4XGw+SDi1LbzLxJgI86A2iyW5YQ1btF3M4uTT+I86q9
 qgqx8IaI4bJQLbKbqpHh1z3GNvTW/dTjvdVbURyk/+oF7h6SkMuFNKkjQqDrmFbFT7BaPfT5VzC
 ozCiUQ3DOif1gg0U8M8eTRlXGh5X/HvEiiDpZ/GTXDcdXo3Ea4RNQT+SwalJJdBjrbb2AWrtpZu
 1GSy2G51bw1F18sXfAWmHZklKMX6C8IqmyKIO/Vx8zlQDSCkIExdGLlr4ZKDhNe6sOvmkFlbhVx
 Tar5PTbqsPLyITHcQtQ==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6967440a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=o9KUHpD5kIPiLnKsU4kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GdzFKZW2QXHb9MCf2oVoUj9P7i5cqz9Y
X-Proofpoint-ORIG-GUID: GdzFKZW2QXHb9MCf2oVoUj9P7i5cqz9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140056



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> The helper reflects our current best guess, it blindly copies the
> approach adopted by the MDSS drivers and it matches current values
> selected by the GPU driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..5bdeca18d54d 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +/*
> + * This is the best guess, based on the MDSS driver, which worked so far.
> + */
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);
> +}
> +
>  #endif /* __QCOM_UBWC_H__ */
> 

Based on what I could check from video side, above looks correct.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

