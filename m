Return-Path: <linux-media+bounces-16297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC49F951B83
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 15:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E3542835CF
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE261B1432;
	Wed, 14 Aug 2024 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U5AA8Gfs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E1379D2;
	Wed, 14 Aug 2024 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723641045; cv=none; b=mf1mCnoPzScvuw2R/4wVaORzsv0EoYinKlsRlAIkYOGhEdBD07bHLqihcKV/Licic3uMKe6exRBMIp+sfyyUXJDfW7qoembF5barsOSTpuj3l6QweONW/7BRqE7dx/TwwNuEwgCUPai4PmDNUCCsScXCY7gJIyzCRraTT+YbxC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723641045; c=relaxed/simple;
	bh=1GoOA8QWM8i82xflr5xmRl5nx8C8ZuRAGjx4nt9xxNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IGDScraF2iNiYVvayQg4BHPe5ZqXb9ki83MAGf7mSh/bVx0Sw5NuePY6oB4T0n+5tm10dPPl4gJfILiw3n8xf8tC23q+pjtkJRgwP67dSftj6jnsRDYSttmcqa3NDDnY4Zkp6n6TBd7lOxn1+Ky8IeKimyedZh49LCeXsxbqfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U5AA8Gfs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EAwMFc005305;
	Wed, 14 Aug 2024 13:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDLVA4hth+atsd73LRIJBgxs3WHzfN9AwCIqrlyfJ3k=; b=U5AA8GfsDWpPZHFq
	rg+nHFci3HXsw5eVzXYYYLUM4yyhrIvoqf5U4cwBFVCxFb4ZZypsaKt5LeAnLwDc
	rok1wutbT+eZgTXseUjsAwsbaxqtCGQNdynWx1hHL2PT5Nj4tpF3ev4aiKFNm9xF
	CPs59Ms/QJyDr/YXOmSxq3GCXeljGe6JVpw6RdAXESxPSKUaj48V+i+KovI74K3E
	rWYKZJLHjA2pcBXQH4maoKDd0O0hEokmV6pNza/bWCz+qWxONYXvZo3dV1L6EWtJ
	NtO80wc2JOOINn4XpkgDevZAjmXsI3kiuDy9DzjQ4geDokyTVYsEem9lehduvdrn
	UisD5g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40yxwv57um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 13:10:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EDAbB5016025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 13:10:37 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 06:10:31 -0700
Message-ID: <2de0b7a8-b879-49e9-9656-ec86f29ce559@quicinc.com>
Date: Wed, 14 Aug 2024 21:10:29 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <4b745c1a-33d9-472a-97af-153a2a7c8721@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <4b745c1a-33d9-472a-97af-153a2a7c8721@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5W4dV9LCLCp-ZAfgsY5hH5aAACWRAxAO
X-Proofpoint-ORIG-GUID: 5W4dV9LCLCp-ZAfgsY5hH5aAACWRAxAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_09,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140092

Hi Vladimir,

On 8/14/2024 7:13 PM, Vladimir Zapolskiy wrote:
> Hi Depeng,
> 
> please find a few review comments, all asked changes are non-functional.
> 

>> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, 
>> bool is_clear)
> 
> Please let it be just a declarative 'clear' instead of questioning 
> 'is_clear'.
> 
>> +{
>> +    struct csid_device *csid;
>> +
>> +    if (hw_id < camss->res->csid_num) {
>> +        csid = &(camss->csid[hw_id]);
>> +
>> +        csid->res->hw_ops->reg_update(csid, port_id, is_clear);
>> +    }
>> +}
>> +
> 
> Please add the new exported function camss_reg_update() in a separate
> preceding commit.
> 
>>   void camss_buf_done(struct camss *camss, int hw_id, int port_id)
>>   {
>>       struct vfe_device *vfe;

Thanks for your comments, I will address them in new series.

But I have some concern about above comment, you want to add a separate 
commit for camss_reg_update, maybe camss_buf_done also need to do this, 
but I guess I will get new comments from Krzysztof if I make a separate 
change, Krzysztof posted few comments in v3 series, he asked, "must 
organize your patches in logical junks" and the code must have a user.

Please check below comments.

https://lore.kernel.org/all/e1b298df-05da-4881-a628-149a8a625544@kernel.org/

https://lore.kernel.org/all/d0f8b72d-4355-43cd-a5f9-c44aab8147e5@kernel.org/


Or I don't add reg update and buf done functionality in 
camss-csid-gen3.c and camss-vfe-780.c firstly, then add them in a later 
commit.

Could you please comment on whether this is acceptable? Please also help 
to common on if one commit to add them or need two separate commits, one 
is for reg update and the other one is for buf done.


Thanks,
Depeng

