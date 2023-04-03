Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D586D42D1
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 13:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbjDCLCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 07:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbjDCLCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 07:02:21 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B02B18FA3;
        Mon,  3 Apr 2023 04:01:56 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3339kUpU023035;
        Mon, 3 Apr 2023 11:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wGFhl/u1sZxUHM8PnDD7wst6nZMIb0RHzWdiw6BSsvY=;
 b=p36we5k2hcMHoMkTBPC56xJtegnQB8FXmAwlNDoo89pf3ZW1FZthKq9UNNOtW/n9EP7D
 VivNcvBxPydfRnxbiHBfh5tNVEHr6GZnjo3IQJCMBiCHQYMhemcEtwnVurlg3Csm8OIo
 auq+wUhSI7HdnFjgg4a4kkNfVARkxagdPVDL+P3RUGym2qVL78lVCIL2QU4chaBOxKPC
 O9+IJusj0nmPCWY16AY065ir3qLpRtUVgSjTqvFrSlp0qqHmYRpqZ5Em7uKUbV99U14p
 VGiwoo+CZETGB/WOeOJmirFl3HjnEiTukV05succteieKI+RHW4A4xohfG2xCzDAkn25 PA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqusu07rs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Apr 2023 11:01:47 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333B1ku2010387
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 3 Apr 2023 11:01:46 GMT
Received: from [10.251.45.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 04:01:42 -0700
Message-ID: <bd8db6b5-eab6-418f-529f-03a9b81f99c4@quicinc.com>
Date:   Mon, 3 Apr 2023 14:01:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Azam Sadiq Pasha Kapatrala Syed" <akapatra@quicinc.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Jigarkumar Zala <jzala@quicinc.com>,
        "todor.too@gmail.com" <todor.too@gmail.com>,
        "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Chandan Gera <cgera@qti.qualcomm.com>,
        Guru Chinnabhandar <gchinnab@quicinc.com>,
        Alireza Yasan <ayasan@qti.qualcomm.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
 <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
 <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
 <8243cc42-236c-20e3-74dc-1f130ab1dcf6@quicinc.com>
 <BYAPR02MB557503013F05BF1EA1E1300CC28F9@BYAPR02MB5575.namprd02.prod.outlook.com>
 <f26174aa-a6ca-151c-2602-2f39b40bb7da@linaro.org>
 <7b3cb8a6-8306-f001-5701-af3b482421e9@quicinc.com>
 <d500c5bb-7aca-ae0d-f23e-495cd049e422@linaro.org>
 <d653be97-337f-dc09-786c-b13304c643fe@quicinc.com>
 <d26dfea3-8438-6012-386c-91ec43e1db1d@linaro.org>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <d26dfea3-8438-6012-386c-91ec43e1db1d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QnRr8lAw-yRMiwAguH23Uy2ZlbsB3UpG
X-Proofpoint-ORIG-GUID: QnRr8lAw-yRMiwAguH23Uy2ZlbsB3UpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-04-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030082
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 03/04/2023 12:36, Bryan O'Donoghue wrote:
> On 03/04/2023 10:20, Milen Mitkov (Consultant) wrote:
>>
>> On 03/04/2023 12:16, Bryan O'Donoghue wrote:
>>> On 03/04/2023 09:38, Milen Mitkov (Consultant) wrote:
>>>> On 31/03/2023 11:07, Bryan O'Donoghue wrote:
>>>>> On 31/03/2023 07:20, Azam Sadiq Pasha Kapatrala Syed wrote:
>>>>>> + Nico (Linaro)
>>>>>> Hi Team
>>>>>>
>>>>>> Would like to know if anything is pending form our end as we want 
>>>>>> to get the patches mainlined?
>>>>>>
>>>>>> Thanks,
>>>>>> Azam
>>>>>
>>>>> I'd like to get a clearer picture on this
>>>>>
>>>>> [   90.535909] qcom-camss ac6a000.camss: VFE HW Version = 2.0.1
>>>>> [   90.545756] qcom-camss ac6a000.camss: CSIPHY 3PH HW Version = 
>>>>> 0x40010000
>>>>> [   90.546358] qcom-camss ac6a000.camss: CSID HW Version = 2.0.1
>>>>> [   90.546365] qcom-camss ac6a000.camss: csid_link_setup: Enabled 
>>>>> CSID virtual channels mask 0x1
>>>>> [   90.547675] qcom-camss ac6a000.camss: csid_link_setup: Enabled 
>>>>> CSID virtual channels mask 0x0
>>>>>
>>>>> Using the IMX577 sensor on the RB5 we get his pretty odd virtual 
>>>>> channels mask.
>>>>>
>>>>> If userspace is sending this in, the question I have is why. 
>>>>> Surely with a sensor that doesn't have a VC there should be no 
>>>>> impact on user-space.
>>>>>
>>>>> ---
>>>>> bod
>>>>
>>>> Hey Bryan,
>>>>
>>>> what media-ctl commands are you using? I can't recreate this on my 
>>>> side. I am using this set of commands to test (with the default 
>>>> imx577 driver without any multiple virtual channels outputs) and am 
>>>> getting only the first message (virtual channels mask 0x1):
>>>>
>>>> media-ctl --reset
>>>> media-ctl -v -d /dev/media0 -V '"imx577 
>>>> '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>>>> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
>>>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>>>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>>>> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>>>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>>>
>>>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F 
>>>> /dev/video0
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Milen
>>>
>>> Its a dev_dbg() so "#define DEBUG 1" in 
>>> drivers/media/platform/qcom/camss/camss-csid.c
>>>
>>> ---
>>> bod
>>>
>> Yes, I enabled the dev_dbg(). I just see only one message with 
>> regards to the channels mask. Just this one:
>>
>> [   90.546365] qcom-camss ac6a000.camss: csid_link_setup: Enabled 
>> CSID virtual channels mask 0x1
>>
>> so I wonder if you're testing with a different set of media-ctl/yavta 
>> commands.
>
> No. I'm asking about how this _used_ to be.
>
> If the iteration through the masks went away - then why did it go away 
> ? libcamera version, a change you have made since - V5 I think it was 
> when we discussed this last ?
>
> ---
> bod
>
Hi Bryan,

no, the iteration through the mask didn't go away? The print shows up 
when the csid entity's source pad(s) enables the link to the ife sink 
pad(s). Maybe the client (libcamera?) decides to disable this link for 
some reason?

Regards,

Milen


