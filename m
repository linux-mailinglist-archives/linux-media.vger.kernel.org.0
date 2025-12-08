Return-Path: <linux-media+bounces-48376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE3CCACB32
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 10:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEE21307475D
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 09:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09B1324B37;
	Mon,  8 Dec 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mT/Tdxzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMOPkhIt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7E4324704
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186278; cv=none; b=Evp/i8TCeaCmFr2QXu1ApNw06q/1AKdzhVzeMEnCO7iFNWYwErI3bW74Y2cg3kNa+7ToayeV+x/NRo/lhNfviRl8ZOXwXqGqMSym7OnMZBcG8L0nElxX9bqt+wLi1xzeBhDKYb+Ofj/mmHmHko3l/RaxDSapAHo+rGXh3aonZQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186278; c=relaxed/simple;
	bh=GNBmZI3LBlpSDQCPZPJffPvYmAHzSYIk7Cwl/mrhZ/o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WNvWtptrYpyHN//0EcM+thHTgnLBVON1BVXJXYaldUyEwlM8gwNabFd1A+aa4MY5AyYR0PrYp9Mjm5+a/lwU11VnAVLM75fh6/8wYhsX/seNPzQZ/PAT/Ezez0lE1sBNZSxVX5Y8oBMFVspIUUE07p2K/jHeDBUZytTiqgJhl7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mT/Tdxzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMOPkhIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88aHB4095660
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 09:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOgVllQ3f+kPaOv9303XK9/RT/4whrQvMz6rrqv0VRs=; b=mT/TdxzqHOxkTdTp
	cd+HfueaQVICoPYSiDV2JpIVoCgFN+lKBoxZ2B/3VBre+FFSXfWKUrZMp7zpUuqp
	Zgwf8DhCYHX17bJnHGbvtID/d1qS//Hv1WY89P+sFuVpOKgt2ch4TQn7G4nfPGuK
	axTZEJx6GDcPiDKh+4rKJ06N8F+CVsV2mQIWXL/zC6IV7X6/k4ODnbet2X6bsyWB
	2kcQDXdW3AjwtMiHPZG/rJbDnT3/pPe0/hdTUigZU+WAiw4YGPkM4A45lH5i/li0
	kTRrFbQ7wt8AvFC9C6PM/I4VAYHhUSTESrea2HXPBw3/uXvj/S/NB9E+fxPtKmHk
	zNpXkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuafr5aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 09:31:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee41b07099so51944521cf.2
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 01:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765186274; x=1765791074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gOgVllQ3f+kPaOv9303XK9/RT/4whrQvMz6rrqv0VRs=;
        b=iMOPkhItqMWIjtNLJmKzSacAGODQXy8s+OUZTkq9TjD08QNsHfL0BlCDsRi3mD2el0
         iEAGF6FHEtcxeuBZK/kjHfGx27Hs+A/LDJwE83sZvIrNU+SbImJXwTalfMORNW63Qbza
         9wMqaXHDPWaULFK/gmYu1WwO7EvuWq+riUlX9cwbxph8lBfp2WJURGUPpZPh4w9qC2qQ
         Z0Z/LctKdM61neU4y6CMn3KJraXqxi2X1QG+rbyXyT2b77flvcAiqZHglU8XG6tfZYuf
         mTSdr6v3TlRJm/VGEP4ir9Ilcr9WtgkgDfn/u4BIveMYNk7m8r5Aw47DOIucFM2fxdjC
         bAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765186274; x=1765791074;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOgVllQ3f+kPaOv9303XK9/RT/4whrQvMz6rrqv0VRs=;
        b=m8FM1HgKG87JhEpMY2f97QWyJcMCwFp05LzdDJK4hzMLacm8UEgzVx6vmUW8oqaKNP
         ihTvdxE0Cq9NlbN+w4ZL8anENG/3pLuRyWpshONv5HcaU3Y3feDb8qvuf5TINUZa8Rmq
         /HtJN8VRbbD2M03WtzF3c3EFpDpApx7q5nWZj7munwtsV6Otq3VTjhv9xAEo9P+IS6r6
         8LrMvfQ0SyXvk10DwzOCqSF6aW2J/2kOciPYZVg0KrOGt/lE4Ab4S2Oe/8N2077S/9Iy
         40Y31FaAvpstAs+H+FN+LRbUyxzCq//J33jMj7j1kIJC15psY+c1McovGzlP97xHQLwG
         J8ig==
X-Forwarded-Encrypted: i=1; AJvYcCVKf5eTxbyCwUpT/NWHH9662s/1Jb9mx7Luw0fyj3EujU15Lv190o4by8Q18Pf2tyNlh3S2R0xhwxvASQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1HahTtFFWOBe5CSpmBOmwCzsLv+nPKEL66APNQg9w3ATiX2Sk
	d8+41uflwiqjertRMc+6kVDk2+/oX0yqSijs/pNLTT0mPUHAFiaEuK6Re0RrueadJslNJHL8Lwf
	IxGtZHcASB2UiAbrZOvD9WQ6I76Z4FTFuiUMalppr+YDbons1VYRYudWNH/EJF0jdPw==
X-Gm-Gg: ASbGncuozkZ/URrcrEkL/CJEJAx1JmCIBR88NpA9akKvqw4fydeo8GCpJ9AuTobgj0n
	Qtbf/4I26S5xQmE2tu60AxWQPDcjkJI+mSE1uH+MPoCv7Lyknv3xo+zwE6qEVmnGVKZJYUhVSQe
	tXkpfYXqr6CYyLYPvFjBMHDHSa8QrFOyx2q0ikpmEWZczrnkHLopvrdxUCpjt0fxEjGrc/jjnLj
	WRY2vrX6JVZmX/WY1rSBZh82hw2+84qRKjw6kKCNRVp3zLiMlNfG/kxmHmvQWAPODF8dMPMjIj4
	+GprOyAqKvV6DOyHfL906gX8pNqa5El+SatiwUHJU1lXC94wjXkiYZ+GfEQoTuKMDxavdwzpfNA
	gxQAB3+yVVdCab/VmNUactN6I/TDr
X-Received: by 2002:a05:622a:5297:b0:4f0:3183:2412 with SMTP id d75a77b69052e-4f03fe926ddmr99188141cf.43.1765186273742;
        Mon, 08 Dec 2025 01:31:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/VtXKxvE3hCsibixqsVXKTGyjjuxEdRDuaigcLOVYNcyrju2MEKPVMFYsKVVC8kHVm/0wKQ==
X-Received: by 2002:a05:622a:5297:b0:4f0:3183:2412 with SMTP id d75a77b69052e-4f03fe926ddmr99187791cf.43.1765186273106;
        Mon, 08 Dec 2025 01:31:13 -0800 (PST)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f19dsm1070551266b.64.2025.12.08.01.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 01:31:12 -0800 (PST)
Message-ID: <8d46f426-4191-4655-a007-fd2e3b44a44c@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 10:31:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for
 DSM method
To: Hao Yao <hao.yao@intel.com>, platform-driver-x86@vger.kernel.org,
        dan.scally@ideasonboard.com, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251208035122.2147678-1-hao.yao@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20251208035122.2147678-1-hao.yao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ep7SD4pX c=1 sm=1 tr=0 ts=69369ae2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=1QEcbxsSWfX5t2-VWDkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 9kxCQ6Ag7M29dsx-B8MX4raIP7kT3k8j
X-Proofpoint-GUID: 9kxCQ6Ag7M29dsx-B8MX4raIP7kT3k8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA4MCBTYWx0ZWRfXweznk6WDiG/K
 BvTseQO0AylC/PnQ8fMJWJJLCKIjSRVMftBDrvFqpq39BruqaIKbZiEhKPBcJEI2OiOuKar9+Db
 hfdNhGnW67CXIjFWo1xCq9Dm/LQE7H/WD389JxLZfzQ+0+zJ8gQdfqhFEXdtKYK8VVxWCQQ+atH
 sZw8hrF8WG/rmy1DUUSttL/aRF7BUhx9DK96ARWg7h8tfpFIE19Lb+KG54BhjQcoeq9Xo36A6nM
 HP6PY64X5fINKddtPQlMgC75UfAEGTqBrNPjvgsZk+8HWyO9Dcm5pwz+ya4ImxGhIdh/13IaOM9
 JyY0B6i6VFzMZoEaau4PsJg1HCddHIKp2YDM99I9avFUY8ojF8tF09sfkRtqLU0Fht3Zucqmq5E
 pzrnuEenA9QL+k3GV/bzLNwJxCavKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080080

Hi,

On 8-Dec-25 4:51 AM, Hao Yao wrote:
> The third argument (args[2]) to the _DSM method was hardcoded to 1,
> which corresponds to 19.2MHz. However, this argument should reflect
> the actual clock frequency from the sensor's ACPI data.
> 
> According to the DSM specification:
> - 1 = 19.2MHz
> - 3 = 24MHz
> 
> Read the frequency from clk->frequency and set the DSM argument
> accordingly, with 19.2MHz as the default for unsupported frequencies.
> 
> This ensures the sensor receives the correct clock frequency as
> specified in its ACPI configuration.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>

Thanks patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 9e052b164a1a..c834fd59ec0c 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
>  	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
>  		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
>  
> +/*
> + * The PCH clock frequency argument to the _DSM method:
> + * PCH_CLK_FREQ_19M2 = 19.2MHz (default)
> + * PCH_CLK_FREQ_24M = 24MHz
> + */
> +#define PCH_CLK_FREQ_19M2	1
> +#define PCH_CLK_FREQ_24M	3
> +
>  static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
>  {
>  	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
>  	union acpi_object args[3];
>  	union acpi_object argv4;
> +	u32 dsm_freq_arg;
>  
>  	if (clk->ena_gpio) {
>  		gpiod_set_value_cansleep(clk->ena_gpio, enable);
>  		return;
>  	}
>  
> +	switch (clk->frequency) {
> +	case 24000000:
> +		dsm_freq_arg = PCH_CLK_FREQ_24M;
> +		break;
> +	case 19200000:
> +	default:
> +		dsm_freq_arg = PCH_CLK_FREQ_19M2;
> +		break;
> +	}
> +
>  	args[0].integer.type = ACPI_TYPE_INTEGER;
>  	args[0].integer.value = clk->imgclk_index;
>  	args[1].integer.type = ACPI_TYPE_INTEGER;
>  	args[1].integer.value = enable;
>  	args[2].integer.type = ACPI_TYPE_INTEGER;
> -	args[2].integer.value = 1;
> +	args[2].integer.value = dsm_freq_arg;
>  
>  	argv4.type = ACPI_TYPE_PACKAGE;
>  	argv4.package.count = 3;


