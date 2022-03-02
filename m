Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1414CA949
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 16:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbiCBPlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 10:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbiCBPlX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 10:41:23 -0500
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97DFCB64E;
        Wed,  2 Mar 2022 07:40:39 -0800 (PST)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 4069E3C0016;
        Wed,  2 Mar 2022 16:40:38 +0100 (CET)
Received: from vmlxhi-121.adit-jv.com (10.72.92.132) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 2 Mar
 2022 16:40:38 +0100
Date:   Wed, 2 Mar 2022 16:40:33 +0100
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Michael Rodin <mrodin@de.adit-jv.com>
Subject: Re: [PATCH 2/4] media: videobuf2: Add a transfer error event
Message-ID: <20220302154033.GA17027@vmlxhi-121.adit-jv.com>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211108160220.767586-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.92.132]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

thank you for addressing the problem, which I tried to solve in [1]!
I have a few concerns about this patch...

[1] https://lore.kernel.org/linux-renesas-soc/1592588777-100596-1-git-send-email-mrodin@de.adit-jv.com/

On Mon, Nov 08, 2021 at 05:02:18PM +0100, Niklas Söderlund wrote:
> Add a new V4L2_EVENT_XFER_ERROR event to signal if a unrecoverable error
> happens during video transfer.
> 
> The use-case that sparked this new event is to signal to the video
> device driver that an error has happen on the CSI-2 bus from the CSI-2
> receiver subdevice.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/userspace-api/media/v4l/vidioc-dqevent.rst     | 5 +++++
>  Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
>  include/uapi/linux/videodev2.h                               | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> index 6eb40073c906deba..84984641c9351aa9 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> @@ -182,6 +182,11 @@ call.
>  	the regions changes. This event has a struct
>  	:c:type:`v4l2_event_motion_det`
>  	associated with it.
> +    * - ``V4L2_EVENT_XFER_ERROR``
> +      - 7
> +      - This event is triggered when an transfer error is detected while
> +        streaming. For example if a unrecoverable error is detected on a video
> +        bus in the pipeline.

Could you please mention, what a userspace application and a video capture
driver are supposed to do after reception of this event? (e.g. should video
capture driver execute vb2_queue_error as done in the patch 3?) I have a
few concerns depending on the kind of error which this event will report:
 1. If an error is "unrecoverable" as you mentioned, then the overall
    video pipeline is in an unusable state, so sending this event to
    userspace probably does not make sense, since we can already signal IO
    error to userspace via vb2_queue_error.
 2. If this event is also for reporting recoverable errors, e.g. which can
    be recovered by restarting the video pipeline, then probably it makes
    sense to explicitly mention, who shall restart the video pipeline
    via streamoff/streamon: application or video capture driver?

>      * - ``V4L2_EVENT_PRIVATE_START``
>        - 0x08000000
>        - Base event number for driver-private events.
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index eb0b1cd37abd9381..7ed9884b879c888e 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -498,6 +498,7 @@ replace define V4L2_EVENT_CTRL event-type
>  replace define V4L2_EVENT_FRAME_SYNC event-type
>  replace define V4L2_EVENT_SOURCE_CHANGE event-type
>  replace define V4L2_EVENT_MOTION_DET event-type
> +replace define V4L2_EVENT_XFER_ERROR event-type
>  replace define V4L2_EVENT_PRIVATE_START event-type
>  
>  replace define V4L2_EVENT_CTRL_CH_VALUE ctrl-changes-flags
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index f118fe7a9f58d240..48d4738eb862418b 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2373,6 +2373,7 @@ struct v4l2_streamparm {
>  #define V4L2_EVENT_FRAME_SYNC			4
>  #define V4L2_EVENT_SOURCE_CHANGE		5
>  #define V4L2_EVENT_MOTION_DET			6
> +#define V4L2_EVENT_XFER_ERROR			7
>  #define V4L2_EVENT_PRIVATE_START		0x08000000
>  
>  /* Payload for V4L2_EVENT_VSYNC */
> -- 
> 2.33.1
> 

-- 
Best Regards,
Michael
