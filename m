Return-Path: <linux-media+bounces-63016-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKuGFB5NGWrzuQgAu9opvQ
	(envelope-from <linux-media+bounces-63016-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:23:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE655FF1E6
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FFB13014748
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BC034F259;
	Fri, 29 May 2026 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azKCRi9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIiDKue6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF133F5B0
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042876; cv=none; b=tM4+oRc4gdK8b70jpQO3o8f/MKQILWHnvzZLwB0jNJPRIQ78mTgOyladAmTolQu2t1btR+iAfDRDtSQ0BUSDZLjfeqX2oB9mJiJbMKzDDuL60dJyAsKDq4xP0OzA+LH3ndnqB9blFD2bmYvUr+S2qO1u432rggI45jONaGOk4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042876; c=relaxed/simple;
	bh=4tWHmUV/Et2rVGzL6+V1EcfXfRGK1FHN/TBRFW6MQBw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=heO22nLw8rrd2ZHJWIpDW6QsW6ZhLSfys2/SLdpg0EpOOmwuGFJj9Vyqtq/kIcUsTjQ9WcwnNpkOOZuP/YWDqcL4TXeIf72w9ARp1TEXjeticCZp3QFoLviEkCbqTfGXNriiSFcM38OkRyZOYdoNNNKTxCNcidQM4Uuxxa/0Gd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azKCRi9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIiDKue6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7cC5F1495141
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zt4hnhOe3SqfyqniTKscAkfNvEQoOj0aZNG5SeU89HM=; b=azKCRi9QlFO4qBvu
	tzEgH2IUjdxV1l1nGyWfbZgbnNp7MA26Trs3h8iJwy2r53DWGgPoqoyGWuVb2v8d
	MtNs8zD/9lsG/YlbuTbdtpElsL/d/aVDqEW6/a5zvEkbiGLiAcVJPxRoESD4X1M6
	3hspQvvAipQF2YadZnIQ9pqFTLmrgQpg4ydrjfZQdd+aDSYUwT9EIOWM2d8orTxD
	h3i/PWP1ILP08RhwMhTCA3TCOQzTUUJEluSHy4gFfzN97oetpss+5bAVeuv5OkjJ
	Ar/FmBcDWBjTdoC1Ifg8hA/q5IcwVg+j51p7I7d58DkRXPQ+gTk9IcB/D2yZa7dd
	katkCg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef0159md1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:21:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beff6b6e74so24840215ad.1
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780042873; x=1780647673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zt4hnhOe3SqfyqniTKscAkfNvEQoOj0aZNG5SeU89HM=;
        b=IIiDKue6TAKyArmgp1fudCLZWMSxc1GKTxq9d/tXr0n5t3fVuiZt8aMM7MRufQJ/oh
         MNOtzbniAZbNAPi5GwPlaOv6mTKnL/h7kmdiZZlEcs1VJiI1tniyxWE5BFA7/3rd6SjQ
         t5EYhXxYcTOLQXcGF9HlfQf1p8cKHK8ThOnfBpD+10Wi0CEOeLtj04M5PTHd3j2D0b0X
         vK3/MITYde/gXgUNc8tbUWVoFObQ/tMBnsmYyeMfg76GkwImZj96m/bwkAioNeotD7qU
         BTiPdEIbvgxiC3U/euFf153YR/AYCyZI83iKQfY8BV+3ZYfEcBgJDTIzd866XK+Bk4M+
         ADqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042873; x=1780647673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zt4hnhOe3SqfyqniTKscAkfNvEQoOj0aZNG5SeU89HM=;
        b=bru2SxdGXIbTp0U+iGWDz66+Hh6hMlt6ERb8q/cbI56ANb9E9i9QYIvX04QCqdPl2C
         IwCB64RfzPolxZFv1AMTq5WarCKfdxgxftFmOl5NWqglbsyt3FuXTG/jA3NJtBoojWXo
         js/nbk0hs2mDXFqdhl5xmpA6I+veRr6OM3374DGDGvMgxCWSQO3KugbjycpaLA1y6qUF
         Z4S5pIbtEn2hnqQxhfxDQdrL6W2Dv68OEXO7JVP3MYzPGeIdWrtnYZe9h/5Ty0QZAwaw
         Wu55Ayeh3LCJAJPk+jzG7xKxfD+A1/HlcwKmkHRsf1lWWQiogsoh6H1hRZ46nS/r1qYQ
         OkLg==
X-Forwarded-Encrypted: i=1; AFNElJ/+0Edi1INycebdFLjDh3BoodtYkmFU9BoSywTXkWXxbj643sBQ1aadPsFHK4AEkio56YB8EUQl64CHxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSc+AoxgfY3RZlC08xfFA8pDx9jeUXcjnW77D99veMMVAbHn4u
	Ml9oFzmr84aqX61ozDtJiNSgkxDdYN4f//o3PeCaHrjhSPkv9Dy6HsDvRkvM5eVBqUSctpe/GaO
	hSTHBKMVZp8v1vEVOXqZv9oio/99YimfmEuQhhYSXRw9eYw2NDizioqbaRvwpdX4/vQ==
X-Gm-Gg: Acq92OFsc0p4T2Va2l3CyRVZdPqeFVBrNOvbDp65la6+d3dLvHmz301gxce4NpnvEBM
	Hg0ZTNkgPbOAYAh2mOXQckwR+fhqvJLNQpbmeqVwz2fXFcDyArbbfvX+cwAuBfrfI5vH11wC7xo
	ufBggPRxCkJWJVacRMy12Col8T9BGy5gwzz86L+rjozaS+b2UFpecKeU9nuZKmZVFI0TQEYmsLh
	/od0CnbNZI+vAjvbDJvOGYvLPQ0xg9DoVbqaSPVufzaQC+ihaIxKNnGdNjrVWD5W3Jctg3e3DSC
	xXyVs3PsaAeEO6EL/oDCRbFnLvik13jpe4ju5kzCmYmG861uBJ5x9VuseY7DSLqofPseXONbU6f
	EXS1d+KWQhYJbQTngICf10Bnsko2rBkVjIcHcxHsyKDhE3IDWTlu/aeZKia9GQZsztrfpCheAA6
	echWVDDT4ssc8h3J4YsJW6sNTlHNw=
X-Received: by 2002:a17:903:185:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bf204f428fmr25204505ad.2.1780042873301;
        Fri, 29 May 2026 01:21:13 -0700 (PDT)
X-Received: by 2002:a17:903:185:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bf204f428fmr25204215ad.2.1780042872790;
        Fri, 29 May 2026 01:21:12 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b018b6sm11287155ad.43.2026.05.29.01.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:21:12 -0700 (PDT)
Message-ID: <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:21:07 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
 <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bln72q64sAroiK96YaNLtR7KDiBzseRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA4MSBTYWx0ZWRfXx3wBxIm5eqqL
 qmSQJYo6YCuZPxv/0Xg+/fUxmrRIR/tTIxJJSKfp9lf+/0gFARZm5h14P9Kqp+0nx8WAB4zBpYo
 exkP/7MDnldr701FiFqknDTMNAqJW14BFz0hayvNeFPC9LYOvJUvReH+U5PemtziakcMsKRnteJ
 fEc98ZxBzzH0Xcx0shQ3NklOltnZUcJEWi47sS0WWZ48FjLgIfKOVpkSGJXivg6TaAg5E9+cJ6g
 JtEk63Iu9/GOwJl+openkerP3HC8zTsUFGf+XVkPUrROxXt0aA/jnRH8cXiZc/VvCRYE0dfZgx9
 mWsEhu700eegCjGw631BhZNN1nmcBML1ky4mYmL1rzg2JrnWyGqlx1fT1tvOE823cXp1aUZ3JoF
 GLwphZJBtrciZPsHHemo1hYr/Eq+1hdvUYNvv6WGjPNaqjASbKRZCxl2sdY6inzHVigj5X+RgQM
 SkzF3cFIElULUJIz5oA==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a194c7a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=-wTkLGI0D05PckrZPBMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: bln72q64sAroiK96YaNLtR7KDiBzseRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-63016-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BBE655FF1E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/28 21:26, Neil Armstrong wrote:
> Hi Wangao,
> 
> On 5/27/26 06:15, Wangao Wang wrote:
>> I tested the v4 patch using the gst command you provided earlier. The 
>> decoded output still has the previous plane misalignment issue, but 
>> all frames are decoded successfully. When viewing the raw data with an 
>> image player at 1920x1080 resolution, the first frame looks correct 
>> but subsequent frames appear shifted. If viewed at 1920x1088 
>> resolution, there are artifacts at the bottom of each frame. I've 
>> attached the images.
>>
>> Also, have you tested the 720p case? I can't get it to run on my end.
> 
> Thanks for the report but I don't have access to the Purwa platform you 
> use,
> I've run test with multiple resolutions with display using P010
> and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.
> 
> I'll test it on the Hamoa T14S I have which should be the closest to purwa,
> but it uses the same driver setup as SM8550 so I expected it to work the 
> same.
> 
> Could you indicate which iris firmware you're using ?
> 
> Could you try passing the fluster h265 main10 test suite with gstreamer ?
> 
> fluster download -c h.265
> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
> 
> The picture you send looks like there's a mismatch with the kernel
> and firmware setup of planes offsets.
> Could you check if there's a Purwa specific firmware property
> to set for 10bit decoding ?
> 
> Neil
> 
>>

Hi Neil,

I also tested on hamoa, and it has the same issue as purwa. The firmware 
used on purwa is vpu30_p1_s7.mbn.

This is the result of fluster:
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_MAIN10_B_Toshiba_3 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN10_2 
       ... Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN_2 
       ... Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN_2 
       ... Success



-- 
Best Regards,
Wangao


