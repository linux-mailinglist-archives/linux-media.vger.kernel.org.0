Return-Path: <linux-media+bounces-24872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53651A14B4E
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 09:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C07D1188BD70
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 08:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04851F91D7;
	Fri, 17 Jan 2025 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oel8crqH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D21F791B;
	Fri, 17 Jan 2025 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737103190; cv=none; b=DiTdLvY/+0631ydIp5Tr1n0kd9NTEMq/2Q+NZPgsjvAMp3rpC2eiH600cnw7T8e8+rjtpGFfLtiuGFmxP8KnKiitZRi2VXW5eSnZ3q3C2BZ292+yk/2t/qJMZAmon2Fqj0lNiq+7bq45hl7TQ2cA1PeZdGRk+vCIffRAUCMAkQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737103190; c=relaxed/simple;
	bh=RmI/SvTohP+pfTEfaWJxFe1M7/+Gp3uh0nXTvWxppX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EeXlbTmJi4v+tnUSUnaacD0VGYY5xrPTpTOjbK7RJas7zzZxXo59oK31Ra/0+RCr5OZ5xtUSh0923OLYF5uglDA32T/Y1nAglYnEvlGAJO2ja5O+zjZM3yYE3YPW54EnkJttoTQxOnaLt1MeSxoDPO+o9xvInx1CZ/HC/vl3Kys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oel8crqH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H2kKwV022665;
	Fri, 17 Jan 2025 08:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5g8BF3IbtjnjhhJuU0EXM1c5dpi4a1gzVPV+T8iKvho=; b=oel8crqHjKoX4Om7
	kKbmt7TH3COhdsJoCgkF0vIrtNiF/C/Up8oHQZgHJhYZ1Cqb+aWQhuLB5SI00naq
	pXevLN8L3K5W2kMP9i5VVI9qYJSD6recl9I8I0u0UIoL11FlfH59+8Ig+LjTERQ/
	ioZ1JnFriHamyVrtRNR7IAjHC8iP+C25Y1mTOtbnniH+y5BwxGjyluQ8+bdqMI6U
	/aBLfIYCnC6b6fUadISmMc814ZQPN6/8z1XC6T5RYXAzheo48HjIkejn0ZEcCT2+
	Oeh3MUEXcIGYSxf22uLX05H7YAsGOu8hjc9wCKYQVdSL5MxE5bjv9kUtCLkIrIex
	VsszbQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447eq30rmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 08:39:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H8dhu5000706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 08:39:43 GMT
Received: from [10.216.55.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 00:39:40 -0800
Message-ID: <7a782ea9-f227-4f46-a757-b4b69f5c287f@quicinc.com>
Date: Fri, 17 Jan 2025 14:09:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-2-9d0dd4594cb4@quicinc.com>
 <2b0528f5-f9fa-4cfd-abda-a0e95ba4a2f1@linaro.org>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <2b0528f5-f9fa-4cfd-abda-a0e95ba4a2f1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f6KKJobMGCSswGsA6MNgxz21IVTQhjWA
X-Proofpoint-ORIG-GUID: f6KKJobMGCSswGsA6MNgxz21IVTQhjWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170068

Hi Bryan,

On 1/6/2025 5:36 AM, Bryan O'Donoghue wrote:
> On 04/01/2025 05:41, Vedang Nagar wrote:
>> num_properties_changed is being read from the message queue but is
>> not validated. Value can be corrupted from the firmware leading to
>> OOB read access issues. Add fix to read the size of the packets as
>> well and crosscheck before reading from the packet.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Please see Vikash's series on this.
> 
> https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-2-483ae0a464b8@quicinc.com/
> 
> it seems to have exactly the same patch title ?
> 
> Is this patch supposed to be a follow-up to that patch ?
> 
> https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com/
> 
> Expecting to see a V3 of the above. If the intention is to supersede that patch or some of those patches you should make clear here.
No, this is a different series having OOB fixes similar to ones posted by Vikash.
> 
> On the switch statement I'd have two comments.
> 
> #1 is everything really a " -= sizeof(u32)" ?
Yes, it's everytime " -= sizeof(u32) " since the first the first word read is ptype of size u32
> #2 if so then this ought to be factored out into a function
>    => functional decomposition
Sure, will fix this with decomposition into functions.

Regards,
Vedang Nagar
> 
> ---
> bod


