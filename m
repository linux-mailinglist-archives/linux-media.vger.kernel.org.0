Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC81B333CBD
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhCJMku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:40:50 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37979 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229660AbhCJMkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:40:23 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Jy8PlGJjXOruFJy8SlX6Ml; Wed, 10 Mar 2021 13:40:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615380022; bh=ML0PTd5yfAjDle9rkop5cak2Psdw0crTmncab3+tesM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cQRUWvpgQ9HE6dDX/4olQd54qTWnDyv7zgsAkXb/qAxM1tac3j2266gZlG6vDkQqQ
         6kTH0jqMQDOIxCNloJIb3dWVbVzFIPoP5euV4FoLK4I7w8vJ4MHe+sHbCgJf7uolxG
         C5b45EOuthutUH2cDATyDR8hcQE09iAeP8EeXInaslnk9fQbqmeJl3H5Pcxx5o+dIu
         k/jJ2ECmwCY9WikR2ap8alzSkzdhkb6cXMzt8JJz/ynJeQKDwnofmIJcfYOnSntEXN
         LbYWhKFK0Y75JOMiWvmOQjW1C68hq307je7sH0b4GmxTTWn+/b+QaedSXgeYOdnLJK
         NPPvlcmqn7HKA==
Subject: Re: [EXT] Re: [PATCH v7 3/9] media: imx-jpeg: Add V4L2 driver for
 i.MX8 JPEG Encoder/Decoder
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
 <20210111192822.12178-4-mirela.rabulea@oss.nxp.com>
 <bec844f0-692f-de1e-a52d-a836ff792ef6@xs4all.nl>
 <3518c6c773b2bbd2cf818c1cf3109a9fa06720f7.camel@nxp.com>
 <4f03ecbf-2997-6c56-92c9-16f9e1f0f574@xs4all.nl>
 <72006a57d2501cf85da181d67ed4727f12528eb9.camel@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <193d220b-8086-d968-9038-e4c435df0549@xs4all.nl>
Date:   Wed, 10 Mar 2021 13:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <72006a57d2501cf85da181d67ed4727f12528eb9.camel@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHVKcypLfNlFXE+CU6IxdbLTXl52x/AA3SIyGjunlg5MKLBULVdzdf7QQKVTgYewjJaX95befGcHMiwaySDJzRxEbTZJXil/4V3JywmH6yejKSZyhNzs
 j0A9bFYihIPFbQjxk2flplFYzsvA3YYb8SPdJXNfsuL8cDi/gM7OI5+/Cj1ZMbtMTQA+H8yj8zCLpRxGkATr16u75qcyAOFMt8sj6HzujaG79rqtGEpqyV4a
 a/OFb/6i7XmasDKx9lvy8EvcSP6hiiU5kZ1sV/BTdbKFC3l4k9wSNEmHG6M5Owy+eL5V4LxQudCjC1knOsYaClihyopO8a3n3WuXGa8ZJTONAlgUVi5bZSSd
 SzHiMU8o/Ow/eFlfpHigDP9gpmy+zPupYBO1+qGXUKYfLvd15XL9h+jbA8uPQCDSiOOoml71K6zqREx1MvtSQeJs4DKIjwYcaTLoqF5yUXZ/qD3rCDikIbGw
 296MNfTUPKDtr7TypeVRzM8um923Lz08z0FH0AEbUvMveItsLxUj/QdxKPZiGBjwLWh1L5uYVcf5g76v9suwqrWEZyaBS/QPBSfwS32JM5Vi7jZCBnjiEABw
 zBl+ri/g7d/LsgXe7wh3Cs67VF03eZePO7K7DgROegleU9er30NYJlz3cgrre2ioLzydKz5IzaFpmCp0SbHS+peSbqLY0yIWyGBFdZyZIpQpS4HxuXUTCCwR
 GB4Gl47S60iTyhg19L/wSXdE92lK8eHlAe8Oh7YTifqhGZZxZ4HRmgimLX8gVTqFmmbUC385WnAMenTcJX02p3mGFH3Ft9KZ6SOiC8WQSuEWLJnLf89yN8MR
 JjrsqF/TPbJkdWAaXo2bqAAHmyT/g1uN+AyG3fZWS4KttTvr+KdSIU6shNE5eTxbWHF5rCk33PdfXSolAPk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/03/2021 13:33, Mirela Rabulea wrote:
> Hi Hans,
> 
> On Thu, 2021-03-04 at 14:03 +0100, Hans Verkuil wrote:
>> Caution: EXT Email
>>
>> On 22/02/2021 20:09, Mirela Rabulea wrote:
>>> Hi Hans,
>>> appologies for my late response, please see below 2 comments.
>>
>> Replies below:
>>
>>>
>>> On Tue, 2021-01-19 at 11:31 +0100, Hans Verkuil wrote:
>>>> Caution: EXT Email
>>>>
>>>> On 11/01/2021 20:28, Mirela Rabulea wrote:
>>>>> From: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>>>
>>>>> V4L2 driver for the JPEG encoder/decoder from i.MX8QXP/i.MX8QM
>>>>> application
>>>>> processors.
>>>>> The multi-planar buffers API is used.
>>>>>
>>>>> Baseline and extended sequential jpeg decoding is supported.
>>>>> Progressive jpeg decoding is not supported by the IP.
>>>>> Supports encode and decode of various formats:
>>>>>      YUV444, YUV422, YUV420, RGB, ARGB, Gray
>>>>> YUV420 is the only multi-planar format supported.
>>>>> Minimum resolution is 64 x 64, maximum 8192 x 8192.
>>>>> The alignment requirements for the resolution depend on the
>>>>> format,
>>>>> multiple of 16 resolutions should work for all formats.
>>>>>
>>>>> v4l2-compliance tests are passing, including the
>>>>> streaming tests, "v4l2-compliance -s"
>>>>>
>>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>>> ---
>>>>> Changes in v7:
>>>>>   Add print_mxc_buf() to replace print_buf_preview() and
>>>>> print_nbuf_to_eoi(),
>>>>>   and inside, use the print_hex_dump() from printk.h, also,
>>>>> print
>>>>> all the planes.
>>>>>
>>>>>  drivers/media/platform/Kconfig                |    2 +
>>>>>  drivers/media/platform/Makefile               |    1 +
>>>>>  drivers/media/platform/imx-jpeg/Kconfig       |   10 +
>>>>>  drivers/media/platform/imx-jpeg/Makefile      |    3 +
>>>>>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c |  168 ++
>>>>>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h |  140 +
>>>>>  drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2289
>>>>> +++++++++++++++++
>>>>>  drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  184 ++
>>>>>  8 files changed, 2797 insertions(+)
>>>>>  create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
>>>>>  create mode 100644 drivers/media/platform/imx-jpeg/Makefile
>>>>>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-
>>>>> hw.c
>>>>>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-
>>>>> hw.h
>>>>>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
>>>>>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h
>>>>
>>>> One high-level comment: why introduce the driver in patch 3/9 and
>>>> then
>>>> change it again in 9/9? I would very much prefer to have just a
>>>> single
>>>> patch that adds this driver, i.e. merge patch 3 and 9 into a
>>>> single
>>>> patch.
>>>
>>> I can squash patch 9 into patch 3, but please note that patch 9
>>> depends
>>> on jpeg helper patches 6,7,8, so these patches will also have to
>>> move
>>> before patch 3. Let me know yout thought and I'll do this in v9, in
>>> v8
>>> version I only addressed the rest of your feedback and some more
>>> from
>>> Philipp.
>>
>> Yes, just move the jpeg helper to earlier in the patch series.
>>
>>>
>>>>
>>
>> <snip>
>>
>>>>> +     /* fix colorspace information to sRGB for both output &
>>>>> capture */
>>>>> +     pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
>>>>> +     pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_601;
>>>>> +     pix_mp->xfer_func = V4L2_XFER_FUNC_SRGB;
>>>>> +     pix_mp->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>
>>>> So YUV formats are expected to be full range as well? Both when
>>>> encoding
>>>> and decoding?
>>>
>>> I set the colorspace information like that based on this comment:
>>>       /*
>>>        * Effectively shorthand for V4L2_COLORSPACE_SRGB,
>>> V4L2_YCBCR_ENC_601
>>>        * and V4L2_QUANTIZATION_FULL_RANGE. To be used for (Motion-
>>> )JPEG.
>>>        */
>>>       V4L2_COLORSPACE_JPEG          = 7,
>>>
>>
>> Inside a JPEG the YUV quantization is using full range. But when you
>> *decode* a JPEG the YUV quantization in the raw decoded image is
>> normally limited range again (the default for YUV).
>>
>> It depends on what this decoder does: most will decode to limited
>> range YUV, some decode to full range YUV (in which case this code
>> would be
>> correct), and some support both.
> 
> Experimentally, I saw the decoder outputs full-range values, but I was
> not sure about limited-range support, so I asked our IP owner, and I
> got this answer:
> "The decoder does not alter the range of the data in any way. 
> It outputs the same full or limited range data that was given to the
> encoder."
> 
> So, surely our encoder/decoder cannot change the range of the samples,
> but it could process both full or half range.
> I was thinking about a possibility to allow a half-range streams
> scenario (half range raw format -> encoder -> jpeg with half range???
> -> decoder -> half range raw format).
> That could be achieved by allowing user to choose (specify) the
> quantization for the output stream, and the driver would set the same
> for the capture stream, but this would result in a JPEG with half range
> for the capture stream.
> So, you mentioned inside JPEG the YUV quantization is using full range,
> experience confirms it (I decoded a jpeg produced with gimp and one
> with ms-paint, and I saw full range values), and v4l2-compliance fails
> if the pixel format is JPEG and quantization is not full.
> I'm not sure if the standard allows half-range JPEG (it would be a
> subset of full-range, so theoretically possible).
> 
> So, I will just add a comment to clarify the mxc-jpeg driver will
> always use full-range.
> 
> The mxc-jpeg driver will not support CSC, therefor it is not setting
> V4L2_FMT_FLAG_CSC_COLORSPACE in v4l2_fmtdesc during enumeration.
> So, the application cannot request a specific colorspace for the
> capture stream. No change needed here.
> 
> Let me know if this sounds ok, and I'll send v9 with the added coment
> and the squash.

Yes, just add a comment that the JPEG codec always uses full range YUV
for the uncompressed frames.

Regards,

	Hans

> 
> Thanks,
> Mirela
> 
>>
>> In the latter case you want to support the V4L2_PIX_FMT_FLAG_SET_CSC
>> flag:
>>
>>
> 

