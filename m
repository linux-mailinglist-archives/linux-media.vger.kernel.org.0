Return-Path: <linux-media+bounces-55843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NQZOOmgt2n9TgEAu9opvQ
	(envelope-from <linux-media+bounces-55843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:19:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6922950A7
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4DB930293FD
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 06:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE04234B1AB;
	Mon, 16 Mar 2026 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGg6nKO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoXAw9pR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72EA269B1C
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641909; cv=none; b=qYtB8pGtIfFl5CG9cKTEOIJVHW9myjkSnHwIcSlx3c7Sz1H8w3Vt2j3D0Bt+N2jTTb7Wowj2foM+vusoW2jkWIQ/Tj82HC76fCPA4038kwNTgl2G/PtQf6zWab67w5fv68KHU2zTb9xZ6lxpZGNJXRT91/S6/O4uaPaInUb59Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641909; c=relaxed/simple;
	bh=k43xSNAFkBMBfYdpj/XGRwfgNTDen/YEW8r1Vexcvig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OPUhKkV7SdJiVD7z9Pw0gxo65TdywMFumHTyyNhTRX10EEfkqu8G/v315tUE/xJrMoo/jQ0l2aiVUUpxSau9FRcn37ga2n47eeTPOIT6UdGsx36av/Br6tKgS6hqI5HhiOVCQ2Mu3ISGWpgGgKjkL+wLGX+lmnnYD7Iv9yBZxyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGg6nKO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoXAw9pR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G654cU2129875
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwa7MczQdt7D2OJpyag2l+frngAA5BKmFqOiBEGme6g=; b=mGg6nKO7qEBHUtH/
	yV564iqD85xcdzp6c2n3Ru4SVlLHpczhbjzutW+KxR3R2/n5A/ErLaKPkeiX9Lan
	w4iKGkdcNMC9GL0J7JcsMLm/6A/Ivwn8JCYoElHljycrvSeKNCH0xC3cJUoqWB2Z
	QGW+9807xldlRAbRuWl72YUIMH31DWioyvdEQeTrryfja2JYcunL3kxeABbWKIrf
	YAtzqlr6sGIM0byxuTxlYY+fm9em4DQ5QyUlBvDdyRSg9/axga/0WrbOoaWuoJOJ
	ctEfok6c4weF2iPx1ATTBnmBq4mTic0nNOazADIy8pPhQFwBytBt/47nPKuD9LVI
	SeEQaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00ameu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:18:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b96fbfc64so5725606a91.2
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 23:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773641906; x=1774246706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwa7MczQdt7D2OJpyag2l+frngAA5BKmFqOiBEGme6g=;
        b=AoXAw9pRX4yKL1OSfp0COTf3wl4TvMDv7jpAF96QJtmj9045jkxVmCn95eFHSfarRr
         fNNYLCP2nqF/JypPNl/Kv9n99G1pfZN0Pkx12WyCzwvJ70WoWLDgqidWwEPdHb1xHGTr
         vT3kdJDlvIpYRKJxvhUL3olr/UPwMiomUSTTLgEhWdZOGK8I3xCq3w5PH4GlgcBDTZK0
         76J4/pUXy1x+ZZ93J4hFOh4VjuXvm+Ih7OKQ/oUmrNCUR3x5ERp1RpPUFh9O+FuTmGt8
         YdgaaO7AVuyfRr0W2J2v5PrIM8438rkJU6ydUzoCF7YgxFfhikMdSpWn58Gv2t5wjO6K
         8Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641906; x=1774246706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwa7MczQdt7D2OJpyag2l+frngAA5BKmFqOiBEGme6g=;
        b=lpyVR2yp7bWRFZ9ZjRpt2cMH9xwqae2ATMu2/VoUw4BuH+7JhiWw5tGLDO1qwUIBW5
         +EKykYAeQWV1TmnTQVlFd2GHUDju7cF+rVK2xc2GmxtIif7sU0sBZtDTAz7hR9pdQQMC
         uYBv15Lk3FT8m+OT01m6RyaM19PWK6zy2w51WN6AhDFyomo5E4QLsSA+vu4KuKKriJlw
         G24LOuTx8EAx+do5OWnvTFAP/5ZfmdCYMK9XOaAVTccPnQKTW6A8EOF1bsWt0fPGbxH6
         v6T/iQybTIpRReQmbH+9tFuYu5/WUVy1WK9kA61OITpVxZso/wCDH6HMgvWL2gBylE/L
         1d+g==
X-Gm-Message-State: AOJu0YzYgiyea2jz1CzJV7Od29JEZdzaX8y81evPOdXjN/2m9GLIdZjS
	fct+xHNUNWfamYX8rfr/V/rJWpdAv6HK9vEg4A9pPu//ZYTJf6fFpZyV51WdAH4dk9tXXbc0qNw
	ingHuvwYBtedTs9UPFfH/iB6/UV4APJXN6wQYjj+fUNxctDUd4n/8gqYfIJj3CTGAIw==
X-Gm-Gg: ATEYQzyByP6PX4RH3quxWETdDAUA9eQg8ZHHXWmbTLgWMK+uQG4xypNcTW2XHT+Zddk
	IrC22M0mKrv7cRgVsFMM4qpeIuzBhq2cGdU10FzV8N2DcddWSviRpumb2tMLbLjhKK1lOEPruLE
	ebsSkTdveT3zyDcFRWPvcdEsW4SA7ciQJSz4lJHD9vVk83oqcv0r07ak4PnlffWKfpbW9ecU90D
	RFwx+1nxSgPu5vuVCZPj6e0SRrRYU6MfXVQ4A37maN5aqapLg+oyyBE9RcMczMv1aAMN9pf/Mn1
	1jj0/s9jrXi1lp3eLmiBP9WANUyO3t3GSbxXmzOpX1lXclmsKuWtQ33mZgXke0cccRxP3rI9zYp
	n2GUDBLWsRr3aCKurfX4RxCvxmTFaT6Hpw8IM37rrKgpa8YJs
X-Received: by 2002:a17:902:d4c2:b0:2b0:5a4c:7263 with SMTP id d9443c01a7336-2b05a4c7d2cmr17194295ad.18.1773641905772;
        Sun, 15 Mar 2026 23:18:25 -0700 (PDT)
X-Received: by 2002:a17:902:d4c2:b0:2b0:5a4c:7263 with SMTP id d9443c01a7336-2b05a4c7d2cmr17194065ad.18.1773641905279;
        Sun, 15 Mar 2026 23:18:25 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05b4e6094sm12029265ad.77.2026.03.15.23.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 23:18:24 -0700 (PDT)
Message-ID: <a0b6a477-1229-46c1-8ae8-e970e1127c76@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:48:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: v4l2-ctrls: add encoder maximum bitrate
 control
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-1-e8d95b4e4809@oss.qualcomm.com>
 <8ef7dc7d132143e144dc523ed72c25139fa36a28.camel@ndufresne.ca>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <8ef7dc7d132143e144dc523ed72c25139fa36a28.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a3I8gePtGHzfr-E_jjAqrZyoqA4WPDaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0NiBTYWx0ZWRfX7ITd8hZ2rIdy
 xq1cVEUaTfiuRJTorvBqLH/d2BQgVIO+AWCz+ZHt/V6DBVOKZtsk/8eiapgAOGGV999Vg7U6etU
 qyqyQPa3/vvWRWyhwSZGwxXTTaUeINlxgTKyjOqweTbcA3emq63U5qsafEo97A0xKCtFXSVORvv
 82JwxeM6yT/zQ6OL7Exxa8k39YvkLnwdZ4HP6Pd1BctNl+IecDUpol6WXCqnZh7NCeU8jpwB9p0
 PaIBjdscbftK95rOJ7yH263xwZqlJ/w+rBbnbr8iwNyoVTZ+AeF40m/OeYzZm57vNQOuwcM9C3W
 W0qw6w3ywg7rKqU8CEDK7cqb7Z7NQiMxIqPAn1aSWwP63JIxnjeC4ivtoyHA+lV2GIP2tBYE1qs
 1gW6k60JxDt3esXCFtSWLZo/JMUnhMls6fTG8IedRlI+xPXV2Ky6hOh+SE138M2aWBMCLEpRRJf
 2nQ+DBPQybGKSuMto1A==
X-Proofpoint-ORIG-GUID: a3I8gePtGHzfr-E_jjAqrZyoqA4WPDaD
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7a0b2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=W9TLWy2O60xLta0W1X8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160046
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
	TAGGED_FROM(0.00)[bounces-55843-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C6922950A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/14/2026 12:59 AM, Nicolas Dufresne wrote:
> Le vendredi 13 février 2026 à 11:34 +0530, Sachin Kumar Garg a écrit :
>> Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control for Encoder.
>> Encoder will choose appropriate quantization parameter and do the
>> smart bit allocation to set the frame maximum bitrate level as per
>> the Bitrate value configured.
>>
>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>> ---
>>   Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 1 +
>>   include/uapi/linux/v4l2-controls.h                        | 1 +
>>   3 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index c8890cb5e00a..6b2dfabfc4fd 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -577,6 +577,13 @@ enum v4l2_mpeg_video_bitrate_mode -
>>         - Constant bitrate
>>       * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
>>         - Constant quality
>> +    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_MBR``
>> +      MBR Rate Control is a VBR Rate Control mode optimized for
>> +      surveillance video contents which has high temporal correlation
>> +      due to static camera positions. This Rate Control smartly identifies
>> +      key-frames in the scene, and allocates more bits to them to improve
>> +      the coding efficiency by taking advantage of high temporal
>> +      correlation in surveillance videos.
> 
> This is a bit vague, and it sounds like how you'd describe a proprietary thing.
> Are you sure this is a generic mode that other vendors will support ? If not,
> perhaps it should be visible in the API ?
> 
> Nicolas

Hi Nicolas, sorry for the late reply — we were aligning internally on 
the exact behavior and naming. This is Qualcomm defined Rate control. 
This is mainly useful for very low bitrate / high temporal-correlation 
content (e.g., static camera).
If the consensus is that this is not generic enough across vendors, we 
can instead expose it as a driver-specific control rather than a new 
global V4L2 bitrate mode.

Thanks,
Sachin

> 
>>   
>>   
>>   
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-
>> core/v4l2-ctrls-defs.c
>> index 551426c4cd01..b336171539a7 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -154,6 +154,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>   		"Variable Bitrate",
>>   		"Constant Bitrate",
>>   		"Constant Quality",
>> +		"Maximum Bitrate",
>>   		NULL
>>   	};
>>   	static const char * const mpeg_stream_type[] = {
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-
>> controls.h
>> index 68dd0c4e47b2..614fc2c4c81d 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -412,6 +412,7 @@ enum v4l2_mpeg_video_bitrate_mode {
>>   	V4L2_MPEG_VIDEO_BITRATE_MODE_VBR = 0,
>>   	V4L2_MPEG_VIDEO_BITRATE_MODE_CBR = 1,
>>   	V4L2_MPEG_VIDEO_BITRATE_MODE_CQ  = 2,
>> +	V4L2_MPEG_VIDEO_BITRATE_MODE_MBR = 3,
>>   };
>>   #define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_CODEC_BASE+207)
>>   #define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_CODEC_BASE+208)


