Return-Path: <linux-media+bounces-59683-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEf0KfRc72m3AgEAu9opvQ
	(envelope-from <linux-media+bounces-59683-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:56:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBC3472EF2
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 009BB30067BF
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C11B3BC687;
	Mon, 27 Apr 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDr3RaOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkL/dX6Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD88D3BC668
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294570; cv=none; b=ggDxBKDNCZacnuW1wFHnDFs0B2KDNrH+UmP3G+owuoaDi8tYtCnN89noaAiXqmn0WST/LaD9SDafZeQUX800PknxxNou0QQ1lU6h9vrEt0QKUmkwIVDzixmL5OXOgnaDyjaUS/WeV5BvD86sq2Ghc3kTsg/J//8XUm7sJ6jVvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294570; c=relaxed/simple;
	bh=vszQpynj8bogXIjt53OMrmpaaC7oK9NQMvMAHad9rc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6gAf2NKpg4tbBX0g6C+BAe72FpRQ4f82UhipKRJ0Ii4QKY8Pq/7vg7h5KzuoEzploOwLCu8+xxWxc+bbbtbY1mUq1fSjRdz1XQ5iY/gnuS8v0FVu4IdxEzTv80VnWk4EApptbx4BNWU9eyMENcjaJ7Sy491NM7ycRV4AnVYEJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDr3RaOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkL/dX6Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYMLH428828
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=; b=QDr3RaOWeS85NudY
	Qh/kAK98ECAgglsTiJLz2YSus1Yo7Mdi9jaHyfBxB/gzMAeE3ufVpgzS/8zv0pwQ
	PTkLGzQtA5aP5D+OOD4ZS53OrGdIjxznBVbEmrQ+DyEW/tkajLrLS35xhnaX6hbe
	tYAyFjGHREEL8AFj1v5W5Bp3Aon6xFRQEnHcpYHMC5jxrjZA+Rv2ZoKREOq0dC+F
	wK3ZE4kKelOT+GVAHL0BtEJYUc9KwvjSKWRvUoxA8MvmtNbkIJpwPKW/G/UwTOFd
	cO/OL8m5p5UYmNcAA9J+IDGtCOJbk8rW/P/3jTUCBJYWqZ/rKO6iuINYmxCVq+dx
	ZOCixg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x30204-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:56:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50de6db1eabso20511501cf.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294567; x=1777899367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=;
        b=PkL/dX6Q+i4fZlZtnoZ6LigofsobTgWJJrEf1Z0e6h6Ld5vNKeugX40GJabSxotRME
         7SCbzWMoQgVAsmWxIdBmi6rODfrfigPgMXjt6s+6tXxZ7Ay+VxJOqgzY+X0daA9bFD+l
         smQXCXcH+FCmJHNW5ZJmmo1sUcreTjwwSvI4lN/kc5TFTeyhMH7z4w8XISIYjzz5+dHA
         9W9BSELVC6TlrPXZobMfmyaTKiptctkeC9We1aqUI7x/drwkv5A82x8KMoeLxwWTcUSO
         cRDy5AzL66XWDK8+679vMqRHAh9JsK6e+QowKRqiRXFU35A5sqTQtdNh8WnvwqvuPjMC
         WJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294567; x=1777899367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=;
        b=VwUFtt7HcWXRyUJtR0RCNjqPLVwIi6pEwsl8Cd3pRE+7aDhlIZlc74CyyShnpbtMks
         lUc3qXUlYprZXa7A53mqjs0xXkClCY6nY+d9CMFxuFWF+w3WEQgsu0F508f/cnJjBbMk
         KDj2VS43dndc/5HWmQkJQXLppre/xoXZeqj5jTgZc+AyGn0hLNv/CpSj/PVc1AmeBzTJ
         ogFMCpc+16l0bW7a9Y7+31JUJCBz0RpPbZtUXwOmCz7utAtahb06DdpcL975BnbYHRi+
         6eD9N2spvGlhbMpoVACITqEMKmaSOaPwdpqyxj0V4RlCqQy82LIKfFO1OaIPPpEPcBck
         xDXQ==
X-Gm-Message-State: AOJu0Yy0Q7jPO1rPCCdkbSXNPBKBMMp3yYGeT2P1pflM/CJq9Q7kYXLp
	LjnivUnEmuo2nXPVypqBOqSpbI1kbIysGE9/pKf6NMt7mphCGF0D6BLEA7WuaNNIFb5vyEN0s/i
	VuDgHGXLOe0kfPVt4MaEvvudsLsjOPP7xa8QH8zWT3kqUrHm69vcr6PHjNnsfcZMfgg==
X-Gm-Gg: AeBDiesaxZqtPbI1oOBoMMeQzD1opkf9GzaFQoASDNrX412mV1M+/Sv+EwRz1i13VLd
	N/mi5MiRajthOHtweZNSxfwO2MoOvW1ugm8kjRolcpuMplT46FSFhuM29KI9r18agUiBnP1ZTIm
	RsRyBh70ir5w1QJbeaJofN6EbAAgB8f7n+Ufi3/79iCJmK0DCLY6XbactVhk3BNwbFuHxreqSqO
	MY0F9yW0DIGMtHKQyGT0hEoyLEM3frxGG/ATzylSHzz50lZtc+Q4rWGRBhT4eK9YdBHAkdz6STH
	NFzYYj04EjT6s4oXeqtU+B9r87PvW4lGSm1jmd0/4bCsIudBIvLM7163WbsQb3zWy5FtD7Aob7d
	Ex/gBZK8zJXDD5XdkuQjtIYC/ZlBxfUpvJjGPT/XQrcS+Du2GP3SCYIHPfOD4uliwGkDj+71fbm
	IR1YJB+aqUKlkfzA==
X-Received: by 2002:a05:622a:1918:b0:50f:a53b:9cf with SMTP id d75a77b69052e-50fa53b0c53mr284503691cf.1.1777294567179;
        Mon, 27 Apr 2026 05:56:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1918:b0:50f:a53b:9cf with SMTP id d75a77b69052e-50fa53b0c53mr284503401cf.1.1777294566746;
        Mon, 27 Apr 2026 05:56:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe874sm6386349a12.6.2026.04.27.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:56:04 -0700 (PDT)
Message-ID: <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:56:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNyBTYWx0ZWRfX2Ue0v/0jXh56
 WszsxFW/NbYax2Qfuk6NoQ9hi/uktMg9ywhPPxZ2yfu6UB43tvttceYbc2I3Wz8gYca/criJD6O
 XfsMyMI+LLQFFlQ2hN8vCWAr8EogNRantMC8lWSpU6Vl2EPbtN8BtSEZpp6BE+FQxvamFqxhgJ3
 tAODa/0EojRWHVXPdZGHMxXdzTK7v3UzJuzXI2Ifr4THqYH8ScRgbw9y08u7QyEp5H0wV36EC4H
 khWsss+eUSO/Y3zDLK+RG2/wFDFIyIdiA/PwCOU4xum5Qo9oXO0KNz83aB+Tk6lo9J5bbPJGQ6L
 QniiEEPKps33LOeWxse+UnZ4Uab8TBw/wquWCddrHIeC/2/Qr8vn8Yv22xG5u3Cmbgrv2gOoiGQ
 3z94e1FXKdwTgJ2ANw2/WvLnVSms50Y8ujOZiptYL4zw3OhyCxtIhykd2HRTo+6gAhZGCtSGkeB
 XfS1sdZBGQB3UcP5Zvg==
X-Proofpoint-ORIG-GUID: LH-apHY73EqODsi-ED31aCnwB9SYAafz
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef5ce7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KpaCYs1BneEYRrX5G8AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: LH-apHY73EqODsi-ED31aCnwB9SYAafz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270137
X-Rspamd-Queue-Id: 2FBC3472EF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59683-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add the uapi header camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]


> +/**
> + * struct camss_params_wb_gain - White Balance gains
> + *
> + * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10)
> + * @b_gain:   blue channel gain (15uQ10)
> + * @r_gain:   red channel gain (15uQ10)
> + */
> +struct camss_params_wb_gain {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 _pad;
> +} __attribute__((aligned(8)));

Should this be __le for all of the related types?

Konrad

