Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E320889D6D
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbfHLL55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:57:57 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55293 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728168AbfHLL55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:57:57 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x8xShQXe9ur8Tx8xWhiCxs; Mon, 12 Aug 2019 13:57:54 +0200
Subject: Re: [PATCH v4 04/11] media: uapi: h264: Add the concept of start code
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
References: <20190808103432.12062-1-ezequiel@collabora.com>
 <20190808103432.12062-5-ezequiel@collabora.com>
 <a729d241-6550-c23a-4f75-f106ab1c7ff9@xs4all.nl>
 <95b8f8f8d5d4f6394cfd5858a29d507b7e77be2f.camel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c4adc667-590b-438d-f8ef-ebcc7eee6004@xs4all.nl>
Date:   Mon, 12 Aug 2019 13:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <95b8f8f8d5d4f6394cfd5858a29d507b7e77be2f.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCk8vclEi7DhOmsRf+mZqZE5k2wrBfPOCz9ZkKbXijWxmyESvKbELCeBx3YAl2BMJh0GwDs3EWsX2hNziHOkMWo6/AiLopGEzckfU9nU/3sra/7MO317
 T1CjTxi4CMhuhSB/tzD967aiTEsORkz/2UW4oQrcGJrhMXyhD30cWT7FOSYx+X0Nmx6JKFOEEFFG9UR04mWCJ8JERQ87t7PjreqnbzHm/PTIkmSeQblmp9TV
 YjhoWo9MGyXY4fYBA/OuiLECfbFmrTMMZz9W0vUui3eGosqkkmn20AIQCXpCuEzX48Su36t27U7dF5M41l+VVgjYV09k7E3UEE+soFTmDqAsFNYd+khlPX/P
 a+Z5TBGubRLAjaOOepXXAAz/VLSdLzaWwaStI8dHMmG6J0bdsTac5ZQWKO4Ki8Ec9oM0Eg6HK4DfdZpSDcc4ZQH5PNJtTl/pr7MSfs5ZWv3DXBVASWP1y1UC
 O8gq15WQBPVntEqDdXHowpDTXAmgVWKXJejz7uEAYTFJjx8L/thjy86fipyuYwvlrJ/ChAqNLgK9QmImIFC2oPxsN2a9zNbzqyy/eYFHU9sfQisBzNh1IbKd
 z44+GZLPCUfdmk5JKGwaAn+MEPVx75Ax+Ys1KLkkB8Me+kanHSd8p+AKN9ZpEtYdBUk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/12/19 1:56 PM, Ezequiel Garcia wrote:
> On Mon, 2019-08-12 at 12:11 +0200, Hans Verkuil wrote:
>> On 8/8/19 12:34 PM, Ezequiel Garcia wrote:
>>> Stateless decoders have different expectations about the
>>> start code that is prepended on H264 slices. Add a
>>> menu control to express the supported start code types
>>> (including no start code).
>>>
>>> Drivers are allowed to support only one start code type,
>>> but they can support both too.
>>>
>>> Note that this is independent of the H264 decoding mode,
>>> which specifies the granularity of the decoding operations.
>>> Either in frame-based or slice-based mode, this new control
>>> will allow to define the start code expected on H264 slices.
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> ---
>>> Changes in v4:
>>> * New patch.
>>> ---
>>>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 31 +++++++++++++++++++
>>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++++
>>>  include/media/h264-ctrls.h                    |  6 ++++
>>>  3 files changed, 46 insertions(+)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> index ea0455957149..94fd3a9b8b9e 100644
>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> @@ -2062,6 +2062,37 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>          The OUTPUT buffer should contain all slices needed to decode the
>>>          frame/field.
>>>  
>>> +``V4L2_CID_MPEG_VIDEO_H264_STARTCODE (enum)``
>>> +    Specifies the H264 slice start code expected for each slice.
>>> +    This control shall e used to complement V4L2_PIX_FMT_H264_SLICE
>>
>> e -> be
>>
>>> +    pixel format. Drivers may expose a single or multiple
>>> +    start codes, depending on what they can support.
>>> +
>>> +    .. note::
>>> +
>>> +       This menu control is not yet part of the public kernel API and
>>> +       it is expected to change.
>>> +
>>> +.. c:type:: v4l2_mpeg_video_h264_startcode
>>> +
>>> +.. cssclass:: longtable
>>> +
>>> +.. flat-table::
>>> +    :header-rows:  0
>>> +    :stub-columns: 0
>>> +    :widths:       1 1 2
>>> +
>>> +    * - ``V4L2_MPEG_VIDEO_H264_NO_STARTCODE``
>>> +      - 0
>>> +      - Selecting this value specifies that H264 slices are passed
>>> +        to the driver without any start code.
>>> +        Bla.
>>
>> Bla?
>>
> 
> Well, despite how many times I reviewed this doc, it seems
> this slipped through :-(
> 
>>> +    * - ``V4L2_MPEG_VIDEO_H264_ANNEX_B_STARTCODE``
>>> +      - 1
>>> +      - Selecting this value specifies that H264 slices are expected
>>> +        to be prefixed by Annex B start codes. According to :ref:`h264`
>>> +        valid start codes can be 3-bytes 0x000001, or 4-bytes 0x00000001.
>>> +
>>
>> I had the impression that it is more common to require startcodes. If that's
>> indeed the case, shouldn't this have value 0 instead of 1?
>> 1?
>>
> 
> I'm not sure this is indeed the case.
> 
> For instance, VA-API accelerators work on H264 slices that are not
> prepended by the NALU start code.
> 
> I'm fine flipping the values, but at this point, with only cedrus and hantro,
> there's doesn't seem to be a "natural" choice.

OK, let's keep this as-is then.

Regards,

	Hans

> 
> Thanks,
> Ezequiel
> 

