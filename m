Return-Path: <linux-media+bounces-54717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHMDIO6cqmnPUQEAu9opvQ
	(envelope-from <linux-media+bounces-54717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 10:22:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E721DD3C
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 10:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DA373010752
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3CE33ADB8;
	Fri,  6 Mar 2026 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1+D6493";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1BxtlIx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAA8479
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788964; cv=none; b=BmSOcNNOWUu1bVslBeKFRiqMEnmo3G3KFbemeMbDUUAVkNwrXhX4OT02xrnQMNHTFQde8PLfJdZbMiMsPHkT0JJ1PbTkNo29phuSjJdJT1Sy7pZ2MSe6RoNfuhZXnQoFRBPvNMJEpVSusg1f2hgEsqWsP/OnK+24U+imP9lj1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788964; c=relaxed/simple;
	bh=rxKXOX6VkDWy6uETQN9RI5oCYgXLEojPPXdeXgfWqdE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u5o72JDgz0SycBFc+JGWOloHvwGS5sQ+gctrkumttSHSZjNS4DY4KdqDOSszoWnbLks2AooQlsWJ9lgTr6M2dE1llNbqlOtpxLwADSCUKxWmOFvRNpwBoWau5jnGA/bisw9/sl4spJtvIEXc3frqOKcjTYLXPy7Qi6dK62qAC8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1+D6493; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1BxtlIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264af6H1087507
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 09:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7wdJEe8n94wvzDzCHs4VwOQ5WjMYvaee5BChamjF/hw=; b=W1+D6493bmOJ9itf
	FW1E05EcuX7iGaa77oqnjlShKAvizCMQYb1TNT8wCr6Uk92Ncf8lz3/rfJcbJ0g9
	c1k5paqQ5rvO3niznCFe7w4qM5FOzijxgY6DJQnRExonVp7dkuw6rWguKsYxQh0+
	NsRDhIXMgtQ4VKqmRL/CfpKO0Lt1YY6uYjuP3B6f5Gym032jv5OLE/im4/tqzSh2
	YTSPV2GIANwh3HxcvMabEJ9hBFFAiBQIsYZ+Yv00InfcmcyBCuwsgCo5jWhOX6BK
	gRyBvkzjf4P2uz+uzJ5QAZM62PiT/AnGJud/MS1CvytWa9M3ybxoD37T653T6nag
	MBeyXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6ah2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 09:22:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3ef536ddso2308404885a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 01:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772788961; x=1773393761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7wdJEe8n94wvzDzCHs4VwOQ5WjMYvaee5BChamjF/hw=;
        b=G1BxtlIxgWpjNnP5zRyDB7Nv9dV8++nuEZT8EnS1cyi1OMe02c/gEKnjS70y/Gy4H1
         Po1UCdhk5MUuxDE+0ys8UpC96tEe4Xg77hCNDa/ZeZpXOKhMSF+lxu0bnQ0fpaRC4YXi
         ofgk2kVhlt8LaoHIj5MrWzMbC/Ij6fVtcQgp/jkvjUIGr9BFwOWW1WPeACwzASvgAU0k
         1ZVSa46AA8uZj/68jMS9I4zsvMlbR+cbJSaYl9OOPnJunDrUnVzIpFo9tRFB+HvXBNnD
         tIpbpo6QK/w8pVJJ++NEw8lg9b9LMyA6Pt+CLXct+gI3pQ+kVlYuhZfIxU3Gpgx2kRxu
         9bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788961; x=1773393761;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wdJEe8n94wvzDzCHs4VwOQ5WjMYvaee5BChamjF/hw=;
        b=KPfaNV82VZ7UEfrwdgkUWv+8KsuMQFYDRQiSN55G+k717YJg+4jC6v8v9xJ9H7xiW9
         R4kNM9bCeNGRhpH3Ix35qoAfP7jUyEmpp3JGTVdG7echzxi0u6EsfeI9oxth5Yre2dJb
         mE0i9PWpZT6b1ZMxzBZCIWbsTlqgrySD0a81nEfqPgybGD26u7jug+Mt3LhHL4ZoJsJ5
         Cf6xRelKKbRUE8Mjenhnce2VA85UGVkI/UZaHW41+EFWKudcgPm1Bj6BHLaHOYdlyTZp
         VpLzHrLUKuU0VG9WP+8+ltPMMehDu1v3PEJstxjXCXesjsPpy9y9HihZv/3Ck+3QhD7k
         qCxA==
X-Forwarded-Encrypted: i=1; AJvYcCUUmxquxce3fRNkKFIwT1dCyVpazHgCH0ymAikDePPIQaqko1IrBHIP8AlyPvq3eprhbRs6p5tIqTBN6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2G/FI/ZTStdYCcecFh9BqGjYNIPoc45jsVrcCZfzxQQyKrzSC
	d5oicSzI6aovoBoul15ayybgBg1XJ//Hn2ToSRI32ptBCpQOvl0W0Go1StPm7wK/nDi/DbnVPaj
	rtfToEmtS2gvrpANkZkeI+63ixTOlmvlNC3EEODRpIJVGa1IIYsBLe+fksMxJf0KRxw==
X-Gm-Gg: ATEYQzy8LcfpSw1+IQyMgGtbyqe5vbSB2BZ47R7dEhWaMVmkatFpWMaXroUIVZ2aOK1
	qJ/MmjIdLkXTsBUCaBaody3Yt/hZfhheMfzeOFX2eIoa6vaJtDwN9Da0lr1seMCzbtaJ3nnkpSr
	zsNjo8k0+vkOEc0Xmi6jBLEMbTRfogf08eHgapxfAzC3NirSR53Nv8gmUvNq3d2gKdmQUbYNT/J
	wRfwHekt8+RntRgsNc8Jfe44GAu9kmfxQ4MEVAcnRKV2jqwPx47lL9pYfQKnn13WXT6jzWuO9rV
	amsJ98OA8KAB6h/x8gH7fkv6GFQrCMBEQTODYFTOuO3UrA7wru3bDbH5qXel8c9rZoign268+NZ
	ATdl+fZGnTmmPl3duPDRZF6b+maP7Ti/48Ac85hC8co3Yj4v6CM3oxoLvcLb1MpbqfhfD89mn1t
	+UPrkez+TuxjKiDvj/0ml4CeX9xWeVVcytPpivuxV974IA0oHAPxE2Kl+rpcHE5RjtoARZP04Sv
	tp6atTsXxgkryiY
X-Received: by 2002:a05:620a:280d:b0:8ca:110b:38cb with SMTP id af79cd13be357-8cd6d38f863mr175763485a.29.1772788960969;
        Fri, 06 Mar 2026 01:22:40 -0800 (PST)
X-Received: by 2002:a05:620a:280d:b0:8ca:110b:38cb with SMTP id af79cd13be357-8cd6d38f863mr175761785a.29.1772788960533;
        Fri, 06 Mar 2026 01:22:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15c801sm40650866b.48.2026.03.06.01.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:22:39 -0800 (PST)
Message-ID: <14f431a2-3c31-4f23-88dc-7e2d5c8da50d@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 10:22:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
To: "T, Arun" <arun.t@intel.com>, Sakari Ailus <sakari.ailus@iki.fi>
Cc: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260227133542.970820-1-arun.t@intel.com>
 <20260227133542.970820-2-arun.t@intel.com>
 <aaRPMtWnX7nWShmv@valkosipuli.retiisi.eu>
 <0f2502fb-20cd-4638-8428-9a9eb5318147@oss.qualcomm.com>
 <SA3PR11MB802248098C161FB7EFB7CB529D7AA@SA3PR11MB8022.namprd11.prod.outlook.com>
Content-Language: en-US, nl
In-Reply-To: <SA3PR11MB802248098C161FB7EFB7CB529D7AA@SA3PR11MB8022.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qvsVbx9rNiP3eA5eY7LcQfJ8FLfAkAKP
X-Proofpoint-ORIG-GUID: qvsVbx9rNiP3eA5eY7LcQfJ8FLfAkAKP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NyBTYWx0ZWRfXxv3lZ87ZFIqe
 j0sRSdM2hrH/D296vI601TYYlogCP4En8RA6ZnMgdlNnpwKk+cwAEyRb6wLJ32J6Eg0ydjv56vy
 OkJMlTnhfvClcuEYIhqFy1F56TGmzVBxgAh/Y1IB+TOEZZrXBDwtl7FtYZCBDc3s/nDL707/074
 OYsZcH+IFVLVFdM8wGipV1YH7Y6j6Qt1C7VYnlmrHDatMFL9i5YTEHEbO48n5j6BLlNE8ThsbtG
 h6fbkDh8ahXEMVOU4kIzzSCaQ7lhwGq9GTQv6OKLBAMZpwiKjPKTjXWlSMINTNAfGlKQR7RWB4k
 63TkJaFCOOa9GOCeevhtQe/QcXCg5QajiA6ZXhR6Xgs74HKXbpY7hilrGxG8V4H9szQprkTKpcU
 yhgod/d4TGCISyx/Qn4DqiWVKgWW/MctT1/h0reKnGYh8UXR0+Jy141RYRUBoFTxmE16rkCYz6F
 22hLArxiLwqjEey6XFw==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aa9ce1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=7j0FZ4iXMVMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=-204PKcC4nqfIuXNHFwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060087
X-Rspamd-Queue-Id: 719E721DD3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FROM_DN_EQ_ADDR(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54717-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi,

On 6-Mar-26 09:47, T, Arun wrote:
> Hi Hans, 
> 
> We are using CRD G3 card + ov13b10 (UF and WF), which is supported by Discrete and TPS68470 power solutions.
> WF camera is powered by Discrete and UF camera is powered by TPS68470 PMIC.
> Discrete solution provides regulator name as "avdd".
> TPS68470 provides multiple regulators like "ana". Vdd, dovdd, etc.
> 
> As per your comment We have tried below experiments and shared output below:
> 
> Experiment 1: 
> -Add avdd name as a regulator name.
> 
> static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
>         REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:00"),
> };
> 
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -704,7 +704,6 @@ static const char * const ov13b10_supply_names[] = {
>         "dovdd",        /* Digital I/O power */
>         "avdd",         /* Analog power */
>         "dvdd",         /* Digital core power */
>  };
> 
> Error logs:
> [    0.732156] tps68470-regulator tps68470-regulator: Failed to set supply avdd
> [    0.739297] tps68470-regulator tps68470-regulator: error -EBUSY: registering ANA regulator
> [    0.747663] tps68470-regulator tps68470-regulator: probe with driver tps68470-regulator failed with error -16
> [    3.621085] intel_ipu7_isys.isys intel_ipu7.isys.40: bind ov13b10 1-0010 nlanes is 2 port is 1
> 
> Result:
> Only WF camera sensor is working, which gets the avdd regulator from the discrete solution.
> UF camera gets failed to bind due conflict regulator names.

If you have 2 OVTI13B1 cameras then they will have 2 different
device names, you can see these by doing:

ls /sys/bus/i2c/devices

They will likely be:

"i2c-OVTI13B1:00"
"i2c-OVTI13B1:01"

and since you're getting an error that the discrete INT3472 device
has already registered the "avdd" supply for the "i2c-OVTI13B1:00"
sensor, that means that the tps68470 is likely supplying the
"i2c-OVTI13B1:01" sensor and not the "i2c-OVTI13B1:00" so you
need to have the regulator_consumer_supply maps point to
"i2c-OVTI13B1:01" .

If you boot with "intel_skl_int3472_discrete.dyndbg intel_skl_int3472_common.dyndbg"
add to your kernel commandline then the int3472 code will add
some debug messages to dmesg which let you know which
sensor is mapped to which INT3472:0x device.

Regards,

Hans



