Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC93569DC56
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 09:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbjBUIor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 03:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjBUIop (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 03:44:45 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820E64C14;
        Tue, 21 Feb 2023 00:44:40 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31L3gt5B000674;
        Tue, 21 Feb 2023 08:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lJZJskjBOHx/iQdeXfb+9gcEIWXD+YzO5L8KNARmCUc=;
 b=JIGb11jPom7O65wXfWmsXc8rEIVlR109S00E+EHfIEe14QXLycXvd86pUskbfj0TpBEG
 9u8nQsVpwCc7tKekoLq4nj7sDvhbHiwe7XCjPTpjbHTHNyQkm6HerTu6u9pgsusG9FvM
 s775y01CrKGf1IvlEF5xXWp5iPGeqyOLDCQ5Da7NYhtMh9XfbrVcizuIUvTpuuvN55jz
 GbRq97MzE9rOaB4a0ZDQfWo/Wz/MkKWGkxTm1w0GMug+clG7wOUb8aevI/kpRI5Aeb16
 7cdPD7BA+4B2vIaBzaaj6VemEx64cHtLNU8BWPqytQfDzpKL75T1mx5lxgjd1wv8/LM+ zg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ntp98fcq4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 08:44:31 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31L8iUwq027469
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 08:44:30 GMT
Received: from [10.251.44.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 21 Feb
 2023 00:44:26 -0800
Message-ID: <8243cc42-236c-20e3-74dc-1f130ab1dcf6@quicinc.com>
Date:   Tue, 21 Feb 2023 10:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <akapatra@quicinc.com>, <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
 <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
 <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5hFQGPJ6yhUNnT9m3V5Ri1iNguX4ry4Y
X-Proofpoint-ORIG-GUID: 5hFQGPJ6yhUNnT9m3V5Ri1iNguX4ry4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_04,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210074
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 20/02/2023 14:26, Bryan O'Donoghue wrote:
> On 20/02/2023 12:18, Milen Mitkov (Consultant) wrote:
>> On 31/01/2023 11:00, Milen Mitkov (Consultant) wrote:
>>> On 09/12/2022 11:40, quic_mmitkov@quicinc.com wrote:
>>>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>>>
>>>> For v7:
>>>> - Fix an issue with output state for different versions of the IFE
>>>>    hardware (for platforms different from QRB5, e.g. QRB3).
>>>>
>>>> For v6:
>>>> - Fix for a potential race condition in csid
>>>> - More detailed description on how to use/test this feature in
>>>>    user-space in the last patch.
>>>>
>>>> For v5:
>>>> - Use entity->use_count instead of s_stream subdev call ret code to
>>>>    check if another instance of the pipeline is running. Prevents an
>>>>    error on 6.1 and up, when stopping one of several simultaneous
>>>>    instances.
>>>> - flush buffers instead of just returning if the pipeline didn't 
>>>> start.
>>>>
>>>> For v4:
>>>> - fixes the warning reported by the kernel test robot
>>>> - tiny code change to enable the vc functionality with the 
>>>> partially-applied
>>>>    multistream patches on linux-next (tested on tag:next-20221010)
>>>>
>>>> For v3:
>>>> - setting the sink pad format on the CSID entity will now propagate 
>>>> the
>>>>    format to the source pads to keep the subdev in a valid internal 
>>>> state.
>>>> - code syntax improvements
>>>>
>>>> For v2:
>>>> - code syntax improvements
>>>> - The info print for the enabled VCs was demoted to a dbg print. 
>>>> Can be
>>>>    enabled with dynamic debug, e.g.:
>>>> echo "file drivers/media/platform/qcom/camss/* +p" > 
>>>> /sys/kernel/debug/dynamic_debug/control
>>>>
>>>> NOTE: These changes depend on the multistream series, that as of yet
>>>> is still not merged upstream. However, part of the
>>>> multistream patches are merged in linux-next (tested on
>>>> tag:next-20221010), including the patch that introduces the
>>>> video_device_pipeline_alloc_start() functionality. This allows
>>>> applying and using this series on linux-next without applying the
>>>> complete multistream set.
>>>>
>>>> The CSID hardware on SM8250 can demux the input data stream into
>>>> maximum of 4 multiple streams depending on virtual channel (vc)
>>>> or data type (dt) configuration.
>>>>
>>>> Situations in which demuxing is useful:
>>>> - HDR sensors that produce a 2-frame HDR output, e.g. a light and a 
>>>> dark frame
>>>>    (the setup we used for testing, with the imx412 sensor),
>>>>    or a 3-frame HDR output - light, medium-lit, dark frame.
>>>> - sensors with additional metadata that is streamed over a different
>>>>    virtual channel/datatype.
>>>> - sensors that produce frames with multiple resolutions in the same 
>>>> pixel
>>>>    data stream
>>>>
>>>> With these changes, the CSID entity has, as it did previously, a 
>>>> single
>>>> sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
>>>> virtual channel configuration is determined by which of the source 
>>>> ports
>>>> are linked to an output VFE line. For example, the link below will
>>>> configure the CSID driver to enable vc 0 and vc 1:
>>>>
>>>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>>> media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
>>>>
>>>> which will be demuxed and propagated into /dev/video0
>>>> and /dev/video1 respectively. With this, the userspace can use
>>>> any normal V4L2 client app to start/stop/queue/dequeue from these
>>>> video nodes. Tested with the yavta app.
>>>>
>>>> The format of each RDI channel of the used VFE(s) (msm_vfe0_rdi0,
>>>> msm_vfe0_rdi1,...) must also be configured explicitly.
>>>>
>>>> Note that in order to keep a valid internal subdevice state,
>>>> setting the sink pad format of the CSID subdevice will propagate
>>>> this format to the source pads. However, since the CSID hardware
>>>> can demux the input stream into several streams each of which can
>>>> be a different format, in that case each source pad's
>>>> format must be set individually, e.g.:
>>>>
>>>> media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
>>>> media-ctl -V '"msm_csid0":2[fmt:SRGGB10/960x540]'
>>>>
>>>> Milen Mitkov (4):
>>>>    media: camss: sm8250: Virtual channels for CSID
>>>>    media: camss: vfe: Reserve VFE lines on stream start and link to 
>>>> CSID
>>>>    media: camss: vfe-480: Multiple outputs support for SM8250
>>>>    media: camss: sm8250: Pipeline starting and stopping for multiple
>>>>      virtual channels
>>>>
>>>>   .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
>>>>   .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
>>>>   .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>>>>   .../media/platform/qcom/camss/camss-vfe-170.c |  4 +-
>>>>   .../media/platform/qcom/camss/camss-vfe-480.c | 61 
>>>> ++++++++++++-------
>>>>   .../platform/qcom/camss/camss-vfe-gen1.c      |  4 +-
>>>>   drivers/media/platform/qcom/camss/camss-vfe.c |  1 +
>>>>   .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
>>>>   drivers/media/platform/qcom/camss/camss.c     |  2 +-
>>>>   9 files changed, 138 insertions(+), 64 deletions(-)
>>>
>>> Hi guys,
>>>
>>> just a ping for this series.
>>>
>>> Laurent, I sent you an email with answers to the questions you 
>>> requested. I read your reply that you'll review these changes in the 
>>> context of the multi-stream API, but this series doesn't really use 
>>> the multi-stream API, just a note.
>>>
>>> Cheers,
>>>
>>> Milen
>>>
>> Hi there,
>>
>> Just another ping..:)
>>
>> Please let me know if there's anything I could do (improve/fix/code 
>> differently/etc.) to help get this series merged.
>>
>>
>> Best Regards,
>>
>> Milen
>>
>>
>>
>
> Well, we need to re-verify it works on linux-next.
>
> Other than that it seems OK to me.
>
> ---
> bod

Thanks Bryan,

I just re-tested on latest linux-next (next-20230221 tag) and the set 
applies and, judging by the standard set of tests I did, works as 
expected and doesn't break anything.


Best Regards,

Milen


