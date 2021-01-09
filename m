Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBD22EFCD3
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 02:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbhAIBsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 20:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbhAIBsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 20:48:09 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D086C061573
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 17:47:29 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id h205so27422555lfd.5
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 17:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZY6nHCOJU3QoV66/+jYgEOrBuJHuZE3iXqk3vYlDckM=;
        b=kk13x3YcGtfppXPwaQYBXU6y2fgsoqFO0BstBqrNmdLbqUPg1Z+/mjJdw8hnbnZ2zf
         e1vLhRcflgye4rQZlSg2/AdURWMsEEFYjIWH4hBMf55l0qrHiNLxF6ZVVSUb1Y5bm8E6
         sRXS5hKmN/gWC8zymwRQnXt/v2kYysYxZGXOoNUOJvCEEYam+GHuj6szX+AYmq1eJAkk
         lpq2FUDPgK/vG29UYcthbmGdt0WkeiiifOruw3K5/7eOT3HGf9d/YcVb0C3ehksK1VdX
         rLtXlv87M657zL5PM6CDWhBhxYq+9yKWCj6lU5BzhAoHIQl3Zf56RcRXByUH5RQBUy1I
         BWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZY6nHCOJU3QoV66/+jYgEOrBuJHuZE3iXqk3vYlDckM=;
        b=Ojc8e3b911scf00zI2uCbc2E0nuei9LNsSgRkGMMKP8y8MIf+I9EIzeDXUgyPhokBt
         18m3qLWqhV9VXe6QnxZRyTkMk+g1jdMP3xKTEGuyBWCOAZaewBq2cjp0UeCRu9D4Si7z
         /MjfgVDX+1zrxEw+dOL4wPjFzKFjSNcQA/yO86NjMruRxa5gifJfUitLwh7xY7sPvNCJ
         1n3xrBucjyYlcG7SHvhIBwIcJPs1mMMYHzs/ZJGcJolu5lyFFNvO/GIZmBZZhIWM//bv
         jfE+GcDTVAX+FXOPU2UctFJxU6UX1C2RGIOd5g1Ihb4rWbQZRWDyuRKe74tXZXfWzLzi
         Igyw==
X-Gm-Message-State: AOAM5321V14ZzsfRQLYbaAqQOdagg8OPodkytOTNxYLJYA2yHikaziBj
        7t8D9z13YerVuTXOmMzT2rxUva9p7jez6hx8Hkg=
X-Google-Smtp-Source: ABdhPJwU476mLQhniOYKA2YyKzsc8NBIzNW0af+5w5lXFU9M6kRYYoY4JcAAQsJSAg1JobP1JR2B0KbMaLCeWShLqPk=
X-Received: by 2002:a2e:b4b3:: with SMTP id q19mr2498093ljm.121.1610156846351;
 Fri, 08 Jan 2021 17:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com>
 <X/XaJ0UA04ekdWpi@pendragon.ideasonboard.com> <CAOMZO5CkT1i3TMhC=VuZ4c3B6VnKX7jDj6wYON9VLMyQdDODKA@mail.gmail.com>
 <X/kCmomKdjh3Yepp@pendragon.ideasonboard.com>
In-Reply-To: <X/kCmomKdjh3Yepp@pendragon.ideasonboard.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 8 Jan 2021 22:47:15 -0300
Message-ID: <CAOMZO5A42C4A58WjjHmRV4NVCVxiwKeCjsibSsC=FgLgD8o79Q@mail.gmail.com>
Subject: Re: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for i.MX7
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jan 8, 2021 at 10:11 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> Ah of course, I should have mentioned that, sorry. Without the legacy
> video node API, the pipeline has to be configured with the MC API and
> the V4L2 subdev userspace API before starting the stream.

The current method I use is:

media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
media-ctl -l "'csi':1 -> 'csi capture':0[1]"
media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_2X8/320x240 field:none]"

# gst-launch-1.0 -v  v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink

Could you please let me know what is the correct way I should do with
the MC API?

Thanks
