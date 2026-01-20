Return-Path: <linux-media+bounces-51112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O6wOuXAcGmKZgAAu9opvQ
	(envelope-from <linux-media+bounces-51112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:04:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3156769
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 644295E7AB2
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 11:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7512D40F8EE;
	Tue, 20 Jan 2026 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBCdgDDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOLNDHGT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198640B6F2
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906847; cv=none; b=eh6ycwsbLq8wbeA/tW5DN8+rrxiWoM2+4DpHmtJEw7jNFMFb8PPClgZ6tybsZC63n8DPOrhlud8zGePZZpw5NGiDwi1Q8H7TlBk80APZ/mXJ9ZEmzbYaZ+/DAec/kRwS1Gn3T+YcKxcw+A3PxWpEQj+2Dsm+MgAS6r3rQ8cr9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906847; c=relaxed/simple;
	bh=O46rSJlea/SajDU0CJ0HrX7k9pM7TZlXxm7PxEt0hAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlTjmIQbNPf6j8ph3evDDb6iVK5Fi4iuAI6FcLNFy3vqFvmXiUHH4Kw0+dGRRcbGTi9spc1z6yqZ1IDkNrRJd9RRAj/f9iZ3rR3nIKueGSsBzPaisgm8brnrsFG5svsR8axCh+vwqk8icehfuYwUkfV4WrynCe7xlcr00PlwDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBCdgDDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOLNDHGT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9rLM01347305
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 11:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=; b=SBCdgDDRB7ddlvY9
	R1a0+xdtP5OD2wPh6jVv8cHBQqhKdjp2Q7CgdLd2vA90FnlyZ+DpBablDPU7Ykma
	fP/VHhPzcQqeQYHOCjsxpylok0iEbxQ2J/0h/EwNjoxTFOSAQsCo8eWrJlrcpY5B
	nU533isvtDc37zJcCCNJSuVTRNju3+0CGCYEP3Fith6zyLroY+x/nw81tZdobOit
	23qW5EV3UvH7iOqSNusRExhhjiAlEWqjbaMo1ySeg9l/cHNyQ8ms8veAdlVtEG/i
	Az2385lYgPa+o52q2oCngr3i6sz8ixTCz1377k5Dn2OZ9W+nXMDywNH2ZpCQrFoj
	raYAQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdjyta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 11:00:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c533f07450so115348785a.0
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 03:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768906844; x=1769511644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=;
        b=BOLNDHGT/oeNo40b07d5HdY+TYQhdqvVgMahw9T1OOQ8GJwn1pLfPkykp2H/IiHDTw
         INjiPWLzzFUFDG6kYc2WjdynBAArhDLQUKVNL9rFfbGufam5BXwrHF2rCh/c0W/6MiKu
         +DhhPXvQ/07wnllXNqpoDJL01mu7T0F62J8+lnW92FjOJI8q1uwSr2fR9d7rJAQbaXgy
         EPjNO2vXohzhpTv49FEQv/sR0NLCt+naUPxodNuHlp8BZGIxB5tGGyMguP8nZjVhV/Qc
         AOqI3tX0iSCpxIglUmqf6WIhfSOlt2/PZzt8cSWgM9KV6kNaLdNqFYgFRcnRPa1T9Wp/
         fdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906844; x=1769511644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=;
        b=XBsCYDegUkNxP+zo20RmlRn11k1iSryRnJkqespitkS5dAkqV9e6Ok2OR1hmezJ+FP
         b2oAk9K3KDGYXfkuHD+24Q9Zd3sNhuwKDqhFE+3wDmgqyjgLMLxV35vgvz2ebINJISDe
         ewhxNfhGE1xiGJPaZBqwsET8d1X7AmIvdGIYyNJxaQAn3CvOiWpYXyCsJrDphZ6/3YtS
         fBCqNxZSd4Y7hszfDlwSvNqvwWBZGwmVfUGbfS//DI2ea73c4/mQGciCp2A4qaLr5YOg
         MUxYZ4nnFNVnH0rsxTOOasGalL760+u+56tUNhhPwp6/908hXQntfJ29EbJaGvnjTtKS
         vLjg==
X-Forwarded-Encrypted: i=1; AJvYcCX0MFAxEPFkjqCXjixW6/OSRuFxWy3fej7N97rG29t83iVvN6Qj5If5GXukvAUsOs2hD3OF1gW5OuSMSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEUenvXAsq1+2WtkU0u4cCTLWVA2cSsTdr27aPR1HFgHBzboRo
	uAhIX9f9MoHvxs9/Qn6xD86xMPCATBtarc1OXyAtqzyhULI8hFjWp8kEObfobW3MsR1Nk3qjRm7
	Ud1RxJMiH4xFN8sfWPSQqqaSd1ZJsWGqfpNOMh/7A0rpVBd2IlKoZeqAnBABH5e/V9w==
X-Gm-Gg: AY/fxX6hKxMB6yCSqk7nveI9EovGmimaCkMub+maJRnUK7s4hYJ66wC2rx30BA+INmJ
	VexH3rwVWdcFdhQtgDIECsRXLCJ3M4F5DmDlDq63lQJyGuOnEnlaBb/1PAgaw8P+TwiaGPLJ9M/
	4iApr2ge0MD02JfFaf5d0OTve/txSn1DW7wqL4EvrfwtKXTjnmzAhVPW/Sy2X2SI4YTdcgYyUua
	jBTsx1T79TloctQsP2u49tQOZ7/TWj/c9Na0X33HBxba/WvT5e/87s4043t7AlD7x+gHxwL5y07
	aPC3GtV/kWLZEzf4ZNoDNePV7/fkm5ecRbtp7qCh6x6YrRB/yx144eANakwhlR0LuwZdfRhZsF6
	dzABiGb8ikmsMPjDW5YmUvWbLdse9/O0NcYxUHBt8iYjI29B05qGYA5rPYpgRuVYMmtE=
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1505530085a.5.1768906843304;
        Tue, 20 Jan 2026 03:00:43 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1505522385a.5.1768906842492;
        Tue, 20 Jan 2026 03:00:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a2f1a3sm1348490166b.62.2026.01.20.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:00:42 -0800 (PST)
Message-ID: <c37e9121-31df-4934-9568-9f7e9c9698f3@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 12:00:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260117040657.27043-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696f605d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=He3dl_zFzQSlanp4l3sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: R-CmVp8eueqtm-FZkGfRAELW2ICgUhVv
X-Proofpoint-ORIG-GUID: R-CmVp8eueqtm-FZkGfRAELW2ICgUhVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MSBTYWx0ZWRfX/WCiM2XsUP4l
 TYVs+KGTEBtypF3xWzm2CXYJF85cHWdnr/rmt1VweNLikgiN87ogc3qRbNC1XWYBUFDgkEFBQ3+
 WRQaa0/iFoNd+KLXbR1Wm+CFEJ2b15uHSrDIoJpkwxYMXm7mQxVvZzP//H5YVd71e04/SsN5kwT
 bl1VKbVAidfubmIwyBKnb6yt2t3VLamwqIl96bTKpwKtKjRtC7FX3w4xOBifPcu0QFF1ZPlde0D
 Ir91XrDQVGaGpawqZ2dUyM07vcAuGs92WdmZqsm2Z/bqRmU6teK1A7bn60IofkDpcy/aFBCgQ9Y
 GTCI1xqI+U/XFSEjIdmUuw1gJeyrDGL3EgICHcL0pLai3XOi30ywjkX5Cr7dvRxZIiVOzNAEYN0
 k0LdKTcV3GdrArPc0SQtn6+VavqjOhpa6KHRjTX6Udy1L3LKeP62F/eaQ/uJ7kvnGzyimCKMUAw
 DLKTmYha3n3IkpERaiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200091
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[25];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-51112-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.intel.com,intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,1a:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BA3156769
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/17/26 5:06 AM, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

[...]

> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&cam_front_ldo>;
> +		dvdd-supply = <&cam_front_ldo>;
> +		dovdd-supply = <&cam_vio_ldo>;
> +
> +		pinctrl-0 = <&cam_mclk2_default>;

Ideally the reset GPIO could have its config defined too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


