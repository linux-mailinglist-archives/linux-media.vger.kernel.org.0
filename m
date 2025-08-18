Return-Path: <linux-media+bounces-40093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA882B29AE8
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 471417AC187
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF68D27A448;
	Mon, 18 Aug 2025 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pSXVKunO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24CC2741A6;
	Mon, 18 Aug 2025 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502488; cv=none; b=U/eCX+IdOE4o1s/aiOzDwvittBs3vNFdZ8oMHpu8XaRNIYASkVK7NbhPki6DmABe1/QXkkI7ngCY5HYtmiM+KJgq9EdwOBEUhbt3el9eg/cGATCCKdbUhfNbDra9T/VIJHF2PqnqRbEx+J5gVLi3BS2ZucNyzoohNmZA/CjIaB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502488; c=relaxed/simple;
	bh=D1xR9NUKjLWiwEOBuqSdWmNAiAHh4XnYrjNR6fCEqOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LGwmN2b//m/sNodsOiaaT23KzinBxY2D9Atx91owRnDl0M1RX/dkAD0Vknrasmnq0KhYRKWL/ztOTynZZbFuCczjfyX7PfxSpuAYCmwLEDlj790ZbT7pRwXSse2W8i8+9dhK6+70hw6PvCKt7gWtSju2A0vc2YrJSFFXHK5acnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pSXVKunO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HNksXd021859;
	Mon, 18 Aug 2025 07:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtaJIV9A1fK0ZDpo7vfn/pN9IL+p7VXfGvYIk4fpo8Q=; b=pSXVKunOS36znFdF
	jVSI8bIQk81Gj0Z9+B+4eS4C/ZKoTHDDqt8f1CfzlJ9YpcxdnVSQDL9XOoAK/g9z
	w2u8QKF3yVQtPUg6Xzq84rWDj4+VzeJscUZ8ROMmeOX6+yUjVqGwcyHOjfWqdVck
	z4sWzCU6kW8Aet5zf4etVQ0a6LFm3Dg8HOnc0Y/kzfqZ19iZ5HxCGl2r/XRzxejl
	y7GhnBouYhu8XoDifoGR5UvlymNa3OKchhTFhaF1ZL3SKeYUvk+NxMhgKwCNwwOP
	pAbNl63yU+iUvYsUhUNcx6SLskuviAA3TYd8tPNg5UgdoPfVLQkaRzYpe2XK6BH9
	EFiLtA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagusvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 07:34:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I7YeGW009001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 07:34:40 GMT
Received: from [10.216.58.185] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 Aug
 2025 00:34:36 -0700
Message-ID: <48318ea6-4a61-303e-7b78-0f499fef8b61@quicinc.com>
Date: Mon, 18 Aug 2025 13:04:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 18/24] media: iris: Add support for G/S_PARM for
 encoder video device
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-18-c725ff673078@quicinc.com>
 <0bf7716e-38db-b101-408e-7bf293fe7593@quicinc.com>
 <307aabe2-cfef-8660-02b3-1892b61d5dc3@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <307aabe2-cfef-8660-02b3-1892b61d5dc3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a2d791 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=WXC7i5rnzuF-lB8cmwwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: dUy8y_4B8Lq5Dupd9V48wrQMUfW64sCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX3sFtkU9/QlR+
 8fUSuisVLv9lkSHrSsIZe2AorzZwQbz/P3JqeHktPw+DurPLP3E4Ikvqt4ylUL4l59X/7kpp1ff
 h0JPZt5kioxfuOpYrhG6G1LvFiFeJpKOYWphPJRlIVNoUVc+F4XpRp11++4v4BZe3/FZHphbjGe
 w+Z5sBj2ooRoje+v16a6C1kG1doTFTlRf6hIHF04veJ0mZz8S96DWQYWpbFeGYXnQlqEwTkql6P
 JPh5F/FudeZGOn4rOCai3Yx0MBJ4iJtY07utk77AGvClaJVyk+QjJvyaUi11rAo6els3X9G1Fcm
 FG8vUdLvWPDwyZ8De2t2D5bMgDUcqXp980nb4JFiKrRx+W9/jQ7DCpkkuVV0Wba8cdWwNEwj4Km
 ttaCxwyS
X-Proofpoint-GUID: dUy8y_4B8Lq5Dupd9V48wrQMUfW64sCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024


On 8/18/2025 12:59 PM, Dikshita Agarwal wrote:
>>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
>>> index 930f5afe9489d01be193f1dbe429d33f5401b468..11666f40a4d1c34e1b6eca0b5e40e0f09eeb2b67 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_venc.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>>> @@ -58,6 +58,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
>>>  	inst->crop.width = f->fmt.pix_mp.width;
>>>  	inst->crop.height = f->fmt.pix_mp.height;
>>>  
>>> +	inst->operating_rate = DEFAULT_FPS << 16;
>>> +	inst->frame_rate = DEFAULT_FPS << 16;
>> I understand that firmware expects the rate in Q16 format, but does driver needs
>> to keep it in that format ? I see most of the time in calculations, it is right
>> shifted to bring it back to normal one and then back n forth.
>>
> Currently in driver inst->frame_rate is in Q16 format everywhere, no
> inconsistency.
> 
> do you prefer to keep it in non Q16 format and convert to Q16 when setting
> to firmware?
> 
Given that it simplifies the handling in driver, by avoiding doing the
adjustment everytime before using that value, yes please.

Regards,
Vikash

