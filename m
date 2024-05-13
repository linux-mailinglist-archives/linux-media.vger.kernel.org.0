Return-Path: <linux-media+bounces-11427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACAD8C450D
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 18:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E021F21C83
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 16:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F021155392;
	Mon, 13 May 2024 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GaRr1a9L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D91415534A;
	Mon, 13 May 2024 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715617641; cv=none; b=tR4lJQ9NFHXBKtQInYPZLRYGOdmSkv3DjAsOPTqeAF2PwcmGalqAgVDiuic3AqQp7oMPL7hTT/ymUq2Aiw9hWJBpDGZZ2VXdBAiZxgCoveyOfeVTeljhmu85uWnQnaVhilyEmrOQmrgSHCwuNa6d1ocgI+x9aaJxsCUhsGzNwdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715617641; c=relaxed/simple;
	bh=FoI8/Crln/k9Fu4H8Hk3E6wVBMT2gYt3UZjWYoFJIR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VxJKsQcZiRGMDBnIsEmXrN2FYXfsrTZHldA56d5CxQ6YbN+dAVVTIjjK2oTI5WaU7sSQvfaQwq+C6p9QnFukIDoKaT/lHwbdNaozhahP+ngddNf8TFIWHlT+bVtHYcEHrOKb+Nnm0F6PvJnyrpG94kz6rWEHmAyLV5Mm7uI9wpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GaRr1a9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DBRqEj013854;
	Mon, 13 May 2024 16:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2Kkf7INoYXad9rw9GnOquyxpBI9tsHNTkxfG2dISyn4=; b=Ga
	Rr1a9LCeQRKhs2xiMPIQHu+fi97j86qjuZDqBTEKBfiYNjhku1jx63QHBSvchbZb
	JllAhjffL4zynPvF26wkv1xcgCoea9HlQdtnJE966z0FOat+hetCfIDeKwLQR1VY
	f4GfYMRK35Pn8ye4NZDgYtWWsdOHSGewyPvsn1VMPMh9YSzwyIPGPiVL8DE1YO5s
	N2iszm/2fkme8YwjpnXDfCTI/FRzeK3IlA4j7Ac0YGtE1YhZNslxjDFJvzPMoqcw
	kf6OaSlb3h9pBWF60q25gi8y5VyGB2Qvxxbv3d7U7jSwM5MHQ8Hfd6ZkuABXM6TJ
	a433HYEGnlUPsl8sHCSw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1y9kv3e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 16:27:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DGR98Z010391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 16:27:10 GMT
Received: from [10.251.44.40] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 09:27:00 -0700
Message-ID: <b4bf05b5-4e03-40d9-8149-956b55d91a41@quicinc.com>
Date: Mon, 13 May 2024 19:26:58 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: qcom: camss: Decouple VFE from CSID
Content-Language: en-US
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-9-quic_grosikop@quicinc.com>
 <adbd0eeb-62c0-46a3-9cbb-92f6fde6c152@linaro.org>
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <adbd0eeb-62c0-46a3-9cbb-92f6fde6c152@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Qi5N_gkUIYQZJwucl1qQPxa6Cktp0eLB
X-Proofpoint-GUID: Qi5N_gkUIYQZJwucl1qQPxa6Cktp0eLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_11,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130107

Hi Vladimir,

Thanks for the review,

On 5/13/2024 6:58 PM, Vladimir Zapolskiy wrote:
> On 4/11/24 15:45, Gjorgji Rosikopulos wrote:
>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>
>> Decouple the direct calls to VFE's vfe_get/put in the CSID subdev
>> in order to prepare for the introduction of IFE subdev.
>>
>> Also decouple CSID base address from VFE since on the Titan platform
>> CSID register base address resides within VFE's base address.
>>
>> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
>> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
>> ---
>>   .../media/platform/qcom/camss/camss-csid.c    | 16 +++--
>>   .../media/platform/qcom/camss/camss-csid.h    |  1 +
>>   drivers/media/platform/qcom/camss/camss.c     | 69 +++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss.h     |  8 +++
>>   4 files changed, 89 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c
>> b/drivers/media/platform/qcom/camss/camss-csid.c
>> index 5b23f5b8746d..858db5d4ca75 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -602,7 +602,6 @@ static int csid_set_power(struct v4l2_subdev *sd,
>> int on)
>>       struct csid_device *csid = v4l2_get_subdevdata(sd);
>>       struct camss *camss = csid->camss;
>>       struct device *dev = camss->dev;
>> -    struct vfe_device *vfe = &camss->vfe[csid->id];
>>       int ret = 0;
>>         if (on) {
>> @@ -611,7 +610,7 @@ static int csid_set_power(struct v4l2_subdev *sd,
>> int on)
>>            * switching on the CSID. Do so unconditionally, as there is no
>>            * drawback in following the same powering order on older SoCs.
>>            */
>> -        ret = vfe_get(vfe);
>> +        ret = csid->res->parent_dev_ops->get(camss, csid->id);
>>           if (ret < 0)
>>               return ret;
>>   @@ -663,7 +662,7 @@ static int csid_set_power(struct v4l2_subdev
>> *sd, int on)
>>           regulator_bulk_disable(csid->num_supplies,
>>                          csid->supplies);
>>           pm_runtime_put_sync(dev);
>> -        vfe_put(vfe);
>> +        csid->res->parent_dev_ops->put(camss, csid->id);
>>       }
>>         return ret;
>> @@ -1021,6 +1020,11 @@ int msm_csid_subdev_init(struct camss *camss,
>> struct csid_device *csid,
>>       csid->id = id;
>>       csid->res = &res->csid;
>>   +    if (dev_WARN_ONCE(dev, !csid->res->parent_dev_ops,
> 
> Please remove/replace dev_WARN_ONCE() to a lesser dev_warn_once(),
> wherever it's
> possible please do not use/introduce WARN() type of writes to the kernel
> log buffer...

The error is fatal and driver probe will fail if this happens,
it is good to have it in kernel log buffer.
However i agree it can be changed to dev_warn_once.

> 
>> +              "Error: CSID depends on VFE/IFE device ops!\n")) {
>> +        return -EINVAL;
>> +    }
>> +
>>       csid->res->hw_ops->subdev_init(csid);
>>         /* Memory */
>> @@ -1031,9 +1035,11 @@ int msm_csid_subdev_init(struct camss *camss,
>> struct csid_device *csid,
>>            * VFE to be initialized before CSID
>>            */
>>           if (id >= 2) /* VFE/CSID lite */
>> -            csid->base = camss->vfe[id].base + VFE_480_LITE_CSID_OFFSET;
>> +            csid->base =
>> csid->res->parent_dev_ops->get_base_address(camss, id)
>> +                + VFE_480_LITE_CSID_OFFSET;
>>           else
>> -            csid->base = camss->vfe[id].base + VFE_480_CSID_OFFSET;
>> +            csid->base =
>> csid->res->parent_dev_ops->get_base_address(camss, id)
>> +                 + VFE_480_CSID_OFFSET;
>>       } else {
>>           csid->base = devm_platform_ioremap_resource_byname(pdev,
>> res->reg[0]);
>>           if (IS_ERR(csid->base))
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h
>> b/drivers/media/platform/qcom/camss/camss-csid.h
>> index 0e385d17c250..8cdae98e4dca 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -157,6 +157,7 @@ struct csid_hw_ops {
>>   struct csid_subdev_resources {
>>       bool is_lite;
>>       const struct csid_hw_ops *hw_ops;
>> +    const struct parent_dev_ops *parent_dev_ops;
>>       const struct csid_formats *formats;
>>   };
>>   diff --git a/drivers/media/platform/qcom/camss/camss.c
>> b/drivers/media/platform/qcom/camss/camss.c
>> index 37060eaa0ba5..4d625ef59cf7 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -32,6 +32,8 @@
>>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>>   +static const struct parent_dev_ops vfe_parent_dev_ops;
>> +
>>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
>>       /* CSIPHY0 */
>>       {
>> @@ -87,6 +89,7 @@ static const struct camss_subdev_resources
>> csid_res_8x16[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_1,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_1
>>           }
>>       },
>> @@ -109,6 +112,7 @@ static const struct camss_subdev_resources
>> csid_res_8x16[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_1,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_1
>>           }
>>       },
>> @@ -226,6 +230,7 @@ static const struct camss_subdev_resources
>> csid_res_8x96[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_7,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_7
>>           }
>>       },
>> @@ -248,6 +253,7 @@ static const struct camss_subdev_resources
>> csid_res_8x96[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_7,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_7
>>           }
>>       },
>> @@ -270,6 +276,7 @@ static const struct camss_subdev_resources
>> csid_res_8x96[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_7,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_7
>>           }
>>       },
>> @@ -292,6 +299,7 @@ static const struct camss_subdev_resources
>> csid_res_8x96[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_7,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_7
>>           }
>>       }
>> @@ -445,6 +453,7 @@ static const struct camss_subdev_resources
>> csid_res_660[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_7,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_7
>>           }
>>       },
>> @@ -470,6 +479,7 @@ static const struct camss_subdev_resources
>> csid_res_660[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_7,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_7
>>           }
>>       },
>> @@ -495,6 +505,7 @@ static const struct camss_subdev_resources
>> csid_res_660[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_7,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_7
>>           }
>>       },
>> @@ -520,6 +531,7 @@ static const struct camss_subdev_resources
>> csid_res_660[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_4_7,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_4_7
>>           }
>>       }
>> @@ -714,6 +726,7 @@ static const struct camss_subdev_resources
>> csid_res_845[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -739,6 +752,7 @@ static const struct camss_subdev_resources
>> csid_res_845[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -765,6 +779,7 @@ static const struct camss_subdev_resources
>> csid_res_845[] = {
>>           .csid = {
>>               .is_lite = true,
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       }
>> @@ -957,6 +972,7 @@ static const struct camss_subdev_resources
>> csid_res_8250[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -974,6 +990,7 @@ static const struct camss_subdev_resources
>> csid_res_8250[] = {
>>           .type = CAMSS_SUBDEV_TYPE_CSID,
>>           .csid = {
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -991,6 +1008,7 @@ static const struct camss_subdev_resources
>> csid_res_8250[] = {
>>           .csid = {
>>               .is_lite = true,
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -1008,6 +1026,7 @@ static const struct camss_subdev_resources
>> csid_res_8250[] = {
>>           .csid = {
>>               .is_lite = true,
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       }
>> @@ -1212,6 +1231,7 @@ static const struct camss_subdev_resources
>> csid_res_sc8280xp[] = {
>>           .interrupt = { "csid0" },
>>           .csid = {
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -1227,6 +1247,7 @@ static const struct camss_subdev_resources
>> csid_res_sc8280xp[] = {
>>           .interrupt = { "csid1" },
>>           .csid = {
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -1242,6 +1263,7 @@ static const struct camss_subdev_resources
>> csid_res_sc8280xp[] = {
>>           .interrupt = { "csid2" },
>>           .csid = {
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -1257,6 +1279,7 @@ static const struct camss_subdev_resources
>> csid_res_sc8280xp[] = {
>>           .interrupt = { "csid3" },
>>           .csid = {
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -1272,6 +1295,7 @@ static const struct camss_subdev_resources
>> csid_res_sc8280xp[] = {
>>           .csid = {
>>               .is_lite = true,
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -1287,6 +1311,7 @@ static const struct camss_subdev_resources
>> csid_res_sc8280xp[] = {
>>           .csid = {
>>               .is_lite = true,
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -1302,6 +1327,7 @@ static const struct camss_subdev_resources
>> csid_res_sc8280xp[] = {
>>           .csid = {
>>               .is_lite = true,
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       },
>> @@ -1317,6 +1343,7 @@ static const struct camss_subdev_resources
>> csid_res_sc8280xp[] = {
>>           .csid = {
>>               .is_lite = true,
>>               .hw_ops = &csid_ops_gen2,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>               .formats = &csid_formats_gen2
>>           }
>>       }
>> @@ -1661,6 +1688,48 @@ void camss_pm_domain_off(struct camss *camss,
>> int id)
>>       }
>>   }
>>   +static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>> +{
>> +    int ret = -EINVAL;
>> +
>> +    if (id < camss->res->vfe_num) {
> 
> 
> if (id >= camss->res->vfe_num)
>     return -EINVAL;

:-). I believe this is metter of personal taste. I also like
the code which you have posted. But with function of this size
i dont see that it will make any difference.

> 
>> +        struct vfe_device *vfe = &camss->vfe[id];
>> +
>> +        ret = vfe_get(vfe);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int vfe_parent_dev_ops_put(struct camss *camss, int id)
>> +{
>> +    if (id < camss->res->vfe_num) {
>> +        struct vfe_device *vfe = &camss->vfe[id];
>> +
>> +        vfe_put(vfe);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void __iomem
>> +*vfe_parent_dev_ops_get_base_address(struct camss *camss, int id)
>> +{
>> +    if (id < camss->res->vfe_num) {
>> +        struct vfe_device *vfe = &camss->vfe[id];
>> +
>> +        return vfe->base;
>> +    }
>> +
>> +    return NULL;
> 
> I can find code snippets above like
> 
>     if (IS_ERR(csid->base))
>         ...
> 
> So, is it really a good idea to return NULL on error? Probably it might
> be better
> to return a reasonable error to the caller.

As general rule i agree. But here either we have address or not,
i dont see the reason to return an error code. Also i dont see what
caller will do if he gets error code instead of NULL.
I am refering in particular this case. If we have different error paths
of failiure maybe it will more sense.


> 
>> +}
>> +
>> +static const struct parent_dev_ops vfe_parent_dev_ops = {
>> +    .get = vfe_parent_dev_ops_get,
>> +    .put = vfe_parent_dev_ops_put,
>> +    .get_base_address = vfe_parent_dev_ops_get_base_address
>> +};
>> +
>>   /*
>>    * camss_of_parse_endpoint_node - Parse port endpoint node
>>    * @dev: Device
>> diff --git a/drivers/media/platform/qcom/camss/camss.h
>> b/drivers/media/platform/qcom/camss/camss.h
>> index a5be9e872992..b3c967bcf8a9 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -143,6 +143,12 @@ struct camss_clock {
>>       u32 nfreqs;
>>   };
>>   +struct parent_dev_ops {
>> +    int (*get)(struct camss *camss, int id);
>> +    int (*put)(struct camss *camss, int id);
>> +    void __iomem *(*get_base_address)(struct camss *camss, int id);
>> +};
>> +
>>   void camss_add_clock_margin(u64 *rate);
>>   int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>>               struct device *dev);
>> @@ -153,6 +159,8 @@ s64 camss_get_link_freq(struct media_entity
>> *entity, unsigned int bpp,
>>   int camss_get_pixel_clock(struct media_entity *entity, u64
>> *pixel_clock);
>>   int camss_pm_domain_on(struct camss *camss, int id);
>>   void camss_pm_domain_off(struct camss *camss, int id);
>> +int camss_vfe_get(struct camss *camss, int id);
>> +void camss_vfe_put(struct camss *camss, int id);
>>   void camss_delete(struct camss *camss);
>>     #endif /* QC_MSM_CAMSS_H */
> 
> -- 
> Best wishes,
> Vladimir

