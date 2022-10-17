Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93CA600479
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 02:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiJQAQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 20:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiJQAQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 20:16:09 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7B92A439
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 17:16:08 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so8853497wmq.4
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 17:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BAy2FGIW6hlHw6+yE60sSKg3Uf44BaiTThWnPaLoIkY=;
        b=w9oY7ADSx+3vkbSZwYcTMB3NAWM4GRvBkYGHLdINZUNou6qcBik2MPd+0ebMtLiRQw
         pF5b1dnqeVn4mpJtvw5ifqLUkd0YP3HtmqYLCFJiiC47QVdv1s1IXMZ7cZbdjBO1xkBk
         HVP0Uecd2j1xGBpNsQaQaecssPHLW/bmCA2Oqwu9DhmI9jfAHXJiNRYPnCNoIGP4+YvN
         8jl6YQeBYqDeU4w/h13cNrJZG9QXgYdUYzX0n/v90Jv8/BW00eqOD37+ZU+LDyRJtKFf
         Iq2dUrmAjzRF3as8SvTJQTveNEtzR83Hpik/DIDGWO8uN77x1ss2wHBr1R572db6sKT9
         xitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAy2FGIW6hlHw6+yE60sSKg3Uf44BaiTThWnPaLoIkY=;
        b=OI0VNJ3yC/kcUSbi20wjbqAISEP9SuwJQ+LKdCSZaK8YIfeAN6EX2F68Or+ABddmFb
         USajv/SQuNoPe8yU5xC+ndLtSdgzQwUK6vdW2qaK19mdancId/DCkaij0/ZQO+V1IOr8
         HXV3IplTowv+CHHaIdWi/ULvPPontRjWtk9p0Uy27ybf1KuyUzJ+VH+n/M8sA87r7Zdv
         +MZaK00sUO8cHLEWIh9QrSuWuPUXwbufHtgegyY/a9en0TFgU90A47zQ6cozxbjPLrzw
         TQj1FsLYoUEH7p9T90siuRU3J/6mapd7SLH2BLRmGZCr0HYRxCun69MUas0kiCSb+Kfl
         Shxw==
X-Gm-Message-State: ACrzQf3devAdWI0x3Hw3C56wrhhfJoXtw8BWx5Agi4uNHRCAMvWefApq
        fzenvQvZ8411IN6XE/H8bjCB/A==
X-Google-Smtp-Source: AMsMyM5wFYhCEkcX4jatnoJB+ZfsFb6hTXEID6u3vL571fGn5OJYwl66q8boBqXNlwqXtt9e1l6zbQ==
X-Received: by 2002:a05:600c:1d02:b0:3c3:e6f0:6e4b with SMTP id l2-20020a05600c1d0200b003c3e6f06e4bmr5531824wms.202.1665965767167;
        Sun, 16 Oct 2022 17:16:07 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d5-20020adfe845000000b0022b1d74dc56sm7124519wrn.79.2022.10.16.17.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 17:16:06 -0700 (PDT)
Message-ID: <1a7ab9da-e7fb-9077-5d6e-705629bb2b10@linaro.org>
Date:   Mon, 17 Oct 2022 01:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/10/2022 13:12, quic_mmitkov@quicinc.com wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
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
>   .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
>   drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
>   .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
>   drivers/media/platform/qcom/camss/camss.c     |  2 +-
>   7 files changed, 140 insertions(+), 60 deletions(-)
> 

Hi Milen

The set applies to next-20221013 including patch#4.

I can confirm it doesn't break anything for me - though my sensor is a 
bog-standard imx577 so it doesn't have any VC support.

Before I give you a tested-by for the series .. is this normal ?

[   90.535909] qcom-camss ac6a000.camss: VFE HW Version = 2.0.1
[   90.545756] qcom-camss ac6a000.camss: CSIPHY 3PH HW Version = 0x40010000
[   90.546358] qcom-camss ac6a000.camss: CSID HW Version = 2.0.1
[   90.546365] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
virtual channels mask 0x1
[   90.547675] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
virtual channels mask 0x0

I have

- ov9282 on cam1
- imx577 on cam2

i.e. why do I see this message twice if I only have the one sensor 
active, with no VCs and one operable camera ?

---
bod
