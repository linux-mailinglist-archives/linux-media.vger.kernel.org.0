Return-Path: <linux-media+bounces-53102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGgoN2kxl2kcvgIAu9opvQ
	(envelope-from <linux-media+bounces-53102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:51:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A64160611
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB173308207A
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE45734A3DC;
	Thu, 19 Feb 2026 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjBZkiq8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMfyN3MO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B4349B1F
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771515984; cv=none; b=mB7GooP2keBx8Q1NV6XaB8BIz+mk8S/R7ObYbVdpcH3ZLIIsVQfubyJKgSsL6PZ9iKWVLrdrFYDJi0CPT4klhjbKZGdy2roN+94Tf3lz1JjOL2qfvu0fJeytcD4T18FtUHQb9ONpk/Hj5xwm+EumDzJnhdfRVsTiH1o6ZZwbQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771515984; c=relaxed/simple;
	bh=5yVnxJnGDBre0oK0j8tWGeleh1q6ryFS3qC6cSNpyh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPrPW6XBrVvQQ749gMwn3mqgqFlgG1NsMOfEGa7vgRUi4RTHG305zQm6/R8A9XG4dexKKgucOeLeGdY75qD6Bd4OOCmYjGDzrUHKClmMCU+AxOhoFS+qMgWugAQH7Mfnez9PkoGO0M6Gsl/qziqB7AdRwvm6O0DlcMrLRkLrSE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjBZkiq8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMfyN3MO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JEw7pN3320023
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7YrdpyqA0b9kiYotcBAzLjIrKmKZgC5slC9IC5jCkg=; b=fjBZkiq8ggQpwX/r
	/i9fKzHlEtQGdEeAYE7eZcHVXm3Leb8d3EjHjUxGgweN4ZYwSm4zvBUhpJGS+9au
	3vbAwe8dEzNChImiCO2HMltDEcDak+ey4BrEnYHd4gzLrtRyX/vpyQVz+45fejNx
	WwExRINXuQfqeFCkrQLaNn45CrIcb3BDgrBK4I4zeu0FVDGHjDBSWU+QRfM0ZeBO
	XcXwQKpCXnxMmXs0NmV3juiVUsgkfjl0w+hnOIT5xB9bIicdzCoFtcfv4oD78y0P
	tABgO6vcRusoQ6GP+ld/bIq+qE1Rj7YSedB+aq9ToH4oiYoInZrZM793kaD9aIRV
	kPU9sA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdv389pc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:46:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896f5c90f07so11410406d6.0
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 07:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771515981; x=1772120781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7YrdpyqA0b9kiYotcBAzLjIrKmKZgC5slC9IC5jCkg=;
        b=WMfyN3MOkTNHUO7I4JDdy75cEXq5v3OaDpbbN7QW0zr12tmlFb/vi2oFlR+GMHAmrx
         u2Ok2yTNvCOYW8J/gw2mwfofrnCM6wYM4Vmmgl2zOes8/nIrDRI3+4h4+iPy/mi8y9vj
         UIvt3TRr/wFRLA3co3PNgsdelm4jBwRw9c6LghMW/VOddaN9tmSiacZnEEEr/hwnTzzn
         MV0BJ6O9hjFV1NGgdxIU0bNIf+KTwPU5APHHXt6xhVfYdVlmlURfr9iiJwMhVlr1RRGz
         aie30iLsWFerXivPsO0Kz6/Bs9pMIf/BOdOrerDahq4kcOZS289vzzg1qmUC/Y81s4/r
         IFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771515981; x=1772120781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7YrdpyqA0b9kiYotcBAzLjIrKmKZgC5slC9IC5jCkg=;
        b=hg/pu+gg0wJRoCHXAxmaDxR2qPSCuk791mulS8BuHuloJcbH8m/G7wAnhYapRXFsmG
         Q7XGzPOYTATq92k9J1ORaZDUcrkow2RnaxXLBqzvdjAH8LW24qWqtvzey9Nm+/3a97QO
         BVPoHO8LGErAC71jilo/LoBotTRvmpvQruvJwQ+5yNpAXBTo/EsuUGqLGYGAsq9eh61o
         ND9Y+RAFJPL4EfG9Fd8eoQ+xHRq1wNdMMN0K555kLt3ckPxsCDPqF34/1K/dGAe14tix
         Yl46aBUltP4aL2guRv7gmNuBD7kzSRs1wJziWNUUwDjKxHFniA7sgUUMkFo5QiyZMPD5
         6Twg==
X-Gm-Message-State: AOJu0YyO0JjhFJ2rdVXmZpe9I38Yp3FSI9W7Yt/9B3R6ygCEm6i0BU91
	tOT9gkLt13avT9nwuBgfvhyrnvMSPlWOnLRZqpJwwvNjXmJlUyjcKj+vNG7sCaJsd+nMw8p5mB6
	dGfTDWOXJ6ko2TxKA0fft1pKdYXe+x+IEBl9+oTxCr5hhPwwwKSnJYNv8Fg/7IgOZvg==
X-Gm-Gg: AZuq6aIpouqKfLUm2b6tSycHd7dvqNdZ1xadV5J05cWdRdodi3odYiDC7AVgFJt1fjj
	3rmVlslD30hxVDgVJTxZlmOEFdL4U94cQ2cTKLmkSzgrJD9aXhJMBZLp792rmdtzraksQ922qYs
	PSca6IItNKX7CBhB3Jg3cAaWTVzMCV7Rq4japU3M5vg6zozJEiMq5A0m3A4J8l+Zl35zNU6grd+
	EdauXxrisOQC/TwWx1VWUL7dtpg86nJ6AZfwM5s3dofBYERPReXaYarfq8eEb0zqdX72oma8VEn
	hlBgOd7f02mN164FirSXlatX0zaGzdwBYWQvqUSBSG37LgcjF2NZQ/LgTazu1Dzgd/ivHI06Ku4
	NR8QSprJxUYaHYXjz7Np7r/QttSB8F0eI7of/VW4qAett088XMz4+7Sos07jvvlcQ0H9bii28jq
	XjktA=
X-Received: by 2002:a0c:e00f:0:b0:894:9d9b:84f9 with SMTP id 6a1803df08f44-89734709b89mr192839356d6.1.1771515981515;
        Thu, 19 Feb 2026 07:46:21 -0800 (PST)
X-Received: by 2002:a0c:e00f:0:b0:894:9d9b:84f9 with SMTP id 6a1803df08f44-89734709b89mr192839056d6.1.1771515980962;
        Thu, 19 Feb 2026 07:46:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e872sm590589966b.10.2026.02.19.07.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:46:20 -0800 (PST)
Message-ID: <01804171-a9f2-4509-afed-d222c5d06251@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 16:46:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219152737.728106-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ceffb3DM c=1 sm=1 tr=0 ts=6997304e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=x4pdxkGDwTypj6b2yD0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: P_563Za0HazS0S7llVpftk_WjRVCP4WR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MyBTYWx0ZWRfX4DdIRQTHOLl9
 zHBGxsT+kPqhKfCI5FR4Q02LvU3NAbym4jXUPTdm1gcm2pb9twDTMS+LOuJVCyxeOGIPyyY1P4N
 jLdKVQ4tGPnLReWCcgeMXWIqLSKWXOJgvcswi0DkB9flzLEfTZNpprAhWhlATApy37QBjq/UsK5
 /AZ+YnZkAwOa4Ld7wG9psKprAsewD4VO+szBpB9ag6tgp/h9Oqs2HYqEyKsZRxdanhbL2BMAKkH
 paNXlWi9HHcA9xxkw0fXuX+Ow9hiAszfSlQ05Sr+9EQfvSms+zw0pX8DpQpvlNPSxObjimDhDMX
 lcn8JRDC6ca6Q8HE45mvpPLtfNP1rDF9pGlrqPX+blqZXyQOrb0/rWTbj56yzJ51Mxvf+a8tzwW
 +p4oBJ+2JelKmoq7sFFNdkI72fz1C+spuqgchv6muUuBRdwDNJgQ+gDPWtoWa0rk+rLd7EfWLC9
 +DifZqTACSIizxUaMnw==
X-Proofpoint-ORIG-GUID: P_563Za0HazS0S7llVpftk_WjRVCP4WR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53102-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17A64160611
X-Rspamd-Action: no action

On 2/19/26 4:27 PM, Loic Poulain wrote:
> Add support for VFE PIX write engine, allowing to capture frames
> via the PIX video device (e.g. msm_vfe0_pix).
> 
> Tested on Agatti/Arduino-Uno-Q with:
> media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
> media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 field:none]'
> yavta -B capture-mplane --capture=30 -n 3 -f SRGGB10P -s 640x480 /dev/video3
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +	if (client == TFE_CLI_BAYER) { /* PIX */
> +		writel_relaxed(pix->width + (pix->height << 16),
> +			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> +		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> +		writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> +		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> +		writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
> +			       vfe->base + TFE_BUS_PACKER_CFG(client));
> +	} else { /* RDI */
> +		writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
> +			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> +		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));

Were these default settings (prebumably "dont care" or "always max") valid
for RDI? Would the ones you set up for PIX work/make more sense indiscrimately?

Konrad

