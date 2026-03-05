Return-Path: <linux-media+bounces-54624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGvEAsRwqWnH7AAAu9opvQ
	(envelope-from <linux-media+bounces-54624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:02:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6132111B8
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 077453024A49
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 12:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5653F3988EE;
	Thu,  5 Mar 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jD6qCXHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5UiLGuS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C8383C7D
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712080; cv=none; b=KbWMbqIlTKNUilhjDV+ilQothKs9GLzf2JVVRMGFZTFp6R4rjdKZiY2nm6tGjqI9QUTBYt6f0Rig5RZkpfvvF1G+O4aUVN95Tdmn8SPLzGsuGPPJI1t9p/bZp0rfPX2wnb5bAg35YlLVI4mHG1R8ADn+wKOh4Y71R+6FHfmU8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712080; c=relaxed/simple;
	bh=zygdDX9+W+oMjvzo+XEs4zkITghAIx30y9g+SS5sjyw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S1J69jXdRhCnB0Eu8yL4zeMsJECNtMUQKZ/8BDWoM+pqyFDr1X5QYy3eG1drn7XwAx1ish9Ev9eoMPvkqDEoY7dU8Ig2LJRbDRkEkwhWv0T4Ii4zCyxoG7zs4ueQYO0XkWuflsVaYlMGqMoSS+rc1Cfg9a1+pnjlioJwj+URaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jD6qCXHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5UiLGuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFrBN456172
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 12:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kHJsrS+fSQ7OcWRA5LmpUsqkNxNip5EorCn4UGNqtc=; b=jD6qCXHmhRK6QZeg
	0wfR1Z8/vxPdgcefMUB22eKws/TyF+3BQDo09hdYh6+ZXdzSW8jotOTwmiN1jKcG
	EYwFa7Js28wMLNF9uZYQhMVJ6fsJxRr+O8k+C2uam0SvGi89lHX6XJgSsGFsuQSp
	eRt8ThN2ab7qSl0QwgcYDUOCb2x/xOGtwHoEELW9mlQZ1B0hzi2BY3DhAdCkFFr5
	Zeg3MRBGZGP0yy3Vg20MMl0zOj8mKm/BYxMYLrkZMDwf7mDLKLeiQc2MaizfHVFa
	05s7YnrTWncEszyupAGF2grZwy8F1twve6NPowPUmQ0r6+D0iVL2RUo0oWSz3aME
	GICJvg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wk3yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 12:01:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56ae2015498so10731267e0c.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 04:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772712077; x=1773316877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+kHJsrS+fSQ7OcWRA5LmpUsqkNxNip5EorCn4UGNqtc=;
        b=G5UiLGuSUgz+/U6GCh3DlFMWoISrEbqNyanAjWdoweqX30AcXCXRDQHwjuqUA/501S
         pWr52ZFpqKiJMytUAEkDTOff0ES0YI94MXRefheUHwUShKjkWiU+PYAI8c3EgfsnSC4A
         nprgXfKsBTYGBtc/0BfNCcE3Z375mHaHeNIXbSulGYFH663fWt8V4KVCAA2stOpNDdJv
         04Ft1cV4e+Ic0scQW9xxMfqx3WnEHX1wh7pHrkTbxMO9Y38RL6Ur+8EvuxKEWaE1k9Ov
         Z9uPlJEwHOjn86H5L9fuF0OMaZqBNR1NxkyS2xh3k1Q/KxnLenPdHBzWUHY4q0uZJVOp
         H6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772712077; x=1773316877;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kHJsrS+fSQ7OcWRA5LmpUsqkNxNip5EorCn4UGNqtc=;
        b=TMd/LO6cSijhPg/Zy6XkNEBhNZw+wPUdVhGx+DAsxVWzki3FnFV/ghC+EpqvSO0TSO
         ss4Swtg8wFARnmZQ3nAfGadAVvhDr8uLVuR88fR8edjl9RbYC6EE9ZT664WtoWfflj4M
         ITyoDu9pBhDQzD9lBaMlDd8pMqOjx3s3DyYJuIB2LXJ+fuRet2+A6qEKch00AvcGXwQk
         +cCL15UwVZKzZv9macXYlFfoYeUlPRnwC2sr/QI92lQUXgB/EyZH+2XVbLvqrcJPX01d
         zcmvf2np2fp4Bq7fOUWJMmN4RC1fY6RSyvqLKlCa6wfl/aPUqoVHp0syzYZjyhVDWDgC
         b2hQ==
X-Gm-Message-State: AOJu0YyLyqO+YD1F3w9xau3Os39udoLI9LKHJlb8XGWK+Kx32KNIRmqU
	MlnRBTTEwe5xvAW15u0msJfMq+ovdG8d+P2PpGPx3yd7Ud2mIpnM46yiKH8kZk3UvGzONKSc4mg
	dAwpRXbz3zypgK9J30YEsYdOteMXfYwJU/dvAcP0DY5XUqU6Ag0nE/LjLDY/Xy+u5ZpXzrfvuhQ
	==
X-Gm-Gg: ATEYQzyFVpeE/rVtZAtLpWbiymQGnT3tlbsUflUWBnfd0vFaC1dDZu0Pw+oqny5CPVA
	VV6F8WJZh1NLqrX2cdK3JMDxJbF0DnM4+y3lQtoDZMwm2ptXAhWZr0aa5gr4/AxjJjLvpN5nQxO
	vC9PSXWU3Vr53QbMLMi7wRwsDDliAJKvKKodjPJONi1yT4Uyvd7MJH1ekEnnVYmatCJsgm4Xj0L
	YsYgcVqV/sYOTNbpAMlf+Ftg3apXafeUffUyC6snqVRl0gma8OwzTtq+ciZorpAOEf4CLCyx3a+
	2mPnV1dnqdQ/W3SwBKSpadexlpImANoUSu9wuJlk/i6J7LyKp4LQtd2HTHlFMwoyC6/MFzDUkRk
	1wOumouMF6Atkr6JQ47GbMahMh8UTOMeE+17f4gUDK/xH9Mmyzff8fCBAJ4SAqPRwRQ7lF35SDH
	f00ws1nxehN6ai50NZRg5MnjqSkXMyrijWJxBnMvAKbASD41klpfYcDUBYF97rjQiaDSAuf/b6S
	t44VMtU4DF11jr0
X-Received: by 2002:a05:6102:3f4d:b0:5ee:a6f8:f93b with SMTP id ada2fe7eead31-5ffc8bdd63emr883526137.2.1772712077269;
        Thu, 05 Mar 2026 04:01:17 -0800 (PST)
X-Received: by 2002:a05:6102:3f4d:b0:5ee:a6f8:f93b with SMTP id ada2fe7eead31-5ffc8bdd63emr883507137.2.1772712076661;
        Thu, 05 Mar 2026 04:01:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94172ca2dfsm34184266b.36.2026.03.05.04.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 04:01:15 -0800 (PST)
Message-ID: <e529e5c0-ae0d-4d1e-bd83-e1db77e911b3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 13:01:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v4 2/2] media: i2c: mt9m114: add support for Aptina MI1040
To: Svyatoslav Ryhel <clamor95@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260305102123.17216-1-clamor95@gmail.com>
 <20260305102123.17216-3-clamor95@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260305102123.17216-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pKMsaDX6N_s0RBPZvSUIBI_xWCh6JPVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA5OCBTYWx0ZWRfX0/km2pCBgWH5
 Mzu4/hhYbG4kCtOjWOuY7dwDMrwAPHxZclXIzRKd0r79yqZcr7H+wt36KIbAE9oAyE9Mkirkbl8
 YtNewFwrRBTkMN5AQMgXxZmL/dBueSP48C2e9GIhpVvlbzU2XXVAxpk2DP6oMyem+DMUG35FFJ4
 FO+g/eGMZlk2Qio4HiPg/6vggnCk3WuH9EgSVpnDmACnMxKQNKKW9wT//0iZ+8dEB2pnYJWZwni
 gNdxwt2iN+orza4Gq0lRaf5blQAIhYLYllFfiriwUT4hDju03044IONjnHMbxB6ea774xRphTPr
 /oFs9oTNRVEuQq4s6grZJ+xeXeidmdl5IeAZpBz7TaVqtiJQ4sTDArF/eq9uPjBGmUy+x+DqVgu
 kkyogukw/VCBx43mQZTqh8kBU+OafFolA5G4f196ReZ/om6E3ZFMVnFsG5Y26NYZdTWY2vDhHXz
 Yn/++Jq8JJ26Q1U9THw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9708e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=bTc6kqDxjHKFMN1yjnMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: pKMsaDX6N_s0RBPZvSUIBI_xWCh6JPVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050098
X-Rspamd-Queue-Id: 4B6132111B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-54624-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,kernel.org,linux.intel.com];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi,

On 5-Mar-26 11:21, Svyatoslav Ryhel wrote:
> Slightly different version of MT9M114 camera module is used in a several
> devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
> called Aptina MI1040. The only difference found so far is lacking ability
> to poll STATE register during power on sequence, which causes driver to
> fail with time out error. Add state_standby_polling flag to diverge models
> and address quirk found in MI1040.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 16b0ace15813..e395e2d14e97 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -368,6 +368,10 @@
>   * Data Structures
>   */
>  
> +struct mt9m114_model_info {
> +	bool state_standby_polling;
> +};
> +
>  enum mt9m114_format_flag {
>  	MT9M114_FMT_FLAG_PARALLEL = BIT(0),
>  	MT9M114_FMT_FLAG_CSI2 = BIT(1),
> @@ -417,6 +421,8 @@ struct mt9m114 {
>  
>  		struct v4l2_ctrl *tpg[4];
>  	} ifp;
> +
> +	const struct mt9m114_model_info *info;
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -2284,9 +2290,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>  	 * reaches the standby mode (either initiated manually above in
>  	 * parallel mode, or automatically after reset in MIPI mode).
>  	 */
> -	ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> -	if (ret < 0)
> -		goto error_clock;
> +	if (sensor->info->state_standby_polling) {
> +		ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> +		if (ret < 0)
> +			goto error_clock;
> +	}
>  
>  	return 0;
>  
> @@ -2532,6 +2540,10 @@ static int mt9m114_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>  
> +	sensor->info = device_get_match_data(dev);
> +	if (!sensor->info)
> +		return -ENODEV;
> +
>  	/* Acquire clocks, GPIOs and regulators. */
>  	sensor->clk = devm_v4l2_sensor_clk_get(dev, NULL);
>  	if (IS_ERR(sensor->clk)) {
> @@ -2646,15 +2658,24 @@ static void mt9m114_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(dev);
>  }
>  
> +static const struct mt9m114_model_info mt9m114_models_default = {
> +	.state_standby_polling = true,
> +};
> +
> +static const struct mt9m114_model_info mt9m114_models_aptina = {
> +	.state_standby_polling = false,
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
>  static const struct acpi_device_id mt9m114_acpi_ids[] = {
> -	{ "INT33F0" },
> -	{ /* sentinel */ },
> +	{ "INT33F0", (kernel_ulong_t)&mt9m114_models_default },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(acpi, mt9m114_acpi_ids);
>  


