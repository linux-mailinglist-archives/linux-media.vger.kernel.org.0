Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26044600E09
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 13:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiJQLr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 07:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJQLrZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 07:47:25 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6964252E63;
        Mon, 17 Oct 2022 04:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1666007238; x=1697543238;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hIB4ethcAcNsSc6jzifbqgmyiYEdvxm4/JEPJw6Rl0A=;
  b=hynI1aawjhPPsl0C9YGJ6CfAGGfoEIsOHCfvhA07/yY1+9a4s1YQWSMX
   rNYYu75qJ2/sVJ6E9AudJLDOUlofNQdU3yp02nWMtVRQVW5KLr8J/K+lK
   xem56AWAnlhHFZzo63j/w8wZSNx5zbllOMZeG93V+SWx7sS7Ro8TouCtd
   8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Oct 2022 04:47:17 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 04:47:17 -0700
Received: from [10.251.44.159] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 17 Oct
 2022 04:47:14 -0700
Message-ID: <f7cbad3c-76ab-093e-72c4-8d7629cd6b5b@quicinc.com>
Date:   Mon, 17 Oct 2022 14:47:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
 <1a7ab9da-e7fb-9077-5d6e-705629bb2b10@linaro.org>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <1a7ab9da-e7fb-9077-5d6e-705629bb2b10@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/10/2022 03:16, Bryan O'Donoghue wrote:
> On 13/10/2022 13:12, quic_mmitkov@quicinc.com wrote:
>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>
>> For v4:
>> - fixes the warning reported by the kernel test robot
>> - tiny code change to enable the vc functionality with the 
>> partially-applied
>>    multistream patches on linux-next (tested on tag:next-20221010)
>>
>> For v3:
>> - setting the sink pad format on the CSID entity will now propagate the
>>    format to the source pads to keep the subdev in a valid internal 
>> state.
>> - code syntax improvements
>>
>> For v2:
>> - code syntax improvements
>> - The info print for the enabled VCs was demoted to a dbg print. Can be
>>    enabled with dynamic debug, e.g.:
>> echo "file drivers/media/platform/qcom/camss/* +p" > 
>> /sys/kernel/debug/dynamic_debug/control
>>
>> NOTE: These changes depend on the multistream series, that as of yet
>> is still not merged upstream. However, part of the
>> multistream patches are merged in linux-next (tested on
>> tag:next-20221010), including the patch that introduces the
>> video_device_pipeline_alloc_start() functionality. This allows
>> applying and using this series on linux-next without applying the
>> complete multistream set.
>>
>> The CSID hardware on SM8250 can demux the input data stream into
>> maximum of 4 multiple streams depending on virtual channel (vc)
>> or data type (dt) configuration.
>>
>> Situations in which demuxing is useful:
>> - HDR sensors that produce a 2-frame HDR output, e.g. a light and a 
>> dark frame
>>    (the setup we used for testing, with the imx412 sensor),
>>    or a 3-frame HDR output - light, medium-lit, dark frame.
>> - sensors with additional metadata that is streamed over a different
>>    virtual channel/datatype.
>> - sensors that produce frames with multiple resolutions in the same 
>> pixel
>>    data stream
>>
>> With these changes, the CSID entity has, as it did previously, a single
>> sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
>> virtual channel configuration is determined by which of the source ports
>> are linked to an output VFE line. For example, the link below will
>> configure the CSID driver to enable vc 0 and vc 1:
>>
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
>>
>> which will be demuxed and propagated into /dev/video0
>> and /dev/video1 respectively. With this, the userspace can use
>> any normal V4L2 client app to start/stop/queue/dequeue from these
>> video nodes. Tested with the yavta app.
>>
>> The format of each RDI channel of the used VFE(s) (msm_vfe0_rdi0,
>> msm_vfe0_rdi1,...) must also be configured explicitly.
>>
>> Note that in order to keep a valid internal subdevice state,
>> setting the sink pad format of the CSID subdevice will propagate
>> this format to the source pads. However, since the CSID hardware
>> can demux the input stream into several streams each of which can
>> be a different format, in that case each source pad's
>> format must be set individually, e.g.:
>>
>> media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
>> media-ctl -V '"msm_csid0":2[fmt:SRGGB10/960x540]'
>>
>> Milen Mitkov (4):
>>    media: camss: sm8250: Virtual channels for CSID
>>    media: camss: vfe: Reserve VFE lines on stream start and link to CSID
>>    media: camss: vfe-480: Multiple outputs support for SM8250
>>    media: camss: sm8250: Pipeline starting and stopping for multiple
>>      virtual channels
>>
>>   .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
>>   .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
>>   .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>>   .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
>>   drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
>>   .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
>>   drivers/media/platform/qcom/camss/camss.c     |  2 +-
>>   7 files changed, 140 insertions(+), 60 deletions(-)
>>
>
> Hi Milen
>
> The set applies to next-20221013 including patch#4.
>
> I can confirm it doesn't break anything for me - though my sensor is a 
> bog-standard imx577 so it doesn't have any VC support.
>
> Before I give you a tested-by for the series .. is this normal ?
>
> [   90.535909] qcom-camss ac6a000.camss: VFE HW Version = 2.0.1
> [   90.545756] qcom-camss ac6a000.camss: CSIPHY 3PH HW Version = 
> 0x40010000
> [   90.546358] qcom-camss ac6a000.camss: CSID HW Version = 2.0.1
> [   90.546365] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
> virtual channels mask 0x1
> [   90.547675] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
> virtual channels mask 0x0
>
> I have
>
> - ov9282 on cam1
> - imx577 on cam2
>
> i.e. why do I see this message twice if I only have the one sensor 
> active, with no VCs and one operable camera ?
>
> ---
> bod


Hey Bryan,

I don't see the second print (..."virtual channels mask 0x0") on my side 
when testing with the standard imx577 driver. I also have imx577 on slot 
2 and ov9282 on slot 1. I am testing with:

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"imx577 
'22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0


What is your testing procedure?


Regards,

Milen

