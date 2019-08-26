Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E89B9D5D8
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 20:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbfHZSbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 14:31:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50506 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731340AbfHZSbE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 14:31:04 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 29AC0281888;
        Mon, 26 Aug 2019 19:31:01 +0100 (BST)
Date:   Mon, 26 Aug 2019 20:30:58 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
Subject: Re: [PATCH 2/8] videodev2.h: add V4L2_DEC_CMD_FLUSH
Message-ID: <20190826203058.0b3ffece@collabora.com>
In-Reply-To: <20190822194500.2071-3-jernej.skrabec@siol.net>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
        <20190822194500.2071-3-jernej.skrabec@siol.net>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 22 Aug 2019 21:44:54 +0200
Jernej Skrabec <jernej.skrabec@siol.net> wrote:

> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst | 11 ++++++++++-
>  Documentation/media/videodev2.h.rst.exceptions      |  1 +
>  include/uapi/linux/videodev2.h                      |  1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> index 57f0066f4cff..0bffef6058f7 100644
> --- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> @@ -208,7 +208,16 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
>  	been started yet, the driver will return an ``EPERM`` error code. When
>  	the decoder is already running, this command does nothing. No
>  	flags are defined for this command.
> -
> +    * - ``V4L2_DEC_CMD_FLUSH``
> +      - 4
> +      - Flush any held capture buffers. Only valid for stateless decoders,
> +        and only if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` was set.
> +	This command is typically used when the application reached the
> +	end of the stream and the last output buffer had the
> +	``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
> +	dequeueing the last capture buffer containing the last decoded frame.
> +	So this command can be used to explicitly flush that last decoded
> +	frame.
>  
>  Return Value
>  ============
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> index adeb6b7a15cb..a79028e4d929 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -434,6 +434,7 @@ replace define V4L2_DEC_CMD_START decoder-cmds
>  replace define V4L2_DEC_CMD_STOP decoder-cmds
>  replace define V4L2_DEC_CMD_PAUSE decoder-cmds
>  replace define V4L2_DEC_CMD_RESUME decoder-cmds
> +replace define V4L2_DEC_CMD_FLUSH decoder-cmds
>  
>  replace define V4L2_DEC_CMD_START_MUTE_AUDIO decoder-cmds
>  replace define V4L2_DEC_CMD_PAUSE_TO_BLACK decoder-cmds
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 4fa9f543742d..91a79e16089c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1978,6 +1978,7 @@ struct v4l2_encoder_cmd {
>  #define V4L2_DEC_CMD_STOP        (1)
>  #define V4L2_DEC_CMD_PAUSE       (2)
>  #define V4L2_DEC_CMD_RESUME      (3)
> +#define V4L2_DEC_CMD_FLUSH       (4)
>  
>  /* Flags for V4L2_DEC_CMD_START */
>  #define V4L2_DEC_CMD_START_MUTE_AUDIO	(1 << 0)

