Return-Path: <linux-media+bounces-53347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGPiLH0Fn2mZYgQAu9opvQ
	(envelope-from <linux-media+bounces-53347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:21:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A320198A1D
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE19030479C4
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADE23BFE26;
	Wed, 25 Feb 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKT+YWXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbUpAVrp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB238E5F7
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029297; cv=none; b=jiF/vUrIYr9B+8vqTqdSWZGTS8mDTSmYUvGbxv2Mrfm/acYfMGD1Fzhhp9F0bs+121r8sxYvKqk+UT5WAUsV7wljVJBsfwTEI3xO4quFR/OmNL4JhlgbNo8m9mevG8vJHx+DmvxGxb6aTwrRvvss9qxjxJE5Hf6RCqRyHQEhV0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029297; c=relaxed/simple;
	bh=i86DmHSzXGMaFptnvTkFUgDDBR/E1VWfZnmtLhYeDZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkGGMQ//yslfqu2JxGj2uMbUme4uzgOI0aF5of9BxHZAwKcXujEctW+00QKJCw1UTPD/3JDWcxj1IiByVdwLH1D5HTilLrU0Cp6FeCdmXNjPi+NCCqjaEbHStX7GRuwHbyjoSjfa4f61Fne6QuGdqXwDfo0BbLEd+8ZFjwDBtgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKT+YWXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbUpAVrp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SIdl1363609
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFY22rORlCjl1itZoL6ReZ+SgfM8hAioqFUB6hcQ4Cw=; b=FKT+YWXlEcw5E0w5
	NulkGeeXOPVDqsPCk5ZQrmf5I3gIhOgn7lvPkWsGgTCGTq7E7ptnlccgRm1M5vZH
	KGSpEetV9gb21dw/OLw97lozJ2hl7EJqrErcdzh6CLu9XRkaRD5iyVyY9hcVQMZ8
	/yRqv9prWaRNQPppT8UCZK8l4+KdmTnMfetiKfBd2RBRCHctLorw4HazALOnwU1W
	4WTFc8zkffiTXDX0XsdB5sU8aroOdEn61CxbS9YoplQFttzMCqimDsuQTdNVtUMw
	oBhQpJZKsIjIsNzry8U51LnF2h/oYI2PNtFlwj8f+R9w0f/TZLHn4JYsjlfE1bi1
	ZjiESw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp15a89f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:21:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899b6a1a557so58556416d6.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772029294; x=1772634094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFY22rORlCjl1itZoL6ReZ+SgfM8hAioqFUB6hcQ4Cw=;
        b=NbUpAVrptD9Uc5+riJrm8j7tckqWSl0b9YB+pK41/w9wQTbZ+CP5snXhvFxrUjcwQC
         w8FyqEsEHwRZkxj7lWvJtEjcvEbDtSYxkuKCKMXyYiR7SM1ZbAgf6eY42BwUD+kf1lJV
         WpJ6cl70U7fcXH+3B2nQSK38IYsuH7pdJLwfKbIMYAAQJFlZtIfDTovyTB24Vv1wBMdJ
         O3UG3jhBcEQCGjMFS4lAma97lKQly9UjSVhqpl1XsG3qwX0CmUzlg1G1NE4GWOvIUDwq
         rtQQVK1UkKJOPMSRvd//s3tJsH4Lj9E8GIMqP7wplsw35C1H4Wo/HokYh1RdiE10lZp0
         Xgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029294; x=1772634094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFY22rORlCjl1itZoL6ReZ+SgfM8hAioqFUB6hcQ4Cw=;
        b=LwOgIJY1Z0JV3aHZ20oZSivjJ4Mo4ygEJ1xsZsxTlfJgzp8kX+xMXq8FAJb7x6zjAt
         CszlLaIuQq+lAzDhCSikee1SBUlY1Qm2uFVe3dU6wNoQJOheLGNSjngsEdM/aNVi29Aq
         Ph8Bf9v6qQhnn62ngaTJsVaXdlbyZTrSQenRzWuJFbVBhgU5vZRuN+1MuVY7YXJ4mvKV
         ZVB9fRf5r+l+1zl8UboMSltTbLbNDn0vUOzAOWdrmzQVwFZVPvzRpjeqFOVqleSDL7+g
         O3cIbVhY8zcSCwRtuCsk6hjH4PZgVG5fLtzLfXVUd0PEsa9gXSV/iCGBh7sPNdk3dmS7
         pLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3HO7r/Ho+uJ8RK5cHRsOZbD0x4KAZ6s5vo2iTNk8fq0JAG7OVapqXcQUHodHsWmbeSwz+LsYRq64SWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6jK/fczMD3zSQWoNQotfN9o9f3KUiIpllIhggZ+r62wVZCVAm
	BmtTKmW47J9KA8kZc7gOubtHE9qy6lBTWZRe0blo/W5qIhf+8nVKEl1VLzJ0+MqvHmr286qKfha
	H9K/67PQEVM4kWZTjiLWpaGt1QFzjHdGbET9ALZke8mB576CsbPP/rVFSCh8cSeLU
X-Gm-Gg: ATEYQzxp1c5TY7jobovitAW23Jz8+RAcHNcCapGZZWaiHa+onuC6CdNwriCVnikECgB
	NzryVk1RDf00G/QurXkxSxnSslGf8CARy+UqSiz2JQC7/Tb5noXygfbIPdrCDKRVg+CB8RwoXUf
	pGpaBt1/1rAOEwLOCl+lHnxefs0VCnX5VxWNhX64xEh4QKDl4Uv91h/Uib5q1hI+iqfEFkRREdW
	8Q70Ita4g8izt+1LR4okYr6IJWWHl279aEuQ71baeYy6qVQiiQZ1mwbUHpN349kBLLqunFpdw1x
	eHNZZQ/YqjiutHQOUwCvioKsGl5uNQlU2qpctnKgBeojyeWLgxRlxR7sbhfYpO7UMIyCSU3qL9P
	nHLurSMvtla/zEV5xbdkc36guFWr/c2OYoaJi/dCwkVJj4/ZXaRdNO8o=
X-Received: by 2002:a05:620a:44d2:b0:8cb:47b4:165f with SMTP id af79cd13be357-8cb8c9cdc29mr2060696285a.14.1772029293230;
        Wed, 25 Feb 2026 06:21:33 -0800 (PST)
X-Received: by 2002:a05:620a:44d2:b0:8cb:47b4:165f with SMTP id af79cd13be357-8cb8c9cdc29mr2060687185a.14.1772029292356;
        Wed, 25 Feb 2026 06:21:32 -0800 (PST)
Received: from [10.224.242.57] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084caea29sm526952266b.25.2026.02.25.06.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:21:31 -0800 (PST)
Message-ID: <9e2584ed-0892-4c8d-a32d-2aba9d6239fc@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:21:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] virtio-video: Add virtio video device
 specification
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
        Trilok Soni <tsoni@quicinc.com>, Matti Moell <matti@qti.qualcomm.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com>
 <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
 <SJ0PR12MB680603C30AB26E93ECB27E2FDC6FA@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260215095955-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
In-Reply-To: <20260215095955-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNyBTYWx0ZWRfX4BoLUQns69qn
 RSdzOC0SFUKTc4g56V9vGKMdiLZBO5uOEQ9Ctzh877otns8BTRrDNARrsTWFIQ81HSUqWQeTFEf
 yGVNRcvyZE8ASukX2IEVoLjiiB33nvozoZ+fTln8aWbC2F5nCpvJ14dxeqLR1Ty7tpEQaNRtpBp
 JR1i4a6cc9lJ7hw8I/lNMQhnfn/gZVTpLAxXmfFwoqwOkE2ntlVOtHIE2Ye3+xC9pZJgY0ublak
 TSplDFm9IMpyfSUZZA4vmfeVD5lySQNKySjvGNk3tFYxx7OyHSABy2gwFmg247UzsiXu2+Pq4cP
 HlsPDmkXKWEsx0f+yY/fhVoGIrhR4YaHPk1LknC6bS8M5O6XHObGM6iiRU/PhMK7/xNRXeE2gOM
 j9BJBse5PwgoxETs0i+bL2/vKIlBIgcgGWVFhqqrC+pVxqmb5dlsSXIk27ZVpoJ6bTQvSoI3b5U
 3yEYy4bketOU0Im8vDA==
X-Proofpoint-GUID: eARWLgwydQlYprKnN8rWvgdhLshZai6a
X-Proofpoint-ORIG-GUID: eARWLgwydQlYprKnN8rWvgdhLshZai6a
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699f056e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bs-e4Z8cAAAA:8 a=fVPzZe-SYbF4OaQaJaoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=YFpLQiK6rFjqGb8m0bXF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[lists.linux.dev,redhat.com,linaro.org,collabora.com,ideasonboard.com,gmail.com,quicinc.com,qti.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-53347-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.gordeev@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A320198A1D
X-Rspamd-Action: no action

On 15/02/2026 16:11, Michael S. Tsirkin wrote:
> On Sun, Feb 15, 2026 at 10:49:22AM +0000, Parav Pandit wrote:
>>
>>> From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
>>> Sent: 13 February 2026 02:23 PM
>>>
>>> From: Alexander Gordeev <Alexander.Gordeev@opensynergy.com>
>>>
>>> Add the specification of the video decoder and encoder device, which
>>> can be used to provide host-accelerated video operations to the guest.
>>>
>>> Signed-off-by: Alexander Gordeev <alexander.gordeev@opensynergy.com>
>>> ---
>>>  conformance.tex                           |   12 +-
>>>  content.tex                               |    1 +
>>>  device-types/video/description.tex        | 1592 +++++++++++++++++++++
>>>  device-types/video/device-conformance.tex |   22 +
>>>  device-types/video/driver-conformance.tex |   20 +
>>>  introduction.tex                          |   21 +
>>>  6 files changed, 1664 insertions(+), 4 deletions(-)
>>>  create mode 100644 device-types/video/description.tex
>>>  create mode 100644 device-types/video/device-conformance.tex
>>>  create mode 100644 device-types/video/driver-conformance.tex
>>>
>>> diff --git a/conformance.tex b/conformance.tex
>>> index 9af31e2..f34e600 100644
>>> --- a/conformance.tex
>>> +++ b/conformance.tex
>>> @@ -37,8 +37,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>  \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
>>>  \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
>>>  \ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance},
>>> -\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
>>> -\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
>>> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance},
>>> +\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance} or
>>> +\ref{sec:Conformance / Driver Conformance / Video Driver Conformance}.
>>>
>>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>>>    \end{itemize}
>>> @@ -68,8 +69,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>  \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
>>>  \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
>>>  \ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance},
>>> -\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
>>> -\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
>>> +\ref{sec:Conformance / Device Conformance / Media Device Conformance},
>>> +\ref{sec:Conformance / Device Conformance / RTC Device Conformance} or
>>> +\ref{sec:Conformance / Device Conformance / Video Device Conformance}.
>>>
>>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>>>    \end{itemize}
>>> @@ -170,6 +172,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>  \input{device-types/spi/driver-conformance.tex}
>>>  \input{device-types/media/driver-conformance.tex}
>>>  \input{device-types/rtc/driver-conformance.tex}
>>> +\input{device-types/video/driver-conformance.tex}
>>>
>>>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>>>
>>> @@ -264,6 +267,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>  \input{device-types/spi/device-conformance.tex}
>>>  \input{device-types/media/device-conformance.tex}
>>>  \input{device-types/rtc/device-conformance.tex}
>>> +\input{device-types/video/device-conformance.tex}
>>>
>>>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy
>>> Interface: Transitional Device and Transitional Driver Conformance}
>>>  A conformant implementation MUST be either transitional or
>>> diff --git a/content.tex b/content.tex
>>> index 5de811f..0c13f68 100644
>>> --- a/content.tex
>>> +++ b/content.tex
>>> @@ -835,6 +835,7 @@ \chapter{Device Types}\label{sec:Device Types}
>>>  \input{device-types/spi/description.tex}
>>>  \input{device-types/media/description.tex}
>>>  \input{device-types/rtc/description.tex}
>>> +\input{device-types/video/description.tex}
>>>
>>>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>>
>>> diff --git a/device-types/video/description.tex b/device-types/video/description.tex
>>> new file mode 100644
>>> index 0000000..8945e26
>>> --- /dev/null
>>> +++ b/device-types/video/description.tex
>>> @@ -0,0 +1,1592 @@
>>> +\section{Video Device}
>>> +\label{sec:Device Types / Video Device}
>>> +
>>> +The virtio video device provides support for host-accelerated video encoding
>>> +and decoding.
>>> +
>>> +\subsection{Device ID}
>>> +\label{sec:Device Types / Video Device / Device ID}
>>> +
>>> +50
>>> +
>>> +\subsection{Virtqueues}
>>> +\label{sec:Device Types / Video Device / Virtqueues}
>>> +
>>> +\begin{description}
>>> +      \item[0]
>>> +            commandq - driver commands
>>> +      \item[1]
>>> +            eventq - device async responses to commands and standalone device events
>>> +\end{description}
>>> +
>>> +\subsection{Feature bits}
>>> +\label{sec:Device Types / Video Device / Feature bits}
>>> +
>>> +\begin{description}
>>> +      \item[VIRTIO_VIDEO_F_ENCODER (0)]
>>> +            The device can encode video.
>>> +      \item[VIRTIO_VIDEO_F_DECODER (1)]
>>> +            The device can decode video.
>>> +            % Use-case: the device can support both encoding and decoding, so having both
>>> +            % here can save resources.
>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (2)]
>>> +            Guest pages can be used as the backing memory of resources.
>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (3)]
>>> +            The device can use non-contiguous guest memory as the backing memory of
>>> +            resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES is also
>>> +            set.
>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (4)]
>>> +            Objects exported by another virtio device can be used as the backing memory
>>> +            of resources.
>>> +      \item[VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER (5)]
>>> +            The device releases an extra empty output buffer after a drain or DPC so that
>>> +            the driver can send a buffer with V4L2_BUF_FLAG_LAST set in the V4L2 way.
>> This does not seem relavant to the video device.
>> It should not be attached to any V4L2 implementation.
>> Can you please craft it differently?
> 
> My understanding is that this is a V4L2 device just like virtio input makes
> the linux input layer into a device.

Well, the device isn't really V4L2 and doesn't even use V4L2, but indeed the V4L2 driver is our main target for now. There is already virtio-media for exposing V4L2 devices from the host.
There are other drivers to come though, so we're going to have setups with no V4L2 at all.

>>> +\end{description}
>>> +
>>> +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>>> +
>>> +The device MUST set at least one of VIRTIO_VIDEO_F_ENCODER or VIRTIO_VIDEO_F_DECODER.
>>> +
>>> +The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
>>> +VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would
>>> +mean that no memory can be used at all for resources.
>>> +
>>> +The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it also sets
>>> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
>>> +
>>> +\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>>> +
>>> +The driver MUST negotiate at least one of the VIRTIO_VIDEO_F_ENCODER and
>>> +VIRTIO_VIDEO_F_DECODER features.
>>> +
>>> +The driver MUST negotiate at least one of the
>>> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
>>> +features.
>>> +
>> You wouldn't need virtio_object feature bit. It should be covered using the capability.
> 
> To be frank I'm pretty split on this. Capabilities make sense
> if there are envisioned to be lots of these.
> I'll let the contributor decide if that is the case.

I'd rather not change this. We won't have many flags I think.

>>> +If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
>>> +VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
>>> +contiguous memory for all the buffers it allocates.
>>> +
>>> +\subsection{Device configuration layout}
>>> +\label{sec:Device Types / Video Device / Device configuration layout}
>>> +
>>> +The video device configuration space uses the following layout:
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_video_config {
>>> +        le32 max_streams;
>>> +        le32 caps_length;
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +\begin{description}
>>> +      \item[\field{max_streams}]
>>> +            is the maximum number of concurrent streams the device supports.
>>> +      \item[\field{caps_length}]
>>> +            is the minimum length in bytes that a device-writable buffer must have
>>> +            in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
>>> +            \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
>>> +\end{description}
>>> +
>>> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Video Device / Device configuration layout}
>>> +
>>> +\field{max_streams} MUST be positive.
>>> +
>>> +\field{caps_length} MUST be set to the response size of
>>> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
>>> +
>> This plumbing can be easily done using 'Device and driver capabilities' located in the 'Group administration commands'.
>> Please rework the patch to use the existing basic facility.
>> This can also possibly eliminate plumbing device specific command q.
>> More below.
> 
> admin commands are kind of heavyweight, they are designed for control
> path.  Question is, is this a data path or a control path thing?
> If data path it is not appropriate, if control path it is.
> 
> 
>>> +\subsection{Device Initialization}
>>> +\label{sec:Device Types / Video Device / Device Initialization}
>>> +\begin{enumerate}
>>> +      \item
>>> +            The driver reads the feature bits and negotiates the features it needs.
>>> +      \item
>>> +            The driver sets up the commandq and the eventq.
>>> +      \item
>>> +            The driver reads the \field{caps_length} field of the configuration
>>> +            space, prepares a buffer of at least that size and sends the buffer on the
>>> +            commandq with the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
>>> +      \item
>>> +            The device sends a response over commandq to
>>> +            VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS via used descriptors provided with the
>>> +            command.
>>> +      \item
>>> +            The driver receives the response from the device, and parses its capabilities.
>>> +\end{enumerate}
>>> +
>>> +\subsection{Device Operation}
>>> +\label{sec:Device Types / Video Device / Device Operation}
>>> +
>>> +The device supports opening and operating a number of parallel streams up to
>>> +\field{max_streams}. Each stream has three internal device queues: mainqX,
>>> +inputqX and outputqX, where X is the stream id. Each stream command has a
>>> +field that dispatches the command to the specific internal queue.
>>> +
>> If these queues are internal to the device it does not need exposure in the spec here. If they have a meaning to the driver,
>> Than keyword 'internal' should be dropped and rephased.
> 
> I think the implication is that within each queue commands
> are consumed in order?
> 
> This isn't terribly clear.

Noted, I'll make sure to improve the description in the next draft.

>>> +% Use-case: there might be different real-time requirements for different
>>> +% streams, so more virtqueues can be added in the future if necessary.
>>> +% The internal queues don't change, the data formats don't change, only the
>>> +% mapping of streams/internal queues to particular virtqueues changes.
>>> +
>>> +The mainqX is used to open a stream with VIRTIO_VIDEO_CMD_STREAM_OPEN,
>>> +close a stream with VIRTIO_VIDEO_CMD_STREAM_CLOSE, reset inputqX or outputqX
>>> +using VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, set some of the stream parameters out
>>> +of band with high priority with VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, unblock
>>> +the outputqX with VIRTIO_VIDEO_CMD_STREAM_UNBLOCK if it gets blocked for
>>> +format negotiation.
>>> +
>>> +The inputqX and outputqX are used to queue input or output resources using
>>> +VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE. Additionally inputqX is used to set input and
>>> +output parameters using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, to complete
>>> +processing of all queued input resources and make the resulting output
>>> +resources available to the driver using VIRTIO_VIDEO_CMD_STREAM_DRAIN.
>>> +
>>> +All the stream commands start async operations, return the results
>>> +using async responses over eventq.
>>> +The eventq is used by the device to send the device's async responses to
>>> +stream commands and the device's standalone events.
>>> +
>>> +% This way eventq becomes the single source of truth about the device's state,
>>> +% the driver doesn't have to tediously synchronize commandq's and eventq's
>>> +% used queues the way it was necessary in the past (similarly to V4L2's DQBUF
>>> +% and DQEVENT). One more benefit is that commandq is processed fast and
>>> +% strictly in order, so commandq descriptors exhaustion should never happen in
>>> +% practice.
>>> +
>> Video device should be implementable without any V4L2 binding/description etc.
>>
>>> +Parameters allow the driver to configure the stream including setting up the
>>> +resources. Available parameters depend on the device type, see
>>> +\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
>>> +
>>> +A resource is a set of memory buffers that contain a unit of data that
>>> +the device can process or produce. Most resources have only one buffer,
>>> +raw frames using a multi-planar format can have several.
>>> +Input resources are filled by the driver with compressed (coded) video data
>>> +for a decoder and raw frames for an encoder, output resources are filled by
>>> +the device as the result of processing the input resources with decoded raw
>>> +frames for a decoder and compressed (encoded) data for an encoder.
>>> +Resources from inputqX and outputqX are consumed independently, not in pairs.
>>> +One input resource can result in zero to many produced output resources.
>>> +A decoder device dequeues the output decoded frames in presentation order.
>>> +An encoder device dequeues the output decoded frames in decoding order.
>>> +The driver can reuse a queued resource after receiving a corresponding async
>>> +response. Dequeued output resources can still be used by the device as
>>> +reference frames, so the driver can't write to them.
>>> +
>>> +% TODO: maybe send the second RESOURCE_QUEUE async response, when the dequeued
>>> +% output resource is not used by the device anymore and therefore becomes
>>> +% writeable?
>>> +
>>> +The device can detect standalone stream-related events: errors and dynamic
>>> +parameters changes that require intervention from the driver (e.g.
>>> +reallocating backing memory of output resources to fit the new parameters).
>>> +The events are signalled on the eventq, see
>>> +\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>>> +
>>> +\devicenormative{\subsubsection}{Device Operation}{Device Types / Video Device / Device Operation}
>>> +
>>> +The device MUST set to zero all unused, disabled or padding bits in its
>>> +responses.
>>> +
>>> +\subsubsection{Device Operation: Command Virtqueue}
>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
>>> +
>>> +This section lists the commands that can be sent by the driver to commandq.
>>> +
>>> +Different structures are used for each command and response. A command
>>> +structure starts with the requested command code, defined as follows:
>>> +
>>> +\begin{lstlisting}
>>> +/* Device */
>>> +#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS      0x100
>>> +
>>> +/* Stream */
>>> +#define VIRTIO_VIDEO_CMD_STREAM_OPEN            0x200
>>> +#define VIRTIO_VIDEO_CMD_STREAM_CLOSE           0x201
>> You can craft the stream using a existing basic facility of resource object.
>> Where each stream is just a resource object, that be queried or modified.
>>
>>> +#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS      0x202
>>> +#define VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS      0x203
>>> +#define VIRTIO_VIDEO_CMD_STREAM_UNBLOCK         0x204
>>> +#define VIRTIO_VIDEO_CMD_STREAM_DRAIN           0x205
>>> +#define VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET     0x206
>>> +#define VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE  0x207
>>> +\end{lstlisting}
>>> +
>>> +Stream commands start with a header:
>>> +
>>> +\begin{lstlisting}
>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_MAIN    0
>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT   1
>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT  2
>>> +
>>> +struct virtio_video_stream_cmd_header {
>>> +        le32 type; /* One of VIRTIO_VIDEO_CMD_STREAM_* */
>>> +        le32 stream_id;
>>> +        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* */
>>> +        le32 async_response_cookie;
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +\begin{description}
>>> +      \item[\field{async_response_cookie}]
>>> +            is an async response cookie provided by the driver, that allows
>>> +            to relate an async response to the previously submitted command.
>>> +\end{description}
>>> +
>>> +\subsubsection{Device Operation: Event Virtqueue}
>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
>>> +
>>> +The eventq is used by the device to send async responses to commands queued
>>> +by the driver on commandq and standalone events. Stream errors and dynamic
>>> +parameters changes are caused by changes in the device's state, not by
>>> +commands, still they are delivered as responses to implicit
>>> +VIRTIO_VIDEO_CMD_STREAM_CLOSE and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
>>> +respectively.
>>> +
>>> +Events start with a header:
>>> +
>>> +\begin{lstlisting}
>>> +#define VIRTIO_VIDEO_EVENT_FLAG_ERROR              (1 << 0)
>>> +#define VIRTIO_VIDEO_EVENT_FLAG_STANDALONE         (1 << 1)
>>> +#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED           (1 << 2)
>>> +#define VIRTIO_VIDEO_EVENT_FLAG_BLOCKED            (1 << 3)
>>> +
>>> +struct virtio_video_event_header {
>>> +        le32 event_type; /* VIRTIO_VIDEO_CMD_STREAM_* */
>>> +        le32 stream_id;
>>> +        le32 async_response_cookie;
>>> +        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +\begin{description}
>>> +      \item[\field{event_type}]
>>> +            is the type of the event.
>>> +      \item[\field{stream_id}]
>>> +            is the ID of a valid stream.
>>> +      \item[\field{async_response_cookie}]
>>> +            is an async response cookie provided by the driver, that allows
>>> +            to relate the event to a previously submitted command.
>>> +      \item[\field{event_flags}]
>>> +            is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
>>> +
>>> +            \begin{description}
>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_ERROR]
>>> +                        is set if the command finished with an error due to an
>>> +                        invalid argument or for other reasons.
>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_STANDALONE]
>>> +                        is set for standalone events, see
>>> +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
>>> +                        is set if the command has been canceled by another
>>> +                        command, that has higher priority. Doesn't make sense
>>> +                        for standalone events.
>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_BLOCKED]
>>> +                        is set if the command triggered a block on the
>>> +                        outputqX to allow output format negotiation.
>>> +                        When the negotiation is finished the block has to be
>>> +                        removed using VIRTIO_VIDEO_CMD_STREAM_UNBLOCK
>>> +                        command, see
>>> +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}.
>>> +            \end{description}
>>> +\end{description}
>>> +
>>> +The particular data structure representing the event is selected according to
>>> +the \field{event_type}.
>>> +
>>> +\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device Types / Video Device / Device Operation / Device Operation:
>>> Event Virtqueue}
>>> +
>>> +The driver MUST at any time have at least one descriptor with a used
>>> +buffer large enough to contain a \field{struct virtio_video_event}
>>> +queued on the eventq.
>>> +
>>> +The driver MUST NOT put device-readable descriptors into the eventq.
>>> +
>>> +The driver MUST account for the fact that the async responses to commands
>>> +might come out-of-order (i.e. after other commands sent to the device),
>>> +and that some of them can be cancelled.
>>> +
>>> +The driver SHOULD wait for an async response of command A, that caused
>>> +cancellation of command B, before queueing the command B again.
>>> +
>>> +\subsubsection{Device Operation: TLV format}
>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: TLV format}
>>> +
>>> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS/
>>> +VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS
>>> +commands represent device capabilities and corresponding device parameters
>>> +in the form of TLV (Type-Length-Value):
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_video_tlv {
>>> +        le32 type;
>>> +        le32 length;
>>> +        u8 value[length];
>>> +};
>>> +\end{lstlisting}
> 
> will cause all kind of padding mischief if length is not a multiple of
> 4.

Yes, true. It is indeed mentioned further:
+      \item[\field{length}]
+            specifies the \field{value} size in bytes aligned to 4 bytes.


