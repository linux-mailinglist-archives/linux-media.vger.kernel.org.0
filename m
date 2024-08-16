Return-Path: <linux-media+bounces-16392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01471954ACE
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 15:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 342071C23AC0
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 13:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6D81B9B27;
	Fri, 16 Aug 2024 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AgUwsk0q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECCB1B8E82;
	Fri, 16 Aug 2024 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813933; cv=none; b=Xg2HLaMW4mjR1CKw2cTLRp032ZSFoQcgZiiT5JdInISEKTTcXJ5CleutTl7nhZ9kbuN2aeTp4wCc7SXBhV3Zwr/jDwUcMb7s9KCj5oUWQGtl//k19uVDsIGA0APp/JrRLQrA6Gg1fm3S7oRJEPk7wBPOZCZWM4qGGJ8uhQPtS7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813933; c=relaxed/simple;
	bh=f3VvW1x9AE8zbPOdYZnaqga15xc4NxDPHHCmwpRbllA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hJRtZpWpJFGrCLy9iYAxK7sj/q6gq5zhd+4o8ujTBNYYht5V16ebZHMouUuDwRaJWo9V1RSMUZKQcm8pWYGWm6kbIRJnf9cgPK3+M+Iq+d9WLQpSrqZe65JuRirZbGGoEOtwiibx8rHDHezmociVVdQtQEyAwFK7XFb0Ee7QP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AgUwsk0q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G5n2RL028234;
	Fri, 16 Aug 2024 13:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1qXgCrutNGRZ0TbpRAmVik7WzTuMnv8lm77fOufMS0=; b=AgUwsk0qYoxg2Xf8
	SgusJCAgZU50oiossuKzgZtF68b82dSkyLWRzacYFAQWnE+vpWFkadSKQ7R+v7w2
	l2uMruGJHz5H3F71WZvcl8yPb4dVwnKfdBcux3TSWPdtjNKQSB4S9Vvsbk1xuiv3
	yDgz5eWmu197wK8sQPPFjDWE2rqFZfiqa0wnc1nkjb/odpUqh9snWWjeWswPlh4P
	SoaNthfYsGGsCucac06uClDCZutjzw0AMh3xZzPPbUhH/qQ7LbrJKUuwUHF6w+sh
	FF+aJSftb9cJ8zlBrPqgmI2WRkCyUl6LikQuS68bcWNWDV8t6qZY+dXPcBrytCHa
	EkJ+Iw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4103wsae6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 13:12:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GDC5ht009685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 13:12:05 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 06:12:00 -0700
Message-ID: <26504f16-2633-4607-92e5-d01363b85d57@quicinc.com>
Date: Fri, 16 Aug 2024 21:11:58 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
 <9c254643-2d95-43c5-98c5-cc6f2866213b@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <9c254643-2d95-43c5-98c5-cc6f2866213b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kwZAyeVd9HiQbOfEMYUBFdK6Nw75MJxK
X-Proofpoint-ORIG-GUID: kwZAyeVd9HiQbOfEMYUBFdK6Nw75MJxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_05,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=938 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160096

Hi Bryan,

On 8/16/2024 7:34 PM, Bryan O'Donoghue wrote:
> 
> Just noticed this too.
> 
> You're configuring the CSID routing here for each enabled VC but, you 
> should only do that once @ the top level
> 
> ->
> 
> 
>      __csid_configure_top(csid);
> 
>      /* Loop through all enabled VCs and configure stream for each */
>      for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>          if (csid->phy.en_vc & BIT(i)) {
>              __csid_configure_rdi_stream(csid, enable, i);
>              __csid_configure_rx(csid, &csid->phy, i);
>              __csid_ctrl_rdi(csid, enable, i);
>          }
> 

Yes, you are right, will move configure_top out of the for loop.

Thanks,
Depeng


