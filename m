Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BA636C893
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 17:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238706AbhD0PVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 11:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238712AbhD0PVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 11:21:20 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA83C06175F
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 08:20:36 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id p17so3198952pjz.3
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D9ywEl3EICRWVTBguGax/+D4A0Pio964b0HO8TYAH3E=;
        b=MOYAfXhJsC2KtMSFK7szmTciJjwk23ieEk7+hZhhefspx1DYEtAT9F5db6RCjw4nFi
         51nW7tXkdfdPYyJP10QuykMzekiDeREUvlXnZddghEMkxPe+4HVYGTNH+g2gx6pXWdE0
         1vFFB3QfKPKmAsuAo1VPMN6yrx5ZFnKpsyI+MyFMnm3QltEtgPW1AzidDyi/XNl1qXxb
         c00m07Hmg+miLpKYDHTBpVJkmlnbOoqXJbRO06itEX8AdJ2MTls0gsCLnhymzc2WMdVS
         dCw2EwR6pTQKnXHNbMbNgHiuS96hlSdi/0xLsfM703aYT67MCkrhoW5sQvsjvvXhBBXV
         TNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D9ywEl3EICRWVTBguGax/+D4A0Pio964b0HO8TYAH3E=;
        b=SLzvWYtIrbcGvbfag7AmG0/lTz8wt0erdrWEbSJOudqPHPJQGzS712w9u/MCA/FPna
         E+8eZB/jhUb9XrAkeGjkcO10hX8VfG7CDNQpJzyACGbGlwhQG6ieYlxSHV5g85I+uRSW
         ign+OgIFUZAyepQso9kZTTbeAW+Vlc+t3VMQfGxmwkrsFcS9R0T+nTEPHhdUyOr1RcVE
         AofzVaOtfNAxEUfFhVpadAr4qkjXL+kAEDXCRbM+dgMA7i05C/L9Fukp4UFn1ChwSw/A
         hXB6+/ZAZpAyp6UlGE5mRyzaENggeRTPU7LGlq0j/M8YMuwHmcXuGvwIKxUzVuoSOnEC
         iMWg==
X-Gm-Message-State: AOAM533w4UDiB8SrwOLTf3s8g2mxh+uQVOugDMgp0Ew3FNTbgGV8+fo7
        kGN9VWWjrlNBUvx8rxJyp+cp1SE4PF337MQifZ3CjA==
X-Google-Smtp-Source: ABdhPJwqbwEWk1M/IA5btTPvgLKofeHTB08WzC0urYRBbnDCvLlHPDL8EvIuRQO/3JD3Y60ydpRloywKfNFLsNSz5Bg=
X-Received: by 2002:a17:90a:d082:: with SMTP id k2mr5414319pju.28.1619536836298;
 Tue, 27 Apr 2021 08:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
In-Reply-To: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 27 Apr 2021 08:20:25 -0700
Message-ID: <CAJ+vNU09LC1i_-HzybPSy02DY5x-JNfMrO9wPMsb5BSK0ofEYg@mail.gmail.com>
Subject: Re: adv7280: Scrolling images on imx6
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 26, 2021 at 9:14 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> I am back at trying to get a proper image captured by the ADV7280 on
> an imx6dl board connected to the parallel CSI bus.
>
> I tried your patches against 5.4 and 5.12:
>
> https://github.com/Gateworks/linux-imx6/commit/959fbd4
> and
> https://patchwork.kernel.org/project/linux-media/patch/20190827215539.1286-1-mmichilot@gateworks.com/
>
> ,but I am still getting horizontal scrolling images after running:
>
> media-ctl -l "'adv7180 0-0020':0 -> 'ipu1_csi1_mux':4[1]"
> media-ctl -l "'ipu1_csi1_mux':5 -> 'ipu1_csi1':0[1]"
> media-ctl -l "'ipu1_csi1':1 -> 'ipu1_vdic':0[1]"
> media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
> media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
> media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
> media-ctl -V "'adv7180 0-0020':0 [fmt:UYVY2X8/640x480 field:seq-tb]"
> media-ctl -V "'ipu1_csi1_mux':5 [fmt:UYVY2X8/640x480]"
> media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/640x480]"
> media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/640x480 field:none]"
> media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/640x480 field:none]"
> media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/640x480 field:none]"
> v4l2-ctl -d2 --set-fmt-video=field=none
>
> gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink
>
> Also, I saw your commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.12&id=9483a3f8e1b58ba1d7cd21687d8d0a63a015c36b
>
> ,but adv7180_get_skip_frames() does not get called. Is there any
> missing patch from the mix csi driver that should call
> g_skip_frames()?
>

Fabio,

GStreamer does not use the g_skip_frames feature as far as I know. If
it did then we likely wouldn't need Steves patch
https://github.com/Gateworks/linux-imx6/commit/959fbd4. His commit
explains the issue pretty well and yes, this should be mainlined in my
opinion unless someone presents a more proper way to handle it.

The proper way to set the video standard (PAL vs NTSC) is 'v4l2-ctl
--device /dev/v4l-subdev2 --set-standard PAL' (on the proper subdev of
course).

The https://patchwork.kernel.org/project/linux-media/patch/20190827215539.1286-1-mmichilot@gateworks.com/
patch is only needed if you are using adv7280 which I thought you
mentioned you were at some point. I still don't have a solution for
that other than add a kernel module parameter or something.

Best regards,

Tim
