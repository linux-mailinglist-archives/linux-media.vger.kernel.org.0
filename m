Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5985E5D53
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 10:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiIVIUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 04:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiIVIUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 04:20:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37A897B2C
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 01:20:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7448463468
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 08:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE49BC433C1;
        Thu, 22 Sep 2022 08:20:26 +0000 (UTC)
Message-ID: <6a0b8be9-7486-3f22-1181-af61f6559f30@xs4all.nl>
Date:   Thu, 22 Sep 2022 10:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] utils: add v4l2-tracer utility
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, deborahbrouwer3563@gmail.com
References: <20220917022947.141330-1-deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220917022947.141330-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 17/09/2022 04:29, Deborah Brouwer wrote:
> The v4l2-tracer utility traces, records and replays userspace applications
> that implement the v4l2 memory-to-memory stateless video decoder
> interface. The trace function intercepts and copies all system calls,
> stateless codec controls and encoded data to a json-formatted trace file.
> The retrace function independently reads and replays the json trace file.
> The json trace file can be retraced independently from its original
> userspace environment and can be edited to inject errors to test a
> driver's error handling abilities.
> 
> The v4l2-tracer currently supports VP8, H264 and FWHT formats.

Thank you for working on this, very nice!

A more in-depth review will follow (hopefully next week), but I
did have one high-level naming question:

> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> This patch supercedes:
> [RFC,1/2] utils: add stateless tracer utility
> [RFC,2/2] utils: add stateless retracer utility
> 
> Changes since RFC:
> - combined tracer/retracer into one utility
> - added h264 and fwht formats
> - removed hard-coded link to shared library
> - added help options and man page
> - reduced json-c version requirements to 0.15
> 
> Examples:
> 
> Trace VP8 decoding:
> 
>   v4l2-tracer trace -- gst-launch-1.0 -- filesrc
>   location=test-25fps.vp8 ! parsebin ! v4l2slvp8dec !
>   videocodectestsink
> 
> Trace H264 decoding:
> 
>   v4l2-tracer trace -y -- gst-launch-1.0 -- filesrc
>   location=test-25fps.h264 ! parsebin ! v4l2slh264dec !
>   videocodectestsink
> 
> Trace FWHT decoding:
> 
>   v4l2-tracer trace -- v4l2-ctl -d9 --stream-mmap
>   --stream-out-mmap --stream-from-hdr test-25fps.fwht
>   --stream-to out.yuv
> 
> Retrace:
>   v4l2-tracer retrace 79568_trace.json
> 
>  configure.ac                         |   12 +
>  utils/Makefile.am                    |    5 +
>  utils/common/v4l2-info.cpp           |    7 +-
>  utils/common/v4l2-info.h             |    8 +
>  utils/v4l2-tracer/.gitignore         |   12 +
>  utils/v4l2-tracer/Makefile.am        |   23 +
>  utils/v4l2-tracer/libtracer.cpp      |  209 +++++
>  utils/v4l2-tracer/libtracer.h        |   35 +

If I understood it right, this will install a libtracer library?

In that case, the library name is much too generic, it should be renamed
to libv4l2tracer.

Regards,

	Hans

>  utils/v4l2-tracer/retrace-fwht.cpp   |   54 ++
>  utils/v4l2-tracer/retrace-fwht.h     |   11 +
>  utils/v4l2-tracer/retrace-h264.cpp   |  446 +++++++++
>  utils/v4l2-tracer/retrace-h264.h     |   16 +
>  utils/v4l2-tracer/retrace-helper.cpp |  157 ++++
>  utils/v4l2-tracer/retrace-helper.h   |   44 +
>  utils/v4l2-tracer/retrace-vp8.cpp    |  288 ++++++
>  utils/v4l2-tracer/retrace-vp8.h      |   11 +
>  utils/v4l2-tracer/retracer.cpp       | 1281 ++++++++++++++++++++++++++
>  utils/v4l2-tracer/trace-fwht.cpp     |   24 +
>  utils/v4l2-tracer/trace-fwht.h       |   11 +
>  utils/v4l2-tracer/trace-h264.cpp     |  281 ++++++
>  utils/v4l2-tracer/trace-h264.h       |   18 +
>  utils/v4l2-tracer/trace-helper.cpp   |  667 ++++++++++++++
>  utils/v4l2-tracer/trace-helper.h     |   81 ++
>  utils/v4l2-tracer/trace-info.cpp     |  460 +++++++++
>  utils/v4l2-tracer/trace-info.h       |   93 ++
>  utils/v4l2-tracer/trace-vp8.cpp      |  183 ++++
>  utils/v4l2-tracer/trace-vp8.h        |   11 +
>  utils/v4l2-tracer/trace.cpp          |  582 ++++++++++++
>  utils/v4l2-tracer/trace.h            |   17 +
>  utils/v4l2-tracer/v4l2-tracer.1.in   |  109 +++
>  utils/v4l2-tracer/v4l2-tracer.cpp    |  181 ++++
>  utils/v4l2-tracer/v4l2-tracer.h      |   39 +
>  32 files changed, 5370 insertions(+), 6 deletions(-)
>  create mode 100644 utils/v4l2-tracer/.gitignore
>  create mode 100644 utils/v4l2-tracer/Makefile.am
>  create mode 100644 utils/v4l2-tracer/libtracer.cpp
>  create mode 100644 utils/v4l2-tracer/libtracer.h
>  create mode 100644 utils/v4l2-tracer/retrace-fwht.cpp
>  create mode 100644 utils/v4l2-tracer/retrace-fwht.h
>  create mode 100644 utils/v4l2-tracer/retrace-h264.cpp
>  create mode 100644 utils/v4l2-tracer/retrace-h264.h
>  create mode 100644 utils/v4l2-tracer/retrace-helper.cpp
>  create mode 100644 utils/v4l2-tracer/retrace-helper.h
>  create mode 100644 utils/v4l2-tracer/retrace-vp8.cpp
>  create mode 100644 utils/v4l2-tracer/retrace-vp8.h
>  create mode 100644 utils/v4l2-tracer/retracer.cpp
>  create mode 100644 utils/v4l2-tracer/trace-fwht.cpp
>  create mode 100644 utils/v4l2-tracer/trace-fwht.h
>  create mode 100644 utils/v4l2-tracer/trace-h264.cpp
>  create mode 100644 utils/v4l2-tracer/trace-h264.h
>  create mode 100644 utils/v4l2-tracer/trace-helper.cpp
>  create mode 100644 utils/v4l2-tracer/trace-helper.h
>  create mode 100644 utils/v4l2-tracer/trace-info.cpp
>  create mode 100644 utils/v4l2-tracer/trace-info.h
>  create mode 100644 utils/v4l2-tracer/trace-vp8.cpp
>  create mode 100644 utils/v4l2-tracer/trace-vp8.h
>  create mode 100644 utils/v4l2-tracer/trace.cpp
>  create mode 100644 utils/v4l2-tracer/trace.h
>  create mode 100644 utils/v4l2-tracer/v4l2-tracer.1.in
>  create mode 100644 utils/v4l2-tracer/v4l2-tracer.cpp
>  create mode 100644 utils/v4l2-tracer/v4l2-tracer.h
> 

