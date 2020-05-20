Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161031DBDAE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 21:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgETTMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 15:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgETTMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 15:12:08 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222BBC061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 12:12:08 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e10so4381577edq.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 12:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ReW9YrhiWb9694+kaLBqIyEX2m1oiCkgc+daUPCO5s=;
        b=eYFxsfiYBsvBwWgrs6xkzj8oZ+vP4vTr1o89ehR4zV+xd4nITH2LWs2aOku2baAak8
         znU42N7ALD0u4CcKaXwhpawmtQ7hoHCNzC2uGnUG7+3u0jm+zeGojLNPtwwVGxHedQNv
         6jU0MQruApOYS+QwwbJE5/iRvPKKk0qL3OTfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ReW9YrhiWb9694+kaLBqIyEX2m1oiCkgc+daUPCO5s=;
        b=m702bnIZ6e+TuXFSXbIlgxJT6pMHqAHhcF1WgZeMweGg2/e3RGo9RDXVsKaQM0uKrs
         aFOOJBDq+CaKF0ACj9wjpsvJ0yU4SF6I9syllK67pGVMp5mHiF15MI8MVj+eO18Uid2o
         nsMxCF6DTKrZ7KZvriJa7lcRxI4Wpnf19Zz0ywuoZ/L99CAVdBDJE7eef3WX6DA53o/P
         cWohM5Jrc94Hxi5zCNt7su/SrNIZXM+velevrQdm1cNAHR8oalwY7LXTnGrkoeI3ZRMc
         9Kmyrhi6f5mVR+ARZnlhmz8yQp7/3/+BffHwiXRr0GDx7TUOe6qQ/sSt2WEK/J/BA8Cs
         aQUA==
X-Gm-Message-State: AOAM533zMHK4R8kxx/+MowVc/a8FMbxBJibypAhO8fdc1+6fsQ/WvzVJ
        TIuRkekioMo7IxMv/5731XVqJzkq1fMkuw==
X-Google-Smtp-Source: ABdhPJydijOrWkKVMg9B2iyD/jbmDfHL5BLxnXVYfMR2TSEMFFIJw4dkgSghVkYQKDBJgYm6TV/ZQA==
X-Received: by 2002:aa7:c80f:: with SMTP id a15mr5110511edt.246.1590001926431;
        Wed, 20 May 2020 12:12:06 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id qo21sm2689469ejb.105.2020.05.20.12.12.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 12:12:05 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id e1so4302545wrt.5
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 12:12:05 -0700 (PDT)
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr5185978wrw.17.1590001924950;
 Wed, 20 May 2020 12:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 May 2020 21:11:52 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DG8-h9noh0piYGqfvD=agB7VVxUjTFUsY6Wg++vmqT_Q@mail.gmail.com>
Message-ID: <CAAFQd5DG8-h9noh0piYGqfvD=agB7VVxUjTFUsY6Wg++vmqT_Q@mail.gmail.com>
Subject: Re: [PATCHv2 0/2] Stateful Encoding: final bits
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, May 20, 2020 at 12:02 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> This series adds the encoder spec and updates the VIDIOC_G/S_PARM
> documentation.
>
> This is a follow-up of the original "Stateful Encoding: final bits"
> series (1).
>
> The patches in that series that add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
> and V4L2_BUF_FLAG_TOO_SMALL have been dropped (the first is not necessary
> and the second can be skipped for now, see the irc discussion with
> Nicolas [3]).
>

I've reviewed both patches and had just one minor comment for each.
Otherwise they look good to me. Since I authored major parts of the
text, I'm not sure if my Reviewed-by or Acked-by would be worth
anything, but feel free to add them after fixing those minor issues.
:)

Best regards,
Tomasz

> The encoder spec has been updated since [2] with the following
> changes:
>
> - Document the optional VIDIOC_ENUM_FRAMEINTERVALS ioctl.
>
> - Document how to use VIDIOC_S_PARM:
>
>   1) calling S_PARM for the OUTPUT queue sets both the raw frame interval
>      (this is a hint only) and the coded frame interval.
>
>   2) calling S_PARM for the CAPTURE queue sets the coded frame interval
>      only. This is optional and can be used for off-line encoding. In
>      that case the OUTPUT frame interval can be used by the driver to
>      schedule multiple encoders.
>
>   Ideally S_PARM for the OUTPUT queue would just provide a hint, but
>   existing encoder drivers all use S_PARM for the OUTPUT queue to
>   define the coded frame interval, and that can't be changed.
>
> - Added a note that if a capture buffer is too small it will be
>   returned with V4L2_BUF_FLAG_ERROR and that more work has to be
>   done to properly support this corner case.
>
> - Clarify in the 'Encoding' section that there are more reasons
>   why 'a buffer queued to OUTPUT may result in more than one buffer
>   produced on CAPTURE'.
>
> I think that with these changes this stateful encoder spec is ready
> to be merged.
>
> Regards,
>
>         Hans
>
> [1] https://lore.kernel.org/linux-media/20191119113457.57833-6-hverkuil-cisco@xs4all.nl/T/
> [2] https://www.mail-archive.com/linux-media@vger.kernel.org/msg149211.html
> [3] https://linuxtv.org/irc/irclogger_log/v4l?date=2020-05-19,Tue
>
> Hans Verkuil (1):
>   vidioc-g-parm.rst: update the VIDIOC_G/S_PARM documentation
>
> Tomasz Figa (1):
>   media: docs-rst: Document memory-to-memory video encoder interface
>
>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 ++++++++++++++++++
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>  .../userspace-api/media/v4l/vidioc-g-parm.rst |  51 +-
>  6 files changed, 798 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
>
> --
> 2.25.1
>
