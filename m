Return-Path: <linux-media+bounces-50220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61011D01BD8
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A85B0308559D
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5192934105C;
	Thu,  8 Jan 2026 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPve4reT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7eD2iLG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15966346774
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861672; cv=none; b=YzkwbljTyajALHxwc6+SBzEfnqhougVP5co0Kb8w7UMlgfkU966ym6BkSn/bvhzBu6h8YvUZ7Sxhn1ujGG6JOLu1lF+AUnac+SArb1RitA23R1t8roewiqdypvGNfpLVDKceZf2E4lUUW8CAepwMK6hZkTRjFYMzly85ud2SF/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861672; c=relaxed/simple;
	bh=xjHglDM/JW2NmeVeyAr0+dj+UOkaL7HkzdzU4RxRwmk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TaZtq4WhaO+keRwBuTcP+xC0qGbgjS6yRdaP3GviEFl96ELHAuGkIl5CIoFgSvI3SnB+94FNsTrhjeliQrPgi2QnPgyOblmw/utgx0jwXLVKj016cAR0Hh5fsK4bTbbVa943/BaPla2oB9eAinRj56wLFhrhRqhG1/dOQJWzKbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPve4reT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7eD2iLG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6081E9uL877882
	for <linux-media@vger.kernel.org>; Thu, 8 Jan 2026 08:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJGaMaxcuDZkeMl5qtNbvmW1qLM20Z6W7DUk5Nd+ylo=; b=OPve4reTFeGDugdT
	7nHIJNmjpV1vNAhlkyOidifyNZDah4vhB3qKCbdF/u6nyX7tthRY+adja4iTljJK
	FFAsrQzIOnXyaPaC8CZYS4sj7TwsD+0+ppfWl6/MHbFhLtpCNvzfxOCX9jye8rnb
	nWocUNcr+liTaAen+b+mfcjYa1NBqbaijRHNSSaRhRR8IvA2jbvrB5sOHFIDtkKd
	ao18FdyN1FbZX+HaiJ8QoLy8rqaLAEDXPQz8F/zkwsVgIWmkNy3ev/NKwWmFV6Q9
	6rxrYZTpj6I3G3bQsbqXdy7YVVc6F0egYHMJLfUWvLgNJ4lcD59s3gssMaveVSNL
	t8s5TQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2r316t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 08:41:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so80705851cf.2
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 00:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767861661; x=1768466461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJGaMaxcuDZkeMl5qtNbvmW1qLM20Z6W7DUk5Nd+ylo=;
        b=F7eD2iLGUwekbHg5a/0NWXq2ruRw64zVEYhn/43Zu0zY7byjOeUuIaYMUnitQGpWRN
         QSdzZEvr0V3oq+AhfZ7Pc7FJ2rucrbDeDlKG4xm2zMfQTohwPZ7dTMHLwBrd4KnrFUFE
         Ufy1JDKgButOGF1WZKTW1XuUx0tH2/LwNgmqtQ7dIfgP4OIoT0swpGWRfftKuU5EP62+
         Qd+p41pUvdJqIzkJgkGIq0e2t2+4NKWn5LXONfV3vKcOFmJger4HZE/NFgcntkPXdEVA
         z32nOpekxhgOq/okc7BhUNB8RMZ/vHP6DnAuFt56X69FxacGTmGDFCa3cIu7jJniNdiL
         RozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767861661; x=1768466461;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJGaMaxcuDZkeMl5qtNbvmW1qLM20Z6W7DUk5Nd+ylo=;
        b=hkRw7HFM8/nhmmZtcG/Y2E0adSwTgZVran4wUoCiap3QhQyeq8rXCRE2OzZ3BdqY+c
         u6EPx//VvxTisSsu85IYcBpVZjr9AnbAuiKdtAXIBuDVonDQi52mHZRD409cM9NY5Nwf
         94ilBbWxfU8PrRLXtJFDWEzxXc0OTJ7QIdnXv+JqJRsekpFQVX8XHEJgpxBVmhPrvr0t
         2ns3L7CWqFSbROyAc6UjnjkCq4eQbb7JqXuMYcmX8IDGfCkloXm19olOvCJ4oPe6bFIc
         KABHcIGN1NwQB5UX5nmYxeJOGDsKNN2pWWwNVAnqwzM3q/N4KEsZaFBSnyrcQKOolaK5
         n4sg==
X-Forwarded-Encrypted: i=1; AJvYcCUxgwlcf7N+Zd/KGRZIf70/3iEa/PfPUZh12ygQanXo6OVwnqjInUswYzroOMZNge3aZx962eo3XdjcpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwySLaRltrslGHp/+SiCDQ4+8ZNrdHs2k63MnzEwAiglTrWn3Wa
	zjAYrX7YdH+lbB9zMOaannRa33MhJlMNEUQ2Dwrz1s1DL03bGhHLSijVMIxncn2A5Bg8vyxFF6g
	DhaMy0mEueRS7ztlwpePIFh8u3VmIib40pslprfd4XTmhqyWuzZO/Vv4VvkU8t9bc7A==
X-Gm-Gg: AY/fxX7aM7ou++FM8/iFwzjCoSB6hft1QtrUa5L47gNpTfAxkKffnGTFEXEsL3HwmK7
	tYRe6bHejOmsXYo2pgRF/GS5DpbgIlX6CyekBe6oEigqJLT5Twl84Siy22xb6rhY1Rp1plTdPJQ
	mR6ty/sCTIj6iAmdLrq0m8ybvwPbuQKN8szyiah6JN5EGZpbPFUy3wrgGi8hzizu7HkpF+NGnd6
	TnhkQhhrtm/AGZKUMtxVXeab7ZFnB1A/O2ZDlbdPtAjnO22ZZIg2oTUC2xa+8oru5FIdJN/mRCJ
	HrDWbJZx0/1ca8IXkSCw9ifEIbzM78Q2gnDCeQAa4BefBdA69zEQxhN6QknxPj3GcmT2uOwmzVf
	yDAWbiP4N5Z6QItXNI7ipO+ASaMyhC13PGHSVbkgvXVcTa2K13Od+VEoARRkLe+e4osi3J2+xYo
	uy2CIw/yvUUUzvZQj3YyqUSo9m3A5PC9/UrRDO6+dh38vNELOsrHlPzo1PZuTZ9ljKn8YH2En8/
	bF2
X-Received: by 2002:a05:622a:229e:b0:4ee:18b8:2ddf with SMTP id d75a77b69052e-4ffb48c7dccmr72101111cf.37.1767861660737;
        Thu, 08 Jan 2026 00:41:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+8iWsWKz3GaphD0sGgOVLN5BUK3qaL4MHY1YyUeBUAd9hOKS8/HEl0W/5EmvI/dSudEq58A==
X-Received: by 2002:a05:622a:229e:b0:4ee:18b8:2ddf with SMTP id d75a77b69052e-4ffb48c7dccmr72100991cf.37.1767861660324;
        Thu, 08 Jan 2026 00:41:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf66214sm6946786a12.27.2026.01.08.00.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:40:59 -0800 (PST)
Message-ID: <7e96da9f-5e48-436d-8e19-d8bb124ab106@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:40:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS
 laptops with upside down sensors
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
        stable@vger.kernel.org
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-5-johannes.goede@oss.qualcomm.com>
 <de0d0f9d-be70-490d-9cc0-53f017c69985@linaro.org>
Content-Language: en-US, nl
In-Reply-To: <de0d0f9d-be70-490d-9cc0-53f017c69985@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OCBTYWx0ZWRfXzd4xmDQmBXsl
 MF2pgKs9Sim249E6LrUGITs2hZ4Y+ryWaBvR7/duJ/D6TK9ejE+lESYBN9zazk7NYJR551Yd/rw
 05cUFMmN7JR2jHWpE7+yyRLBI1eqJY8wK13eI9ky90kApPFErRBO3GT19fUXJ1O3SQOS+vQ92RN
 BhqdoTaAcfDkQT6Iwuf9G0SYivgdR3qWs2S6NALmTCivGNV4170LVkq9kPqQleN3zvagHzGVkXi
 Op37bm1O6p9fn6Lah1cQSPN/ma14uZlVyPttygcvfMIlc1VGOMYphb/wNggveH/ZGyP1HQE1wUB
 esukAdKpXJD0qsnad5XReZZLkoE8f103wYlIVI/aQSG3wmX7iWXBQx7clIxjaD1KqJcD4dF6wUm
 yKa7HWw8lBxYJgNniC0IFVGlS9o+Z8WBPaCzzzqPiTFQMUpQ2vUMVtoZhh8PqqthAsz5pS04r25
 tzHkxbLy7pfpCvm21nQ==
X-Proofpoint-ORIG-GUID: vTc3YiQNiF_H3kYo7rcHIpBw4XBLtoBr
X-Proofpoint-GUID: vTc3YiQNiF_H3kYo7rcHIpBw4XBLtoBr
X-Authority-Analysis: v=2.4 cv=S4nUAYsP c=1 sm=1 tr=0 ts=695f6d9d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XBQUi1Y4SS8Vamh7PKcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080058

HI,

On 7-Jan-26 22:53, Vladimir Zapolskiy wrote:
> On 12/10/25 13:24, Hans de Goede wrote:
>> The Dell XPS 13 9350 and XPS 16 9640 both have an upside-down mounted
>> OV02C10 sensor. This rotation of 180° is reported in neither the SSDB nor
>> the _PLD for the sensor (both report a rotation of 0°).
>>
>> Add a DMI quirk mechanism for upside-down sensors and add 2 initial entries
>> to the DMI quirk list for these 2 laptops.
>>
>> Note the OV02C10 driver was originally developed on a XPS 16 9640 which
>> resulted in inverted vflip + hflip settings making it look like the sensor
>> was upright on the XPS 16 9640 and upside down elsewhere this has been
>> fixed in commit 69fe27173396 ("media: ov02c10: Fix default vertical flip").
>> This makes this commit a regression fix since now the video is upside down
>> on these Dell XPS models where it was not before.
>>
>> Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Fix fixes tag to use the correct commit hash
>> - Drop || COMPILE_TEST from Kconfig to fix compile errors when ACPI is disabled
>> ---
>>   drivers/media/pci/intel/Kconfig      |  2 +-
>>   drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
>>   2 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
>> index d9fcddce028b..3f14ca110d06 100644
>> --- a/drivers/media/pci/intel/Kconfig
>> +++ b/drivers/media/pci/intel/Kconfig
>> @@ -6,7 +6,7 @@ source "drivers/media/pci/intel/ivsc/Kconfig"
>>     config IPU_BRIDGE
>>       tristate "Intel IPU Bridge"
>> -    depends on ACPI || COMPILE_TEST
>> +    depends on ACPI
> 
> Why this change is done? Apparently there should be a new dependency on DMI.

This patch introduces an acpi_dev_hid_match() call which requires config ACPI
to be set.

And there is very little value in having COMPILE_TEST here since this driver
only makes sense in combination with ACPI, as it works-around short-comings
of the MIPI camera descriptions in ACPI tables.

Regards,

Hans




