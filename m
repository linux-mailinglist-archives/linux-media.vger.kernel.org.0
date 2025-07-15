Return-Path: <linux-media+bounces-37765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A770CB0576C
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 12:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BADDA561453
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6439B2D6406;
	Tue, 15 Jul 2025 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMqEb0k9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF852D5423
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573867; cv=none; b=ncF12lvzyofAvvA6Z/qQn3lGQguae1bRVf9E+Eq7ta6eVjJsn3tII7TGf34eZGxQ7k4mY/BbMZejZD/jOpy54n02kuY6onj1q3YZBCgJnmXb4z4a2TbHeuLP+po8lUDhkdAB+o7n/tHKXZ7uUiDyrST7dSTGM6UeXwbfxv//kLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573867; c=relaxed/simple;
	bh=BNgJdx2kgLGA+3XaVIpYoIeQu4ysU05k9jPfvfGKAYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUSks2tmJMz+zxC0aniKRCFJcslAS78l5jO3+zgH6UyIfAlKGARsxxmx3V6k9MUXEkelLoC6841fR6zNufN+5m4zxhcGLoybunZQRs/+AjiCHKtbXbO/CS63GclD97EdsmK2P3asdhMQB99pxQKpIIsijRxvDFHoUXcX3+KkK7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMqEb0k9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F65q7o012586
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 10:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHYSJD27uvDlRUQTR51LeWjSN/YPjznDBPWdLD1taHo=; b=fMqEb0k9eOsvPtRq
	pgvyCg8P1RYy3WiwKPOu3hnglFNcOIKalBAIKpJFwvy9Edf5SD16CyGWB1j6KNK3
	wI1pFEitRq2zsqcLKcHn8KaJaR9C62cbR0hxyO0Icz9tF+UM6fbCF7MW1zPCv/y1
	IaBKsqfrFvrJ6l+lJ/dPNSoJxsGvmBu4MEf1tzgUUCn0xnaVbwepLQQjWna939WK
	2PsSQ6hzVP9RvXzzmaCfhvLtE7f6Lcvm0FDy7vtkXDO4Y+7ae28ubPcbtpTJ6r2r
	SFMoUVunvGXifOs/tf3RLhrNQe5V2z5H+PcRG4YUJD3CQQGEC3cKWX6LmwAeg+Uo
	eaCPgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyjj47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 10:04:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2b5396898so4330685a.0
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 03:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573864; x=1753178664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHYSJD27uvDlRUQTR51LeWjSN/YPjznDBPWdLD1taHo=;
        b=BJo1dk8gP8q+bvj4HnZBJlk+gGNPfb6bpehAaKNyucQ/GCr9HOq1d0HQ7FFVWfUwBl
         zbPJI6UUWkxXQxfUP/6hGp5CBCbgGmdqJ1mx6zYE0vhNiz0MFaDUwKn17bZPOgzJWPQJ
         qsIGNm7qJyc4t9uCCwRuQ2F69iICb90B4N/H4p6fgShFxxiNhRLIqpiO6vYamjtNL0lo
         UGvhDIt9LVfY3VRng2r+Jk0lsOC5qxApdkWA+0WdvgDJpMy43CEjxU3s4SGnK2SX4JME
         gEe+kCKj52XC0/ra/rN9IbTJvYY3K70SV5UMwHRWHVlNiNWlWN362amkGWuNESASBCu3
         ebmg==
X-Forwarded-Encrypted: i=1; AJvYcCVrnKvgzp0a/FL+TqyZ7GV30GUGLW4dbMxBSO2D623lSyINO1RNw2QSdsmggBpelK7/2DA/kSAP15GuCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEwPePwAz6zNiHlbcckSb87w1IBJJAKdPoqA1Vlke7Md8YN1e
	lgIzIpFSB6EbrPiW9AtAw2/QiI5niMm4CPecBI9bk0huTjp2k+6xc92qWYt3FWeecKimkQtTBUC
	anY9Quk7zgtm0X1/86YtS/Kc/3YQ9bsoqBskWe2V97CVfZGzJWFGcZ4VWQ7ntoFewig==
X-Gm-Gg: ASbGncvP3KePZ20GXYrGXG90kYsi+bWk0ctdXzjHK15S9kvnb9wsxaKTu/SYu8i2epK
	jZGn1FnOsQm3WsQA7EZ/wv8qMlvlFyW6AjiouIwU69uIsmAiva+tO+cpwEr2lNc8l6sqx6xCvWI
	u3LYuxJEWxswfdWr8zJ+o77gth/tSnlsjiFDbrYyqx+sgiBG2QIe5L7ydONM6zHYQV3jJZewqIG
	8uf3+OyQRvcWQnesfluhrev2sqN97/b1Z2VcztGSY2HL+6fIYjnaxoAfGwLVHYVGJDNi6NDX/N+
	clhpcg1JvdmEe2Sd4l6nmt1ZWC89SOUIbtllGeKZRsdJ6+y4YhuRPeZNL8+uMhEkPtuoYytIH4+
	XybAV8BarhFNeOH3jWCWx
X-Received: by 2002:a05:620a:6405:b0:7e3:3001:b055 with SMTP id af79cd13be357-7e33c64d5d6mr50121885a.0.1752573863945;
        Tue, 15 Jul 2025 03:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUyozA445ADYpujI0kmNPEbeGrDOg9nc9SAGKkwFmSlzeir/EjIgg27sen+sL7L37zz326xg==
X-Received: by 2002:a05:620a:6405:b0:7e3:3001:b055 with SMTP id af79cd13be357-7e33c64d5d6mr50121285a.0.1752573863480;
        Tue, 15 Jul 2025 03:04:23 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8313036sm956336766b.180.2025.07.15.03.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:04:22 -0700 (PDT)
Message-ID: <babdaa54-8804-4f20-9847-9105cd485538@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 12:04:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: i2c: imx355: Support devicetree and power
 management
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
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
 <20250714210227.714841-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714210227.714841-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F6_CNKR2Pa3qGO9l99pas3s2aoKEuOfH
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687627a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8
 a=UF4_Mx3OVNFJwZjtfFEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5MSBTYWx0ZWRfX9Uy/VXqL8noR
 tbj0hFqQZndUIDt5pecIFzY7/3pS8hcRynkhUkTNTAjQ4EfwNOjDUSBSurOXG71rGv5K9yQULyj
 SH8vXT6QsgEmDnHdl26ddK6vL1a81tMX5ELoVHwCoD8eq/+Szrkax5TBe0r4DrYf2AXmQ+EZO8U
 yrgwTUQ+eGej6gXHg1z5nrqeGwL8YAFr/Lh4KpCKqSHpN6P+I08YfU1GFQpWnaYqD8XFBSElB/A
 EjuAoWFrGRuHexczttddH5yrfN/LpbcHk/96p4SqsKq/nY0+xhQjBau/w0I2yD3EcALZ4o22mob
 tN6IDJvGDAUodDREYQTnEo9IlnGUx36kPWFfzN6w3bq4+togDrhWcA3nbQp7niIHliWmcWO4nZw
 YdoNAGjT78D7aeWSjb8BSCacipuNjOC3egDYAAqgUyQVgLz3p1MhfYEpdQudCMB3bPN37TyS
X-Proofpoint-GUID: F6_CNKR2Pa3qGO9l99pas3s2aoKEuOfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150091

On 7/14/25 11:02 PM, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +static int imx355_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +
> +	clk_disable_unprepare(imx355->mclk);
> +
> +	if (imx355->reset_gpio)
> +		gpiod_set_value_cansleep(imx355->reset_gpio, 0);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);

FWIW power_off is normally a mirror image of power_on (so one would expect
thissequence to be reset_gpio->regulator->clk)

[...]

> +static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev, struct imx355 *imx355)
>  {
>  	struct imx355_hwcfg *cfg;
>  	struct v4l2_fwnode_endpoint bus_cfg = {
> @@ -1648,11 +1715,15 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>  	if (!cfg)
>  		goto out_err;
>  
> -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &cfg->ext_clk);
> -	if (ret) {
> -		dev_err(dev, "can't get clock frequency");
> -		goto out_err;
> +	if (imx355->mclk) {
> +		cfg->ext_clk = clk_get_rate(imx355->mclk);

See:

<20250710174808.5361-1-laurent.pinchart@ideasonboard.com>

Konrad

