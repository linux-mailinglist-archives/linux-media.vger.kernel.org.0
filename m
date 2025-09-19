Return-Path: <linux-media+bounces-42803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FD9B89C54
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 16:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D613F5A16DB
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 14:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C775255F52;
	Fri, 19 Sep 2025 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGxSeqpS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB29D2405ED
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290439; cv=none; b=JiPVLZtePmsL+hYZhfdDKp9dGattTrNxvt3N503OEHyVpTtCimNd0Va0CPIYY2IUjErZPXSoqKahxl96YpyU34wx1fKULK9gHkGKbTOOinTtbNLU6FDkywP25e+ScWymBYj1RS31m5ZzXRJkHOk1rFzGi75bHdbEgTo0DUfalNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290439; c=relaxed/simple;
	bh=s+x6YRVA3rP2U+0OWL3dZKVfEgPXTUVuxhw8PdG1p7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/xPpgJUBpk6R5DHPlScgEZAqO4FeqoxIDPxEFSd9FUPHbaWUMBdYHGiByqBHYqfJ7VWW5Pv5xSnDWSMwjDYeVvDbAmTKm+oHbtrkimW7vB8MB5nFj6f/gO7Ia0ZWvpZtIY1O/FKTVsS+eEhfmTti78UlxJRI5C7klihsWG+tZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGxSeqpS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J5wLGK009918
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 14:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7EIANb89BEomf1uEkm62rAj8
	IzdbVNBDry3TfdecrUM=; b=fGxSeqpS6zzRfyopulFiN0+AViqQKn3QQdLuREIL
	ExHu8BU8p74k4tWb1IxOHXfHGu8T51wjbUVMgod/8PzwPf7QLzYQ/9oMQSlo4Ohf
	sTXwdxlEzLIfIYWIc9jXNaLeJOFGOeGeGOrd2IJtnylix5IDnpqkGS9ZQZvm7CKd
	FaOdvE7e5FrAIwFSPx8MVZqpjCORnDqH343dtAfOIG5OJaDZwJq+GE9anU3Pjg8f
	+/XtBI2DpuMUpi4F4x8cxZgjIE4cipUg3gywAHHUpbi/rlKemaHe129WbVf0YZFa
	WpvkvrmLSWbdVheJm1HwsSFRWWpTiWM4VXd58jcbHrMYDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498q9db3t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 14:00:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-82968fe9e8cso570361785a.0
        for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 07:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290435; x=1758895235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EIANb89BEomf1uEkm62rAj8IzdbVNBDry3TfdecrUM=;
        b=wSzuhcX1YlNY8fyTQBJpGp3yAKLuOB2T6bKGXQHhg2iaihC9ZUA5Xa3ShODDnMXGg1
         eKNSpVYYuRsYZX8KXpFpBmwl6DpaHG4guM4NUupwCy0Jc7NxVtSJ/49OuNfl3hS2eFXE
         c+Uwb2hICJSQwRQ+9gU7Yh83daNLpAwRzGTSH9AWR7JcvUazC2qu+K+0zkcJilcXYH0T
         mhr4XSkCJBzFJLX8OUyOOwDKhkye2UkFCfzG31UuifEwxMm+h/J8FI6FsCRgs1TBtQjN
         fg9Nj+oG1CHh9ojOKSbfJ4BtWhqBrCo4QQSVkAoHOTfEDpjY2CeUlB1ot7JOhFtlUES3
         7BKw==
X-Forwarded-Encrypted: i=1; AJvYcCWQVdnT0vjqQhOlsnXZHaL5pvIn5irUH3ZGnOguTsPFZ8KUE5D+TMKZNdd/KF/5K8rM77qGmKMGhrXcjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhJi7rXUz1nPPP6lV7GEQaR1uIha8oVVz7jOSb/xbRoYbZYyw
	M0cej85Gbh3a+H+XxlAsJ4I+HAJGGA0JMYQNItXUIq8j18xNLYMAvRqZ2o6DCO5X6Q5PmS9Pch3
	J6Sd9XWveSs3LLqH0Fu5wSytIVxbePBiQQT+1Ax9EIM63Fpo3dM4cRyaMf02Fej1j1A==
X-Gm-Gg: ASbGnctjEP1eLx/o7k6mRXa3nH6slkaevekoevmZ3vbL9CsnuRLisinqqEPU5AKB5dj
	vOiQIUK/b/uj99Qug339WDzcQOKJQauaPd5yG5eLmqvf8FILZdU/6QVDqFjlPIBYHlPpOBwm4d7
	h38Hw9lxAxBAMFZYe6prX2UwPKfujUH+kRw8URpuC4wfpgRU5FPsxa8W4FhC9Wk61IQh7Ah44UB
	a443taSvjrbngdWsS4S6/Fs5qw1/KhDXNkFzK1nWb3CPRmt95U5zIpokbwbAahZnNURJifcL+w5
	FdDYLLp3KIwxi9Xq3fDUuyLsjZ/CtoWyIgm2MYePzGOSGxOZXD5U/wUaJtXekSxvl6ujaI0S9bk
	pwV7xW2JsOlMf+Fa7JlIxVlsjMlO8Vis6nj/QvRGaUY61L7m5D3m8
X-Received: by 2002:ad4:5c44:0:b0:796:db6:98cc with SMTP id 6a1803df08f44-79910ca57ffmr42013296d6.7.1758290434689;
        Fri, 19 Sep 2025 07:00:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJBm79dzokCKz3md6LUMuAK6nuYOgnP/+aPf8gv/Il1JnuRVh7uTmi1AvDr4P46BH80v9Hgg==
X-Received: by 2002:ad4:5c44:0:b0:796:db6:98cc with SMTP id 6a1803df08f44-79910ca57ffmr42008896d6.7.1758290431759;
        Fri, 19 Sep 2025 07:00:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5793b1a828esm1077242e87.115.2025.09.19.07.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:00:30 -0700 (PDT)
Date: Fri, 19 Sep 2025 17:00:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
X-Authority-Analysis: v=2.4 cv=YsAPR5YX c=1 sm=1 tr=0 ts=68cd6204 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=NEAV23lmAAAA:8 a=4MwoUhHJQoa0W9kE-8QA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: N4OzWGWhJguUIG0bsRtl810bwsFFbV65
X-Proofpoint-ORIG-GUID: N4OzWGWhJguUIG0bsRtl810bwsFFbV65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDE2MyBTYWx0ZWRfX9+5+bMB8rmXg
 AZvyiBGGmGZXkJIkZp3RB5NrnTvR4QLeHkZq+XKuDM/WYGuaIgoPI3eGJfSshqBn+KiQZ0DbaHA
 WHliu6EP3q6E11qHZhXAKkvWkA/UUUvI0yebv+XzwRb3m3ySKWIePwwdy7i93yB8s4fA0ZBQSzi
 EbnR6HQKJITeZWt//kWVB1Lfbed9CmuPCul6IZTZ0PEGQ867UZf1yeiA8x8qGnaOl1Dfs3kTHtB
 Mh62Bkl1qJx7aRwVeVmp8BN6Ehl9q5/Pyj67yQqISESX4XTtD856arI3lTltBhByO/Bs40/7X/x
 VuOxeOnCp9UB7LtiwU77P9XUDEseCQ7+ar15cfJusRkgpt+N+8VVKw/lGECnUZvfsbKDE+2Bqj5
 c6FS9os3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180163

On Fri, Sep 19, 2025 at 12:26:03PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/18/2025 5:47 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>>>>>>>
> >>>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>>>>>>>
> >>>>>>>> are available in the Git repository at:
> >>>>>>>>
> >>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>>>> video-fw-qcm6490-update
> >>>>>>>>
> >>>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>>>>>>>
> >>>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >>>>>>>> +0530)
> >>>>>>>
> >>>>>>> From the commit log:
> >>>>>>>
> >>>>>>>> Fix the firmware binary name to reflect the correct sectool being used
> >>>>>>>> for signing. Also update the version to add some recent fixes.
> >>>>>>>
> >>>>>>> Using different sectoosl isn't a determining factor. It's the security
> >>>>>>> profile and thus different MBN header versions.
> >>>>>>>
> >>>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
> >>>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> >>>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
> >>>>>>
> >>>>>> its the same case here, qcm6490 also required MBN header v6.
> >>>>>
> >>>>> But why do we need to mention that it's v6?
> >>>>
> >>>> we need this to be able to distinguish from the firmware binaries which
> >>>> doesn't need v6 header, we are following the same for other SOCs as well.
> >>>
> >>> Do we have anything to distinguish from?
> >>
> >> As of now, we don't. But in future if a new firmware is needed for the same
> >> hardware generation which doesn't need MBN header v6, how would be distinguish?
> >>
> >> So either we keep the name with _v6 now or change it later when a new
> >> firmware is uploaded which doesn't need v6.
> >>
> >>>
> >>>>>>> Last, but not least, is this firmware used at all? The venus driver uses
> >>>>>>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
> >>>>>>
> >>>>>> its used here
> >>>>>> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
> >>>>>
> >>>>> Hmm, why is it using a firmware file different from the upstream venus
> >>>>> driver?
> >>>>>
> >>>>
> >>>> qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.
> >>>
> >>> This doesn't make sense, QCM6490 and SC7280 are the same thing.
> >>
> >> yes, they are same hardware, while it is one of those fortunate hardware
> >> generation which have the implementation in both gen1 and gen2 firmware
> >> interfaces. Board qcm6490 enables video with gen2 variant, while sc7280
> >> uses gen1.
> > 
> > What does it mean? There is no board-level difference nor SoC-level
> > difference.
> > 
> >> Given that they are same hardware, we use the same bindings.
> > 
> > Now consider the OEM having the fused device and OEM-signed binary. How
> > would it work? Will venus work if it's a gen2 firmware? No. Will your
> > driver work if it's gen1 firmware? Also no. You can't randomly change
> > the firmware interface in the middle of the platform lifecycle without
> > providing a back-compatibiltiy.
> 
> I understand your concern. To clarify, we are not removing support for the
> existing Gen1 firmware, so backward compatibility remains intact.
> 
> We are simply adding support for Gen2 firmware for this architecture. As a
> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
> Gen2 firmware (via Qualcomm's video driver [1]).
> 
> Additionally, as part of our plan to transition all Venus-supported targets
> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
> to maintain backward compatibility.

Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
interchangeable for the hardware they both support, until the venus
driver drops support for V6 hardware. At that point it's expected that
there will be no V6 support in Venus driver.

You can not simply upgrade to Gen2 firmware as if nothing happened.
Consider a device node on SC7280 / QCS6490 with the firmware-name
pointing to OEM-signed firmware. Both Venus and Iris drivers would
happily consume the device node and try to work with it. One will work,
another one will fail. This is definitely not what we have agreed upon,
when you started adding Iris driver.

> 
> [1]: https://github.com/qualcomm-linux/video-driver
> 
> Thanks,
> Dikshita
> > 

-- 
With best wishes
Dmitry

