Return-Path: <linux-media+bounces-53311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mbFYJ/ADnmlaTAQAu9opvQ
	(envelope-from <linux-media+bounces-53311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 21:02:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED33318C417
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 21:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F7CA3039F53
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 20:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D1B3346A5;
	Tue, 24 Feb 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T62reOh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyPm+joS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E76333729
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771963373; cv=none; b=pqFB8ITAfompkC5W2mJY/ZwYuJKGATqsRceqlteejTCMLQMQ2tfto9qZNBZjn6q1wGUSv9in4GthENIH/7Bz+OTQso1mkye1LQG+M1GQwRY7woKle2RT6OcQjoyTaCSKmk9FQpO3b0ioxQivTyH/sjKD91bpyPkOsAwkIlj7dDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771963373; c=relaxed/simple;
	bh=LVF/VJJ671oho7Ac1w4naGvEe8dIhrChO+GviotImaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1pbmZx7dzZ6U1grtEmdB/losIGxvpWLwnNN51njxeMyWXnmrg2UvhyNV9Nmr0Fq8i1CHS98Ni0ZMPqmhE2dV5A5nBTq6q1Hl4hgcqan9ZC8u5mzoacmJ0sM2MXOU7OzVEGVOc6b/3ovIaOuhCRKNOfRG/XvetAPVDwJdw72jnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T62reOh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyPm+joS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OFlX9L4044762
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 20:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h8ypFviecW63cpAMAxl5bQgu3NIwtmHQtlqFI2KPQOg=; b=T62reOh3pJs54tff
	5azTeiXezUrooBzNMnnxrRsMSxi0bWEk+r7ntPC1aljx3v3NIQuoh0gyXfAh6ZUx
	ysnmIfEqt0s6tp+IVWL8b1jWblpTSEoqJ8V/8K9EtJBASL8F3hq/iu0OBqdKgbId
	hd/Qv0INXdKzfaiC6PIxbknbmOqAWoBEc2w01VS3KaG0KcZTN+tuQ619GT3ui+ow
	FwZ0fLISzNs7jrQbgQtVTVacu1ftBYweWR5HaLzmGviVF9EhfTmSdoD0jjZBzaM+
	N0Mp+30wazW++07priOG0POSXUvifJGoqi01qx8ysmDH/XyDSwaLRWSJ47ECfsRt
	BkgTEw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chexegxgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 20:02:44 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6798747187eso95870451eaf.1
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 12:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771963363; x=1772568163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8ypFviecW63cpAMAxl5bQgu3NIwtmHQtlqFI2KPQOg=;
        b=UyPm+joSS8Ed9qB60Gloiz2PN2tZhMOqq+dQzkk/TRafleYOlfMd5ZdQOp6jC50Vuu
         Gq1xlfDmstRU6rhTpihHAS0XYxntyqM3M5YC7M2O2b2+IiVXDUX2uKypf0ZXsr1V/hL3
         g7WWovTdgxEwPNeJ+zmB5rA+qcIWTKJPjrPxST9NZCYt2kw5OEFubjXk8xXcK+2HMhKj
         Bhd/E4owC+v+59drSkIvhpuJVanXcO0JXaCq3YHTXn5q9zSB+79SqUth/1I41RQoDiz6
         41TUZLwVskGJGiV/Jw26Bx5JJS+MZcRgwOAS/r5XxDaBwjuOjC1BmXAU+O52IZZmXmw/
         Vrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771963363; x=1772568163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8ypFviecW63cpAMAxl5bQgu3NIwtmHQtlqFI2KPQOg=;
        b=ebvbte6jNnoIEOoxsOKO3092jjApAn5p9ixcCKcaZ/tQeQTyqTnqiaD4843Z7NPij+
         u/9VUiVjtredvUlitDdjDob1slwhu+4HNCfo3Oq44oibJb3Me39L7Onfkvgb1f5BvGjv
         j2Dd1NK5rcI/Pgt9wUgccBEJ4x9nukqA8n4iI1dmpBEjYgmKgWNUPX+qOmp/3MNb4dtb
         /DqzU9I0fEFMVvL7fr4qWoNejAsOG7u56J+HVhc60vqzDEmbuHpFrisUAnSUjbVl/cRu
         MLhfUOXYEfkUC/X7mlFXonUbnHFtMjmZr/D7WiwbU64v1H+FMwxoRXSz3vg7kYmK5Ha0
         FqPg==
X-Forwarded-Encrypted: i=1; AJvYcCV9ixdb4F8GqOc7+M6YwIwE/iyHPYuzKH0fprHMasHAzHQilcx1DjiQ3/1J5AH3mIuCLi7Qzq0dZA0ZqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOCqA8B2IKuNMy9HnB/TmcnuEnlDmTC5Rh107Yvq38Zy5LoI9
	JepAhy++2cWtCfZOob8uf3a+Srz+6KSdOyh1QDv8KQJLkrxbegNNzMgNQiovrDZdzzgkTUFFqNf
	v/vRgK1D7xxxRJkwGRkGAX5OfdlGL202/MxIgGCyWjwTpG2AtTFETw7Ni7q3DkGxk
X-Gm-Gg: AZuq6aLnDGhCroJFOMYj6ym4kWFnT9QpCuFOCNk7g3sHHfTzlyXZNxBVBohcs7cz8Vs
	lJ8rCkg+4u8cC2D214sqSwSjmJbugPTEgH38xvGMXteyVRm3yj1xMdXO0g0MLR03d8TAYLFjktU
	mFuATFiKby1Tnu/Qj7MmZpe6cj2GsdUoTfkVHlnzdNkxh7H/knUewYylcrhgws8vJwozfZxDsgI
	zeCLEbpMpf84ijFu8sXtuZtlghd4lAoby38qrDcmlLqYCT3rwgliwPMnVVnomQzybD8gb3067Z9
	3h04R2p2JsoiUDABN5vrSRsUQ5o2TmtNvCRXaEQAkVxJyjhWKSvR5Wu1XaCABZTOq52GPRztp8P
	9JhJ023m50jjIVfBIwqoLa7r8ASn0IBCX0kYLCeWDCzf0/ylQEXxgAZc=
X-Received: by 2002:a05:6820:820:b0:672:7c0d:5602 with SMTP id 006d021491bc7-679c4276fd1mr7440895eaf.27.1771963362948;
        Tue, 24 Feb 2026 12:02:42 -0800 (PST)
X-Received: by 2002:a05:6820:820:b0:672:7c0d:5602 with SMTP id 006d021491bc7-679c4276fd1mr7440847eaf.27.1771963362110;
        Tue, 24 Feb 2026 12:02:42 -0800 (PST)
Received: from [10.224.242.57] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a077asm3874609a12.4.2026.02.24.12.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 12:02:40 -0800 (PST)
Message-ID: <8f4ccb49-57f1-454a-a404-85035a2bb1a8@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 21:02:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] virtio-video: Add virtio video device
 specification
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
        Trilok Soni <tsoni@quicinc.com>, Matti Moell <matti@qti.qualcomm.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com>
 <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
 <SJ0PR12MB680603C30AB26E93ECB27E2FDC6FA@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
In-Reply-To: <SJ0PR12MB680603C30AB26E93ECB27E2FDC6FA@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE3MiBTYWx0ZWRfX9l3cPl0hWYJV
 wZP6lBeZ+XnpEQOcJvHCD3AXFnTQHhVzJqimOJmhPNnRRZ6B1x0xxbdWA8hfJoHJEJkakgv5h9u
 8ZXiAN20wucbYHag3b+ejNLyoQFa/tFNE9B0tgTAYvXlUsb6Ik1WRkf7oUGacJn33jPNxMtB+D0
 uWZaOSannpMbVYnVxXHQ+KFpMxebizr2JOD6g9tHXdiYyAW5L/EUHaAOMNlW95o5X9j81bqmROe
 cHosXK8mcf3YXdwgRvKbBw3BYTScOmoHa8Ul5u4K07B9GQo4BvQf+I+iFTlfomB8tX1kmyJC0YM
 K5sufpNywGytYYLvk6CBD4+Rqs0auGDiz54NaKeQphPdD9/t0OGC/3cdw6g/pDM2/SXPr+TvThT
 hZvTSqSr0QGRyFT3VdB6itvsttoU/U0qQS6crfhC53rKwHwltiylRR5VN97QXf8rh2UajWeRciw
 tAFi+vowWU/8LJ1e+RQ==
X-Authority-Analysis: v=2.4 cv=V85wEOni c=1 sm=1 tr=0 ts=699e03e4 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bs-e4Z8cAAAA:8 a=8-l3GZ-Fe_HqYeuz0IwA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=YFpLQiK6rFjqGb8m0bXF:22
X-Proofpoint-GUID: -vsjf409MHuk9SZ6PJYzv_1EmVfmp6yb
X-Proofpoint-ORIG-GUID: -vsjf409MHuk9SZ6PJYzv_1EmVfmp6yb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240172
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,collabora.com,ideasonboard.com,gmail.com,quicinc.com,qti.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-53311-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensynergy.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.gordeev@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED33318C417
X-Rspamd-Action: no action

On 15/02/2026 11:49, Parav Pandit wrote:
> 
>> From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
>> Sent: 13 February 2026 02:23 PM
>>
>> From: Alexander Gordeev <Alexander.Gordeev@opensynergy.com>
>>
>> Add the specification of the video decoder and encoder device, which
>> can be used to provide host-accelerated video operations to the guest.
>>
>> Signed-off-by: Alexander Gordeev <alexander.gordeev@opensynergy.com>
>> ---
>>  conformance.tex                           |   12 +-
>>  content.tex                               |    1 +
>>  device-types/video/description.tex        | 1592 +++++++++++++++++++++
>>  device-types/video/device-conformance.tex |   22 +
>>  device-types/video/driver-conformance.tex |   20 +
>>  introduction.tex                          |   21 +
>>  6 files changed, 1664 insertions(+), 4 deletions(-)
>>  create mode 100644 device-types/video/description.tex
>>  create mode 100644 device-types/video/device-conformance.tex
>>  create mode 100644 device-types/video/driver-conformance.tex
>>
>> diff --git a/conformance.tex b/conformance.tex
>> index 9af31e2..f34e600 100644
>> --- a/conformance.tex
>> +++ b/conformance.tex
>> @@ -37,8 +37,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>  \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
>>  \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
>>  \ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance},
>> -\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
>> -\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
>> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance},
>> +\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance} or
>> +\ref{sec:Conformance / Driver Conformance / Video Driver Conformance}.
>>
>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>>    \end{itemize}
>> @@ -68,8 +69,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>  \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
>>  \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
>>  \ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance},
>> -\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
>> -\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
>> +\ref{sec:Conformance / Device Conformance / Media Device Conformance},
>> +\ref{sec:Conformance / Device Conformance / RTC Device Conformance} or
>> +\ref{sec:Conformance / Device Conformance / Video Device Conformance}.
>>
>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>>    \end{itemize}
>> @@ -170,6 +172,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>  \input{device-types/spi/driver-conformance.tex}
>>  \input{device-types/media/driver-conformance.tex}
>>  \input{device-types/rtc/driver-conformance.tex}
>> +\input{device-types/video/driver-conformance.tex}
>>
>>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>>
>> @@ -264,6 +267,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>  \input{device-types/spi/device-conformance.tex}
>>  \input{device-types/media/device-conformance.tex}
>>  \input{device-types/rtc/device-conformance.tex}
>> +\input{device-types/video/device-conformance.tex}
>>
>>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy
>> Interface: Transitional Device and Transitional Driver Conformance}
>>  A conformant implementation MUST be either transitional or
>> diff --git a/content.tex b/content.tex
>> index 5de811f..0c13f68 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -835,6 +835,7 @@ \chapter{Device Types}\label{sec:Device Types}
>>  \input{device-types/spi/description.tex}
>>  \input{device-types/media/description.tex}
>>  \input{device-types/rtc/description.tex}
>> +\input{device-types/video/description.tex}
>>
>>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>
>> diff --git a/device-types/video/description.tex b/device-types/video/description.tex
>> new file mode 100644
>> index 0000000..8945e26
>> --- /dev/null
>> +++ b/device-types/video/description.tex
>> @@ -0,0 +1,1592 @@
>> +\section{Video Device}
>> +\label{sec:Device Types / Video Device}
>> +
>> +The virtio video device provides support for host-accelerated video encoding
>> +and decoding.
>> +
>> +\subsection{Device ID}
>> +\label{sec:Device Types / Video Device / Device ID}
>> +
>> +50
>> +
>> +\subsection{Virtqueues}
>> +\label{sec:Device Types / Video Device / Virtqueues}
>> +
>> +\begin{description}
>> +      \item[0]
>> +            commandq - driver commands
>> +      \item[1]
>> +            eventq - device async responses to commands and standalone device events
>> +\end{description}
>> +
>> +\subsection{Feature bits}
>> +\label{sec:Device Types / Video Device / Feature bits}
>> +
>> +\begin{description}
>> +      \item[VIRTIO_VIDEO_F_ENCODER (0)]
>> +            The device can encode video.
>> +      \item[VIRTIO_VIDEO_F_DECODER (1)]
>> +            The device can decode video.
>> +            % Use-case: the device can support both encoding and decoding, so having both
>> +            % here can save resources.
>> +      \item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (2)]
>> +            Guest pages can be used as the backing memory of resources.
>> +      \item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (3)]
>> +            The device can use non-contiguous guest memory as the backing memory of
>> +            resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES is also
>> +            set.
>> +      \item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (4)]
>> +            Objects exported by another virtio device can be used as the backing memory
>> +            of resources.
>> +      \item[VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER (5)]
>> +            The device releases an extra empty output buffer after a drain or DPC so that
>> +            the driver can send a buffer with V4L2_BUF_FLAG_LAST set in the V4L2 way.
> This does not seem relavant to the video device.
> It should not be attached to any V4L2 implementation.
> Can you please craft it differently?

Hmm, do you mean renaming the feature?
The thing is that V4L2 driver is sitting on top in many cases and V4L2 needs an extra output buffer to pass the DPC/EOS events. But this may be not necessary in other implementations (e.g. Windows). So this feature helps here. V4L2 is mentioned in many places here and also some definitions are borrowed/referenced from it. It was agreed during the draft v6 review that this is ok in general. So I'm not sure what do you want me to do here.

>> +\end{description}
>> +
>> +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>> +
>> +The device MUST set at least one of VIRTIO_VIDEO_F_ENCODER or VIRTIO_VIDEO_F_DECODER.
>> +
>> +The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
>> +VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would
>> +mean that no memory can be used at all for resources.
>> +
>> +The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it also sets
>> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
>> +
>> +\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>> +
>> +The driver MUST negotiate at least one of the VIRTIO_VIDEO_F_ENCODER and
>> +VIRTIO_VIDEO_F_DECODER features.
>> +
>> +The driver MUST negotiate at least one of the
>> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
>> +features.
>> +
> You wouldn't need virtio_object feature bit. It should be covered using the capability.

Well, Michael says it is ok 

>> +If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
>> +VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
>> +contiguous memory for all the buffers it allocates.
>> +
>> +\subsection{Device configuration layout}
>> +\label{sec:Device Types / Video Device / Device configuration layout}
>> +
>> +The video device configuration space uses the following layout:
>> +
>> +\begin{lstlisting}
>> +struct virtio_video_config {
>> +        le32 max_streams;
>> +        le32 caps_length;
>> +};
>> +\end{lstlisting}
>> +
>> +\begin{description}
>> +      \item[\field{max_streams}]
>> +            is the maximum number of concurrent streams the device supports.
>> +      \item[\field{caps_length}]
>> +            is the minimum length in bytes that a device-writable buffer must have
>> +            in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
>> +            \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
>> +\end{description}
>> +
>> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Video Device / Device configuration layout}
>> +
>> +\field{max_streams} MUST be positive.
>> +
>> +\field{caps_length} MUST be set to the response size of
>> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
>> +
> This plumbing can be easily done using 'Device and driver capabilities' located in the 'Group administration commands'.
> Please rework the patch to use the existing basic facility.
> This can also possibly eliminate plumbing device specific command q.
> More below.

I'm still learning about capabilities and admin commands, so please correct me if I'm wrong.
Here are some considerations:
1. AFAIU capabilities and admin commands need an admin virtqueue. The latter depends on the VIRTIO_F_ADMIN_VQ feature. What if the device doesn't support it? Also it looks like the admin virtqueues are only defined and implemented in Virtio Over PCI at the moment, "reserved for future use" in Virtio Over MMIO and in Virtio Over Channel I/O and also not available in vhost-user. For us this makes admin queues unusable for now.
2. The virtio capabilities that you mention seem to be about enabling and disabling certain functionality based on a bitmap, right? (Still looking into the flow filter example, which seems to be more complex.) The virtio-video caps are more like an attempt to represent a graph of dependencies between different coded and raw formats, resolutions, etc. For example there will normally be multiple TLVs with the same types (coded and raw sets) "linked" to each other. I'm not sure this maps well into the existing virtio capabilities.
3. If this is really targeted towards SR-IOV maybe it is better to keep it this way. I mean we may need admin commands to create a virtio-video device per guest VM, so maybe using the same admin commands + some device-specific commands inside each device could be confusing. The nesting actually continues here, because virtio-video streams have shared buffers called "resources" (probably these should be renamed).
4. Also I'm not sure how does it actually improve the spec/implementation.

>> +\subsection{Device Initialization}
>> +\label{sec:Device Types / Video Device / Device Initialization}
>> +\begin{enumerate}
>> +      \item
>> +            The driver reads the feature bits and negotiates the features it needs.
>> +      \item
>> +            The driver sets up the commandq and the eventq.
>> +      \item
>> +            The driver reads the \field{caps_length} field of the configuration
>> +            space, prepares a buffer of at least that size and sends the buffer on the
>> +            commandq with the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
>> +      \item
>> +            The device sends a response over commandq to
>> +            VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS via used descriptors provided with the
>> +            command.
>> +      \item
>> +            The driver receives the response from the device, and parses its capabilities.
>> +\end{enumerate}
>> +
>> +\subsection{Device Operation}
>> +\label{sec:Device Types / Video Device / Device Operation}
>> +
>> +The device supports opening and operating a number of parallel streams up to
>> +\field{max_streams}. Each stream has three internal device queues: mainqX,
>> +inputqX and outputqX, where X is the stream id. Each stream command has a
>> +field that dispatches the command to the specific internal queue.
>> +
> If these queues are internal to the device it does not need exposure in the spec here. If they have a meaning to the driver,
> Than keyword 'internal' should be dropped and rephased.

As Michael already assumed the implication is that within each queue commands are consumed in order. On top of this there are queue priorities: mainq has higher priority than inputq and outputq. This enables resetting inputq and outputq or setting parameters out of band.

>> +% Use-case: there might be different real-time requirements for different
>> +% streams, so more virtqueues can be added in the future if necessary.
>> +% The internal queues don't change, the data formats don't change, only the
>> +% mapping of streams/internal queues to particular virtqueues changes.
>> +
>> +The mainqX is used to open a stream with VIRTIO_VIDEO_CMD_STREAM_OPEN,
>> +close a stream with VIRTIO_VIDEO_CMD_STREAM_CLOSE, reset inputqX or outputqX
>> +using VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, set some of the stream parameters out
>> +of band with high priority with VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, unblock
>> +the outputqX with VIRTIO_VIDEO_CMD_STREAM_UNBLOCK if it gets blocked for
>> +format negotiation.
>> +
>> +The inputqX and outputqX are used to queue input or output resources using
>> +VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE. Additionally inputqX is used to set input and
>> +output parameters using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, to complete
>> +processing of all queued input resources and make the resulting output
>> +resources available to the driver using VIRTIO_VIDEO_CMD_STREAM_DRAIN.
>> +
>> +All the stream commands start async operations, return the results
>> +using async responses over eventq.
>> +The eventq is used by the device to send the device's async responses to
>> +stream commands and the device's standalone events.
>> +
>> +% This way eventq becomes the single source of truth about the device's state,
>> +% the driver doesn't have to tediously synchronize commandq's and eventq's
>> +% used queues the way it was necessary in the past (similarly to V4L2's DQBUF
>> +% and DQEVENT). One more benefit is that commandq is processed fast and
>> +% strictly in order, so commandq descriptors exhaustion should never happen in
>> +% practice.
>> +
> Video device should be implementable without any V4L2 binding/description etc.

Well, as I wrote above some V4L2 definitions are used anyway. It was agreed that this is fine and that we can have V4L2 headers as normative references during the v6 review.
In this draft I decided to add some comments describing the reasons behind some design decisions because I keep forgetting them myself. I can edit this particular comment though of course.

>> +Parameters allow the driver to configure the stream including setting up the
>> +resources. Available parameters depend on the device type, see
>> +\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
>> +
>> +A resource is a set of memory buffers that contain a unit of data that
>> +the device can process or produce. Most resources have only one buffer,
>> +raw frames using a multi-planar format can have several.
>> +Input resources are filled by the driver with compressed (coded) video data
>> +for a decoder and raw frames for an encoder, output resources are filled by
>> +the device as the result of processing the input resources with decoded raw
>> +frames for a decoder and compressed (encoded) data for an encoder.
>> +Resources from inputqX and outputqX are consumed independently, not in pairs.
>> +One input resource can result in zero to many produced output resources.
>> +A decoder device dequeues the output decoded frames in presentation order.
>> +An encoder device dequeues the output decoded frames in decoding order.
>> +The driver can reuse a queued resource after receiving a corresponding async
>> +response. Dequeued output resources can still be used by the device as
>> +reference frames, so the driver can't write to them.
>> +
>> +% TODO: maybe send the second RESOURCE_QUEUE async response, when the dequeued
>> +% output resource is not used by the device anymore and therefore becomes
>> +% writeable?
>> +
>> +The device can detect standalone stream-related events: errors and dynamic
>> +parameters changes that require intervention from the driver (e.g.
>> +reallocating backing memory of output resources to fit the new parameters).
>> +The events are signalled on the eventq, see
>> +\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>> +
>> +\devicenormative{\subsubsection}{Device Operation}{Device Types / Video Device / Device Operation}
>> +
>> +The device MUST set to zero all unused, disabled or padding bits in its
>> +responses.
>> +
>> +\subsubsection{Device Operation: Command Virtqueue}
>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
>> +
>> +This section lists the commands that can be sent by the driver to commandq.
>> +
>> +Different structures are used for each command and response. A command
>> +structure starts with the requested command code, defined as follows:
>> +
>> +\begin{lstlisting}
>> +/* Device */
>> +#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS      0x100
>> +
>> +/* Stream */
>> +#define VIRTIO_VIDEO_CMD_STREAM_OPEN            0x200
>> +#define VIRTIO_VIDEO_CMD_STREAM_CLOSE           0x201
> You can craft the stream using a existing basic facility of resource object.
> Where each stream is just a resource object, that be queried or modified.

Replied about the admin commands above.

>> +#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS      0x202
>> +#define VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS      0x203
>> +#define VIRTIO_VIDEO_CMD_STREAM_UNBLOCK         0x204
>> +#define VIRTIO_VIDEO_CMD_STREAM_DRAIN           0x205
>> +#define VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET     0x206
>> +#define VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE  0x207
>> +\end{lstlisting}
>> +
>> +Stream commands start with a header:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_VIDEO_QUEUE_TYPE_MAIN    0
>> +#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT   1
>> +#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT  2
>> +
>> +struct virtio_video_stream_cmd_header {
>> +        le32 type; /* One of VIRTIO_VIDEO_CMD_STREAM_* */
>> +        le32 stream_id;
>> +        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* */
>> +        le32 async_response_cookie;
>> +};
>> +\end{lstlisting}
>> +
>> +\begin{description}
>> +      \item[\field{async_response_cookie}]
>> +            is an async response cookie provided by the driver, that allows
>> +            to relate an async response to the previously submitted command.
>> +\end{description}
>> +
>> +\subsubsection{Device Operation: Event Virtqueue}
>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
>> +
>> +The eventq is used by the device to send async responses to commands queued
>> +by the driver on commandq and standalone events. Stream errors and dynamic
>> +parameters changes are caused by changes in the device's state, not by
>> +commands, still they are delivered as responses to implicit
>> +VIRTIO_VIDEO_CMD_STREAM_CLOSE and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
>> +respectively.
>> +
>> +Events start with a header:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_VIDEO_EVENT_FLAG_ERROR              (1 << 0)
>> +#define VIRTIO_VIDEO_EVENT_FLAG_STANDALONE         (1 << 1)
>> +#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED           (1 << 2)
>> +#define VIRTIO_VIDEO_EVENT_FLAG_BLOCKED            (1 << 3)
>> +
>> +struct virtio_video_event_header {
>> +        le32 event_type; /* VIRTIO_VIDEO_CMD_STREAM_* */
>> +        le32 stream_id;
>> +        le32 async_response_cookie;
>> +        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
>> +};
>> +\end{lstlisting}
>> +
>> +\begin{description}
>> +      \item[\field{event_type}]
>> +            is the type of the event.
>> +      \item[\field{stream_id}]
>> +            is the ID of a valid stream.
>> +      \item[\field{async_response_cookie}]
>> +            is an async response cookie provided by the driver, that allows
>> +            to relate the event to a previously submitted command.
>> +      \item[\field{event_flags}]
>> +            is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
>> +
>> +            \begin{description}
>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_ERROR]
>> +                        is set if the command finished with an error due to an
>> +                        invalid argument or for other reasons.
>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_STANDALONE]
>> +                        is set for standalone events, see
>> +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
>> +                        is set if the command has been canceled by another
>> +                        command, that has higher priority. Doesn't make sense
>> +                        for standalone events.
>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_BLOCKED]
>> +                        is set if the command triggered a block on the
>> +                        outputqX to allow output format negotiation.
>> +                        When the negotiation is finished the block has to be
>> +                        removed using VIRTIO_VIDEO_CMD_STREAM_UNBLOCK
>> +                        command, see
>> +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}.
>> +            \end{description}
>> +\end{description}
>> +
>> +The particular data structure representing the event is selected according to
>> +the \field{event_type}.
>> +
>> +\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device Types / Video Device / Device Operation / Device Operation:
>> Event Virtqueue}
>> +
>> +The driver MUST at any time have at least one descriptor with a used
>> +buffer large enough to contain a \field{struct virtio_video_event}
>> +queued on the eventq.
>> +
>> +The driver MUST NOT put device-readable descriptors into the eventq.
>> +
>> +The driver MUST account for the fact that the async responses to commands
>> +might come out-of-order (i.e. after other commands sent to the device),
>> +and that some of them can be cancelled.
>> +
>> +The driver SHOULD wait for an async response of command A, that caused
>> +cancellation of command B, before queueing the command B again.
>> +
>> +\subsubsection{Device Operation: TLV format}
>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: TLV format}
>> +
>> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS/
>> +VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS
>> +commands represent device capabilities and corresponding device parameters
>> +in the form of TLV (Type-Length-Value):
>> +
>> +\begin{lstlisting}
>> +struct virtio_video_tlv {
>> +        le32 type;
>> +        le32 length;
>> +        u8 value[length];
>> +};
>> +\end{lstlisting}
>> +
> All the caps can be crafted using existing capabilities infra. Please restructure the patch to use it.

Replied above.

>> +\begin{description}
>> +      \item[\field{type}]
>> +            specifies the type of data in \field{value}.
>> +      \item[\field{length}]
>> +            specifies the \field{value} size in bytes aligned to 4 bytes.
>> +      \item[\field{value}]
>> +            contains the data according to the type.
>> +\end{description}
>> +
>> +The following TLV types are defined:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_VIDEO_TLV_CODED_SET                1
>> +#define VIRTIO_VIDEO_TLV_RAW_SET                  2
>> +#define VIRTIO_VIDEO_TLV_LINK                     3
>> +#define VIRTIO_VIDEO_TLV_CODED_FORMAT             4
>> +#define VIRTIO_VIDEO_TLV_RAW_FORMAT               5
>> +#define VIRTIO_VIDEO_TLV_CODED_RESOURCES          6
>> +#define VIRTIO_VIDEO_TLV_RAW_RESOURCES            7
>> +#define VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES     8
>> +#define VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT   9
>> +#define VIRTIO_VIDEO_TLV_CROP                     10
>> +#define VIRTIO_VIDEO_TLV_V4L2_CONTROLS            11
>> +\end{lstlisting}
>> +
> You can use the 'flow filter' example of network device to see how to frame the individual or group of capabilities.

Checking it, thanks.

Kind regards,
Alexander

