Return-Path: <linux-media+bounces-51956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMzBCi9EgGkE5gIAu9opvQ
	(envelope-from <linux-media+bounces-51956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:29:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 833A0C8AAC
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37C40301A3A3
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 06:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6BB2F9D85;
	Mon,  2 Feb 2026 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+pdskoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0Eps7bh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75952F617C
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 06:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013597; cv=none; b=Y1Lyh1vt2gbqL9GMtONOslNbuCASuPAbo2HLmeRMtskDOah4j+DsZFpQAANtmk2xfo4V2vHeEDL+NQbS+wl/TUmi0vltVhuqGtFR8KC2drZaeIQDBomFm2S+sySIDeDdtIaV++7/OExOe+drnKayU8HTURhD14VAMeIifWNS8uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013597; c=relaxed/simple;
	bh=PYAoHS0p9uDjoGECmNIEmr2M1dPxO11BnFsBKgcQBQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c71zU7/B8XbyAnIyS60C/pY2plawwgawJhyfFhMp0gbjPyTYcBN3LTIxjwPl3eie/ZpAwUX10V+WcQNgHv8O04Y/UcF2vMuwcHE9Ti61XvjMWeTWlXqORsvYHU8sRmVY+3NeZOTfYioQ2I2ON0utkmSm5XVpzKIFUNnVPzBvoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+pdskoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0Eps7bh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612001Dv1331761
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 06:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1DJ7ZyXos7+1bnCbWgkVud4qHnGcgBAAPukQR6gY04=; b=C+pdskoD4rGe20FM
	z/gYPZiPTqKy4rw7JZ/C0dZtI5Wq+YmMOmbpVntk2ATQOO4bB0gqfJvvvObvESL7
	sVYcR6v4fwTWsg84Lo+aEaHnhKuYxrCuMqp+6qjnCe5nTzo0Zc4OQi028/UesgQN
	a337OhYlwMvpM9CjFm90b9YtXbGxsBfNnfB+BNQ7OHo2sNJNQtK5r56pfo6nHl4y
	mRXScwndIjq0BERZwSv27oaH61CjyiChqfW+NsdqOaZYy+9v3gamjGh5PsFz2j23
	7cYXeWnCbGfy1tJW9VO5V4yb3xXl5evFMfRlvNSdMc5yZoelOWvx2ubvyeEpsBWw
	kHtIZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnv6e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 06:26:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e952f153so123370755ad.0
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 22:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770013594; x=1770618394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1DJ7ZyXos7+1bnCbWgkVud4qHnGcgBAAPukQR6gY04=;
        b=R0Eps7bhj6TP51sgiUv8jh5tW7Hv5dePqyK5PbhulEp3qdb1Q2uikPLNd0CRI1Lu1V
         NR3jvpsNvhC6+stawNXg0sdcwNU/GIbie28zuSCs0YHv/2toqGwJXwXIDArhScZ8V6YY
         ktbQEOmrb0Jy54nwUwup69FHN6J9vYQAAqOy0tTFmCjWtu98Mc+GVhiRME/WU86iufKn
         HwUjfz4/7j1XrrXCUn+Xi4iyDKGTTSOIY8kSSN9TCuTl5rs4oDeh49daVTRU0R2yNl/J
         xitQaKZE1ttyiGQufqBuxy+nBN12DJ/bueqLIa+gqpbXlChWXLm/q592TrxvKq49dNSQ
         /NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013594; x=1770618394;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1DJ7ZyXos7+1bnCbWgkVud4qHnGcgBAAPukQR6gY04=;
        b=obNWj4zGbrrPdFOdzAJkIdoa4zmXpk2ozEmR3WO+hoGeJjUgsHYLML28Y9OIb/ctiL
         4CS2tSIqsfGy7zLLLj7Aj7921otmUn5Y6cyIz407PMmEuNhWOoWxCEwiwIoa+KDq7BHA
         aA0AGfvFKw9VxlECZmlBAroLlALkU/a20QSGLE0VrGyEg6bT5P4rVU7QQ353WxllxPOh
         Y+qmdfed5w+1zjgOg0EMM8cj12fMdcolkkvmTdFEeKsLcRMiYy0ayKShrrDADWynySmN
         wqj5lOCX74GZGz5v3IxdxaisdG+iTOpFf+uhaA1nEQsTULAeJ9Nyq1egKldarEIq6xnr
         eZhg==
X-Gm-Message-State: AOJu0Yy4R22lY643u2mikLFvbQFZhINVfaMpdCz5YclbW09uUYdgiJBj
	Dg8wezTiSBxkkxTQiKj9Lt1+KI1JFKwORTgdatIl5SQKwuKzjFbgnqd6HbjPoVKSsARr4Li8QXH
	4DzRP+SkOvH71l9Ih8kNNXUuAisdfhw5Nr/erbBGK7muY5mrj7wqF68+oO8FqPUtFWA==
X-Gm-Gg: AZuq6aINtf2axWV9rOqZShHjnKvQXXNvbl0lfEAI6GJURs+g+42ccPDYJWLrv9MZcFt
	hh72pbAh4OH8R8mEv2lHeosU6D+X91urLkB3jTY7yJ5FXgj1l/5wgV3DcmNEveR3IgwmF/IuqCZ
	R1bPtdemxbfByZD0A44Nxctf9j3G/j1FrMSlvnJ0DzDpG8VmT3UR6TVTE8nxnf5MbjkBGhUFs/e
	aHLYHLsaCKUv6hJD4XVH1W8iLhEduZMLUaqcUvaIL7If4doEsAKRObxTq5njiQoVWbrC72gTcJt
	UMTY9oxExY2G9bA01QOjYlrJQVyiUDKIT1d7JsIs2Cs1MksoUmBwTFFDZlRm7SMEcH46XZhxZlX
	gLbfEBYh+SvIYclX4yeW7G50sjqo+caEowy+1YGngUmNg
X-Received: by 2002:a17:902:ce0f:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-2a8d994f69amr103277845ad.41.1770013593766;
        Sun, 01 Feb 2026 22:26:33 -0800 (PST)
X-Received: by 2002:a17:902:ce0f:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-2a8d994f69amr103277545ad.41.1770013593335;
        Sun, 01 Feb 2026 22:26:33 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c40e1sm135440215ad.55.2026.02.01.22.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:26:32 -0800 (PST)
Message-ID: <b408b5b1-8258-289c-4580-3dcbf50069aa@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:56:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/5] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-3-e10b886771e1@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-3-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=6980439a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=taCg-2STDlqsnU512KsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: HPEIfqj8RWJw1FSr8bSZc1sJF_lWs4HF
X-Proofpoint-ORIG-GUID: HPEIfqj8RWJw1FSr8bSZc1sJF_lWs4HF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NCBTYWx0ZWRfXxBd0HujHHd9K
 vbqPTC/dvdn4zklU4zYQoEw3jR5P8IVg+mr7f8Lqoasj6EdT2XzF6Bi4V2hWYTlEyC88y3jd/Q3
 h0ZGF+x5/oHJP7Oa3qNWCpg3gV7j4fNVhUEGCrOcqDM8ZfU++23TrSUxOtNQ9doEQ5oCwOcOx5e
 4UHSGvbd/6dcbCJEYlbjMO1Ptr9fJ3hJhHuMxhBdbh5u/PFaugPJ3d/maO0OZ/pdenbgGlCmVIQ
 JpAr0FKGLU8fsPPozTUYsIWR+OBW+3B8I6o5aHflIK/spCvqNoWI5nzJIIKzesus2/BFCLav369
 4lh4WSn0J/AZ4AOpgHHDU+9prMzfw+dA/b/AHBufg162K04tfexxhW+IHkfJ22J8QY56SWAhpdC
 pHFcWIru4VackfMyMCFDcYTc6+749Z1WAQea3HNC6s/dUTAIFJhAEcUPQxjBGyhbejIbm+KimXs
 WC3yExBVs72pDmPWpLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51956-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 833A0C8AAC
X-Rspamd-Action: no action



On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
> As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
> uses the video-firmware subnode, move its definition from the common
> schema to the SC7180-specific one.
> 
> These properties do not accurately describe the hardware.  Future
> platforms that are going to support non-TZ setup will use different
> semantics and different DT ABI (using the iommu-map property).
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
>  .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

