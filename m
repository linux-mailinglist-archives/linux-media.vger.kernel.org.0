Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490CC2F92B2
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 14:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbhAQNse (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 08:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729229AbhAQNsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 08:48:02 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA135C061574
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 05:47:21 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id a12so20165187lfl.6
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 05:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uSlFZ6S2WVRYP4fncYKxnUSGanvdUmgo709oOU2loKY=;
        b=q+GDmoUHGjBYdKKozJRvGwsCqsNv/g5pI5/BttAwAHYP17p0gyNFT3tPxi8UbxWPng
         kp1+ZnJkNxQCY589ub2js6/xdRPmbL6QPBV72dlPjcR0wHksTXXFv5VmY2Y6/gtpG95d
         TgPuPy5UCkKjeV1QTqrdKepAbX3ESBiXXWieqyfm4ziA9G+RWYvtEvYAbE8mMr7xNbUY
         L/BHqm4XLHWw1a7iBeEJ1Lnxd5iZIi3NEib3+J5B2O5rxlrD5TDZPlCFcIzKbAmKfFUr
         mpZlLi58YY0/jNAp1HKpdrtQM3V2jNNb+JymNfFvC6gS8rXuJtbR5syR23uq8KeziUy3
         ZiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uSlFZ6S2WVRYP4fncYKxnUSGanvdUmgo709oOU2loKY=;
        b=gvfuUxoBLEjmYBOGEYuZROzAsJahnnlH8oM2qLnu2afwFL/mMzN0A59gITwnm36GFK
         tHwdCEFbK+Q4Vci9MrR7YCKDjn6DYF7HP2lbImHn/1MVDw9DAF4cGuJYOsQdAxCGynXT
         GMgf+SkuW2cE++F/XW5xEdaOUUgqOs9bDrKFPNTQXU2UYYj65tvU3PhLGX+vdYLZoO2G
         tGGgF+BmbeIfYoNR60Wfz4X+W4sm6jUkn7Oxoc8JMPtMJIizzNOFZO70lBJXlpFCY+sp
         JoUCfnle8kVtEbkP09izFSEWaAQUxIzJ9NtNFhntZ35TCy+aTUkfLhjZymBCteFld9Xt
         HCjw==
X-Gm-Message-State: AOAM530nBjWBrkbMNxLeiE/zgsUvCXCni92W/gCdJH/GFgZ+JUjnPb9S
        E7zIfc2ILjOtaQuskTYIEZLO0d0s213h4KMJZko=
X-Google-Smtp-Source: ABdhPJx7qzLgZRIE/YuZqG3f1KqzHMlUkro/zVsN7RDLQBS4GQUmdRcm0QML1rTXynxMQ2cAY9pBaNySKJvvzaCXyZ4=
X-Received: by 2002:ac2:57d2:: with SMTP id k18mr8871776lfo.500.1610891240341;
 Sun, 17 Jan 2021 05:47:20 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
 <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com> <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
In-Reply-To: <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 17 Jan 2021 10:47:08 -0300
Message-ID: <CAOMZO5DBRGqn5DTsMG3RRHdN1HMo7CtP6HYw3PajK3A6Y6iCoQ@mail.gmail.com>
Subject: Re: Coda: imx53 plays video with incorrect colors
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Sat, Jan 16, 2021 at 11:46 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Perhaps you would explain in detail what isn't color correct ? To debug this,

Here is the movie showing the incorrect colors:

https://www.dropbox.com/s/a4ifivpoi663dkd/mx53.mp4?dl=0

The original video is this one:
http://cdn.clipcanvas.com/sample/clipcanvas_14348_offline.mp4

Please note that the color mismatch is not related to this specific
video sample.
It happens with all videos I have tried.

> you probably want to inspect the caps and the colorimetry negotiated between
> each element (use -v in gst-launch-1.0). It's quite possible that the decoder is
> ignoring upstream colors and get badly hinted by the driver, or that kmssink is
> pnot passing colorimetry to the driver.

Here is the -v output:

# gst-launch-1.0 -v filesrc location=/media/clip.mp4 ! qtdemux !
h264parse ! v4l2h264dec ! kmssink
Setting pipeline to PAUSED ...
[   15.113196] msm msm: [drm:adreno_request_fw] loaded
qcom/yamato_pm4.fw from new location
[   15.124377] msm msm: [drm:adreno_request_fw] loaded
qcom/yamato_pfp.fw from new location
Pipeline is PREROLLING ...
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 1024
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 576
/GstPipeline:pipeline0/GstH264Parse:h264parse0.GstPad:sink: caps =
video/x-h264, stream-format=(string)avc, alignment=(string)au,
level=(string)3.1, profile=(string)main,
codec_data=(buffer)014d401fffe10
023674d401f967200800936028100000e100002bf203460016e40016e45ef7c1e1108a24001000468de3c80,
width=(int)1024, height=(int)576, pixel-aspect-ratio=(fraction)1/1
/GstPipeline:pipeline0/GstH264Parse:h264parse0.GstPad:src: caps =
video/x-h264, stream-format=(string)byte-stream, alignment=(string)au,
level=(string)3.1, profile=(string)main, width=(int)1024, height=(
int)576, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)25/1,
chroma-format=(string)4:2:0, bit-depth-luma=(uint)8,
bit-depth-chroma=(uint)8, parsed=(boolean)true
/GstPipeline:pipeline0/v4l2h264dec:v4l2h264dec0.GstPad:sink: caps =
video/x-h264, stream-format=(string)byte-stream, alignment=(string)au,
level=(string)3.1, profile=(string)main, width=(int)1024,
height=(int)576, pixel-aspect-ratio=(fraction)1/1,
framerate=(fraction)25/1, chroma-format=(string)4:2:0,
bit-depth-luma=(uint)8, bit-depth-chroma=(uint)8, parsed=(boolean)true
/GstPipeline:pipeline0/v4l2h264dec:v4l2h264dec0.GstPad:src: caps =
video/x-raw, format=(string)I420, width=(int)1024, height=(int)576,
interlace-mode=(string)progressive, multiview-mode=(string)mono,
multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)jp
eg, colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPipeline:pipeline0/GstKMSSink:kmssink0.GstPad:sink: caps =
video/x-raw, format=(string)I420, width=(int)1024, height=(int)576,
interlace-mode=(string)progressive, multiview-mode=(string)mono,
multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono,
pixel-aspect-ratio=(fraction)1/1,
chroma-site=(string)jpeg,colorimetry=(string)bt601,
framerate=(fraction)25/1
Pipeline is PREROLLED ...0 %)
Setting pipeline to PLAYING ...
New clock: GstSystemClock

Any adjustment I need to do in the Gstreamer pipeline to negotiate the
correct colors to the display?

Thanks
