Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58CB1EB7C9
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 11:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgFBJBx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 05:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgFBJBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 05:01:52 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1EFC061A0E
        for <linux-media@vger.kernel.org>; Tue,  2 Jun 2020 02:01:52 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a2so11942206ejb.10
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q5gh4hayNiLpweRxl69L3Yr39US7qfZ44lKK0GxI7Zc=;
        b=Wyd2fEuSWVXo4hS9f1tYz6vFWyhFqyTZvwgu/aRmwFLP2MKaDjb/mNNhXyyESop6Uq
         WLtj4crFYSvpzkQQlKV08OKVC+QgIqsfDQWQiRkFta1LYufhXn4kw8ungKATQNOE2Sp1
         L5yVLTFKkpmxqCkVj3DFpVWlbYLmKK6fkhoEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q5gh4hayNiLpweRxl69L3Yr39US7qfZ44lKK0GxI7Zc=;
        b=q+T3NKbDCBr35pRpxb3RjTu0pBEOdNxKFL2vnTfZY78jnx0CXhaOrYg5CBjdtf5e3H
         arSDnOXpkmw2KH/B6cgoUWR6UYatYKGblxeTN3GDvgRbsPdasK8D8Oxbc2FAhtUEXpsf
         a4l8Dkxz+TXic/yfQqBt8LRloLE6+vt4AiF8YXDJaQwrWkTLdMpf2z0LNzHROLppJWIi
         frB2iDCAqkgtxOZ4hfX5PuQeXm2AlM9aMo8h/eMAJG+2xhHIJWLnD9/utIlzEdeHBKee
         gXPcKToc7Ykmr/9+C2Z5KmpQ80gG9MyMueyffe7nCqqRc5txEUmWtsO1yTBnO0n/iLdz
         cnPw==
X-Gm-Message-State: AOAM530YVLrrVGFS5YNPVRXmBasEYsUdZ1M6E12km9qBA1OTR45CR6V9
        L4LVlBk3AFBNYzLc5AT6gac5kq2bvoC7CQ==
X-Google-Smtp-Source: ABdhPJxKcRuN/8+NUPscV+YkglUn2IWp1tvdKgdbf3oBQEVqB/i4+cG1mUlVIyK9swKe3tb7FCYR1w==
X-Received: by 2002:a17:906:c952:: with SMTP id fw18mr20548753ejb.505.1591088510376;
        Tue, 02 Jun 2020 02:01:50 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id g25sm1236983edm.57.2020.06.02.02.01.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 02:01:49 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id q11so2561185wrp.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 02:01:49 -0700 (PDT)
X-Received: by 2002:a5d:6750:: with SMTP id l16mr25535521wrw.295.1591088509125;
 Tue, 02 Jun 2020 02:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 2 Jun 2020 11:01:36 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BT3yuDEZrwyE2wqiVWiYdwEi=0pKt8AW94b-NhDkdO_g@mail.gmail.com>
Message-ID: <CAAFQd5BT3yuDEZrwyE2wqiVWiYdwEi=0pKt8AW94b-NhDkdO_g@mail.gmail.com>
Subject: Re: [PATCHv3 0/5] Stateful Encoding: final bits
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 26, 2020 at 12:09 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
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
> Added in v3:
>
> - Fix some minor typos.
>
> - Make it more explicit that setting S_PARM(OUTPUT) also sets the
>   CAPTURE frame interval.
>
> - Added a new V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag to indicate
>   that S_PARM(CAPTURE) can be set separately.
>
> I think that with these changes this stateful encoder spec is ready
> to be merged.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Thanks Hans and everyone for the help with moving this forward.

Best regards,
Tomasz
