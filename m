Return-Path: <linux-media+bounces-48539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA0CB25BF
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 09:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D1863114954
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 08:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1BD301709;
	Wed, 10 Dec 2025 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2pouc3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fL0omkmc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3A3016E0
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765353991; cv=none; b=tyAvU0mA7miTqL0qCM8Hi3LAIHUdKGxPUkhO81PjKkOMzXT9UzWRIby1GbGSfRmkzT0mhv50nylKjKWJOB37L7lAbKUKfLwY5zrHK2tQokPMUd9csBZbh+pQmu2ckVotccfe0ilHsXLtC1c7m1Ml/ROoVN4Jzu38QYdh5nLa6D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765353991; c=relaxed/simple;
	bh=WkCHJEKN/lRbWOtFSg+qSvWEx01haouPnh0FFZXrgSA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lpyTyB24JKl0FZzGVY/1d7gMDL5c97pffuq8Om+FbUO5NWZdDzWR+TOyNqLi0aNJvIlG2xBbVVpft2e3gjpnVQoMb2FrXo4PMeqIrp5TV2gD2X2WD6Xy9ruWOjNH88NXG5PbrgOWHwzQkmEUNxY2E7FKX1YfOmfNWd0gujKDNjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2pouc3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL0omkmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Emxp1955603
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 08:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	meYd8uiFTF65aMjh5x9nGWKgLUmhCH4jZvv29Tb502w=; b=R2pouc3/sy8NI9FK
	n3M/6boZmQKpxg4/eCPrDz8nuPRm+/Y39IpxpJHrpP4id2oPrWLNKG6bLJChgTxU
	t1/1mM1ktVUsZsxWkacIdGeAn6ifm7sGIzGnsel+rT1VI6NtXTVumkk/ZFADiujR
	rglFCfx2t6LsokmqHUF99KRO3qcY0GKMXsREtJbZPZMKdQnxsH6AgsedvRMay8El
	0qRYzNI679APYcoWTn+8df9QZ3aXk8y/fJJnFnz0bFd+aIagAzStSKkEoUYQNOwf
	h72qQ7RAcGh96aHucHl+rcz/SEdicuXKl0PrbHbcTU/EgvBqkQkmZGgMIjugnjWh
	NrFtUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p2y3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 08:06:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb6a94873so113265321cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765353988; x=1765958788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=meYd8uiFTF65aMjh5x9nGWKgLUmhCH4jZvv29Tb502w=;
        b=fL0omkmcvZKHkc519LqUGGV3TM/lUEWbXdQEoHDkSH9NFrJek5NRwUH8LGjS1wZ4WV
         W60Nz203GnSADhOqwCBCHWyByLab3fq+Yn+wzpceD+ebnyfKiTcVACjsRB/8OBFzsa8v
         whepDrTjZJc3JImL6ZYWh2tAi5fvml6WOI/SD786lGthSHFVHbg/GSj79SDZS9MHH4mn
         abDJn9ZY5qCziv99y8cjvS1MgvrpN5ywFnzizQ+qSbei8zXoZI97TtoFtfqUR7YBWT7a
         klE5xxq7/4vVjZCUgtjiqnyiAn+eXcxlW9K1oTx8/YIdSyznm+61QfvBPu/Pt5XqKLwy
         gxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765353988; x=1765958788;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meYd8uiFTF65aMjh5x9nGWKgLUmhCH4jZvv29Tb502w=;
        b=NXIOyv7fqibrE0/QEZxU9aKjw+Fg/9yyXTgZc0gUP2gdiOARZkv84iZqNv7zznPhz7
         XYDuCF7gR/rjElFSfv3XYCx+NW47V7uARrotY/HFTlpuQYpUz17t1VJRKH/9/nx4/SQE
         Mdn9LzVXMws82l5WG4jcy9//WJtXDRlWcUrw94PGlP82g+KA1sP7H4JXRsLUmqSJkIqI
         YL9EzXdR1bNF9hMiu4kDhxiUAKHHGWCGKiOY/w/jvFIRQxLu7z+ueoyp9GeO4z9kgedK
         BAce1YLLiYDuRN5f0U6HEK/bIH/65e+o2RI4IopSK3IjChoFpXhvThZv8N3RI6ggg0w2
         KteA==
X-Forwarded-Encrypted: i=1; AJvYcCUNpxjhzT5NpUhOagplYOFGOLg894nmw9s7KOxRxiwsp5C+PIOdeLtx9B+VmjxBqFMLyz/KgFn3qI3Gsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO05CnSghGp+G5dyHsZzh1T1Tvsb6OS7en7IajZ4L56oVRioBX
	etWRQCMikj1yMiBbZupLaS/pXO7r+MIHS+krtPpjuAsnHyD0unPJw0b5LeOljL+wxfMPs8Hmh+y
	l0eco176ScSYQzS1RN0Zu08lfbr5vm6p+uQLiM03kwp0DEOT2/fyPe2JAq32+HSPvLw==
X-Gm-Gg: ASbGncv2K3j59AQAX20YWeakaOxFehhp3lRm6+YoVavSb5H0gjsi060SDf7stFqs8wy
	gZK5cNI2B19hk+jTel3BTuFkqyG5qMfQZeREOkxRdUagtReHfUlrXTZpm+FtmvYv6ItZELMr5Ye
	xqExb2t/YfhlbsEdTMZle5Yd8eA65c1+lgx+bmBsywRGaeK9qFT4SA/Kls8MmFzoQLqXGPfwo29
	Q9yNg4nKybUjvHk5RSQfgB2rCUr1a33CbrqqHOD3Jx7YjIwthkkXsgdfGj1RpmITo6yVQifMW1Z
	h0sBfZPMDEgtNp5elgNna2pnDaMu+m4opeIC7LA4c2M2iMRs99bbAeXRqyP4knDrKdit67eCg1D
	74IpQMgfudysEDaQQTKm6MlghOOQ4nNvqc5HfmVCv01xlNxoHfLYNeHFs0+oVTkdVArqnD002jj
	rlBOO7N7GdPie0/v10EgpHssqUU1yRa7hCS+DSfrHx8i8p5x94tzp8Bc3J4/+qxRRCjIcO34rVP
	sfQ
X-Received: by 2002:ac8:5e52:0:b0:4ee:1d84:306a with SMTP id d75a77b69052e-4f1b1ae4deamr19106181cf.71.1765353987928;
        Wed, 10 Dec 2025 00:06:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeWJKp4qeHMboOCImGMv8Qw8zqVlMJFhOliw/uSo7FuFLKBrT5DHkGuUYxYvDQNRJyN4fXlw==
X-Received: by 2002:ac8:5e52:0:b0:4ee:1d84:306a with SMTP id d75a77b69052e-4f1b1ae4deamr19105991cf.71.1765353987464;
        Wed, 10 Dec 2025 00:06:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7c73db097bsm234152166b.0.2025.12.10.00.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 00:06:26 -0800 (PST)
Message-ID: <cedd80ea-cac0-4507-92ea-028440078001@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 09:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH regression fixes for 6.19 0/5] media: ov02c10: h/vflip
 fixes
To: Bryan O'Donoghue <bod@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        linux-media@vger.kernel.org
References: <O5Gex5D3AY7Qx5JRN_QeWluQpNM8uye-XD90s-asNy5IJgdUAK9-D2UDDW5dXOL1vgSw1CeY1U70nwxr6aXm3A==@protonmail.internalid>
 <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
 <8ede3907-8191-49a5-a1dd-cbc6f20edb50@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <8ede3907-8191-49a5-a1dd-cbc6f20edb50@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -cYcZt7wE9KqVf3UX_uIgTZOv5izC5KU
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=69392a04 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gf2mfXkNawdVGkZzoE0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA2OSBTYWx0ZWRfX6DgkSjduW0Rx
 QDe1muVtIa+MiW1mh2Z++PgFx/YjwwZ6DzxWRhzS2dPx61CYwFwwZlc4NdAzh1Nkge1Bs/VCZvd
 fmtUNgVban/diPn/eU5RMGdMGgXGXEqp2fCXowOv1yK6rRaDiVUTB/nV/EH+NYC42WcZbR79qaP
 ruPyZkb1eSQCLfNDrAaGFnZ0NDiySEidetvlXQU260RjKgaGBR2dB7S72UudSjBznq0kttFxHIX
 1nO4Tepe8vbKqLb4FuSU/ZQ3pY/9fKuAtPOzGdSd/er0QuY2RV/SQtDzurNzF2gtT32E3S81jWx
 SII6DCwUjYuZpYYH4Bp69o544bNfGIWEDHQ/NqRrOfhPJrFLNBdKyyfBcbvXN3+dV0dFcwwo4a7
 nLseFTFe/p0Cs5fTMxayYcIxyCL05w==
X-Proofpoint-GUID: -cYcZt7wE9KqVf3UX_uIgTZOv5izC5KU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100069

Hi Bryan,

Thank you for the reviews.

On 10-Dec-25 1:19 AM, Bryan O'Donoghue wrote:
> On 09/12/2025 16:06, Hans de Goede wrote:
>> Hi All,
>>
>> Commit 69fe27173396 ("media: ov02c10: Fix default vertical flip") which
>> has been merged this merge window is causing various problems for
>> laptops with a ov02c10 sensors:
>>
>> 1. This changes the vflip default but does not update the bayer-order
>>     leading to debayer artifacts and wrong colors
>>
>> 2. The ov02c10 driver was originally developed on a XPS 16 9640 which
>>     has its sensor upside down. Changing the vflip (and hflip) default
>>     values fixes the image being upside down on other laptops, but will
>>     cause a regression on Dell XPS models causing the image to be upside
>>     down there.
>>
>> 3. The mentioned commit only changes vflip, so the image now is upside-up,
>>     but it is still mirrored.
>>
>> Patches 1-4 of this series fixes these issues. Patch 5 is a follow-up
>> cleanup patch.
>>
>> Hans Verkuil, can you please queue these up as fixes for 6.19?
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (5):
>>    media: ov02c10: Fix bayer-pattern change after default vflip change
>>    media: ov02c10: Adjust x-win/y-win when changing flipping to preserve
>>      bayer-pattern
>>    media: ov02c10: Fix the horizontal flip control
>>    media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down
>>      sensors
>>    media: ov02c10: Remove unnecessary hflip and vflip pointers
>>
>>   drivers/media/i2c/ov02c10.c          | 28 +++++++++++----------------
>>   drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
>>   2 files changed, 40 insertions(+), 17 deletions(-)
>>
>> -- 
>> 2.52.0
>>
> 
> I thought of this at the time but, assumed it was tested, on submission.

That reminds me I should have put some testing info in the cover-letter.

This series has been tested on a ThinkPad T14s gen 6 (snapdragon)
and a Dell XPS 16 9640, both with a ov02c10 driver.

All flip orientations now work correctly on both laptops and after
the DMI quirks are added libcamera automatically enables hflip + vflip
on the XPS models, fixing the image being upside-down there.

Regards,

Hans


