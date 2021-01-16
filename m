Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6162F8B47
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 05:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbhAPEem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 23:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbhAPEem (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 23:34:42 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C619C061757
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 20:34:02 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id r63so7082671ybf.5
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 20:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=dhapSAA2BFquQtYsH0MjLWIwebq2/eF2YbRdQFJxLs8=;
        b=kolag8cJ6OHSX25mD33IfDjEzMNrlB0xsVvGp4k4xLzy2/erKV/FT93TDRUGBDd9RB
         HEhUgPEYcDAvK0g9Ngj8BoRTklsKW+9r+KOLpG+DaJeJTvVUpd6eQyztgRd29VFVmcpW
         1HHYQ5+YFPStjJGkLlYYFfLUTUIrnMXFN8LrGNMMPrBHIETInb1UNfax5aFx1U912vH4
         RVVxxluwIAz9XdYumwa54Jf+/9dr/HZpJVLWaQ5jCLNCWIU/qkuwy1PLEHQKACZ9r3Ex
         /SjbpKp/yCmS22Dm0w2LtRpNUyVqYWwibMz7V58oTar2U2xAgIIs/1+CfVwoVxpk2C1w
         eF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dhapSAA2BFquQtYsH0MjLWIwebq2/eF2YbRdQFJxLs8=;
        b=fopkK2nO7xZvDCRVePAtaMgovMteXuj374h745tLjLTWWzZU3scUlMKo4pkg/vMXh3
         SDWDpwEenbZlnhyrqijh9S1ffAqeLfzx84MlQAXyZ0VfqdibmnuEzhIegK+QfV96Fy1L
         IuF7kgY6RlYCjD6Px9jqpxFXIkvsfu4xzMSMahdV1uMTIff+ZxR5b24KFPay6yQalrHI
         vsGPDUyTCszuTbJCiCR4GCTVIYPPunSmd5DPHOui+sw3GXrjdovlb3d2UH8l20t4yeXe
         y7g/WFYdQBUsU8d3KNzXR8X1hue5ctFhAMrPiUfC+e7Xjl9ZCcMyWGMcaUJj+GRsrAlO
         3a0A==
X-Gm-Message-State: AOAM5303SXwg0ckmJc5hfueg2q7tm5qOGriUs9i2F0tF/F4WpDv13s86
        S+8F7IQIfLv2u6a9PV7uH5I5oKKA+Hwy8MxbBjREqSwy8fIXXXVGCao=
X-Google-Smtp-Source: ABdhPJzV0FxDWGFCZZC0ANwKfKWfyp3/P8Ir6UnVsKZ9W5MPvFU024qftxhoGa2V5c2HTJsHm2e+zgtEa0Lj16wbpuI=
X-Received: by 2002:a25:77d2:: with SMTP id s201mr7224143ybc.424.1610771640983;
 Fri, 15 Jan 2021 20:34:00 -0800 (PST)
MIME-Version: 1.0
From:   Fritz Koenig <frkoenig@google.com>
Date:   Fri, 15 Jan 2021 20:33:49 -0800
Message-ID: <CAMfZQbzay0+tyYvZmF_L=iYfp+F02iz3qz=a=J1Yuf55P=RebA@mail.gmail.com>
Subject: V4L2 logging for multiple streams
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm trying to sort some issues with regards to decoding multiple
streams at once.  Logging can be helpful with messages like this:

[105188.500450] video2: VIDIOC_STREAMOFF: type=vid-out-mplane

but when I have:

[105188.498697] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
[105188.498715] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
[105188.499116] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
[105188.500450] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
[105188.500467] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
[105188.500611] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
[105188.501879] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
[105188.502276] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
[105188.502331] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane

I can't tell which stream VIDIOC_STREAMOFF is associated with.  Is
there a logging option that I'm missing that would help indicate which
stream that ioctl is associated with.

Thanks.

-Fritz
