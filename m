Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4160B602625
	for <lists+linux-media@lfdr.de>; Tue, 18 Oct 2022 09:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbiJRHsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Oct 2022 03:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiJRHsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Oct 2022 03:48:47 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFC76A4A4;
        Tue, 18 Oct 2022 00:48:39 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I74rS7026641;
        Tue, 18 Oct 2022 07:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2314Jl5fs8DtAUNbq4mr4c0KW9kucVdcqUQCKtUeC18=;
 b=JbzSHnnQM7rBXsFBmvqPX7YCz67P69JVwyjd1gf4NsV2CN1u0i1iRbcRwEWKtzL7bg/q
 +js0o0QnV+HXebKa18HDFB5zG76McNe+irJPwXKoeCUFko/TRJqYT8RJKzX5VieqBDIi
 xUPzW+tPHZ9cZ6gT3RZ8lnBsm44g6wJ58EY0W/ZLBwphuPjYHE8STEDt+8NNJsyrAudp
 xQRYx3TX95BQNsuHalEyk7qHkdyrFHn+2X+lRLX3gILCSpxj9gCFPIWR0WhAvaHgJnLm
 vt+/y4xIicGQMqZVgmKD13H222uKwnZHKbmUG5xh1vLYlX9QFnTF3uiTxevrPMhHmcsV cg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9jjmrrqh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Oct 2022 07:48:27 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29I7mR2A023792
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Oct 2022 07:48:27 GMT
Received: from [10.251.44.159] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 18 Oct
 2022 00:48:22 -0700
Message-ID: <2eba95d9-ce36-cafd-5aa3-116375965a0f@quicinc.com>
Date:   Tue, 18 Oct 2022 10:48:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        <akapatra@quicinc.com>, <jzala@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <robert.foss@linaro.org>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
 <1a7ab9da-e7fb-9077-5d6e-705629bb2b10@linaro.org>
 <166601200198.3760285.1520904024668899853@Monstersaurus>
 <89dcd314-37bb-b944-b7e6-b6c71a3514fc@linaro.org>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <89dcd314-37bb-b944-b7e6-b6c71a3514fc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MSYC96Z529vOmnLGFsFAx439p6f2TXUl
X-Proofpoint-ORIG-GUID: MSYC96Z529vOmnLGFsFAx439p6f2TXUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_01,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 phishscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210180044
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 17/10/2022 17:22, Bryan O'Donoghue wrote:
> On 17/10/2022 14:06, Kieran Bingham wrote:
>> Quoting Bryan O'Donoghue (2022-10-17 01:16:05)
>>> On 13/10/2022 13:12, quic_mmitkov@quicinc.com wrote:
>>>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>>>
>>>> For v4:
>>>> - fixes the warning reported by the kernel test robot
>>>> - tiny code change to enable the vc functionality with the 
>>>> partially-applied
>>>>     multistream patches on linux-next (tested on tag:next-20221010)
>>>>
>>>> For v3:
>>>> - setting the sink pad format on the CSID entity will now propagate 
>>>> the
>>>>     format to the source pads to keep the subdev in a valid 
>>>> internal state.
>>>> - code syntax improvements
>>>>
>>>> For v2:
>>>> - code syntax improvements
>>>> - The info print for the enabled VCs was demoted to a dbg print. 
>>>> Can be
>>>>     enabled with dynamic debug, e.g.:
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
>>>>     (the setup we used for testing, with the imx412 sensor),
>>>>     or a 3-frame HDR output - light, medium-lit, dark frame.
>>>> - sensors with additional metadata that is streamed over a different
>>>>     virtual channel/datatype.
>>>> - sensors that produce frames with multiple resolutions in the same 
>>>> pixel
>>>>     data stream
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
>>>>     media: camss: sm8250: Virtual channels for CSID
>>>>     media: camss: vfe: Reserve VFE lines on stream start and link 
>>>> to CSID
>>>>     media: camss: vfe-480: Multiple outputs support for SM8250
>>>>     media: camss: sm8250: Pipeline starting and stopping for multiple
>>>>       virtual channels
>>>>
>>>>    .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
>>>>    .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
>>>>    .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>>>>    .../media/platform/qcom/camss/camss-vfe-480.c | 61 
>>>> ++++++++++++-------
>>>>    drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
>>>>    .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
>>>>    drivers/media/platform/qcom/camss/camss.c     |  2 +-
>>>>    7 files changed, 140 insertions(+), 60 deletions(-)
>>>>
>>>
>>> Hi Milen
>>>
>>> The set applies to next-20221013 including patch#4.
>>>
>>> I can confirm it doesn't break anything for me - though my sensor is a
>>> bog-standard imx577 so it doesn't have any VC support.
>>
>> Interesting though - the IMX477 has the ability to convey metadata on a
>> separate VC... That's actually the thing holding back the RPi IMX477
>> driver from mainline, as the way it was anticipated to support multiple
>> data streams is with the new multiplexed streams API.
>>
>> And I think we inferred that the IMX577 and IMX477 are closely related,
>> so should have similar capabilities for obtaining metadata channels?
>
> Hmm I was not aware of that.
>
> If we could import the rpi/imx477.c code into upstrea/imx412.c it 
> might be possible
>
> The core init is very similar
>
> https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/imx477.c#L167 
>
>
> https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/imx412.c#L160 
>
>
> Maybe it would be possible to apply the rest of the imx477 config 
> on-top as a POC
>
> https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/imx477.c#L479 
>
>
> The similary is born out by the shared init code I can see in Leopard 
> imaging's driver, I'm not sure if it supports virtual-channels - I'll 
> have a look, though.
>
> What's in the imx477 meta-data ?
>
> @Milen if you have the imx577 datasheet - I don't - perhaps we could 
> cherry-pick some of the code from imx477 and get the imx412.c->imx577 
> dumping VC data out with the RB5 camera mezzanine.
>
> ---
> bod

Bryan, contact Nicolas Dechesne (from Linaro) with regards to the imx577 
datasheet. I don't have permissions.


Regards,

Milen



