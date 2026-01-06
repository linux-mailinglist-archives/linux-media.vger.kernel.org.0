Return-Path: <linux-media+bounces-50009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7157CF7E91
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 11:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1467C3102C75
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 10:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D4133D512;
	Tue,  6 Jan 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOVS9ugJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el4OSNZX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABB33385B5
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696217; cv=none; b=YVaiOYibnMq177NFcA1HVzlKXHsBlF40av6MHKEsnqHk05+pxe3gZdymTKtUC1ChNKgHDHSVsIOIf1qYnbKKMpwwxDL2XzrGU7cyBipJZqhuLCllxaChw2aKJ6RroxgfK7l9h84OWhUAKKOFt/rHm59aDG+pigh7oa7F87r5rKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696217; c=relaxed/simple;
	bh=nsEplQOciIOq7l4RkOJZLWkyabscR2jgHJ7duwmtTFk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cwJXTcomrA4rFM8ZzrlWJVjDu/DoirI/pgqcXC2WD44QWpa/DlfR08ds6IESfXsAfyxzFAMp+le6AA1NI03CGqh8lQ9EfR1ZpTUjTG+5zn5KnibL3vLMJBwgPNLXLZ6etwhHpHyh3AbbOd3C2OLqrpA+993wgf/A4pPXxb3rfDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOVS9ugJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el4OSNZX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QelX3272198
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 10:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKL2wW2SDPSmInJmsyafjkeTG61g2vb+Jhgs1ETGzB8=; b=eOVS9ugJW+WrPK8K
	KO8vYCVhVGDbuiynB5oJ2DCoa0rcl8oo+soE/fLjq/X3F7hrQtpQ/nXJdm74DP/P
	2VqCmDz9PI/Sr56MhJYowa0ORIvsRhCQ6vxkCAw/EuTFMCLa+FKN40QLrpuIl4xt
	JIScyr0eXJCLSTLBX9EB+pFBrdPXrrfNrOH2aO9mXOOwvt3Lpqt/KFK6I6Z+ZtN/
	rzRTthO1k9sox5OSn2uI+dBcfvg4PyBSEzket8qBLrlGOZxrCLBvX7RwMTTGSrS9
	D9US0Fr3TruplVGnq8C+AG6bsy0z7oSt5xg2jU30eOF0WZ8/SuD890DAHt0HOau3
	6Sx9HA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02yyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 10:43:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4a92bf359so22272031cf.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 02:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696214; x=1768301014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XKL2wW2SDPSmInJmsyafjkeTG61g2vb+Jhgs1ETGzB8=;
        b=el4OSNZX52TfXvzdKOF7svr9oH5A7y8Vuk0pWIV+2QTPJkwU4Klfn4B7QXHYJlWb4N
         536Z36W4RkrqYFd2CvF9AkCe/Sjpu0Bik0vIKQoYWjmS/HTYx00WhP1IKIfu+C8q/naw
         qJO14k68S/YJOyNVRyFP/MpDu3G/zwu3kZD9kNPScdOtCVEP6SZKvJke8R7zQIsJaBYl
         UFI/pYxCWZ6YGd4ZbdQiNkwnExQoAzRf3s8aGMSS+saJOitTBh/Thfr3mAm+jInQcGav
         NWU7rophb1VzHoG+HUI0LMnoAteeHvw9Mvj1OWnJd11EDoh6nZ1BM5m/CkRxCYn4BAw0
         mkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696214; x=1768301014;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKL2wW2SDPSmInJmsyafjkeTG61g2vb+Jhgs1ETGzB8=;
        b=svy1U7ijWJ6MOTYOG1lKnwE1r2pnDrnziTR1jeVGHAPD4cRmpZ7UcpykJPMkoEl1J8
         yuh2rcOw2skBik0AsfJdeLS4dbrBGnD1npB2AZ4eJE+x5IjREnuctwYyqTwoM2Cu2nFN
         wrt62ycLZtImY8x7bCOLj/Vlu7TLNsWY2tkx0WsXRfmt/nQnOf4n8abu9KdBd/N2598z
         9EeQlC5gWbmumeuOf8FW5duIFrJlYkMuCLqfRPaZNzZj6PveZujMilrXKUuBvSAzsFZG
         kJuObhlUtOZxao85nZpYIQh/tjwy7XpbEZPUzAbAloXvHIqTMgRtKvcyIrCoQU9yxwcO
         mh8g==
X-Gm-Message-State: AOJu0YxlCIKYt6+QmUFfM1YTSvcoG38uf5C3g7UZ4ToSWz+PhfLN5CC8
	hmRFaNWOEqCqB8z5cihophxMf1GEAa4/k9pA8RPm/kc9OXVRznpBy4feDIYHNCa1AOFFs9/uJru
	1kU/+2FdzVUI2k0OpFVaub53lUDlUl3xHO73wck2nbObBVUkNsHM+bJiRUECv2LJoVw==
X-Gm-Gg: AY/fxX7ZGahWa618Ztl4Fr+NJVCfygvefmSCV9ncpdMmftU2OmNIMamn5cDgWvvy//J
	RaQ4o25Ke6Cffk0rUnoe0SG5ptpAKArQR+CP7wvP6f0lyS888FaKwZnDmm0eqNUo/gmyr2hTJdJ
	YETuYzeDyg4hQ+NqY9p/oGwVCJ5fzgXMDNoheLxWNmr4OFGLVh1DPzng9ACw6kobS0jwWfjzuI3
	5W+le8B7qD462TEgI/Ve+N8WvMhO4FlYqafPYHgLIzSE5rg+eF/IdhiOjhA8EtwmqmrBlQfG/w0
	nXVc3L8O2E88LXqBpGccsnjzFZrK7M6SMzatJViV0S+8u5+eTnx9UlL8D0ARNaSEPcmqsLGzX9U
	08IMM5yHZlbC4/W1FMJA5C4oeoJkKbecw1BZRYsadbVeCHznQ8nGcmJDIVtzSNbUfe/hH0fv/WK
	ZOIti8gecWvEQjvUBQoQJyTNC89aTDbtaaywyxmeCFBHLdptaNrwKeZJ5ygCTceLS19LpOgnk/+
	lp2
X-Received: by 2002:a05:622a:1988:b0:4f4:c10e:fa3e with SMTP id d75a77b69052e-4ffa7698c69mr33536911cf.3.1767696213841;
        Tue, 06 Jan 2026 02:43:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+lpwc5iRy3/Geku8nEgM/QdmYkEEuVQC8B264MAYHS9r/ORu+0HYSXfaHYuyBrLlrf6Fllg==
X-Received: by 2002:a05:622a:1988:b0:4f4:c10e:fa3e with SMTP id d75a77b69052e-4ffa7698c69mr33536741cf.3.1767696213422;
        Tue, 06 Jan 2026 02:43:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2340a2sm197933066b.5.2026.01.06.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 02:43:32 -0800 (PST)
Message-ID: <ed3d569f-ce42-4594-ae49-5ed67139acd9@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 11:43:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [GIT FIXES for v6.19] media: ov02c10: h/vflip fixes
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <df8059ac-2c6a-46e2-9494-974fc6460184@oss.qualcomm.com>
 <7ae434c0-0e36-4434-826a-2122c4e9ccb4@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <7ae434c0-0e36-4434-826a-2122c4e9ccb4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695ce756 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8 a=88lOtNfAVAtAh8jU3wwA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-GUID: 52FfcrekgaHSMhFB9Skv037n1bJ0Vqxz
X-Proofpoint-ORIG-GUID: 52FfcrekgaHSMhFB9Skv037n1bJ0Vqxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MSBTYWx0ZWRfXzun3MD6UII7g
 0E8vXOfD/1pCyBXV+Kpbjhy31cfueFvTjp+ngYHzgXEQDoG2DA73t90F2NTnzmPuALp15m5SI5d
 POO+vBXTtJVIq8gaWGrNogY+Oh787m5jdwN7g76T2+/ocDaPns1enwCyxrSMOlPuEKCASUn/TQW
 qKASGi48Po62hMvgLMER3+KbNq5UX0MsmHgED0g/JV3cfzjpzbfaha0C1IS+NM71ZeuT5b6QZ1N
 zIxpNQdb4og3t+SjwOf2eUun3SiBlyzAM6+DkmTP+en4uBCLNfFhjPSSUqOaDByoKP/JLd7Bcvs
 7j8pd0Szb3OgZLbg+lUQ9MyEVyBCo4Pz1VcyDtzwDeN9Kx4NtBbGHxzwns+Q7bKmV2fjsfr5dAV
 Tx46ONz92NruK1PmF4B5Y7Z5cwfs2LMh/eLFzNqqXcF+T1Uq8a29KZUc7upKza1ypIPK0eXNaKX
 8ub9Vu1CQ4ex5P5xlYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060091

Hi Hans,

On 6-Jan-26 09:44, Hans Verkuil wrote:
> Hi Hans,
> 
> On 19/12/2025 16:03, Hans de Goede wrote:
>> Hi Hans, Mauro,
>>
>> As discussed in:
>>
>> https://lore.kernel.org/linux-media/382e2dc1-6552-4ff4-adb2-7e4bfafaefb4@kernel.org/
>>
>> Here is a pull-request for a set of ov02c10: h/vflip fixes.
>>
>> Note the tag has a -2 suffix, because for -1 I had accidentally
>> used a random post v6.19-rc1 commit from Torvald's tree instead
>> of v6.19-rc1. The -2 tag is correctly based on top of v6.19-rc1.
>>
>> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>>
>>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/ov02c10-fixes-for-6.19-2
>>
>> for you to fetch changes up to ddf8d8757cb36654cb146f90c4af6a82d0edff25:
>>
>>   media: ov02c10: Remove unnecessary hflip and vflip pointers (2025-12-19 15:50:49 +0100)
> 
> The patches are for this v2 series:
> 
> https://patchwork.linuxtv.org/project/linux-media/cover/20251210112436.167212-1-johannes.goede@oss.qualcomm.com/
> 
> However, this series is marked as Superseded in patchwork. Is that a mistake?
> 
> The v1 series https://patchwork.linuxtv.org/project/linux-media/list/?series=20131
> is still marked as 'New'. Did you mark the wrong series as Superseded?
> 
> Also, most of the v2 patches are delegated to Sakari, not Hans de Goede.
> 
> I just wanted to clarify this before merging anything to the fixes branch, and
> make sure you and Sakari are on the same page.

I did not make any changes in patchwork, so I assume those were done
by Sakari.

I guess Sakari may have marked these for picking up by him, but since
these fix a regression in 6.19-rc# these should get picked up as
fixes, rather then go to media-committers/next.

Sakari ?

Regards,
 
Hans




>> ----------------------------------------------------------------
>> media: ov02c10: h/vflip fixes for 6.19-2
>>
>> This fixes various problems for laptops with a ov02c10 sensors caused by
>> commit 69fe27173396 ("media: ov02c10: Fix default vertical flip"):
>>
>> 1. This changes the vflip default but does not update the bayer-order
>>    leading to debayer artifacts and wrong colors
>>
>> 2. The ov02c10 driver was originally developed on a XPS 16 9640 which
>>    has its sensor upside down. Changing the vflip (and hflip) default
>>    values fixes the image being upside down on other laptops, but will
>>    cause a regression on Dell XPS models causing the image to be upside
>>    down there.
>>
>> 3. The mentioned commit only changes vflip, so the image now is upside-up,
>>    but it is still mirrored.
>>
>> ----------------------------------------------------------------
>> Hans de Goede (5):
>>       media: ov02c10: Fix bayer-pattern change after default vflip change
>>       media: ov02c10: Adjust x-win/y-win when changing flipping to preserve bayer-pattern
>>       media: ov02c10: Fix the horizontal flip control
>>       media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors
>>       media: ov02c10: Remove unnecessary hflip and vflip pointers
>>
>>  drivers/media/i2c/ov02c10.c          | 28 +++++++++++-----------------
>>  drivers/media/pci/intel/Kconfig      |  2 +-
>>  drivers/media/pci/intel/ipu-bridge.c | 29 +++++++++++++++++++++++++++++
>>  3 files changed, 41 insertions(+), 18 deletions(-)
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
> 


