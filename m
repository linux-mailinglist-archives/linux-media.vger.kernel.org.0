Return-Path: <linux-media+bounces-42335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C92B5331F
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F4E75A52A0
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D70E324B16;
	Thu, 11 Sep 2025 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DX1rhjO4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E623324B12
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595813; cv=none; b=E7J+u46tEEO8kZNHKdd6jjfxxVPbjAPnKSUhFd+Kz3h6ihqJCFxiiVYgu3uXsGBVJtq+Y7iX62rBMcEzgWAcs1CczHf2JgE2HD1OmtUgW+WeaXQae3hSB03rigj+vV1JZHEjdyuqE/ySLL8vd4egIUOuLsnlclPiFwbwh8YJ7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595813; c=relaxed/simple;
	bh=Py4v1guUTScG0vHotSUHA5Z/oQu7Z3EeobDMJ3o3oKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuX2AtOnqTJ9fdCwLIxLs8zHXt6QMxrK+ll0NOq7ZildK/bGZUVViS6/q/uMxFzb7A5JMKKYKti2dEj4WGHHj1moglUYmpHPLmH5m/vGJtDpFS8QkxROcOfg/o4LP/Qj6n7DVs7EM3X/G+gjxGRBRRv9I3BM6a5ziLHKdzBqGPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DX1rhjO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8VNDk002787
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TiH2ZKjnLM++Cw9wXPbgBqAvgKW59I/imntpSO2OVc=; b=DX1rhjO4qW5LD3Lj
	xLFCy7IN0NjCF1DMLY21jE9O+6EqCosul89a5kC0A7ZjkRHqCe3cl0wPl1sxjx6P
	vb5eKn/e7bmF6l10N4VHzgIhvgJmTHAg4kSN5t3K7lhiHzeNLYtzooWAi2Q5Gu0Z
	DqaoMBNjDK/Jxn5+54LdpbzJCA8iRcLEYGqnVTWojTGY7uqh3SJjs96+HNAHECzk
	khM9p7Z5d4BQxCGqgyrHoWxAsT7L9xpXT9Tho3t70j3w8X5dOjbgCP6aC2WZ9c7Q
	c8bw07+3fNzVNlS7aA/BAMF5n+6flBGOrO029BkW4MDsV9UhSYB6wAYw4wEbjoC7
	xqH52w==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493tyxrt04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 13:03:31 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-406f47faa7cso11938705ab.1
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 06:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595810; x=1758200610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TiH2ZKjnLM++Cw9wXPbgBqAvgKW59I/imntpSO2OVc=;
        b=cIuh7UgOA/QPv0RXg9Ia+U3p5Z7+b+3JDbn9esJHoLYCtKbTv4hcFiI0ZcrszGrmD/
         D+uHBG83zc3xM+eeVkKh84mCQLgf9nwF1F4gKHJeZO3Jmecyp7OwCx6fXDTLCWsQjpJk
         YEuyYKSEy5/EIF45WB1am9spfCxKFxr+IiB5F3sIervY2f194eioCIWSlTMS5Q4vAVSc
         X382ikHfn1NTwWrXeMZVy7JI7Un7Q9Y/+nhl3vU5j7ThKT15Yfj+rSg5GMFWpu1nICdN
         OiP+Zy1R/xDHJZsXKkJN73QWCbYH9Cd1klNiL5DBJkIByDX4kLVUoMQHctuvxnLSB2Om
         6C0g==
X-Forwarded-Encrypted: i=1; AJvYcCXssvapDzBbm9FVHiYGAOkbBCS75/MLhOR8Nn96I14XRhhVNg6Z5VVYMLlZiKRGBz3Z/Ab1/WPM5tpNYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAl9Wrq8m0qFUtO8BcKN4r0V1GG8JdjQgLPs0nHBZvbzOt671
	SxF1B/ii0sbcQxmjP81LfM0sD8OeP8/By7KPAERvEhT67nRmMRjbygPy74VnGGGcvOQiHAXE/Bp
	zwu6AZNaenHQvW32/vay/LuawqybOQlJjVHsPbo8GP751AYb5Asnuxk7DAq4oylLfIA==
X-Gm-Gg: ASbGncvTepmAjCPRsMSQWy20ld+VzcRZ+yIZeKuhmXq0N6UwIAib5Uv7vtG2hxe3PYy
	WL60vJjuzId2qeTjOsIDflXO18efvP7tTwTN5Tu0McOH2PojfkMkoARyUeUHv5UWGfy2nDjSfEU
	WD87GxfcB4VFedxY0RIdaMhczKehOmB4wLyo5lVsibr53V9Do2maV8Gu9nHC2s1gBM0aWMuwXP8
	xYp1XMxIuhzD4Ea6VkhmCJL3rKS3nw4122pZNi1YntHf2bYOukUAT1yCMXJMCNVsNYlnO+S0LZX
	XE0P9q4CejgTxL9JTVOaaLzeZnrsgm3ZyPUjrAgTU9Omo5ssjEtPTEmHV3bc9GMCLXRN5RY5cNW
	AH8/QKgk2Ml2nicDc0VoCwofd7iZFlJIAJgCWFsHyx2tqooASOt2G
X-Received: by 2002:a05:6e02:1608:b0:41d:5ef3:df2 with SMTP id e9e14a558f8ab-41d5ef30f0amr26828425ab.18.1757595809644;
        Thu, 11 Sep 2025 06:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ90goZe3T4OOiFo+85Q/4C7S07Ofj1OLJoHQ2FlrHY8mgdsyHXVlJIJfdlAHrxR9sWtFSUg==
X-Received: by 2002:a05:6e02:1608:b0:41d:5ef3:df2 with SMTP id e9e14a558f8ab-41d5ef30f0amr26827705ab.18.1757595809121;
        Thu, 11 Sep 2025 06:03:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b612csm422915e87.12.2025.09.11.06.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:03:28 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:03:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Message-ID: <gd7allvjkgbmqgc6pazq5o5u62tdkrogpf2r43vfkqfsptzybk@66i2def6aumf>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
 <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
 <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
 <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
X-Proofpoint-ORIG-GUID: MLJ-08YACIyTMu8SQaHq5fQX8WQgV0Fg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA3NCBTYWx0ZWRfX81X5o6FRG2UA
 2JBd3vbLyDYKZlWI6iie4avdiKWeFH5Z0bVbkeMxv/YLeaNJ4bpCHAe8c3KcvxzhL7J+fJfzr8A
 m22o3dN68nWq5K2V4gtuHbhx+tN1rrJv7Wzcrm3oZjqpusN5Fkiu6MwenVUsD2hndpcLQD6jfPm
 Jh81gaifw6XsdjCJxEqhrxL3dzZ9mXUUggDd043C7n6Jo1pEFPvOCDeijXheCXJvsLV8FjAKTnZ
 twGNmblQeUZpH4Z9jHjClHuaq+M7xGSu5iL1fSY2sgrRmI9fAjBafre5pz0DqZlELL/10o7ZI69
 d9cKnPzxkKdtSjA/odGt0DZOzLsCAU0LQjJI3RVxVXVNaJ8XuJopm8M5uYrWkw2Oc1ZwilZ+7fB
 2fhJOdDm
X-Authority-Analysis: v=2.4 cv=VZn3PEp9 c=1 sm=1 tr=0 ts=68c2c8a3 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=UxSgn0eRCaJVYZHEmbAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Ti5FldxQo0BAkOmdeC3H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MLJ-08YACIyTMu8SQaHq5fQX8WQgV0Fg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110074

On Thu, Sep 11, 2025 at 06:19:02PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 11-09-2025 15:38, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 02:49:59PM +0530, Nihal Kumar Gupta wrote:
> >>
> >> On 10-09-2025 12:33, Vikram Sharma wrote:
> >>> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
> >>>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
> >>>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
> >>>>>
> >>>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> >>>>> Camera reset is controlled through an I2C expander,
> >>>>> and power supply is managed via tlmm GPIO74.
> >>>> Why is done as an overlay? Is it a seprate mezzanine?
> >>> It’s not a separate mezzanine; monaco-evk does not come with an attached camera 
> >>> sensor by default.
> >>> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577 
> >>> on CSIPHY1)
> >>> That is why camera sensor is configured in monaco-evk-camera.dtso instead of 
> >>> modifying the base monaco-evk.dts.
> >>> Please suggest and alternative approach if you feel this is not correct
> >> Dmitry, Do you agree with this justification or you have a follow-up comment?
> >> Can we post v2 with the same change addressing other comments.
> > The previous email didn't land to the mailing list, I'm not sure why.
> > 
> > Anyway:
> > - What are other options that we might support? Having a single
> >   monaco-evk-camera overlay means that this is the only configuration
> >   that we plan to support.
> > 
> > - It all should have been described in the commit message. Please update
> >   it for the next revision.
> 
> Yes, We have planned to support device tree overlay of the IMX577 sensor via CSIPHY1 only.
> I'll update the commit message in v2

I'd still suggest monaco-evk-camera-imx577.dtso

-- 
With best wishes
Dmitry

