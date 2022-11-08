Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2456A620D6E
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 11:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbiKHKgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 05:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233949AbiKHKfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 05:35:55 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4414343841
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 02:35:51 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id kt23so37371218ejc.7
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QzGzsYzfZld5BaPsWA5Lt7NjqLM8KvUDhOQ6bLN6+Og=;
        b=p2tdeDcHOvdvUTcDLFXYRVq4ekKoCNHqucsPWZvzZE97BFX7xpmVJ/CI5ytB8q2vTp
         jWX3m1b0qgSIjDxOBWKwIuUhzj/SfDebRy0dDwWP7yyMGJHkmDVOPoZzD0CJ0hKn0UD2
         3K0GFhZubMWCvjTAlMPSyuzZJgv2g/DOkK+D2umwGJ8dvv0LLVRovwZXC5PHc1vxs4v+
         LZ1BsutMnBr9X9Ou9tGabFs3vrv46Zn76bMv6p5eoNUW0Yf8qNY7I3gOQiK/krUgrESk
         I1jLhtmT9ZWkvBQVtvULojmEzs+ios3PbhEPgfy485phQntChVfnk+PudKmufTMIB1iA
         e3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzGzsYzfZld5BaPsWA5Lt7NjqLM8KvUDhOQ6bLN6+Og=;
        b=nKNBIlF8QnAjYV1Qq/ywsusQObKaR+hmQgYsccn7GiAyfETDicdpigVRWKZIm9VTZ0
         OBIgEWOyiQVQ5Ov0U6eTIxD9FUzGpz9ZNp1DazEPtrgiCDAQGG5SRR55iHYuKjvBk8vZ
         M5u/uG0ZivORPH6bsKOc+WkLSSDadToKO91sUiZBmHeNQsdBV9Oj2g9wwzYIlog0HENG
         emA1ggO8uJVNCUf7LNVkCSA7W1rjpIr1hi0XLP9hOS8Rs9z0QaYea3KoRyvim9JUqhU8
         2IhWgzeWIjmNvoijjF/lwowmBL3e4SckeK6qJWtgd9PLoPqsJzgo/Ia4OwgTVbnbKxFg
         t/tg==
X-Gm-Message-State: ACrzQf2RxQ8T7/vE9CEuVkNRWIdsM0oj+4LabKSJUN0bZqsDnmzdOZ4L
        HerxhXlWsQnQOlPeiD4l5EjCCf9zfKh5MwjuxjRBEw==
X-Google-Smtp-Source: AMsMyM4XmkDJX+qrSEP4SpZrn8cWb1HWzNQvAAk1OfJ9imq8qxTAL9wtzeIx9tJqISQizQs+QRf+dML5kSmR4FEmz9A=
X-Received: by 2002:a17:906:6956:b0:7ae:3a0b:c6f6 with SMTP id
 c22-20020a170906695600b007ae3a0bc6f6mr20431161ejs.383.1667903749742; Tue, 08
 Nov 2022 02:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com> <46d82762-8b6b-8a3e-0bdd-5598163244de@linaro.org>
In-Reply-To: <46d82762-8b6b-8a3e-0bdd-5598163244de@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 8 Nov 2022 11:35:38 +0100
Message-ID: <CAG3jFysAfymcFS54CyxBYhJbQ4Qh7bvhpE8UPc3S1o_8uQq7Xg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for SM8250
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, akapatra@quicinc.com,
        jzala@quicinc.com, todor.too@gmail.com, agross@kernel.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 8 Nov 2022 at 01:12, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 13/10/2022 13:12, quic_mmitkov@quicinc.com wrote:
> > From: Milen Mitkov <quic_mmitkov@quicinc.com>
> >
> > For v4:
> > - fixes the warning reported by the kernel test robot
> > - tiny code change to enable the vc functionality with the partially-applied
> >    multistream patches on linux-next (tested on tag:next-20221010)
> >
> > For v3:
> > - setting the sink pad format on the CSID entity will now propagate the
> >    format to the source pads to keep the subdev in a valid internal state.
> > - code syntax improvements
> >
> > For v2:
> > - code syntax improvements
> > - The info print for the enabled VCs was demoted to a dbg print. Can be
> >    enabled with dynamic debug, e.g.:
> > echo "file drivers/media/platform/qcom/camss/* +p" > /sys/kernel/debug/dynamic_debug/control
> >
> > NOTE: These changes depend on the multistream series, that as of yet
> > is still not merged upstream. However, part of the
> > multistream patches are merged in linux-next (tested on
> > tag:next-20221010), including the patch that introduces the
> > video_device_pipeline_alloc_start() functionality. This allows
> > applying and using this series on linux-next without applying the
> > complete multistream set.
> >
> > The CSID hardware on SM8250 can demux the input data stream into
> > maximum of 4 multiple streams depending on virtual channel (vc)
> > or data type (dt) configuration.
> >
> > Situations in which demuxing is useful:
> > - HDR sensors that produce a 2-frame HDR output, e.g. a light and a dark frame
> >    (the setup we used for testing, with the imx412 sensor),
> >    or a 3-frame HDR output - light, medium-lit, dark frame.
> > - sensors with additional metadata that is streamed over a different
> >    virtual channel/datatype.
> > - sensors that produce frames with multiple resolutions in the same pixel
> >    data stream
> >
> > With these changes, the CSID entity has, as it did previously, a single
> > sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
> > virtual channel configuration is determined by which of the source ports
> > are linked to an output VFE line. For example, the link below will
> > configure the CSID driver to enable vc 0 and vc 1:
> >
> > media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> > media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
> >
> > which will be demuxed and propagated into /dev/video0
> > and /dev/video1 respectively. With this, the userspace can use
> > any normal V4L2 client app to start/stop/queue/dequeue from these
> > video nodes. Tested with the yavta app.
> >
> > The format of each RDI channel of the used VFE(s) (msm_vfe0_rdi0,
> > msm_vfe0_rdi1,...) must also be configured explicitly.
> >
> > Note that in order to keep a valid internal subdevice state,
> > setting the sink pad format of the CSID subdevice will propagate
> > this format to the source pads. However, since the CSID hardware
> > can demux the input stream into several streams each of which can
> > be a different format, in that case each source pad's
> > format must be set individually, e.g.:
> >
> > media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
> > media-ctl -V '"msm_csid0":2[fmt:SRGGB10/960x540]'
> >
> > Milen Mitkov (4):
> >    media: camss: sm8250: Virtual channels for CSID
> >    media: camss: vfe: Reserve VFE lines on stream start and link to CSID
> >    media: camss: vfe-480: Multiple outputs support for SM8250
> >    media: camss: sm8250: Pipeline starting and stopping for multiple
> >      virtual channels
> >
> >   .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
> >   .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
> >   .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
> >   .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
> >   drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
> >   .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
> >   drivers/media/platform/qcom/camss/camss.c     |  2 +-
> >   7 files changed, 140 insertions(+), 60 deletions(-)
> >
>
> I've done some offline work with Milen on this.
>
> I'm happy enough to add my
>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> to the series. I don't have - currently a VC enabled setup but for the
> simple case this set doesn't break anything on RB5 for me.
>
> ---
> bod

This series has my ack.

Acked-by: Robert Foss <robert.foss@linaro.org>
