Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022038E5F8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 10:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730809AbfHOIMf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 04:12:35 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35269 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfHOIMe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 04:12:34 -0400
Received: by mail-ot1-f65.google.com with SMTP id g17so3393744otl.2
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UaOZox71BWC5PV9zJqhPo8Oq7OEFXPnrWqrpY2HLjlY=;
        b=egZtSI1ItRo3go56Q/prth49cUCRAyXJ6YUdT3dRefrmXhLxdjzvDeDUuXhWB04nNC
         TH04+gy3HXvmsudimdk2Ktp9CAWkcunOvItuhognwUDUrxmlldpogMCURZh8TsLhaYDa
         PewlX0rLkN1KHKBLoT91i6Y/duWrwkdFp/QZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UaOZox71BWC5PV9zJqhPo8Oq7OEFXPnrWqrpY2HLjlY=;
        b=sCsS5+W/DGrmR/cZVsrmN7uqgB7fYdrwM1yjsVO7kc8e0L06wZMEcWXeTy7Rdf4mcR
         UZhqnVEtBBeZvp3jZFkL2/hjm3ln5zrLVFzD3i/oDVGU3IucqW1jUQkyWheXlRNYqLOF
         AdMXJDY94qfc+ImTl2JdB+wNduXgY7uJXQd3NwHrMJ1zcgeJ1WVE7I+S/oXCvRVnjxgP
         j4/Fiw+54O9Ramu5Q9wu7nS7Z5h3wvn38c2oJ8PYl2E1sz2e6LJqEdqmckbqrP3o6xJ8
         ultQti+MrvxGCkjiuRvN2sW08h5gMykrhXoyCfuBCNW4Gpo51ip96A5da5KjT+hSy+BD
         Qklw==
X-Gm-Message-State: APjAAAV2JA5QuR9CV0LlnYXxD+Bed2WUcjM4iuNBmziS/WzoQucAdxJn
        BwG/6SiIi4XTZatiXrSuzxV+jXpNOag=
X-Google-Smtp-Source: APXvYqxlJBGu5LKFh5PI6hsLt4dO4nyGmreRqjwRHMbH50TTXz6sWDOuHOv8G1FUOBzE9sgyGsx0Xw==
X-Received: by 2002:a9d:7a82:: with SMTP id l2mr2706706otn.120.1565856753659;
        Thu, 15 Aug 2019 01:12:33 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id f197sm264338oib.20.2019.08.15.01.12.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 01:12:32 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id k22so927711oiw.11
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:12:32 -0700 (PDT)
X-Received: by 2002:aca:d885:: with SMTP id p127mr681323oig.153.1565856752250;
 Thu, 15 Aug 2019 01:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl> <20190812110513.23774-11-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190812110513.23774-11-hverkuil-cisco@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 15 Aug 2019 17:12:20 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVTGJJH_rFjvQy37NDLzT1b_=dBRF6UkFb2hWMwD6EC=A@mail.gmail.com>
Message-ID: <CAPBb6MVTGJJH_rFjvQy37NDLzT1b_=dBRF6UkFb2hWMwD6EC=A@mail.gmail.com>
Subject: Re: [PATCHv2 10/12] videodev2.h: add V4L2_DEC_CMD_FLUSH
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 12, 2019 at 8:07 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
>         been started yet, the driver will return an ``EPERM`` error code. When
>         the decoder is already running, this command does nothing. No
>         flags are defined for this command.
> -
> +    * - ``V4L2_DEC_CMD_FLUSH``
> +      - 4
> +      - Flush any held capture buffers. Only valid for stateless decoders,
> +        and only if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` was set.
> +       This command is typically used when the application reached the
> +       end of the stream and the last output buffer had the
> +       ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
> +       dequeueing the last capture buffer containing the last decoded frame.
> +       So this command can be used to explicitly flush that last decoded
> +       frame.

I'm a bit confused here, isn't this command referred to as
V4L2_DEC_CMD_STOP in the previous patch?


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
>  #define V4L2_DEC_CMD_START_MUTE_AUDIO  (1 << 0)
> --
> 2.20.1
>
