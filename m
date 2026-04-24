Return-Path: <linux-media+bounces-59515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLe1IchG62lYKgAAu9opvQ
	(envelope-from <linux-media+bounces-59515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:32:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A491245D1EA
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1968630086B1
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C36371897;
	Fri, 24 Apr 2026 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6JWbiHr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJ00qwCE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A636BCF5
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026691; cv=none; b=uIuMDgpRTwmpdeur/qrQZhcGQKfOouQn1XmD7PuNfSe+honfM1VmpheSkrcCYGNJAi26oVxRWG+mHSDYJbW+o0llFCN+urKphpLY2A8jkWT8aV85ZMR+oIrtt2+n6epwXKLaAhUYRuwXcakqXqBliOVI62CmFyI7eh+Yf/4NEI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026691; c=relaxed/simple;
	bh=YMZ3usUZw9E0KGvmv+ttUT13W4jFnP9tOa+jYYoLrz4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k3H9JpXOcdBawg+SdULvcn3tMK0gGYiNb5fiAG8lLX9sE1tG3JUaEGE03CmOta2aZNRh/Gs+hSWDks3WGH5ETCEZWOiBMXtv7/SLur+aq0m+KH8R8QUxfaqUoC9vE9gR472smD1ZIruo9ig38ur9QH/l3sWTweixDgUIuvknOuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6JWbiHr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJ00qwCE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9SFkB756631
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 10:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=; b=R6JWbiHr1Hws4KFD
	P9EShqlovtNlSf0AByxhdLPJUa4yZ+U1z93tuKKYXReXUOh1Ohhj0F+mt6flshwR
	/tF0rSAvddvM7tnnRNYDFv3A9iHf1kV53PboqvNmAtcE591LZnrza8MHeK7UtcNz
	7ZOsi/JRnOGYSR7FEDqRo30aq6g1dO6aqVzP4lJDQtaHtAmCoHR2NBnkWM9ZsnaH
	jp4+B05Y44J3DavygqvO8iGPet00xALCA+r31AZfZC8hIbuVWCLFIeWfApqtVG2/
	v9sxRb5TtsM4rnbuuWDe01yfk7PpNWDZWXSqhooweWZSAg3Fseq3PT6bCsIOiDrn
	5FvXyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bkj7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 10:31:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso5115124b3a.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026688; x=1777631488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=;
        b=JJ00qwCE1Pbb7cZYucbR0EvFn47A0+Om/AwZBQTxo8oRdiq2wRUVkVmcJibUz0SouX
         0d4A9dxs498eMKFI//0KiCDXwRDy2PoS8fNu14hHsph2cRl2eOPn0Y1xYUiJgY1T3bZt
         auclNzQvhIXjEVFNtFe0ao2Mkn68a7Tfxj5yK94gqoBN015f5lvIn/AgmNo+MkboKVgd
         zMlBoTDzSi7W9Mn4GbTp4la2Xjrp+uUU+kOs7bPfYz00kWJtTIfrW68pEn5m9ZH8vVZw
         fG8qD2fXQQ8wSbh4APQGd6sjqiXSEAPUHbRZmlt4YmVF1xa35OfpgkyZ9G8l/UKgzSPS
         25pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026688; x=1777631488;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=;
        b=cYC/wK0j2oWmAXLqODX/DKhgtr+NbSFjX1KjxvIVlaUyDCBhMnwBfae+bs7nrqDisK
         3Yjw7SYns2x51O+heYvd6YQL8ayM3AO5anIV4XDpgQx/EG7a6jMTcDmzy2nEUkddGsbi
         khD7KoI+NWQrSDajR+qr7QBie8hplpwbS+v1IZJv4E1x1Se1pMiifIBamp1R3PZNquD8
         E71w4DJc/rtt9f/DQPpRSbH3fnLaflXx63kE4vAFI1cauZChIsJcYrYY+UhPQ9alOzrl
         XxhfA/66tnIs6qhfVhy5qsnZ5F8QNjnddT0laycZmKVfkZuyaxD+lnE1E8e1zHcwRwhG
         jJHA==
X-Forwarded-Encrypted: i=1; AFNElJ9jM6TilKGk59QbOs7SCTDIu/brFP9TU0yNGelMgcPAYyxLmKw/RrQPmi81iygColULErWG57VKuAUf7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdZA1l+cZWydjnEtbXuspyygJVa4I2t2BGhUIi84u+RaxDA0v
	FLfI7119xMHwCoDCFuDIdF3zq8KB9KWtO1VRQstAhARLXUhM/Q0BqgD/J160/zI7VG8BjOGggEv
	TRJnMnsa2Vf38niBt8vLL5Ro++GWmzWxB73cP7046zbcNw1WcM98PnNITVFINUt/q/w==
X-Gm-Gg: AeBDieuH1bPODxX7DZxpDAYANsS8XLwtw7sY9SfH25yvjXT5wp2AN1E79nDTCZEyBgg
	cVvBiUz4qw6zb1qoW3s4PV5z+5XsAuJVH0CNU5uZRbHfHe1yTUURZ0QGm0omfc+IBTPqaep/WLn
	1QNfFIAcfFtjMjXkFZTPcPPnTcE931uWREP6la/+6FQxLq2yF2fNxMao1jAtTD5gCkYLCQyJgla
	H5dm5C8K6ojkp5Zze51qQQaZOGqwMrGYNFVCmRFyUeFlWULF9AZ3qFU8RZ5GR9qykEPCNYACrON
	FgXYxuAoH6aBxhq4JakTiZjfZxpLMYdpqL850p8ETUB8FUi28Y9rS/1KrTuDswiQjPBCscfE7Cd
	XHRi3ZzJqoV+kY7LD0nk20X/g+cv5BAj4BiuGwrEgQgVC7Qvh+z2wkpTIiqnuQ/Mj
X-Received: by 2002:a05:6a00:2e9c:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f8c962033mr34808629b3a.23.1777026687569;
        Fri, 24 Apr 2026 03:31:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9c:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f8c962033mr34808559b3a.23.1777026686919;
        Fri, 24 Apr 2026 03:31:26 -0700 (PDT)
Received: from [10.239.60.18] ([106.192.26.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm25153536b3a.14.2026.04.24.03.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:31:26 -0700 (PDT)
Message-ID: <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 16:01:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
Content-Language: en-US
In-Reply-To: <2026042346-trustable-register-095a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX4LDQqJdQuldI
 lt7hPiGJ+Pf5MzMPu3OpBlKghHasgt4it11kT9K8DV79R5NXEOTjX/tumhAcnOBwtpPu++nzRYr
 NaDz2AQiAJmyTdud77UhcPUI7zf+ckYCHGyRVKBDXxpj0nlgRSr0Bah6vYCW980WsqttBWaKISt
 ZHAT68l4II1pQCAVMsxIhqLDD601DIl9kL4WP7QTNeigsYL6qh/EMta1N+ledEId55XaUUIL5WZ
 ufHPfNOqOHA/P+8iya0QZO4ejaUrDqXTd2WR35zvasDjbdix3ZoxMKNNxu1YbyERy3CYwegXQWO
 p3qKgWAgEe104Pv/4d308W2Wh5MLVMKVOhND/5oH46rEhkckWRBFTPOX9WaZyzMtrn28nxXK//5
 UX3JYSYL897P0K67PRX5FmQUUXdfJ20Lo8g/I9hmjWNMPm0rYQwZIBEbNprVbp4LhlYfSMJ8ca/
 Ao8pykvmsloQBjR/BQg==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb4680 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=K3jt3zD9TrcZs+Uyli2v9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=5Qc4mBPHLNQQZN8o19QA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: pXQX4QZRfyUKyeiJ05jOJbv23L2JvyRP
X-Proofpoint-GUID: pXQX4QZRfyUKyeiJ05jOJbv23L2JvyRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240099
X-Rspamd-Queue-Id: A491245D1EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-59515-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> When a driver needs to create virtual device at runtime and map it to
>> an IOMMU context for memory isolation, there is no common bus available
>> for this purpose. Each driver ends up implementing its own bus type,
>> leading to duplicated logic across multiple drivers.
>>
>> host1x driver implemented its own bus type to attach an IOMMU context to
>> a dynamically created device. The Iris VPU driver now has the same
>> requirement. Rather than duplicating the same bus logic again, a shared
>> bus type is introduced under drivers/base that multiple drivers can use
>> directly.
>>
>> The bus takes care of creating a device and attaching the IOMMU context
>> to it based on the client inputs.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/base/Kconfig            |  3 ++
>>  drivers/base/Makefile           |  1 +
>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>>  4 files changed, 107 insertions(+)
> as you can not have a device on multiple busses at the same time, this
> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> please add it to the bus that you are wanting it for.  It can't be a
> generic bus as that just doesn't work.
>
> Or what am I missing here?
>
> And why is DMA somehow "special" here from any other hardware attribute?

Let me give brief information which was discussed, in the initial series,
the iris VPU used platform bus for dynamically created devices and we got
the comment/suggestion from Robin to implement a proper bus_type with a
.dma_configure callback.

https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/

based on the discussion, implemented the dma_context_bus and used for iris
VPU devices instead of platform bus.

Here, the device have only one bus (dma_context_bus), not multiple buses.

Regarding the "DMA" naming, the core operation of this bus is its
.dma_configure callback, which calls of_dma_configure_id() to map the device
to a corresponding IOMMU stream ID. The name "dma_context" reflects this
purpose.

I am open to suggestions from you or Robin or anyone else, if there is a
better or preferred way to achieve this, I am happy to consider it and
rework the implementation accordingly.

Thanks,
Vishnu Reddy.

> thanks,
>
> greg k-h

