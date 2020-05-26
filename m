Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847361E268E
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 18:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgEZQLP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 12:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbgEZQLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 12:11:15 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCEA0C03E96D
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 09:11:14 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id be9so18135167edb.2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nNOos2c6iZoOXta5GorQWquBhxDd60toEGScglAIDL0=;
        b=lK76QkT2rO2CuASpxiFE2G3UCpArCPxIZJL/SZLZZIal8CbdgPxBLKHeclPX0dPCoz
         07u1BizROWCUJb9wgpRDyTyCy5S7epv4wVelir9A/xYQ/vOqZ45i3D430HiOma5EHQWM
         NVDxuuH4pLIzZdxFQrJMsrJKJulXB1+PdTPjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nNOos2c6iZoOXta5GorQWquBhxDd60toEGScglAIDL0=;
        b=q8Gzaf9dbLi7DjFuJQMQuC4MlTrHW1UBugnNzOcYsMvM8DTPkWFO1PCn/h9N51fMbM
         KRa0XQK+ydgVozloEu933uJhlBj0FX7PwSnHgtQDw3Ort8DYAqZjzyUJNMu/C5Ryr7VC
         UKB3Jn5NLJhu2asxuumT6JEe1fKMv4UAggFHa6EsjpxnHAkKcnjuPB4ceiT4cPzFH8zZ
         Tmg30XggZrRtD8GDFVa4RYBd8VxMGTu7VpJOWMCZQfuGQLpnrrOLU4eB5iKafBm28NrE
         trt+5BzdHmzOODZoWCfcuQJWRb/olvO06/artqohx/8pe9I3zaHRB64DYsoXvhb5cTl9
         WTMQ==
X-Gm-Message-State: AOAM532m0hhGd+bYa4RLVWvGA+NuU35Yfajm437p9HldaPwcEW+mz8Rj
        f+b73XZbXTUkUZCagC5yqt7tFJlHSipooA==
X-Google-Smtp-Source: ABdhPJxJdZLAaT1YUlFCR9aAdWlxDs95R6W0/pk85H0/gY6tiA5UsEDCfbo3rdYLshcTQp9TZzNH3A==
X-Received: by 2002:a05:6402:22a5:: with SMTP id cx5mr3765910edb.246.1590509473533;
        Tue, 26 May 2020 09:11:13 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id on20sm250857ejb.70.2020.05.26.09.11.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 09:11:13 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id u13so101379wml.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 09:11:12 -0700 (PDT)
X-Received: by 2002:a7b:c622:: with SMTP id p2mr2046827wmk.55.1590509472260;
 Tue, 26 May 2020 09:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com> <1c8bd467-5a9c-7285-ec23-d0d864a5f938@collabora.com>
In-Reply-To: <1c8bd467-5a9c-7285-ec23-d0d864a5f938@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 26 May 2020 18:11:00 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BW9TF0iMRPCUwk3oZn-WrisMW794EuwfqZRTkmNqeKoA@mail.gmail.com>
Message-ID: <CAAFQd5BW9TF0iMRPCUwk3oZn-WrisMW794EuwfqZRTkmNqeKoA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] media: add v4l2_pipeline_stream_{enable,disable}
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        niklas.soderlund@ragnatech.se--annotate
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 22, 2020 at 11:06 AM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Dafna,
>
> Thanks for working on this.
>
> On 5/22/20 4:55 AM, Dafna Hirschfeld wrote:
> > Hi,
> > This is v4 of the patchset that was sent by Helen Koike.
> >
> > Media drivers need to iterate through the pipeline and call .s_stream()
> > callbacks in the subdevices.
> >
> > Instead of repeating code, add helpers for this.
> >
> > These helpers will go walk through the pipeline only visiting entities
> > that participates in the stream, i.e. it follows links from sink to source
> > (and not the opposite).
> > For example, in a topology like this https://bit.ly/3b2MxjI
> > calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
> > .s_stream(true) for rkisp1_resizer_selfpath.
> >
> > stream_count variable was added in v4l2_subdevice to handle nested calls
> > to the helpers.
> > This is useful when the driver allows streaming from more then one
> > capture device sharing subdevices.
>
> If I understand correctly, this isn't  true anymore right? Nested calls aren't
> possible anymore since this version doesn't contain stream_count in struct v4l2_subdevice.
>
> Documentation of v4l2_pipeline_stream_*() should also be updated.
>
> Just to be clear, without the nested call, vimc will require to add its own
> counters, patch https://patchwork.kernel.org/patch/10948833/ will be
> required again to allow multi streaming.
>
> Also, patch "media: staging: rkisp1: cap: use v4l2_pipeline_stream_{enable,disable}"
> is cleaner in the previous version (with stream_count in struct v4l2_subdevice).
>
> All drivers that allows multi streaming will need to implement some special handling.
>
> Adding stream_count in struct v4l2_subdevice still seems cleaner to me. I'd like to hear
> what others think.

I certainly would see this reference counting done in generic code,
because requiring every driver to do it simply adds to the endless
amount of boiler plate that V4L2 currently requires from the drivers.
:(

I wonder if it wouldn't be possible to redesign the framework so that
.s_stream() at the subdev level is only called when it's expected to
either start or stop this particular subdev and driver's
implementation can simply execute the requested action.

Best regards,
Tomasz
