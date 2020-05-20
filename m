Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005821DBD9A
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 21:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgETTHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 15:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgETTHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 15:07:23 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A05C061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 12:07:22 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h17so4260226wrc.8
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RChWoqT/eBFLtAb8Wiem+x4WnHscVyFaMathpSXQljI=;
        b=j2xB6kbjgCaOExWnphgneD7kaPtLxsEUK4kO10sjh7C023h9Y7mY7HSc2kL0H0taNF
         /rIINQTIAXx4NYQC/f36Muc/1ax4Ja5tYn5cHxFCYnJjjGDySJxNBJ/9PItJ3TvaPioU
         N4Sk6fwalTNawUPPZdU9WrdKo7Iz6447g6qtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RChWoqT/eBFLtAb8Wiem+x4WnHscVyFaMathpSXQljI=;
        b=FDoUr2eSR1fi0DR8bljet07OmslZAPqJt7zQEy7jvCzuBaf/cI0PjXSdz197quIkWH
         dkPPl1Tj92u1q7NAnDdt8qD+WrkblS1ndTocYOhtokmPaT4KDOimZMYPyf4BK5yYEM8H
         OaCUQecTUhZcyBnRBGsy0421GdqwoxEsa6NDd8af+QjqCiCNH0wiltAlnCAWIoWtEeyN
         f/ADW7PRfeWSTmDMuFewbpdyjZFaUNIXp1/02tOs/oQszdnLytOMHX4S5+Paf/HZiNm3
         kQ6VkLXhYCqZJws2MxszyyG//VzCXaajRqNFL5IwCQLAFBEUTkkbctr/llWxIhP17Vy/
         54Xg==
X-Gm-Message-State: AOAM530vUjXpUMFm5RMptmUBwwCklOsIlxiTlU938wqoEO/uFt9yTBSq
        bJpLDlnVV2BvQGENv514HeYGf/tyDHTnLg==
X-Google-Smtp-Source: ABdhPJzkpDheU8zAF/a3Jp2ul/DPkIO7Byip7SDrCPMi5bZ8LBe5RwpHn/3CNSR+H+ArhTdnseoekg==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr5251724wrt.411.1590001641573;
        Wed, 20 May 2020 12:07:21 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id w13sm3691044wrm.28.2020.05.20.12.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 12:07:21 -0700 (PDT)
Date:   Wed, 20 May 2020 19:07:19 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCHv2 1/2] media: docs-rst: Document memory-to-memory video
 encoder interface
Message-ID: <20200520190719.GA35530@chromium.org>
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, May 20, 2020 at 12:01:58PM +0200, Hans Verkuil wrote:
> From: Tomasz Figa <tfiga@chromium.org>
> 
> Due to complexity of the video encoding process, the V4L2 drivers of
> stateful encoder hardware require specific sequences of V4L2 API calls
> to be followed. These include capability enumeration, initialization,
> encoding, encode parameters change, drain and reset.
> 
> Specifics of the above have been discussed during Media Workshops at
> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
> originated at those events was later implemented by the drivers we already
> have merged in mainline, such as s5p-mfc or coda.
> 
> The only thing missing was the real specification included as a part of
> Linux Media documentation. Fix it now and document the encoder part of
> the Codec API.
> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 ++++++++++++++++++
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>  5 files changed, 766 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
> 

Thanks a lot for taking care of the remaining updates. Just one comment
inline.

[snip]
> +4. Set the raw and coded frame interval on the ``OUTPUT`` queue via
> +   :c:func:`VIDIOC_S_PARM`
> +
> +   * ** Required fields:**
> +
> +     ``type``
> +	 a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> +
> +     ``parm.output``
> +	 set all fields except ``parm.output.timeperframe`` to 0.
> +
> +     ``parm.output.timeperframe``
> +	 the desired frame interval; the encoder may adjust it to
> +	 match hardware requirements.
> +
> +   * **Return fields:**
> +
> +     ``parm.output.timeperframe``
> +	 the adjusted frame interval.
> +
> +   .. important::
> +
> +      Changing the ``OUTPUT`` frame interval *also* sets the framerate that
> +      the encoder uses to encode the video. So setting the frame interval
> +      to 1/24 (or 24 frames per second) will produce a coded video stream
> +      that can be played back at that speed. The frame interval for the
> +      ``OUTPUT`` queue is just a hint, the application may provide raw
> +      frames at a different rate. It can be used by the driver to help
> +      schedule multiple encoders running in parallel.
> +
> +      In the next step the ``CAPTURE`` frame interval can optionally be
> +      changed to a different value. This is useful for off-line encoding
> +      were the coded frame interval can be different from the rate at
> +      which raw frames are supplied.
> +
> +   .. important::
> +
> +      ``timeperframe`` deals with *frames*, not fields. So for interlaced
> +      formats this is the time per two fields, since a frame consists of
> +      a top and a bottom field.
> +
> +   .. note::
> +
> +      It is due to historical reasons that changing the ``OUTPUT`` frame
> +      interval also changes the coded frame interval on the ``CAPTURE``
> +      queue. Ideally these would be independent settings, but that would
> +      break the existing API.
> +

Should we explicitly state that setting the OUTPUT frame interval resets
the CAPTURE frame interval to the same value?

Best regards,
Tomasz
