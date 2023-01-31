Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AACE8682802
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 10:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbjAaJES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 04:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjAaJDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 04:03:51 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEC84B497;
        Tue, 31 Jan 2023 01:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1675155629; x=1706691629;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1w/bLi6ubmYYqzZoBT/BWq/FEa5dz+0M/aMzdyWHTDA=;
  b=nIl/xANBTTSpLHVGDy5WT9IzE5xB1f2wyT/2IXJvTC/84ew/ghOy8SWM
   XQfOdv9fn+PWKIkE2oAbo6CyOqeGLhiM3hYoPPjfHNszmsuKKtP7lNwCr
   Sa0zv6RWVBqTwTBsv+MuS3x3UKvTKdrTujNqU6RZ5bytWVJauCZtpg2fi
   o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Jan 2023 01:00:11 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 01:00:09 -0800
Received: from [10.251.45.85] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 01:00:06 -0800
Message-ID: <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
Date:   Tue, 31 Jan 2023 11:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
Content-Language: en-US
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/12/2022 11:40, quic_mmitkov@quicinc.com wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>
> For v7:
> - Fix an issue with output state for different versions of the IFE
>    hardware (for platforms different from QRB5, e.g. QRB3).
>
> For v6:
> - Fix for a potential race condition in csid
> - More detailed description on how to use/test this feature in
>    user-space in the last patch.
>
> For v5:
> - Use entity->use_count instead of s_stream subdev call ret code to
>    check if another instance of the pipeline is running. Prevents an
>    error on 6.1 and up, when stopping one of several simultaneous
>    instances.
> - flush buffers instead of just returning if the pipeline didn't start.
>
> For v4:
> - fixes the warning reported by the kernel test robot
> - tiny code change to enable the vc functionality with the partially-applied
>    multistream patches on linux-next (tested on tag:next-20221010)
>
> For v3:
> - setting the sink pad format on the CSID entity will now propagate the
>    format to the source pads to keep the subdev in a valid internal state.
> - code syntax improvements
>
> For v2:
> - code syntax improvements
> - The info print for the enabled VCs was demoted to a dbg print. Can be
>    enabled with dynamic debug, e.g.:
> echo "file drivers/media/platform/qcom/camss/* +p" > /sys/kernel/debug/dynamic_debug/control
>
> NOTE: These changes depend on the multistream series, that as of yet
> is still not merged upstream. However, part of the
> multistream patches are merged in linux-next (tested on
> tag:next-20221010), including the patch that introduces the
> video_device_pipeline_alloc_start() functionality. This allows
> applying and using this series on linux-next without applying the
> complete multistream set.
>
> The CSID hardware on SM8250 can demux the input data stream into
> maximum of 4 multiple streams depending on virtual channel (vc)
> or data type (dt) configuration.
>
> Situations in which demuxing is useful:
> - HDR sensors that produce a 2-frame HDR output, e.g. a light and a dark frame
>    (the setup we used for testing, with the imx412 sensor),
>    or a 3-frame HDR output - light, medium-lit, dark frame.
> - sensors with additional metadata that is streamed over a different
>    virtual channel/datatype.
> - sensors that produce frames with multiple resolutions in the same pixel
>    data stream
>
> With these changes, the CSID entity has, as it did previously, a single
> sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
> virtual channel configuration is determined by which of the source ports
> are linked to an output VFE line. For example, the link below will
> configure the CSID driver to enable vc 0 and vc 1:
>
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
>
> which will be demuxed and propagated into /dev/video0
> and /dev/video1 respectively. With this, the userspace can use
> any normal V4L2 client app to start/stop/queue/dequeue from these
> video nodes. Tested with the yavta app.
>
> The format of each RDI channel of the used VFE(s) (msm_vfe0_rdi0,
> msm_vfe0_rdi1,...) must also be configured explicitly.
>
> Note that in order to keep a valid internal subdevice state,
> setting the sink pad format of the CSID subdevice will propagate
> this format to the source pads. However, since the CSID hardware
> can demux the input stream into several streams each of which can
> be a different format, in that case each source pad's
> format must be set individually, e.g.:
>
> media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
> media-ctl -V '"msm_csid0":2[fmt:SRGGB10/960x540]'
>
> Milen Mitkov (4):
>    media: camss: sm8250: Virtual channels for CSID
>    media: camss: vfe: Reserve VFE lines on stream start and link to CSID
>    media: camss: vfe-480: Multiple outputs support for SM8250
>    media: camss: sm8250: Pipeline starting and stopping for multiple
>      virtual channels
>
>   .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
>   .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
>   .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>   .../media/platform/qcom/camss/camss-vfe-170.c |  4 +-
>   .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
>   .../platform/qcom/camss/camss-vfe-gen1.c      |  4 +-
>   drivers/media/platform/qcom/camss/camss-vfe.c |  1 +
>   .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
>   drivers/media/platform/qcom/camss/camss.c     |  2 +-
>   9 files changed, 138 insertions(+), 64 deletions(-)

Hi guys,

just a ping for this series.

Laurent, I sent you an email with answers to the questions you 
requested. I read your reply that you'll review these changes in the 
context of the multi-stream API, but this series doesn't really use the 
multi-stream API, just a note.

Cheers,

Milen

