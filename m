Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5096F4437
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 14:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbjEBMuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 08:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234216AbjEBMuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 08:50:03 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31545FD9;
        Tue,  2 May 2023 05:49:54 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342BfRDA007217;
        Tue, 2 May 2023 12:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eFU69/duF9uie/h2QHhYW3EdUIBnkIDbNh7j9/8fcos=;
 b=OfayqcMHMcI/dWuzE0c/U1UHaoxwNMk12Q9i+Mk+bTAUuLKatUgHnGs/oYSPe+lWG1En
 gVyEUpTuSD4pMzJXY0D7EzYCQ3aw67NLlMcZzYLv+dD7Qm8lxb9sKYXZWtP2azaIXtRG
 HbSzQTmlIp3ds0dyTBNw6jothiLxstATd0zqxfg7ZGI+9acrzolLGpLvA2ghicOPUIbz
 damZ01VuMCxci3YBLYJmfMDPY3mv1mZufJVvH3qHUSaXRt+pXjzU4PI0jX+mZTBoK761
 jGvE+rIkFK6GdZK/eOmAMfx/TxK5PsbymzHmHhYp5e1Nj0OUn5zGfB2sLjVp+YOXva47 Qg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qays50gxh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 May 2023 12:49:51 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342CnoX4014377
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 2 May 2023 12:49:50 GMT
Received: from [10.216.46.210] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 05:49:48 -0700
Message-ID: <219b2cf5-4218-2e5c-2f12-718d5554b2b7@quicinc.com>
Date:   Tue, 2 May 2023 18:19:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
To:     Javier Martinez Canillas <javierm@redhat.com>,
        =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>,
        <stanimir.k.varbanov@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
 <2ad875b0-0be8-1897-eddd-89605ed2258b@redhat.com>
Content-Language: en-US
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <2ad875b0-0be8-1897-eddd-89605ed2258b@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -vLTr1wctSUTtV5E_rN7mkSgAmQYdVKQ
X-Proofpoint-ORIG-GUID: -vLTr1wctSUTtV5E_rN7mkSgAmQYdVKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_07,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020109
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/27/2023 8:13 PM, Javier Martinez Canillas wrote:
> Hello Martin,
>
> On 4/14/23 12:12, Martin Dørum wrote:
>> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>>> =4xx. The code used to unconditionally set the property in
>> venc_set_properties, which meant that initializing the encoder would
>> always fail unless the hfi_version was >=4xx.
>>
>> This patch changes venc_set_properties to only set the
>> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
>>
> I would add a
>
> Fixes: bfee75f73c37 ("media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")
>
> since that is the commit that added this property and expected it to
> be used unconditionally in the common venus venc part.
>
>> Signed-off-by: Martin Dørum <dorum@noisolation.com>
>> ---
> I'm not familiar with the venus encoder driver but I had fixed a couple
> of bugs on the venus decoder so I've spent some time looking at the code.
>
> [...]
>
>> +		if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
>> +			ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>> +			h264_transform.enable_type = 0;
>> +			if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>> +			    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>> +				h264_transform.enable_type = ctr->h264_8x8_transform;
>> +
>> +			ret = hfi_session_set_property(inst, ptype, &h264_transform);
>> +			if (ret)
>> +				return ret;
>> +		}
> Is true that HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8 isn't wired for
> older HFI versions, but I wonder if that's something that was forgotten
> when the property was added in that commit or instead should be ignored
> as you do in your patch.

This HFI is supported on earlier version (atleast for V3). The code [1] 
returns from packetization layer

with -EINVAL as there was no need to set the same. Infact, 8x8 transform 
is auto applied in video firmware

for High/Constrained high profile encoding. Later there were request 
from clients as they wanted to disable

this by setting false with this HFI. So it was added later for V4 and later.

[1] 
https://elixir.bootlin.com/linux/v6.3/source/drivers/media/platform/qcom/venus/hfi_cmds.c#L1090


Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

>
> In any case, this fixes a regression that you are experiencing so your
> patch should land in my opinion and later can be added to older versions
> if that is the correct thing to do.
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>
