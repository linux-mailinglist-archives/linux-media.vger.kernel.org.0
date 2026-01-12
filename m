Return-Path: <linux-media+bounces-50431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E8D11BFF
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B88A33095663
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E63B298CC4;
	Mon, 12 Jan 2026 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGMtHwTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGFD+Jes"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5F277CBF
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212564; cv=none; b=PvcEusnE8jsruN5oumaHtFYgSkojFTmD0HDW3plBCNEIjQDUoVrOHqJTep3vgi+vMAO7W8vuamhY7dnaheO2w+lHIVHtHJgFZVTEUy/C9DYiiPMHEUGQgh6/MX37G7ZqDJ7OlLUHir4z0vQfOflFdZn1lOiCSQt7Q9h5PfbDK1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212564; c=relaxed/simple;
	bh=jkzN67gpWFAidOahWHGcFn9Gv02o+qZNxleYI0Jj1yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FV5va7zl15Fvou3/Usu2lJc6drNO0ri/Z1PLQbSolpLW33xgNGwx4XjZ/gAy6IEQuRZY2FFzCAVCtuvUC8adb6p4ZOsnyeZ0tU9dwLbRg4VG2l0QHdi8ED1+y50DcQL7c1lT4GNKOav8934TDYgjmA2+PNz+zncjmUy+iprKLFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGMtHwTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGFD+Jes; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C83GXn2891875
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9Pf6NgtL++hDryfw1jIKxkM7pR67G44mCs8oDqfGNA=; b=PGMtHwTOGsPV+V+9
	LDq9yvTPdqA0Xes0OgA6agwdjMHvnQdhNSV76ywrQlnjIXTEfeWmjIiFj6Le/drd
	keJrTMYKzF1fK5gHtpidIAfmsjA+H/lyYSUTaji0iH7UY5nnK4s7Fqv7AxchBqit
	BALsdYXfBEGM2RF1NPBQvM/8o2OjDh40ydG4/WO01D4lyH9MCkixAuoBaMvgFP6L
	TWY2hrl3YNKPAIaCs5k84tyg5xzLIATtgC7Gzpg0g8DcOvD7TZpQ5HwyBNFzl851
	dtq0UDRFfOMBk2snl0i55BiGGb9pXssjBptUJHhkEUlTQrrh1EA7lxkoYY4GXHoC
	KzDTeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukxg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:09:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e19c8558so206153885a.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212561; x=1768817361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9Pf6NgtL++hDryfw1jIKxkM7pR67G44mCs8oDqfGNA=;
        b=ZGFD+Jes5p9erEW5Lg6xn8O8o7Zp+xZjvDdvUOtQv5UUBINPVyL8rMKx65hLg1LHxq
         kx44jCVPUdT9nDDgsf3fj5+EplFst6GlSpLHhUeXX9nEdcrByX46REg3WgvxKzTn4fLq
         HuQYDdcENLzhFMYAlrXPmvhCwNz1p1/b9JKEALyjtQeLE5lOBvAgJNXoVTriy1GihMXC
         G3bSEa6dTZ5JSc6Vfm6re6m1zlevLHSM5A+duJsTtt7TKLNja7ODSVFuuOXqmWcwWb6R
         zAY74A4PNaryB74rNcYDDxjUxI6nwgspvp5FLWZPlPNOzEWiDQiumrrZZXWmpB4A84rU
         LAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212561; x=1768817361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9Pf6NgtL++hDryfw1jIKxkM7pR67G44mCs8oDqfGNA=;
        b=QlB/LO/ZzKSFgA5tm04SSgxah/DkK23idWUP80lDYAcw55yd13V/OqRCpbfspf5m1+
         h2TVj5eniPUIn2qFe2BDIr5QBkXw/U8NeMKtyEo+zSjTFohphcSzgodugMs8Uf3Ugv1n
         VmVL2f08BM/0C6MNqdjE5HUx3Svfa+J4Px67M2xcsSsOxvNd8NLmw+SkvkeIFfvMPJXl
         5QOdhxXKpNC4Ztke1gfg6TAq3RK174s3gKjom7VAeyd7YZ+OIEq2pVXvddG4Foa6J41+
         raLqBAcDgnRMgSHWqgOLrIwDnWWUicSSrtM/X+iQ/egcJKvFryXJVytQAxF7etV4PPB4
         4fuA==
X-Forwarded-Encrypted: i=1; AJvYcCXl/D4vguRkQXt8/CVXeB7MvZQ7sK99pTnmylatuY3altu/p2xyd7hY3YHkxMcv/TXAED6e/IQQYGYOcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/riSddAarDa3p5v/tq4ELJHYE/e4waYAl8dNwjRHEdp4gU92
	bMBwwgM/v0XBz1bpAqHhL7ohReZNWagC2O40fGoQ5W0rwr6kwCgi9mmseLlMBU73D1iZnnFib6X
	eUWob8dwHifxsWX6aBA/j1hhujaSf/bPFsyvo6I+EN1c7h7q1Suq2TJU1v0DXPWXXug==
X-Gm-Gg: AY/fxX54TuBGafpJttsLI5czzRFX7nrTLUqwEIpGragie5jSRK1zzgJpIx1gS3Ix0Wa
	y7oeXe0AHyKD70QdW5+SZFZP6EIJxW9kfW18y+UWCiKbsXrPe/XkDpEZ7RxmztzP8Dawjyk4uRs
	Tv/FCRP3Tc+wbeJFoJt9MSST9E8HchTCl1i37yrDpYnGBMGGff7/97cCUAsdqYuk4y5N9oIY6dU
	S8cxgogNXrNhTPxR+ft5FPeaNCFLg3xvLqs0bQaw6VvvrDAJdshrALRQxPsQpd7Ae2XePGxnyQn
	0fTPf/6AQELYHRtbbJ2/4/YDHXcvaatF/bqu5T6UBohN+7PqqslInYx9BW4C/T6nb3HJsxp+Tq0
	9q5hUTLcqLgoi2BMzmvb3jWsrpLHGUHit2sd+UpOv6iKI323xXDzhx4LZUbeVh7Jv0XdtIf8=
X-Received: by 2002:a05:620a:4146:b0:8b2:77cf:a02e with SMTP id af79cd13be357-8c3893f4f24mr2348287785a.45.1768212560784;
        Mon, 12 Jan 2026 02:09:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFozB1cYcA5K97qDKNLX3fcyraMa0T7wkF+7eBGI1z8HNueeM7VjD8O/fyI8qy8xY3onPK6Hw==
X-Received: by 2002:a05:620a:4146:b0:8b2:77cf:a02e with SMTP id af79cd13be357-8c3893f4f24mr2348285085a.45.1768212560273;
        Mon, 12 Jan 2026 02:09:20 -0800 (PST)
Received: from [10.38.241.92] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f532bc3sm1479123685a.45.2026.01.12.02.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:09:19 -0800 (PST)
Message-ID: <468ce093-7704-4497-a538-c54baacbd8ae@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 18:09:15 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: imx412: wait for NVM read (T7) before
 programming mode registers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tjF2Z2nt6dR-T_d-5cSpzZqItgoMsUzNmUBQ-jucG9SMQ9Q4y9cCrW4aya-hRJR0dQG-q63OBmZajTWMbxfeUA==@protonmail.internalid>
 <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
 <dc68db73-163e-4443-b334-31e2ae529e99@kernel.org>
 <1344ad43-a4c4-4e37-ae4e-eddd2c577b3f@oss.qualcomm.com>
 <aWS5qIA1Hfrr-3Yb@kekkonen.localdomain>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aWS5qIA1Hfrr-3Yb@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3OSBTYWx0ZWRfX3/jEtAOFyrS9
 wIxI3CKt76HfIZCs3eUinLJAxw5SKdJNO/QYBhg+dJbUPwtqBqFdeWyQX3coQW1boEripHJSokW
 GqeV4CKYzOx5rFesrfIyzfurJH2qoQgroOg+/ppqTSfVIMGsjoXSh+6EWaQcyu09V1FIUqSPGIl
 1lQ/DHzt27hlF1JoJ97sU/oqBujCwl9GUyNNb6j3OVALMeAAjX/1GjqjK+BloRYCrJNCy3OW6kR
 p/gURMb3K+/3wsQEZ2klT8yBjz49z7Uwe0qhBuzIGjYRTEyQ77zp2Su7EyqNmWeTuKXLnhMHmml
 O4jigyv+vapuVKjFFUWe5IVGhYaXDKNBUq3HnwYUG4yA0GcBu+BH9xbcKEyVWJZM8pknm2d3oiF
 RxKH32TIvZ/4voSf5c0GEawpQVLYfjsO0XSqagZSsscLU9SplP5T/J08DSMbsTFfDDQr5D4asn/
 crOpkLtoHwKcLobYqGw==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964c852 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0plRyFmWAAAA:8 a=KtRVGM7OAAAA:8
 a=8kWtszsyjAelfLr1hFsA:9 a=QEXdDO2ut3YA:10 a=ct7v8gV3xnkA:10
 a=CgqesQyPL7wA:10 a=Bv5VFBYUiN4A:10 a=ph6XRQtNn88A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=4tO_KGIOfzmgBqjB6OKc:22 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-ORIG-GUID: dr3lGjx82KornaJ7dqT5pGXstcfEsOXx
X-Proofpoint-GUID: dr3lGjx82KornaJ7dqT5pGXstcfEsOXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120079



On 1/12/2026 5:06 PM, Sakari Ailus wrote:
> Hi Wenmeng, Bryan,
> 
> On Mon, Jan 12, 2026 at 11:07:39AM +0800, Wenmeng Liu wrote:
>>
>>
>> On 1/9/2026 8:32 PM, Bryan O'Donoghue wrote:
>>> This delay should go at the end of the operation that requires the delay
>>> not at the start of the streaming operation.
> 
> I would have thought that, too, but I understand there's an issue with an
> Arducam module. It's also not exactly clear to me if all other registers
> are writable at the sensor identification time or is the required delay
> only concerning starting streaming (I'd hope so).
> 

Hi Sakari,

I tried adding a read ID at the end of power_on func and found that it 
could only read the ID during probe; subsequent attempts during stream 
on would fail to read every power on read.

[   11.298460] imx412 2-001a: read reg chip id: 577
[   11.310703] imx412 2-001a: read reg chip id: 577
[   35.392396] imx412 2-001a: read reg failed ret = -5
[   39.583990] imx412 2-001a: read reg failed ret = -5


> Also see
> <URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/pm-resume-delay>.
> I haven't posted these yet, but I think it'd be useful to avoid extra
> delays here and elsewhere.

compile failed in my side...
+void pm_runtime_resume_fsleep(struct device *dev, u64 sleep_us)
+{
+       u64 ns_diff = ktime_get_mono_fast_ns() - 
READ_ONCE(dev->power.last_busy);
+
+       if (ns_diff < NSEC_PER_USEC * sleep_us)
+               fsleep(sleep_us - (ns_diff >> 10)); /* avoid div_u64 */
+}
use this func in imx412.c for all usleep_range, have no effect.

> 
>>>
>>> The delay after the stream write, should be related to the stream write
>>> command, not the antecedent - the command that came before
>>> start_streaming.
>>>
>>> Basically I think you need to put your delay into the CCI_ID read NVM
>>> parameter load routine so that it guarantees its own completion.
>>>
>>> Because for argument's sake if start_streaming() were not to be the
>>> thing to happen after CCI_ID/NVM loading, the logic would no longer
>>> work.
>>>
>>> And you need a Fixes: tag for this patch too.
>>
>> Reading the sensor ID only occurs during the sensor probe process. After the
>> probe is completed, the IMX577 will power down. When stream on occurs, the
>> driver will power on again and then start streaming, but the sensor ID is
>> not read during the stream on process.I have tested this change on imx577
>> modules of different models.
>>
>> So this change can only happen during power on or stream on.
>>
>> Hi Bryan, Sakari,
>> May I ask if you have any suggestions regarding this?
> 
> Could you add a comment this delay is there for the Arducam module (and
> which one), that doesn't work without it?
>
https://www.arducam.com/arducam-imx577-mini-camera-module-for-qualcomm-rb3g2.html
https://www.arducam.com/arducam-imx477-camera-module-for-depthai-oak-b0369.html

I have tested on these two IMX577 sensor module form Arducam,all have 
this issue.Did not encounter this problem when using one non-arducam 
IMX577.

Thanks,
Wenmeng



