Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95AB601103
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 16:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbiJQOWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 10:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiJQOWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 10:22:15 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9BC2408A
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 07:22:13 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id bu30so18701684wrb.8
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 07:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TuOMl3iT0yyNJ+0dzGqfmuaNm/ol+M26qoUuhqpcYfk=;
        b=DC4nCcnDdyHi5kJ5tIjaAAHoVhtdOgolEGfdfypoRv+Yn9htV7bhLNcZRt8oPphBaA
         d29dVNuVRDpw9usB08oNYmOQxpoTgFKDgobVYegn4PXITiITPzRhyrZmxyL2M5WPUkiq
         pQY3LvoJ+pFDi+DrR43UbQcgMTyqpOXULqRFeiUdv9La0Qe/+Diwkcqkc7lQGbNzOJWz
         6FIRRddUluOvDg4AJ60fcBAgKjfS0FwfJHkrffctCXAWhP6wNQSgge9k5RJAyY8veeAG
         xKdfQo/fMGMLvvOQ9u/6yXanq1Zl9VC8G1/QuRTCnGxgCzJ0ACeYreJ8QO6cT6XJ0VhV
         9v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuOMl3iT0yyNJ+0dzGqfmuaNm/ol+M26qoUuhqpcYfk=;
        b=BZRJYYE0l4chyCG1VPcqWM4aE+jKriPpTUYnuEsY2WxQWdZJAGJGH8OlfcJQKddxDT
         hQ3BVDSrn/j4YM8jIFM58kChSVX4kZRdB+Fwk9QeUH24vME8bP5u/2nFdB0oprSo5ivh
         9797241h3hJ1CnNMh9oOdUl6eXuztwrbfXDuXdwXIsr3nxkZD1AkMLrxswwhC16191R/
         Yox5exZTYN03TB3jGqt5sVapvfbtxCmbMUtGdA1rW6KgaOFrWexBjEafJPW8XAo6CRwa
         uZHqpmqmT6t8rzA5SviScLwKeFy7U2KfSybnRJnF4Ym2VUki8NkZ0wHnuJP1c++b2LBO
         E6/A==
X-Gm-Message-State: ACrzQf0r8J3wKHdXLlBV+dFFCbRbUrQ1ZSHFIfO6vF+Csqw42XCUo1Bk
        3yq3z/62NT05Z49Nb0SotSJlwA==
X-Google-Smtp-Source: AMsMyM6VdbLnrsRYaMWBmueogmtwKtHU7EAurWG76b8EBxq9HrxDAgCDdbwwdVXl5moBKswGY2TO5Q==
X-Received: by 2002:a5d:526d:0:b0:22e:4f4d:2546 with SMTP id l13-20020a5d526d000000b0022e4f4d2546mr6410119wrc.464.1666016532297;
        Mon, 17 Oct 2022 07:22:12 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d62c5000000b00228cbac7a25sm8590928wrv.64.2022.10.17.07.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 07:22:11 -0700 (PDT)
Message-ID: <89dcd314-37bb-b944-b7e6-b6c71a3514fc@linaro.org>
Date:   Mon, 17 Oct 2022 15:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        akapatra@quicinc.com, jzala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        quic_mmitkov@quicinc.com, robert.foss@linaro.org,
        todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
 <1a7ab9da-e7fb-9077-5d6e-705629bb2b10@linaro.org>
 <166601200198.3760285.1520904024668899853@Monstersaurus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <166601200198.3760285.1520904024668899853@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/10/2022 14:06, Kieran Bingham wrote:
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
> 
> And I think we inferred that the IMX577 and IMX477 are closely related,
> so should have similar capabilities for obtaining metadata channels?

Hmm I was not aware of that.

If we could import the rpi/imx477.c code into upstrea/imx412.c it might 
be possible

The core init is very similar

https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/imx477.c#L167

https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/imx412.c#L160

Maybe it would be possible to apply the rest of the imx477 config on-top 
as a POC

https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/imx477.c#L479

The similary is born out by the shared init code I can see in Leopard 
imaging's driver, I'm not sure if it supports virtual-channels - I'll 
have a look, though.

What's in the imx477 meta-data ?

@Milen if you have the imx577 datasheet - I don't - perhaps we could 
cherry-pick some of the code from imx477 and get the imx412.c->imx577 
dumping VC data out with the RB5 camera mezzanine.

---
bod
