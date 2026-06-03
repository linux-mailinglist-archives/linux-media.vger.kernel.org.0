Return-Path: <linux-media+bounces-63552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OzyONuLtH2o9sgAAu9opvQ
	(envelope-from <linux-media+bounces-63552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:03:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34327635F8B
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:03:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Prg8qrAh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J2XYMu6G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63552-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63552-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D73E30BF59F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E603335BBB;
	Wed,  3 Jun 2026 09:00:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16234388A
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 09:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477222; cv=none; b=LgVhOyg2ihUSF5wQe/wuyY2JOYGa5WQHD9RtPZEPMbtw2MabnkKlLfC/bj523OGzEBhxNPMTZoQ+FiDxNIjn+PlQsEcjayVY23k0rSW9sLxNlRKvlMWZ4Qh7Qa3QajQR/AghBV4NmVJ+1+L4ToWMf3GVmmLrEmoS/V3vhFsTpoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477222; c=relaxed/simple;
	bh=HOm009KlM7gOb11vpXjzLh+oiI5o6wQhswTkvDu1g54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsYVl5wZOg61n9lLpeMJ+rttQo2Qs/toqDOSLc+uKe04FsXNi8W5EJ1G/A9Wqjiu6tyUsyVvndHGto+hUGgFAUMue+ADKi2iIzT6nyxtvb0V3qP1UNRVcCDrqbELnTUBleefxozMYcUTy58j+QxYQYHH+jxoMpAzq45Id1aITX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Prg8qrAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2XYMu6G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RJpu380230
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 09:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXQv8UIZDnB51xwqzRRnfaONheyvTz/2wDM2Pz33Ca4=; b=Prg8qrAhOSKP45X5
	570p3KoJc+XJNcMP8FDrzC1UcweLTlfeP0Pa83jhqCSyS/YL90+QGTAmd231j+C7
	5bxoJsUkl5eeRq9iiOrlbXXYgUOemwRjndx6uD3/GtBoQlgbSY1axSDSVBM4XpSs
	t7a4m+TJVNqX7VFmP8jwyF0Fm54c5a4xVciYvoFpumCX9A2x+djLfeKAEtxhcrm/
	ja7FZtiRZOnyYb/HRLQ4kdref0Qg0AiSQVQ52D7JGRphDhMu2Y2W8pjPVZcAXeph
	SuqVQtpfeBatGTg9jA8ijo1g2zlCotWtmKziffQg1eWQ/0Dn96U4zpdCxwJRwvmp
	D/q49g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhrmu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 09:00:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517582695d7so12073221cf.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780477219; x=1781082019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXQv8UIZDnB51xwqzRRnfaONheyvTz/2wDM2Pz33Ca4=;
        b=J2XYMu6GR7ae41Hl3awG+rVpSYXwR/C9sKNZWOa2Hv+/hZgvhdqchsd903re1Cbgyq
         cFbdCZlfJU3HUT0pW/wg41yhzWawi+moQ9bfLvf6OMUKZPSs4MXrH82nibIB+QPxs+rx
         I9zAL8HxUYuP6XdRz36S86zePbctEu586YFmP+mKDrrQkfCZ06AmBtXRm7+tR0qpJviO
         gN+p4IVcB2TQlZv1m4ShPkcU0APRH+vOTxpIAQ+B8vW6J0QkIlZ4ayTmhqugRAUbWzJu
         VaefRTb3RkG/BcXcpLNMMnI0RhHUL/s7vHHuOPGKazW6so+39WRksGptHmK0YvJQYiko
         VLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477219; x=1781082019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXQv8UIZDnB51xwqzRRnfaONheyvTz/2wDM2Pz33Ca4=;
        b=egU2pf18qJSX0Z6ErZP22gTHAjDUP+21NxOw8ruiDJp3Ux78KIxfXK+7sbeoK49W4p
         5T/JzEOab+ai20bZ132EeSakpyMEZwKnApcFqPaLMwdFdPBU0BrknzT0+qMvWwuYMe41
         VF3P0KYrUO76lYJM5xvlIiS/BtfqoSvdre6C7ptUJKVXS85SGErlezFdEbq28jwsD3Ol
         40V6stmVrIApB+T0Lix7Uy1NAE7V7/DTmgQFicPAr3D9MMiPCMgEB6QPbYXRLzv3qtzH
         aTEIfsF6JAN+72iX3GpUXxn0aP76ZY7wOHgDTh92kCu40J71XYj2uwgw8D9Zr9SiAlt/
         qtew==
X-Gm-Message-State: AOJu0YwdbAchYOwlb2wGWvB44fnOxwVSkuvgfDAvZ6OrNhH+Xc6XgABL
	hKsAoO1PEwOLH2xPwMizAgwSk5KGUMumSkVFDDL3oXq60XxK8vcHfLmgsUtQ5SHkXWZgeBlU7Ah
	kCKkhFGu58zKa/+r1B/St2tRFI9+D1kwLjtWjtlqRsTuztZfuvQPsZDI00TGCYmSAiA==
X-Gm-Gg: Acq92OHeh97yqcgmucfYmVPeeqUghnrUIAMbx+pplI2kKKDaefMiGJNzUjKf9OIaRiY
	l5CMPrYXBvxVKy430mofGneYdXH1O8KZDdPeOge2Ti6PY+puVgIXLIi0Q8GPSie5gx/KAIx6TF/
	AV63jzAqaZQAMZT9X9TWXANTc00KQKFzgrTYrxlEspH7k2Aen6DY59AJLLvf4LF+3b3WEFQfACN
	JI7gp5yuJYBjRNG/KAwqsT4X5ts9U6RksE4i/fM0kOi4o/9f9dyP8GA1i0ZOy9IihQ/stq5KqG8
	bPfl51QpWu7HCMPOQOeNXZDwIaiUNdMCGykdHLmENe8zL57v37AxOkCPpjRktbEuDYBCaRnMACX
	jnUnMLG9fsw8pHZriIBqhEXq1TxkK5ffpHhGODu40tTAjaicqIHi+0Fh7RhSWIeyy
X-Received: by 2002:ac8:5d01:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-517797e9e88mr26047201cf.19.1780477218979;
        Wed, 03 Jun 2026 02:00:18 -0700 (PDT)
X-Received: by 2002:ac8:5d01:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-517797e9e88mr26046531cf.19.1780477218535;
        Wed, 03 Jun 2026 02:00:18 -0700 (PDT)
Received: from [10.204.101.69] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm108744266b.45.2026.06.03.02.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 02:00:17 -0700 (PDT)
Message-ID: <a7bf44a8-33e9-4559-ac05-574b56cde871@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:30:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix FPS calculation and VPP FW overhead
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA4NSBTYWx0ZWRfX9EJ3n58Y6dj9
 OKk6zrBlOHEgClk0c9rI/GyfzNocBamiRPzcZ/KXnhN64fLj0ZEXIgUzXUA2P8F/ntS4xrNCQp6
 2GewUoObXlTgFudnrSVQ0UEY59kXd832jvxLIGySG7jp0STTAOi4NY6J/DXjeNTtGvuaJSXtgFs
 myenlzQtMeNJT6VcrRra8Cawz8ozA/B14vpVWZPwHMM4H9Rb3aL7ypB6JziegKJSkSfpOH5em9a
 w4p5bhN4ruoC+GE3nf7G3QVwUjLoplWlLLpPMPNbMPmYEaxf0xgIXUcLtzjG/hd932rvq0jpjF4
 812RkECAEtGbPvdvWJ5wcb6jwCFS0N65veXI/+0EurHZkx9j7zD2OVG4OdS7vg03slQT1v/S9UZ
 UMzTOhQ82SYE0RGCHtpr+IHhu0k8yuDBzca9e8WIQzhTERJmk6Ha+gZUcocBUXkL6zvUOmZ6o6E
 4JDrLSz3Sel11u2SX0w==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a1fed24 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=T6R9ZjUqKG0JamU5TNYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: knOmveeHhXAq_YvuPugkizJNhQDbvpad
X-Proofpoint-ORIG-GUID: knOmveeHhXAq_YvuPugkizJNhQDbvpad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63552-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34327635F8B


On 6/3/2026 2:31 AM, Bryan O'Donoghue wrote:
> Use div_u64() instead of mult_fract as u64 operator division fails on 32 bit
> systems which don't link against libgcc.
> 
> Fixes: 5c66647a5c3e ("media: iris: add FPS calculation and VPP FW overhead in frequency formula")
> Reported-by: kernel test robot<lkp@intel.com>
> Closes:https://lore.kernel.org/oe-kbuild-all/202606030132.qnBXVDkM-lkp@intel.com/
> Signed-off-by: Bryan O'Donoghue<bod@kernel.org>
> ---
> Quick fix for u32 bit division error in -next.
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


