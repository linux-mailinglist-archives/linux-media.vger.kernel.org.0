Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2DA031678
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 23:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfEaVQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 17:16:21 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35018 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfEaVQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 17:16:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id n14so10616387otk.2
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 14:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pLsnHblaPA6ltUrHBbA6hvdqjwMzJQF190hgwiqpPkM=;
        b=RT4LBtWLbPNuvXoU/VYroHu4J6ADSS0cXIRXzYFkuvT7rSBjde2WZufzsr6zUmNPzs
         zkiq0rWD9m/XhYp105mlhcKJ6kOOOLdyCQ4XIj2ncKuDROOJ1XpRjPygbVE9Kd6v4qjS
         yi0IWfDsTeru8FZ3p88DKSaNf1rzX34ifPSt3LPVOAX6PQeByEG106d3f8c3oTL6DSSL
         bkzPI1aNU25nteSY3Yp/JV9G/sg7Ma36Z0udKrsTWmMmJFBnXJYWNOSi1e8g0WrAdb0M
         bAuqE9gdIix5KKIJbAc9EE0qohBL2UFrCZFnd/SnALl54ILkg6nxWLNpW3BLzsFaC4A+
         xYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pLsnHblaPA6ltUrHBbA6hvdqjwMzJQF190hgwiqpPkM=;
        b=h93E9dRawJc3htnGnorhxpuOPYAdqiU9TcqDcZmThFMi8m56WeBv0rgFTbonIGl/7r
         NKPnyk2MaOXpP8m87EZmUPgottQ/zTM7euymvVqo9CKvqJEQhraNugioIDqjLF4zt+o/
         fougaJMPG5Ekb4MRrVHnuzB/n/HXkmPd9JGWGIxeK1qjFtzK3lpar7S2I+BTAjkKeabf
         GtVJfCk6ZW6VdezI5GTzOIfMiIq5LU2oK4rVUKqGlnxxNWMChv1ctKVp6Vca4xrF5JL1
         pmX95YkPArkmtLSuGnTt2R0mHrv6DUGyoxoNiqIWe/oq+XyJDbQAxO9pXLkeRz7ssfcm
         a3hw==
X-Gm-Message-State: APjAAAWMDfXKsloktDdK4mIOpVNJ+VlQ6L5MJP44Zabl7D61oIMmc7yS
        kJkfW+U6UFn7Mh4YAa08p3y/LnYHiIrNmuE4ocA=
X-Google-Smtp-Source: APXvYqzp4c9VYkD1sB5O4yu8IoI7SrT1eubCEHCqjbbXNRantLZS0gd9CPGNCYqqQV+EfEs3qGbZWkax39/HU3FwzzE=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr3607277otk.232.1559337380656;
 Fri, 31 May 2019 14:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
In-Reply-To: <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Fri, 31 May 2019 17:16:09 -0400
Message-ID: <CAGngYiUow1YNvoLL8Qq3XAtXh4G1vnuHi97d2XhQiqQc6Jtf=Q@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Fabio Estevam <festevam@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Nicholas and Fabio,

The sdma firmware turned out to be a non-issue: adding "qos=0" to kmssink
(as suggested by Nicholas) is what fixed kmssink performance, unrelated to sdma.

(Although I still see an sdma issue, unrelated to this thread - I will talk
to Robin about it outside of the thread)

So now I am getting identical h264 decode/noscale performance across kernel
versions. Performance is identical to the Freescale kernel. And kmssink
works great, as long as "qos=0" is added - as Nicholas suggested.

========> That's fanastic !!! <========

However I see performance and corruption issues with the v8 scaler patch.
Probably to be expected, after all it's a patch 'in progress'.

This is on a 5.2-rc2 kernel, with Philipp's non-plus imx6 patch applied.
(Running on a non-plus imx6q)

Upscaling 720p -> 1080p works ok, however the performance is lower than
the Freescale kernel. This is with a 720p24 Toy Story 4 demo grabbed from
YouTube:

# gst-launch-1.0 -vvv filesrc location=/home/default/toy720p.mp4  !
 qtdemux ! h264parse ! v4l2h264dec ! v4l2video8convert  !
 video/x-raw,width=1920,height=1080 !
 fpsdisplaysink video-sink="fakevideosink" text-overlay=0 sync=0
[...]current: 42.19, average: 41.95

Still much better than real time, but lower than the Freescale kernel, which
did at least 60fps (using mfw_v4lsink sync=0).

However, downscaling 1080p -> 720p is problematic:
# gst-launch-1.0 -vvv filesrc
location=/home/default/jellyfish-10-mbps-hd-h264.mkv !
 matroskademux ! h264parse ! v4l2h264dec ! v4l2video8convert  !
 video/x-raw,width=1280,height=720 !  fpsdisplaysink video-sink="fakevideosink"
 text-overlay=0 sync=0
[...]current: 24.62, average: 24.08

This is not real time, as jellyfish is a 30fps video. On the Freescale kernel,
this would work at 60fps (again using mfw_v4lsink sync=0).

In addition, the image produced is corrupted:
(displayed with "kmssink can-scale=0 qos=0" w/ 720p monitor mode)
https://imagebin.ca/v/4j1q0qRpzgqV

Hope this is useful. Thank you again for making this available to mainline!
Sven
