Return-Path: <linux-media+bounces-16345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E9C953456
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 16:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882571F29299
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 14:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293B51ABEDC;
	Thu, 15 Aug 2024 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RL6Yv0zX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47C919F473;
	Thu, 15 Aug 2024 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723731879; cv=none; b=gqR4b7lv3sNywSLOKYc2ZGCTxuOR/YiCibovOiSnLv6rSk6IEpmfKmHupWvJCAo9ZK2NB3ue7ehoBWfcZV/BIxWTlVker7+MtxBVbizHcSzPUTDIJ8YiqKxiiRP2EJGoLqge9io5nmeQ7zNCmc3W/QCl4cReB3HoJJrDur20Prg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723731879; c=relaxed/simple;
	bh=cE18OWNgSDCuLxpDUVFjwNKQqYPgAUOzSh0r/G2Xd5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P469EE4O2bLnGUg83ACFJLX1oCVvFjNOt5ytsvs4wu5JTrIZEgnnN8zdRgYFtNL9OetY0GEetFbgHaYw0gNc1FwhigaSbz99t5qP+mtv2BbpDz1meA/cMR5K+aFr1JZszntn3Sn9w9/EqhGmFbiRTBzOCLHPucPuWdsIADo4Tfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RL6Yv0zX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FB265L002207;
	Thu, 15 Aug 2024 14:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JKyMHexjW8mHunkV4x2xjpwj51aFu22HNL3RDXdjm7E=; b=RL6Yv0zXsOx3q0Zs
	b/dM4HBfvU6LgAR65HkaqD9Tw1wT/B+sJTocLWiXSMRhzhOKbTJ18dt9732oebpb
	SqYsO89MeTmH6bLXvCgyleO7nNc4ea5MOpTaoPbm+aZQIF2tQX0Gls3CubPOtfwv
	cp3ygthwjImKhUYOUATAkjwmqi7hZhjwWCLpQTjBgDMNP8j8UYVm1vLt/vKZr3Jw
	SEhiaSRZKfaQ2vs1ws68AU8g605q/4wxX15V93ISB8TQFpF086SP9YQN+Kk/0GLV
	wCu4Dy3TB5ZMUUkw1eiV89rgdbyJN2GJr3L/8oY0E0Li4PgdG/m7PY4fm/6ydmx0
	EitAqA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4112r3t5ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 14:24:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47FEOVps019575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 14:24:31 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 07:24:25 -0700
Message-ID: <9f06450f-70a8-4ece-8b67-1b0695fbf414@quicinc.com>
Date: Thu, 15 Aug 2024 22:24:23 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <b31f175e-4171-491f-9203-8186a84ab712@nexus-software.ie>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <b31f175e-4171-491f-9203-8186a84ab712@nexus-software.ie>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ApBaGQrka866zN899C4pDLNfsv0SDCMx
X-Proofpoint-ORIG-GUID: ApBaGQrka866zN899C4pDLNfsv0SDCMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_07,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408150104

Hi Bryan,

>> +
>> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>> +                    enum vfe_line_id line_id)
>> +{
>> +    int port_id = line_id;
>> +
>> +    /* RUP(register update) registers has beem moved to CSID in Titan 
>> 780.
>> +     * Notify the event of trigger RUP clear.
>> +     */
>> +    camss_reg_update(vfe->camss, vfe->id, port_id, true);
>> +}
> 
> Hmm, so another thought here.
> 
> camss_reg_update() is not an accurate name -> camss_rup_update() because 
> in this case we only update the RUP register, not the AUP or MUP.
> 
> reg is an abbreviation for register - but RUP has a defined meaning in 
> the camera namespace i.e. RUP = register update and its job is to latch 
> shadow registers to real registers.
> 
> camss_rup_update() please.
> 

Yes, you are right, the rup_update is reasonable, I will update it in 
next version patch.

Thanks,
Depeng


