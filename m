Return-Path: <linux-media+bounces-49644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D483ACE6E20
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 14:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F3E33016186
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 13:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C043168E8;
	Mon, 29 Dec 2025 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iF9dp4Oc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCkFvyy4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F13164AB
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014795; cv=none; b=s87sdhpckJNAjUdzIH4vVNeEqjjf9XDb5JPxy26slyMMXEZd/prs6GDxnjv5VPXRVgfUUOejtCOSvpQgExnA2hht4JE/3W6vmeFN4Lg+VMwMpPUoQp1DrSO6BE5vw29OeFfgRJwRyr/RiJU11Qpp/uEyYTDcodD34T6ZQPVZuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014795; c=relaxed/simple;
	bh=tu9pbE692wxXiosE+tAqK1si4bIsObC4y9I3BfIvOAw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QksMGXNc4hjrAku3AUzYQWedXzOpTXl6E9y6tMqnI8fD/lKQ+Cjx1Qp4qCSl7vWQlo46f9ul7KHJc50/8de/U4hkpBpWwW33wd7aNTzb8WlgXv4t4413mqJY0cFxYbIMcK7ZgB6QeFOXciFNnpe0rHduaoDMMEMP0krfzWyiRCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iF9dp4Oc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCkFvyy4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA6mIc052941
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjVb/8rbV2EMth5U/d7jNe4gBOXFEG56654Hv01mIgA=; b=iF9dp4OcJdQaKEOT
	n1Qluldgwa7Jq7GNsaLsP6ok+iuS7wv22Hb4r0OwkPd3EODrE8wyG3pCgR2vFNaT
	t2Mg1nLkeqFSJ+Y8Oq6eXEnlYsrY4+PFd6nxZkrLGh+xUGmLQXTiaRpf+84cacA7
	NN3C/SMyXK5fDPaJt1jtAMbNUjV1EJSr8rCth1aIOf9dFJnOZ2HgyT25No1AOo8G
	wdVIbygzHiR+aeZg9wZrBNlfg8mDYHU4w9n2mhlJJwbXkM+QM/K6cFyA5L8VQqyi
	X25A5A8SEdKr7Y8eRvJe/kDWtMpoR9zeAXjAh3jTf4mdy5fmWJG+v7K1qN80uUbm
	E+Ajkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wvdun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:26:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4a5dba954so233533071cf.0
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 05:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767014792; x=1767619592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YjVb/8rbV2EMth5U/d7jNe4gBOXFEG56654Hv01mIgA=;
        b=jCkFvyy4d8nwmNw+hNoYPmFi7ZutbitOJWPy/5wfjRHouYNe+Wd2FeL6DdYbrZTnSm
         3LjJ2lx4hJx1vDlxkN7p05rqY6kIaDCFXBnNr0gjME51nPXirYlv/QsexCAIkX2lQPAe
         YEagwOXo0K+ZEWM8staPgHp4NzeD+ryEiZkzyMvCI0igxEJRkwvYSaTvaPs8lY+UYav9
         s1hGnjCDLZWdY1i+CzqfTZ3keHb8JNzCD1hAMH+j/5UKLTyg1PhUmvGLGC9RcMa+6w0D
         vLENZQ9vJ8ekWVhinA7mNLg0B7L6Nm2KPenpE4biEL4EEZJuif6C4iAtOJVZxalW0rHP
         IZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767014792; x=1767619592;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjVb/8rbV2EMth5U/d7jNe4gBOXFEG56654Hv01mIgA=;
        b=PiI6DBxESNNuLf16YDi/UHCe1LK6eaH4tR8AsRqm8pD4fbH2I5DV24Dxl+2lpsSjER
         aDxyKsoyQ4bbGMkQnSK72iqUX2RLRs8KsQdhJ4GTljmYWLX8wKYFROeM5iDLQ8ijIYg7
         3y0WA8mZ0+cPRaFVC3LXKOoyeWukfTQi0VYWN5yxQn7ewq1GoP0wn/G18zAIJ7tn58NY
         /EZ5ZObeLz+OciIKDRw9F7TEe+B/D5iab5OthfVRG6m+XX5x+VqPwysqZ7Y+j5cxWL5g
         SUCdMUaTUSQqDNdSxySsmBhxc6CpqLTrQgEn5o14wiOCpis0jYTx1LjLx7QJwVCk8L6b
         9qtg==
X-Gm-Message-State: AOJu0YwnTo5a1B3iejHIxE0e55ytmybHO6lE/hnP5pcklqjjX3nsGOz1
	4sFrlYk3Y5Joray6UQfk3GSkwsJAuFyxhghp6YxskiMjzgMqbNm2VVkajyWvvDtkm/1VuBsjJ33
	0NzSIiuk0T/N69pVrwlbZ696xvFdWSspZCAKH67/17+shs9fyoxAM1almrDT2w75hSA==
X-Gm-Gg: AY/fxX5uviVBTe4SaRR0qm25UEypiUUsy6R2ogOlyYzsv4mTwVRDNP31a/Dfck4mnJ1
	RknE6QijazTvVh4/shjV/dYIuJlZuULEkanjW532ZB6vvcojGW3o+Y3FLu5OFMUFaBbGxpBnBsZ
	zcPdPNzVw8nUHJYhHqUWvQdQvgPWbw1JPo0fEuFbJvHFNSNFu9M8t9hor+N/qc+u7t2kLx2W/Hf
	FpHiJCD4Bk4iROU5wgC/z2Jsw0mk28wpMi7zFM3fDZwWNumH1CEPPFK1mFwQoUuyFdYQpdtkr3Q
	VaLrnbZGHWQuCpUctrnFbF7qJx/xc3UCF1c65uBtAE6uu8m28j1cDje69PfEFCpyUTUWFY+5mZK
	h5ZvqR/umISJjCc4ENb6cPvq7Psb3JTJ2x3LxhWNH1KTVo9eXrgld0CMxDexngCEF1iTq7M4WzJ
	VfP9f1pXKfd/hiifOg6vLwTMYyY+e2ztTfYxhGaAoKoZgl7HnA0tIjlXAgxly3IZX1yBdYNhVsH
	MlW
X-Received: by 2002:a05:622a:1307:b0:4e8:a413:bb3a with SMTP id d75a77b69052e-4f4abd799fdmr481009861cf.46.1767014792431;
        Mon, 29 Dec 2025 05:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGPYrW7LKNepzxbF9g864ygyvqGatn0G4vZhPzLn2fxtBE60dTlRKJNjMFTzdTDhMDfxbG4w==
X-Received: by 2002:a05:622a:1307:b0:4e8:a413:bb3a with SMTP id d75a77b69052e-4f4abd799fdmr481009391cf.46.1767014791895;
        Mon, 29 Dec 2025 05:26:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f519c0sm3306895666b.71.2025.12.29.05.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:26:30 -0800 (PST)
Message-ID: <33e3e806-935f-4867-9a94-fa914d17a3ab@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:26:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register access
 helpers
To: Xiaolei Wang <xiaolei.wang@windriver.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-2-xiaolei.wang@windriver.com>
Content-Language: en-US, nl
In-Reply-To: <20251229023018.2933405-2-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyNSBTYWx0ZWRfX1Eeo78FvdISG
 ksZZyjxOl9qa8o1IOTBqVcIon4YVLK+kXLXP/DcOvk1U16VP0n+xxZyWATpbG32T8wKfcLIWl/8
 0D14ViHnViEYUdScgTjBKRgCZNyymsBfpHui+ZDQpkZYTuXJCJBblnxNRBtJj30tze/vYEqo1e0
 RNcwDoNmgjHNg9fwGZhg9P8RSyCFKoUIKRk0iLWJm/aOsNkB0iRuDcTWZDfNPhZGfP7Z+Wt4Rh/
 zBSkwrprj9x4bYcVVDnHhcHE/2ZXOvgHCW5vz/ZdcZiGyMXeTjNabdvZKBqkRoo/RBgjuUZ35+V
 gvus91i2kTUh5OYgcK7igQ7VaRfoWoQStGH7xpAppCcttVG28Tq6b1VnvNr+HczPKr2a5pE9f55
 XvqesZw65mTGXPgThzvDxeQjFaH0rnZ8a/ED/2sgtU2TXmj4Il5kJB9seIjoFi71TLINKbjaFhT
 EJYs90lbDbYXOpgNqtg==
X-Proofpoint-ORIG-GUID: eAhXzyky23r4Wqv9A2vvS5yZ-uQtK0D4
X-Proofpoint-GUID: eAhXzyky23r4Wqv9A2vvS5yZ-uQtK0D4
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69528189 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Wueqb6rkilQwuqZitWQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290125

Hi,

On 29-Dec-25 03:30, Xiaolei Wang wrote:
> Use the new common CCI register access helpers to replace the private
> register access helpers in the ov5647 driver. This simplifies the driver
> by reducing the amount of code.

Thank you for your patch, it is great to see more drivers
being converted to the CCI register access helpers.

> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---

...

> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e193fef4fced..fd69f1616794 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c

...

> @@ -130,377 +122,377 @@ static const u8 ov5647_test_pattern_val[] = {
>  	0x81,	/* Random Data */
>  };
>  
> -static const struct regval_list sensor_oe_disable_regs[] = {
> -	{0x3000, 0x00},
> -	{0x3001, 0x00},
> -	{0x3002, 0x00},
> +static const struct cci_reg_sequence sensor_oe_disable_regs[] = {
> +	{ CCI_REG8(0x3000), 0x00 },
> +	{ CCI_REG8(0x3001), 0x00 },
> +	{ CCI_REG8(0x3002), 0x00 },
>  };
>  
> -static const struct regval_list sensor_oe_enable_regs[] = {
> -	{0x3000, 0x0f},
> -	{0x3001, 0xff},
> -	{0x3002, 0xe4},
> +static const struct cci_reg_sequence sensor_oe_enable_regs[] = {
> +	{ CCI_REG8(0x3000), 0x0f },
> +	{ CCI_REG8(0x3001), 0xff },
> +	{ CCI_REG8(0x3002), 0xe4 },
>  };

For these 2, but also for the 2 much longer arrays with
address, value pairs which you are replacing, you are
replacing all the register addresses with CCI_REG8(0x3000).

Even though some of these are like 16 bit or even 24bit
registers, this in itself is not a problem.

But if you are replacing them 1:1 like this anyway then
IMHO it is better to just:

- Directly use struct reg_sequence instead of struct cci_reg_sequence
- Call regmap_multi_reg_write() instead of cci_multi_reg_write()

then you can keep all the initializer values for
the arrays the same (no need to add CCI_REG8() around
the addresses). This is also how this was done in other
drivers when they were converted to the CCI helpers.

This greatly reduces the size of the diff and makes it
much easier to review the patch.

Regards,

Hans



