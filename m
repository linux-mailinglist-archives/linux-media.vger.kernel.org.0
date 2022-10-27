Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A66E60F7FB
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 14:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbiJ0MuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 08:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235945AbiJ0Mtv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 08:49:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407F913CF2;
        Thu, 27 Oct 2022 05:49:46 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC0FB88F;
        Thu, 27 Oct 2022 14:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666874983;
        bh=TFDd7uxACOqrsIbiC9EwS6vML83EZ1hkuCkafkuVNlI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lTRDxb5ikqWzZOQDexicQb5j2F5JK0qqOgiQCKyPyAdPZWMCmqRX3O/IJ7oKfRKrJ
         u1Yja/EJRS9QdbomTsrL5GuSYLlXyQrbFXYfaGsQTID6JPN1bsN3+BjN3t1przCM/y
         56+DrrP6kUps9MhDa9Fnz/EslqOd5IrkbK4EY9Fg=
Message-ID: <774ff878-801d-5de1-8a98-bf610088fcfd@ideasonboard.com>
Date:   Thu, 27 Oct 2022 15:49:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        akapatra@quicinc.com, jzala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        quic_mmitkov@quicinc.com, robert.foss@linaro.org,
        todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
 <1a7ab9da-e7fb-9077-5d6e-705629bb2b10@linaro.org>
 <166601200198.3760285.1520904024668899853@Monstersaurus>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <166601200198.3760285.1520904024668899853@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/10/2022 16:06, Kieran Bingham wrote:
> Quoting Bryan O'Donoghue (2022-10-17 01:16:05)
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
>>
>> Hi Milen
>>
>> The set applies to next-20221013 including patch#4.
>>
>> I can confirm it doesn't break anything for me - though my sensor is a
>> bog-standard imx577 so it doesn't have any VC support.
> 
> Interesting though - the IMX477 has the ability to convey metadata on a
> separate VC... That's actually the thing holding back the RPi IMX477
> driver from mainline, as the way it was anticipated to support multiple
> data streams is with the new multiplexed streams API.

Note that while the streams series enables the support for multiple 
streams, metadata support is not included. This mainly means the 
metadata mbus/v4l2 formats.

We've had some discussions about this with Laurent and Sakari, and it 
sounds like a rather complex issue (although you can skip the problems 
by just adding a custom metadata format, which I'm doing in my work 
branch to test metadata).

  Tomi

