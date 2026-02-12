Return-Path: <linux-media+bounces-52661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA41JZv3jWlw8wAAu9opvQ
	(envelope-from <linux-media+bounces-52661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:54:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B112F22A
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6071B30465EA
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 15:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961732FDC5D;
	Thu, 12 Feb 2026 15:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AroI99lk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Id6dO+YE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417717C220
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 15:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770911635; cv=none; b=FewUvh1EHsEZ3YZjDK4TVWDFoVx1rTeeAwTUTYQjoa1qh5wtAuEFssLsAzpK7xDd3CXrEGkO+/iqJFCMT9Xzq01ml+8XL1urOx6E4++dH27oRixJvCU+Dkv519fZVkaZahqdqH9CVc9XEDWQtW/l7gKDqthFHDn7dFfgsmcdv+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770911635; c=relaxed/simple;
	bh=9qWShex5a172uhSvoMtt5lOID1otTQrVNaCakTMDxi4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WX54eGP8df7dIC4MffF0MFurh7rBwuvMwxDRiP3ps3NdZweQ6yCLPQVyToCYXfgv6vOMlSu60prK/1ptoztL/wIo1SHsYUE+B416RoA0y9dZUPPjz5P0xgq7Bbmm0XxnenWeJ6G9ABfToI7bFhD9EdBlC1348L9LklI/kjk7NoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AroI99lk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Id6dO+YE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRhR13844142
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 15:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuTnx4kFiFxswmc+ph8pSr0EIfDBaa5ryAFfn0gTWMk=; b=AroI99lk/TX9IHrz
	ibLgbBfVdcKBZrB2CHM7LksUtvwNZd3/W4DBI8Lil/ZKDYPlpYoS0uX1wwZYYjE1
	XSORpPgcQXMTnhPUI1aDBtZlNfX/xQ+FaPqDqDC079ObRLYfwZju/0/I5/UuSJJ/
	VHf+sOHIwDmKlveLg1zwGPt7ba/KU7eMWSYD9vTWlsRC5TctCcjNcnZRqXp/rO22
	66NY1DZ8Wh9D2AYxtFNqa1S/zcY3frqL12uVhFzFG/H9m1lr7/og5IAf98EK3/+4
	FWREjw/vXhy/MGekmXp38n2qtIgv5XchKB8uwv0nK7xC1cIlANuJcRdVjaXU4gdM
	InGKAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpkwvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 15:53:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so2997285a.1
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 07:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770911632; x=1771516432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BuTnx4kFiFxswmc+ph8pSr0EIfDBaa5ryAFfn0gTWMk=;
        b=Id6dO+YE19FVQEIXM1bxlhXcqSTAb8T4M7ESXrvP8qwuoUdnIr+eia0eTbPRpMuwqw
         8KrDyPyOVa2DZWkaXPb1wC4+35OlLbuz3hEwSVQxxN4F9n+UTKR/imMCyqTM4UctuvAP
         nsqYBS4p16MDHvDoKKaF05bWvevIAomWXJwV2gogc4SU+1AuUU3IKFOd3H3wYs67blMS
         v/mCU+m925NAAKrgoir0AC4EHCISrNh45qnP9Vopy98dKs6D7eYGo5TRV7nNw3il0FgZ
         xRSrxKBx8QPFfJ66CvWdaxdwa13qXEKq5PBXr8/dikmC8Uq2TiYsIJjKWPyG5ta0FmLK
         g+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770911632; x=1771516432;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuTnx4kFiFxswmc+ph8pSr0EIfDBaa5ryAFfn0gTWMk=;
        b=ggZu/fysQ5t8TLRW1ij/dx+kG8E0jaSt3P1xXMYtYWL0B4/qozqJEUa04TIEvCt0VJ
         25+wN4EZoy5eaiw6aTXX0e77R6Go1XJVMKuodgB0A7A+0mcSQmjgm772ywonmZmymT6i
         VLJ4eht94+FJa84A10bAzEQO06UE3YegYpBQctEEd+OfODtbW8Wp8LoQsNJd8gHwLUqh
         8tCgIAZUCCaRWrK5EWn8KAfq19m3aCtT6mtqehP3NPQ0D7fyUWkeURndvM5j0zPLg4TT
         WN9ChhVyzGHqXl/AhDGrRQLazlbNlpA8hYCALIZXOdw0ywrWpMPaOGqoMmc+EPgcZ0Ui
         Kmkg==
X-Gm-Message-State: AOJu0YwLscW7vifuW4Y71dYcyCcdngP4jeR0DQR72vPst5EUhQUthe0i
	wiFweKQElAssd+Mq4YbUkdCvdGjsLDZrbonZu6gxV002zRMeI9kocEZyqQitzLQ3urBBVffWEZ5
	VY4wj457wfwGf3kfwuvXeQuqXcyw5m4J54mPrNVmSlFj3eNDEss2cC4Z4b6lGD6By3A==
X-Gm-Gg: AZuq6aIaYEJzZlNJYfmqyA42pptlEdhC00zvBLqIlbClE2z54fkpYxKj66wFFzxyo9s
	134PEMm2YjwTrNqeIyd5E5D3eCb6Gn6Q11p9ntOMMJ0nNhsY45QJE9VZObJcmTTju90LLgevtZl
	D53t6H0XY94ur/CEDACdX+4ksstljw6K7nvG6uNf7PdjPA3MJoFf7StXRFoXj0GTGGaf+6VcnUT
	sj3DfFdm8/JWIyAUC133BBxAFGAWuu0E0A/fIF0P1wg3gUMtmE7FBu5VIyjRvA+jMZlrrmpPExK
	e+cy372KanHWox6yf70gnkrmmH1+JxZPt4Cpr1I8oxQYMrKED/mw+6DKVNJRfO417vTic6a3FLn
	xQHvOwX8ieUZAhnzTUTmUtQBSu/t/SkrR5b4xYt9YgQ3bmzs56XGjY/cZeKDC0PjSYuofnvnjze
	CpcfT4GIkVLU0bSKt3d+gpmd4ULiJLvGAtaGKHAKvS+9CZ14NQw8fTBp0MG5E6bjnRFzoWEVzof
	drV2RTrGYiwc6T0
X-Received: by 2002:a05:620a:44c2:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cb330af84emr367850285a.35.1770911632007;
        Thu, 12 Feb 2026 07:53:52 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cb330af84emr367846285a.35.1770911631496;
        Thu, 12 Feb 2026 07:53:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f84bb7b0fsm125659966b.1.2026.02.12.07.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:53:50 -0800 (PST)
Message-ID: <1cb955d5-c813-4b52-8f0a-51e4635d7b27@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 16:53:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] media: i2c: mt9m114: add support for Aptina MI1040
To: Svyatoslav Ryhel <clamor95@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260212122302.29211-1-clamor95@gmail.com>
 <20260212122302.29211-3-clamor95@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260212122302.29211-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698df790 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8
 a=z7WSZaPc-eUsHMb9-vEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wljM5Qoy7Gpabk5MnnzBwGdygG_KU4z_
X-Proofpoint-ORIG-GUID: wljM5Qoy7Gpabk5MnnzBwGdygG_KU4z_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyMSBTYWx0ZWRfX6232a46DZ8QA
 A1uqJNYQRkEVbBjGaWf573l6/UWnPV/bqhopQIYuzov2Bb1qVz/u5E1QCBaGw68p+r65d9EZv7U
 YLocfBJlAzjX6GwmtAR2cMsgP/9S7AU7Kov6aTjzf/jYmJpw6ahldjYZzbZqjuDpoHvp1ZhhJif
 bDIytBWkPd62ERfM8czuZJ3Tdb+/BPf1QOAbGBPdOVacmO1NeOiBtn006i6KkjsSdrAr7pWmdPc
 wb9ekbIGRkY1JqRblktceigJHQ9Ldj+GaJ6grvqAKLuraCtzz+qa88kjXeNgWh1i8ofppYQPYWn
 PoOf6gnjiKpZmyQHfBySFbarQWq33Lct3CrqTPXCQRMFLRsq9UDMcxJRoGB/xbbhv9GBYnZRmc/
 FB3Cb8usO5d1a9fz/JVJzNkzUgegmiuCuM5lk1gluTb4jnCWxv8D4bxs39xjFawMciUPI0QLV7c
 RSCGFR4j15WzYX5pRtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120121
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
	TAGGED_FROM(0.00)[bounces-52661-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B8B112F22A
X-Rspamd-Action: no action

Hi,

On 12-Feb-26 13:23, Svyatoslav Ryhel wrote:
> Slightly different version of MT9M114 camera module is used in a several
> devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
> called Aptina MI1040. The only difference found so far is lacking ability
> to poll STATE register during power on sequence, which causes driver to
> fail with time out error. Add state_polling flag to diverge models and
> address quirk found in MI1040.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/mt9m114.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index d5b142fe68a9..a4b021702a1f 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -373,6 +373,10 @@ enum {
>   * Data Structures
>   */
>  
> +struct mt9m114_model_info {
> +	bool state_polling;
> +};
> +
>  enum mt9m114_format_flag {
>  	MT9M114_FMT_FLAG_PARALLEL = BIT(0),
>  	MT9M114_FMT_FLAG_CSI2 = BIT(1),
> @@ -422,6 +426,8 @@ struct mt9m114 {
>  
>  		struct v4l2_ctrl *tpg[4];
>  	} ifp;
> +
> +	const struct mt9m114_model_info *info;
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -2279,9 +2285,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>  	 * reaches the standby mode (either initiated manually above in
>  	 * parallel mode, or automatically after reset in MIPI mode).
>  	 */
> -	ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> -	if (ret < 0)
> -		goto error_clock;
> +	if (sensor->info->state_polling) {
> +		ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> +		if (ret < 0)
> +			goto error_clock;
> +	}

So I would expect a flag called state_polling to be checked
in mt9m114_poll_state(). It looks like you are only disabling
one specific case of state polling, not all of them.

Please rename the flag to reflect this.

>  
>  	return 0;
>  
> @@ -2527,6 +2535,8 @@ static int mt9m114_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>  
> +	sensor->info = device_get_match_data(dev);
> +

This can return NULL when the driver is manually bound through
sysfs, which will result in a crash later on when checked in
mt9m114_power_on()

Regards,

Hans




>  	/* Acquire clocks, GPIOs and regulators. */
>  	sensor->clk = devm_v4l2_sensor_clk_get(dev, NULL);
>  	if (IS_ERR(sensor->clk)) {
> @@ -2641,9 +2651,18 @@ static void mt9m114_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(dev);
>  }
>  
> +static const struct mt9m114_model_info mt9m114_models_default = {
> +	.state_polling = true,
> +};
> +
> +static const struct mt9m114_model_info mt9m114_models_aptina = {
> +	.state_polling = false,
> +};
> +
>  static const struct of_device_id mt9m114_of_ids[] = {
> -	{ .compatible = "onnn,mt9m114" },
> -	{ /* sentinel */ },
> +	{ .compatible = "onnn,mt9m114", .data = &mt9m114_models_default },
> +	{ .compatible = "aptina,mi1040", .data = &mt9m114_models_aptina },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
>  


