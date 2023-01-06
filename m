Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BADE65FE62
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 10:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbjAFJuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 04:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbjAFJt5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 04:49:57 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274D343E4D;
        Fri,  6 Jan 2023 01:49:47 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3069DWlH025776;
        Fri, 6 Jan 2023 09:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AvNscPFQUAo5ARfnLPz9LEhGUhJd4Ssb0YagQ9ruQUw=;
 b=kIEHO0jr/bvdxX1DO3GnNVWUIMlOlocs3lnTMQPASsYIWuZVct8bJ1CSXBzNfPvHG6vu
 CoDBHP8cnH7PSStFcL5PshK305i3EdhEzfVdwhoNGvNQYkAHua2/x26jQIPQPmkQHWiY
 gKan3ZyF1OtZAQP8KJ6DI7ZxSLeExbeIvtew2/JDT9mUlKtRcxhuCs6jp4DWC9QOHRgl
 5Go4wUeH0qTC+rDSQ7qpnIxyFKHiezkWCWIHXFbmJzRJWiBnBYtOnfEX238Rcla49xow
 fikeQHwePjETos3RGmBKrFeAUlsgefuor2Xh6g/LlxKwf6VE74aagG0bi1aLNMVlJtjy Jg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwu4vtu5t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Jan 2023 09:49:30 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3069nTYM027138
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 6 Jan 2023 09:49:29 GMT
Received: from [10.251.44.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 01:49:25 -0800
Message-ID: <d54cd6d9-a970-6038-1fc5-6d8b4709ce62@quicinc.com>
Date:   Fri, 6 Jan 2023 11:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>, <hverkuil@xs4all.nl>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <a885c324-8ac5-da52-2b68-848f36fd045b@linaro.org>
 <a4b0ad23-c003-b2a5-acda-07164048673a@quicinc.com>
 <4c822211-ef91-416d-2363-cd0022a417af@nexus-software.ie>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <4c822211-ef91-416d-2363-cd0022a417af@nexus-software.ie>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ij5KvQg3RmhuAY_cNOzcf3nkDApqxIg9
X-Proofpoint-ORIG-GUID: ij5KvQg3RmhuAY_cNOzcf3nkDApqxIg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=914 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060077
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 05/01/2023 20:43, Bryan O'Donoghue wrote:
> On 05/01/2023 08:37, Milen Mitkov (Consultant) wrote:
>> On 09/12/2022 18:17, Bryan O'Donoghue wrote:
>>> On 09/12/2022 09:40, quic_mmitkov@quicinc.com wrote:
>>>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>>>
>>>> For v7:
>>>> - Fix an issue with output state for different versions of the IFE
>>>>    hardware (for platforms different from QRB5, e.g. QRB3).
>>>>
>>>
>>> Yep.
>>>
>>> Working for me on rb3 now and thank you for updating the git commit 
>>> in patch #4.
>>>
>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> for the series.
>>>
>>> ---
>>> bod
>>
>>
>> Hi Bryan, Robert, Hans and others,
>>
>>
>> Happy New Year!
>>
>> Is there anything else I can/need to do to speed up the merging 
>> process of this series?
>>
>>
>> Thanks,
>>
>> Milen
>>
>
> I don't think so.
>
> Is everything still working on linux-next ?
>
> e45fb347b630e...cc3c08b41a9c9 master        -> linux-next/master
>
Hi Bryan,

Yes, I took the sm8250_config from 
git.linaro.org/people/bryan.odonoghue/kernel.git, put it on most recent 
master of git.linaro.org/kernel-org/linux-next.git and build with it, 
virtual channels work as expected.


Regard,

Milen



