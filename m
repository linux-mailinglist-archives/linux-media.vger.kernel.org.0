Return-Path: <linux-media+bounces-56521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ho6NHeQ/vWn28AIAu9opvQ
	(envelope-from <linux-media+bounces-56521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:39:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B3B2DA61D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2589303EFF5
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3493AF678;
	Fri, 20 Mar 2026 12:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYnc1ANe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtgfCV+9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F9F3AEF22
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010151; cv=none; b=EPT73Sf7IY1CjR4iyOp4sTgj0oJ+5fWXoeZ8b/m25mtN6cjsGa1evFzuMIBNIA4uXiKnbIprWpiziWaizhW2BFdcaVmj2Tg3qAfx2mYiUw3hInENQ8WOndwEryqtnzkMbp5MDVL3IBZKr0btpuLpUWfdESYoQChxse7cHzt78Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010151; c=relaxed/simple;
	bh=54lHMsjHOrn9V4A7TThSTPvE5/wouaGjwwzAXvEcwUU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tdklqni6WA2odZzVzzozSTEDSfqLXAnxK16Bq7W+Ghjfcpq8GOiKhxhAwjSb2UBpp0NrkUQHyzsGlmzA1OlV+9gujWHlDd2Z2xSkIPJkwo3k9feqBqBpRISxEiblnupTr79XBR9IoN7Upfr1yLrdD5W/fLopaLTWxzIGV9xiP7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYnc1ANe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtgfCV+9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KBs0Jt3874981
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsK9hAD/QyzioqCaRhacmU1DRL9xXeb+JzkPagHOWcw=; b=aYnc1ANeAvH3zQrL
	nZXw+xKE8NyKO+ov45AVCgseCBNNDko0LGdV/ynt/23l3AzKpCaRRiqyzWxAsxXP
	ntkVH3vsm8cyTZao/1o6kvNnXcMI0iCS82GFdOdq9MPSPodyvRDoUEjwnA+6RHLl
	VilB3Ivdx3ymsS/D2qt46bZLgmriVyA/SsHTdo0wRTZMyP12xFrRhlF9ZJsS2Fqd
	RL8yf7hrXtjCZdBxS/hzyfeG8mr8XVlkTcXlPe4nQe5ZfyAedCMUacCK+9u7/73e
	K6pYW5t0G+zqymRCQ6Efu57U34FP7hj40SByBkzFuBzpklksUMFAOh4HspIOuQJE
	Scnzdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d15s082y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:35:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso134113141cf.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774010145; x=1774614945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wsK9hAD/QyzioqCaRhacmU1DRL9xXeb+JzkPagHOWcw=;
        b=AtgfCV+9d8Tw72XflyEbWGIjO7aglQO/bX0EAoCUHqgTsOFBZqHv75wovh1B9L8X7Q
         NvGpI0uhY9kdAIvDG5ckS4+UVNW+bE1yTJDGF1HcEmRGwefIys/1J4ywdOlYBcoK8S0O
         7+WfIYFk466LWa3rSW6HkhkAaMUgX/CJzMbi10gRplWuN97McENFIlESAVTYwtRBvytJ
         RQOXdnYTIgDGoveje/Yruu7UWT1558SJqhah8LrpaN0QxC5qDzgtZhEDGvoqHrKCDSzz
         OtmUam5e0yzGI9wMMetbz0/0921fGEcRZPh4wQMiJqNGd9DG+Q7ycvdu2B2wBtO/ZcfN
         bzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010145; x=1774614945;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsK9hAD/QyzioqCaRhacmU1DRL9xXeb+JzkPagHOWcw=;
        b=jm5Fzc3tUNJkhz8yZBWm1duIgt8/4SEU3Dk5fr/TYJ2goqDr346nQEwt4tPmKrVjFU
         MwgZjYY73CZ+l6rZy0CHhX02gfRm/VM1IBU6pfiPVKghwuX39HGgToxrZDRi6RQX8q+G
         Dts/TFRMOOHz+hdEV7kOMIwfu6uTVVDueMZm0t87UrIBzPWazxWqqEoQ88oEMV44SPws
         nea/jvXeHqdeVYAhtdjoOUOCqTKpWI6yIfrlCk760Ln/f+qRgEYCDIcxGZcHbhDmX5ga
         W5U44YubtVAmfm7c5B69kXnDNlIR7IgmqjvxfLWTdCRC/h8hI649zVzdFlQsE3GkpGnQ
         /hfw==
X-Forwarded-Encrypted: i=1; AJvYcCXhNhZu7Yopi1Djvyh7+YJn9hgcS9C8jkxwcjuIB7zxy7Qiiev8P08JF4rhAwqqHC9veMvlsNrzUF3wqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiTqS3lGvEcwqeDIvcGgDVCggZVQDN1h67p/FhP9JReLGklj4I
	0tLNl5xAGfRk17VWeSVgA47iHCgsOdBG9en3WGtgaL6tVUbdgQYllZn7PBBV3YE3iiMbW6D4pF2
	wZG2w0QJ/LCeWPS67O9+zge6f31X10yX/vY5XUE6+atWv70o+lRDjpsVgp/TDnYyHp6GfxcMElA
	==
X-Gm-Gg: ATEYQzzO+KoeHVFObpJApe0O1rAspDzPpZtFueoRt4QCqoK3HR+1hLynl2vONfqShmJ
	zIJLBbc0VfNQDvBjFoEZ9uZQm1iul8GspKXLayT7uHMhQBgrSvH9OVDNp6FFJ/YYmyZs+UfwB3W
	hEF0uFZrDvYBgGrsPC34i/nQzX2wONYRSgqJZsHlLiN+M9xkCbfZofKtD73/Ef44SxDExOKje8F
	rZPJA8RjdA9EkTHXf7t3U6IiuXehrfEsosCnpKxTwgU5qNQEB5AJ9y1WvGyVdqTHhCkagk11PXz
	mqJ9Qc83H/pYBVZBsGlL6RwkqsfT9H9Ib7AOCEoXKNxtUjO97q+sj1OO8af8kk8hJZmFjWFKRDv
	kCGD68K5BE/7ApS0RZu2PoWcoXHTj+L82sYc+qrP4tVv8DtxgsVOrF3ijUWDSGsWuA2fcJ3ohPE
	yu0QddHJz+9jyzJGwZ6t6fUl2nIswrwpGFnkGxODjjzg0djbx27di3TSYczIEwWZJxoUGl3M2zo
	JOYlCm/+PmASGPD
X-Received: by 2002:a05:622a:14f:b0:509:1009:e79d with SMTP id d75a77b69052e-50b37544f94mr38962711cf.55.1774010144580;
        Fri, 20 Mar 2026 05:35:44 -0700 (PDT)
X-Received: by 2002:a05:622a:14f:b0:509:1009:e79d with SMTP id d75a77b69052e-50b37544f94mr38962281cf.55.1774010144084;
        Fri, 20 Mar 2026 05:35:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfa1sm153471166b.32.2026.03.20.05.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 05:35:43 -0700 (PDT)
Message-ID: <dc1a1031-ab02-49b6-865c-a8cd3a86ed7b@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 13:35:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe)
 mapping
To: Marco Nenciarini <mnencia@kcore.it>, platform-driver-x86@vger.kernel.org,
        linux-media@vger.kernel.org
Cc: hao.yao@intel.com, hdegoede@redhat.com, sakari.ailus@linux.intel.com,
        andy@kernel.org
References: <ab0UvRdDpvZBiNsC@spark.kcore.it>
Content-Language: en-US, nl
In-Reply-To: <ab0UvRdDpvZBiNsC@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Eh3-2VfBewGBtQcRI5MSWnfxToSADg-d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA5OSBTYWx0ZWRfX13NyUGhCxO0t
 KJhoi+1NrXZEEhg4Ze7tbsdqCTF5eVgnQQfjbUbsaMsB0Fx8TCBPzzadnfeUSh4Xm4Q2zmmA9Os
 Z47UCjgR3Y6p+aY2tZ9soIbE0jR4a4kfrrDcX5FgGxBOEfcn0uW/Xwd9wTGsjMdAIvplfq4x+j4
 RI20eQ7XaaXFTtCQ6D+3loFjxRhKO7FzrmMu3oPL3VAp0FwAngsWK8qAgPoUEe9yDtm/I0dxUuQ
 zMS3CGZwm11QSu457Lu/L5ecELBeOJ/g1IccUtIA+WH9wppKllykVAhF1bYGCppG0/H8eB96Kn7
 9Ncvvx+vK6gosKhT806wdHPvtJDpeBMK8RgT6B87aqOZdFtAEZGl7cQgeJRaw60nIiaR6R/pzfu
 1O9GRLZaVh9J5u5ICIXD3n12khOz+4qVSSUr7QVUncWjDy7yBPiBUCBoTo1mpld70AnXrroQner
 uxzHax6UGlWskQCyapg==
X-Proofpoint-GUID: Eh3-2VfBewGBtQcRI5MSWnfxToSADg-d
X-Authority-Analysis: v=2.4 cv=KORXzVFo c=1 sm=1 tr=0 ts=69bd3f21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8 a=20KFwNOVAAAA:8
 a=ymfDR22bKki68zKXmREA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56521-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,kcore.it:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,launchpad.net:url];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35B3B2DA61D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 20-Mar-26 10:34, Marco Nenciarini wrote:
> Some ACPI tables on Intel Meteor Lake and Arrow Lake platforms define
> GPIO resources with type 0x02 for INT3472 camera sensor power control.
> This type is not currently handled, causing a "GPIO type 0x02 unknown;
> the sensor may not work" warning and preventing proper sensor power
> sequencing.
> 
> Map GPIO type 0x02 (strobe) to the privacy LED handler, matching the
> approach used for similar illumination-related GPIOs. This is consistent
> with the original proposal by Hao Yao [1].
> 
> Tested on a Dell Pro Max 16 Premium (Arrow Lake-H) with OmniVision
> OV08F4 sensor connected via Intel IPU6 and Synaptics SVP7500 USBIO
> bridge. With this patch applied, the int3472-discrete driver no longer
> warns about unknown GPIO type 0x02, and the sensor probes successfully.

The strobe GPIO is typically used only for IR sensors (for Windows Hello)
and the  OV08F4 / ov08x40 is the regular color sensor.

Did you check with your latest working setup that this patch is
necessary at all ?  I would expect (other then the warning) things to
work fine without this patch, you likely have 2 INT3472 ACPI devices
and the one throwing the warning is not used for the OVTI08F4 sensor.

The GPIO with type 0x02 seems to control an IR flood LED to IR illuminate
the scene when the IR camera is on. As such mapping it as a privacy LED
is not really what we want.

Mapping it as a LED makes sense, but we should give it a different
name. So add a name parameter to skl_int3472_register_pled() and
rename the function to skl_int3472_register_led().

And then for the existing privacy LED pass: "privacy_led" as
name and for the type 0x02 GPIO pass: "ir_flood_led" as name
parameter ?

This solves things from the int3472 pov, but is not really
helpful otherwise.

Arguably we do want to turn on the ir_flood_led on streaming on
automatically like we do for the privacy LED atm. But just using
a different name gives us flexibility to allow more fine-grained
control in the future ...

Sakari any remarks from the V4L2 side here ?

Regards,

Hans




> [1] https://lore.kernel.org/all/20231007021309.9332-1-hao.yao@intel.com/
> 
> Link: https://bugs.debian.org/1130114
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2138991
> Cc: Hao Yao <hao.yao@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 3 +++
>  include/linux/platform_data/x86/int3472.h     | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 1505fc3..39ca60b 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -211,6 +211,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "clk-enable";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_STROBE:
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  		*con_id = "privacy-led";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -330,6 +331,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  		break;
>  	case INT3472_GPIO_TYPE_CLK_ENABLE:
> +	case INT3472_GPIO_TYPE_STROBE:
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>  	case INT3472_GPIO_TYPE_HANDSHAKE:
> @@ -347,6 +349,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  				err_msg = "Failed to register clock\n";
>  
>  			break;
> +		case INT3472_GPIO_TYPE_STROBE:
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
>  			ret = skl_int3472_register_pled(int3472, gpio);
>  			if (ret)
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index b1b8375..85adeb0 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -23,6 +23,7 @@
>  /* PMIC GPIO Types */
>  #define INT3472_GPIO_TYPE_RESET					0x00
>  #define INT3472_GPIO_TYPE_POWERDOWN				0x01
> +#define INT3472_GPIO_TYPE_STROBE				0x02
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d


