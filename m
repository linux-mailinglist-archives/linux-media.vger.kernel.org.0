Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9058874CFBF
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 10:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbjGJITm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 04:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbjGJITZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 04:19:25 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD51E8;
        Mon, 10 Jul 2023 01:19:24 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A7M1Js007465;
        Mon, 10 Jul 2023 08:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+M2SIfKnvL7AZzJ727avTriml2pRwJ2UTZ8AxnZYoqQ=;
 b=An1Qa0eAku6/TDCSZOYnpdr/wx15+MMciZpZti6s/lybeRe9wTmkrnn8O49O0Kq/Nrwa
 6PsEs226yI8AJui1FUJp4gdnPXJzX0w6TxSX81utAg/wls+7P60urxg1gyhUb8+hbwQp
 KNRUN0Z+2bx2wGon74Q4tut1bNPuP0Zz49XfXspli8tSh7vynnk5htntdpKujxDv/kYQ
 8OBBgFm3GY827PiaojOngHo+TL5C/TjeeAj0C1zEWBbMbFlzptD9nTZpLi/FVHB1ZwRT
 LgToqyg4CWXjSwD79sduDiiu9Iug6vYqzEnJJ56yaD5Lu1xQuQydxjRdKRdWAiWiW8Fd 2Q== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpxry2xm8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 08:19:16 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36A8Ivx4017594
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 08:18:58 GMT
Received: from [10.50.37.218] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 10 Jul
 2023 01:18:54 -0700
Message-ID: <73e7c244-02da-a275-f187-751c8d5b9816@quicinc.com>
Date:   Mon, 10 Jul 2023 13:48:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Revert "venus: pm_helpers: Fix error check in
 vcodec_domains_get()"
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Tang Bin <tangbin@cmss.chinamobile.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <e1e46cfd-8d95-4792-ac8f-1237d2af7171@moroto.mountain>
 <7550a762-7b00-514d-07a4-d304a6342ae4@quicinc.com>
 <7d684c80-d9c7-42ca-9ef6-0d4c38ee1876@kadam.mountain>
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <7d684c80-d9c7-42ca-9ef6-0d4c38ee1876@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7CZB_w8-9EQlNkRSs5nE4YWhUq0-ECCV
X-Proofpoint-GUID: 7CZB_w8-9EQlNkRSs5nE4YWhUq0-ECCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_05,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307100075
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/10/2023 1:33 PM, Dan Carpenter wrote:
> On Mon, Jul 10, 2023 at 12:59:22PM +0530, Vikash Garodia wrote:
>> Hi Dan,
>>
>> On 7/3/2023 9:00 PM, Dan Carpenter wrote:
>>> This reverts commit 0f6e8d8c94a82e85e1b9b62a7671990740dc6f70.
>>>
>>> The reverted commit was based on static analysis and a misunderstanding
>>> of how PTR_ERR() and NULLs are supposed to work.  When a function
>>> returns both pointer errors and NULL then normally the NULL means
>>> "continue operating without a feature because it was deliberately
>>> turned off".  The NULL should not be treated as a failure.  If a driver
>>> cannot work when that feature is disabled then the KConfig should
>>> enforce that the function cannot return NULL.  We should not need to
>>> test for it.
>>>
>>> In this code, the patch breaks the venus driver if CONFIG_PM is
>>> disabled.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>> This patch is also based on static analysis and review so probably best
>>> to be cautious.  My guess is that very few people disable CONFIG_PM
>>> these days so that's why the bug wasn't caught.
>>>
>>>  drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> index 48c9084bb4db..c93d2906e4c7 100644
>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> @@ -869,8 +869,8 @@ static int vcodec_domains_get(struct venus_core *core)
>>>  	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
>>>  		pd = dev_pm_domain_attach_by_name(dev,
>>>  						  res->vcodec_pmdomains[i]);
>>> -		if (IS_ERR_OR_NULL(pd))
>>> -			return PTR_ERR(pd) ? : -ENODATA;
>>> +		if (IS_ERR(pd))
>>> +			return PTR_ERR(pd);
>> Trying to understand if pm domains for Venus (pd) is returned NULL here, how
>> would the driver be able to enable and disable those power domains at [1]. And
>> without that, video usecase would be functional ?
>>
>> [1]
>> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qcom/venus/pm_helpers.c#L1043
> 
> I don't understand.  The CONFIG_PM is Power Management.  If you
> deliberately disable power management then then, obviously, power
> domains are not going to be enabled.  The __pm_runtime_resume() function
> turns into:
> 
> include/linux/pm_runtime.h
>    268  static inline int __pm_runtime_resume(struct device *dev, int rpmflags)
>    269  {
>    270          return 1;
>    271  }
> 
> In real life, most people are going to want power management.
> 
> This is a video accelerator.  I would expect that it could still work
> without power management.
It won't, without those 2 power domains enabled for Venus. Does it work for you
when you disabled the config ?

  If it really can't then that should be
> enforced in the Kconfig.  Having this code here which says "We can't
> load without CONFIG_PM" is wrong, it should be "We can't compile without
> CONFIG_PM".

Its better enforced in Kconfig. By allowing NULL for
dev_pm_domain_attach_by_name does not still indicate that the functionality is
dependent on CONFIG_PM to be enabled.

Thanks,
Vikash
