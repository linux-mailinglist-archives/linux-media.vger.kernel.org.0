Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBD2403ABD
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235502AbhIHNdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbhIHNds (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:33:48 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD50BC061757
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:32:40 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id x5so2327029ill.3
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RdtzwNEFqLqA3tpIdS51MoWtiiUaFHn6z50ywUjaYAI=;
        b=KgC13npi+zwcXid32lVaYsQ1vd3Jl6q7wyBIRD7SyD0k4FvGDHQkzENbsI4+f0YGYp
         SufQXj+/B5q4fdS3YtotpnLoKCpBQilv3cigQWEBuctprs5qNVQTxHIPMw4odKIcKxjv
         GpXeiF13AcZdvAUsHGqKnCWL77EkRZW1KLoH1Rd4O0927dLM+YwLXBPtBu4N8ZFAGd7j
         I+6m2D+5nTVYVdoCduudOJYPKIEobqjuN0rP8buOX9EW54MkdUBKuXctVUvAc0N4Q089
         X1gJwwrpzP9+kLtVtBrSiKUMxeZajw4i42aP4QAKmBGyRbq6JA8HNukzcj3vWYiv0wX8
         Ny1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RdtzwNEFqLqA3tpIdS51MoWtiiUaFHn6z50ywUjaYAI=;
        b=H1IndmVti76+e3YasMgbcXH8fO3O0qrlnjz9LQDvsc9M+oBYeAQBjfqJ/29E8IZunn
         NKu3yVPaC/392QRQiQdHv/eY1OQu2LAXiTPTXDs72pubTuQYRbhq4Il1pqeTLakddTZ1
         SUhe6CWoFwCk+IKc2shzD2A05baYE5tk9YYEKXBNqd6zrLhMR8Xc0L4wVcATVyqFVkYx
         HJZT2BUvKmUOex0yCC5JssIc2FkVQHRJu1gMCjNFzPhahwviL2ONC6hnZ7KGhQN1ndLj
         IEX2IyRY/AByTSEyugT8o9D/zqMVvlYYBOadyoV3nrPkbeSI/2QYHL7aKPyUYoLgcxSs
         MMTg==
X-Gm-Message-State: AOAM531o4EeqDQ2pBdvZf99yJDQauW5rXkLR78f0AD/5TIezFWe+jJ9X
        juQmWfcm4J5hcy0semg5r/KsiA==
X-Google-Smtp-Source: ABdhPJypjj0Fuf0YV+dNeiT3WvoCwsJ6BXbv+eL/GK8pGmGiwddvFk8jnVNo6gydzyj4IVms5ylF+A==
X-Received: by 2002:a92:bf0b:: with SMTP id z11mr2704894ilh.117.1631107960320;
        Wed, 08 Sep 2021 06:32:40 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id u13sm1093530iot.29.2021.09.08.06.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 06:32:39 -0700 (PDT)
Message-ID: <fffd24d3374ecb2fbfafa9b85fa0ef8012fc7efa.camel@ndufresne.ca>
Subject: Re: [PATCH v8 04/15] media:Add v4l2 event codec_error and skip
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Wed, 08 Sep 2021 09:32:38 -0400
In-Reply-To: <647f84c1e7c2a48d6492d38fa4f06586235500b8.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
         <647f84c1e7c2a48d6492d38fa4f06586235500b8.1631002447.git.ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

more API only review.

Le mardi 07 septembre 2021 à 17:49 +0800, Ming Qian a écrit :
> The codec_error event can tell client that
> there are some error occurs in the decoder engine.
> 
> The skip event can tell the client that
> there are a frame has been decoded,
> but it won't be outputed.
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  .../userspace-api/media/v4l/vidioc-dqevent.rst       | 12 ++++++++++++
>  include/uapi/linux/videodev2.h                       |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> index 6eb40073c906..87d40ad25604 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> @@ -182,6 +182,18 @@ call.
>  	the regions changes. This event has a struct
>  	:c:type:`v4l2_event_motion_det`
>  	associated with it.
> +    * - ``V4L2_EVENT_CODEC_ERROR``
> +      - 7
> +      - This event is triggered when some error occurs inside the codec engine,
> +	usually it can be replaced by a POLLERR event, but in some cases, the POLLERR
> +	may cause the application to exit, but this event can allow the application to
> +	handle the codec error without exiting.

Events are sent to userspace in a separate queue from the VB2 queue. Which means
it's impossible for userspace to know where this error actually took place.
Userspace may endup discarding valid frames from the VB queue, as it does not
know which one are good, and which one are bad.

There is likely a bit of spec work to be done here for non-fatal decode errors,
but I think the right approach is to use V4L2_BUF_FLAG_ERROR. What we expect
from decoders is that for each frame, a CAPTURE buffer is assigned. If decoding
that frame was not possible but the error is recoverable (corrupted bitstream,
missing reference, etc.), then the failing frame get marked with FLAG_ERROR and
decoding continues as usual.

What isn't documented is that you can set bytesused to 0, meaning there is
nothing useful in that frame, or a valid bytesused when you know only some
blocks are broken (e.g. missing 1 ref). Though, GStreamer might be the only
implementation of that, and byteused 0 may confuse some existing userspace.

> +    * - ``V4L2_EVENT_SKIP``
> +      - 8
> +      - This event is triggered when one frame is decoded, but it won't be outputed
> +	to the display. So the application can't get this frame, and the input frame count
> +	is dismatch with the output frame count. And this evevt is telling the client to
> +	handle this case.

Similar to my previous comment, this event is flawed, since userspace cannot
know were the skip is located in the queued buffers. Currently, all decoders are
mandated to support V4L2_BUF_FLAG_TIMESTAMP_COPY. The timestamp must NOT be
interpreted by the driver and must be reproduce as-is in the associated CAPTURE
buffer. It is possible to "garbage" collect skipped frames with this method,
though tedious.

An alternative, and I think it would be much nicer then this, would be to use
the v4l2_buffer.sequence counter, and just make it skip 1 on skips. Though, the
down side is that userspace must also know how to reorder frames (a driver job
for stateless codecs) in order to identify which frame was skipped. So this is
perhaps not that useful, other then knowing something was skipped in the past.

A third option would be to introduce V4L2_BUF_FLAG_SKIPPED. This way the driver
could return an empty payload (bytesused = 0) buffer with this flag set, and the
proper timestamp properly copied. This would let the driver communicate skipped
frames in real-time. Note that this could break with existing userspace, so it
would need to be opted-in somehow (a control or some flags).

>      * - ``V4L2_EVENT_PRIVATE_START``
>        - 0x08000000
>        - Base event number for driver-private events.
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5bb0682b4a23..c56640d42dc5 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2369,6 +2369,8 @@ struct v4l2_streamparm {
>  #define V4L2_EVENT_FRAME_SYNC			4
>  #define V4L2_EVENT_SOURCE_CHANGE		5
>  #define V4L2_EVENT_MOTION_DET			6
> +#define V4L2_EVENT_CODEC_ERROR			7
> +#define V4L2_EVENT_SKIP				8
>  #define V4L2_EVENT_PRIVATE_START		0x08000000
>  
>  /* Payload for V4L2_EVENT_VSYNC */


