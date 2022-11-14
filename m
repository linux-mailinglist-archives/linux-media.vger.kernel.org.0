Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAFC86286CF
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 18:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237497AbiKNRSp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 12:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237054AbiKNRS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 12:18:29 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA075BC6;
        Mon, 14 Nov 2022 09:18:27 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AEGTkYv006912;
        Mon, 14 Nov 2022 17:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RrO1iy8UfPdosaJpH1XKYTCIqCwYtw6qosnHAMp6E3Q=;
 b=kXLB3DNeKDCTbKNd1cfolWxw5Q9M0wCdsVyy48m8ye5wbTs5XF15UjmU2HAZwpJRjNsG
 JinJ1XgmUXscmMaQw2dGaWwtKO6TrtcFm3zKj1yago3FjQpZMCFIpcCsO8U3uP7to3ln
 1v8nN9V2wyUvLQzjVAhTtKC0L0xQr9wxg+5+fmuYUfiTrBmMkKceMNwJS5iwJzo+psDe
 nqs64ikLq4mP+v0jaubqNHtsOll08KG5X2oqYNtXEVgaIoNuOKoVB5jRu2mGJ1olAI8R
 BlVeaMK6DbMWJHxNjpc43Uofc6/tFgCprSk2qJ8zQMw4ZDRmFJfX7HpLIywGZOIgVbLd Cg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kus8cg47h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Nov 2022 17:18:18 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AEHIHEq016778
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Nov 2022 17:18:17 GMT
Received: from [10.251.44.51] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 14 Nov
 2022 09:18:13 -0800
Message-ID: <a4364e85-7970-d215-17f2-d5ff9a3dbaab@quicinc.com>
Date:   Mon, 14 Nov 2022 19:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
To:     Robert Foss <robert.foss@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <akapatra@quicinc.com>, <jzala@quicinc.com>, <todor.too@gmail.com>,
        <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
 <46d82762-8b6b-8a3e-0bdd-5598163244de@linaro.org>
 <CAG3jFysAfymcFS54CyxBYhJbQ4Qh7bvhpE8UPc3S1o_8uQq7Xg@mail.gmail.com>
Content-Language: en-US
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <CAG3jFysAfymcFS54CyxBYhJbQ4Qh7bvhpE8UPc3S1o_8uQq7Xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cWuTbfoONGsq_PgAamLH4vIUaM21jkJa
X-Proofpoint-ORIG-GUID: cWuTbfoONGsq_PgAamLH4vIUaM21jkJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_12,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140124
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 08/11/2022 12:35, Robert Foss wrote:
> On Tue, 8 Nov 2022 at 01:12, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>> On 13/10/2022 13:12, quic_mmitkov@quicinc.com wrote:
>>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>>
>>> For v4:
>>> - fixes the warning reported by the kernel test robot
>>> - tiny code change to enable the vc functionality with the partially-applied
>>>     multistream patches on linux-next (tested on tag:next-20221010)
>>>
>>> For v3:
>>> - setting the sink pad format on the CSID entity will now propagate the
>>>     format to the source pads to keep the subdev in a valid internal state.
>>> - code syntax improvements
>>>
>>> For v2:
>>> - code syntax improvements
>>> - The info print for the enabled VCs was demoted to a dbg print. Can be
>>>     enabled with dynamic debug, e.g.:
>>> echo "file drivers/media/platform/qcom/camss/* +p" > /sys/kernel/debug/dynamic_debug/control
>>>
>>> NOTE: These changes depend on the multistream series, that as of yet
>>> is still not merged upstream. However, part of the
>>> multistream patches are merged in linux-next (tested on
>>> tag:next-20221010), including the patch that introduces the
>>> video_device_pipeline_alloc_start() functionality. This allows
>>> applying and using this series on linux-next without applying the
>>> complete multistream set.
>>>
>>> The CSID hardware on SM8250 can demux the input data stream into
>>> maximum of 4 multiple streams depending on virtual channel (vc)
>>> or data type (dt) configuration.
>>>
>>> Situations in which demuxing is useful:
>>> - HDR sensors that produce a 2-frame HDR output, e.g. a light and a dark frame
>>>     (the setup we used for testing, with the imx412 sensor),
>>>     or a 3-frame HDR output - light, medium-lit, dark frame.
>>> - sensors with additional metadata that is streamed over a different
>>>     virtual channel/datatype.
>>> - sensors that produce frames with multiple resolutions in the same pixel
>>>     data stream
>>>
>>> With these changes, the CSID entity has, as it did previously, a single
>>> sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
>>> virtual channel configuration is determined by which of the source ports
>>> are linked to an output VFE line. For example, the link below will
>>> configure the CSID driver to enable vc 0 and vc 1:
>>>
>>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>> media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
>>>
>>> which will be demuxed and propagated into /dev/video0
>>> and /dev/video1 respectively. With this, the userspace can use
>>> any normal V4L2 client app to start/stop/queue/dequeue from these
>>> video nodes. Tested with the yavta app.
>>>
>>> The format of each RDI channel of the used VFE(s) (msm_vfe0_rdi0,
>>> msm_vfe0_rdi1,...) must also be configured explicitly.
>>>
>>> Note that in order to keep a valid internal subdevice state,
>>> setting the sink pad format of the CSID subdevice will propagate
>>> this format to the source pads. However, since the CSID hardware
>>> can demux the input stream into several streams each of which can
>>> be a different format, in that case each source pad's
>>> format must be set individually, e.g.:
>>>
>>> media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
>>> media-ctl -V '"msm_csid0":2[fmt:SRGGB10/960x540]'
>>>
>>> Milen Mitkov (4):
>>>     media: camss: sm8250: Virtual channels for CSID
>>>     media: camss: vfe: Reserve VFE lines on stream start and link to CSID
>>>     media: camss: vfe-480: Multiple outputs support for SM8250
>>>     media: camss: sm8250: Pipeline starting and stopping for multiple
>>>       virtual channels
>>>
>>>    .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
>>>    .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
>>>    .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>>>    .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
>>>    drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
>>>    .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
>>>    drivers/media/platform/qcom/camss/camss.c     |  2 +-
>>>    7 files changed, 140 insertions(+), 60 deletions(-)
>>>
>> I've done some offline work with Milen on this.
>>
>> I'm happy enough to add my
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> to the series. I don't have - currently a VC enabled setup but for the
>> simple case this set doesn't break anything on RB5 for me.
>>
>> ---
>> bod
> This series has my ack.
>
> Acked-by: Robert Foss <robert.foss@linaro.org>

Hi Robert, Bryan et al,

Thanks for the Tested-by and Acked-by.

Do I need to resubmit the patches with the added new tags?

If this is not needed, is there something else I can do to help the 
merging process?


Thank you,

Milen

