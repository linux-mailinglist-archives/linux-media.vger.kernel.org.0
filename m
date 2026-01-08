Return-Path: <linux-media+bounces-50219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC376D01B9C
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF923031A3B
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0921C379961;
	Thu,  8 Jan 2026 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muJlowqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1zvan0o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D4344034
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861511; cv=none; b=bQzhsd5isaAwEYrkq/TEzN4LdrfzMwWUta96VkRAT1AW706Zq9RruXfZ8v7hDTENeGDJa3UxV9XY48cKhJTHeu9NLzL2GnzLsQ+zaMChdQr6uEHcX4m0QX0gpY+byJVtuRbNDIrIY4lPaigA1rktiAEp5vzlQbNI4Aq/ZzILVJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861511; c=relaxed/simple;
	bh=dnxiXQYK80rSiXRNHY/VGckOGY1aglKhHVXjrY71uj4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ME/U1MMjohNQjblJYjdmP/dUYbYIuTQef7P37w9W8tk9/1IwLTYx43viPkZmkhVl46k0PBp4ndc6uYDnYCsiAJ4z1UrVC7J/dbA2rLemwXzMzuPObLk3fPKe4u5iylKb3DKxGdwZ6PWb4dv74spXXoSs+he/OqXt9U5EdxpwCl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muJlowqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1zvan0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084ZeED2453891
	for <linux-media@vger.kernel.org>; Thu, 8 Jan 2026 08:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2QAqBe4+df3ACm1vz0AjqspTh3AnoBx6LJBN1OW9aA=; b=muJlowqLr2D2Uq0e
	uDLhom7zbbM1Bq1fUSXJARL0tYzzpZJdYFGc0qDp1tjkpZDM1IxuFlyqfFYnXUNi
	hhayzUrGVXBPGbN5HCLHYj6yKVNaqUt8wmX+vm6R04B9exfCz2Hh8CTMPtLMbNoW
	swCiTwz+rlZWgFh4ssfH7OsmRp6pM2OcvcCwVl1UUAkhWHi6y0eXYrLSd5dY3Rgc
	O9BL8XP9KBQl1SFfAzVntqA2k8VbMnXIYje0lSSvy1cLZXaKmEyNzuBi2pf54iwd
	WX03pWZaBOQvu8IujDdHKiJRsuFETQS6gaC7xxMJd/KXuOArlxtIwZaK5+BaVAww
	nSSj5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbm043-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 08:38:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b24a25cff5so910235485a.2
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 00:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767861498; x=1768466298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2QAqBe4+df3ACm1vz0AjqspTh3AnoBx6LJBN1OW9aA=;
        b=E1zvan0oyR8DRxHXwbzSLJXvyetZmsHfWSQCdybYyvH7TFpvz+OO+fIIfC88UECIEG
         p9Ik40+/myoPDwozPf9V+MYFBnj45fl7Fi31T9xunTV2j9HpY7BJPkfvC+Ya8S675CC2
         xnwwOlLHWfFgFDTgJ5pzAxH8TySCCXDXq+GhWhxMTyJFlJHcAyV0AH5wwFHz0dDnYcFF
         vITwzClNvawA8g18+pZhU1ZL8MhySpmkoXaxEqEqyilD3BjSWMmDxp7VqFvGQaIaQepX
         uxclUp/ExWf7vDhezBr+cz6J385jdVq5BCnpbYs6BA/Zem7Rs8pkDPOJbTlIUHRLs3Bj
         GcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767861498; x=1768466298;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2QAqBe4+df3ACm1vz0AjqspTh3AnoBx6LJBN1OW9aA=;
        b=F15RhkDQcT0nyyU33+8ZcFcIsDl1gFgDRJVI3c3ruFPIo5Jpd2IqE/5rLGpnX3Ao0m
         CMGEBBm/K1JmkCx/31tOEW18peNCnApHHZcdHoLiYuFNag7G6VmjzvwCFkTu4Z2crYYv
         xtel+BaXEbu2hY4CHZmbu+c+AordD+u5oq+YK5GKEMdU1+gshu0lHw9xxZ765hzBTwvI
         DaK3O/X9FuVr91pCMC8FHzlm7e0uqIoToRXyjjncURQHesWuYz91TeMaCb4zQYCXutrJ
         +MsNazVB0poD08kf3kqqF+aFcN+/uXU89ICg4GzWyH61kvLvCmLFXSSobDYDGsUw2kXF
         zK4A==
X-Forwarded-Encrypted: i=1; AJvYcCVaaVK6UVzSXeoF0CixMgF8st5a0+cXr7mM/mh21jrk/1mGkaPf9f0TkEupxRmMuCO/UVJA69ai8VdePQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG69Uj4dbTbdff9vEJNLxPsCNt2gMS4a/U8iNoLTPORN8o4cUH
	QGcoNcvyAOE2juOQw+TREY2nMmF454HLhc3QpwKJfniRWafd9oSxgYj7tXa2Dqm+/ww2tLOEEIm
	ZxFKi/AcBgq6nM5Mkq4NBrekN6T24tuANJH1JxQT7Heup5GkcbGuZN7jzaAImzThFMg==
X-Gm-Gg: AY/fxX7CP9r+2kr8/62Lm3rxsEWdReNfjI+vFynFDA8QHvdAhCoUnTQBrzrUkDZGsx0
	OYR1H0MbqLF+0LpIB0YI81JcCdQJnJ6OuR9I4Uze/g/91qvysfazlt39grjJzxrdjhT3LWbpO0G
	zkByqoEP7MWvyMCVz6gRmh/D04nDyQI1Nbw2LbBrXUexOS9ZAyXmcSIq81e9vS9JlgtE/9pWijx
	OQxzUt8cHGkmBkBX35s3R5CELhGnxh953BMJOKQiJL4G2S/uk6mYQbujVd52l63b3G6RtYe2AD7
	wO/mGcskXvwjUwxnwER2U7bdU9kbphzS/aP2lwmV7Sz9wDTifhxtAmbtckhQrA9drro2ENp76pc
	UOWTevVyY5F+yw+ZYq9uTCDXDtyqeB5we9dU5V5chgYsMN69PGjXYWUMf50j2aJY7dpPBEip7qz
	iRnTt4Mysi6KhBIgIt732sajx3otK7wJRvWmmS0v1eK0BeOCguvrRf1mmpmiJJFSPh0aXCqpjPn
	JrO
X-Received: by 2002:a05:620a:1a13:b0:8b2:da84:7810 with SMTP id af79cd13be357-8c3893eb539mr681308685a.45.1767861498452;
        Thu, 08 Jan 2026 00:38:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUNx8Wpqvm/m8SkAAORxgp3y2mSrLPAiDvqPTKidErTtjL1Oa9i8NOTlt39F66vk9wrhfc7g==
X-Received: by 2002:a05:620a:1a13:b0:8b2:da84:7810 with SMTP id af79cd13be357-8c3893eb539mr681306885a.45.1767861497998;
        Thu, 08 Jan 2026 00:38:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84591b6240sm202995366b.10.2026.01.08.00.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:38:17 -0800 (PST)
Message-ID: <4f42d0e4-6595-4838-bfc2-e690eb9e046f@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:38:16 +0100
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
 <082db370-e6cb-45fd-aaf9-bcd9f80dc242@oss.qualcomm.com>
 <aV7R30bSVxXRxCok@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aV7R30bSVxXRxCok@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OCBTYWx0ZWRfX8ajdgBCFHVVv
 gOdZuFX4qWTJPUYbd8lpiV2JV2qKnm6Dcvc9v/J2TX2qHmFTYDBAmJd5JEu4nJQixn2M7qSjGON
 3VmJfenB/bEZqX5dMTMImlgwHVEpETs2jVd5P92dNnEVsp3DS+lxx6zF4z4lJmmITnj2ZjIRbed
 eh+b5MYuvI5nfbHP8zFzyRZ5xabqu84NFxfkHARxorvSOedfED6U9gp2i0NXPWdB3TLAIf1kXGu
 DEDcSZOC6LmLjM815koIoofqN3zZobC4lmWX2uYDeEbFwx+3DyNsqdReV3apfTkpPP/AK9hQrZq
 u5FiZvbNxW+lqgPT3f7DTds4iUTYz6nC+vWG5E/x28v+43QPRbfFYBvlYMO3Dq2yaxCjpKf84EB
 MjfLVY2cb2BXU47uliZx/FJPI8N4HrTrfN1kww0m7J6wo6uvAZmoBA9n3/bdG38Glort5kjpopA
 xmxcaDBqmxMPIhpMibw==
X-Proofpoint-GUID: DbT1XpWMFlyx2mQ5JM2D0V_UvRktW-MH
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695f6cfb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0plRyFmWAAAA:8 a=j7Eb9WoC1qn-KjlAcRMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=4tO_KGIOfzmgBqjB6OKc:22
X-Proofpoint-ORIG-GUID: DbT1XpWMFlyx2mQ5JM2D0V_UvRktW-MH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080058

Hi,

On 7-Jan-26 22:36, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Jan 07, 2026 at 02:45:18PM +0100, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 7-Jan-26 12:48, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Wed, Dec 10, 2025 at 12:24:33PM +0100, Hans de Goede wrote:
>>>> The ov02c10 is capable of having its (crop) window shifted around with 1
>>>> pixel precision while streaming.
>>>>
>>>> This allows changing the x/y window coordinates when changing flipping to
>>>> preserve the bayer-pattern.
>>>
>>> Ideally we'd use the crop selection to configure this, but given these
>>> sensors (and drivers) are generally what they are, I guess this is probably
>>> a reasonable way to go.
>>
>> Even in sensor drivers where we allow setting the crop selection
>> to get arbritrary modes, we always round the coordinates to a multiple
>> of 2, to avoid changing the bayer-pattern seen by userspace when
>> userspace changes the crop. See e.g. ov2680_set_selection().
>>
>> And then when doing flipping we might add 1 to either the x and/or y
>> coordinate to the userspace provided crop x, y before sending it to
>> the sensor to make flipping not change the bayer order, see e.g.
>> ov01a10_set_hflip() after the v2 series you've here:
>>
>> https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/ov01a10
>>
>> which does (simplified):
>>
>>         offset = crop->left;
>>         if (hflip)
>>                 offset++;
>>
>>         cci_write(ov01a10->regmap, OV01A10_REG_X_WIN, offset, &ret);
>>
>> IOW we are trying to not make userspace be able to affect the bayer-pattern
>> through setting the crop-selection and/or flip.
>>
>> So I'm not sure what you mean with "Ideally we'd use the crop selection"
>> because we are actively trying to avoid to have the crop-selection change
>> the bayer order ?
>>
>> Generally speaking I think we should avoid any settings change the bayer-order
>> whenever possible.
> 
> That's up to the userspace. The UAPI allows to do either so why should the
> driver decide?
> 
> As noted, in this case providing that flexibility probably causes more
> hassle than any benefits, so I guess this is fine.

If we allow setting the crop selection with a 1 pixel precision drivers
need some equivalent of V4L2_CTRL_FLAG_MODIFY_LAYOUT for userspace, so IMHO
the UAPI does not allow this at the moment.

Also drivers would get extra complicated by needing to figure out which
bayer order to report as being active based on the crop selection.

I really so no use-case where we need the single precision crop selection.

So when you say "in this case providing that flexibility probably causes more
hassle than any benefits" I believe that statement applies more general then
just in this case.

Regards,

Hans


