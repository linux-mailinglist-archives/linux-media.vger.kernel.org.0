Return-Path: <linux-media+bounces-51732-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DdVIbb+eWm71QEAu9opvQ
	(envelope-from <linux-media+bounces-51732-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:19:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E489A11CB
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2D6E3030B33
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409E52F49EB;
	Wed, 28 Jan 2026 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByAtbf11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Petb1dll"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F51F9ECB
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602694; cv=none; b=OWypSLw1qaUQpmqvEL7s1201wtSJ6HXHqJSrp/6A5kqoVgmHSRg6D0ty7dIqvGZZp6Tegl7b0llm2ygEc4EBM7jZ/fOXhUHmkHSbjvvcwjgaZySXMrWYI4au8hhSWywyWINpHOo8AQC57ysbcgnNLMmXZgHCdxM4uo9WDVgvEy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602694; c=relaxed/simple;
	bh=AaVglWVJL0wCi22mK9ysc4Mx+3zSGdirHKztaRIVF3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUh/0U4I3+IWxdQSsOk4iYH1Ej+viZ7ZGpKiOhOa/GHfq7EkXkMPALD4CkgFhzCuLvCIukbRoiZ/OH4IwRuGdSGm6ga5jQwQE5GE41D1uwtd33uORmaIa+k4KqrFpANCALQMxK9c55zvFCp0wm4oEM9gsszD4CFYis5pvjJRHDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByAtbf11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Petb1dll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91sHe3879174
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 12:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jloTsA6jPXrD8sfjSXsugH7YDyzRY5u8YRtsWPa8GmE=; b=ByAtbf11ljFW8zCD
	fPLY4kaHWw+tG2BhI2wUNCGvqgr40mGChtWcLHMMnWXFhSqiD+7AwkyFRwVAgxes
	eaLtr8EryZO28xXg2bW12q6M6bFjNrfhbZ2ULOly9eJe85erDpSPksWhZAS17WOO
	2Ayki3Jz09rbiuhcG1NgJeVm0TAt/Bv4U+AEH5pmp/Ufx+R4pOKhhtNpn5ziYdbr
	JzhhRG3JAhukMOwSnJoru8BlwbaXItoR6d/AIhIuKI5DOFRDIkVgqFDREnSG59tK
	pTa0z0ItnMz7WntVH1OlujB9l89WCEtW5Ydrrgl7Xw5yYcTrJmGYr+ACKT00BBW5
	uvJOqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv1d3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 12:18:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so69337285ad.1
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 04:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769602691; x=1770207491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jloTsA6jPXrD8sfjSXsugH7YDyzRY5u8YRtsWPa8GmE=;
        b=Petb1dllqba9g8qb218fvBma38fNxfBlAIoUxo7jPkP1mvqNgAUg1j7QmALccIulp2
         pC97pq/d0n2Hyf/ggJhwKoCKUoFIKSFhgk+Hf+Z6ZecsEiIW16xpILbuaaPXgI1EVhMU
         invs/YDyaODtj5+zpsfOznKGt73qLhbGOgbVg4qVH435GaBFrrBS87NROqtX75Im5+L1
         zAqYh0G29WxRHchPAbTwCAYoFRqA0gxNzIE/Le7xbyqATTQQYLBSeKntkJ7W3D8cCOjs
         0WcYU4pEM3+MBA8iutZnm7gARaIr8Wn24USC9G4MIK22IkS+bwi3IF0l0uyHEVC2NrM8
         UzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769602691; x=1770207491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jloTsA6jPXrD8sfjSXsugH7YDyzRY5u8YRtsWPa8GmE=;
        b=WIucSb0kvY6GUzVRphVjjKw/8S6mWVeTr3sFIHYnfEcIkiaAjdHyL5kgQuqSWkcRrE
         p9jJZIRgqzgtrjqRLhOikNZ2+YykcciPhpMqS4OdJNXKFtI/TjMNrbHabYlg8G52N1is
         hq4TCss5T1MsEzBNX9Ql7KRBrJRZri/GS84hZZAHTyyfq5xoh5s9oormlPGqiPpIQLP1
         5ujy9dnyBx0NPbICfqfPOwL3k6nZogb/Nn95t+rfDWS8D8EIi3nuOta57uLAVuslC7G4
         l3XPwhCWRaDFG0RxypzjkqpB4yOrXplGWsVR3ojeJOXc80o7BG/g294DNX+/UBeCA2Rs
         18ag==
X-Forwarded-Encrypted: i=1; AJvYcCXf0L0bPzTn+FQ6h4WpWLofb5/OnazYCWxA6wkbNkdVyShHm5dUD8jGHaFMK1k8G3+7fl8k01+pqw+uQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeojnt5Swxb6VIdB/eO84jkOdvfiF0DqUAQsiRzYQFKw2etUAS
	z50d9+9P8ztD0+7c5uk5W4rU5jQz5X+isZwqj2tGEA4VXGGB2TeSNhhtr3wOseC1CujtS+gpVMu
	ZBX2V5bP+mkR1dJlqnvpYym1NS4X9pY8q4ypDXwEv+7SEbvPrnKL+aMQjMTkwPnXtRQ==
X-Gm-Gg: AZuq6aIt+1j5Kqgy3/y56oNFqtKyje949OzpymZRBEhIcMz1zEIbt3+SrBwqGFhlCWg
	+7KuWO9/N/Mlg/WKEPvSimRYjbAltGQBT5zPrnmobjPO/dr+0fp7AJw4LZuTe+qdBIdxUnPNMy+
	zPbaMrNPRlvfGSrMgfAoKZkdxVaHtGEBPEaMbs5torMbeNlWNfzaJjqcrwE+/IpCdLgYMdeZ9ZU
	/fNGguM1PKflSH3Gokj63/ksAo87oyU0NgCAOvm556mm4aDbXs/Flu1UbJcHdNzYwlUapoP/63y
	9FBCcBML9LjtDRxPlVCbgQXE+ztDEoJCVDUzG5aiUMQxI3ueRIg9IjBhGczzy5bi/r22hTPwcfr
	xXTTKmmxFuS6JOMsfSSearGJ2xsFaf57QS5IXkRXA6r4=
X-Received: by 2002:a17:903:1a0d:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a870de9b93mr53221545ad.58.1769602691068;
        Wed, 28 Jan 2026 04:18:11 -0800 (PST)
X-Received: by 2002:a17:903:1a0d:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a870de9b93mr53221115ad.58.1769602690433;
        Wed, 28 Jan 2026 04:18:10 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4130c0sm22351975ad.22.2026.01.28.04.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:18:09 -0800 (PST)
Message-ID: <94e5ce4a-9d35-4868-8eda-b471ecac3662@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 17:48:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <83198eae-088e-41d0-ac5f-2346e422a25d@oss.qualcomm.com>
 <m5nsdjbogulmegaavp2twkgf7y7gujm26da6glkbirgxefxxyz@3ac3xzbt3hwj>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <m5nsdjbogulmegaavp2twkgf7y7gujm26da6glkbirgxefxxyz@3ac3xzbt3hwj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HtLMN40m90gh0roahxiwO7QTuzhnrtZn
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979fe84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=4hJEjaH6g9CgPEswoao2AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3paou6EoLLgSJ8QuwzYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMSBTYWx0ZWRfXynsdgtkjvKlA
 9pIVy6LQInb3ahkktXt0rRl/6UaRYB4giBBwERqONSYgodLaOiouEJS20o1lvCqhC+DZ39gz95z
 QRxoKNCLD90mER4/Ls51uhjsEz63jhIWvfkR3+fvq3UhwsofWYWlXfh+UxwJhKRW/vjWa0AJ+t2
 ZeHrE5MwbaS0iqeG9ZkHdS/aMRyOmwBx5OMqtXybnRNP7Z1o5W2BqKDvTCe2b/wPRazpv+5ZNK8
 jrDhNbrkvhQLpweJtDycvuCEeyG51pgha5RD70AaHVvlIfb15+r24hn1XWXFq/FwCIt4HSTR/7w
 0BZqhUIrrkmfOPfHY1WPH3heV7G2dcSP04eWmY90VNhK9iH6Mf4E+aJr5D0HKogBU6+VFiGvc5+
 DD72c7rIaMsLw44LNwCpC5dDu34szk/XPah2x1VIDK5E3kaPJ8Qo9qhJB/tqCsi/p+v1r2oo0IF
 oEc7DRyyl9SwnnW4CIQ==
X-Proofpoint-ORIG-GUID: HtLMN40m90gh0roahxiwO7QTuzhnrtZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51732-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,out-h265.md:url,out-h264.md:url,out-vp9.md:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E489A11CB
X-Rspamd-Action: no action


On 1/27/2026 5:35 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 12:43:36PM +0100, Konrad Dybcio wrote:
>> On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
>>> As the Venus and Iris drivers are close to the "feature parity" for the
>>> common platforms (SC7280, SM8250), in order to get more attention to
>>> squashing bugs from the Iris driver, flip the switch and default to the
>>> Iris driver if both are enabled. The Iris driver has several
>>> regressions, but hopefully they can be fixed through the development
>>> cycle by the respective team. Also it is better to fail the test than
>>> crash the device (which Venus driver does a lot).
>>>
>>> Note: then intention is to land this in 6.21, which might let us to
>>> drop those platforms from the Venus driver in 6.22+.
>>>
>>> Testing methodology: fluster test-suite, single-threaded mode, SM8250
>>> device (RB5).
>>>
>>> $ ./fluster.py r -j 1 -d  GStreamer-H.264-V4L2-Gst1.0 -s -so out-h264.md -ts JVT-AVC_V1
>>> $ ./fluster.py r -j 1 -d  GStreamer-H.265-V4L2-Gst1.0 -s -so out-h265.md -ts JCT-VC-HEVC_V1
>>> $ ./fluster.py r -j 1 -d  GStreamer-VP9-V4L2-Gst1.0 -s -so out-vp9.md
>>>
>>> For H.264:
>>>
>>> Only the main set was used on both platforms
>>>
>>> On Venus pass 126/135
>>> On Iris  pass 78/135
>>
>> This sounds a little bad..
> 
> I'd let Vikash comment here, we were promised feature parity for Venus /
> Iris drivers before accepting the latter one.
> 
> The list of tests passing for Venus, but failing for Iris:
> 
>> |BA3_SVA_C|✔️|

This need to be checked. Similar failure was seen in SM8550 due to 
unssuported profile V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED.

> < |cabac_mot_fld0_full|✔️|
> < |cabac_mot_mbaff0_full|✔️|
> < |cabac_mot_picaff0_full|✔️|
> < |CAFI1_SVA_C|✔️|
> < |CAMA1_Sony_C|✔️|
> < |cama1_vtc_c|✔️|
> < |cama2_vtc_b|✔️|
> < |cama3_vtc_b|✔️|
> < |CAMACI3_Sony_C|✔️|
> < |CAMASL3_Sony_B|✔️|
> < |CAMP_MOT_MBAFF_L30|✔️|
> < |CAMP_MOT_MBAFF_L31|✔️|
> < |CANLMA2_Sony_C|✔️|
> < |CANLMA3_Sony_C|✔️|
> < |cavlc_mot_fld0_full_B|✔️|
> < |cavlc_mot_mbaff0_full_B|✔️|
> < |cavlc_mot_picaff0_full_B|✔️|
> < |CVCANLMA2_Sony_C|✔️|
> < |CVFI1_Sony_D|✔️|
> < |CVFI1_SVA_C|✔️|
> < |CVFI2_Sony_H|✔️|
> < |CVFI2_SVA_C|✔️|
> < |CVMA1_Sony_D|✔️|
> < |CVMAPAQP3_Sony_E|✔️|
> < |CVMAQP2_Sony_G|✔️|
> < |CVMAQP3_Sony_D|✔️|
> < |CVMP_MOT_FLD_L30_B|✔️|
> < |CVMP_MOT_FRM_L31_B|✔️|
> < |CVNLFI1_Sony_C|✔️|
> < |CVNLFI2_Sony_H|✔️|
> < |FI1_Sony_E|✔️|
> < |MR9_BT_B|✔️|
> < |Sharp_MP_Field_1_B|✔️|
> < |Sharp_MP_Field_2_B|✔️|
> < |Sharp_MP_Field_3_B|✔️|
> < |Sharp_MP_PAFF_1r2|✔️|
> < |Sharp_MP_PAFF_2r|✔️|

Above tests are related to interlace support. As of now, interlace 
support is not there in iris driver, as it is gradually evolving w.r.t 
enabling available hardware codecs.

> 
> 
>>
>> [...]
>>
>>> For Venus several tests crash the firmware or crash the device,
>>> so test-suite was executed with extra:
>>
>> But this sounds way way worse
>>
>> [...]
>>
>>> For H.265:
>>>
>>> Only the main set was used on both platforms
>>>
>>> On Venus pass 135/147
>>> On Iris  pass 133/147
>>
>> [...]
>>
>>> For VP9 codec:
>>>
>>> On Venus pass 174/311
>>> On Iris  pass 232/311
>>
>> These two give me hope..
>>
>> Ultimately, I think it's the right thing to do, if only to prevent the
>> crashes you've described..
> 
> Yep.
> 

Regards,
Vikash

