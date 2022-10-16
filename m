Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8CC5FFCF6
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 03:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiJPBqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Oct 2022 21:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiJPBqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Oct 2022 21:46:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070A911C18;
        Sat, 15 Oct 2022 18:46:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AB1F30A;
        Sun, 16 Oct 2022 03:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665884775;
        bh=YDOM3lMyh9M7owe/+bGuu7XAjVQIxwukPr6wy9ip+ZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JhBrkoOYmBN4vwTYObCYAxN4kWWC3ONin6NOt6GGwySDZUNsHSfv3L5f4gB0V+NcV
         aPYpr7Z3lwyeSY2bVrCgXZR9rWTfv8nLGMT9IhvYpj1oq2vTqFVtV5lru3SkoRLnNC
         uSWAhZKuAB4W7QX/Ej4ODD18ooQqSBhbXkfhnMKU=
Date:   Sun, 16 Oct 2022 04:45:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     quic_mmitkov@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robert.foss@linaro.org, akapatra@quicinc.com, jzala@quicinc.com,
        todor.too@gmail.com, agross@kernel.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org, cgera@qti.qualcomm.com,
        gchinnab@quicinc.com, ayasan@qti.qualcomm.com
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support
 for SM8250
Message-ID: <Y0tiUGQa/oAis/jN@pendragon.ideasonboard.com>
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Milen,

Thank you for the patches.

I'll try to give this an initial review soon.

What hardware platform would you recommend, if any, if I wanted to test
this series ? Ideally that would be an off-the-shelf development board
that can easily be sourced, and that wouldn't require out-of-tree
drivers (beside perhaps for the camera sensor if it's not in mainline
yet) to test the camss driver (ethernet would be very appreciated, so
would display support).

On Thu, Oct 13, 2022 at 03:12:51PM +0300, quic_mmitkov@quicinc.com wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> For v4:
> - fixes the warning reported by the kernel test robot
> - tiny code change to enable the vc functionality with the partially-applied
>   multistream patches on linux-next (tested on tag:next-20221010)
> 
> For v3:
> - setting the sink pad format on the CSID entity will now propagate the
>   format to the source pads to keep the subdev in a valid internal state.
> - code syntax improvements
> 
> For v2:
> - code syntax improvements
> - The info print for the enabled VCs was demoted to a dbg print. Can be
>   enabled with dynamic debug, e.g.:
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
>   (the setup we used for testing, with the imx412 sensor),
>   or a 3-frame HDR output - light, medium-lit, dark frame.
> - sensors with additional metadata that is streamed over a different
>   virtual channel/datatype.
> - sensors that produce frames with multiple resolutions in the same pixel
>   data stream
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
>   media: camss: sm8250: Virtual channels for CSID
>   media: camss: vfe: Reserve VFE lines on stream start and link to CSID
>   media: camss: vfe-480: Multiple outputs support for SM8250
>   media: camss: sm8250: Pipeline starting and stopping for multiple
>     virtual channels
> 
>  .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
>  .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
>  .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
>  .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
>  drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
>  .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
>  drivers/media/platform/qcom/camss/camss.c     |  2 +-
>  7 files changed, 140 insertions(+), 60 deletions(-)

-- 
Regards,

Laurent Pinchart
