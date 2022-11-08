Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F6262047E
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 01:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbiKHAMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 19:12:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiKHAMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 19:12:43 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB02B1F9E9
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 16:12:41 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id z14so18555150wrn.7
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 16:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQLGGh2c0FrDc8xrYdmfJRxfXXaVnRzp9E86zXF3WsU=;
        b=Gtjm8jWkjBa5D4KOFvfnaR18jG0/DGKd7PfqdzCjtwriU16+btp7YUoRj64+I56LjE
         oa6KwuCFR548dvtJR3ry1PwYa5S+Su2VlICmp22DeTsOtNn/PZej+bZ9olQVQKyEfSMD
         qHn6JC+gZBDqayib7FWvREBLDdH8F8RZlLX6YV1QkOIga8gs35Fw/yYRYtgM05ShPH6r
         45HmQ/puRy0+/0EL/S3oZ6diBUUmPYUGwD4a18zOHHUeB8aC8HnnoNFdCr9FrEDKZkqJ
         plejLwloChx8Y5YxCiUMqF5EMW49+Dhem9LbYeF7soPXM99QaPCIUM29QKynkOeUhfk3
         4EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQLGGh2c0FrDc8xrYdmfJRxfXXaVnRzp9E86zXF3WsU=;
        b=mEq4uv9Az8fUZpBXetgUD9xbOnad23pwoMOtLyYalVR6IynJz51mtgIVIs/xzS/zHY
         lrg12kxa2cEzG8MejbzZEJkHutjj7FY7/pfxJsotWQVMrVMFvU/64bezDY8HUKIfF8TV
         WwULW7RRK/HCC3TA/UP5fnxia0IhxvuL6m/PPSWNSt9NXaod0porrZUchYW8E/93oD7N
         ridFZPjx1PlAOvyhf6EjdpjNQPeJpQZjtlhFe213TU9VEt2cGJc7VH/tsVxWq09Np9aI
         ufwl62B8aBUiRjEyUb3R+bVPYPDz7L53p2U4IwLt/XjG7jUMlRWrG0SeuiFTyLmthjhc
         bLxg==
X-Gm-Message-State: ACrzQf3ie1LH2JP0YEemTwp3hysKrNf/XqvVlP/9CgpB4KEAEwCOV5VU
        zbl0YD1MlCIOvkDfh6P5Rc/dTA==
X-Google-Smtp-Source: AMsMyM5abVFTk1f+IEL0A0z5ffu6JIzbSpoKJ+WoIxrzCqzjOWXinvKRn5Fe2ck7XjMWONcJOF4R9w==
X-Received: by 2002:a05:6000:1109:b0:236:5d1f:5198 with SMTP id z9-20020a056000110900b002365d1f5198mr32424264wrw.22.1667866360502;
        Mon, 07 Nov 2022 16:12:40 -0800 (PST)
Received: from [192.168.0.159] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s1-20020a7bc381000000b003c6b874a0dfsm11136968wmj.14.2022.11.07.16.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 16:12:40 -0800 (PST)
Message-ID: <46d82762-8b6b-8a3e-0bdd-5598163244de@linaro.org>
Date:   Tue, 8 Nov 2022 00:12:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
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

I've done some offline work with Milen on this.

I'm happy enough to add my

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

to the series. I don't have - currently a VC enabled setup but for the 
simple case this set doesn't break anything on RB5 for me.

---
bod
