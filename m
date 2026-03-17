Return-Path: <linux-media+bounces-56052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKlJEBNEuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:07:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 603562A984F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AC3B3055E46
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC861DF742;
	Tue, 17 Mar 2026 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7RZihOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGLDTuaJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698393BAD97
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749076; cv=none; b=i9c0VsXmqlg6FRkgM8IAvh1xrszIFW9gPLrbUZh7FB1x4xW1FSCg3D9P6SX8GMEYxFId8VWezsfeEtQxZ5jwICm3Re6xe934RWmb5+qsPy1XCmmrlUO6J4ZDQ69AmaW0A44Q2o2fGAJZGnAC44OwO7JFH6DHojAcjbTtIPrYyhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749076; c=relaxed/simple;
	bh=+Wb7Eu70MTOqTAY4Se1BY37qjCjaxorBgwEoa3mEnzg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IlVrnyMe/I7J9eDwZmup95YJgXPzMuQ6o485TyevX3PmQtS8zpMAM2xsChl+/Qk+AbbcOdhHqqxF6FUgF6yWPs+E8UJWeREsS+tq9xWpMt+riF0DZZ0yicxS91nXmPhojUdHBk4uPQ7lYwrfpRB7i4Zerz1/IvJaC+g/3jLvTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7RZihOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGLDTuaJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H9CD6I3102502
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrOlQF2AKokrILl9o9KtFU50g8O0Rz+LhsOAJAQodMs=; b=o7RZihOoC95tnT7D
	OsS948iopk1TJoZS1XCIT8OTY6Rvgn4Xc0UBnfMhT6+NyilO7pW6yECyRWnjvbA0
	RqDeWrOJWHW+BtfwnjDhQHplDMyQLV1bSGjB9J0kKLSKUWvmddyuhvwX+yCiDYfa
	6o760B3ABv5UP1MwwI4NbnJXIuJzQHB/eERsrvnsgqU+FmJ2entTEi/eSx0jMhIt
	1SldDi00vtqVsbP+PqbyfU+0nYW16jxW31vtu6strKY6TvK5yLK1/6+BlDKTazNM
	5uUxnvTvXXPTEH2b1TAqh3Ei8axeXYTswJiGVqdGsWLnpHkzcq5CUKB2Wle7zGMe
	PgXLoQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7bnca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:04:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60276247301so237093137.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773749069; x=1774353869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HrOlQF2AKokrILl9o9KtFU50g8O0Rz+LhsOAJAQodMs=;
        b=VGLDTuaJkStnEWCvz2mf+r6yjdd+duLqyvlFJyAKI7z/AZI+UdutRnorcJ6DfE6GnT
         C309nGGOhu6oMNUmbahzGglUjQopKf1di0RFMx0I5+pUTAADMxJLKhjNxkhjvkJE2MWv
         DAxxFvGTqWifv7x2XE5fjscdwqqIVqrxCkQnGtrubKdbk1bjGDjVqRmqqlxixGUvQHZv
         uoTnGd7iHELiFdIOeONx7fjcjsyy6L6OFNEp+O0ZH5xABkTUMLYC1YzrD0d+Fh/2K4u7
         Mm4opeMcfPAkWsky1+3hdxNtdPPBW0epv6NZT+T4e6Q7tyCnmGwatlG5ps6SKi2vEmFR
         v03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749069; x=1774353869;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrOlQF2AKokrILl9o9KtFU50g8O0Rz+LhsOAJAQodMs=;
        b=MugJzKRl8+C83SCu6T+Swfc+mSIJ9TsDe5P1T3MzVEKAD/U8PfejLwFA9u3uac6tpx
         tPAypR6gXlFDHqTUq0iiti83VLpU+yxZMMXEPvu6MqK8/fJv6F+ySCyDflt60qixgAP2
         J17HabHA+i0vhhFvZmk6uN5SEP7z0OJji4Xl6EprVeZo9Hc1wz7nlHh4UyloRY3G7P5d
         kxs6N7ySoj7FdUyrRaltYz4A/35V4zNNUG89hGFcFmq+5lGVJOaHy8mdJ227JOL1O0Nt
         +ywTP6Cn/1dySQw+RvuhrZtKymfPZkkGnGjhSvhwbJwvXIhL1u+i78jZA4zI3G4DK/tf
         E33g==
X-Forwarded-Encrypted: i=1; AJvYcCW3MaUhAtVa0xcWNi6pwCsR0dcIoPcvTEZ3n1irYFiCPN18njP18Nx7M1tWJOoq6h7xpf4Jq5a3KbiVNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ53CI4PrKUe9wwiXvrc9u4MqcGb70muFOUvSd3cKNmRSn3GN4
	vHNZLy3tLyt1QWME7X9pm5orUwlHCT9sRSx4d+wWMes59+tm5mhKZUBpkmqROXTGiEX7wzl90le
	lUdfLlWI0R3bOqKiouDgRE3pKnSdRw/3Dgizsfe5zGJE5AqYqU12SvxAE3DgZVTQH6A==
X-Gm-Gg: ATEYQzwlkaItWDFG2yl57RNSb7EXoc1hBPtrpOo0jLjtE44kQ+POB1/zBpo4aVTTsd4
	QyrCa9oEo93KHJKdOUjx43b3rux/t+e35Al69e09Gcb7mUh5X0Md1aW5x+mw4CslVOCgOgeHN4B
	odgZFd/fE7kPYujygnr5tkuja5+Py58cyivcj9GEL2iThRVMlVA8l3c1p0Z+PCN4PPHvfafwQi+
	FPYW0OSWl5wunnWLf8B1BjMoz1s3vXu4vOzjT5a9jXG8ehB+hO1Wr+YGWU1m8EqtpxFW9ZasAB2
	6+qvKD5oZQ1W52W4y/JqHIB3TCvOR7mnscS+XJdcpspJdLX9sHHS3gGd1w2btPvif7IBl8Vc8Ih
	QowgqeqVx9vK+c30TY/JwgDHQxMMAUF/Qk0rrCk5BSxYy2zISRPMZ2tBGoE3f5l0kF2DC5jcUAv
	5c2N44JfZJr3SThRzCYBEo0gMyB0uLcDDrvUSpq59Uk6viNcmbuSXVii5ZccaiCq7glSytjpz0L
	b+LhuBy7b/Aze3u
X-Received: by 2002:a05:6102:41a6:b0:5fc:9758:eae4 with SMTP id ada2fe7eead31-6020e4cbee8mr5230283137.20.1773749068493;
        Tue, 17 Mar 2026 05:04:28 -0700 (PDT)
X-Received: by 2002:a05:6102:41a6:b0:5fc:9758:eae4 with SMTP id ada2fe7eead31-6020e4cbee8mr5230220137.20.1773749067644;
        Tue, 17 Mar 2026 05:04:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9795d9fc85sm570388166b.61.2026.03.17.05.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 05:04:26 -0700 (PDT)
Message-ID: <db37c675-2098-4a56-9aca-25617b0d0532@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:04:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
References: <20260316085704.352669-1-hpa@redhat.com>
 <abh9evUPzozh40k-@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <abh9evUPzozh40k-@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwNiBTYWx0ZWRfX9MEMu1fvC/sx
 sieOXWhBicoIw4/f3YYY35KtebxHiSugYMCD8MsG5e02cXMi+j/g7WgEoyc3yYJ1gMfxt1djb+A
 dRgRapl0F9OPV3Q5D6FjjvoLKVuRtVgFxkz481ljPsmUXMnE46ULCfzjQhJCPX5FRSXurqbaGuf
 jZ/EGwqPgzQhfa7McqUAF9VH+4/KDudEQhy4PY8jdJgOO3oxqssnXzJsfcR3d0RGMsLrhMYQUdV
 vbLfX9iLO4883wdRwKaKoXvRFaJZ6CbQtoeUSakygr1A8gf8Fusd453MZIc++GRGO2EUtRtSnI2
 /p8760VYSvOf5nNzNQM3mQb1tTxjuoO50i+jzkF3gSNbZY+ahica1kwSmtevgawPaK3Tye+UccE
 34YsgkpE+OG3zWVnrA0hQe3/ubTvLiFJduuaShyEsglBTfdHE4dErgQXyZqLDomYF8fqkPB0l/c
 eLF6KjjJ0HZCiGPNPdA==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b9434e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=QyXUC8HyAAAA:8 a=-gST84dZs4yHfBtvTPMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-ORIG-GUID: ps7PZbCB1K14ljvKfBzje1qtdpPwlD5n
X-Proofpoint-GUID: ps7PZbCB1K14ljvKfBzje1qtdpPwlD5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-56052-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,checkpatch.pl:url,rect.top:url];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 603562A984F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On 16-Mar-26 23:00, Sakari Ailus wrote:
> Hi Kate,
> 
> Thanks for the patch.
> 
> Where have you seen this sensor being used, if I may ask?

Both Kate and I have tested this driver on a Xiaomi Mi Pad 2
where it connected to the atomisp part of a Cherry Trail SoC.

Regards,

Hans



> 
> On Mon, Mar 16, 2026 at 04:57:04PM +0800, Kate Hsuan wrote:
>> Add the t4ka3 driver from:
>> https://github.com/kitakar5525/surface3-atomisp-cameras.git
>>
>> With many cleanups / changes (almost a full rewrite) to make it suitable
>> for upstream:
>>
>> * Remove the VCM and VCM-OTP support, the mainline kernel models VCMs and
>>   calibration data eeproms as separate v4l2-subdev-s.
>>
>> * Remove the integration-factor t4ka3_get_intg_factor() support and IOCTL,
>>   this provided info to userspace through an atomisp private IOCTL.
>>
>> * Turn atomisp specific exposure/gain IOCTL into standard v4l2 controls.
>>
>> * Use normal ACPI power-management in combination with runtime-pm support
>>   instead of atomisp specific GMIN power-management code.
>>
>> * Turn into a standard V4L2 sensor driver using
>>   v4l2_async_register_subdev_sensor().
>>
>> * Add vblank, hblank, and link-freq controls; drop get_frame_interval().
>>
>> * Use CCI register helpers.
>>
>> * Calculate values for modes instead of using fixed register-value lists,
>>   allowing arbritrary modes.
>>
>> * Add get_selection() and set_selection() support
>>
>> * Add a CSI2 bus configuration check
>>
>> This been tested on a Xiaomi Mipad2 tablet which has a T4KA3 sensor with
>> DW9761 VCM as back sensor.
>>
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Co-developed-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> ---
>> Changes in v11:
>> 1. Rebase on the latest next branch.
>>
>> Changes in v10:
>> 1. Fix the format settings.
>> 2. Fix the hblank range calculation.
>> 3. In t4ka3_enable_stream(), powerdown when pm_runtime_get_sync() fails.
>> 4. Fix the clean up call sequence when removing the driver.
>> 5. Fix the error handling in t4ka3_probe().
>>
>> Changes in v9:
>> 1. Apply Hans' fix patch to fix the lock issue and squash it into this
>>    patch.
>> https://lore.kernel.org/linux-media/33dd5660-efb6-47e0-9672-f3ae65751185@kernel.org/
>>
>> Changes in v8:
>> 1. Drop the local mutex lock and v4l2-core manages all the locking.
>> 2. __t4ka3_get_pad_format() and __t4ka3_get_pad_crop() are replaced with
>>    v4l2_subdev_state_get_format() and v4l2_subdev_state_get_crop().
>> 3. The deprecated s_stream was replaced with enable_streams() and
>>    disable_streams().
>> 4. Drop unused functions.
>> 5. t4ka3_get_active_format() helper is used to get the active format.
>> 6. v4l2_link_freq_to_bitmap() is used to check and get the supported
>>    link frequency.
>>
>> Changes in v7:
>> 1. Add pixel_rate control.
>>
>> Changes in v6:
>> 1. t4ka3_s_config() was removed.
>> 2. The unused macros were removed.
>> 3. The runtime pm initial flow was improved.
>> 4. In remove(), if the device is not in the "suspend" state, the device
>>    will be manually turned off.
>>
>> Changes in v5:
>> 1. Improved Kconfig help description.
>>
>> Changes in v4:
>> 1. Another CI issue fixes.
>>
>> Changes in v3:
>> 1. Fix the issues reported by the CI system.
>>
>> Changes in v2:
>> 1. The regmap information was obtained before configuring runtime PM so
>>    probe() can return without disabling runtime PM.
>> 2. In t4ka3_s_stream(), return -EBUSY when the streaming is enabled.
>> ---
>>  drivers/media/i2c/Kconfig  |   12 +
>>  drivers/media/i2c/Makefile |    1 +
>>  drivers/media/i2c/t4ka3.c  | 1085 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 1098 insertions(+)
>>  create mode 100644 drivers/media/i2c/t4ka3.c
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 20482be35f26..6344defdbb51 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -790,6 +790,18 @@ config VIDEO_S5KJN1
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called s5kjn1.
>>  
>> +config VIDEO_T4KA3
>> +	tristate "Toshiba T4KA3 sensor support"
>> +	depends on ACPI || COMPILE_TEST
>> +	depends on GPIOLIB
>> +	select V4L2_CCI_I2C
>> +	help
>> +	  This is a Video4Linux2 sensor driver for the Toshiba T4KA3 8 MP
>> +	  camera sensor.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called t4ka3.
>> +
>>  config VIDEO_VD55G1
>>  	tristate "ST VD55G1 sensor support"
>>  	select V4L2_CCI_I2C
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index a3a6396df3c4..64c0c7964998 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -139,6 +139,7 @@ obj-$(CONFIG_VIDEO_SAA717X) += saa717x.o
>>  obj-$(CONFIG_VIDEO_SAA7185) += saa7185.o
>>  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
>>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
>> +obj-$(CONFIG_VIDEO_T4KA3) += t4ka3.o
>>  obj-$(CONFIG_VIDEO_TC358743) += tc358743.o
>>  obj-$(CONFIG_VIDEO_TC358746) += tc358746.o
>>  obj-$(CONFIG_VIDEO_TDA1997X) += tda1997x.o
>> diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
>> new file mode 100644
>> index 000000000000..d9af5e51f7a8
>> --- /dev/null
>> +++ b/drivers/media/i2c/t4ka3.c
>> @@ -0,0 +1,1085 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Support for T4KA3 8M camera sensor.
>> + *
>> + * Copyright (C) 2015 Intel Corporation. All Rights Reserved.
>> + * Copyright (C) 2016 XiaoMi, Inc.
>> + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
> 
> Any 2026 copyrights?
> 
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/bits.h>
>> +#include <linux/delay.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/types.h>
>> +
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-cci.h>
>> +#include <media/v4l2-common.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#define T4KA3_NATIVE_WIDTH			3280
>> +#define T4KA3_NATIVE_HEIGHT			2464
>> +#define T4KA3_NATIVE_START_LEFT			0
>> +#define T4KA3_NATIVE_START_TOP			0
>> +#define T4KA3_ACTIVE_WIDTH			3280
>> +#define T4KA3_ACTIVE_HEIGHT			2460
>> +#define T4KA3_ACTIVE_START_LEFT			0
>> +#define T4KA3_ACTIVE_START_TOP			2
>> +#define T4KA3_MIN_CROP_WIDTH			2
>> +#define T4KA3_MIN_CROP_HEIGHT			2
>> +
>> +#define T4KA3_PIXELS_PER_LINE			3440
>> +#define T4KA3_LINES_PER_FRAME_30FPS		2492
>> +#define T4KA3_FPS				30
>> +#define T4KA3_PIXEL_RATE \
>> +	(T4KA3_PIXELS_PER_LINE * T4KA3_LINES_PER_FRAME_30FPS * T4KA3_FPS)
>> +
>> +/*
>> + * TODO this really should be derived from the 19.2 MHz xvclk combined
>> + * with the PLL settings. But without a datasheet this is the closest
>> + * approximation possible.
>> + *
>> + * link-freq = pixel_rate * bpp / (lanes * 2)
>> + * (lanes * 2) because CSI lanes use double-data-rate (DDR) signalling.
>> + * bpp = 10 and lanes = 4
>> + */
>> +#define T4KA3_LINK_FREQ				((u64)T4KA3_PIXEL_RATE * 10 / 8)
>> +
>> +/* For enum_frame_size() full-size + binned-/quarter-size */
>> +#define T4KA3_FRAME_SIZES			2
>> +
>> +#define T4KA3_REG_PRODUCT_ID_HIGH		CCI_REG8(0x0000)
>> +#define T4KA3_REG_PRODUCT_ID_LOW		CCI_REG8(0x0001)
>> +#define T4KA3_PRODUCT_ID			0x1490
>> +
>> +#define T4KA3_REG_STREAM			CCI_REG8(0x0100)
>> +#define T4KA3_REG_IMG_ORIENTATION		CCI_REG8(0x0101)
>> +#define T4KA3_HFLIP_BIT				BIT(0)
>> +#define T4KA3_VFLIP_BIT				BIT(1)
>> +#define T4KA3_REG_PARAM_HOLD			CCI_REG8(0x0104)
>> +#define T4KA3_REG_COARSE_INTEGRATION_TIME	CCI_REG16(0x0202)
>> +#define T4KA3_COARSE_INTEGRATION_TIME_MARGIN	6
>> +#define T4KA3_REG_DIGGAIN_GREEN_R		CCI_REG16(0x020e)
>> +#define T4KA3_REG_DIGGAIN_RED			CCI_REG16(0x0210)
>> +#define T4KA3_REG_DIGGAIN_BLUE			CCI_REG16(0x0212)
>> +#define T4KA3_REG_DIGGAIN_GREEN_B		CCI_REG16(0x0214)
>> +#define T4KA3_REG_GLOBAL_GAIN			CCI_REG16(0x0234)
>> +#define T4KA3_MIN_GLOBAL_GAIN_SUPPORTED		0x0080
>> +#define T4KA3_MAX_GLOBAL_GAIN_SUPPORTED		0x07ff
>> +#define T4KA3_REG_FRAME_LENGTH_LINES		CCI_REG16(0x0340) /* aka VTS */
>> +/* FIXME: need a datasheet to verify the min + max vblank values */
>> +#define T4KA3_MIN_VBLANK			4
>> +#define T4KA3_MAX_VBLANK			0xffff
>> +#define T4KA3_REG_PIXELS_PER_LINE		CCI_REG16(0x0342) /* aka HTS */
>> +/* These 2 being horz/vert start is a guess (no datasheet), always 0 */
>> +#define T4KA3_REG_HORZ_START			CCI_REG16(0x0344)
>> +#define T4KA3_REG_VERT_START			CCI_REG16(0x0346)
>> +/* Always 3279 (T4KA3_NATIVE_WIDTH - 1, window is used to crop */
>> +#define T4KA3_REG_HORZ_END			CCI_REG16(0x0348)
>> +/* Always 2463 (T4KA3_NATIVE_HEIGHT - 1, window is used to crop */
>> +#define T4KA3_REG_VERT_END			CCI_REG16(0x034a)
>> +/* Output size (after cropping/window) */
>> +#define T4KA3_REG_HORZ_OUTPUT_SIZE		CCI_REG16(0x034c)
>> +#define T4KA3_REG_VERT_OUTPUT_SIZE		CCI_REG16(0x034e)
>> +/* Window/crop start + size *after* binning */
>> +#define T4KA3_REG_WIN_START_X			CCI_REG16(0x0408)
>> +#define T4KA3_REG_WIN_START_Y			CCI_REG16(0x040a)
>> +#define T4KA3_REG_WIN_WIDTH			CCI_REG16(0x040c)
>> +#define T4KA3_REG_WIN_HEIGHT			CCI_REG16(0x040e)
>> +#define T4KA3_REG_TEST_PATTERN_MODE		CCI_REG8(0x0601)
>> +/* Unknown register at address 0x0900 */
>> +#define T4KA3_REG_0900				CCI_REG8(0x0900)
>> +#define T4KA3_REG_BINNING			CCI_REG8(0x0901)
>> +#define T4KA3_BINNING_VAL(_b) \
>> +	({ typeof(_b) (b) = (_b); \
>> +	((b) << 4) | (b); })
> 
> I'd either use an inline function or a regular macro here; in the latter
> case I wouldn't mind about the checkpatch.pl warning related to argument
> double use.
> 
>> +
>> +struct t4ka3_ctrls {
>> +	struct v4l2_ctrl_handler handler;
>> +	struct v4l2_ctrl *hflip;
>> +	struct v4l2_ctrl *vflip;
>> +	struct v4l2_ctrl *vblank;
>> +	struct v4l2_ctrl *hblank;
>> +	struct v4l2_ctrl *exposure;
>> +	struct v4l2_ctrl *gain;
>> +	struct v4l2_ctrl *test_pattern;
>> +	struct v4l2_ctrl *link_freq;
>> +	struct v4l2_ctrl *pixel_rate;
> 
> Do you need all these in the struct? E.g. gain appears to be unused.
> 
>> +};
>> +
>> +struct t4ka3_mode {
>> +	int				binning;
>> +	u16				win_x;
>> +	u16				win_y;
> 
> The rest of the fields have just a space between the type and the field
> name. I'd do the same here.
> 
>> +};
>> +
>> +struct t4ka3_data {
>> +	struct v4l2_subdev sd;
>> +	struct media_pad pad;
>> +	struct mutex lock; /* serialize sensor's ioctl */
>> +	struct t4ka3_ctrls ctrls;
>> +	struct t4ka3_mode mode;
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +	struct gpio_desc *powerdown_gpio;
>> +	struct gpio_desc *reset_gpio;
>> +	s64 link_freq[1];
>> +	int streaming;
>> +
>> +	/* MIPI lane info */
>> +	u32 link_freq_index;
>> +	u8 mipi_lanes;
>> +};
>> +
>> +/* init settings */
>> +static const struct cci_reg_sequence t4ka3_init_config[] = {
>> +	{CCI_REG8(0x4136), 0x13},
> 
> 	{ Spaces inside braces, please. },
> 
>> +	{CCI_REG8(0x4137), 0x33},
>> +	{CCI_REG8(0x3094), 0x01},
>> +	{CCI_REG8(0x0233), 0x01},
>> +	{CCI_REG8(0x4B06), 0x01},
>> +	{CCI_REG8(0x4B07), 0x01},
>> +	{CCI_REG8(0x3028), 0x01},
>> +	{CCI_REG8(0x3032), 0x14},
>> +	{CCI_REG8(0x305C), 0x0C},
>> +	{CCI_REG8(0x306D), 0x0A},
>> +	{CCI_REG8(0x3071), 0xFA},
>> +	{CCI_REG8(0x307E), 0x0A},
>> +	{CCI_REG8(0x307F), 0xFC},
>> +	{CCI_REG8(0x3091), 0x04},
>> +	{CCI_REG8(0x3092), 0x60},
>> +	{CCI_REG8(0x3096), 0xC0},
>> +	{CCI_REG8(0x3100), 0x07},
>> +	{CCI_REG8(0x3101), 0x4C},
>> +	{CCI_REG8(0x3118), 0xCC},
>> +	{CCI_REG8(0x3139), 0x06},
>> +	{CCI_REG8(0x313A), 0x06},
>> +	{CCI_REG8(0x313B), 0x04},
>> +	{CCI_REG8(0x3143), 0x02},
>> +	{CCI_REG8(0x314F), 0x0E},
>> +	{CCI_REG8(0x3169), 0x99},
>> +	{CCI_REG8(0x316A), 0x99},
>> +	{CCI_REG8(0x3171), 0x05},
>> +	{CCI_REG8(0x31A1), 0xA7},
>> +	{CCI_REG8(0x31A2), 0x9C},
>> +	{CCI_REG8(0x31A3), 0x8F},
>> +	{CCI_REG8(0x31A4), 0x75},
>> +	{CCI_REG8(0x31A5), 0xEE},
>> +	{CCI_REG8(0x31A6), 0xEA},
>> +	{CCI_REG8(0x31A7), 0xE4},
>> +	{CCI_REG8(0x31A8), 0xE4},
>> +	{CCI_REG8(0x31DF), 0x05},
>> +	{CCI_REG8(0x31EC), 0x1B},
>> +	{CCI_REG8(0x31ED), 0x1B},
>> +	{CCI_REG8(0x31EE), 0x1B},
>> +	{CCI_REG8(0x31F0), 0x1B},
>> +	{CCI_REG8(0x31F1), 0x1B},
>> +	{CCI_REG8(0x31F2), 0x1B},
>> +	{CCI_REG8(0x3204), 0x3F},
>> +	{CCI_REG8(0x3205), 0x03},
>> +	{CCI_REG8(0x3210), 0x01},
>> +	{CCI_REG8(0x3216), 0x68},
>> +	{CCI_REG8(0x3217), 0x58},
>> +	{CCI_REG8(0x3218), 0x58},
>> +	{CCI_REG8(0x321A), 0x68},
>> +	{CCI_REG8(0x321B), 0x60},
>> +	{CCI_REG8(0x3238), 0x03},
>> +	{CCI_REG8(0x3239), 0x03},
>> +	{CCI_REG8(0x323A), 0x05},
>> +	{CCI_REG8(0x323B), 0x06},
>> +	{CCI_REG8(0x3243), 0x03},
>> +	{CCI_REG8(0x3244), 0x08},
>> +	{CCI_REG8(0x3245), 0x01},
>> +	{CCI_REG8(0x3307), 0x19},
>> +	{CCI_REG8(0x3308), 0x19},
>> +	{CCI_REG8(0x3320), 0x01},
>> +	{CCI_REG8(0x3326), 0x15},
>> +	{CCI_REG8(0x3327), 0x0D},
>> +	{CCI_REG8(0x3328), 0x01},
>> +	{CCI_REG8(0x3380), 0x01},
>> +	{CCI_REG8(0x339E), 0x07},
>> +	{CCI_REG8(0x3424), 0x00},
>> +	{CCI_REG8(0x343C), 0x01},
>> +	{CCI_REG8(0x3398), 0x04},
>> +	{CCI_REG8(0x343A), 0x10},
>> +	{CCI_REG8(0x339A), 0x22},
>> +	{CCI_REG8(0x33B4), 0x00},
>> +	{CCI_REG8(0x3393), 0x01},
>> +	{CCI_REG8(0x33B3), 0x6E},
>> +	{CCI_REG8(0x3433), 0x06},
>> +	{CCI_REG8(0x3433), 0x00},
>> +	{CCI_REG8(0x33B3), 0x00},
>> +	{CCI_REG8(0x3393), 0x03},
>> +	{CCI_REG8(0x33B4), 0x03},
>> +	{CCI_REG8(0x343A), 0x00},
>> +	{CCI_REG8(0x339A), 0x00},
>> +	{CCI_REG8(0x3398), 0x00}
>> +};
>> +
>> +static const struct cci_reg_sequence t4ka3_pre_mode_set_regs[] = {
>> +	{CCI_REG8(0x0112), 0x0A},
>> +	{CCI_REG8(0x0113), 0x0A},
>> +	{CCI_REG8(0x0114), 0x03},
>> +	{CCI_REG8(0x4136), 0x13},
>> +	{CCI_REG8(0x4137), 0x33},
>> +	{CCI_REG8(0x0820), 0x0A},
>> +	{CCI_REG8(0x0821), 0x0D},
>> +	{CCI_REG8(0x0822), 0x00},
>> +	{CCI_REG8(0x0823), 0x00},
>> +	{CCI_REG8(0x0301), 0x0A},
>> +	{CCI_REG8(0x0303), 0x01},
>> +	{CCI_REG8(0x0305), 0x04},
>> +	{CCI_REG8(0x0306), 0x02},
>> +	{CCI_REG8(0x0307), 0x18},
>> +	{CCI_REG8(0x030B), 0x01},
>> +};
>> +
>> +static const struct cci_reg_sequence t4ka3_post_mode_set_regs[] = {
>> +	{CCI_REG8(0x0902), 0x00},
>> +	{CCI_REG8(0x4220), 0x00},
>> +	{CCI_REG8(0x4222), 0x01},
>> +	{CCI_REG8(0x3380), 0x01},
>> +	{CCI_REG8(0x3090), 0x88},
>> +	{CCI_REG8(0x3394), 0x20},
>> +	{CCI_REG8(0x3090), 0x08},
>> +	{CCI_REG8(0x3394), 0x10}
>> +};
>> +
>> +static const s64 link_freq_menu_items[] = {
>> +	T4KA3_LINK_FREQ,
>> +};
>> +
>> +static inline struct t4ka3_data *to_t4ka3_sensor(struct v4l2_subdev *sd)
>> +{
>> +	return container_of(sd, struct t4ka3_data, sd);
>> +}
>> +
>> +static inline struct t4ka3_data *ctrl_to_t4ka3(struct v4l2_ctrl *ctrl)
>> +{
>> +	return container_of(ctrl->handler, struct t4ka3_data, ctrls.handler);
>> +}
> 
> I'd use macros and container_of_const().
> 
>> +
>> +/* T4KA3 default GRBG */
>> +static const int t4ka3_hv_flip_bayer_order[] = {
>> +	MEDIA_BUS_FMT_SGRBG10_1X10,
>> +	MEDIA_BUS_FMT_SBGGR10_1X10,
>> +	MEDIA_BUS_FMT_SRGGB10_1X10,
>> +	MEDIA_BUS_FMT_SGBRG10_1X10,
>> +};
>> +
>> +static const struct v4l2_rect t4ka3_default_crop = {
>> +	.left = T4KA3_ACTIVE_START_LEFT,
>> +	.top = T4KA3_ACTIVE_START_TOP,
>> +	.width = T4KA3_ACTIVE_WIDTH,
>> +	.height = T4KA3_ACTIVE_HEIGHT,
>> +};
>> +
>> +static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id);
> 
> Not needed.
> 
>> +
>> +static void t4ka3_set_bayer_order(struct t4ka3_data *sensor,
>> +				  struct v4l2_mbus_framefmt *fmt)
>> +{
>> +	int hv_flip = 0;
> 
> unsigned int?
> 
>> +
>> +	if (sensor->ctrls.vflip && sensor->ctrls.vflip->val)
>> +		hv_flip += 1;
>> +
>> +	if (sensor->ctrls.hflip && sensor->ctrls.hflip->val)
>> +		hv_flip += 2;
>> +
>> +	fmt->code = t4ka3_hv_flip_bayer_order[hv_flip];
>> +}
>> +
>> +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka3_data *sensor)
>> +{
>> +	struct v4l2_subdev_state *active_state =
>> +		v4l2_subdev_get_locked_active_state(&sensor->sd);
>> +
>> +	return v4l2_subdev_state_get_format(active_state, 0);
>> +}
>> +
>> +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sensor)
>> +{
>> +	struct v4l2_subdev_state *active_state =
>> +		v4l2_subdev_get_locked_active_state(&sensor->sd);
>> +
>> +	return v4l2_subdev_state_get_crop(active_state, 0);
> 
> Please avoid adding such helpers.
> 
>> +}
>> +
>> +static int t4ka3_update_exposure_range(struct t4ka3_data *sensor)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	fmt = t4ka3_get_active_format(sensor);
> 
> Can be assigned in declaration.
> 
>> +
>> +	int exp_max = fmt->height + sensor->ctrls.vblank->val -
>> +		      T4KA3_COARSE_INTEGRATION_TIME_MARGIN;
>> +
>> +	return __v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_max,
>> +					1, exp_max);
>> +}
>> +
>> +static void t4ka3_fill_format(struct t4ka3_data *sensor,
>> +			      struct v4l2_mbus_framefmt *fmt,
>> +			      unsigned int width, unsigned int height)
>> +{
>> +	memset(fmt, 0, sizeof(*fmt));
>> +	fmt->width = width;
>> +	fmt->height = height;
>> +	fmt->field = V4L2_FIELD_NONE;
>> +	fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +	t4ka3_set_bayer_order(sensor, fmt);
>> +}
>> +
>> +static void t4ka3_calc_mode(struct t4ka3_data *sensor)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	struct v4l2_rect *crop;
>> +	int width;
>> +	int height;
>> +	int binning;
>> +
>> +	fmt = t4ka3_get_active_format(sensor);
>> +	crop = t4ka3_get_active_crop(sensor);
> 
> Ditto.
> 
>> +
>> +	width = fmt->width;
>> +	height = fmt->height;
>> +
>> +	if (width <= (crop->width / 2) && height <= (crop->height / 2))
>> +		binning = 2;
>> +	else
>> +		binning = 1;
>> +
>> +	width *= binning;
>> +	height *= binning;
>> +
>> +	sensor->mode.binning = binning;
>> +	sensor->mode.win_x = (crop->left + (crop->width - width) / 2) & ~1;
>> +	sensor->mode.win_y = (crop->top + (crop->height - height) / 2) & ~1;
>> +	/*
>> +	 * t4ka3's window is done after binning, but must still be a multiple of 2 ?
>> +	 * Round up to avoid top 2 black lines in 1640x1230 (quarter res) case.
>> +	 */
>> +	sensor->mode.win_x = DIV_ROUND_UP(sensor->mode.win_x, binning);
>> +	sensor->mode.win_y = DIV_ROUND_UP(sensor->mode.win_y, binning);
>> +}
>> +
>> +static void t4ka3_get_vblank_limits(struct t4ka3_data *sensor, int *min, int *max, int *def)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	fmt = t4ka3_get_active_format(sensor);
> 
> Ditto.
> 
>> +
>> +	*min = T4KA3_MIN_VBLANK + (sensor->mode.binning - 1) * fmt->height;
>> +	*max = T4KA3_MAX_VBLANK - fmt->height;
>> +	*def = T4KA3_LINES_PER_FRAME_30FPS - fmt->height;
>> +}
>> +
>> +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *sd_state,
>> +				struct v4l2_subdev_format *format)
>> +{
>> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
>> +	struct v4l2_mbus_framefmt *try_fmt;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	const struct v4l2_rect *crop;
>> +	unsigned int width, height;
>> +	int min, max, def, ret = 0;
>> +
>> +	crop = t4ka3_get_active_crop(sensor);
>> +	fmt = t4ka3_get_active_format(sensor);
>> +
>> +	/* Limit set_fmt max size to crop width / height */
>> +	width = clamp_val(ALIGN(format->format.width, 2),
>> +			  T4KA3_MIN_CROP_WIDTH, crop->width);
>> +	height = clamp_val(ALIGN(format->format.height, 2),
>> +			   T4KA3_MIN_CROP_HEIGHT, crop->height);
>> +	t4ka3_fill_format(sensor, &format->format, width, height);
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>> +		try_fmt = v4l2_subdev_state_get_format(sd_state, 0);
>> +		*try_fmt = format->format;
>> +		return 0;
>> +	}
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && sensor->streaming)
>> +		return -EBUSY;
>> +
>> +	*v4l2_subdev_state_get_format(sd_state, 0) = format->format;
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>> +		return 0;
>> +
>> +	t4ka3_calc_mode(sensor);
>> +
>> +	/* vblank range is height dependent adjust and reset to default */
>> +	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
>> +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, 1, def);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
>> +	if (ret)
>> +		return ret;
>> +
>> +	def = T4KA3_PIXELS_PER_LINE - fmt->width;
>> +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, 1, def);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
>> +	if (ret)
>> +		return ret;
> 
> 	return __v4l2_ctrl_s_ctrl(...);
> 
>> +
>> +	return 0;
>> +}
>> +
>> +/* Horizontal or vertically flip the image */
>> +static int t4ka3_t_vflip(struct v4l2_subdev *sd, int value, u8 flip_bit)
>> +{
>> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	int ret;
>> +	u64 val;
>> +
>> +	if (sensor->streaming)
>> +		return -EBUSY;
>> +
>> +	val = value ? flip_bit : 0;
>> +
>> +	ret = cci_update_bits(sensor->regmap, T4KA3_REG_IMG_ORIENTATION,
>> +			      flip_bit, val, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fmt = t4ka3_get_active_format(sensor);
>> +	t4ka3_set_bayer_order(sensor, fmt);
> 
> A newline would be nice here.
> 
>> +	return 0;
>> +}
>> +
>> +static int t4ka3_test_pattern(struct t4ka3_data *sensor, s32 value)
>> +{
>> +	return cci_write(sensor->regmap, T4KA3_REG_TEST_PATTERN_MODE, value, NULL);
>> +}
>> +
>> +static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id)
>> +{
>> +	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>> +	struct i2c_adapter *adapter = client->adapter;
>> +	u64 high, low;
>> +	int ret = 0;
>> +
>> +	/* i2c check */
>> +	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
>> +		return -ENODEV;
>> +
>> +	/* check sensor chip ID	 */
>> +	cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_HIGH, &high, &ret);
>> +	cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_LOW, &low, &ret);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*id = (((u8)high) << 8) | (u8)low;
>> +	if (*id != T4KA3_PRODUCT_ID) {
>> +		dev_err(sensor->dev, "main sensor t4ka3 ID error\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct t4ka3_data *sensor = ctrl_to_t4ka3(ctrl);
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	int ret;
>> +
>> +	/* Update exposure range on vblank changes */
>> +	if (ctrl->id == V4L2_CID_VBLANK) {
>> +		ret = t4ka3_update_exposure_range(sensor);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	fmt = t4ka3_get_active_format(sensor);
> 
> You could assign this in declaration.
> 
>> +
>> +	/* Only apply changes to the controls if the device is powered up */
>> +	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
>> +		t4ka3_set_bayer_order(sensor, fmt);
> 
> Does this call belong here?
> 
>> +		return 0;
>> +	}
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEST_PATTERN:
>> +		ret = t4ka3_test_pattern(sensor, ctrl->val);
>> +		break;
>> +	case V4L2_CID_VFLIP:
>> +		ret = t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_VFLIP_BIT);
>> +		break;
>> +	case V4L2_CID_HFLIP:
>> +		ret = t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_HFLIP_BIT);
>> +		break;
>> +	case V4L2_CID_VBLANK:
>> +		ret = cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES,
>> +				fmt->height + ctrl->val, NULL);
>> +		break;
>> +	case V4L2_CID_EXPOSURE:
>> +		ret = cci_write(sensor->regmap, T4KA3_REG_COARSE_INTEGRATION_TIME,
>> +				ctrl->val, NULL);
>> +		break;
>> +	case V4L2_CID_ANALOGUE_GAIN:
>> +		ret = cci_write(sensor->regmap, T4KA3_REG_GLOBAL_GAIN,
>> +				ctrl->val, NULL);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	pm_runtime_put(sensor->sd.dev);
> 
> Newline here?
> 
>> +	return ret;
>> +}
>> +
>> +static int t4ka3_set_mode(struct t4ka3_data *sensor)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	int ret = 0;
>> +
>> +	fmt = t4ka3_get_active_format(sensor);
>> +
>> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_OUTPUT_SIZE, fmt->width, &ret);
>> +	/* Write mode-height - 2 otherwise things don't work, hw-bug ? */
>> +	cci_write(sensor->regmap, T4KA3_REG_VERT_OUTPUT_SIZE, fmt->height - 2, &ret);
>> +	/* Note overwritten by __v4l2_ctrl_handler_setup() based on vblank ctrl */
>> +	cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES, T4KA3_LINES_PER_FRAME_30FPS, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_PIXELS_PER_LINE, T4KA3_PIXELS_PER_LINE, &ret);
>> +	/* Always use the full sensor, using window to crop */
>> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_START, 0, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_VERT_START, 0, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_END, T4KA3_NATIVE_WIDTH - 1, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_VERT_END, T4KA3_NATIVE_HEIGHT - 1, &ret);
>> +	/* Set window */
>> +	cci_write(sensor->regmap, T4KA3_REG_WIN_START_X, sensor->mode.win_x, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_WIN_START_Y, sensor->mode.win_y, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_WIN_WIDTH, fmt->width, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_WIN_HEIGHT, fmt->height, &ret);
>> +	/* Write 1 to unknown register 0x0900 */
>> +	cci_write(sensor->regmap, T4KA3_REG_0900, 1, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_BINNING, T4KA3_BINNING_VAL(sensor->mode.binning), &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int t4ka3_enable_stream(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>> +			       u32 pad, u64 streams_mask)
>> +{
>> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
>> +	int ret;
>> +
>> +	ret = pm_runtime_get_sync(sensor->sd.dev);
>> +	if (ret < 0) {
>> +		dev_err(sensor->dev, "power-up err.\n");
>> +		goto error_powerdown;
>> +	}
>> +
>> +	cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
>> +			    ARRAY_SIZE(t4ka3_init_config), &ret);
>> +	/* enable group hold */
>> +	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
>> +	cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
>> +			    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
>> +	if (ret)
>> +		goto error_powerdown;
>> +
>> +	ret = t4ka3_set_mode(sensor);
>> +	if (ret)
>> +		goto error_powerdown;
>> +
>> +	ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
>> +				  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
>> +	if (ret)
>> +		goto error_powerdown;
>> +
>> +	/* Restore value of all ctrls */
>> +	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
>> +	if (ret)
>> +		goto error_powerdown;
>> +
>> +	/* disable group hold */
>> +	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
>> +	cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
>> +	if (ret)
>> +		goto error_powerdown;
>> +
>> +	sensor->streaming = 1;
>> +
>> +	return ret;
>> +
>> +error_powerdown:
>> +	pm_runtime_put(sensor->sd.dev);
> 
> And here?
> 
>> +	return ret;
>> +}
>> +
>> +static int t4ka3_disable_stream(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>> +				u32 pad, u64 streams_mask)
>> +{
>> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
>> +	int ret;
>> +
>> +	ret = cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
>> +	pm_runtime_put(sensor->sd.dev);
>> +	sensor->streaming = 0;
>> +	return ret;
> 
> Return 0 here but complain about it.
> 
>> +}
>> +
>> +static int t4ka3_get_selection(struct v4l2_subdev *sd,
>> +			       struct v4l2_subdev_state *state,
>> +			       struct v4l2_subdev_selection *sel)
>> +{
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
>> +		break;
>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		sel->r.top = 0;
>> +		sel->r.left = 0;
>> +		sel->r.width = T4KA3_NATIVE_WIDTH;
>> +		sel->r.height = T4KA3_NATIVE_HEIGHT;
>> +		break;
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +		sel->r = t4ka3_default_crop;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int t4ka3_set_selection(struct v4l2_subdev *sd,
>> +			       struct v4l2_subdev_state *state,
>> +			       struct v4l2_subdev_selection *sel)
>> +{
>> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
>> +	struct v4l2_mbus_framefmt *format;
>> +	struct v4l2_rect *crop;
>> +	struct v4l2_rect rect;
>> +
>> +	if (sel->target != V4L2_SEL_TGT_CROP)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Clamp the boundaries of the crop rectangle to the size of the sensor
>> +	 * pixel array. Align to multiples of 2 to ensure Bayer pattern isn't
>> +	 * disrupted.
>> +	 */
>> +	rect.left = clamp_val(ALIGN(sel->r.left, 2),
>> +			      T4KA3_NATIVE_START_LEFT, T4KA3_NATIVE_WIDTH);
>> +	rect.top = clamp_val(ALIGN(sel->r.top, 2),
>> +			     T4KA3_NATIVE_START_TOP, T4KA3_NATIVE_HEIGHT);
>> +	rect.width = clamp_val(ALIGN(sel->r.width, 2), T4KA3_MIN_CROP_WIDTH,
>> +			       T4KA3_NATIVE_WIDTH - rect.left);
>> +	rect.height = clamp_val(ALIGN(sel->r.height, 2), T4KA3_MIN_CROP_HEIGHT,
>> +				T4KA3_NATIVE_HEIGHT - rect.top);
>> +
>> +	crop = v4l2_subdev_state_get_crop(state, sel->pad);
>> +
>> +	if (rect.width != crop->width || rect.height != crop->height) {
>> +		/*
>> +		 * Reset the output image size if the crop rectangle size has
>> +		 * been modified.
>> +		 */
>> +		format = v4l2_subdev_state_get_format(state, sel->pad);
>> +		format->width = rect.width;
>> +		format->height = rect.height;
>> +		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>> +			t4ka3_calc_mode(sensor);
>> +	}
>> +
>> +	sel->r = *crop = rect;
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +t4ka3_enum_mbus_code(struct v4l2_subdev *sd,
>> +		     struct v4l2_subdev_state *sd_state,
>> +		     struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->index)
>> +		return -EINVAL;
>> +
>> +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>> +	return 0;
>> +}
>> +
>> +static int t4ka3_enum_frame_size(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_state *sd_state,
>> +				 struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	struct v4l2_rect *crop;
>> +
>> +	if (fse->index >= T4KA3_FRAME_SIZES)
>> +		return -EINVAL;
>> +
>> +	crop = v4l2_subdev_state_get_crop(sd_state, fse->pad);
>> +
>> +	fse->min_width = crop->width / (fse->index + 1);
>> +	fse->min_height = crop->height / (fse->index + 1);
>> +	fse->max_width = fse->min_width;
>> +	fse->max_height = fse->min_height;
>> +
>> +	return 0;
>> +}
>> +
>> +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
>> +{
>> +	struct fwnode_handle *fwnode = dev_fwnode(sensor->dev);
>> +	struct v4l2_fwnode_endpoint bus_cfg = {
>> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
>> +	};
>> +	struct fwnode_handle *endpoint;
>> +	unsigned long link_freq_bitmap;
>> +	int ret;
>> +
>> +	/*
>> +	 * Sometimes the fwnode graph is initialized by the bridge driver.
>> +	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
>> +	 */
> 
> No need for such a comment.
> 
>> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
>> +	if (!endpoint)
>> +		return dev_err_probe(sensor->dev, -EPROBE_DEFER,
>> +				     "waiting for fwnode graph endpoint\n");
> 
> This
> <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=cleanup&id=8181d18d45d593d8499cbf0e83de08c6d913516c>
> will be merged soon.
> 
>> +
>> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
>> +	fwnode_handle_put(endpoint);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_frequencies,
>> +				       bus_cfg.nr_of_link_frequencies,
>> +				       link_freq_menu_items,
>> +				       ARRAY_SIZE(link_freq_menu_items),
>> +				       &link_freq_bitmap);
>> +
>> +	if (ret == -ENOENT) {
>> +		dev_err_probe(sensor->dev, -ENOENT,
>> +			      "No match found between driver-supported link frequencies.\n");
>> +		goto out_free_bus_cfg;
>> +	}
>> +
>> +	if (ret == -ENODATA) {
>> +		dev_err_probe(sensor->dev, -ENODATA,
>> +			      "No link frequency was specified in the firmware.\n");
>> +		goto out_free_bus_cfg;
>> +	}
> 
> No need for printing these error messages -- v4l2_link_freq_to_bitmap()
> already does.
> 
>> +
>> +	sensor->link_freq_index = ffs(link_freq_bitmap) - 1;
>> +
>> +	/* 4 MIPI lanes */
>> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
>> +		ret = dev_err_probe(sensor->dev, -EINVAL,
>> +				    "number of CSI2 data lanes %u is not supported\n",
>> +				    bus_cfg.bus.mipi_csi2.num_data_lanes);
>> +		goto out_free_bus_cfg;
>> +	}
>> +
>> +	sensor->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
>> +
>> +out_free_bus_cfg:
>> +	v4l2_fwnode_endpoint_free(&bus_cfg);
>> +
>> +	return ret;
>> +}
>> +
>> +static int t4ka3_init_state(struct v4l2_subdev *sd,
>> +			    struct v4l2_subdev_state *sd_state)
>> +{
>> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
>> +
>> +	*v4l2_subdev_state_get_crop(sd_state, 0) = t4ka3_default_crop;
>> +
>> +	t4ka3_fill_format(sensor, v4l2_subdev_state_get_format(sd_state, 0),
>> +			  T4KA3_ACTIVE_WIDTH, T4KA3_ACTIVE_HEIGHT);
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops t4ka3_ctrl_ops = {
>> +	.s_ctrl = t4ka3_s_ctrl,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops t4ka3_video_ops = {
>> +	.s_stream = v4l2_subdev_s_stream_helper,
>> +};
>> +
>> +static const struct v4l2_subdev_pad_ops t4ka3_pad_ops = {
>> +	.enum_mbus_code = t4ka3_enum_mbus_code,
>> +	.enum_frame_size = t4ka3_enum_frame_size,
>> +	.get_fmt = v4l2_subdev_get_fmt,
>> +	.set_fmt = t4ka3_set_pad_format,
>> +	.get_selection = t4ka3_get_selection,
>> +	.set_selection = t4ka3_set_selection,
>> +	.enable_streams = t4ka3_enable_stream,
>> +	.disable_streams = t4ka3_disable_stream,
>> +};
>> +
>> +static const struct v4l2_subdev_ops t4ka3_ops = {
>> +	.video = &t4ka3_video_ops,
>> +	.pad = &t4ka3_pad_ops,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops t4ka3_internal_ops = {
>> +	.init_state = t4ka3_init_state,
>> +};
>> +
>> +static int t4ka3_init_controls(struct t4ka3_data *sensor)
>> +{
>> +	const struct v4l2_ctrl_ops *ops = &t4ka3_ctrl_ops;
>> +	struct t4ka3_ctrls *ctrls = &sensor->ctrls;
>> +	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
>> +	struct v4l2_fwnode_device_properties props;
>> +	int ret, min, max, def;
>> +	static const char * const test_pattern_menu[] = {
>> +		"Disabled",
>> +		"Solid White",
>> +		"Color Bars",
>> +		"Gradient",
>> +		"Random Data",
>> +	};
>> +
>> +	v4l2_ctrl_handler_init(hdl, 11);
>> +
>> +	hdl->lock = &sensor->lock;
>> +
>> +	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
>> +	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
>> +
>> +	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
>> +							   V4L2_CID_TEST_PATTERN,
>> +							   ARRAY_SIZE(test_pattern_menu) - 1,
>> +							   0, 0, test_pattern_menu);
>> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
>> +						  0, 0, sensor->link_freq);
>> +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
>> +					      0, T4KA3_PIXEL_RATE,
>> +					      1, T4KA3_PIXEL_RATE);
>> +
>> +	v4l2_subdev_lock_state(sensor->sd.active_state);
>> +	t4ka3_calc_mode(sensor);
>> +	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
>> +	v4l2_subdev_unlock_state(sensor->sd.active_state);
>> +
>> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, min, max, 1, def);
>> +
>> +	def = T4KA3_PIXELS_PER_LINE - T4KA3_ACTIVE_WIDTH;
>> +	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
>> +					  def, def, 1, def);
>> +
>> +	max = T4KA3_LINES_PER_FRAME_30FPS - T4KA3_COARSE_INTEGRATION_TIME_MARGIN;
>> +	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
>> +					    0, max, 1, max);
>> +
>> +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
>> +					T4KA3_MIN_GLOBAL_GAIN_SUPPORTED,
>> +					T4KA3_MAX_GLOBAL_GAIN_SUPPORTED,
>> +					1, T4KA3_MIN_GLOBAL_GAIN_SUPPORTED);
>> +
>> +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
>> +	if (ret)
>> +		return ret;
>> +
>> +	v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
>> +
>> +	if (hdl->error)
>> +		return hdl->error;
>> +
>> +	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>> +	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>> +	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +	sensor->sd.ctrl_handler = hdl;
> 
> A newline would be nice here.
> 
>> +	return 0;
>> +}
>> +
>> +static int t4ka3_pm_suspend(struct device *dev)
>> +{
>> +	struct t4ka3_data *sensor = dev_get_drvdata(dev);
>> +
>> +	gpiod_set_value_cansleep(sensor->powerdown_gpio, 1);
>> +	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static int t4ka3_pm_resume(struct device *dev)
>> +{
>> +	struct t4ka3_data *sensor = dev_get_drvdata(dev);
>> +	u16 sensor_id;
>> +	int ret;
>> +
>> +	usleep_range(5000, 6000);
>> +
>> +	gpiod_set_value_cansleep(sensor->powerdown_gpio, 0);
>> +	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>> +
>> +	/* waiting for the sensor after powering up */
>> +	msleep(20);
> 
> fsleep() maybe?
> 
>> +
>> +	ret = t4ka3_detect(sensor, &sensor_id);
>> +	if (ret) {
>> +		dev_err(sensor->dev, "sensor detect failed\n");
>> +		return ret;
> 
> What about gpio values in this case?
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static DEFINE_RUNTIME_DEV_PM_OPS(t4ka3_pm_ops, t4ka3_pm_suspend, t4ka3_pm_resume, NULL);
> 
> You could run
> 
> 	$ ./scripts/checkpatch.pl --strict --max-line-length=80
> 
> on the patch.
> 
>> +
>> +static void t4ka3_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
>> +
>> +	v4l2_async_unregister_subdev(&sensor->sd);
>> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>> +	v4l2_subdev_cleanup(sd);
>> +	media_entity_cleanup(&sensor->sd.entity);
>> +
>> +	/*
>> +	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
>> +	 * make sure to turn power off manually.
>> +	 */
>> +	pm_runtime_disable(&client->dev);
>> +	if (!pm_runtime_status_suspended(&client->dev))
>> +		t4ka3_pm_suspend(&client->dev);
>> +	pm_runtime_set_suspended(&client->dev);
>> +}
>> +
>> +static int t4ka3_probe(struct i2c_client *client)
>> +{
>> +	struct t4ka3_data *sensor;
>> +	int ret;
>> +
>> +	/* allocate sensor device & init sub device */
>> +	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
>> +	if (!sensor)
>> +		return -ENOMEM;
>> +
>> +	sensor->dev = &client->dev;
>> +
>> +	ret = t4ka3_check_hwcfg(sensor);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mutex_init(&sensor->lock);
>> +
>> +	sensor->link_freq[0] = T4KA3_LINK_FREQ;
> 
> The driver supports a single link frequency. Could the array holding the
> requencies be static const?
> 
>> +
>> +	v4l2_i2c_subdev_init(&sensor->sd, client, &t4ka3_ops);
>> +	sensor->sd.internal_ops = &t4ka3_internal_ops;
>> +
>> +	sensor->powerdown_gpio = devm_gpiod_get(&client->dev, "powerdown",
>> +						GPIOD_OUT_HIGH);
>> +	if (IS_ERR(sensor->powerdown_gpio))
>> +		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown_gpio),
>> +				     "getting powerdown GPIO\n");
>> +
>> +	sensor->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
>> +						     GPIOD_OUT_HIGH);
>> +	if (IS_ERR(sensor->reset_gpio))
>> +		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset_gpio),
>> +				     "getting reset GPIO\n");
>> +
>> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
>> +	if (IS_ERR(sensor->regmap))
>> +		return PTR_ERR(sensor->regmap);
>> +
>> +	ret = t4ka3_pm_resume(sensor->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pm_runtime_set_active(&client->dev);
>> +	pm_runtime_get_noresume(&client->dev);
> 
> You can omit get_noresume() here...
> 
>> +	pm_runtime_enable(&client->dev);
>> +
>> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +
>> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
>> +	if (ret)
>> +		goto err_pm_disable;
>> +
>> +	sensor->sd.state_lock = sensor->ctrls.handler.lock;
>> +	ret = v4l2_subdev_init_finalize(&sensor->sd);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "failed to init subdev: %d", ret);
>> +		goto err_media_entity;
>> +	}
>> +
>> +	ret = t4ka3_init_controls(sensor);
>> +	if (ret)
>> +		goto err_controls;
>> +
>> +	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
>> +	if (ret)
>> +		goto err_controls;
>> +
>> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>> +	pm_runtime_use_autosuspend(&client->dev);
>> +	pm_runtime_put_autosuspend(&client->dev);
> 
> as well as the two autosuspend functions above by switching to
> pm_runtime_idle() here.
> 
>> +
>> +	return 0;
>> +
>> +err_controls:
>> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>> +	v4l2_subdev_cleanup(&sensor->sd);
>> +
>> +err_media_entity:
>> +	media_entity_cleanup(&sensor->sd.entity);
>> +
>> +err_pm_disable:
>> +	pm_runtime_disable(&client->dev);
>> +	pm_runtime_put_noidle(&client->dev);
>> +	t4ka3_pm_suspend(&client->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct acpi_device_id t4ka3_acpi_match[] = {
> 
> const?
> 
>> +	{ "XMCC0003" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
>> +
>> +static struct i2c_driver t4ka3_driver = {
>> +	.driver = {
>> +		.name = "t4ka3",
>> +		.acpi_match_table = ACPI_PTR(t4ka3_acpi_match),
>> +		.pm = pm_sleep_ptr(&t4ka3_pm_ops),
>> +	},
>> +	.probe = t4ka3_probe,
>> +	.remove = t4ka3_remove,
>> +};
>> +module_i2c_driver(t4ka3_driver)
>> +
>> +MODULE_DESCRIPTION("A low-level driver for T4KA3 sensor");
>> +MODULE_AUTHOR("HARVEY LV <harvey.lv@intel.com>");
>> +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
>> +MODULE_LICENSE("GPL");
> 


