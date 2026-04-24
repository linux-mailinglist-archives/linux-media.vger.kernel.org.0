Return-Path: <linux-media+bounces-59506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PlbNNc162nRJwAAu9opvQ
	(envelope-from <linux-media+bounces-59506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:20:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A945C123
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CD673039824
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE172387361;
	Fri, 24 Apr 2026 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzisQckw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CbSzlfhu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6735F197
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022195; cv=none; b=A7sUteKV+dPHOokjHvyhRIzsaZZAwXpsqK0W/P37Lm3Uely7oz5Jf+3N/uRUgnVXW8fNocgCu+raNYhLYjUI/N+3ErPYrrv7ymTi9TySorue46VAYharVXq8tRt+DJqOtAML6qJqxBLkoA08pZik/SiSuIVNE6nsn4DJVoPkvrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022195; c=relaxed/simple;
	bh=g88rq/W6/jJt6g2zQBKGzuV5Xjn9aHoWAgxGMOp3QSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=basS/egnA/rX0nQYLFAkVa8HeiuTEUwAJB0bKZOMvaaxXIuMv8ChkBFnDQ99KHObvh8e5SHMCeW4om34sbvn0A7kWB9VmwUyW4xTsxbftJ/hPEfB4CGIPpwIgTTDed969UwKyVw81TZZ2qcecYHVL+/8JjXwrt9Fg9+xjd9DPVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzisQckw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CbSzlfhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O36mfX756696
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8MeOqbyQh64Wo6o3xnugk0LDSP6qrP343xhplxDA7M=; b=gzisQckwIpW7Vfoe
	IQgkFQhU++XIGkW28WYvmYwrQcg+HooZ5OQmopgHt7WD1HF7iAZQ0mnoLmaVV9D6
	Phj5IS9FXMriT12HiJvSbJeIV2eyXKBQAjrJ37XkWMQYXj0O2tHRsdUpkmX0a4jF
	W65ky1g0mXiY9UIYBvXxYHwurew1PKHz9c9UKzv8dTVurQQx27nTLranfrIGQh//
	IpCpe1NHB1rFDWJJTEJFzqNZx9GEy7/HIUiNaFeLQcfJr6PULnSXHGGabcfPzZRf
	WZ/dyAu7cukhLJ2iqCRuxY+2k4u0uQBHfzvRX7GKWzHGwrwW469fsK/c0SHx6y25
	DIq4cQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bk8w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:16:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso14808816a91.2
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777022191; x=1777626991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8MeOqbyQh64Wo6o3xnugk0LDSP6qrP343xhplxDA7M=;
        b=CbSzlfhuGlK7pcXlIk0hfPF7KMnR0R3V9HJTAj+VQ2KHtySVDMoaAxYQ5GpTF6JqpG
         0E8Bl16SJxCi3FbQnINoD7R4iujqz44B2OhBrVClaKehoKvSIzbUsE1gIY602anoGFi3
         8pcPESilDwPb3uq6v7CSsmhWy7mWOGrTD6Qeg35PnTljCk4Gi7H+nF7xzj1lsxKmTmGJ
         OrjY5nI0EUlhZpzmIH0t7g5WCHO4Me6r9KYWbFOuw7qw4bigRokUMmaUeU/pEl9UCEMP
         DILxw7E6DzfceUZlHl2zv4BWIq1ES7hwha6Md1tcvtRq+Z2mi3Ly+gv7jrSkdVRHNuQg
         XkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022191; x=1777626991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8MeOqbyQh64Wo6o3xnugk0LDSP6qrP343xhplxDA7M=;
        b=dwqkrfwKA6TZz+0zdm40yHDGl8yInOETS3pwPSI+VcHV3oGk9rkWSYlLntKbiHUjH4
         3fw+ee9meNUJuyWSr2JQ31a01pLtknW9K5jMmr/nBbjHIG5if2fFQQGQtCCfd+x2dROL
         on2+pyfqkvURZFtL985kS4+qgO7FvprxN9mXdyRpSCbyzC6CqvvYppUr7ySF/fZJHE/r
         QhLldUDHQbw1wNKYGN/Z7iU7JsP5xzjjS6CRDXQtJhemSg18QqSZKhsJz4bJ5sriMQ+X
         ch0bsJ/vaPUTXID29LCF6R7f99NgwDfZQ6jNmrrZ4aW7M7p7O7NizGYhN11aFerOR4hS
         FBAQ==
X-Gm-Message-State: AOJu0YxWof+0fgjVffHC1oStX1sTvgnNtfJfODZqt16syeIVc/LHzebq
	gOrCmD4oEJkl+PxYSKJyr6GTcrY29Kk0H6KP3kZxuVM7C+aTyfJyA23SGWqt72Vf2Jkg/jJ6h5J
	SK53jh8XRy+jilRYMC380uQO3Q+vlCoazvTQRVsXqCKBqnCYM0OLNmn9vAwngOOEOjw==
X-Gm-Gg: AeBDietMtg4NFw6ZxTH6e+CXhPK5Q2taFg+9IK5UnfOLzcrTiHO4fFmN3lBeErelBR8
	LS7UmL148jymiXEfXZfW2iz6jCVt9v2AEaXsNCKCjcuiIjzZZk8c2kOS39cqfqon0aHnQJrTrdI
	84pkNo6UB5inIQYYMaReO+xSHEeD3gF5Knp3JlSiiYepPTQUITmTh/jj1t7A7NBdjJJpvspw200
	/xi1ujF6tfng1KA7Zxv5mAPDIbjisa/bHnohAN60lWbCX9rrPh04sqOGIR7V+DEPPjSNFI1XuTt
	3x508Jesvcp1QNffldfk85CzFF2qMOBdfxyRHxtnbaSP30PU7GHy0hIPlwCKPod0WZLzgkYWKcx
	wsKXY6IweEqeEba1Lh9fFbtV+Yf3ZzGWCkQzCTasb0x9+Yvo8PHmiB3xuynH79Ky+Bw==
X-Received: by 2002:a17:90b:390d:b0:35c:30a8:319 with SMTP id 98e67ed59e1d1-36140222bbbmr32539518a91.0.1777022190780;
        Fri, 24 Apr 2026 02:16:30 -0700 (PDT)
X-Received: by 2002:a17:90b:390d:b0:35c:30a8:319 with SMTP id 98e67ed59e1d1-36140222bbbmr32539505a91.0.1777022190266;
        Fri, 24 Apr 2026 02:16:30 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0db13sm234364865ad.53.2026.04.24.02.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:16:29 -0700 (PDT)
Message-ID: <dffbf0c6-a458-2dcd-1927-7495dc326d76@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:46:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <lWwJ9pbXoZXg350L9fA8Sx-qznLud6KXnJlBTFNBLZQXEwKZeI50KGzJPDq43FO2QtbisF9pyxxeVTXX-WvN0Q==@protonmail.internalid>
 <20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com>
 <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NiBTYWx0ZWRfX53u/CqVzGtKH
 uLOOB+uPOs5AmirtwpKNnDxbWS0ZgnLx490905CXO7zitlVktqOe7Yb5FU9R1heLRNCRZJAe5Tk
 CWtbFeHiphTb3YjYOuaeqwahpMKE37IPaM52/EfJELVxmMaZ1hXTPc7NYiPosXv9e7vnkIBkeG1
 E2MR4n0CQNIrFA7ibruDYRpwgYrghS17k2oOokF+aei7QuVNm5QZ0EIJpNjS9BCa4AW4QA8L6wc
 ubCMt60w7w4UvJfPPInosDdiQhh1hYOqixmsNbX4hZgBdG5x5sYOvrDLrRkzS9ZaULgfw1bivxx
 z5qdmEWFCtl09i/WXX8n6/Gys5ysTv03Ignc5gf4grWOz4nt/t9tdm2b7VExaW3tM8mFl0UUnnF
 M0zAN5NwF4SGlqt/gP8hN51dYa6I+rsPvJYYhH46vIEjxAogaadGC1dqgE/I+2ylzVGvJUhCo8y
 i5eUBxGiwAtW+dCqwZQ==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb34ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=gkiTcqCCC2T/77GpOVv7Jg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sxecAc6Fdml7H7xBZ-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 7AGH2sGHvkBfDTM-8HkPgqE3THUajMRY
X-Proofpoint-GUID: 7AGH2sGHvkBfDTM-8HkPgqE3THUajMRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240086
X-Rspamd-Queue-Id: 376A945C123
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59506-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/21/2026 2:31 PM, Bryan O'Donoghue wrote:
> On 21/04/2026 07:41, Vishnu Reddy wrote:
>> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
>> num_comv count unconditionally when calculating the COMV buffer size.
>> This resulted in an oversized COMV buffer allocation throughout decode
>> session, wasting memory regardless of actual number of buffers required.
>
> You should define what a COMV buffer is before talking about how you are
> changing it, i.e. define the term Co-located Motion Vector (CMOV) and then use
> the abbreviation CMOV liberally as you wish.

Ack, will update accordingly.

>
>> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
>> replace iris_vpu_dec_comv_size(). It derives num_comv dynamically, it
>
> "These derive num_cmove dynamically"

Ack.

>
>> uses inst->fw_min_count once the firmware has reported its minimum buffer
>> requirements, and fallback to inst->buffers[BUF_OUTPUT].min_count during
>> initialization before firmware has communicated its requirements. This
>> aligns the COMV buffer size to the actual count needed rather than always
>> allocating with fixed VIDEO_MAX_FRAME value.
>>
>> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
>> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
>> COMV size calculation to use MIN_BUFFERS even before firmware had reported
>> its actual requirements. Fix this by initializing fw_min_count to 0.
>>
>> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
>> to 6.16MB per decode session, significantly reducing memory consumption.
>
> Cool nice fix.
>

Thanks!

>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  2 +-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 24 +++++++++++++++++++---
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
>>   3 files changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..f433065e08b2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>       inst->fmt_src = kzalloc_obj(*inst->fmt_src);
>>       inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
>>
>> -    inst->fw_min_count = MIN_BUFFERS;
>> +    inst->fw_min_count = 0;
>>
>>       f = inst->fmt_src;
>>       f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 9270422c1601..57237543b229 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -731,6 +731,23 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>       u32 height = f->fmt.pix_mp.height;
>>       u32 width = f->fmt.pix_mp.width;
>>
>> +    if (inst->codec == V4L2_PIX_FMT_H264)
>> +        return hfi_buffer_comv_h264d(width, height, num_comv);
>> +    else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +        return hfi_buffer_comv_h265d(width, height, num_comv);
>> +
>> +    return 0;
>> +}
>> +
>> +static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
>> +{
>> +    struct v4l2_format *f = inst->fmt_src;
>> +    u32 height = f->fmt.pix_mp.height;
>> +    u32 width = f->fmt.pix_mp.width;
>> +    u32 num_comv;
>> +
>> +    num_comv = inst->fw_min_count ? inst->fw_min_count :
>> inst->buffers[BUF_OUTPUT].min_count;
>
> Please just if/else this though its far easier to read/understand that way.
>

Ack.

Thank you
Vishnu Reddy
>> +
>>       if (inst->codec == V4L2_PIX_FMT_H264)
>>           return hfi_buffer_comv_h264d(width, height, num_comv);
>>       else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> @@ -739,7 +756,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>           if (inst->fw_caps[DRAP].value)
>>               return 0;
>>           else
>> -            return hfi_buffer_comv_av1d(width, height, num_comv);
>> +            return hfi_buffer_comv_av1d(width, height,
>> +                            num_comv + AV1D_COMV_BUFFER_OVERHEAD);
>>       }
>>
>>       return 0;
>> @@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum
>> iris_buffer_type buffer_type)
>>
>>       static const struct iris_vpu_buf_type_handle
>> dec_internal_buf_type_handle[] = {
>>           {BUF_BIN,         iris_vpu_dec_bin_size             },
>> -        {BUF_COMV,        iris_vpu_dec_comv_size            },
>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
>>           {BUF_LINE,        iris_vpu_dec_line_size            },
>>           {BUF_PERSIST,     iris_vpu_dec_persist_size         },
>> @@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum
>> iris_buffer_type buffer_typ
>>
>>       static const struct iris_vpu_buf_type_handle
>> dec_internal_buf_type_handle[] = {
>>           {BUF_BIN,         iris_vpu_dec_bin_size         },
>> -        {BUF_COMV,        iris_vpu_dec_comv_size        },
>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
>>           {BUF_LINE,        iris_vpu4x_dec_line_size      },
>>           {BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 12640eb5ed8c..7a9cc1c92da3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -110,6 +110,7 @@ struct iris_inst;
>>   #define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
>>   #define AV1D_NUM_HW_PIC_BUF    16
>>   #define AV1D_NUM_FRAME_HEADERS 16
>> +#define AV1D_COMV_BUFFER_OVERHEAD 7
>
> Whats this ? Why is there a new seven byte overhead ? Does it represent a
> header, an alignment ?
>
> An overhead can mean anything.
>
>>   #define SIZE_AV1D_SEQUENCE_HEADER 768
>>   #define SIZE_AV1D_METADATA        512
>>   #define SIZE_AV1D_FRAME_HEADER    1280
>>
>> ---
>> base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
>> change-id: 20260421-optimize_comv_buffer-ae7107673609
>>
>> Best regards,
>> -- 
>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
>
>

