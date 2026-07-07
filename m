Return-Path: <linux-media+bounces-66825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hu4ECj/ITGrIpgEAu9opvQ
	(envelope-from <linux-media+bounces-66825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:34:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BF8719D80
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:34:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jc469BuK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TRlJM7A5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66825-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66825-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D85E6318ADED
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 09:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93266397E81;
	Tue,  7 Jul 2026 09:24:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92427395D8F
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 09:24:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416297; cv=none; b=luKMUJHxl6FGwDdu4l04QrFMHNFQ2HEhW+Y2Xvisb3/BDYaupss5GVgtOiGwDjuZl6ADToZ3z7FC2dbcmtQ5szfImXcjpo26ptTkHwAxwPyQsUGePpNPGUrg/Zf7CQwDxOXtyshI/hGua4mUNexWYkkuKCDlHOR0RTaukwuprfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416297; c=relaxed/simple;
	bh=PiAuRzSrVirETb4Q+BzGnIPv2Qe3sql6vwSfUHtf+LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pg0zpH/JSBKAIZfUKhiUYNxgdTmWC03+1Z6403NpZuihCmcVChv1Nj4IU6lp95fpiUHi6hMALRp2eBqBpiO68U/yzIGZnkkrETJH6m+jFp1PZsV4vf1cfm2VOfsGBBrtMb+gNfRdWaJ1YRYoN093leIZ0uWDPmaEmrr6qXlPc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc469BuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRlJM7A5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Don63205893
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 09:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=; b=jc469BuKXnRZ1rtO
	x4pnOasOJKO0SJMmI4FlsKicl0htYcIdlNlYQ+OVGt1f4QVNTbj5AkyqlbZsDgl+
	xjlopIg3v/Kf5BLrMrkqEMNrj7uO+XH1RjHXadz31UXHoflx55oVrNJ5LrYW23WU
	iPtpi92Ds4eEW9hP5TIoVAtZA21fXGcX23P17TwVBQA8T/Y76UNhBMGtRo8PJPtZ
	D9V2J4jK4YGlV5tRCFiwy5zrvuHtNnaig2FDlf+NdfQ8fwmtxvRHmeTkWp+lb70J
	AI8PS6/w1wdaoMAbOHvAIZcEOAlmhdE9xka4P9U23L/GOa2KAGWLQ8/Qfrr7EgmW
	r04jFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3kxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 09:24:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so27388241cf.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416294; x=1784021094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=;
        b=TRlJM7A5y0EyXF/+c20Hrpo7h/dF8jOZHwC4pe9aHce+gbBbYmCjchXVn2BFQwBI0W
         65akHHt4xs4f7XwXN2LrjWETEpyVtDn5Vi9tKBAIX+zQykzKcotK1MFTJMru9g4lgqQK
         raMs+j4/fEsK2dIAHDDZT9EEgvT0SEZU8jkmpG7jHyH/KRlD57db6qDJTJZ9capK8GXz
         YqEvRzv9x8711YbomN+VlbNe5kzRb9zhpRMuHOqB7psS096s5jQn7+mwEF2VXgnTmLVQ
         x7dWB4PD3erynGmtH1F5+eoD1CKtbynVGJKb3T7NuqLi/u+sfjnfuYFgbv4X730MGQLF
         jLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416294; x=1784021094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=;
        b=XgxE9Yz4fwxndj/zjyU5w5ENdmqajAg0lABGVI1nUaQ2XBYItNxUc3yR0Qauqa/aO3
         oPjaQC2bUIE4MZKbU2CXuD6xFn8NbOuvXlmR0kCXv8lafbA+RkCuW6X0d240d8eTOT4P
         wC6S2CD4gQIzozYUsuB/3wIPXbQgcs/gRL44fVXqFl+UfJUNmohaPbQ6n+UdiGG15eE7
         aVLm04aBo5fpY66GYy35v6IG8U2CcdixAyHsTFJo1gGseB6h9lkgV/jsKwtrpssxbwFR
         2VC1op8ZKVXmQe/xNf4gdZYCJvvguBvywf6sZ1Scc8JDfYIX0pwjtrzLcZmTgrzczAL+
         xhFQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+9wxFY/W5Exvs4J86k6U4+rjqiILpcSObBQIoRhXh4rQbf++McaG9N5qZ+ecoP2+KCL+14UlMienJxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrKiEWW5cZ8qZ5VYUgRZTOqbSxPlRruLu7sj6KABCkJ7Wn9Hlh
	zpJAASTQ/9jFFzQUG9PXq+byAPn2ONq1wkDn/pCDql5n69QGE4sBmy6jiHTLH44o2ZrwMA1bdeW
	2YMtkLBV9B2pDyQ4WM+0EvXTt9aoVdlHHOJd+Rst/HgCeWdxkkgmFF+onODbsWx1m3Q==
X-Gm-Gg: AfdE7cm8hLgeLshDhIj2G0dTfrU0tMuXnuoANMemvUUq4h+W/LiPkPex5JBNONC25H+
	e4C51Z6xZaHhObTKkKD53q4XMd/F75QIrgRp63s5ZxBJ0/4dhpUN09F5LoBueSdu2QHtGoyo9ix
	yboBCg2DYVqPDjiSOlhbLs/DtTxz6zelOdtz5TXd7sPyLQOZa5uxmcbt4YAQnp1sVlY8sdDTyRA
	dyQkY8UINxDy3NUFXn/EU30yontBsHXelJ4ICXujccTV9at7aJ7mgm2Q9Ko17WoyTOcfd/j3Xn7
	KmeMpWjMjbBMeLnuGpowuVGvpDASGujfKOuck+6xFsCqQLFzDoImJwCOc3bRnJn18tjQvYvbfrv
	FihaDLRg1jCeBQXUMsNDtTdyJvat8ClJ8Q7Q=
X-Received: by 2002:ac8:59c2:0:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c79ed7d5dmr19016001cf.7.1783416293503;
        Tue, 07 Jul 2026 02:24:53 -0700 (PDT)
X-Received: by 2002:ac8:59c2:0:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c79ed7d5dmr19015851cf.7.1783416293140;
        Tue, 07 Jul 2026 02:24:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm91703866b.59.2026.07.07.02.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:24:52 -0700 (PDT)
Message-ID: <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:24:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX93fQTGkhJqt+
 kWH/KK3cCsRMvQXhHxw0GyRqJMLqisyRGmlIWWVBWXhp8vFLelN+L1yjVr/YhD1fMxkRDu9i1Cj
 XxCVvd+StdYzHDbDo7UQNRqRLDNsX9g=
X-Proofpoint-ORIG-GUID: tskuJpzy4zjpem1rb_B2Z0xgwy2ukjTM
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cc5e6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=ZbAgfBTtTtZkgMFo8CMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX8cwut5NlIIp1
 qdLIj9IopeLwKyhOdt2/AQArwvaL+4UceI43mGiYJEthY/Tj+NDt6D3S6jqttsnD0sB2pk67XFn
 Ckq/9GSgIs0K9KzUwG8XzXyj0nE91RfcRpw1UpoKj3QCDMgJ8KGiNVtQjWscb0ktbKAx4sjvTB/
 ZdrTRg+hPqlC9/ohIxdnes8gIy8ju8axRAeM1d6WYhQsHyUCUZnQZOxKj9BPnNDEu+7i5rdWAaK
 ryW2AJFJPBSTzFeM31+dtgr+Qm6ccd2SAUddtxXQCnjo0ezNvQ8ZsuKhVmD5EvDcj4D0Ba1GmD3
 XW9WHgDuYF1iHEBG8d8FG4xN/Mviweh0sqU9nILK2W+3bQCaSnnkCs5OUC2Pz3uornBJP356O13
 kWU2dOZ6sjl/caK6FKECKPoxzy1jlBThOYtyS33AtYggOMwIvL9q/4CwJtdwS8FZ3jTOSkx2bOZ
 ZguW1i05CFRmTh52IfA==
X-Proofpoint-GUID: tskuJpzy4zjpem1rb_B2Z0xgwy2ukjTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66825-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp,nxsw.ie:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71BF8719D80

On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>>>>
>>>> Why? The common power domain and interconnects have already been
>>>> described as resources of the parent CAMSS device, there is no need
>>>> to duplicate descriptions in every child device tree node of CAMSS.
>>>
>>> CSID, IFE etc are not parents of the JPEG encoder.

This is either a strawman argument or a misinterpretation of what
is being argued.

>>>
>>> The idea is to make all of these peers, eventually. Not particular block
>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>>
>>
>> The statement provides the same information as before, e.g. it's found here:
>>
>> https://lore.kernel.org/linux-media/fbc018f5- c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>
>>      There's no functional linkage between CAMSS/IFE and JPEG - they are
>>      peers within the CAMSS power-island.
>>
>> Thus "the CAMSS power-island" exists, and it got its hardware description
>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>> a natural resource of all devices on "CAMSS power-island",
> 
> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of the nodes within it depend on that and it is _external_ to the block.
> 
> There is a CSID MUX on some SOC other than that I'll restate it again, I'm not sure why you won't accept it.
> 
> There is no dependency between JPEG and IFE, one is _not_ subordinate to the other and trying to find ways to invalidate that statement runs counter to the facts.

They are all subordinate to CAMSS_TOP - Vlad indeed said they are
peers (i.e. there's no co-dependence between them specifically, but
their parent is shared).

You can't use any of these IP blocks if you don't first power up
TOP because of the physical layout.

This is exactly identical to the MDSS case.
I was hoping this was clear after N other similar threads.

Konrad

