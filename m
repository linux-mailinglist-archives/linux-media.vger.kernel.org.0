Return-Path: <linux-media+bounces-57636-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCMEMvOJymmA9wUAu9opvQ
	(envelope-from <linux-media+bounces-57636-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:34:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B03135CF11
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 961C0305758A
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F47D3DA5C8;
	Mon, 30 Mar 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5EMU2Zz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbNa491k"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543DC3D9DD4
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880844; cv=none; b=C9HdUvHgKJ5Siv+TpoJUCRD+pLvQsjJIIwqGngYbQ2VjaNiMelkK8js9BWwNWppuf6JWZBbIQCGzPuX3s1Kr/RJzkpYjLkYhYXrI4HDIEK6CQDhAHnQlGvLBUi3KxNQ6GtRNGprWU6VwmB2AAmv8+J7HRYmr3YTGA+lY4+uQ8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880844; c=relaxed/simple;
	bh=9Y+yFJJexfP19jMN/Su+gP3NHoI3tkPOa2xag5BKfL4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QhEBE7+GJr/iNKfdOX29wxvlumKRmMCWf5Qm5R5JZ16h1venZpux3h4GRgw0+X1hgL++rpLvr/XInjedCwkUEcmH+mjz0EXCVZaByFTD+GH63Fl7Rq4gBORogkUAvosmB4ohCVP6iUGTXU83TNNPoYAUc5RUL/KN+zIaLmH3BAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5EMU2Zz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbNa491k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCcVFg3195173
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=; b=m5EMU2Zz+XeFpE7d
	P/6trP/hHs2jGhkVuRJ8Q7vW/NjI/1+0WA51UxXI7uRIyqmSK/8YYkL9N/SDVOMF
	EEuT7b9CK6yneZ0+ezCAYQW25rKxyU0h1RsTiPfYQuvcZZmS4Hyl6l7oRmyheimf
	JoOxRs+rDPB4JSWKqOOQLVdr5eDHm5mntk7hqsQEP4sfKzYA4FwJMrGM6aHgeqNm
	yT+0LmTFCw81Ji0P8IhX5WCW1orILnrupyB6WUsXyn11OHrVbvjo+5+zNF50It7M
	HtG8G5tGmJWhUXAA5QlWFyPvRFLLqM4527Tbe2YGX6kz8gtFkNVqZODq8Ogm8qhU
	XPhOSQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sbwgdg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:27:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60521f54387so496375137.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774880841; x=1775485641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=;
        b=gbNa491kubeR2Jab1UnQvcKmrlm8JbXGVLjDqxHZZygMiJjicEi3+5mQBm5Y8FpRo7
         c7lykjB5e5nTE0kRn4BQLf7cW7Xe3k4Fd2vJHgtlihVBnoAlTPHPzGCoxAymF2otyIOc
         joB5QmMlJtsn8w0HYNl3gW8sj/7j5GfHzTKVip9LhT7BfV0yzYa1wNEG+G7vhaPMBJyD
         YAz0SBTngu2Wj47yyP03t+R7QkFsripZvxo1wDL2CqojySgNkXZa2vxJG8b1bHvhDe5O
         frkGK+Hw80J4CL4gs1S5UKcREL6tqHKWJ7WZq4mcNDS0lX5bDMSv20+BvUlPwhnixRjB
         Pk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880841; x=1775485641;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=;
        b=g2M8WFWwMpbfa5aN7fFekxKVRx6vTDb0VemCtfE0RPrGjNEbYN8hAuLLQk9nbjvEVx
         X9HDofosRLc8u5nGEMuk5DaMV3mLVJcQohhDIovebWV6qPfSuJKLneYc3mGnsVZ/BZiW
         0BdMTuIypYXV/j9+36zuHMUcgi3bhnsdiM9qRfbCRkCbW17OOkuFrcyIcW65mdT+NKf9
         rwxjqosnB2iAmazBqRJRCppscI7YtJxPymD8sndoKjY+1jqprVNE+fL30As2AfrVw56O
         RM0nMKvU9HR3+YRoiOUTOdTe007T5F/LfXxvHyDm9lxNkL4WJoLduI6eHfyVLXBORMf2
         Y43w==
X-Forwarded-Encrypted: i=1; AJvYcCWpvPRh28odvjXYPSK5mK+6vWKh2TyOWwdkju7dTDLA87O5Y/fSeO2wU940GYdthk0QkZK7b+q2ZEutjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Sv3zlgmKkG1UYQe2M9c9c1eVBd+FRLZU4tqfrBPneKZxr7Of
	O/MpKh3idDpbT5IYhcSNdePXSJJrWWKmHLCbHXhPaL35KgcVHGEmROqnU1yTEBu0voESIeHuKMT
	gYWQGkBwgTWRERzWcN/k2RZOgJ0BSHW2jYCnf/k2Oy212EJQ4+PIcCFa0+gfwGOukgQ==
X-Gm-Gg: ATEYQzwp5fQJNPh0AajkvS0Fw00TmS+IxugiQl4Nl3i1eh6ieXP5ZxoT+fSXIOZU7WQ
	SP4yhM9msWymcrrBeVOO3vS14FcqdO5nfHJExgZ3gOZrBpwCn9xvSuV+HNtmXGB7pIHJs0M8HD4
	dY+dfS5yRTu0nuCJc06Ts29l5v6nT/l9qbrbm5D/qg4fjpghANVQqXKK4+DsW3g2Tcpk28+G3RU
	/2xqM18+x4YpLws/OyF0T0K4vpQgj2sJ95vp2t7kGwnL0tLgIQNoWkg+tvejG/a3EnYATSCbgrN
	8JuVm5pc0jjKx0nakG/YGM/oXirCe8G1URfqnJQ6180mwuxjBguCkBGL0EQviiwNd6V3Xz3xTqL
	+fO3QlbN/hkPhLtPVvtq0ckvl7+4Foo1wIkp3lMAe0GNy8dAf7Sj1oxGuKkYpuKI89IDueLFEXZ
	48cnrQnasmgneXnSh66ngaNfPLO1TA92Z//CgDyRCJte4B2sVVzDhibhX4qgWmIChxAVqOMVHv2
	QX87O28FWuOkYQf
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-604f930a02dmr4165003137.32.1774880841475;
        Mon, 30 Mar 2026 07:27:21 -0700 (PDT)
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-604f930a02dmr4164980137.32.1774880840968;
        Mon, 30 Mar 2026 07:27:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7275ff3esm2667651a12.3.2026.03.30.07.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:27:19 -0700 (PDT)
Message-ID: <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b_t_GWznjZG2KJinyTQdIgiev6uxF5I1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMyBTYWx0ZWRfX91Xe1TPpPG6E
 XACjlNADtp3c1QvnegLLS3khcem680cX8+nQsPhR/sKl95ISqwfAOqJUO6YKBwUolq4cbO2XCoB
 TCJxwmAablRE60cD/pUml7D3RIqiD+KfgP8ZVmydb8x6WhopOpxSS5B4Fg0zElR2f09gWYWUijL
 nJX4OAy/5Csqf1srI03/YsqNRR10o9ZfPr5TA3sah+/PKRlmh59bPDLDwQKa5ZPdu3XyySXDgBx
 tx8dF1hVCZ0WM4Mpa8xLa4JnihJRx3dZgIMMIfL9Xyl4obB/cF1G3WV8qwBNONfI33Fbr/3OwWk
 ra4o+cm4ADVvZRDsvZl47Uk6ttz2Kl10NKNw+JT01eJccoJNOIlbLh/UGFtZfeuJkze6YSuXxyX
 LQAfnQuUcOzeUKQd78hYWJODp2qVWqT6xW7mhCheQAizQGjg4WLYl1Cwf8Ds/YdaUFom3g/dr81
 u+u2pgwUPGxKU7+Q9Cw==
X-Proofpoint-GUID: b_t_GWznjZG2KJinyTQdIgiev6uxF5I1
X-Authority-Analysis: v=2.4 cv=TIpIilla c=1 sm=1 tr=0 ts=69ca884a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0fAIJR1rb9fCs4FPyLUA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300113
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57636-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B03135CF11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 30-Mar-26 16:11, Bryan O'Donoghue wrote:
> On 30/03/2026 14:46, johannes.goede@oss.qualcomm.com wrote:
>>>> And then your CCMv1 or CCMv2 helper will get called with
>>>> the matching parameter-data.
>>> This leads to userspace having to know exact format for each hardware
>>> version, which is not nice. At the very least it should be possible to
>>> accept CCMv1 buffers and covert them to CCMv2 when required.
>> Yes, but a new ISP may also have a different pipeline altogether
>> with e.g. more then one preview/viewfinder output vs one viewfinder
>> output for current hw, etc.
> 
> My scoping on HFI shows that the IQ structures between Kona and later versions have pretty stable data-structures.
> 
> It might be worthwhile for the non-HFI version to implement those structures.

Maybe, it depends on if they are really 100% the same
various IQ parameters are in various different fixed-point
formats. I don't think we want to be converting from
one precision fixed-point to another precision fixed-point
in the kernel.

> I keep mentioning CDM. Its also possible to construct the buffer in the format the CDM would require and hand that from user-space into the kernel.

I believe the CDM take register addresses + values to setup
the OPE for the next stripe to process ?

Directly exporting a format which takes register addresses
+ values to userspace does not sound like a good idea.

If you look at the current structure of the OPE driver
it already keeps tracks if per stripe settings, only atm
it programs those directly on the stripe completion IRQ
rather then setting up the CDM. Generating the CDM settings
from that data should be straight forward.

I really do not believe that such low-level details belong
in the userspace API in any way.

If anything whether we are using the CDM or directly doing
the next stripe programming from the IRQ handler should
be completely transparent to userspace.

> 
> That would save alot of overhead translating from one format to another.
> 
> That's another reason I bring up CDM again and again. We probably don't want to fix to the wrong format for OPE, introduce the CDM and then find we have to map from one format to another for large and complex data over and over again for each frame or every N frames.

CDM is a much lower-level API then what is expected from
a media-controller centric V4L2 driver. Basically the OPE
driver will export:

* media-controller node
* bunch of subdevs + routing between them
* /dev/video# videobuffer queue for raw input frames
* /dev/video# parameter queue for extensible generic v4l2 ISP parameters buffers (with qcom specific contents)
* /dev/video# videobuffer "video" output queue for processed frames
* /dev/video# videobuffer "viewfinder" output queue for "extra" downscaled processed frames

No statistics since these come from the CSI2 bits (VFE PIX)
on Agetti.

This is is basically the current consensus what a modern
hardware camera ISP driver should look like to userspace.
Anything lower level then this should be abstracted by
the kernel.

Note both output nodes can probably downscale, but
the viewfinder one can do an extra downscaling step
on top in case userspace wants 2 streams one higher res
to record and a lower-res to show on screen.

Regards,

Hans



