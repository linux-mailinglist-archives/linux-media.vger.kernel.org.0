Return-Path: <linux-media+bounces-56649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCPtBNyhwGmLJQQAu9opvQ
	(envelope-from <linux-media+bounces-56649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 03:13:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 697442EBE12
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 03:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E8F2300DF6E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 02:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954041D9663;
	Mon, 23 Mar 2026 02:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDr+e/fP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPEQbhU7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FFB2192FA
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774232015; cv=none; b=d5tMZIqcfaleZsZO4hbKBNkYWYdjylKCxIyzvMqNM/gttAsZVfKK65QJJJMWA7ffU+drEU4CdH+4B2ffBadTjQjKSVMKdBAGAtOPHeX4Frk64BoCbLVRJgJhVP+QyMyiXOZH23m9Wepdipg290fU4tvJHd6Uo9bNqnebUmV7xVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774232015; c=relaxed/simple;
	bh=HI3XPJq6xRg6az0WgltEmIbm0qHjoruEglQ6XI1Kwes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtVkAf4GoaswvtTzeJw3rLXq9Amq/gYyWK7IIBuB0B0MGEah+v2ovG/M1bJTz+NU05RpqKzTPT2z9kO+FYHa+rKADM+o2sojxle2WZU8CrLO6E9Mp1Y9SvByy27JIOel3Tj3eQaBSB4BOdPFbAYPLd2LC018lljChoq+nmEr0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDr+e/fP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPEQbhU7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MJGjtw4091856
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AxFWUvPSX2mwwlFn45yatk4d7Jv3c+D4EWYrVWqqXXU=; b=BDr+e/fPZqCBLHjg
	nva3ZLF5wN55/cseNHv4Se9rBxtxZokLPp3jTRTm8Qf0aqGigiNT1MyY1UOo9kd5
	6Y/XeILYodL1PRqJRuC82uwnuhILlSD9h9HEn8CpV/9YkUCvhjnVAKr1xUbngAzN
	nx5Wd0sAqhOqiSg3YZRHcLi8+mTbYsZwDZXBIMJ3cJbLjWUwoSJflUdiy0r6+ji9
	TI6P+In8t39ORQeb3kFIDyJRBF/iJGcCCU+QssoUj/kEByGkCNqmOoKFYRJQLbpr
	PUkE+s8M5Xo+SVxxjyUNcCgppmVs7Iy78LrBopi5YEJXDvN0VD37pSIV/gGuTMWc
	mB1rzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e3h0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:13:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfc61fc9b8so1759203085a.1
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 19:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774232012; x=1774836812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxFWUvPSX2mwwlFn45yatk4d7Jv3c+D4EWYrVWqqXXU=;
        b=IPEQbhU78vuGNEojbpZ4X8ulFY98vYxPq2DhWlI8a2/KcAi5fdtyqk6f/jkYp9p4j6
         jKf5g4s1C0oWNZOKl641eAuGG7agoX/SFhU3trS6gHP8tXqzh/qs9S9fRfEjAqk8R7gl
         8oA2/g8SWcvUjk4dRmpJllh6EEgp2UjJMCY7qhkwwpaHcRMahlYeLN0xwvbEgoU1Wlzd
         JCsO4q7IikZeJEaUiTdKcV4KO+zYTKR7OyHDDAZhHaNWYybpMfq42615Iv6bsavR1raG
         0Opr3Yt3/Htbqz68khBTM/GI6z4u/EzN6LUUshLDDhHjKM42W2qtUA4kcQLyHV6oEJmK
         3cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774232012; x=1774836812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxFWUvPSX2mwwlFn45yatk4d7Jv3c+D4EWYrVWqqXXU=;
        b=sjJ//KnSJDAyUhXrLmxxTenQHnk3EpUFrOKTW0SAfgVFhJVE9mlvLnVs+bwZs7hCjf
         4iCq2sdIdBt9AgaQ68PkPAYCg2qUvDtcAAGPJfRglkG2D540cGDVkA3HAX8ZNNLXG1Fe
         kn9LEITTleFTl4s+OmxEuKBhtgNSugfo2ruWC6MbDt6T9f1P2IFxMoRyso882GS5GF2s
         HG4aadRhh4q9ZpBJTB8PUC0qaIWEvoy/Bwq0D2reZvFv3Yn/HoMMAmSLSsr1YxFSXtR+
         0mrLbeHO/g+HkLzXKSFQA3Tzw84OXDRxvio4paCvF7HU9La9F54poATzRM/HngnJnqRJ
         Uw7g==
X-Forwarded-Encrypted: i=1; AJvYcCVxtBTNnnVaMn9l3SGGenv6iHdH0ZQWiT6KttbYtHp4F5r5Jf6lDhgqAodU40LHtqXkEBii7iHGfrr5Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1r7IQBhqq0x1dzf3lmrsZdNUBQV1F3NUw0MzWjnkgPwsRJ6O
	GeklvmtD8PKrC9grYMboez0kskz6PFNtbDkungwYrh7QbxoJHIX0bJ10y6J9d3xFV3QzKnvsuSy
	5HT/66U0e70K+pV9mEKRqoint8z6gGPeCQMQ86blckN/qFtNebgrXJFcrgrBB46R7FQ==
X-Gm-Gg: ATEYQzwiOjRWfFc2PlHW6XSib7SlThGWoSB0OkDE7cS6r3Q41uKlVXdbz07UZiRyyCj
	P7FIgINNFDqiEuV/VEWIgBKbJklJasWLtddy56x4huJXXtw1Q+tdBw/o3iDIgzbdGQJLD+G5Bj9
	jRRBKiy4mMFAVSGpk0rfkwYerZXyfHJjxV1sxOGXogbQLX67IDgBt1kqyULCMb+Tr2nXO8AMmYp
	b8Lx5u48OltK8wsGRgzusEA9HseyCH+mmGAvUlXgS63d4ao5H4nECaukKcg1DoqXdpxNfw2ouck
	ViGrtTt4pzNetEPmSZsVZhzmEkHQmqR7zdDBg53sH3X+0mvDUylni6o8sStJciSTMlO5G2rk/pr
	M+W6PfLheeLztDvYS2WTKKU1LiNbqVYRMYuXR4MWG9NwHYFrUpp+aYcwgA+vzIE4bVip4RC4u7A
	==
X-Received: by 2002:a05:620a:40d2:b0:8cf:eafc:b7c with SMTP id af79cd13be357-8cfeafc0be0mr150753385a.41.1774232012225;
        Sun, 22 Mar 2026 19:13:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:8cf:eafc:b7c with SMTP id af79cd13be357-8cfeafc0be0mr150749585a.41.1774232011705;
        Sun, 22 Mar 2026 19:13:31 -0700 (PDT)
Received: from [10.111.160.211] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm771993485a.19.2026.03.22.19.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 19:13:31 -0700 (PDT)
Message-ID: <02ecbd98-01dc-4e56-901b-41783c55d095@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:13:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE
 lite
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
 <CAFEp6-2XrMkKzA4KAEkYF0v7XzVefFpUEG98VYa7wNuanbZ-Xw@mail.gmail.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2XrMkKzA4KAEkYF0v7XzVefFpUEG98VYa7wNuanbZ-Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wIhBQRPq8gyBibk2gMva6zrDVnPy7cD5
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0a1cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ecNFY0pxKnQf4PiGJQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAxNSBTYWx0ZWRfXweZN88Ho3T38
 jKFy1a+DeiikkpL64QweqUNYixv4PP++C2CjmvBosWbCBx+Z8WwC7gmmWy7Qg0kYb7Z85PLhbE9
 OUuFFmQ3vBMcMo0gMtBvB19uAIxrHokrePgwNItXSkYM0DRYZt/RzpFY5MK4KtRc4LNmcUd3xHJ
 7KpXArcSrKhi1Mv+DQ/tkYI4p2G2CGBIhSq+cGebx/BnKbrwFv6MfI1EF9vQOIcveBBjDFbN3EJ
 jM3aDeZqVaSzGZVaFIdpdikT8iBKwF/lRU07xMvMs87Z+GGMSXyiCo5nnPSWNb2TGXvLKk5vdZO
 8Bcu0gRsx7+PZDKwWIL8hLBtQ+cXcnoRPGi3sl6yKbFRAjV3oHkhJvCu2XtcnxdLRb+J/ZoaP7L
 F9IvjGxPhcpyuEY7qLb6Dl6ncg3vySZe40pD7CELv5e4cI1JRplJ64PQjpChRkYlw2r8fDRv1HX
 slC5SJPzTiuwNRXAhTw==
X-Proofpoint-GUID: wIhBQRPq8gyBibk2gMva6zrDVnPy7cD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230015
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56649-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 697442EBE12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 10:44 PM, Loic Poulain wrote:
> On Thu, Mar 19, 2026 at 10:11 AM Wenmeng Liu
> <wenmeng.liu@oss.qualcomm.com> wrote:
>>
>> VFE lite hardware does not provide a functional PIX path, but after
>> the per sub-device type resource changes the PIX subdev name is still
>> assigned unconditionally.
>>
>> Only assign the PIX subdev name on non-lite VFE variants to avoid
>> exposing a misleading device name.
>>
>> Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type resources")
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f916736f1d1664767bdb6a36 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>>                  v4l2_subdev_init(sd, &vfe_v4l2_ops);
>>                  sd->internal_ops = &vfe_v4l2_internal_ops;
>>                  sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> -               if (i == VFE_LINE_PIX)
>> +               if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
>>                          snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d_%s",
>>                                   MSM_VFE_NAME, vfe->id, "pix");
> 
> So the PIX path will be called RDI? Doesn’t that seem misleading as well?
when i == VFE_LINE_PIX and vfe->res->is_lite == false then vfe name is 
pix, not rdi.

thanks,
Wenmeng

