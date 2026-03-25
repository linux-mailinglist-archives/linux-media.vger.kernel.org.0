Return-Path: <linux-media+bounces-57079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKAYKpcTxGmfwAQAu9opvQ
	(envelope-from <linux-media+bounces-57079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 17:55:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0A329755
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 17:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B7E030E1E8F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BB03F7A90;
	Wed, 25 Mar 2026 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgJ/sRoN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sxnl6WBv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB76D303C83
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456303; cv=none; b=sBHPcARLpycE0mO/6rJtbRGbxZg5M+5D4dIARAlf1OfZEdR96+20HJiFVd4dHGaqrdTMNqE0IjHuimIgXQjUWUk1W0OEgyD6bxl7ciqWccuYqN/EXIb3FfBGuXiQYlndSNoH3c61FumYwV7BuY7ov9a0FndO69D+plm62EmF07M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456303; c=relaxed/simple;
	bh=ymhMvWPSz4H4x8d7P5by57C7aV5WDypPse6VD1B411w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWG5TL/TxKk/EE+8Phwe8HvE46TAEwDyPbgpM5smg7MSM3MGfdLOKc7FJUyiy7ph6whJXl+kpJ4GweXP62P20WjiqhP/Y5yYr1L4255X+RpjdYXmn4ZKz0LVEHgmd5uMTl1jC2yPO2XiZQOhg03bx/7ux4AaVHaCQtMgYKWHXOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgJ/sRoN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sxnl6WBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH6vj3532112
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 16:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VI/nXBelBqAIi/vUA24Uppo5J0Y3H2/eUHUlYHlPMeY=; b=OgJ/sRoNU9ISluUC
	TVN3WlFhOHylNbCwHQsaVvNmUmjthMcsxel9GTCSgwFw6ciWAwpIBpGOxdDFKLPy
	bN216Ud4Z5+s0nTX6T6fhfJ0Bc+8076JxhakL5KXCQzmD+56r8D8HO9BdVUrSQnD
	6Dk7Sv47DkOs/3T7u/iP56L1+WDAaMkoqGGo/JyfZbhIVdH514YQWO6ZTfWvdRPV
	nNZtXndBwfXVegbsxARWxuB3qUepwQ5rQQzyIphvfgEJ1u9aRE8xDedZgVqJV2kc
	g79HSNacjC9b/BpzzCbxSGJRccxKnn5zEWmla4ZmMIZm7akIAlxu5yezJQFE9sFh
	zMLO9g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4hc0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 16:31:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c739120475fso68894a12.3
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774456300; x=1775061100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VI/nXBelBqAIi/vUA24Uppo5J0Y3H2/eUHUlYHlPMeY=;
        b=Sxnl6WBvHj1rJXxMepXpNWcnmCp9SFmxj+jIjxhl2qcpfiC3sK+W3UNnsMVM5sYZFp
         NWPpRARYwyXCyv5Q9gOge3E/3IEO7GWR5ml9VTci0a01WUS/HLy6l+6L/fFb0RBMuOl9
         /B/vukP358zd4/S2uf4Xi1E/Gh01PNovr1O8W//AS7XwcSILtbE/ZZ84aCtBEAWMQfNf
         GzHFI+5w0PGDKQfTN+DG4IlJtieNuaQM4q6bgtjBgnqcVwUv5fnSogdJ5Dobo5aZxAEa
         BHyBItbUAbLyiXwz6ZR8OUWRpTOYjAakAPnLrRxu5zV40RpUbHTbne/RpWAtQofKCF9x
         Xx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456300; x=1775061100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VI/nXBelBqAIi/vUA24Uppo5J0Y3H2/eUHUlYHlPMeY=;
        b=R66A8yLZcIIFs1Fvzj8dzQ6O0S861f3kBzpT3O2Dvp2VjVcAINfwcgt3phz4J+8glj
         4ITka6xQTK//9beWIvQG/pmCjL+M+TWoqx8aAEuephT0L1Ow+BkoyGmVA/h1kd6ym5VS
         h91KEnEwn/+TSH81JCgsN7u/dS5Ol9vasd50UQ78zrM4Wo4ZvQWzfOu7QPCwccjjid8w
         Yee0hlh8czMqntMEg00HoNCdOolp+/7phzgFDG75U9k/Nlm7+4c9LWiE+nqk80fmfPBf
         f9w2qi8yBUKeJFtwVQGQcKks0ls9OVvg/17l2t+DhCH7rmzKYie2+OYgm0Hig/DQ7LoE
         QSwg==
X-Gm-Message-State: AOJu0YxlB8GzkrUVbYHJb0eVFXMPCk2445/RQZkvlKspEVBCM/q4O7D9
	qNDJnyHUqFu6j+I9+XR0Im4H5Gpr6Exm/358DtOTtpy4vN15wN124DcPuWFhAdY6uDYRobEHcwp
	FBKd6OZphzmy6uyPL1YQs6GwrG/Uk4e9jSjOuIT4ZeerfvOVYtGMecm/UNcKeKFf7eg==
X-Gm-Gg: ATEYQzxwOOMFynTBGH7OlEtK3FJrhx3pUio9M3Z1y7dTFVnu+tmQKImh3/JVLHO/5wa
	PeNohju7l63qSaq8WSaJzmuVVXTO70pkgjVUKXZrsDucr1gINKF9DTTSZUUdkdvhTAwzUZAPBnF
	iBB26VnNfbXm4uMGi70R3qiUjBPE6vZDZLeyPJV91/tiqLHWLkeMzFwVEJ+qczDhaA14+8ZnBO6
	Mjb8thAJfNYgze0UP3dVDbOyo5GgbuPxLZu39h0sVWXoLf0QD9ubzdxFRv9JOOkVf1oDcETQBnv
	R96zud36VP6f9RSwEETi27eJR1h4zFOWQCwXKrcUJKmMHzTTFMww97b5m7c8+qtLo7n/eaNPnvD
	WN694p8NR7izdKNzo5lg4Pl1bDSwRxTuoSLXOpR/w/jd6izeJcDXZrgs=
X-Received: by 2002:a05:6300:210d:b0:39b:f026:6f91 with SMTP id adf61e73a8af0-39c4ae4f8ecmr4487965637.67.1774456299630;
        Wed, 25 Mar 2026 09:31:39 -0700 (PDT)
X-Received: by 2002:a05:6300:210d:b0:39b:f026:6f91 with SMTP id adf61e73a8af0-39c4ae4f8ecmr4487925637.67.1774456299041;
        Wed, 25 Mar 2026 09:31:39 -0700 (PDT)
Received: from [10.100.155.18] ([106.221.177.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c767382c12asm9435a12.14.2026.03.25.09.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:31:38 -0700 (PDT)
Message-ID: <c97bef2e-b582-fb3a-df0d-bdc57d622536@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 22:01:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com>
 <4a81a54d-2dc5-476c-82ed-9481aee8515b@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <4a81a54d-2dc5-476c-82ed-9481aee8515b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExOSBTYWx0ZWRfX7yvDqYp6BdVA
 rEC7nZBPTya+1xjo+0Dc7hun+DljLnwxbL8P/vcw6lyfzVI0lw3HIzDGkKI8diJX2jMeuTpglq7
 JTZAL4Bw1ZGu5hufweuJ/Mtpce4CK0z1mshy3o9EtW9fiCxdPO56RMa54GUNtQ2DLwvXXvfxSnM
 MKTAiNvWscmio1XcfxVKiilcqIeMWp9d8+Hw4Wggn7sjg+lJzodhRaOpcbqca/tjPf7/JIdtyGP
 Ny/H/4/dx7S2MNNji0+V3+mR3MY403kcnk/8cLTSDBzSnh2VCPySvw9L9KmP7ZEiQcOYEkMMQa9
 PHkrYDH4UmqIZofywQXeTTW/IKbHrw2FKtrJwPNbSIEocb0SZlQTmT7zWNBEFvGik0YyYNMfow1
 Axsk/gaFOo/e9ir4Byoi1mpSbpZyHM3ayRWrEcpJQafpIAt9TVgX/7IUVjk0GZ2hJIfQ46o1b8x
 1RAjt77cUKvKI+Xh/WA==
X-Proofpoint-ORIG-GUID: PtAYybR74nsVhUHNetbLJq0UHA85O_72
X-Proofpoint-GUID: PtAYybR74nsVhUHNetbLJq0UHA85O_72
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c40dec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=RZvIcqPQUX9fBvPB5l+mIA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kjtj7dyyPmjPXOxDuj8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57079-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: AFD0A329755
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/25/2026 1:23 PM, Vikash Garodia wrote:
>
>
> On 3/25/2026 9:58 AM, Vishnu Reddy wrote:
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
>> Changes in v3:
>> - Updated the frame_count condition check
>> - Link to v2: 
>> https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com
>>
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
>
> s/last_buf_recv_time_ns/last_buf_ns
Ack
>
>> +    u32                frame_count;
>
> s/frame_count/frame_counter
Ack
>
>>       u32                frame_rate;
>>       u32                operating_rate;
>>       u32                hfi_rc_type;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..6d982802e5d4 100644
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
>
> s/cur_buf_recv_time_ns/cur_buf_ns
Ack
>
>> +
>> +        if (!inst->frame_count) {
>> +            inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
>> +            inst->frame_rate = MAXIMUM_FPS;
>
> move this to default initialization
Ack
>
>> +        }
>> +        time_delta_ns = cur_buf_recv_time_ns - 
>> inst->last_buf_recv_time_ns;
>> +
>> +        if (time_delta_ns >= NSEC_PER_SEC) {
>> +            inst->frame_rate = clamp_t(u32, inst->frame_count, 
>> DEFAULT_FPS,
>> +                           MAXIMUM_FPS);
>> +            inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
>
> drop this
Ack
>
>> +            inst->frame_count = 0;
>> +        }
>> +        inst->frame_count++;
>
> move this above IF block, so that the reset of 
> inst->last_buf_recv_time_ns can be handled in first IF block

Ack

Regards,
Vishnu Reddy

>
>> +    }
>> +
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

