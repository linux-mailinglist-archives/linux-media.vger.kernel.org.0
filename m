Return-Path: <linux-media+bounces-58998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLvqFfkO4mkg1AAAu9opvQ
	(envelope-from <linux-media+bounces-58998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:44:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B7141A5A0
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5209730FB77D
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE2D261B8A;
	Fri, 17 Apr 2026 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvAKv7a7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chKErwtA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E0B3B38AB
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422226; cv=none; b=nvVaGmZdhGrKT3WdIQvwBPPR5OgAFoPj4g4/mNtSEI70idrKPdmSwcszPirSQLe8j3VpOrtXm90ML1kkkeBebXj2jhjsl19Db9RK2CKXTv5v8eqBJ61eUv9/dsyFFCwkDWdx6IHG+ecU+B2bSMgCXSxxKD/mO8YxQPLXDvQdE2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422226; c=relaxed/simple;
	bh=MfLCrftTkRiHF1WkV8QPjh+C8/Zqj/z+uyT5VJqEhu8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iNSCW8p8vTp8gPkMFx0FUfVq1x2Skln61kmtRT2BscANk1lM1CsGZY3O1n2GX4fgM+XAJ5svjfp9AvSHzCvblRGa4Yp27GiVls8aNR6ZbQ4dP8pXYrco1Rp+YrkrynWQI88S8lHBvh4lOmZOawsPtzJ29v6ht5n8TcVtyvb017k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvAKv7a7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chKErwtA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H85fXu667584
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 10:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qi2dAks95bANiDqtVitR6nG9NYJ56qmT+COQZFKso8M=; b=QvAKv7a79toT5ynE
	TWhwzXKw6d2nB4urhxJ3ztbrGiJzJZLaSm6i2Snw30k0eHI4dpXuEUPdo1h+/l38
	RFbcJhyArd9Ed4Tb76mQTz7DAr0fp5k0POSrkI1eawj98O0cGsULbaDZRx1Ebtq0
	ImEH7naUGF/Ul0nPm3CtkQPWCu9mdNFM5/D3swyHDt+K3yANhrCkXzledpFFsiH/
	w0KLTBKW01X78ptzEjsb/NgkMG+WuynxgxRjbR4wjviiT2+mxv5IzEqNcUpK29yn
	yp1ibZ9lN1serNZts9pDJZ/EkLQITTb8xYBE40xWC+lVQbh1LRez69T/s0xiCC2L
	VEnSFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxcsw0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 10:37:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e4c29caso13845911cf.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776422223; x=1777027023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qi2dAks95bANiDqtVitR6nG9NYJ56qmT+COQZFKso8M=;
        b=chKErwtAsnNdgmGzsks7z8dy2pbCRgzSCL9YBWLf/l7ChHmlizL5yW5Xjpj8aYNf/o
         /vs0i54kCsp6V2b2i0DTUUMnPs+93FQWUmtTcRzaczcmJ7Br5Ttb55jOSa1iAMkupElg
         QodlZN+tZp6aR0wvVBbRlQAH7yA9Ny4/5Dyypn3Ihn6GBPwflIy90SPCSqhaFD4X8GNg
         7LO+dLorBeMTg3JXMSr2jtOG7QmUQwcT7N6WwGU15X/C/JtDaS3jgLRrkgRb3zCZ8cWb
         dcTzxSYWoTsSCIfb3s7qET8fPWwuUUYZ4ZcQwu5VEFGmpvlNbNqED7JmIDZhFHstMkXd
         BL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776422223; x=1777027023;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qi2dAks95bANiDqtVitR6nG9NYJ56qmT+COQZFKso8M=;
        b=KfDF8PqCXDYIlW06/s9f8bujtUpiyfdsfOj86kg7t1Ua310/zRiG/LvfGrUBo+8pqT
         FYew+O2EUV3t0yGVdf+hu8Tz39SZXjM0fLX+5j7WnTp/jaQXOSdRzayNOtbFFMFDQObS
         FKxrg+l97evZJkc09X0ovgx2Arr8io9W0tA9Z7rF9e9ZYOPEfaSTDrwuFHcPSpln7Uvp
         FAPpQShHWCE/HyK1sELS8fPjrYPl7dmaNFunAMTWgpw2WwbwuW/wRzBZq8WgNb3dwlMU
         rHN+rbGZL2W/QHHBcNml6+z910cICVM6LtvM4/dk/B4QL6JOMzYx37SIUrNw2tAv2hKZ
         cPnQ==
X-Gm-Message-State: AOJu0YxodTCHUxc/fec6PfJoq65AFExBtBGinDJHmRobKwph+FNYZHIF
	oqo+JzFHB8Qsm/aiUl34n2/MaVJST7XoqG3IoM0HuW271TsxKHl2S6yPUhNIdG2TNtAWSMuVPui
	dxwIC4p4JnmgdLmik7l2pDqxVbuM2jvIs47aytxZmZtpEVmzsAp23kQyTUHAUPWLsvA==
X-Gm-Gg: AeBDiev6VbG4czbhthi/SCGqYeeSHVXEHKLA47/ohWdZWQFEYKyr/t9wM4EIm1r6cdY
	sJwIc7QWUtIa9wLs2mMsCKi0KIqaot5wg/iO2TW0Hi0oVFxR71ZaaM4uCdz5kR9Y1uYVA4KCssv
	I2TD70Glz9KV+ckmJPmOSakfNptxy0WjVzgPL8kICzBwUmSumrTFKbHSoAIuzqG65sCBruulxLF
	TiMWlsuR8FirignUuj6zMVJyMEnwRaIAFwoxLxuPBMGJAWiy2/ZPiV5W/lcDUZjFlf4bhK5fHSe
	Mq9FkW5JIhoRSVnr3IMuLfSka3Jh6UJ1G0o/q0sD1J6FQE3yofXqNrYv2zC03fmsmQcc67jkYAM
	7MA31jPdmNAu66AVnyPDK7OZLfWQfgdUchx7TQF/VCD9olZF8muGO9fROqCQL21Tp9j1LJfexEK
	1Swnn5+Q5CjtaMM760hWFTwdGsQOQLP+Gnrt8HvYx8qQUlo+iV1M6vm3IAPGlQ81WLtDTrh3qIU
	Z7dIzn3XLnBT14eDWFD68nfLJk=
X-Received: by 2002:a05:622a:1650:b0:50b:86f5:8fbc with SMTP id d75a77b69052e-50e36efaeb4mr28189041cf.51.1776422223341;
        Fri, 17 Apr 2026 03:37:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:50b:86f5:8fbc with SMTP id d75a77b69052e-50e36efaeb4mr28188681cf.51.1776422222986;
        Fri, 17 Apr 2026 03:37:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm42130566b.23.2026.04.17.03.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 03:37:02 -0700 (PDT)
Message-ID: <684435ca-dc58-4b46-ac25-467dcf12d976@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 12:37:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] media: ipu-bridge: Add DMI information of Lenovo X9
 to the image upside-down list
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-2-hpa@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <20260417083214.222189-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e20d4f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=20KFwNOVAAAA:8
 a=Aiq9Hgk9keMhYKovH3wA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEwNiBTYWx0ZWRfXwExnxXxthC6K
 Qhu/pOSlul+U9dOpG1O1cZbxPiA6M85cugQtb/RCnFh7Ia6ATD2FeYAgc31YonwTfRE0Ewg0nOA
 B+RFUgma/N32D3D3KOTyQfqc0PIcTi8DLgSdohvEv+M9m8laEtHesc3Jq0QmFd07+aDERivV7GG
 3fLDhrUzLHw1yeMZg5PWHScznaqWrGcmkU0TGj5C9FNZHwWjrjhiaIV4g1pYYlUIScz9ZfOpgmR
 fQymIrvCM7n5nPkaED+efOmEZbO/fSdqiU+ivBObB0DpL6JLlRQxqectEM4vkpTKUaGxqKg1sG5
 XWrApLPl+6oL8eSEFyHZmG9KXOT92OYgf+Yml7sNBGKDu2NaHSqLgyw73l5zRQOER/ucWgaNuT0
 9oPbd0QR59KkCnmNUpn8MIVrGMPRAHN36ZKyEfWae0weUK7l43UeBkmlVoK/anM1tjExJSUSN7d
 FPbtRHbr5KDTroZ9Dzg==
X-Proofpoint-GUID: NUoZaPXeo0UEW0UVT7itpodUyzoekk16
X-Proofpoint-ORIG-GUID: NUoZaPXeo0UEW0UVT7itpodUyzoekk16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58998-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7B7141A5A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kate,

On 17-Apr-26 10:32, Kate Hsuan wrote:
> The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
> was displayed upside-down. Add the DMI information of Lenovo X9 to
> resolve the issue.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 32cc95a766b7..7b5b0dfc0190 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -118,6 +118,38 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
>  		},
>  		.driver_data = "OVTI02C1",
>  	},
> +	{
> +		/* Lenovo X9-14 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> +		},
> +		.driver_data = "SONY471A",
> +	},
> +	{
> +		/* Lenovo X9-14 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "21QB"),
> +		},
> +		.driver_data = "SONY471A",
> +	},

Can you try to instead match on the DMI_PRODUCT_VERSION ?
that should contain "X9-14" or something like that,
allowing you to use 1 entry instead of 2 .


> +	{
> +		/* Lenovo X9-15 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
> +		},
> +		.driver_data = "SONY471A",
> +	},
> +	{
> +		/* Lenovo X9-15 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
> +		},
> +		.driver_data = "SONY471A",
> +	},

Same here.


>  	{} /* Terminating entry */
>  };
>  

Regards,

Hams


