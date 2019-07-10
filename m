Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF0464360
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 10:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfGJIJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 04:09:33 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49885 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726097AbfGJIJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 04:09:32 -0400
Received: from [IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea] ([IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea])
        by smtp-cloud7.xs4all.net with ESMTPA
        id l7fMhsLbn0SBql7fOh6R3G; Wed, 10 Jul 2019 10:09:30 +0200
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
 <20190603112835.19661-2-hverkuil-cisco@xs4all.nl>
 <CAAFQd5Aa-PQEakeg3sC_EDYdKy15hHx09Qmk6Jik4COeBe3xVA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <02da6340-3174-c03b-ffad-cc9a0a58afab@xs4all.nl>
Date:   Wed, 10 Jul 2019 10:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Aa-PQEakeg3sC_EDYdKy15hHx09Qmk6Jik4COeBe3xVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfB8/NX8OMxDhoB5rNNb4Nrxp+O02fe8pwgh4uz7RNaRO/12CMe5NnBdik+t2PDdSBV9zwCfQtcO5GOvH/vCMdvuO4LREs1q/VcPyupkoSXNH/7GpTpy7
 /ds4jkR99tFUr+xaJ4FVxvt/mnjXlBEOUHF3cHktbSvNZmeoKH53nX6zQFIQEB4EblOgFmjzjJf8Iuo869qJsUVfty7EZJKO6P1S9NwmTXVQ2Wl7RFuLd6o9
 lch5JvNcALsRkSt75o0siIszLNfPOttuEwVy4yhW3D+0kmAnasTTTEx9KpWNJSUHHCdiQzB5ueOP/r1ScpriO8ftobRu1mfiZy1Ir00vLn9CToxs5SG7SaZW
 ugDgAYGV01aiMA7OX/Z+F4RWKTmlhe635iE0UhVoS4ET9obEWA4fNNHT8JoHU+QkFsAtL16dyt37uY/DHjKGF0UxrBZE2Q3gKqGlRAFxTZ4hkhP4H/yTt27c
 XurABG4XNozGVHjUMHWiXm+87KUAkfs4TFtdYkGzTCTixylt2PG9+UhO/+i92nhQvfJbrIZT9NfK5KcPsEL++82N3BLcfGGfSpHJCQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/3/19 6:58 AM, Tomasz Figa wrote:
> Hi Hans,
> 
> On Mon, Jun 3, 2019 at 8:28 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> From: Tomasz Figa <tfiga@chromium.org>
>>
>> Due to complexity of the video decoding process, the V4L2 drivers of
>> stateful decoder hardware require specific sequences of V4L2 API calls
>> to be followed. These include capability enumeration, initialization,
>> decoding, seek, pause, dynamic resolution change, drain and end of
>> stream.
>>
>> Specifics of the above have been discussed during Media Workshops at
>> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
>> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
>> originated at those events was later implemented by the drivers we already
>> have merged in mainline, such as s5p-mfc or coda.
>>
>> The only thing missing was the real specification included as a part of
>> Linux Media documentation. Fix it now and document the decoder part of
>> the Codec API.
>>
>> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++++++
>>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    8 +-
>>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    5 +
>>  Documentation/media/uapi/v4l/v4l2.rst         |   10 +-
>>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
>>  5 files changed, 1132 insertions(+), 16 deletions(-)
>>  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
>>
> 
> Thanks a lot for helping with remaining changes.
> 
> Just one thing inline our team member found recently.
> 
> [snip]
>> +Capture setup
>> +=============
>> +
> [snip]
>> +4.  **Optional.** Set the ``CAPTURE`` format via :c:func:`VIDIOC_S_FMT` on the
>> +    ``CAPTURE`` queue. The client may choose a different format than
>> +    selected/suggested by the decoder in :c:func:`VIDIOC_G_FMT`.
>> +
>> +    * **Required fields:**
>> +
>> +      ``type``
>> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
>> +
>> +      ``pixelformat``
>> +          a raw pixel format.
> 
> The client should be able to set the width and height as well. It's a
> quite frequent case, especially in DMA-buf import mode, that the
> buffers are actually bigger (e.g. more alignment) than what we could
> get from the decoder by default. For sane hardware platforms it's
> reasonable to expect that such bigger buffers could be handled as
> well, as long as we update the width and height here.

I've added this:

     ``width``, ``height``
         frame buffer resolution of the decoded stream; typically unchanged from
         what was returned with :c:func:`VIDIOC_G_FMT`, but it may be different
         if the hardware supports composition and/or scaling.

Is that what you were looking for?

> 
> It's more like a clarification anyway, so if you think it would be
> better to just merge the current revision, I could send a follow up
> patch.
> 
> Regardless of that and FWIW:
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Thanks!

	Hans

> 
> Best regards,
> Tomasz
> 

