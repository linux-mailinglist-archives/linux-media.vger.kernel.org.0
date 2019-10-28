Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1935E78CC
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 19:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfJ1Szz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 14:55:55 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40526 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbfJ1Szy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 14:55:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id w9so53817wmm.5
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2019 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nlgQtNPpjqWs2zwkWRg7am+S2O35fj8SZrDf5hn67iw=;
        b=wTWvF8aDWpwfArp/7NOIYETtC9qO5xz02OP/HR+7P9/PNmEPZqAitrCcBoBSaaKo9b
         WzEuRQjAu3UDZwwKKIryCH0K71jfuaPs8j87y9N4amxnKIhJHldQQFZJIGLbnV+zwsVG
         r1pyw0x525biEv5vTKLVeV5jJ1KzlTa4WQM7dMW1XN2ghhuwvpU/TibDHTgJZQPMq3hj
         IoxIQLuqMct35tLQxI2HZI1Gu5kFVs9Z160xlj/Jbn4dWGsmYeGtPhG90DesUd9x0Kyj
         v+DM0i5jbOeezrZylJCROWmtkry2dNM4sF9XT6WudA++Sxg29W0jVIZthKydR5RGx1XN
         LQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nlgQtNPpjqWs2zwkWRg7am+S2O35fj8SZrDf5hn67iw=;
        b=tGsrrh5p+DochLcy867sPA5NASdcthXSWR3Nq/gVPFeVyWQ2RQjLSp60e5xYEI475u
         OSAjL/fHE5X1wvHZyw5iZtoRrpLIa3MPxVY0dXbJBfzbAbFl9bMUrslXqHcijbtqocXx
         7AYGaA68sx/2O+dXEG2oj48G5QVPDg2tAI8mZJyNNgQQZ8yRIM6ZVbYhKAfzDWg4vgO6
         1sah5NmRHQE7JmWjFvyjViO3yl2eLEb0ftwS4xVvv1QCydJVmxCCrGRosTdIqbPG6Hhm
         bj8v8Co4mAHW9teaiD1HuT8CIfhzTqlGGz2ORKM4kBGtkdpM192RcbyNDuG7atePM6mM
         Hdhg==
X-Gm-Message-State: APjAAAVeIjBW4EKS/iXA1r5NT8Yaffk3obl499bI86cxzOFldoJC+f2e
        BeHwN30atVLx+i7uAY+tYY4qvw==
X-Google-Smtp-Source: APXvYqz/YbDO2sOXHTIBlW8dQ44/TNr0ZeiPgiYbmN7gS9K61W95DBa3mWZDtfdC6BgiHYOARyr/Mg==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr635177wmc.134.1572288951627;
        Mon, 28 Oct 2019 11:55:51 -0700 (PDT)
Received: from [192.168.50.149] ([84.16.30.7])
        by smtp.googlemail.com with ESMTPSA id u1sm16687961wru.90.2019.10.28.11.55.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 11:55:51 -0700 (PDT)
Subject: Re: [ANN v2] Media sessions in Lyon in October: codecs
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <f35e5aaa-cb3d-a0ad-ebc8-ed9410eb33b1@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <7dbe2044-aad2-22b0-9e81-0e806127db97@linaro.org>
Date:   Mon, 28 Oct 2019 20:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f35e5aaa-cb3d-a0ad-ebc8-ed9410eb33b1@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 10/17/19 1:25 PM, Hans Verkuil wrote:
> Hi all,
> 
> Since we have three separate half-day sessions for different topics I decided
> to split the announcement for this in three emails as well, so these things
> can be discussed in separate threads.
> 
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
> 
> The first session deals with the codec API and is on Tuesday morning from
> 8:30 to 12:00 (we have to vacate the room at that time). Note that 8:30
> start time!
> 
> Confirmed attendees for this session:
> 
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Maxime Ripard <mripard@kernel.org>
> Dave Stevenson <dave.stevenson@raspberrypi.org>
> Michael Tretter <m.tretter@pengutronix.de>
> Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> Please let me know asap if I missed someone, or if you are listed, but
> can't join for some reason.

I'll late for this session for unforeseen reasons (I stuck at Frankfurt
airport), please feel free to reallocate my seat for someone who
interested. Sorry for inconvenience.

> 
> There are three seats left, and I have five on the 'just interested'
> list:
> 
> Daniel Gomez <daniel@qtec.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Helen Koike <helen.koike@collabora.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If you still want to join, please mail me. First come, first served :-)
> 
> Agenda:
> 
> Note: I didn't assign start times, we'll just go through these items one-by-one.
> 
> - Status of any pending patches related to codec support.
>   I'll provide a list of those patches by the end of next week so we
>   can go through them.
> 
> - Requirements of moving codec drivers out of staging.
> 
> - Finalize the stateful encoder API. There are two pieces that need
>   to be defined:
> 
>   1) Setting the frame rate so bitrate control can make sense, since
>      they need to know this information. This is also relevant for the
>      stateless codec (and this may have to change on a per-frame basis
>      for stateless codecs!).
> 
>      This can either be implemented via ENUM_FRAMEINTERVALS for the coded
>      pixelformats plus S_PARM support, or we just add a new control for this.
>      E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL using struct v4l2_fract.
> 
>      I am inclined to go with a control, since the semantics don't really
>      match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supported
>      for legacy drivers. Open question: some drivers (mediatek, hva, coda)
>      require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
>      S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPTURE
>      vs OUTPUT thing, it is global to both queues.
> 
>   2) Interactions between OUTPUT and CAPTURE formats.
> 
>      The main problem is what to do if the capture sizeimage is too small
>      for the OUTPUT resolution when streaming starts.
> 
>      Proposal: width and height of S_FMT(OUTPUT) plus max-bitrate plus frame
>      interval plus key frame interval info are used to calculate a minimum
>      CAPTURE sizeimage (app may request more). This is codec-specific, I think,
>      so it should be possible to provide helper functions for this.
> 
>      However, it may be quite difficult to make a good calculation. I just
>      don't know enough to determine this.
> 
>      V4L2_FMT_FLAG_DYN_RESOLUTION is always cleared for codec formats
>      for the encoder (i.e. we don't support mid-stream resolution
>      changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
>      supported.
> 
>      Of course, if we start to support mid-stream resolution
>      changes (or other changes that require a source change event),
>      then this flag should be set by the encoder driver and
>      documentation on how to handle the source change event should
>      be documented in the encoder spec. I prefer to postpone this
>      until we have an encoder than can actually do mid-stream
>      resolution changes.
> 
>      If sizeimage of the OUTPUT is too small for the CAPTURE
>      resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
>      then the second STREAMON (either CAPTURE or OUTPUT) will
>      return -ENOMEM since there is not enough memory to do the
>      encode.
> 
>      If V4L2_FMT_FLAG_DYN_RESOLUTION is cleared (i.e. that is
>      the case for all current encoders), then any bitrate controls
>      will be limited in range to what the current state (CAPTURE and
>      OUTPUT formats and frame interval) supports.
> 
> - Stateless encoder support
> 
>   Overall goals:
> 
>   - Find out if there is a common set of per frame encoding parameters
>   - Find out if bitrate control can be reused for multiple HW
>   - Decide if we do in-kernel bitrate control or not
>   - Decide if we keep bitstream header crafting external (unlike Hantro
>     JPEG encoder, but like VAAPI)
>   - Decide if we provide (and maintain) a libv4l2 plugin like ChromeOS
>     folks opted for.
> 
>   I hope Nicolas and Tomasz can prepare for this.
> 
>   The one requirement that Cisco would have for these devices is that
>   we must be able to do per-frame bitrate control from userspace.
> 
> Regards,
> 
> 	Hans
> 

-- 
regards,
Stan
