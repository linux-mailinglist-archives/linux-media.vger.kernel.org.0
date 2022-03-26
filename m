Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9034E808F
	for <lists+linux-media@lfdr.de>; Sat, 26 Mar 2022 12:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbiCZLU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Mar 2022 07:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiCZLUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Mar 2022 07:20:25 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43E245AF2
        for <linux-media@vger.kernel.org>; Sat, 26 Mar 2022 04:18:47 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a02:3030:b:56bb:d8a:fe2d:6f23:cfa0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sebastianfricke)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 817A11F46117;
        Sat, 26 Mar 2022 11:18:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1648293525;
        bh=N8ZLhwPZ+dmO9UW8tI0AnKhgPjo5tMpEN35XJxIUeIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J3DHxd/AzQ2oA4vylHDpTETQ8y0BEQoeihF3OdzB/XGUSU7lcNjEOETQ4sloMv5EB
         sI9sEIuqqYo1eXhwEBVHn25yYDxiKsOntlyWwv/Vxp6Ro9vZUwCsMXt/fQeHhdeLOl
         92izdabxC/Td6m0pRe9FQ1ZciRl9DQvc1H/m/T/vn7PDmPXxODQe/5kG81LpcgbB44
         mkpEOEq7lfrl6Uvai603z9u3GOntgR/089Vj+Sban/lgN2DygJpNK9L2kAowBgqMLL
         5CnQKornkJbZ7BQmlxCKERt+LbjOQQnTvAqtHq1tP9gYmkRJL3qFiR8wjP8BNX779C
         Kb57Lh7Zd5RbA==
Date:   Sat, 26 Mar 2022 12:18:42 +0100
From:   Sebastian Fricke <sebastian.fricke@collabora.com>
To:     Kwang Son <dev.kwang.son@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: media newbie want to contribue on staging devices
Message-ID: <20220326111842.5whsl4u3nagn3trm@basti-XPS-13-9310>
References: <20220326044910.GA6192@kwang-MS-7B23>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220326044910.GA6192@kwang-MS-7B23>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Kwang Son,

On 26.03.2022 13:49, Kwang Son wrote:
>Hi all,
>I try to contribute on media frameworks. I contributed small typo and
>want to jump on staging/media.(I guess it's good to start)
>I've seen git log to find some spot but hard to understands which
>one is relatively easy (and it looks some devices are just wait to deprecate).
>Anyone can recommend which one is more easy to get target devices(I'm
>ready to spend money on it) and really needs help?

So, first of all I would recommend you to think about which area of the
Media subsystem is of interest to you, as the subsystem contains
multiple different types of devices. There are:
- codecs
- I2C camera sensor devices
- USB camera devices
- Image Signal Processors (ISP)
- Analog/Digital TV devices 
- Software defined radio
- And a few other more specific types ...

 From my point of view, it is just more fun to fix and improve a device
if you are actually excited about the outcome and don't just do it to send
patches to the Kernel.

---

In case you are interested in working with codecs, I can suggest you a
bit from my personal experience:
Something like a RockPi4 contains multiple Multimedia devices currently
located in staging (Hantro/RkVDEC), as well as an ISP (rkisp not in
staging anymore but still has areas to be improved) and MIPI ports to
work with cameras and displays.
This means one thing you could start with is simply testing hardware codecs.

There is a test framework for decoders called fluster:
https://github.com/fluendo/fluster, it basically provides a series of
test suites, containing encoded test videos, and a list of decoders to
run over those suites.

Fluster will create a GStreamer (https://gstreamer.freedesktop.org/) pipeline,
which is basically a series of elements linked together, in this case:
encoded byte stream -> codec parser -> hardware codec driver -> video converter -> video sink.
And check if the decoder worked correctly by comparing the result with
the reference.

To get there you have to do the following steps:
- Set up the latest Media subsystem Kernel on the RockPi4 (as a base you
could use something like: https://www.armbian.com/rock-pi-4/, etc.)
- Get & Build GStreamer with support for the hardware decoders:
   ```
   git clone https://gitlab.freedesktop.org/gstreamer/gstreamer.git
   cd gstreamer
   meson -Dauto_features=disabled -Dbad=enabled -Dbase=enabled -Dgood=enabled -Dgst-plugins-bad:debugutils=enabled -Dgst-plugins-bad:ivfparse=enabled -Dgst-plugins-bad:v4l2codecs=enabled -Dgst-plugins-bad:videoparsers=enabled -Dgst-plugins-base:app=enabled -Dgst-plugins-base:playback=enabled -Dgst-plugins-base:tools=enabled -Dgst-plugins-base:typefind=enabled -Dgst-plugins-base:videoconvert=enabled -Dgst-plugins-good:matroska=enabled -Dgstreamer:tools=enabled -Dwrap_mode=nofallback -Dgst-plugins-good:v4l2=enabled -Dgst-plugins-base:videotestsrc=enabled -Dgst-plugins-base:rawparse=enabled -Dbackend=ninja -C build
   ninja -C build
   ```
- Get fluster, download test suites and run them:
   ```
   git clone https://github.com/fluendo/fluster.git
   cd fluster
   # example for a H264 vector
   python3 fluster.py download JVT-AVC_V1
   # store reference video
   python3 fluster.py reference GStreamer-H.264-V4L2SL-Gst1.0 JVT-AVC_V1
   # Run test on the single vector and store resulting video in results/
   python3 fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-AVC_V1 -tv SVA_BA2_D -k
   ```
- Next you can pull the resulting image (as the run command was executed with `-k`),
by simply moving the file to your dev machine with rsync:
   ```
   # pull the result
   rsync user@192.168.199.99:/home/user/fluster/results/JVT-AVC_V1/SVA_BA2_D.out /tmp/SVA_BA2_D.yuv
   # pull the reference
   rsync user@192.168.199.99:/home/user/fluster/resources/JVT-AVC_V1/SVA_BA2_D/SVA_BA2_D.264 /tmp/SVA_BA2_D.264
   ```
- Look at the reference and the result with YUView (https://github.com/IENT/YUView), you can find the required dimensions, pixel format settings in the reference.

This basic workflow can now be used to perform different tests with the
drivers, search for errors in images and try to fix them through:
- communication with the community in this mailing list
- Search for fixes in downstream kernels, prominent example LibreElec (https://github.com/LibreELEC/LibreELEC.tv/tree/master/projects/Rockchip/patches/linux/default) and try to upstream (merging into the latest kernel) them.
- Look at the reference code by the hardware vendor to find things that
might be incorrect upstream or missing (https://github.com/JeffyCN/rockchip_mirrors/tree/mpp/mpp)
- Reading the specification (when available) https://www.itu.int/rec/T-REC-H.264

---

Additionally, it is always helpful to run the v4l2 compliance tests on
drivers:
```
git clone https://git.linuxtv.org/v4l-utils.git
cd v4l-utils
./bootstrap.sh
./configure
make
sudo make install
```

```
v4l2-compliance -d /dev/media0
```
You can try to fix these errors and ask for clarification in this
mailing list.

---

One thing to keep in mind is that the main reason for those hardware codecs,
mentioned above, to be located in staging is that the uABI of some of those
codecs isn't stable yet.
So, you might ask why isn't the uABI stable yet? The reason for that is
that the subsystem maintainers want to see a usecase of that ABI to
validate that the Kernel uABI isn't broken, because the uABI, once it is
stable, has to be backwards compatible as multipe users might already be
commited to it.

In case you want to help there you could help to review the uABI merge
request: https://patchwork.kernel.org/project/linux-media/list/?series=618760
by reading through the changes and comparing it with the
specification https://www.itu.int/rec/T-REC-H.265-202108-I/en

Which is connected to the GStreamer plugin merge request:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1079
that you could also help to review.

---

If you are more interested in video capture, you should take a look at
libcamera https://www.libcamera.org/. You can ask them for issues they
currently have with Kernel drivers (for example with IPU3).

---

Hope this helps :)

Greetings,
Sebastian
