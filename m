Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E4032D3D5
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 14:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241066AbhCDNDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 08:03:47 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34989 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241053AbhCDNDq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 08:03:46 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Hnd6lfrEqqY4WHnd9lVPwg; Thu, 04 Mar 2021 14:03:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614862985; bh=vnsnrBLqJpgjvzz/rlWzaQ14g9AbK0+JW+vdzz1mjFc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=G0L6cZ3FAhV/DZPYRWxfSpOMo/GY1SwncpQp2WcaLMpRFGS+EeLuqwgbNF1uRHCgE
         o9kNmv925w9TFOAlFsqrKNMAdCucC9BuygwII2HLPpWMuRuc+mL2p2eJs1w4381Ecb
         UvKCqoveLd6zcHO9Xc1NoMe3MLMPnbsgz+YVwx638U+AUfGZVUrstaWT3E2KG62QIK
         gfEXJvfPnVUiYDByNJJZMz6Mn1WgOVdoyOAeyXyBT4fx+wrs/zgcZGZApHVWF1jomS
         PZm4MFR5WICTAfiQOvFqMABcUonnowgujxRvbY2V0+OFER9feLzf2xWrA88nlZqQVE
         wBHyMuOnt0qJg==
Subject: Re: [EXT] Re: [PATCH v7 3/9] media: imx-jpeg: Add V4L2 driver for
 i.MX8 JPEG Encoder/Decoder
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
 <20210111192822.12178-4-mirela.rabulea@oss.nxp.com>
 <bec844f0-692f-de1e-a52d-a836ff792ef6@xs4all.nl>
 <3518c6c773b2bbd2cf818c1cf3109a9fa06720f7.camel@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4f03ecbf-2997-6c56-92c9-16f9e1f0f574@xs4all.nl>
Date:   Thu, 4 Mar 2021 14:03:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3518c6c773b2bbd2cf818c1cf3109a9fa06720f7.camel@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPPKKNQABOHUB2CifbKj81ILId31NdTDavwX35OxOKhQT1/T+tfbG/RsH51FaZwrOncJWMAeGGP7XhILBmaGKVME8dqx6G9bofGgE59c09eU1WZwUlnZ
 BNUALdwUJiqPC1fsxdQeYnoelpOPJCMzYvW/iHsK5jLWDObKoUU3ErfqR9tTYe9z/Kmi/Za66MNuYyM1VBTNZ+OjF/4bD4Wejwz3mTWeXqIAoaLe1m7JPf6m
 HSbAICRRXbKVhtuua0cOgS6HgaAIffOEVe1fsCA4o3DCfxIPUpuUbzRrBbn2K73AyOabXW1JWz26c+I0lb7xlM3A31ItOMKP3trwwo7e/j+mr2VFr7V1e3i+
 w9eI9WkD1NI9xfxaUDWS+d4W+Vv6CJCXJl0Zta0RHJRG9ixXdgwFjr9OUr7WxJ1qp/R+wk1C2uBQdTfGSXmugDzgp5f5ZLHsth3yWp7eHz6ormTQgsqghI8K
 rpBGePow+hsk28luvGTRbW0ax3b113zfSj0sn9s585dv+LXZlejqljL01fCvyCYeeaubw4jEnv8eMyURLQ1zk6FLlLlltWGMHC+1pPLY1xaFI/awkVNAczEU
 MGM/RLarsrqH9fb3hICWVZdXXKm+MWOJRCMlv3z1sCf0Da2JA67Xxx1lz/uvNMI4Kyg9SNvFHA6RYDor8fKWd0lBULyzjKKqbvqqOLSCbs+QbNLZ+zqcTr9I
 nQK3YRMuJpNfut3/8pbOc0Dco4KwQYUvu921LXVIcHldUaNrcUycoMEJquE2FdwpSLo298fyn8BmWWV50TcYfJrlhwzk4UeHB9Jlba7GsdPDhd6ep3QEVor0
 jTaP8Eu0fMXCkUGl03AhR92DuUDzWGMIPBk1qs9q9YKs4cgeoZd44erL4JqxEmJtSqABFYJBB5XtG1STjyBC+qS1I+WlGrgBhwXmRkH+f3BLjUg9B/RbyWJH
 SSTuyA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/02/2021 20:09, Mirela Rabulea wrote:
> Hi Hans,
> appologies for my late response, please see below 2 comments.

Replies below:

> 
> On Tue, 2021-01-19 at 11:31 +0100, Hans Verkuil wrote:
>> Caution: EXT Email
>>
>> On 11/01/2021 20:28, Mirela Rabulea wrote:
>>> From: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>
>>> V4L2 driver for the JPEG encoder/decoder from i.MX8QXP/i.MX8QM
>>> application
>>> processors.
>>> The multi-planar buffers API is used.
>>>
>>> Baseline and extended sequential jpeg decoding is supported.
>>> Progressive jpeg decoding is not supported by the IP.
>>> Supports encode and decode of various formats:
>>>      YUV444, YUV422, YUV420, RGB, ARGB, Gray
>>> YUV420 is the only multi-planar format supported.
>>> Minimum resolution is 64 x 64, maximum 8192 x 8192.
>>> The alignment requirements for the resolution depend on the format,
>>> multiple of 16 resolutions should work for all formats.
>>>
>>> v4l2-compliance tests are passing, including the
>>> streaming tests, "v4l2-compliance -s"
>>>
>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>> ---
>>> Changes in v7:
>>>   Add print_mxc_buf() to replace print_buf_preview() and
>>> print_nbuf_to_eoi(),
>>>   and inside, use the print_hex_dump() from printk.h, also, print
>>> all the planes.
>>>
>>>  drivers/media/platform/Kconfig                |    2 +
>>>  drivers/media/platform/Makefile               |    1 +
>>>  drivers/media/platform/imx-jpeg/Kconfig       |   10 +
>>>  drivers/media/platform/imx-jpeg/Makefile      |    3 +
>>>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c |  168 ++
>>>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h |  140 +
>>>  drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2289
>>> +++++++++++++++++
>>>  drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  184 ++
>>>  8 files changed, 2797 insertions(+)
>>>  create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
>>>  create mode 100644 drivers/media/platform/imx-jpeg/Makefile
>>>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
>>>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
>>>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
>>>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h
>>
>> One high-level comment: why introduce the driver in patch 3/9 and
>> then
>> change it again in 9/9? I would very much prefer to have just a
>> single
>> patch that adds this driver, i.e. merge patch 3 and 9 into a single
>> patch.
> 
> I can squash patch 9 into patch 3, but please note that patch 9 depends
> on jpeg helper patches 6,7,8, so these patches will also have to move
> before patch 3. Let me know yout thought and I'll do this in v9, in v8
> version I only addressed the rest of your feedback and some more from
> Philipp.

Yes, just move the jpeg helper to earlier in the patch series.

> 
>>

<snip>

>>> +     /* fix colorspace information to sRGB for both output &
>>> capture */
>>> +     pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
>>> +     pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_601;
>>> +     pix_mp->xfer_func = V4L2_XFER_FUNC_SRGB;
>>> +     pix_mp->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>
>> So YUV formats are expected to be full range as well? Both when
>> encoding
>> and decoding?
> 
> I set the colorspace information like that based on this comment:
> 	/*
> 	 * Effectively shorthand for V4L2_COLORSPACE_SRGB,
> V4L2_YCBCR_ENC_601
> 	 * and V4L2_QUANTIZATION_FULL_RANGE. To be used for (Motion-
> )JPEG.
> 	 */
> 	V4L2_COLORSPACE_JPEG          = 7,
> 

Inside a JPEG the YUV quantization is using full range. But when you
*decode* a JPEG the YUV quantization in the raw decoded image is
normally limited range again (the default for YUV).

It depends on what this decoder does: most will decode to limited
range YUV, some decode to full range YUV (in which case this code would be
correct), and some support both.

In the latter case you want to support the V4L2_PIX_FMT_FLAG_SET_CSC
flag:

https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/pixfmt-v4l2.html#c.v4l2_pix_format

That would allow userspace to specify the desired quantization range.

Regards,

	Hans

> Also, I looked at mtk_jpeg_set_default_params for example.
> Let me know if you have a different suggestion.
> 
> Thanks,
> Mirela
