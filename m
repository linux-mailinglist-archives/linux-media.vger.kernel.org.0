Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC91C69CB01
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 13:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjBTM1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 07:27:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjBTM1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 07:27:33 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C24E1CADB
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 04:26:55 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id p8so1105879wrt.12
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 04:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kb40zCRCG0Ts9P9UQYan/H23HZMo02b3XwJCRH4S2VA=;
        b=zg9w0Qi48V8ias7c/JKEjrqhL7k1S1LWng/j81yDJwSQs1WL5Hqe+FaMwc70LwAy2r
         Jg8g4TVnJwVAsxohvs0gJrbXvMso7J70BXWVXEnV/4cnIN5v0l5ehOWsSoZ9bGBXBbKh
         tol+morF41ZWaaspaOlSd7LFi8mdtAVbRXYH45pXPzSfS3365vCZ9fYRCJSEELVu4Qrn
         UbcYtN6bYRWyADxGmN/d8M5kzMcAIzaiqhxo/3aqJjk1vfVfOWmoWV04TfkBK5cgu0Lg
         Z+qqgLjUk0WH/JNYc/MCOymzHcbOrlFf4BTRlFhkG96U3hM/0Bi7J1dPpYnmNt5Q660n
         1Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kb40zCRCG0Ts9P9UQYan/H23HZMo02b3XwJCRH4S2VA=;
        b=QUFv4PfAzXkapczBEk7g0p95pF5tNa9gQxuG1NzK2C6o6bc0Pothm1QLyLN5tql9wz
         tBXGvAA/Wbio35EJLHIjaUn/P6VMsB2DSpWwQo690Wuhw8lbet2Md9tunODkw7nZDbmV
         SUsc6iQIH6rCe8XuNPdbdH6/kj/HOSlixZX5Q6B3uo5iMmxr4dLoztM5hrT2FgGd4A7C
         7Akhgq+l6ZHLN46bEaTTLHiEYuf1PT3iUSLPKV1FRHipGgZonP/jGpq+fKZgcCWBw19+
         QkdkHfDc0yd2a3BkHYMoIvYm2rHr8iQ3uh5GOB5wld8i+MUhAQdVdmazLTAnogRr6EpU
         RqzA==
X-Gm-Message-State: AO0yUKVEMIjLGfBbBLahwsvOWKF9KtUhA7+MCujhIT9B+7cfPVP+zPb1
        5szS/eglkOyHiwBsPdFQ2k7KEA==
X-Google-Smtp-Source: AK7set/fy5lP7qVmm0q23HJceqKUZS4V/Ez02j8RNiwhoYErV4FbC+6MVI+kgJep19cX7EvdgWT5lg==
X-Received: by 2002:adf:ef0c:0:b0:2c3:f6ff:292c with SMTP id e12-20020adfef0c000000b002c3f6ff292cmr832717wro.55.1676895998798;
        Mon, 20 Feb 2023 04:26:38 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i21-20020a1c5415000000b003e208cec49bsm1285416wmb.3.2023.02.20.04.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 04:26:38 -0800 (PST)
Message-ID: <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
Date:   Mon, 20 Feb 2023 12:26:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
 <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/02/2023 12:18, Milen Mitkov (Consultant) wrote:
> On 31/01/2023 11:00, Milen Mitkov (Consultant) wrote:
>> On 09/12/2022 11:40, quic_mmitkov@quicinc.com wrote:
>>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>>
>>> For v7:
>>> - Fix an issue with output state for different versions of the IFE
>>>    hardware (for platforms different from QRB5, e.g. QRB3).
>>>
>>> For v6:
>>> - Fix for a potential race condition in csid
>>> - More detailed description on how to use/test this feature in
>>>    user-space in the last patch.
>>>
>>> For v5:
>>> - Use entity->use_count instead of s_stream subdev call ret code to
>>>    check if another instance of the pipeline is running. Prevents an
>>>    error on 6.1 and up, when stopping one of several simultaneous
>>>    instances.
>>> - flush buffers instead of just returning if the pipeline didn't start.
>>>
>>> For v4:
>>> - fixes the warning reported by the kernel test robot
>>> - tiny code change to enable the vc functionality with the 
>>> partially-applied
>>>    multistream patches on linux-next (tested on tag:next-20221010)
>>>
>>> For v3:
>>> - setting the sink pad format on the CSID entity will now propagate the
>>>    format to the source pads to keep the subdev in a valid internal 
>>> state.
>>> - code syntax improvements
>>>
>>> For v2:
>>> - code syntax improvements
>>> - The info print for the enabled VCs was demoted to a dbg print. Can be
>>>    enabled with dynamic debug, e.g.:
>>> echo "file drivers/media/platform/qcom/camss/* +p" > 
>>> /sys/kernel/debug/dynamic_debug/control
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
>>> - HDR sensors that produce a 2-frame HDR output, e.g. a light and a 
>>> dark frame
>>>    (the setup we used for testing, with the imx412 sensor),
>>>    or a 3-frame HDR output - light, medium-lit, dark frame.
>>> - sensors with additional metadata that is streamed over a different
>>>    virtual channel/datatype.
>>> - sensors that produce frames with multiple resolutions in the same 
>>> pixel
>>>    data stream
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
>>>    media: camss: sm8250: Virtual channels for CSID
>>>    media: camss: vfe: Reserve VFE lines on stream start and link to CSID
>>>    media: camss: vfe-480: Multiple outputs support for SM8250
>>>    media: camss: sm8250: Pipeline starting and stopping for multiple
>>>      virtual channels
>>>
>>>   .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
>>>   .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
>>>   .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>>>   .../media/platform/qcom/camss/camss-vfe-170.c |  4 +-
>>>   .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
>>>   .../platform/qcom/camss/camss-vfe-gen1.c      |  4 +-
>>>   drivers/media/platform/qcom/camss/camss-vfe.c |  1 +
>>>   .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
>>>   drivers/media/platform/qcom/camss/camss.c     |  2 +-
>>>   9 files changed, 138 insertions(+), 64 deletions(-)
>>
>> Hi guys,
>>
>> just a ping for this series.
>>
>> Laurent, I sent you an email with answers to the questions you 
>> requested. I read your reply that you'll review these changes in the 
>> context of the multi-stream API, but this series doesn't really use 
>> the multi-stream API, just a note.
>>
>> Cheers,
>>
>> Milen
>>
> Hi there,
> 
> Just another ping..:)
> 
> Please let me know if there's anything I could do (improve/fix/code 
> differently/etc.) to help get this series merged.
> 
> 
> Best Regards,
> 
> Milen
> 
> 
> 

Well, we need to re-verify it works on linux-next.

Other than that it seems OK to me.

---
bod
