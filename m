Return-Path: <linux-media+bounces-52032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AID7H5/AgGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:19:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA29CE1A0
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 150833085107
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CBF3793A8;
	Mon,  2 Feb 2026 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThbKyOoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kds58z2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F41E378D95
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045118; cv=none; b=OIPBya4tXiP57Hz8Nw4uIOuKzNJUXYvwxfbi8/mHPEHn5LB2cH2VRKj23uIHaj1tpKx5+lkxorsTZnCYj5SUw7L0u3u7jOzu2JKJUeI7AvDPBmoemJdulmVMcUe29e8NKziLBcYSnz2FxmqAQ0V96LxPkOJs+qXbgioYFbBgZVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045118; c=relaxed/simple;
	bh=shXiJFtbQdDIh/GK1WrwJuVnSt557APEJloCbYV0jEs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HlBXIaxMIsKM39si/QaPU2f1ArcpKbSkT200GGKaYEM3frLvOFPoRv6meEFl8z9S79o3H+lmbePXn3EFFqC6q+EERwrh/lAc/O6OdeHv3yrF2Oc6cMHfTyy2MkzsZur3xn8Y0UbqNGRWOjSAcqMkRo40ISGr5uXFl4maFicB5WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThbKyOoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kds58z2Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVITV2356965
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 15:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouKV+1TUSDl/lItIRyWwLr7s50QOXOG13eWEPnJuc/E=; b=ThbKyOoGMEaFxdli
	qWs55VNUg8TJoURVmdfGW7NcnZdSIFUF+W/i7O7yVVSHJTLrBz01kipzZEJISrae
	PBXRTqqy/t3JPD/Woy4iZnEV5DrtRUN6r5o+X+eqABIjviKh4wltGBfSmmPgeivj
	ZFz1pXMbxLxns9RswBs0foXUeKD3KRAMvhGZZ+a/NJJT+rmNo7StrmA4qbtuFF5K
	otgo5XLVs6oVhWCN7imuKBHLzJaq02vc/xe89rgSP/M3wV8kWxO6vYsqpRdkrsNl
	tfDF9nhjiM/tAjqRuhtLVdz12yUqUvMfRqoXMXavdvzVUIFtSM1et5xCHaM8ye/f
	+mH4uA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0m8ej9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 15:11:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so1285733185a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770045114; x=1770649914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ouKV+1TUSDl/lItIRyWwLr7s50QOXOG13eWEPnJuc/E=;
        b=Kds58z2ZFe9gGZeNqf1+VkulPvgDZyD3WhtoUzXeD4rMoQ4ROwJJ5bAn/krbhS2WFy
         ExgXG0+I6xe2LAnoidqH5RMkEsVpwdxHoVZHU8UwRiEGaLsmroK0KwGtqU0w/OMYyd7B
         ZLSEYAYEwftMdrCynr7b5IesMZb0LHOJOvIqlnpVULMWHaSsJg9dujd6C4CXU3BTHl4B
         9zWkHNLm3MxJThYWt5DI5Mw9DQnrhre7RpoQ06FzVm3ZXzJE74zlMlAYlUSJjHXyJMAk
         lD/b/0V5PQttsnheBlZa7eOyvQzYxIYXte673/2f/mYV3tRZHNNPcCN2K6lzcbzQ+PTt
         LUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045114; x=1770649914;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouKV+1TUSDl/lItIRyWwLr7s50QOXOG13eWEPnJuc/E=;
        b=pmTJUtTBbsCA2R6J8+VlcmrURuyGv7yQj0nlDZ34swicm47tQFigESd5L2jt7kz/N1
         +ida1Ofan7+mpeZEHyRzwlnRYPu3oQxsBkrQiEP4GXnD8DIrh8j2nwd7nLbA1cjo0X6O
         sscB0G1mA2iAsbDWf//9Exg+HuSBuTUythnRMTDpV1abBV8DUSpRZ8uv/4vHJoYMcyBS
         AmdAv68r7sLIv4O8Uufnlvcets1y7lyHH/eOxlzXBAYFE8RWp3PZT8c5JkwABLnVnmNh
         IzJPGLMbVYqlc41hXPvXmXpV1cMuCo4pGtgbznnNVwpEMIHn5VvkItfB3AbXqlgMcxJe
         LuTA==
X-Gm-Message-State: AOJu0Yw+WTRJoEljcXVPbei67P5PJbn6EAWueatPyV2fhx0C5GjxfYNI
	F296GdtMtXNvKgkiPntNX8wVvuqJfTOrhGXlBRqc+eLMRYq+R7S/Bi6VQnFS0/aXiHmTDMxdwGC
	EaLJNK6wY6VFNAn/MQx+Hgd+BBOSr+hWTDQwocU8acSH6SIcI/CDeblT/ZPC/c1YTdw==
X-Gm-Gg: AZuq6aI31gGZ030UNCL/Kj+gxlmX8uDvEFMZz1Mid9EtWQ95PZqusvCje8O3dTBbVt0
	KqCrkvxsJU9jIoiWXRLZt0HIQn9j6h8/oYlibUrB1M+/Pa6BcDAVStlTb3hDO4v70uOdkohctQG
	bWnhEYVbsMRPGqCfAsq/e97wqOI8t4LJgY+JLQp0erbB3Ro4iQuK392GqxAfR4aoegLtpZHo80R
	ldvJfkkiY0FSduHPmomIm+9BG655o6Ugpg/M3CtlnNnketoULmI3LhiiZOE4PT61KkBKKw4BtVO
	w0INugL+S56moW/Chg/JUOV93drSZzLQCjScbqcF9avkhA/kIVb60Zu1NalFYItbaLCKB8WH7OD
	iiT7kRwPIPGTFXoU0y1H4OKUQMGYl0s5tnKrNzMqJVotWs8jsEWEvpZ/JylSIfTieg8EpBqfIn7
	SpOIInJZCsjCTqxMSp8zjq3p15YVvjgun7EOZ/S0aidxQf65fyVnE9YJ6AIR5gCtdvKGArZPvIH
	fGf
X-Received: by 2002:a05:620a:4054:b0:8b2:dfb3:dc2a with SMTP id af79cd13be357-8c9eb314706mr1481620985a.75.1770045114294;
        Mon, 02 Feb 2026 07:11:54 -0800 (PST)
X-Received: by 2002:a05:620a:4054:b0:8b2:dfb3:dc2a with SMTP id af79cd13be357-8c9eb314706mr1481614385a.75.1770045113639;
        Mon, 02 Feb 2026 07:11:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffedd3sm863400066b.29.2026.02.02.07.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:11:53 -0800 (PST)
Message-ID: <591ac511-d339-40d1-9cae-299e068a9b17@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 16:11:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 2/2] media: i2c: ov13b10: Support tps68470 regulator and
 gpio
To: Arun T <arun.t@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260130092431.2335363-1-arun.t@intel.com>
 <20260130092431.2335363-2-arun.t@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260130092431.2335363-2-arun.t@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6980bebb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=yQ_Oy8pCjmFIsukoX0sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hhGN_USRK4sEp1sccnbsq-2Tw2T-EAa1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyMCBTYWx0ZWRfX/yg2hzh0bWMR
 sM3bnp75Y5PADY7PKgQeAmjd8lupG/VD54jHxZ+APK6L+kF8aaUC6pYEySmjl4krJzf8V2Hey9m
 rrCaS978Zf3BW9/3YuALXczQ1bQFhEpEVh4Fa8OuYw0mVoEUnPnXDmhkIdFmlkgRBsNbNBUt9EP
 q/ayWCUKiWiQqh4Xp/5uqh+GyEBHn2KnfkZMmwm/vyhoxXmjem1b51iJDvvCS5kGbXa+1iZeY/b
 p73EOoaEsWQGdiCWwC+EmGqhrnZbZ52GS4TfWe2pBDH1kRVLfo/CaXeIibpJJkZyyFqoZS3vDW7
 WHDv0ijshPard3HaPs0EJk/9sKE5cXevC23PhwvLtbvkkXmCI7YhxpBWPDFt0RjnXNmZi6aVC13
 2FvcCfHKSYQzCuV6ypjsifyZFBUqpSXpf1PsHkQt8+iWc9LutofQFpheyTdgyr9wHwbMa932M3X
 p2kd9QwrREkk697AShg==
X-Proofpoint-ORIG-GUID: hhGN_USRK4sEp1sccnbsq-2Tw2T-EAa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,intel.com:email];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-52032-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFA29CE1A0
X-Rspamd-Action: no action

Hi Arun,

Thank you for your patch.

On 30-Jan-26 10:24, Arun T wrote:
> Ov13b10 sensor get clock and regulator from TPS68470 PMIC.
> Added tps68470 regulator/gpio names in power_on()
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>  drivers/media/i2c/ov13b10.c | 38 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 5421874732bc..c2469c88c722 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -709,6 +709,10 @@ struct ov13b10 {
>  
>  	struct clk *img_clk;
>  	struct regulator *avdd;
> +	struct regulator *vio;
> +	struct regulator *core;
> +	struct gpio_desc *enable;

This new enable gpio does not seem to get used in the patch
at all ?

> +
>  	struct gpio_desc *reset;
>  
>  	/* V4L2 Controls */
> @@ -1475,12 +1479,19 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  	unsigned long freq;
>  	int ret;
>  
> -	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
> +	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01"))
> +		ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "s_resetn", GPIOD_OUT_LOW);
> +	else
> +		ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);

Nack, you're adding a lookup in patch 1/2, simply use "reset"
there instead of "s_resetn" and then you don't need this.

More importantly board/platform specific info like this must NOT
be present in sensor drivers.

All uses of "if (strstr(dev_name(ov13b->dev), "OVTI13B1:01"))"
in this patch MUST be dropped.

>  	if (IS_ERR(ov13b->reset))
>  		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->reset),
>  				     "failed to get reset gpio\n");
>  
> -	ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, NULL);
> +	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01"))
> +		ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, "tps68470-clk");
> +	else
> +		ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, NULL);
> +

Same here, the old code with the NULL name arg will work fine since
there should be only 1 clk provider.

>  	if (IS_ERR(ov13b->img_clk))
>  		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->img_clk),
>  				     "failed to get imaging clock\n");
> @@ -1490,8 +1501,11 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  		return dev_err_probe(ov13b->dev, -EINVAL,
>  				     "external clock %lu is not supported\n",
>  				     freq);
> +	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01"))
> +		ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "ana");
> +	else
> +		ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");

Again you're providing the map information in patch 1/2 just call it avdd!

>  
> -	ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
>  	if (IS_ERR(ov13b->avdd)) {
>  		ret = PTR_ERR(ov13b->avdd);
>  		ov13b->avdd = NULL;
> @@ -1499,6 +1513,24 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  			return dev_err_probe(ov13b->dev, ret,
>  					     "failed to get avdd regulator\n");
>  	}
> +	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01")){
> +		ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "dovdd");
> +		if (IS_ERR(ov13b->avdd)) {
> +			ret = PTR_ERR(ov13b->avdd);
> +			ov13b->avdd = NULL;
> +			if (ret != -ENODEV)
> +				return dev_err_probe(ov13b->dev, ret,
> +			               "failed to get avdd regulator\n");
> +		}
> +		ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "dvdd");
> +		if (IS_ERR(ov13b->avdd)) {
> +			ret = PTR_ERR(ov13b->avdd);
> +			ov13b->avdd = NULL;
> +			if (ret != -ENODEV)
> +				return dev_err_probe(ov13b->dev, ret,
> +					"failed to get avdd regulator\n");
> +		}
> +	}

You're using ov13b->avdd to store the other 2 regulators too that cannot
be right...

Also for adding multiple regulators you should use the bulk regulator API,
see e.g. :

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/i2c/hi556.c?id=375fc903e57cb3ca4d2d5408de98d6369d4c8334

And there is no need for the if (strstr(dev_name(ov13b->dev), "OVTI13B1:01")){
here, the regulator core will provide dummy regulators on boards
where there are no regulators defined for dovdd and dvdd.

Regards,

Hans



