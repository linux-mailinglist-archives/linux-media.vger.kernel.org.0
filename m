Return-Path: <linux-media+bounces-59301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF61BNqT6GkbNAIAu9opvQ
	(envelope-from <linux-media+bounces-59301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:24:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D9F443EA3
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E9C03040AA0
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756C43C1980;
	Wed, 22 Apr 2026 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9OyY0gT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSSlt8Ft"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2D3C1969
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849591; cv=none; b=gwOkf9c2A+Gh1b5UHefH2+522hApjCV+5EUY4ma9rj58lFfGQ44mHfHGDRLDKefnWlziXStcFhTKtm4dsreddyGP21DAoRDNhzlabaLW4H+cHT5Z3/4pn+S1/e5lXVdvjXbv0pfLTG8K17XxlkiEYGW/TtLth188bDLJUjPY3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849591; c=relaxed/simple;
	bh=OU16C1HTkym3IfdB5lCI8qt7OkcoXSWAACgHpoU/kWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NA0HWYHYdilyQt41fC7/KyWPsgvjfl4G1IWUrvKbb/CVqef4hKwjuKgE3S9tZH7ZCni36JazUP0fcnhnsUrLigx5ky5kDIyqot3UtZFEkVEh7dNrNMnfR4j/EbpTYnzCEdy8I6ZkBmrjuwp37wOR9IrR3H2veW3lswm3Mx1T2PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9OyY0gT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSSlt8Ft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5DaTZ2123746
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 09:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4E0FN1Yk5HSKpQZofTPLB9G3h9HECmMhC7Z9bAGYFWM=; b=Y9OyY0gT0qLZT926
	6Mq7+swrv0pW3UgK0IgYfWrKclYYHIC9DkmXzjWSYpo4fP+aIWMY75tB5ZXPQ8oK
	ESIOhmRaorj1ygbFhf6Xd5eHE5A/gdXAdfxwbAvsHjh2om9UHfPa810wc/n2Q/T0
	CQny4oxGtiMxflD16R2l9yxxISIKkgGK3atWlY3/ttr+uPfiMeA7Unzn3FlnjLe1
	zYxSsazuMJKA+LWJSLYcRa9TfZzmM/7R4dq+pTy5BPYF7BDB4qUjBYJmLxr6Lf9C
	C7761YjCMLlKd9cpsYE2bV8CRgG4uBZGixOhKuHTDpWmxP3GPipcid4pMo1CFt26
	m2ieGg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftpcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 09:19:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2497cc190so38967115ad.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849589; x=1777454389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4E0FN1Yk5HSKpQZofTPLB9G3h9HECmMhC7Z9bAGYFWM=;
        b=WSSlt8Ft6hQo/98wHyW7kHtMFtdAHTTX3ILUW9tYznMMk8wD+nf63ceV7jcMvw7p+K
         bch+0iZkWLS5tuE0q2Iq0P8F5OTy5tslVIW86YdYeIwQauLGEwuYgMoPdfVgOhoo5U8U
         B/+92/aOWnJdUZmGOkm1InHVWX1pi65Txc1Xg1gj1JlmqPJViwME8oiAmZpl3ynQUbXL
         SQU29T3TtE0Knl3P7N+LjhxkgF/0ZewstWEaPIZ+dOWFk11YlJBubSeRyc7SfYM94NyG
         fUI6e9O+AYZdUTak4nyteUMETaIivvmMJA9IteYrEcKz0ve14gXA9/shCVNlDvr1LXm2
         IevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849589; x=1777454389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4E0FN1Yk5HSKpQZofTPLB9G3h9HECmMhC7Z9bAGYFWM=;
        b=S4AtZk2v9QQx9tGlZWuREbwjWwujmepgBHS32K8LoHSVigO4WVDQtk8gD0t6kiwAFo
         do+q493LaLW5rS+xbUj4uG0lhG7RbugAR6EHJd4EvZVQBfjKsBrTmsZI8s1buPdxa4Mr
         8evdGWT30ChTDc4/iEr080rrJiQbqFFPVPRl9FGLJxxlFqYqe3EWpSTotE033ghHqLP/
         /hZWvIIDJinCZ5C7Pn20iwaKU/NmUTK9DMjQn1pGTGanuJQYjSj5RjTl4El9IbyehSUH
         yfH8Dax+4Gi05NWI8SE1ZIOqQldfVrON05WZ7Ez+dR2qQM3fsX1twDNNXhna4EfbwqZh
         Duww==
X-Gm-Message-State: AOJu0Yyt/KnUBEFAPUFc7oH/kqdAYcFcJiBAn47dFuB6KheMNyiyGqsO
	IATDLsZJidh0cmBkW3n0bE6jfaW/ZWoJi/cY7VkR6GjFRloVsDn/03sKbHEVdbQVbymUFLs89Ai
	t23kgySUW5iqI88DJIhFK3cDFOvWxLNR96TziRWk6ouf5V/4GTt7eQ8nR3bLVgNt9JA==
X-Gm-Gg: AeBDietVmBotjjunxSlxsQA0u3unU2XXZ+8xbQ35z+b/S9G3lj0RIrmk81dtKgApMf0
	76AinJ5ZRJiHOemRMdWBJd3StuPlD1sw5TNa3D1KHIpXRYn9Jz3cYSIBNZ4grTQWpuhMItDg3as
	2vvQfVxeyYWvUApepVejQFz0ddXKZNZQtOOm5mNh6SQZf9DITbXu+44dJU+mL5zlsN9vRYqpHPZ
	nDoaGe36PJ63oBdIM9SoHOZkFcj9+onYUn8qCtcDlfLZ2ouXXVFk586kgpON6p42gej/akBHeV8
	mJA9o9Yspl+Kth4q8BH/STBni7jttooycNmmUjcK7TV+IaWCwGa5ZG9tj+eUNsQFTiqSKC8j+f1
	FKOr7zmaW6FJCUPjf2KVhDNn9IgsZLO/9jSQy4VyhMN+MNaN9JANgQMVCBz91/2li
X-Received: by 2002:a05:6a00:230c:b0:81f:5acb:55fc with SMTP id d2e1a72fcca58-82f8b38a39bmr18780301b3a.10.1776849589254;
        Wed, 22 Apr 2026 02:19:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:230c:b0:81f:5acb:55fc with SMTP id d2e1a72fcca58-82f8b38a39bmr18780278b3a.10.1776849588754;
        Wed, 22 Apr 2026 02:19:48 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm17981983b3a.14.2026.04.22.02.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:19:48 -0700 (PDT)
Message-ID: <1c15d57c-d4b3-bf0e-0afe-17573eb41a1f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:49:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
 <20260417-topic-sm8x50-iris-10bit-decoding-v2-1-c987b65a31d5@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-1-c987b65a31d5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e892b6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1v4LsqrUVehaW6lpU9YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: G6LNw213LFUlSVWq_pm-sDbeddZxrNp3
X-Proofpoint-GUID: G6LNw213LFUlSVWq_pm-sDbeddZxrNp3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4NCBTYWx0ZWRfXyh7TPmrmm0xX
 gJ7nutohgWbrk3DGnyYZ6bdVF7lNxt/Li4S5V7EWaWlIMXdtplRHxG5egciILzLCI3Ow/1sQDVN
 OB1h4q46qTZVgnrU4exKFRJIXBFAFaRDkbvxcsHX+S3dyOSSr+RxE5HmdMgxj/DvfVhrzUS0fOL
 UlbaiSBvFMnnxoeXahuGVSZE5K6jCH/AbZBgxN6Wo/afxn7CRqBp2QPWPTFcwQlbt3kfU5ljgg8
 zmvRkZ+gGi+XDJH6x6dbf7nPdb1Njh5+sqbeB8c0kuyFN6Y8Jw9dsmIF0MCL12/6spUcvrQ865I
 8YxKeJZGMgGnqmO7VXo8oQ0mvf/jG2duXZ6TI50mEXRnNMj+pbQf0/TpvzMOwopX09DJgNSHxtt
 InwZv3OSotqqT4jvDq3faMy6+nFMcr+PnZVZuQsNzSwGpkkJIeT8YqCHCVwcXwu0sPWre2cyhzY
 Z+/z7gr1pezjUDndddg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59301-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64D9F443EA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 3:07 PM, Neil Armstrong wrote:
> To simplify code checking for pixel formats, add helpers to
> check for 8bit and 10bit formats.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56..bdedd6bfa87a 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -38,6 +38,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
>  		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>  }
>  
> +bool iris_fmt_is_8bit(__u32 pixelformat)
> +{
> +	return pixelformat == V4L2_PIX_FMT_NV12 ||
> +		pixelformat == V4L2_PIX_FMT_QC08C;
> +}
> +
> +bool iris_fmt_is_10bit(__u32 pixelformat)
> +{
> +	return pixelformat == V4L2_PIX_FMT_P010 ||
> +		pixelformat == V4L2_PIX_FMT_QC10C;
> +}
> +
>  void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>  			      enum vb2_buffer_state state)
>  {
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
> index b5705d156431..35337c5da005 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.h
> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
> @@ -45,6 +45,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
>  			   u32 ref_width, u32 ref_height);
>  int iris_get_mbpf(struct iris_inst *inst);
>  bool iris_split_mode_enabled(struct iris_inst *inst);
> +bool iris_fmt_is_8bit(__u32 pixelformat);
> +bool iris_fmt_is_10bit(__u32 pixelformat);
>  struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
>  void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>  			      enum vb2_buffer_state state);
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

