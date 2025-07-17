Return-Path: <linux-media+bounces-38012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1476B08D42
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 742F04E5857
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753DE28C013;
	Thu, 17 Jul 2025 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTt8Rb9z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F039230981
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756243; cv=none; b=Jfo+/25HCrOxq+OHlA/FPr5h21LGEemxykCvbVJAa//1hj1mq3WZmeXW+dfV2JT9MsnZL5RatrVB7h2ThM8UokzOCoBppXBO1SYl5xRnJh3QqF/3cKck0s1xfzzaDmiPcn45JKAFVbQsPG2s2nALESEBoC5xLYkZvAZwTMtXS8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756243; c=relaxed/simple;
	bh=5YAxCO/nMYADZpzMqGP2RXDVPA7L+CQdVDyQ3ZY2adk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDI4fU2QEFmeXidr9LwLjbSPP/hzTgyP6Kv2wD103cE6FzMTwZLtOg+g5E2NZcKbBdpeNO6aYRCiSrFY5mFLKFjbNqjrximCNWF9c33fFdyOYx3SpsGh9jNczAGfmAhh6JKC19/KKykrlnHlAxH6NeT2FCHSNlA+3LpssC/fZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTt8Rb9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCQED5032260
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUDmYSo/2gAHIWN9kLymQe78KUXt7QSmAlIV3oGhIAI=; b=pTt8Rb9zNeXZG6Sy
	KQcI5r471XwizWu6JdYX4qXjjjByUqsIk0MVI0SsidylXCAmEBDlHsPWrcsYxw4L
	M8HaVl6Pf2xA2ydGA3DERMU0YIiGJIJoIZWzjt7S02eBGiDgrsw8oPK+TXj00ob9
	RIStiH7ihlkw6QFTkIEclVz8F/XNG1WNoeRQlBwhHoEVV14rr6o98IeavR+Ojtv8
	Dh57Q592knzLyxLN1ARN+/0oFBGKkUSCj1QJU/lfW7PrsEbBjjxy2p0WGJwURnu3
	Yy00pdTjoW+ukPoPjXX/MH/ThzA2LM2LbsDENMvI0PseAQAn+CH/SW9GbBHn4Qol
	TEUjYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug387s7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:44:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2ced79f97so17467085a.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756240; x=1753361040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUDmYSo/2gAHIWN9kLymQe78KUXt7QSmAlIV3oGhIAI=;
        b=u6xK5B2OToYP+lonCYzIBbqWYO+Pza6k7yWkxHBNVf1tNN0KPR36Modpwca1FYWm9i
         Cil2/cf/5nJnGBeMsoIhhOdJFi7G11HRgauycvcEGoxEVoS3ClsUp+XdAyfveRENMIK2
         gtkusKpAPDMTV5Jipsd7758DbMH8QXJK7ULFtzUjlUWuk0qzEYoDZIKMm04qC/RmIcoG
         vsZKnnjnkOjLbBXRjvVqwxnNiFX+nuPbSFa9zckg0S31YNBkKBLqscz61s5AcG76obcE
         cNRe5IVtgRBR0t2Irlt73TuQgMcClFfr0/a3myUvuT+P8qeDZNIo1q7xqsW3tEcZtJjO
         ScEg==
X-Forwarded-Encrypted: i=1; AJvYcCXEzgHWY/MfLCfLRjs5Yf93za91YI4TcdgJe+1ML9sZtMYPOfuBFzu/dwn2LPsJj3Q3qDW4p1dB/+ZzjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylprcpdEMMF8y6Ubwb41jrZR+rQDAGkX8h+IZgzRy5gwr8z6Ir
	DS0PwXaWdXVJFPz2BKLbbjAn8C5VAEkGgi/OCjlRUf17zD7MrB5Bqbsgrtjzu+NHN677S0CuoH/
	N5zEqRS75fy8pt/TOddih5YJ00f129qf3KvXPtqokUxk5WcJn+202w3aw8WJLOSLSjg==
X-Gm-Gg: ASbGnctcccqAROyfXudzJmXOmyig3qb5ZqqahHH0O1WhD8ibUB16MPEEcJTUt/vei7B
	dzIBertUx+u/wMOpQtNQuUIRYqQhVCosS7Fsrf4cvyykQnudHdWHNhrZ9x+VbQ7d0/T2DsBI2z/
	gzg3djeR7mo6PLSGBsIhnw72TF3+L/cRKBAUcM5scwgs9nktItqQD3dp1z/YqawXU628YjC4ooL
	uSSU5IZYYpvoBUWeV7UyyROvaj/5lD77PNKijONkf8F794lvm5y0+ss6wZPKgmAM3vwjsHeO5sn
	XyoPYgPqJtC+VJ5nfBzKfwqz2CRVCfLkROb1KIed4EQc+eX2QjoNv4wdK/pl2LBAmtAC7V4aQ/Z
	KbGsK1W8/b9gFHqslNF5C
X-Received: by 2002:a05:620a:6292:b0:7e1:a4c7:a819 with SMTP id af79cd13be357-7e342b3eda3mr314827485a.11.1752756240234;
        Thu, 17 Jul 2025 05:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIsNr1DByBgmz9jCsvLegVhBR9mMg9jsyGYW5hHWVKe01fezGk+016s93Nf4grEADzp6dblQ==
X-Received: by 2002:a05:620a:6292:b0:7e1:a4c7:a819 with SMTP id af79cd13be357-7e342b3eda3mr314825985a.11.1752756239751;
        Thu, 17 Jul 2025 05:43:59 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d8d54112sm9140441a12.1.2025.07.17.05.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:43:59 -0700 (PDT)
Message-ID: <449ac3c3-1f6a-4e69-899d-c4e4577714a4@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 14:43:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add support for TPG common
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMSBTYWx0ZWRfXy2twiMPxedIg
 YNfIaEFQuOk5lP4I2/+TfwPMmjrurwvR9DDJDXuVldRgXNs6W7OED0QKMtr21GZy2qZDGUqdeBy
 VRow6yWcY96I75Hh3HO+ymwBRZTyBgthSzkFNj5kc1wjpF57pK5C43IXvI+s1aXoDg7WScaw9o5
 jBjIUdBefb+RSpcUHmALel5NnACVHfCBRAKlq6mYfyMmC/DUbhk80ORt/cmCteKSdOULuH0pML5
 /CCdr3EJiCspG7LgTHX5N+mgHU+6kEQU/lI/3ynFUewF873kb8MgQylAY9onr2NhNRtcU3h/K+a
 El9cgpU+w+h7qQTmEJRKqprywDeOv3IxU2KtiN2j+QqyO0HpA1XgHJTjeMENAFJ6O9HUMpm8x3/
 0/UoB0U7wYljzdE9f8GHFCdbwnIlqYVHJro6aNgYES0F1PNuDshONU8NksxvsUEbB+WQT8sa
X-Proofpoint-GUID: Ll0RjKGcGQzVnwK9ywuOvtOh821fcN9e
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6878f011 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=5dRrolKJAAAA:8 a=COk6AnOGAAAA:8
 a=DwyGLw2fmc7FY8CNMSkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=y3-2bcJ53AEkEa81XYCb:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ll0RjKGcGQzVnwK9ywuOvtOh821fcN9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170111

On 7/17/25 5:20 AM, Wenmeng Liu wrote:
> Add support for TPG common, unlike CSID TPG, this TPG can
> be seen as a combination of CSIPHY and sensor.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
> @@ -0,0 +1,737 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-tpg.c

I think the filename is redundant, especially since it may change in
the future

[...]

> +const struct tpg_format_info *tpg_get_fmt_entry(const struct tpg_format_info *formats,
> +						unsigned int nformats,
> +						u32 code)
> +{
> +	unsigned int i;

https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/

> +
> +	for (i = 0; i < nformats; i++)
> +		if (code == formats[i].code)
> +			return &formats[i];
> +
> +	WARN(1, "Unknown format\n");
> +
> +	return &formats[0];

Err.. that doesn't seem right, neither WARN (which usually signifies
some sort of a critical condition or hw failure), nor returning a format
different to the one the user requested

We should probably return some kind of -EOPNOTSUPP

> +}
> +
> +/*
> + * tpg_set_clock_rates - Calculate and set clock rates on tpg module
> + * @tpg: tpg device
> + */
> +static int tpg_set_clock_rates(struct tpg_device *tpg)
> +{
> +	struct device *dev = tpg->camss->dev;
> +	int i, j;
> +	int ret;
> +
> +	for (i = 0; i < tpg->nclocks; i++) {
> +		struct camss_clock *clock = &tpg->clock[i];
> +		u64 min_rate = 0;
> +		long round_rate;
> +
> +		camss_add_clock_margin(&min_rate);
> +
> +		for (j = 0; j < clock->nfreqs; j++)
> +			if (min_rate < clock->freq[j])
> +				break;
> +
> +		if (j == clock->nfreqs) {
> +			dev_err(dev,
> +				"clock is too high for TPG\n");

I really insist you don't have to break this line

It would probably be useful to print the rates (the one that's too
high and the maximum)

> +			return -EINVAL;
> +		}
> +
> +		/* if clock is not available */
> +		/* set highest possible tpg clock rate */
> +		if (min_rate == 0)
> +			j = clock->nfreqs - 1;

Well, you never assign anything nonzero to min_rate..

[...]

> +static void tpg_try_format(struct tpg_device *tpg,
> +			   struct v4l2_subdev_state *sd_state,
> +			   unsigned int pad,
> +			   struct v4l2_mbus_framefmt *fmt,
> +			   enum v4l2_subdev_format_whence which)
> +{
> +	unsigned int i;
> +
> +	switch (pad) {
> +	case MSM_TPG_PAD_SINK:
> +		/* Test generator is enabled, set format on source */
> +		/* pad to allow test generator usage */

This is a very strange way to write multiline comments

[...]

> +	/* Memory */
> +	tpg->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
> +	if (IS_ERR(tpg->base))
> +		return PTR_ERR(tpg->base);
> +
> +	/* Interrupt */
> +	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
> +	if (ret < 0)
> +		return ret;

The comments are unnecessary

Konrad

