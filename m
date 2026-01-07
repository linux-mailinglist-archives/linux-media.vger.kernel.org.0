Return-Path: <linux-media+bounces-50140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73932CFE0C6
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 14:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D8143067900
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 13:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5CC32D0D6;
	Wed,  7 Jan 2026 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCc7Z91m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV7xsmcA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6032A3FE
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793524; cv=none; b=jbILhYPk949J3hfGfGAL6vE9XgRDLV0h0Aqx7VTIWTbuKxkRH9rU6JExVfUNMC7rOs3PQPygu2YUQMa4GEQ6Yh2nisW5P3zXgKsAiyJB1DTiB6yFsoHN2CKde8FoYbnGLeP8PKo5rHCN8akJ40+3Sv5QZXvYOWQfKzlfmHw08yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793524; c=relaxed/simple;
	bh=aGCwiMjQucIVEWY0xQeLko/RXdpi58+4bzprc6n0/A8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nhdEXHFrQzXOec+YxcsF9qp1HmQs9lxfY4aNJH8OdI+INUNAhEKgD3sngV4j7MtE1S9sKCzbycpFiW4v1JX5UsDIMIHi8NA8U4X5OWVbvUPbQqKlGT0gvENnXlPh76/hN92LPe2lM2GG8VKJloZFEMif0/q9ENkx0s6biu9el+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCc7Z91m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV7xsmcA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60791ZFx1979627
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 13:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	reb7P+Z4F9Rso1KjoO5FFqyUpm285MI8JPuG1ZEw77Y=; b=jCc7Z91mv6uUGycu
	yyi6xxGoeqVIOjqiJooPhO25kxGXMufeqjiWYKU4uUgOJM870+bEbEB4gGu4oUkM
	s9cRqg9HjHYtrwBuwU0BkeCUeao60RUSG9c55XxeT6QEIqKswDcXXpPKlhjTZsvw
	At42zgByjTwllwd5LCa7lcHWKSyh94ysBIZc6xO2F9wavuEg5bqRiOA+BUWCkjzH
	A1+IoJ8O2epuzNbXkO6HvSRLs8me6kH4XOPyDzp9ahDsKccGYGyC8ATc8yZhxOSF
	qVnwFBn0rATjbBENesTBJsDybHDXb6vpasw8qvPYn8GM1tXkwxRIQ/23V1TnZ434
	CsTPzw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavj840-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 13:45:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ffb4222a4eso23948971cf.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 05:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767793521; x=1768398321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=reb7P+Z4F9Rso1KjoO5FFqyUpm285MI8JPuG1ZEw77Y=;
        b=AV7xsmcAQWmLospI2pkaCln12T39pPsnfNDhbnyD4ylpzs43Aee6gLAjLaylZWC+JZ
         qIo/XSrjVjjOKyggP3LSxBLNr9reZBVTwmvlVYaDoZlO7kF0/FQG+PcvND/yWZlGMQUM
         LZBkha4Un8joKIplx1duhxvpEV14jBgFRr+spm1Uee/ZJ0ufa934GT34w7gu7la9ZNJS
         1OtACN8ATFXMsbPfiGXB4Q9qy+nq+SKY8M5g20XkqB/Ifd35tvyXZo7T12PmrJpsHsPw
         Em1jYLWLKtIxz4ogBI/BF31grzxzdMqmWvIlwMCwzhTAZ6I7vWlckXsyWTAIPGD+bH0B
         wceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793521; x=1768398321;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=reb7P+Z4F9Rso1KjoO5FFqyUpm285MI8JPuG1ZEw77Y=;
        b=rSF95GVgdbrEjCnjRquSx/FyyUyrFHZCXj0+vOCkvTiawvx8zgP3B4RS9tsFcmiJL2
         3QCFCs/RQeNW9XEbnK1IVzSM8Bk/3+kU40fUpwSiPAD6snQo18CjhYckc16y/tcvBycn
         B8CzZFN7ITam1PAYerVYQb8dZeX2HS4rk3PzsCTzcmlnPqOSPTQ3DAdZ/8Hl70aSzt74
         I4X+mCSzUeYL755kGX95cRzolrphWMFguQxXrtxfKO2AU1R2ozIW4F3zZ1Ng8C/LUD28
         mNerbkmwHe7PXbybZq/lJL5BNff+/ikfOdRAkEJgyzG2NBXXPfjmRrcnVqmSYb58LnTA
         ra4A==
X-Forwarded-Encrypted: i=1; AJvYcCUqLA30dMbktOQwV/MoSolSOA6zl/XFeZqeI8XR7YCzyZ0sZYSbhInXvJz5bOoOJt9OhsC86MeS8js9qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3QL732i68XaJApO0Xz7a+ukTNHa6zDEVt4iLyN9ditd98Sg/2
	8ECj+eR+zEZtoBRzYTKe9leqjH2OFr/aOjD8zSuXoddPFXfVqTvYi2UblxKy345VYO9s/2mYy/U
	3kPltTHNNL+sNxZTJBnlodERprqI5jbl0Kxrrt+VpGXeL0PV/xq8l5DXSdekVivO3dg==
X-Gm-Gg: AY/fxX73c/bC3DL6kmQSHuZit6RD0B9mNf4fRDc0vGc2Kt4Pg3u2bNu2W5t7+xX1MFt
	eknNyNibdIl3qhOwQvIo/jzAxQ2VDOya+w5AFXEpPRKDVoocvuz68aGI2e2s9Ac8tGuYj+9iNU4
	njEgrtlD4RcCIQa5Av22/Qx7Ci9I2GURT0Z5o5s7V1mi+2W9iM2cG5JcIjTHs3wr0WvdU565ukA
	vms5oJJ0PpBpUZxX7njb0G+nQW0Y9vRkKCIUDaB0rQQg8QLaBrv3OAvkJFo5DF6oK+r+9woQV5r
	lwp1WRuUkOEe2GsTIPSJ5GcB6FQ0+PtHiVBrubi6CpmdxncbGHsIV+4jLtYPEA91dFScUUgEsfq
	8u5AQLOwxqUhFecjqO/bllzPeZ8yNDD24AvN9w0/OUGynmgNqvTCskOOwaA2LllnDRU1V9lUeBx
	FoOyJ4ojt79aMRCvsnnmUTeCDg05rQzjGSXU2wzmTuAI/VRuHHLLAUiXPO2f+vQrSCoZwMcldaE
	P3z
X-Received: by 2002:ac8:5789:0:b0:4ef:c5cf:ec0e with SMTP id d75a77b69052e-4ffb4a2e169mr31483151cf.55.1767793520669;
        Wed, 07 Jan 2026 05:45:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGMKq0mnAStTW1LnpwiTNhIj2O2iuqd6K21QnslKXLwdTmgSebkevhEPXoAvVXGMXqS4aslg==
X-Received: by 2002:ac8:5789:0:b0:4ef:c5cf:ec0e with SMTP id d75a77b69052e-4ffb4a2e169mr31482481cf.55.1767793519817;
        Wed, 07 Jan 2026 05:45:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm524113466b.49.2026.01.07.05.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:45:19 -0800 (PST)
Message-ID: <082db370-e6cb-45fd-aaf9-bcd9f80dc242@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 14:45:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/5] media: ov02c10: Adjust x-win/y-win when changing
 flipping to preserve bayer-pattern
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
        stable@vger.kernel.org
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-3-johannes.goede@oss.qualcomm.com>
 <aV5IH7PIFnySHhYC@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aV5IH7PIFnySHhYC@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMyBTYWx0ZWRfX8XnJQt6onMYA
 U2LMMEHZ1PAFGeiyxRmnJTF/vJI5Vizo+8LMlnCKlJoRmYn+f6tddNaC7I3z2cWIb0dPx0KGBpi
 m5frwntCEETfT/gdFxNSOfCMi9v/vHIOv8L6cEDn09w2+tVP/LqVdgYHSZiNH50H1EkXoJOr5LZ
 63XIgsAtG8lJPgj2q8xc8BJpHgaJywV3Ma7ou/rC9tHYZyiiv+TlNH/TnvZf1WWWz2iXe8grRH+
 V5uqt7G6Kd4g4rXL+eh0Cd7/cZHc9f0FneDKcUS3rA2W7WmC6dwBvvnzmSTKf8Fs6JtmPrKWxA5
 LT549zlHm5zFVCRgT022l5z/NEov0l7N+D8jeC4XcL/SZ2iv49Bb+eM7MV8n2bdzhuacxIpATjy
 AXNAaWvTQzHeFr86XJ9+dZMJ5nGLjnfeGHsVqacLzM3e+soWIHYCAhCfKgAXyFmyaIbe8e37LlH
 AkSc7qsp3rGpIMwkw0w==
X-Proofpoint-ORIG-GUID: rdSTEADSJI4OSNicVOLzaBt5DHjlNKtn
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e6371 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0plRyFmWAAAA:8 a=ZF_BEzhm7KkGSk9pD-0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=4tO_KGIOfzmgBqjB6OKc:22
X-Proofpoint-GUID: rdSTEADSJI4OSNicVOLzaBt5DHjlNKtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070103

Hi Sakari,

On 7-Jan-26 12:48, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Dec 10, 2025 at 12:24:33PM +0100, Hans de Goede wrote:
>> The ov02c10 is capable of having its (crop) window shifted around with 1
>> pixel precision while streaming.
>>
>> This allows changing the x/y window coordinates when changing flipping to
>> preserve the bayer-pattern.
> 
> Ideally we'd use the crop selection to configure this, but given these
> sensors (and drivers) are generally what they are, I guess this is probably
> a reasonable way to go.

Even in sensor drivers where we allow setting the crop selection
to get arbritrary modes, we always round the coordinates to a multiple
of 2, to avoid changing the bayer-pattern seen by userspace when
userspace changes the crop. See e.g. ov2680_set_selection().

And then when doing flipping we might add 1 to either the x and/or y
coordinate to the userspace provided crop x, y before sending it to
the sensor to make flipping not change the bayer order, see e.g.
ov01a10_set_hflip() after the v2 series you've here:

https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/ov01a10

which does (simplified):

        offset = crop->left;
        if (hflip)
                offset++;

        cci_write(ov01a10->regmap, OV01A10_REG_X_WIN, offset, &ret);

IOW we are trying to not make userspace be able to affect the bayer-pattern
through setting the crop-selection and/or flip.

So I'm not sure what you mean with "Ideally we'd use the crop selection"
because we are actively trying to avoid to have the crop-selection change
the bayer order ?

Generally speaking I think we should avoid any settings change the bayer-order
whenever possible.

Regards,

Hans


here?





