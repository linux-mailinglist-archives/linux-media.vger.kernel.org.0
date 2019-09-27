Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B04CBC0850
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 17:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfI0PGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 11:06:34 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:42143 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfI0PGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 11:06:34 -0400
Received: by mail-pf1-f182.google.com with SMTP id q12so1755448pff.9
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2019 08:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4K1pMoqfMAK8fnnGZveYKDgEnTFya0HkgHigB9tEBh8=;
        b=r8mjKYiVfHxOoyr/pismWTdUzvyb85kw0vSb1N4YyBABZEjkZhx1jq9V0pvIbKd2or
         JNJUeWj6ENjEUg9WF1+AuClMQLqZceDQ7sLc/ExRliN6gLRL0QHYul6dRqRbcYMN+SJP
         OiEdnEtg+Wr7syyfm3mSAmFp7H98G8VdmdCo4XkfvHlLh0jqm/F1haBPYMHoIyBpD5QL
         bfCdz/A4DSwFAF8Yma9YNJ9uV7PBMK40G8oqipQpNkXOcbqVohLYMiw95SOPGDrt2nV7
         aPvFeHkbDtkoQ2nHYB5UG1XZzcBhpkG4oWjbibtzKEUNZNhWnArnDtk6KW9OeXnbYfmR
         VbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4K1pMoqfMAK8fnnGZveYKDgEnTFya0HkgHigB9tEBh8=;
        b=fyni9azXfrXNXilDpvEs18tGUTwFu+Czg8A+jSdXhvG1iTY1nacnQSIdiy4rK01JqD
         lopc2i99sy4znm67j1rnw6u2ezK1xVEuGd9fYjs/yWV+NoRzB7YkyX49Aw7/afx5L+eu
         L8gidybfEKiCd8b8amH6Eh6hXrgIwNp+mffnyXDhtj/97qoljHZmH2s76s2wc5hVIRIb
         mV7mrzglB3dKxkVx8uQjr3nYaWl898Ahazn6vcvdu3ZgZNdSbkGCWKNg/lQye/HetW+K
         joqFzvNkeZkxmbaWrrEXaW7IAngIq8rig8tjhd4jjY70YtUGRNwylgA/Rx4ARHz5R6aZ
         BLlA==
X-Gm-Message-State: APjAAAWA4RocvHFNgtd32pbz5JcWZGOTq8Ulo2c6WS6qdSWAVi8kbrgp
        BHCqvt1G7IPElTJD7irPy2RuZQ==
X-Google-Smtp-Source: APXvYqwlEm2sYhpSXT6w2aUg5OtQHBq8pzaeEJK3KvL+5hTpZ+Nxvfgo5SNH9ZAVXZYWUQO+fn81Tg==
X-Received: by 2002:a17:90a:6348:: with SMTP id v8mr10537540pjs.7.1569596793422;
        Fri, 27 Sep 2019 08:06:33 -0700 (PDT)
Received: from [172.20.34.69] ([12.157.10.118])
        by smtp.googlemail.com with ESMTPSA id m9sm9141855pjf.11.2019.09.27.08.06.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 08:06:32 -0700 (PDT)
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <7bbda89b-b37d-f726-21da-fc37221058b3@linaro.org>
Date:   Fri, 27 Sep 2019 08:06:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 9/23/19 7:12 AM, Hans Verkuil wrote:
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
> 8:30 (tentative, might change) to 12:00 (we have to vacate the room at that
> time).
> 
> Confirmed attendees for this session:
> 
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Helen Koike <helen.koike@collabora.com>
> Michael Tretter <m.tretter@pengutronix.de>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> Tentative:
> 
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Jacopo Mondi <jacopo@jmondi.org>

I'd like to attend the codec session too if there is vacant seat.

> 
> Jacopo, please confirm if you want to attend this session. I didn't find
> an email with explicit confirmation, so it was probably done via irc. But since
> this session is getting close to capacity I would prefer to keep attendance to
> those are actually working with codecs (or will work with it in the near future).
> 
> If I missed someone, or you are on the list but won't attend after all, then
> please let me know.
> 
> 
> 
> Agenda:
> 
> - Status of any pending patches related to codec support.
> 
> - Requirements of moving codec drivers out of staging.
> 
> - Finalize the stateful encoder API. There are two pieces that need
>   to be defined:
> 
> 1) Setting the frame rate so bitrate control can make sense, since
>    they need to know this information. This is also relevant for the
>    stateless codec (and this may have to change on a per-frame basis
>    for stateless codecs!).
> 
>    This can either be implemented via ENUM_FRAMEINTERVALS for the coded
>    pixelformats and S_PARM support, or we just add a new control for this.
>    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE). If we
>    go for a control, then we need to consider the unit. We can use a
>    fraction as well. See this series that puts in the foundation for that:
>    https://patchwork.linuxtv.org/cover/58857/
> 
>    I am inclined to go with a control, since the semantics don't really
>    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supported
>    for legacy drivers. Open question: some drivers (mediatek, hva, coda)
>    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
>    S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPTURE
>    vs OUTPUT thing, it is global to both queues.
> 
> 2) Interactions between OUTPUT and CAPTURE formats.
> 
>    The main problem is what to do if the capture sizeimage is too small
>    for the OUTPUT resolution when streaming starts.
> 
>    Proposal: width and height of S_FMT(OUTPUT) are used to
>    calculate a minimum sizeimage (app may request more). This is
>    driver-specific. (Is it? Or is this codec-specific?)
> 
>    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
>    for the encoder (i.e. we don't support mid-stream resolution
>    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
>    supported. See https://patchwork.linuxtv.org/patch/56478/ for
>    the patch adding this flag.
> 
>    Of course, if we start to support mid-stream resolution
>    changes (or other changes that require a source change event),
>    then this flag should be dropped by the encoder driver and
>    documentation on how to handle the source change event should
>    be documented in the encoder spec. I prefer to postpone this
>    until we have an encoder than can actually do mid-stream
>    resolution changes.
> 
>    If sizeimage of the OUTPUT is too small for the CAPTURE
>    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
>    then the second STREAMON (either CAPTURE or OUTPUT) will
>    return -ENOMEM since there is not enough memory to do the
>    encode.
> 
>    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
>    be the case for all current encoders), then any bitrate controls
>    will be limited in range to what the current state (CAPTURE and
>    OUTPUT formats and frame rate) supports.
> 
> - Stateless encoders?
> 
> - Anything else? (I have a feeling I missed a codec-related topic, but
>   I can't find it in my mailbox)
> 
> Regards,
> 
> 	Hans
> 

-- 
regards,
Stan
