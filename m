Return-Path: <linux-media+bounces-66873-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MrMgHJcwTWplwQEAu9opvQ
	(envelope-from <linux-media+bounces-66873-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:00:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B471E0F1
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:00:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="IjWGY3R/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LbhxX6n6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66873-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66873-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B88C0301B4D9
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 16:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEDA43784C;
	Tue,  7 Jul 2026 16:59:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34648436BE6
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 16:59:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443593; cv=none; b=WeTfCGshS9+x9YKG1GnWp3f1Br/Cy4bpbHjDeyhNfcOUoeVk6zhmMHbYlkBwZqO6Z8WRALL3dVu5xKmRbfXbPkVsCEOSw3Obep3d2BJAgNgomKtbUJDb2vQZjQsGMVGO77VTNcDbbTRISWyLA7AJ2B/OUD/WyaJTIqy/HsZ9PX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443593; c=relaxed/simple;
	bh=7HfeutcNA0v0WeeCaID2pb5L1N/qO2CFCZe/QU9ZVQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFDFum01F+y+WyccWtlB9zACjoVh2/CBYLfiW4sm5TP3feMIVcXySYqWoCqtrSeC4n96G/2PLJPZhUM8nElotMfUGextxGzDugMmw+dXI8eO5RRnbYvU0WLaneK0t3ruMA3dc1qZxZWZ8amw5HerSvpIOij5o88f+0niqip3QiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjWGY3R/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbhxX6n6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Gxdx4187990
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 16:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HfeutcNA0v0WeeCaID2pb5L1N/qO2CFCZe/QU9ZVQM=; b=IjWGY3R/rQSJyzmL
	acw+z2iYkSgfehkRh4qq9d2/79WK9jsrVD7uL13vl7C+1TTd7TA0H85HONrPSn+x
	AbjM0rLW0ryGnvSZFK/PHDK7lSkB3FGZUO0/+sRrPECUKLlEAqeHr7fCFMcVvpFn
	icGbo19lTNffwRfXXKWlRXZnuS/denQtSgcEEcqV1rUyfdNcwJ5QAdxZh1hEF3qe
	q0IoWzq+gAuN4yWfc+N7a6DZ6cJJaTjhJ39fpz8pD+Dsao3owRA525K82mIlD/Ah
	IRbDfW1hEi62rkhhb89dvUtyzqicXDAwvYoalezzmklfPKpTKIa3Z9MtIJInbD+r
	y83sPQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd001s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 16:59:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so6638857a12.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783443590; x=1784048390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HfeutcNA0v0WeeCaID2pb5L1N/qO2CFCZe/QU9ZVQM=;
        b=LbhxX6n6nXXLGFVf6m7JOX6ezakSM6FzhzRRxyV76gwk/jrKBy8Cw4sy9ooDX4AW2E
         DQvd1BQJ1lifRlktd+LlsxwmEBJNywQfENDVga8WXZjZqz6FwqKh4uL+dNbIWD26jLCl
         ZKZZ0Wfw9Ke1QzH57YSktB7hiJQ+B+utIkfGXKPmOniu8NVyyj0gOZ6MEGcn2OP3Jt7V
         g6VzmY2YJMVwVee7qOQJw7p4JWnPm3HMSzy4kStmzTgMV83ipJMy77fx1X6wLHkj7jzz
         et3M31XVHYoSgE7YJrH1BoLGAPmeGrVn3YtJg6Apw30Cl4XdfWZMtLXH9SFky9Zhqko2
         fIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443590; x=1784048390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HfeutcNA0v0WeeCaID2pb5L1N/qO2CFCZe/QU9ZVQM=;
        b=iMudgQi7N9YzZzgybeKxl1rw56sL+5nPopHUMDxFEPRZqGY0HVQs78j6e7f/sam40Z
         L3R9A8NM8nGW74IklaH9Hdlec9cUcQDqKc9ytmjq2Xag30nd79Dp3D3gWIsY8l1xVhJf
         GMEftJDwLxAwklNnMuK86NEsOBbkE2eCPe0GapZhoJtLpE5qOcfjn6asmoVcmHl7sLnG
         TkQag32WeA401/9z5+ZDcpOoHtyaNVDhxnav1h2zOXqM40Y/Rdr1q05w17uON3sKmCPY
         598G64DBfXHfX9SjG9LkHuBdCcfdjJxFGZmYBUsrxvN8hlBIm590RUqNqWwvT6ArMk6X
         FFLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7JpU1lDR6gyCJYXoAtoO7oz6xw1ylCS8rsv25KdxeRWvXpgo1m9n4/b2sjfJd2oqXsQ+iY7+CFnnTQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF3BOO+UktohV7M9085mRUEbWdAGFZmEoLY4pFUfaqY0I5/YMb
	mfouzoUTcsvM/aalwcKz5yglIUoBMDGjbgqoen7EfsojMgsSvCymP2lAym6HaKLjoVDzKa+v5yi
	gxESz0kRLYKs5I50zQ2JtylkRuahKf/fWRXTKwpupSr3bGImeNtyKjkYN7SvZot9HjBiH3LWlpw
	==
X-Gm-Gg: AfdE7ckz5M41en3lcnk2WwHUFNc+DeWzdgOJC3njOBog9J0CQPx/BxWm/KNmbhed+YW
	lxl1ADmKux2l7rNOyAaC4Bc/eRG+ytYuWqmyDk7GsnAGI+HzIxFIWCnejViAo1IS1PIA+ayHf1m
	F052OUfQ+89s+8hPWpspNvQwc4X30Pz3FGRzMdzK8LnkboPiJiLlEl9G4bSLM76241c+8D7b3QI
	TkW13JOdFSBcIONVA+/UNWfm0HI4zjT93R0T4gJYYZYNLAHZeqczLaNX9hhtFJ+H5dTgv4huTfo
	9fgYVHqvD5MDl4XQmHy0njAyXBW4e2pTL++RGn7BgvSqh5sLNuqN4HxMzr0f3ynUpRzyx2bzkKV
	kmDhx+bQj5ohQ3mL+NFJ5PBslG/YnfaxWrvRHaXKLF9s=
X-Received: by 2002:a05:6a21:329c:b0:3b7:d9d6:9fc9 with SMTP id adf61e73a8af0-3c08ed55697mr8054679637.2.1783443589693;
        Tue, 07 Jul 2026 09:59:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:329c:b0:3b7:d9d6:9fc9 with SMTP id adf61e73a8af0-3c08ed55697mr8054648637.2.1783443589192;
        Tue, 07 Jul 2026 09:59:49 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm11005454c88.5.2026.07.07.09.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:59:48 -0700 (PDT)
Message-ID: <586e3fe8-427d-6f91-d6dd-7ca216c763fc@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 22:29:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] media: iris: disable time-delta-based rate control
 for VBR
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
 <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-2-33fa130bc535@oss.qualcomm.com>
 <77aca547-1afd-494d-a2ec-35ba9b4d37f5@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <77aca547-1afd-494d-a2ec-35ba9b4d37f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NyBTYWx0ZWRfX+8tBHgiiuAHu
 R+haiZDriI4vkKBXeWDMj/1Spb3KjGBZZQVPcL8hEApCvx6ntSisG+Ecm+xkeYomnYBN2x1TGmi
 88NQIkEMV0MAELeHZw8P9CXZejhpIzPCMhX6eZsd4dofMElmwP0mQCM71CiXE7ZgGZicOfHCyUY
 USRIH2rO8kjsJIzXunqNe1Oixlc7Uzuc28Zvq1vKwZXjVHwfwML6gaQnnVN7g/vVdRZzYl4tzVr
 X89rmNjT0I1v9FRprz62Ppy/Rt+N2xdFr0et6atR14LT9R7smd5R6AjmmFZVGmXuA7UUo7JBPFz
 Z8c0RNRIXxIsoLzMJYbVTCY12NNM4gZbHuASxMwyzovGho6bbYZWQlrQCFzJ686UnThpXVT2FWN
 U25CBEHMksgu8uemqx85K2jozelNn5WDL1qXQhjQtvhnCvbJ+5QaiQRrVFT3eM714WWxHDk2nWK
 AREDB0lTTEzV8e7Vimg==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d3086 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UjfhgijXNTkN8XPUw8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: odNz8aPPF7mR_gldgYajUNQZis9Xm8AR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NyBTYWx0ZWRfXwAezdld3K2CW
 rTtt3+WcimYYFZrtBqeoDkalPE73F25ZDr3xNpHKX5UDBldAfZhdYdOTZyy1KaDIAYaS/53rWWf
 AgjHcSPh/75YB5LWPE4GdvkH/t2yYcI=
X-Proofpoint-GUID: odNz8aPPF7mR_gldgYajUNQZis9Xm8AR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66873-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC8B471E0F1


On 7/7/2026 2:39 PM, Vikash Garodia wrote:
>
> On 7/7/2026 12:05 PM, Vishnu Reddy wrote:
>> From: Gourav Kumar <gouravk@qti.qualcomm.com>
>>
>> The iris encoder driver was not sending
>> HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL to the firmware during encoder
>> initialization. Without this property, the firmware defaults to
>> time-delta-based rate control (enabled), which calculates the output
>> bitrate from actual frame timing rather than following the configured
>> bitrate target.
>>
>> This caused variable bitrate (VBR) encoding to produce ~5x configured
>> bitrate. For example, with video_bitrate=896000 (896 Kbps), the output
>> is ~4.4 Mbps instead of the expected ~896 Kbps.
>>
>> Time-delta-based rate control is designed for variable frame rate (VFR)
>> scenarios where the encoder adapts to actual frame timing. However, when
>> an application explicitly configures a bitrate target, the firmware must
>> follow that target regardless of frame timing.
>>
>
> same here, we can drop the new empty lines
>

Ack.

>> Fix this by adding the TIME_DELTA_BASED_RC capability with a default value
>> of 0 (disabled) and sending HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL = 0 to
>> the firmware during stream-on, allowing the firmware to use the configured
>> bitrate as the target.
>>
>> Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
>>   .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
>>   .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
>>   5 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 10e33b8a73f6..f6136e655b98 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -1477,6 +1477,25 @@ int iris_set_layer_bitrate(struct iris_inst *inst,
>> enum platform_inst_fw_cap_typ
>>                            &bitrate, sizeof(u32));
>>   }
>>   +int iris_set_time_delta_based_rc(struct iris_inst *inst, enum
>> platform_inst_fw_cap_type cap_id)
>> +{
>> +    const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> +    u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +    u32 value = inst->fw_caps[cap_id].value;
>> +
>> +    /*
>> +     * Disable time-delta-based rate control (value = 0).
>> +     * This overrides the firmware's default (enabled), ensuring the
>> +     * firmware uses the configured bitrate target rather than calculating
>> +     * bitrate from frame timing.
>> +     */
>> +    return hfi_ops->session_set_property(inst, hfi_id,
>> +                         HFI_HOST_FLAGS_NONE,
>> +                         iris_get_port_info(inst, cap_id),
>> +                         HFI_PAYLOAD_U32,
>> +                         &value, sizeof(u32));
>> +}
>> +
>>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>>   {
>>       const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h
>> b/drivers/media/platform/qcom/iris/iris_ctrls.h
>> index 3c462ec9190b..10e046722ad3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
>> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum
>> platform_inst_fw_cap_type c
>>   int iris_set_layer_count_gen1(struct iris_inst *inst, enum
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_layer_count_gen2(struct iris_inst *inst, enum
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_layer_bitrate(struct iris_inst *inst, enum
>> platform_inst_fw_cap_type cap_id);
>> +int iris_set_time_delta_based_rc(struct iris_inst *inst, enum
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>>     #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> index acc0ed8adda1..d119ad599c31 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> @@ -416,6 +416,16 @@ static const struct platform_inst_fw_cap
>> inst_fw_cap_sm8550_enc[] = {
>
> targets other than the one using inst_fw_cap_sm8550_enc ?
>

Currently, all HFI gen2 platforms are using this caps only and
this property is not applicable for HFI gen1.

Regards,
Vishnu Reddy.

>
>>           .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>           .set = iris_set_bitrate_mode_gen2,
>>       },
>> +    {
>> +        .cap_id = TIME_DELTA_BASED_RC,
>> +        .min = 0,
>> +        .max = 1,
>> +        .step_or_mask = 1,
>> +        .value = 0,
>> +        .hfi_id = HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL,
>> +        .flags = CAP_FLAG_OUTPUT_PORT,
>> +        .set = iris_set_time_delta_based_rc,
>> +    },
>>       {
>>           .cap_id = FRAME_SKIP_MODE,
>>           .min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index 776b21cd11b2..8766d9e49611 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -67,6 +67,7 @@ enum hfi_rate_control {
>>   };
>>     #define HFI_PROP_RATE_CONTROL            0x0300012a
>> +#define HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL    0x0300012b
>>   #define HFI_PROP_QP_PACKED            0x0300012e
>>   #define HFI_PROP_MIN_QP_PACKED            0x0300012f
>>   #define HFI_PROP_MAX_QP_PACKED            0x03000130
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index c9256f2323dc..99dc6d5c72ba 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
>>       LAYER3_BITRATE_HEVC,
>>       LAYER4_BITRATE_HEVC,
>>       LAYER5_BITRATE_HEVC,
>> +    TIME_DELTA_BASED_RC,
>>       INST_FW_CAP_MAX,
>>   };
>>  
>
> Regards,
> Vikash
>

