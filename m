Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FB93CD40B
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 13:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbhGSLCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 07:02:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35938 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbhGSLCx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 07:02:53 -0400
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 46FA31F41A99;
        Mon, 19 Jul 2021 12:43:30 +0100 (BST)
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <976d420c-b4fc-bc23-c398-9b3a7ab4ffc9@collabora.com>
 <CAPBb6MVcnei2OLFYG-2YyqZrY8JvA-CJN6SUv=vGRmOZ2Af47g@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <dc3e6d05-39cd-9124-a452-1a72348c33ea@collabora.com>
Date:   Mon, 19 Jul 2021 13:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MVcnei2OLFYG-2YyqZrY8JvA-CJN6SUv=vGRmOZ2Af47g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 13.05.21 10:21, Alexandre Courbot wrote:
> Hi Dafna,
> 
> On Thu, Apr 29, 2021 at 9:07 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> Hi,
>>
>> On 27.04.21 13:15, Alexandre Courbot wrote:
>>> This series adds support for the stateless API into mtk-vcodec, by first
>>> separating the stateful ops into their own source file, and introducing
>>> a new set of ops suitable for stateless decoding. As such, support for
>>> stateful decoders should remain completely unaffected.
>>>
>>> This series has been tested with both MT8183 and MT8173. Decoding was
>>> working for both chips, and in the case of MT8173 no regression has been
>>> noticed.
>>
>> I am trying to test the decoder with this patchset using v4l2-ctl on mt8173.
>>
>> I am trying to decode an h264 file into V4L2_PIX_FMT_MT21C format.
>> I am not able to do it. It seems that the driver expects each buffer to start
>> with a nal starting code, and the v4l2-ctl command just read the files into
>> buffers without any parsing.
>>
>> Can you share the command and the files you used for testing?
> 
> I have been using the Chromium test suite (aka
> video_decode_accelerator_tests). I had doubts after reading your email
> but I tested the series again using this tool and confirmed it was
> working.

Hi, I have a chromeos userspace that I compiled. I use it to test the codec drivers on latest 5.14.
Could you share the exact command you use for your tests?

I used the command:
tast -verbose run -build=false 10.42.0.175 video.DecodeAccel*h264*

With that commands, all the tests that ends with 'VD' fail , the other tests pass.

The docs in [1] says that the command video_decode_accelerator_tests  does not require the "full Chrome browser stack",
does that mean that it can be compiled and run on userspace other than chromeos?
I could not find the instructions of how to compile and install that command. Could you instruct me to it?

The mt8173 doc [2] says that the supported video decoders are "H.264,  H.265 / HEVC,  MPEG-1/2/4"
But running 'v4l2-ctl --list-formats-out -d0' shows:

ioctl: VIDIOC_ENUM_FMT
     Type: Video Output Multiplanar

     [0]: 'H264' (H.264, compressed)
     [1]: 'VP80' (VP8, compressed)
     [2]: 'VP90' (VP9, compressed)

So the source code shows support for vp8, vp9 which is not stated in the official doc.
Do you know the explanation for that difference? Do you know if elm device should support vp8, vp9?

[1] https://chromium.googlesource.com/chromium/src/+/HEAD/docs/media/gpu/video_decoder_test_usage.md

[2] https://www.mediatek.com/products/tablets/mt8173

Thanks,
Dafna

> 
> Unfortunately this test is not easy to build, but maybe if you have a
> Chromium environment ready you can run it. mtk-vcodec does expect the
> input buffers to be split by NAL units (as per the spec [1] IIUC), so
> that would explain why v4l2-ctl failed (I assume that it also fails
> without this series?).
> 
> Maybe ffmpeg can also be used to exercice this driver with properly
> split NAL units, but I am not familiar with its use with V4L2. I'm
> also not sure it would be happy about the MT21C format that the driver
> outputs, or that it could pick the MDP to convert it to something
> readable...
> 
> Cheers,
> Alex.
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-compressed.html#compressed-formats
> 
