Return-Path: <linux-media+bounces-52521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNkGE7ozi2mhRgAAu9opvQ
	(envelope-from <linux-media+bounces-52521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 14:33:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53411B3AC
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 14:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10A903036051
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EE2329E43;
	Tue, 10 Feb 2026 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8OQWLm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKmG+I1X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3131984E
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730415; cv=none; b=kwTgZAgsp2i38SYqNN1hZa9kN2hDZhV/EakSPjIAVK6b3hn5FbXw4PWj1+pj3IQhBtvagFvzfg4VWXTNuRboMSL3eSqKb4nsMfyhhN9f2tqpnNEbp+u3hwD+89xKqNhHBg9RWoz8v08NYgHR95E53gp5EVVKtHomuFjeNA/1Iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730415; c=relaxed/simple;
	bh=HCF3UClovXPSrgOulg/dXFQejVNHCo9dQm2YqxlZJyQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IygdzEI0qzuCBk/zBtMKnpEs8j2FsjkJtelRphAqXQzSlaxffszOoYX7mIfGa8LiiNavymplPV89Hr8dk13s/ooSNpZeKVbpi8NdIKfCR/3QoccTUlC1pdDK5Yhi/EsAC8GSQ6X0KXfV3R+xiccbtHRPMgS1V9qNM+CgcxeBrUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8OQWLm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKmG+I1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7T9Fl1419228
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 13:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRO2tw6//oDay2l2h5uAOX2SE4mMFjCaA9OjuKln89g=; b=m8OQWLm6+4CnPTPb
	OV3KJaOs51Im8zkd+ZHG5nekEVu91Ajbc+/wDDMNmPERmcV0fCBpCQm4j9/H+gKZ
	xp5wPg0N8B5lidz/E/t2PfK4hgepi00d2cHQKWUibFOHR76I4J4dFebdurxI3zWn
	JSFq6AiAui/U1RQNsdGO/I56nk2YHgiTanv2m4A5t5ZQW8hS9HHCiqwVorjOMW1T
	jCEThtzh1MBBbvKBZogoZGoB0wVKZQCP7i2gDz4n0Qoex7Lgv3cwhZWnCHhvvBJp
	kZ4diOdCUg3I2h2mtWr0ndC0w40a1FEIQK2dJutgkyCCukiu5NUvRKv5Rk8ybRY2
	nHS7rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7rpvtjcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 13:33:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70a62ca32so271337385a.2
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 05:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770730413; x=1771335213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BRO2tw6//oDay2l2h5uAOX2SE4mMFjCaA9OjuKln89g=;
        b=KKmG+I1XdGjtC/IOVfowL0KICPJLdWIab+zwoHIq2Hnmykbac2ZV7CJM8WCF2WDbrm
         F8di7mFU4yQnfEh/a85HJi/fx9oN1quoUtzNSDbHoXEo/G08PCCat2MtYYEXU7EgL3cY
         LOiCMGgy9pVylf3z8z1Mq1GIPsxXVysyCSw+cnIr4rq0+iopAWobUyM/2iFbw8ent356
         QU/UMO995qOM4rmfCYpr3xKTJLQJaBLADj/dJC4Hzi/pR9224hfyn1j1atrRAutwpNaP
         /rTnPADkcjJxPqTH5LylcsFqDwP5yGvsZQdKq4HC/kMSVb4mwyT2kv0zgnl8fJ7/t14Q
         jwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730413; x=1771335213;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRO2tw6//oDay2l2h5uAOX2SE4mMFjCaA9OjuKln89g=;
        b=gdgv5hNRlzPbLauM3rY09t5Gc1eY/3nMf3RDuzXpubgz3qxKU44rCcPeu8n4vYBIsP
         7QyVoyRanpjl1t545MwcLdMGIfwZ7Sn28U6utvbE5cqsSi28MykgTX++aMXiwAH3JGY3
         J23e56P29xa4muasZF78Dkkqci2F4HJczCKyskXK8IsSx2X9QIfKWGoD7/CnggK/ZyNf
         3xF24Xs1ds3qgraZE8JHImFsL/lKYkGkbd9duC26iaqLIRHbLmYYZnEM2fqVnH81Rsyy
         DNTcmi1ObpYYPNUqQSOcEQckM77unPLSJRMXZ7S4N4leGCCGqKbMIpV4B/xXpNIWe0LI
         U+nQ==
X-Gm-Message-State: AOJu0YwKHrKANqp5PRVDOMGO9Ue3sbOUVQe9OvyX4hQw8Pb3c/TJoExZ
	FZbLtFbxi/2yh7T95qymAxGghOcPxQkKSTB0BVzZphi2yuilUbIq6zlGVcPpsApocRQeI6QbzqB
	OQKf2qPUwQwvVyCrRwWHQbgaGqeCgFgE7q8uGgb2il+JdZX6497Udpp3tEOLR2OynLobbfYRmGg
	==
X-Gm-Gg: AZuq6aIlri++QxWV13oWiZ0SUefiyIEH67wxWcvCLk42OACfPh78pLCmfHWsioEb70i
	crx+bqOQi/DEvVFao+rVA5LdjJwYJ7HiMpteZO5Gn2OjzUd9TrrU9lyCQ2PwZhwP8I4JToYWSQP
	JGhFqTeNYpoXlAENx3njeo0O3tThnGxu0CLRwKV4x5HOZ+Xo2eUesY7JzSAOgTV1HXmNGrNwaDd
	BTJ8OPL8rQ2B9UNI1CX/KS/IUpYq0n5eho+uXErUEL3eZGkrvg1R7+7llRRURwJA9YcQZcYDKOV
	ngKO14jVUk5UAIbZ+K9Rzu7qn2QRyE46l/FoI/1EUWt4k45b3HwNezXD0IJ/EU2m91+tg7EMG01
	1Mi1lqYNwt0+K9Y9MmSe1VOa+kW8CCNPraM0osOL9PLZ8JtE0ueQSX9iHnaRqTip0wCW7bQ+Tb5
	YEJFj7IMaAAsBQQkQy6DDT1OZfkHDQT+rQIry7n16BTZgsr/JOmbZ8sMNKf7EgWxQ3Gi9YGA54n
	v1vTbjJfz+CeiBW
X-Received: by 2002:a05:620a:1a22:b0:8ca:305b:749b with SMTP id af79cd13be357-8caf1fa789bmr1905740685a.60.1770730412732;
        Tue, 10 Feb 2026 05:33:32 -0800 (PST)
X-Received: by 2002:a05:620a:1a22:b0:8ca:305b:749b with SMTP id af79cd13be357-8caf1fa789bmr1905737585a.60.1770730412299;
        Tue, 10 Feb 2026 05:33:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3bab5sm510756866b.61.2026.02.10.05.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 05:33:31 -0800 (PST)
Message-ID: <da017e6d-5048-4ab1-b3c7-3ab07c6bf0b4@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 14:33:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v2] media: ipu-bridge: Add OV5675 sensor config
To: Leif Skunberg <diamondback@cohunt.app>, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210085558.34140-1-diamondback@cohunt.app>
 <20260210094545.37918-1-diamondback@cohunt.app>
Content-Language: en-US, nl
In-Reply-To: <20260210094545.37918-1-diamondback@cohunt.app>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDExNCBTYWx0ZWRfX+2OP3TbIyEju
 pQKhwH1r7W8PxQCGGQx7QtNigUaF0UsfkUGFV/eHy+iX24cim7B2By5IsTFT/uoOQztpMGUG+Nt
 V8lSHnnHMNuZERm/c7OtFRYg5UdtMzEz1b6Gfd74mSzgo7zKirGMq7HRsS9Sn2sm1al9rtHc4dt
 DtDKLplTjz+36b01G5u8Bd9oB3nLmH4OzkX8FyTZ3eJU3oNeVpvHHNKErVXEMcuQjp8kO6byOy3
 sIjEdUDVT7jyfOHchGNRV9Se5wUMkbpAjjywVBp1bPxn9HSG2kCFKwvl9oENQall44B5U4JFJQc
 iRwKydSrtTK/AW3ttvC/xYQjy6VeXX2P6K0QZe2hIN3w9g1wjpFNj/YloG+pO2dRmtPRrI9b00S
 Hf6hlrrd890OIA2YxdVskm/qg3hvKvP2iXLLDHb3DCIav6wMx8C1tHDgaxhgFpDlHxGqDBRQv2H
 dNPIGaRkzaE0Cw9rqtQ==
X-Authority-Analysis: v=2.4 cv=KKZXzVFo c=1 sm=1 tr=0 ts=698b33ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=poVXkYX_xH1DHSgC_hUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OYUeQANGOmiBQxaFAfuFg-uQHhLEVFgI
X-Proofpoint-GUID: OYUeQANGOmiBQxaFAfuFg-uQHhLEVFgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cohunt.app:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_FROM(0.00)[bounces-52521-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC53411B3AC
X-Rspamd-Action: no action

Hi,

On 10-Feb-26 10:45, Leif Skunberg wrote:
> Add the Omnivision OV5675 (ACPI HID OVTI5675) to the
> ipu_supported_sensors[] table with a link frequency of 450 MHz.
> 
> This sensor is found in the Lenovo ThinkPad X1 Fold 16 Gen 1 behind
> an Intel Vision Sensing Controller (IVSC). Without this entry the IPU
> bridge does not create the software-node fwnode graph for the sensor,
> preventing the camera from being enumerated.
> 
> Signed-off-by: Leif Skunberg <diamondback@cohunt.app>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 4e579352a..170cea847 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -88,6 +88,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>  	/* Omnivision OV2680 */
>  	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
> +	/* Omnivision OV5675 */
> +	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
>  	/* Omnivision OV8856 */
>  	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
>  	/* Toshiba T4KA3 */


