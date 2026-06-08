Return-Path: <linux-media+bounces-64117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JTD8DL1VJmoUVAIAu9opvQ
	(envelope-from <linux-media+bounces-64117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:40:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7EF652DCA
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:40:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="oST/aAnL";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="X/XEnh5U";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64117-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64117-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 914BC302F24C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF7A372EC5;
	Mon,  8 Jun 2026 05:37:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E4365A14
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:37:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897074; cv=none; b=MOfhw9QowO+pj6c8CA4GvdBHfndrrzOoWY5/Xi5hizoALSGJ1gdMp3/c7kz+ARqKapahUweW5b0833tQD/13WglOLIq0Vixy73CcPvSicknDcjn9ZJXhxk/JJ83WzuXOlteQo7gdOtfLaX3krxvPcQlEZeHEO3zglfUNc0C6A0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897074; c=relaxed/simple;
	bh=k433kSHHswEjNIEXyatPSmR6tDkM60pP7cSVKDezh9s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pZWawEmkPxHitfHtaMxAg7bCWY2gVpgOJNeXaLqAWqAYWElQGADKv9rKea73r7Jgp7ChhWMHlrXNW75JUmJ3GKz1VQq36FX1X8S+r/VkPvo4suoZ+1WO1ldVzv79LtJTU63EeytMfeZ9d0MfOhelHwaYHNF18DSw24LGrOfDyPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oST/aAnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/XEnh5U; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FrI12026649
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=; b=oST/aAnLGnFERZ1w
	jAI97r3p5duMRn/uzxoMzgeeRgGSVPzsdQtl8YGK+t1LCHhfvlSdPgRPoGHysNiB
	TjnzyPbV6HATGBl92snWV6tp515SdKfmLLJRNxhsiU61x5/bmQGXPZvWcF4X2eWJ
	Pler0N+8Dy+5GhlaNh0eT9TggmmLnLiAJ7CGCB4wazTojEtbWtx/UR5PoS437R5w
	IwOMO50d7i3DhoBnwK1GPRAj38xqhoUn2c9wnSYVurG604qUDgopsP3VqRIqBIXn
	UzCNsunsu50J27UQLBlr1/32uGmhe3dhAaZWagXc6hlUHhqmwmkniWHzgeg2I6qB
	Kq1Kuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4x9us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:37:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso5516979a91.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897071; x=1781501871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=;
        b=X/XEnh5UjVKwGrpZX9YUKgoLE8Mi92V095wmODe/yiTEEx+u7nN93ID+4ouO7NsPdC
         azUB0lox8DdZRo9JBa1hAjZjboDWGv3jP9icyJ2hXFM1rV6SCFtu/gTKhLJsWiixHLtQ
         VsI74atZV4EyRKfEi7jjVBw4I87mC36DzwklN2ajF4vJCYDRtuI8TvcrU3fCoh/2rOHH
         EdsElKmgjhCkMB3hw/As7QWbc6Xb3UD2HRbMi1SLTLNZWGosKXVIYH/4fgAr8k6+8Cg5
         omnLzVQOXz/+tVYMRB6n4IHpUmwrX1ZB6yU/KQfKLjr6rlANyVvnp1pvfdzY1OixXd99
         pNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897071; x=1781501871;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=;
        b=mXXU6Z+zgydtPjCvPZ1v+4WJu3fFad+gHf59RXyD23AMKAR+f+AGhtcnXhDsXhPRAc
         oAvCVE1hAXCiOGp0w69OWc93cFRGdfM8W2GXOkHWo8/GFnkNJnRRgMXPwBV6lL8M+Btv
         Nx7wSbZzBThZ4aEMyxV02zxiGAd2ls6XNn+rWIabahAhkQtQ+whGXFGLR03bHvj+U64r
         UkyPZgku5wBx8WyJZkXJK12D18W+hc7DTDMxw6hvawVmjjDzxbNe2NsxpQ2KNcCcaeFa
         zpxpgm4sw8g0y2WVaFqLQzCDNtCatXvqqZ5bXbLDAnISKCEWYggXHqr0VLhOd9JtDAY3
         IARQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SaPfB2JWW3O3xrlM3W5xeNOjk0lJ9PEHf7beOvtp7dGwKFjUgDrFCnb56k3mKq09PUc9W6cEdbvbD6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZKJY909vf5wr+D/KHFYksJs810zbONbNT52yw5nCpy95Xm7o
	lRx5E+Sqg2zHTHObWK/TAfMxB2NHps843cyPvYkB4Ac2DbUXo40Y2GZMJDyTmzSH3dWuxqnv9cf
	6ZRSqU9SAzuXEYRQ5WS2gU9rjM/h21mV5aqH3e5/kfpxC67d2IWixAmLpoUGWsgIbLQ==
X-Gm-Gg: Acq92OFi9+r7Mp1IkmwprKYlZfxXmGmD0RJiKhoj2CyIOWnaUclaf+08RfS8nd+PtnY
	DfwMPnlWe7L8eHIxoXtWuPJD+KsfJgCXb8wZuMatK1u8k3nPGvcZEmkKDHk5C15P1pThLPdy5TC
	SqiNmr9Zv5WxvWnT0zHtIcG7RQifjNtobEHsFwVipZbnqC+PUoWQE1xDEOcyqsM+gCHquHKjpB0
	f+EZEp+q+3H07me2ljX4tJAGysL9uBbTtAZL9p0l63dC6xQpCF/nCTdu5TfBj2V80n4O2V7Wy9p
	wLkuH09ENmg29oOPamIEztqszfxxzWxx03H45s+n3pXgsuURYKGv59IhwviTqSqQvJu63kxF/Lf
	Wn83ClEu0NuFqOhtlAekAOcHSCC30Jb4abf7wCTRk59d6HIFimuf7rBNjDipLmjW3
X-Received: by 2002:a17:90b:3d01:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-370f0095c8emr14813206a91.15.1780897071388;
        Sun, 07 Jun 2026 22:37:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3d01:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-370f0095c8emr14813176a91.15.1780897070991;
        Sun, 07 Jun 2026 22:37:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e7b53sm14471868a91.14.2026.06.07.22.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:37:50 -0700 (PDT)
Message-ID: <e1a47ff2-1849-86b5-5a3d-bd820d535b1b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:07:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 02/12] iommu: Add iris-vpu-bus to iommu_buses
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-2-afaa55d11fe0@oss.qualcomm.com>
 <20260603143418.DCC751F00898@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143418.DCC751F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d5DjpxlSsVPenYBMLhtZ01tQfHGpprMV
X-Proofpoint-GUID: d5DjpxlSsVPenYBMLhtZ01tQfHGpprMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OCBTYWx0ZWRfX/BTRRcPYfLAq
 2a8pXlStnNtYTfjf67MOo8MIvLUR190z2/oNimzUWcF9FSdn3XjG8UYbAXzO1zuax2o4rGPopex
 vB9+32qmkNYnplqRHe+EFpbfDecUNa/LUsloqvHKdhN/pGOB/QMKwAbN42zH1xdg0k1J6+qSP9H
 N/Sw3UXoE5lAhHxC+SZx9WTc1qQqWAQvH+vBqHxgu71COXadWO/FmzIv3jqPTC7YIJSp0dcGMkm
 TmqZAZAQxYsKiEfLlngHhub7kfWbSRUWn+yznxfntBMt9zt2Vb7e9OelqEhi36bNxwKkqkj2385
 n8yKNIxveTfSjK32nxrdr5KLew7KQ/ksxzYpOl6tHt9VxmLmT0HsJkSxFDKlhvj6ZnnTJqeWW4J
 kYkcq+gSsmREE8MnLJx+qRKCMvMVfhtDamOWdwK5nRAZFiuJZemSTh+nfgqPIdoWnThCn9t6EQc
 u3vdlXsHsQ1vWa/rpZA==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a265530 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gQWBvvTIlS5GmZPSv-0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64117-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A7EF652DCA


On 6/3/2026 8:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Adding a vendor-specific media driver virtual bus (`iris_vpu_bus_type`) to the core `iommu_buses` array is an architectural layering violation and abuses the device model.
> --
>
> commit 237441c1b5f7b6f9432bcd95591b1105966e57b0
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> iommu: Add iris-vpu-bus to iommu_buses
>
> Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
> subsystem so that the bus notifier callbacks are registered for
> device addition and removal events.
>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index e8f13dcebbde5..fe51600953ceb 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/bug.h>
>>  #include <linux/types.h>
>>  #include <linux/init.h>
>> +#include <linux/iris_vpu_bus.h>
> [Severity: High]
> Does this introduce a layering violation by pulling a vendor-specific media
> driver header directly into the core IOMMU framework?
>
>>  #include <linux/export.h>
>>  #include <linux/slab.h>
>>  #include <linux/errno.h>
> [ ... ]
>
>> @@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
>>  #ifdef CONFIG_CDX_BUS
>>  	&cdx_bus_type,
>>  #endif
>> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
>> +	&iris_vpu_bus_type,
>> +#endif
>>  };
> [Severity: High]
> Is it appropriate to add an artificial software bus created inside a single
> media driver to the system-level hardware interconnects list here?
>
> The iommu_buses array is generally intended for system-level hardware
> interconnects like PCI or Platform buses. Modifying the core framework to
> accommodate a vendor driver's private bus seems to couple subsystems together
> incorrectly.
>
> Additionally, because CONFIG_QCOM_IRIS_VPU_BUS is defined as a bool in the
> driver's Kconfig and registers its bus using a postcore_initcall, this forces
> the custom bus code into the core kernel binary even when the media driver is
> built as a loadable module, leading to kernel bloat and abusing core
> initialization levels.

iris-vpu-bus will be compiled along with kernel. This bus is used the external
loadable modules. So here bus is not an external module.

> Can generic solutions be used instead, such as using standard platform_device
> child nodes or creating a standardized context bus?

platform_device child nodes method is not accepted and got suggestion to create
a custom bus.


