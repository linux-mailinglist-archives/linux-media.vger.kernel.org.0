Return-Path: <linux-media+bounces-16476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26300956B83
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 15:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 188871C22251
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A7616C68F;
	Mon, 19 Aug 2024 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U9kV81PN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B3116A36E;
	Mon, 19 Aug 2024 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724072880; cv=none; b=qSFvofLkCrdbBcEur6e3zpSzCSog/jPvmmKOoCa3g8sNnvbu3VYOGIkmZ+N16stuSjNlC7nTPfGqdTJyy/QMrAtrM6axzjlenQr9gMvnj6NeAxlFFI4nNHmvri5pzUhpTeDncGG2fwXKNI8ehxNd/AwhjgkaDnvbAMk+yGZaRhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724072880; c=relaxed/simple;
	bh=2xqEHdOFiBcXyf6be6DUXlm93FRag2QMLOmGqWjxMNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CNEUUGnN7xz04JdBylEPEJd45qlnq31PU4p2M9TOk6CU9aFAn1JrmnOss9q0vPJ3yMmJeNalQYSUAZJ/QmDq1Eyb8/Fww1EE2RdO+PGG+Y4gJyUQO418jogKrTMzHiMYkM8H7lf7/Z7CE3R2276OQqBa4UuBPb8vAMVcGWtk0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U9kV81PN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JCLFbB032745;
	Mon, 19 Aug 2024 13:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAl+8aYYFCb3rvVJ1ZBeK55OJUfaICaKouVC58gy11Q=; b=U9kV81PNYKzU+/Fu
	aUI69R8ctAhkROnXk9WmlA651iqkzk5bD7pyJcdDgAi8vFXhwM/t8p/5xJAo1QZF
	OL83Ub/36DHtLn2w963jXWi+URR/ThUq1f3Y90l5S12t5A/LRr4DwKH5LKITg4Le
	HwDshIYzJuvKcJYK/eN03FByef+/v3jBubdEqYLS8McH2ZY0OVEMgO9NAghzU2Md
	Ja03DiVwJ/lCAaBMQvcFm7HcSQQHWxCcZU7lrE6W26dvz9fpP9Ny1lWC2rCL6dd6
	z+VWSjnO8tJMSpi+iD62I8W2xB+YC0BZiaYeWjzhJQwN8QvkrBAG6vR/G404VcTr
	uWrXIg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4145yw82yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 13:07:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JD7r93005563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 13:07:53 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 Aug
 2024 06:07:47 -0700
Message-ID: <60d737b2-4ae6-42aa-abc3-5843dde7f7b2@quicinc.com>
Date: Mon, 19 Aug 2024 21:07:45 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <eba83b14-e704-464a-b4c4-19322e70d177@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <eba83b14-e704-464a-b4c4-19322e70d177@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DowNTWabrozRQLTz_kvGMfo4fehWnBvO
X-Proofpoint-GUID: DowNTWabrozRQLTz_kvGMfo4fehWnBvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_11,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408190088

Hi Bryan,


On 8/19/2024 7:05 PM, Bryan O'Donoghue wrote:
> On 12/08/2024 15:41, Depeng Shao wrote:
>> +#define VFE_BUS_WM_CFG(n)        (BUS_REG_BASE + 0x200 + (n) * 0x100)
> 
> <snip>
> 
>> +#define RDI_WM(n)            ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
>> +
>> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct 
>> vfe_line *line)
>> +{
>> +    struct v4l2_pix_format_mplane *pix =
>> +        &line->video_out.active_fmt.fmt.pix_mp;
>> +
>> +    wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> 
> OK so one more point here.
> 
> The non-lite VFE has I think in the case of sm8550 twenty seven 
> different bus clients.
> 
> The above code takes a given index - take the example of index 0 meaning 
> RDI0 and
> 
> 1. Determines if is_lite() is true deriving a jump of 0 or 0x17
> 2. Uses this index as a further offset to functions such as
>     VFE_BUS_WM_CFG(n)
> 3. In no way articulates which bus client is which.
> 
> So for a non lite case -> RDI0 is bus client # 23
> 
> The code we have for CAMSS just assumes RDI is the only client we are 
> programming - which I'm not proposing to change for now, however the 
> code is very not obvious in what it is doing here.
> 
> This BTW isn't a criticism of what you've done here but, even though I 
> have access to the registers in front of me, I had to spend about 30 
> minutes looking up and verifying these offsets.
> 
> That's not sustainable.
> 
> Could you please add a comment which details what each index relates to.
> 
> /*
>   * Bus client mapping
>   *
>   * 0 = VID_Y ?
>   * 1 = VID_C
>   * .. etc
>   * .. etc
>   * 23 = RDI0
>   * 24 = RDI1
>   */
> 
> I'll try to apply a similar level of index documentation for existing 
> upstream submissions so that working out client mappings is less tedious 
> and will be requiring these mappings for new VFE silicon enabling code 
> upstream.
> 

Sure, I will add the comment for the bus client mapping in next version 
patch.

But the comment will occupy too many lines, I will fold the comment, e.g.,

/*
  * Bus client mapping
  *
  * Full VFE:
  * 0 = VID_Y, 1 = VID_C, 2 = VID 4:1, 3 = VID 16:1, 4 = DISP Y, 5 = 
DISP C, 6 = DISP 4:1,
  * 7 = DISP 16:1, 8 = FD_Y, 9 = FD_C, ...
  * ...
  * 23 = RDI0, 24 = RDI1, 25 = RDI2, 26 = LTM STATS
  *
  * VFE LITE:
  * 0 = RDI0, 1 = RDI1, 2 = RDI3, 4 = RDI4
  */

Since the full VFE has many ports, can we just add comment for the RDI 
client?


Thanks,
Depeng


