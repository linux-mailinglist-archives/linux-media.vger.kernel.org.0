Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775F6637830
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 12:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiKXL4f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 06:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiKXL4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 06:56:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62635C663A
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 03:56:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09F1AB827A5
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 11:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EF4C433D6;
        Thu, 24 Nov 2022 11:56:30 +0000 (UTC)
Message-ID: <f37e7980-7096-3f8d-6ced-1843c0adac34@xs4all.nl>
Date:   Thu, 24 Nov 2022 12:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] media: add V4L2_BUF_FLAG_TIMESTAMP_UTC and
 V4L2_BUF_FLAG_TIMESTAMP_TAI.
Content-Language: en-US
To:     Philippe De Muyter <phdm@macqel.be>, linux-media@vger.kernel.org
References: <1612172048-28830-1-git-send-email-phdm@macqel.be>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <1612172048-28830-1-git-send-email-phdm@macqel.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philippe,

I'm cleaning up old patches and I decided to mark this as Obsolete since
there has been no activity for a long time. If you still want to pursue this,
then post a v2.

In any case, this patch can only be accepted if there is also a driver in
the mainline kernel that uses it.

Regards,

	Hans

On 01/02/2021 10:34, Philippe De Muyter wrote:
> Since V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN and
> V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC were added long ago, no other flag
> was introduced to indicate precisely the reference clock used for
> timestamps associated to v4l2 buffers.  Add here the ability for drivers
> to use the realtime (= UTC) or TAI clock.
> 
> Signed-off-by: Philippe De Muyter <phdm@macqel.be>
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst | 14 ++++++++++++++
>  include/trace/events/v4l2.h                      |  2 ++
>  include/uapi/linux/videodev2.h                   |  2 ++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 1b0fdc1..44cb59b 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -637,6 +637,20 @@ Buffer Flags
>        - The buffer timestamp has been taken from the ``CLOCK_MONOTONIC``
>  	clock. To access the same clock outside V4L2, use
>  	:c:func:`clock_gettime`.
> +    * .. _`V4L2-BUF-FLAG-TIMESTAMP-UTC`:
> +
> +      - ``V4L2_BUF_FLAG_TIMESTAMP_UTC``
> +      - 0x00008000
> +      - The buffer timestamp has been taken from the ``CLOCK_REALTIME``
> +	clock. To access the same clock outside V4L2, use
> +	:c:func:`clock_gettime`.
> +    * .. _`V4L2-BUF-FLAG-TIMESTAMP-TAI`:
> +
> +      - ``V4L2_BUF_FLAG_TIMESTAMP_TAI``
> +      - 0x0000a000
> +      - The buffer timestamp has been taken from the ``CLOCK_TAI``
> +	clock. To access the same clock outside V4L2, use
> +	:c:func:`clock_gettime`.
>      * .. _`V4L2-BUF-FLAG-TIMESTAMP-COPY`:
>  
>        - ``V4L2_BUF_FLAG_TIMESTAMP_COPY``
> diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
> index 248bc09..ce93c88 100644
> --- a/include/trace/events/v4l2.h
> +++ b/include/trace/events/v4l2.h
> @@ -88,6 +88,8 @@
>  		{ V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN,   "TIMESTAMP_UNKNOWN" },   \
>  		{ V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC, "TIMESTAMP_MONOTONIC" }, \
>  		{ V4L2_BUF_FLAG_TIMESTAMP_COPY,	     "TIMESTAMP_COPY" },      \
> +		{ V4L2_BUF_FLAG_TIMESTAMP_UTC,	     "TIMESTAMP_UTC" },       \
> +		{ V4L2_BUF_FLAG_TIMESTAMP_TAI,	     "TIMESTAMP_TAI" },       \
>  		{ V4L2_BUF_FLAG_LAST,                "LAST" })
>  
>  #define show_timecode_flags(flags)					  \
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3..87502ab 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1101,6 +1101,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
>  #define V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN		0x00000000
>  #define V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC	0x00002000
>  #define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
> +#define V4L2_BUF_FLAG_TIMESTAMP_UTC		0x00008000
> +#define V4L2_BUF_FLAG_TIMESTAMP_TAI		0x0000a000
>  /* Timestamp sources. */
>  #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
>  #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000

