Return-Path: <linux-media+bounces-56468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPG+Ah7qvGnQ4QIAu9opvQ
	(envelope-from <linux-media+bounces-56468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:33:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FB82D6402
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1519F304CA41
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0165C301460;
	Fri, 20 Mar 2026 06:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVGanlVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNm57/+S"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABEE41C62
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988375; cv=none; b=l1cWWw0VwtQLjt3n3Tamsuea04yaTSafvgFYTW0Sapq/ILbycekbsJg6rPQ1tD+SwJ8SQUN8bTUCj69yiEXJGJEE8PcM84cXu/Nh9us4AZ+QMz3iod6Hxf4QNG9opdOl7f49n97vfwAUm9PQKupRfhu+fR+RK4TsIP3hhNIpm88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988375; c=relaxed/simple;
	bh=JDWybbQZFLzT0yqWz2yTi4vljDUY6qfxjSR/o3TSXHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OW9gOKphNdf6EhGiVgEM2C9ztKNX6gZGviJeIvOQeSE2tW8X1qR4NgWgRR/5tmn7zOw7eYSkcmjphMCYhmssiaT+nZ9fw/LD8iHiK2Dcw8pKYvPPJnySevHfug06dkM+3nVw+wZRCeKoFngpD00hGRmx98TxnIeZTRNl845ZthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVGanlVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNm57/+S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XhbY539229
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S3XDmZ6DZpsSMr45TYJTcuxR2oKUiRkyGpJn2zik/2c=; b=bVGanlVyrrugaFBp
	n89/r0+rOxjBzcZbdMepVpVDlI8yAWuJSHbaPDT+7nXvm4uyAJknH0cPELqa0741
	S+iiHTtxFN8ZUNTncImt0lkRv0y/+JIE+SPborKXbGQ2ibnY4lvXbriQkLTs+8cS
	WL76sRUwZS4DqKINJYiKXmeGb3QH2zqwIgIDpAL81KshP9chzUrCV1k/I7dj1wFa
	l3X3gbfnuhUklCLwJwAOqoobvGqpph2QrnOzjZ3c2WAbAp1u/HNFhCjT/0h8NhGe
	KPcpCTA21em6VGuvhUBSG/0c2ZMkLX2TAoYTDyyZeuFFlQu6VnzguC2beeK20eoW
	ErxDLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0sm6h2w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:32:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b901d542bso11672962a91.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 23:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773988372; x=1774593172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3XDmZ6DZpsSMr45TYJTcuxR2oKUiRkyGpJn2zik/2c=;
        b=LNm57/+SVHAUUikdf+Xgs24nqEuFDISY4/WRJzBMRMjFMx2Y+l6V6w2KLYlJBJ21+s
         6TNlatfgLWpZM9A16qmKO4I+QE25V/Wu2XQGpNs7IDGkVnunvGwcEyBfngZKMEFbk9hq
         iguiE9HaZaXp9D3+6jtvtMcl7rW/6oM1IVMBWzj/AMsFFHHCsnsS52div/iWrbQ3lSmB
         x6NKPqGHYlZeEdrUOthCj4fcwG0dxBz8FDVajm/4Ezvny/zbBB2uZGNJ7arEbPJP+OEp
         1xiix1TYB0ApOar33fTsPhoNbvRdq+h8OTdZqQ/R5p/sKT1/lf7l/y8eSueW1d3WalHR
         tcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773988372; x=1774593172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3XDmZ6DZpsSMr45TYJTcuxR2oKUiRkyGpJn2zik/2c=;
        b=TE8Z31YfagzDWXxk0QsVnUonTKfLnfGSnVwLyoLOrPJpU392F91KP9opSoaWPlEmTq
         18q4Qt1IZv6xXxAkckj6pZyKaMODEkXz5oSBiryPzDqev0/LYOo8bA7WphY3B6yvdnmt
         heqOKLarNZtA27XMB+sp3u4Y8zEMB3joDeGw6A+Yz0LqeN05nsPGwrCs0g9q2Oz/AFEy
         p4+3fUpIpr8jVzWStDGSbVENZG+JWxY7zRCtV7fFTP8tY+fyKct4ATmiXlz80HMbNMDM
         wiH7hVoQLUXn6wg6PUucwx60ialfiHWKVUIr7Rq0bZiccyDC8GR7tjtqSB9N4/szEcSk
         nmaQ==
X-Gm-Message-State: AOJu0YxgvxM0NzNkaHDKpzPKXEGyhMKa65c0Y4JW243znV161aT5LNMO
	arnlFH9AARfE8iWEkMn85yUN52lhhcVIhNF+v79F6EDdrVQfx+kHJdfyOPd8MV/Y7ROxDokxthG
	uQy6+1glVXHCGVcgscDjgnCgvA4yoxyjz92eA75Lw1ywssPaUo8sn7ghgSmDUYNgFJQ==
X-Gm-Gg: ATEYQzz3aK3ZxLp9oeycAcqFO8QY1OLjUEpQtL8nW+Fu69X+WJorPC1Utv7QxAmH5G9
	fHCYBjGtK0SgK6rh8Sxi+J/LcMiNPHHxBqbZjnk8/35vokVThY5P7z6oQR1P1+xPZcugWRsKYgw
	db64dCufBz0OrMr3nvuwK8lwqOZjp8DaZshHoB4fDQ9rKFhMYzUgzcSmv6Du5IrVO3PESF2dXtX
	EE5v9Cr5FBzpp7UV46pixScQD+2nz4L66cjSiUGwaL+a58E+gJx/UlGabLdUBJaCuhjmHtuD/4q
	4ERVP1alq5zJ+7dXug+vnSu/vNNDfwbeGNvu9WXeJ5qStGnRCq30YuoD4bgn6UFbPwol6GAVTtX
	6exsZw5h1RxgjX/pCvmKZMC+3U+1ICWNiGrl4en2JHQq3cMmwSwttSkJY
X-Received: by 2002:a17:90b:4c8e:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35bd2cec778mr1453011a91.20.1773988372443;
        Thu, 19 Mar 2026 23:32:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8e:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35bd2cec778mr1453000a91.20.1773988371900;
        Thu, 19 Mar 2026 23:32:51 -0700 (PDT)
Received: from [10.100.155.18] ([223.228.117.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc6017492sm4536207a91.5.2026.03.19.23.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 23:32:51 -0700 (PDT)
Message-ID: <9c5da48f-4003-b46f-cfb9-0ad5f5062d69@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 12:02:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com>
 <19e9afa8-b0fa-43e1-8758-b58e6c7a095c@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <19e9afa8-b0fa-43e1-8758-b58e6c7a095c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8jwiV_Rl5LWUntmJHNhJWp1dHEM2Cn5Q
X-Authority-Analysis: v=2.4 cv=Rv/I7SmK c=1 sm=1 tr=0 ts=69bcea15 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=7c+JdVm+58SBmuR1ZE9k/Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yceorTwUWq3GjdelvQMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA0NyBTYWx0ZWRfXzTNlowiN/Odj
 N0ILwp7AlcqU2h1Nr/TKFGox2N2VwQ601gGNJLighVahVGe4Xt5KGoKwLKW1oMmqbHm93FVwLf2
 OLPQDZGdPNJY7tFWqZ2tNG4g4uMh3A0F0n2dsOsS2AIj8ldVfmv8yyzRJRgSZQ3bnlejnfd4927
 PTWNPXJBOZHhITfV3jB2vEl3wKaE2AEXVeINXjknAjxepKzl/nXNySoTSmVTLyIxK+BhlhH8CD/
 zuFh4XyuJGl3udQ3CQygEeKiwhq/li/S7u2pj7y6pJKtqQLJz6GE5PYyfPRvCmbea+JiOBu6bNQ
 FNHCGIAlW8WzCrCeeV0mdsb6BgyizE4PAHwob0ci9kiNDX+K5hwmUIS+TfjOuKaZeWUAwYM/2g9
 6uHPomGzAeqjtnX4K+Zy9e0K5WK8QklyHWzwQ3cqcMJAWY1EcUcE03X8qWFmKFW8Zc/mSBQcbA8
 QMxw/3KOxiAHlbItd4g==
X-Proofpoint-ORIG-GUID: 8jwiV_Rl5LWUntmJHNhJWp1dHEM2Cn5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200047
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56468-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59FB82D6402
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 12:54 PM, Vikash Garodia wrote:
>
> On 3/5/2026 7:00 PM, Vishnu Reddy wrote:
>> The driver was using a fixed default FPS value when calculating the VPU
>> frequency. This caused wrong frequency requests for high‑frame‑rate
>> streams, for example 4K at 240 FPS. Because of this, the hardware was
>> running at a lower frequency than needed.
>>
>> Add the FPS measurement based on the decoder input buffer arrival rate.
>> The measured FPS is stored per instance and used in frequency 
>> calculation
>> instead of the fixed default FPS. The value is clamped so that it does
>> not exceed platform limits. Add a VPP firmware overhead when running in
>> STAGE_2.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Replaced div_u64 with mult_frac
>> - Link to v1: 
>> https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
>> ---
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 21 
>> +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h 
>> b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 16965150f427..180cba36a7f2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -109,6 +109,8 @@ struct iris_inst {
>>       u32                metadata_idx;
>>       u32                codec;
>>       bool                last_buffer_dequeued;
>> +    u64                last_buf_recv_time_ns;
>> +    u32                frame_count;
>>       u32                frame_rate;
>>       u32                operating_rate;
>>       u32                hfi_rc_type;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..88820060e22a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>>       if (ret)
>>           return ret;
>>   +    inst->frame_count = 0;
>> +
>>       return iris_process_streamon_input(inst);
>>   }
>>   @@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, 
>> struct vb2_v4l2_buffer *vbuf)
>>   {
>>       struct iris_buffer *buf = to_iris_buffer(vbuf);
>>       struct vb2_buffer *vb2 = &vbuf->vb2_buf;
>> +    u64 cur_buf_recv_time_ns, time_delta_ns;
>>       struct vb2_queue *q;
>>       int ret;
>>   @@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, 
>> struct vb2_v4l2_buffer *vbuf)
>>           return 0;
>>       }
>>   +    if (buf->type == BUF_INPUT) {
>> +        cur_buf_recv_time_ns = ktime_get_ns();
>> +
>> +        if (inst->frame_count == 0) {
>> +            inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
>> +            inst->frame_rate = MAXIMUM_FPS;
>> +        }
>> +        time_delta_ns = cur_buf_recv_time_ns - 
>> inst->last_buf_recv_time_ns;
>> +
>> +        if (time_delta_ns >= NSEC_PER_SEC) {
>> +            inst->frame_rate = clamp_t(u32, inst->frame_count, 
>> DEFAULT_FPS,
>> +                           MAXIMUM_FPS);
>> +            inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
>> +            inst->frame_count = 0;
>> +        }
>> +        inst->frame_count++;
>> +    }
>> +
>
> simplifying it ?
>
>     u64 now_ns, delta_ns;
>
>     if (buf->type == BUF_INPUT) {
>         now_ns = ktime_get_ns();
>
>         if (!inst->input_frame_count)
>             inst->buf_fps_start_ts = now_ns;

Here, the actual required FPS will be found after 1 second. until that,
the initial FPS need to set for max.

>
>     inst->input_frame_count++;
If we increment the frame_count here, once frame_count becomes zero 
(after 1 sec),
In next buffer queue, again the above if condition will be true and FPS 
will be set to max.
I can add the code like below, Let me know your opinion.

if (buf->type == BUF_INPUT) {
     now_ns = ktime_get_ns();

     if (!inst->frame_count) {
         inst->last_buf_recv_time_ns = now_ns;
         inst->frame_rate = MAXIMUM_FPS;
     }
     delta_ns = now_ns - inst->buf_fps_start_ts;

     if (delta_ns >= NSEC_PER_SEC) {
         inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS, 
MAXIMUM_FPS);
         inst->buf_fps_start_ts = now_ns;
         inst->frame_count = 0;
     }
     inst->frame_count++;
}

Regards,
Vishnu Reddy

> delta_ns = now_ns - inst->buf_fps_start_ts;
>         if (delta_ns < NSEC_PER_SEC)
>             //skip the further logic;
>
>         inst->frame_rate = clamp_t(u32, input_frame_count, 
> DEFAULT_FPS, MAXIMUM_FPS);
>        inst->input_frame_count = 0;
>     }
> }
>
>>       iris_scale_power(inst);
>>         return iris_queue_buffer(inst, buf);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c 
>> b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 548e5f1727fd..d621ccffa868 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct 
>> iris_inst *inst, size_t data_siz
>>       u32 height, width, mbs_per_second, mbpf;
>>       u64 fw_cycles, fw_vpp_cycles;
>>       u64 vsp_cycles, vpp_cycles;
>> -    u32 fps = DEFAULT_FPS;
>> +    u32 fps = inst->frame_rate;
>>         width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>>       height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>> @@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct 
>> iris_inst *inst, size_t data_siz
>>       if (inst->fw_caps[PIPE].value > 1)
>>           vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>>   +    /* 1.05 is VPP FW overhead */
>> +    if (inst->fw_caps[STAGE].value == STAGE_2)
>> +        vpp_cycles += mult_frac(vpp_cycles, 5, 100);
>> +
>>       vsp_cycles = fps * data_size * 8;
>>       vsp_cycles = div_u64(vsp_cycles, 2);
>>       /* VSP FW overhead 1.05 */
>>
>> ---
>> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
>> change-id: 20260304-update_fps_calculation-98ee7f7507b1
>>
>> Best regards,
>

