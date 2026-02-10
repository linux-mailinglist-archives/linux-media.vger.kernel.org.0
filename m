Return-Path: <linux-media+bounces-52510-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDvwCv/+imnJPAAAu9opvQ
	(envelope-from <linux-media+bounces-52510-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:48:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B8119174
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E5473070B0F
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E666B341AB1;
	Tue, 10 Feb 2026 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DL2wUPwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A84Tbqpl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298EF2F3618
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716761; cv=none; b=IvF0gMq3keUJoHpfwFAMUSMA0zOYyqzZrqueOwQn+EllRtNWGNTgDnEULFCx6XgN7ATtTq7qPbJ3Oo/VqfncAYo/0T4tobuHy1mxJC/XNHiymPT0KLYzFZaFa+elg5HzJTgMHa8IyozxJyfVtu7tEF1ZiV1rreft1djXCcB4K9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716761; c=relaxed/simple;
	bh=SkU+LOj3hc+NYlNKV0g3ZUAabDbE47/gWMd3aYZDLIs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r8QF1U7XUe8qTfOP3T09ebpCOwvDTZvt7edsLgkhm0p5XELSpQ9HLVFTUyjxtu3X6onSJzYUM4Ip8pUBsT414ahWLMsi+httxJw+VBvBT/d+QWHOgGI3gcdPrkJc42LMO7SqiGeUs9B+lL8168QHK8aiDCsku3Ikl92EMiDkl1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DL2wUPwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A84Tbqpl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A76vHc1151630
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 09:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLvMKTOn+CGHcD5PmfsNOiSjbzdZZhsgqXOcaZkwH+8=; b=DL2wUPwN4wD6zRdv
	X3XjiYRgMbuDP6Jth+cIfylryegh1hJ2eiGB3BctlmYhlvmuBnnxUiDg5bFN31L5
	hgwa2xUIMa9MF7xOHqA9e6h7F4vTw2uQdLP8QYcty1HlLeeMnNisR1vz+dRJ0W1A
	WJj2g01wANmjY37BGcdCgyLWwEV8wX/W4Yoke/266Dx8+njVEAm34LRzx9XaehjG
	WlAiXzgf9bD0lEvSEFLNvjF/huwQtDjG+9crNqxIV5CCheLtNqUAbzqso8yFgeTB
	Vvpa3DJHU5GFzYkVxU+L9BVwYRqmnj1erNH4I6j5O2oynn16Fj5t/CdAm1nKnNw6
	cSOauA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j8jv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 09:45:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c881d0c617so1105565685a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716758; x=1771321558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dLvMKTOn+CGHcD5PmfsNOiSjbzdZZhsgqXOcaZkwH+8=;
        b=A84TbqplU+MwjGIHyxHmjFfdWnO1D36BKTgvird2Uj9xRSIRL6SIli7LYufiFQSgny
         E1CUhSYX9Zdyjtv5r150wteSR7Sbk6MQE6CEVdQtH5xgM1sDWKVCLnYd2Z89/U1yIhZF
         2LVHTrxictnogR6onu2gTu667gC60oDcnLQ3QFmV5U6xdTUcfuvyrUj+DxvInmQLOD39
         STQgbTrpIuFTRr4snsguGp5SUYXavnOpu51VX/CjS0c39tovjAVBPO/SnB3wjaIPMpGM
         /pHuBzf6MvOMZGH9luI0ICyXdAhH9J/9+fVSCcUdH3F1vr1nRIyI9ii/aZ/YwmIQ+oex
         X++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716758; x=1771321558;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLvMKTOn+CGHcD5PmfsNOiSjbzdZZhsgqXOcaZkwH+8=;
        b=TEx1S9jchuws4zNqNWsHIY8yH70EF9azKt8Uhd40hrceLoeGZ1Hpr+4usV4pL9/r2Y
         ceyU1CJZdx6wXSoe3wItVtJXL6qCDwH5IeneAHkXGzP5C05CmCn34rW7NQqahWOqJmFx
         HOEQE4ES8sJxcELU0lCNItCl+zA0FOzpxiZCPolr5LDLjrGYNNZwVpsyeBkQnCFiXp1F
         jBGoDpkJMQZwdhZO7NEcBZj3HWlCZCAbCKL3bLu/tZEvATfVUaPoCWR+UIlEr1G2SUjk
         A/csu6uh9jLvraoDPWTVcD1UVetD94/G7ZoME4A2vFtpYIPGbo2l8YVKIroXfWLkI/o5
         zSPw==
X-Forwarded-Encrypted: i=1; AJvYcCWFFTLxt0/o+Wz1oW2DPNFD6Nf1+KrmYnHsup7ErbEWSS+bssyUyjUeFL10HAxww7OfXoodfbOnKF8H0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIdekRO7KdYYFIoibHXUSQnn/+FIWjMWraOMXbuoQcID9oZIVl
	MV4bv4loE8LglQYTye+/V0u/utxyoV4k+BKWdZ5yzqayIZZmnx4Eel9gtmwzHY/593v9+eCSg0d
	JVW9RN12vTJSxLbesRIsRAFqpiCKwudaaXr4S8GKhts7+BsxuP0qnLqe3nj71HST1xLP0yhIr0w
	==
X-Gm-Gg: AZuq6aI8cLVWaT7QbsDllfl2DgWD+UWYz/gBnqFqvflmRP/jaRAA4fy62vdwSkwh+Qd
	kPbzo9ZyBgRI0e3hTHPYNRgcwjaJmYZ6HdyjIkJhgGHMnT6VVZEEy5Ui5deKaTjBtpM7725S+mr
	Wig8snnCJUp7Ssxp8W2Y7BsVTDm4UgSUEfE8tPPm8GLbChmTKwTnmqlyTylFkkJe9qOUgvxJhgC
	jsHin/DfZrMGadOhXOTpfIJt3iptXHDSGPpRBxDezh4yR7O1ltGWL9r5ICTaMS5B1Guf+97qhtT
	2AcZjhX0cL0oOJqiTSaZ03fVBxseUyh7Crj54KWmz/nJkzjaXI/HfnQf6HG9DfmwZilyHqCq7qJ
	lhcFVBcnCkwYSNy1oVhW8tfV9j+misu7VyXnDctaVTaQCgRqGRO00KgiGKupdfq4Oofx39xRB1i
	BFnX+BqOaaRZ5somqDCuNoJT8v/oFqZxk+Zkw//AhTxRP4rdHq5DZutoaQ9jR0zg0/X1hkXziou
	jofi4yDXdDQDWAU
X-Received: by 2002:a05:620a:4485:b0:88f:ee0a:3d66 with SMTP id af79cd13be357-8caf17e3e5emr1642539085a.80.1770716758133;
        Tue, 10 Feb 2026 01:45:58 -0800 (PST)
X-Received: by 2002:a05:620a:4485:b0:88f:ee0a:3d66 with SMTP id af79cd13be357-8caf17e3e5emr1642537585a.80.1770716757693;
        Tue, 10 Feb 2026 01:45:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-659840238fdsm3644371a12.30.2026.02.10.01.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:45:56 -0800 (PST)
Message-ID: <b558585e-6253-4e12-8451-f81eb3ad4867@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:45:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] media: ipu-bridge: Add DMI quirk for CVS-sensor
 dependency
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
        dongcheng.yan@intel.com, sre@kernel.org, hao.yao@intel.com,
        dan.scally@ideasonboard.com, miguel.vadillo@intel.com,
        ribalda@chromium.org, jason.z.chen@intel.com,
        Kate Hsuan <hpa@redhat.com>
References: <20260210084152.332001-1-antti.laakso@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260210084152.332001-1-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfX3yEoO28fJzZR
 5BxKgqjgufhmwB1WbbRFTVkHGW1eRYVur/gEmrmH8SJNKPLeG0LjcMjkgaANnsH/S6pfyYFr6e1
 CfxladN3UJMGZKDUjk25Jo7sJ4un/wcsIEXUetQl/KxzBHcqFd6p+gF3Ia0ARc2VrW6hPiSzMWU
 NS2mXRVdYfYeqlQPHBuHnJ7bFE9xUaeN7+fkhXl0jmkljQ0FVSkQTJapxJ9W5hIGmdTvh4oL/Uj
 /CGQR3gIJKIDKn9QaErlcuqJRAcMOg3mbXQqcy69OcBPfXiPlsE1seWm4GqyMH8miV/AZhwovzR
 30BYj25Aql2bBUb1t7dhTTYghe/U4BqiBG5Qt2FuWZF1DVzzIGrylgnCMKaaEsmrE1ZUlm82pc0
 w95IigHe/3TN/tVHwX9ceHbFv7PHd2GYmnJbI/2fwwPI4cW0gwWclpBjaYg8Hh/r3S7BEO4FUWY
 MoNBN1JqJgcfS7b6irw==
X-Proofpoint-GUID: h6aeTsidvoZkGzEXQi7ak1H4o9PgD6vh
X-Proofpoint-ORIG-GUID: h6aeTsidvoZkGzEXQi7ak1H4o9PgD6vh
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698afe57 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=20KFwNOVAAAA:8
 a=NEAV23lmAAAA:8 a=QyXUC8HyAAAA:8 a=66nOfMCFZQ6MNQ1AgMQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52510-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 699B8119174
X-Rspamd-Action: no action

Hi Antti,

On 10-Feb-26 09:41, Antti Laakso wrote:
> A supplier-consumer dependency should exist between the CVS and sensor.
> However, this dependency is missing on Dell Pro Max 16 Premium laptop.
> 
> To initialize these devices correctly for this laptop, add DMI match
> table to ignore broken dependency.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>

Are you sure the dependency is really missing ?

ATM the kernel has the CVS ACPI-hwid (HID) listed in 
drivers/acpi/scan.c: acpi_ignore_dep_ids[] :

static const char * const acpi_ignore_dep_ids[] = {
	...
        "INTC10DE", /* Intel CVS LNL */
        "INTC10E0", /* Intel CVS ARL */
	...
};
	
because there is no upstream driver for it and cameras do work OOTB
on a whole bunch of laptop models (Lenovo Arrow Lake / Lunar LAke
ThinkPads) work fine without the CVS driver.

It does seem that only the Dell models actually need the driver,
also see: https://bugzilla.redhat.com/show_bug.cgi?id=2413656

Please try removing the 2 lines I mentioned above, it is likely
that will fix things. Note those can only be removed though
after the CVS driver from: https://github.com/intel/vision-drivers
has actually been upstreamed.

Maybe you can help with upstreaming the driver ?

Regards,

Hans

p.s.

About the upstreaming of:

https://github.com/intel/vision-drivers.git

Note there is both a regular driver as well as integrated update
support into that driver. Which is something which might just
as well be done from userspace. For upstreaming my advice would
be to start with stripping out the upstream support, which I think
will also be what Richard will prefer (+Cc Richard).

Even if we do somehow need some kernel support for updating
we don't need that just to get the cameras working and getting
things upstream without it will be much easier and will allow
us to redesign the update support (preferably punting it to
userspace) before upstreaming that part.

After removing the update support I do not believe that there
will be a whole lot code left in the driver. Just some code to
put the MITM vision chip in pass-through mode.

Upstreaming the remaining code / minimal driver should be
relatively easy.

Note this will also require testing on Lenovo laptops which
seem to have the ACPI node describing the CVS chip but not
the actual CVS chip causing i2c transfers to it to fail,
so the driver will need to recognize this case and still
mark the dependency as resolved instead of error-ing out
otherwise the camera support on these Lenovo laptops will
regress.





> ---
>  drivers/media/pci/intel/ipu-bridge.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index b2b710094914..8dee6dfb51b3 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -121,6 +121,18 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
>  	{} /* Terminating entry */
>  };
>  
> +/* DMI matches for systems where sensor-CVS dependency is missing. */
> +static const struct dmi_system_id missing_dependency_dmi_ids[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Max 16 Premium MA16250"),
> +		},
> +		.driver_data = "OVTI08F4",
> +	},
> +	{} /* Terminating entry */
> +};
> +
>  static const struct ipu_property_names prop_names = {
>  	.clock_frequency = "clock-frequency",
>  	.rotation = "rotation",
> @@ -163,13 +175,22 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
>  		struct acpi_device *consumer, *ivsc_adev;
>  
>  		acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
> -		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
> +		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1) {
> +			const struct dmi_system_id *dmi_id;
> +
> +			dmi_id = dmi_first_match(missing_dependency_dmi_ids);
> +			if (dmi_id &&
> +			    acpi_dev_hid_match(adev, dmi_id->driver_data))
> +				return ivsc_adev;
> +
>  			/* camera sensor depends on IVSC in DSDT if exist */
> -			for_each_acpi_consumer_dev(ivsc_adev, consumer)
> +			for_each_acpi_consumer_dev(ivsc_adev, consumer) {
>  				if (ACPI_PTR(consumer->handle) == handle) {
>  					acpi_dev_put(consumer);
>  					return ivsc_adev;
>  				}
> +			}
> +		}
>  	}
>  
>  	return NULL;


