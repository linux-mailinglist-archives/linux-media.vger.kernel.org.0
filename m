Return-Path: <linux-media+bounces-51785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFOaIWt3e2mMEgIAu9opvQ
	(envelope-from <linux-media+bounces-51785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 16:06:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E812DB14A6
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 16:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11DCD301ECF5
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 15:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8316A2737F8;
	Thu, 29 Jan 2026 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="il6dcJyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjtp8iRB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53801285C88
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769699121; cv=none; b=ahcEgjFcwkcH3q/47o6gJafDNcmxG9zDDyW99D7g6tNtlCn7hl+jjvRJRSqesOIq0Th3wRYPvV3X3WWLpQsn1ZGSEAYn928cE4M4bo0ZEJwRfRi1zvtr6SE/qWjI26evwEbCfH6+tCDIIh2N435yf0P9LPC2XTWUVk/kZNh58RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769699121; c=relaxed/simple;
	bh=sUdoQKuITD6AiZJ3dc9S+dNSXPTTT8L0qAJRfFVjOhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvloErS3o6BfBAeNuju3oZzFjkrP9GpKFWQ72SQ2FEkAllLxHUgHw4H+OKrCf5MNLD0vsLJIYsp4/zi4ifdaOKIfGMSwd4McSbpfKHvaKxxoIvVOOVNg9v0jGbnRkivt/K3tuXMRkHWUki+KxTGrYvIrmf2Jccx7U8/h2B1BBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=il6dcJyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjtp8iRB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAmC8d2953934
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 15:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jujTeAzI9H5NsIDYheZqvKmgSMIu72C0nmLn2Vk+rw=; b=il6dcJydU4EmQSit
	nzWPKj9xK9ACJKae6+1pMib8f23w8g4bZByTiQu57bH9AIOeOtjC78MPHP07U8BE
	xLq3xOKmF3o0dRiQvteU71coIQXB9fZ0PR67vty41hyUSpQdsIZz6NR0bjotddo+
	fIHZFXBfAmi1o53/qliHlhuVpbc7QVv9m8yS/WwENcs+sCeHs6FxYJ2YU6PfJLFy
	6va3PZw4qmZPTnVsaZr6q794kDwnrinfso8CGeYkvaRE+Hox63nI1AGSpzfIAZjb
	wDQAchSxZj3ZeS3il1/hjIMLga7vd34Nz/qtHDgRzVYTbxnAq8GODOE7scvWPGtM
	QZZw2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c06420rmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 15:05:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7701b6353so10465845ad.3
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769699119; x=1770303919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jujTeAzI9H5NsIDYheZqvKmgSMIu72C0nmLn2Vk+rw=;
        b=hjtp8iRBPbEY5dm7RWya/D8IfaozKiNWn4D6+wXN+oOqCgOnW+7WEhSAqcoW3fbA7o
         2TZs90kpJaFCtnURPpggzg0Ii7wr60KfRI1pqWlt6aevjweiKOBAnmzWDyREDO6OppWD
         FUuw/4w2wnfbyE6Uar/mrgboG0xFKnlbAH1yBNzrd9CnQNm6oYeFGd8YbAuSmB0ifoh7
         7QbLCT4Gk2Jgq2QcLD/yoTIWRu6vqX7VeHdlWZ3dtizYYr3U3tha8fDMjBYUZxPeW+cY
         TBlLzN/F50mg/v3wqYXzAKDKKnJvGtMemgFAKr6JLw9UK3j0gU50NfgMYweFrSZ8mu1t
         Pwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769699119; x=1770303919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jujTeAzI9H5NsIDYheZqvKmgSMIu72C0nmLn2Vk+rw=;
        b=pNe452xDvYzws6sWYAbJCBGTXUvecIvbahEzQjx9pW2TVgSrEnGnIXOQBFoOuGVMkm
         gEoOzxJFOxhMlGyh4HAhDb7BXrhO6A5dIZqKDrB5rx8FU7+ZwGOpJmi4m9Zu0i6vfsAr
         L10i9UpxalWFe8iUk9U3OFjqJg0Rg44mEPqIElqFgDXYx+Fq9TZmgq57FIMfdNRJrqzC
         0xrGLTplst7baVikWsdYHTAaxXC/Tn5dbzrKM1kOe6w7G564VvEjK36sp1uJXYqgsSIy
         i/KuR25VEis6gG/CJrQpGGPzrsqU/JgB+eeS0/5i5UmxmRBh0Bb/55VW09TwPGz1ap2l
         rENw==
X-Forwarded-Encrypted: i=1; AJvYcCUx2J+d/TtbPiNf5xCHT8Rr85rYL0ZvTefKnN2pdDZ1rqZjJUc+yFd0BCQqy9r4X9vmQ7LBWGWBk/RZxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOkfZT7cmbhKARjmm+MC6J+o84TLKkP+Z6K/6lk3tH4x8XB5Zz
	MGfUejCGNhjP9BAh1CTyBTjmhru35iWH1kGBCJ7Z+Nyu07j5Lg2bN7uOGU3uuHjK9xe31m5TAmd
	P2Ql/qEh8sXkgWPBN80/Ow3d/xvBJ07yDYf1Ke1dxCGK4/dt2MKTaBKhD4Q5BIVPqgw==
X-Gm-Gg: AZuq6aIwRmRSf2bMdVniS3zZC/fzdO2ugKoADd02oV2NB0CroRD0sXoJNHIhF6h3iDV
	GBxA6guItsioUmxIPMPJrSZRHLWpRmusE+Ht8HSSIAwZj5yeN3SPsG8O2wACFEQOO3/miGsh56o
	TOr2ZFtXm99K3Ql6CgJ17h3NT+UqpZx627DVo1JwE61/v0CdJc80BdERkyxAqsJm6YFNI8QN0Q+
	Jakj2gWKTG6ybOZ4cbkKvqEEpjuCheGA4nDvSPJ8a6q6Guck+1F8ntLrPi1vfjnFxWOrM4YSxvX
	xAOb1zW/w/SxcPs4CVl1rZZCMq4UrnOD2jceg+DM+Q8wnp48WqxD9oV2GJzKRxeOlbsrjADoe3W
	MXqkKQEu1BFXwYiCgCOAq+NAFJ1+am3jsKiDddY2sSw==
X-Received: by 2002:a17:902:f54b:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a870e74030mr87760295ad.46.1769699118620;
        Thu, 29 Jan 2026 07:05:18 -0800 (PST)
X-Received: by 2002:a17:902:f54b:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a870e74030mr87759815ad.46.1769699117875;
        Thu, 29 Jan 2026 07:05:17 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8c3a23e40sm21406195ad.90.2026.01.29.07.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 07:05:17 -0800 (PST)
Message-ID: <025b5070-676c-4284-9c30-1fd195d8a549@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 20:35:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <22583dde-caaa-4d64-bcb6-ac7f09916a8d@oss.qualcomm.com>
 <xyhl36bcpmjhav73ujlvbtwqixngr5vko75t335mlcebxrs7lc@t43mxhknuqtj>
 <5df59084-d19b-414e-a43d-8c5d26cb07e9@oss.qualcomm.com>
 <i37aqxqtb4dovx3lpjm3xmkbcwlpiyfe7blzz4kirme7tegbb5@hgztyetld6lf>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <i37aqxqtb4dovx3lpjm3xmkbcwlpiyfe7blzz4kirme7tegbb5@hgztyetld6lf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwNCBTYWx0ZWRfX33E/Dvbh9h1U
 D+EOMdAHb1CKyZ4C6tpAKkmhxSnRsc1I1CHB5SWTrBmM+YVBiAu4fvuwazfqi6x9AaBtPvmk1/v
 nijLKsOczAponABF+EUKNOfZeBr5HjRjdRvwfSDPwNcz6ViJKUWtLrwHqh/+J2UDWRyweszGW6f
 VBtKFg1gd3WOYUlQLk7H5MCRTvCZnw4rpubD5plEX2xCe4E0nTNWYMH5eA0lUwq9lA3EdPMSADQ
 BnE3wwVHhTTuv/eYtoZP5fZceda1AN8QxnzfZjnFBF6RxAwvu7XUBNrPuLYPbRNuCkN/zYOLi40
 uih7rJcQNm8YBC79LL+U+xRE+bTzfRMbUlUN4WAGj5b6hJVJw3MmESwLOzGpqDt0TuvY7AsgsQb
 EBKKiaE31NSKXXKf0jmsKQwoR3DhHj6ThXtz5uQS2x3ru6Tcw1hn35yOwyGqgEHHb6xhiL7uxDJ
 Q+ic0EBmoLAFvAkl79g==
X-Proofpoint-GUID: NvJi5fWgQXkmyS9K26Jwb4y9H-OuhqGU
X-Proofpoint-ORIG-GUID: NvJi5fWgQXkmyS9K26Jwb4y9H-OuhqGU
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697b772f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=pM9kW0q8fP39S2ihOX0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-51785-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,bootlin.com:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E812DB14A6
X-Rspamd-Action: no action


On 1/29/2026 8:02 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 29, 2026 at 03:32:28PM +0530, Vikash Garodia wrote:
>>
>> On 1/29/2026 5:51 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 28, 2026 at 06:35:01PM +0530, Vikash Garodia wrote:
>>>>
>>>> On 1/27/2026 5:52 PM, Dmitry Baryshkov wrote:
>>>>> As the Venus and Iris drivers are close to the "feature parity" for the
>>>>> common platforms (SC7280, SM8250), in order to get more attention to
>>>>> squashing bugs from the Iris driver, flip the switch and default to the
>>>>> Iris driver if both are enabled. The Iris driver has several
>>>>> regressions, but hopefully they can be fixed through the development
>>>>> cycle by the respective team. Also it is better to fail the test than
>>>>> crash the device (which Venus driver does a lot).
>>>>>
>>>>> Note: then intention is to land this in 6.21, which might let us to
>>>>> drop those platforms from the Venus driver in 6.22+.
>>>>>
>>>>> Testing methodology: fluster test-suite, single-threaded mode, SM8250
>>>>> device (RB5).
>>>>
>>>> Could you run fluster on SC7280 as well ? Also please share the v4l2
>>>> compliance results.
>>>
>>> Okay, the SC7280 is a bit more interesting. For H.264 and VP9 the
>>> results are the same. For H.265 Iris errors out for all tests except for
>>> the one, WPP_E_ericsson_MAIN_2.
>>>
>>> The kernel prints the following message:
>>>
>>> [   82.573112] qcom-iris aa00000.video-codec: session error for command: d0000000, event id:1009, session id:52ef2000
>>>
>>
>> 0x1009 corresponds to HFI_ERR_SESSION_INSUFFICIENT_RESOURCES
>>
>> Below patch would enable firmware logs and make it print in kernel logs, you
>> can apply and share to know more about insufficient resource error.
> 
> Added it. BTW: would it make sense to land it in some way (I saw that
> earlier you posted the same one for gen2). Would it make sense to land
> it in some way upstram?

yes, for sure. It was pending, before we enable, to check firmware do 
not emit any default message which are type "err | warn" and those gets 
emitted in kernel logs everytime, even in success cases.

> 
> Anyway:
> 
> $ gst-launch-1.0 --no-fault filesrc location=/home/debian/fluster/fluster/../resources/JCT-VC-HEVC_V1/AMP_A_Samsung_7/AMP_A_Samsung_7.bin ! parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink -m
> Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> Got message #19 from element "videocodectestsink0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #20 from element "capsfilter1" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #21 from element "videoconvert0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #22 from element "capsfilter0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #23 from element "v4l2h265dec0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #24 from element "typefind" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #25 from element "parsebin0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #26 from element "filesrc0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #27 from element "pipeline0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)paused;
> Got message #29 from element "capsfilter1" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
> Got message #30 from element "videoconvert0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
> Got message #31 from element "capsfilter0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
> Got message #32 from element "v4l2h265dec0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
> Got message #35 from pad "typefind:sink" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)create, owner=(GstElement)"\(GstTypeFindElement\)\ typefind", object=(GstTask)"\(GstTask\)\ typefind:sink";
> Got message #36 from element "typefind" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
> Got message #37 from element "parsebin0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
> Got message #38 from element "filesrc0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
> Got message #39 from pad "typefind:sink" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)enter, owner=(GstElement)"\(GstTypeFindElement\)\ typefind", object=(GstTask)"\(GstTask\)\ typefind:sink";
> Got message #51 from element "h265parse0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
> Got message #67 from pad "h265parse0:sink" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)create, owner=(GstElement)"\(GstH265Parse\)\ h265parse0", object=(GstTask)"\(GstTask\)\ task1";
> Got message #68 from element "h265parse0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
> Got message #69 from pad "h265parse0:sink" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)enter, owner=(GstElement)"\(GstH265Parse\)\ h265parse0", object=(GstTask)"\(GstTask\)\ h265parse0:sink";
> Got message #74 from element "parsebin0" (stream-collection): GstMessageStreamCollection, collection=(GstStreamCollection)"\(GstStreamCollection\)\ unparented";
> Got message #70 from element "pipeline0" (stream-start): GstMessageStreamStart, group-id=(uint)2;
> Got message #83 from pad "v4l2h265dec0:src" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)create, owner=(GstElement)"\(v4l2h265dec\)\ v4l2h265dec0", object=(GstTask)"\(GstTask\)\ task2";
> ERROR: from element /GstPipeline:pipeline0/GstParseBin:parsebin0/GstH265Parse:h265parse0: Internal data stream error.
> Additional debug info:
> ../libs/gst/base/gstbaseparse.c(3703): gst_base_parse_loop (): /GstPipeline:pipeline0/GstParseBin:parsebin0/GstH265Parse:h265parse0:
> streaming stopped, reason error (-5)
> ERROR: pipeline doesn't want to preroll.
> Got message #85 from pad "v4l2h265dec0:src" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)enter, owner=(GstElement)"\(v4l2h265dec\)\ v4l2h265dec0", object=(GstTask)"\(GstTask\)\ v4l2h265dec0:src";
> Setting pipeline to NULL ...
> ERROR: from element /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0: Could not read from resource.
> Additional debug info:
> ../sys/v4l2/gstv4l2object.c(6253): gst_v4l2_object_poll (): /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0:
> poll error 1: Success (0)
> ERROR: pipeline doesn't want to preroll.
> Freeing pipeline ...
> 
> 
<snip>

> [   68.592482] qcom-iris aa00000.video-codec:
> [   68.592482] <VFW_M:HostDr:265d:6eea4000:00000000> Set buffer type 0x7 addr 0xd0000000 num 1 size 135967744
> [   68.605612] qcom-iris aa00000.video-codec:
> [   68.605612] <VFW_H:HostDr:265d:6eea4000:00000000> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1, Driver macro size = 135967744 vs FW HFI macro size = 136623360 vs FW golden buffer size = 13640960
> [   68.616954] qcom-iris aa00000.video-codec:
> [   68.616954] <VFW_E:HostDr:265d:6eea4000:00000000> vDec_SetBuffers(2017): Dec_SetBuffers, Insufficient 7 buffer

One of the internal buffer size (135967744 bytes) fails to meet the size 
desired by firmware (136623360 bytes) to decode this specific test 
vector, hence resource insufficient.

We need to compare if iris is calculating any les size for scratch_1.

scratch_1 venus - 
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c#L647

scratch_1 iris - 
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/media/platform/qcom/iris/iris_vpu_buffer.c#L552

> [   68.628259] qcom-iris aa00000.video-codec:
> [   68.628259] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_LOAD_RESOURCES
> [   68.640602] qcom-iris aa00000.video-codec:
> [   68.640602] <VFW_L:HostDr:265d:6eea4000:00000000> Output2 Dimensions 1:1 : NO_SCALING
> [   68.653195] qcom-iris aa00000.video-codec:
> [   68.653195] <VFW_E:HostDr:265d:6eea4000:00000000> vDec_LoadResources(1392): Load Resources Command received without complete buffer set 16/14
> [   68.665510] qcom-iris aa00000.video-codec:
> [   68.665510] <VFW_L:HostDr:265d:6eea4000:00000000> Load Resource with core id: 0
> [   68.678699] qcom-iris aa00000.video-codec:
> [   68.678699] <VFW_M:HostDr:265d:6eea4000:00000000> cabac_direct_mode = 0
> [   68.692300] qcom-iris aa00000.video-codec:
> [   68.692300] <VFW_E:HostDr:265d:6eea4000:00000000> vDec_AttachInternalBuffers(1760): mem->vsp_buf: pty->size_vsp:461056,total_size:0
> [   68.704271] qcom-iris aa00000.video-codec:
> [   68.704271] <VFW_E:HostDr:265d:6eea4000:00000000> vDec_LoadResources(1486): Load Resources failed with error code: 4105 due to internal buffer attachment
> [   68.722196] qcom-iris aa00000.video-codec:

...
> [   68.892229] qcom-iris aa00000.video-codec: session error for command: d0000000, event id:1009, session id:6eea4000

Regards,
Vikash


