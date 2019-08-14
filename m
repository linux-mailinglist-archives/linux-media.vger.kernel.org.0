Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5528D467
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 15:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfHNNPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 09:15:18 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60541 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726263AbfHNNPS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 09:15:18 -0400
Received: from [IPv6:2001:420:44c1:2579:6c2e:a3d:2bd:ee96] ([IPv6:2001:420:44c1:2579:6c2e:a3d:2bd:ee96])
        by smtp-cloud7.xs4all.net with ESMTPA
        id xt7OhhLT3ur8Txt7ShoHAF; Wed, 14 Aug 2019 15:15:15 +0200
Subject: Re: [PATCHv2 08/12] pixfmt-compressed.rst: improve
 H264/HEVC/MPEG1+2/VP8+9 documentation
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-9-hverkuil-cisco@xs4all.nl>
 <20190814130958.GG11714@aptenodytes>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <be012461-2e44-948c-8334-c4f18ba8966e@xs4all.nl>
Date:   Wed, 14 Aug 2019 15:15:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190814130958.GG11714@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLN3LALD4puGMs5YqK/ID/L4iqFy7sTsRzDLz/B7y7HHZT+2EVY9+fGdKGUZVjrYcGSsbbVIELutztzChM+5Qz78TlFkmDR6HyNRsPSsLN/gRx/PGLK7
 F89FMRTehMkTcTlnlZZMz0cAiYtRzV11izXUlidCF4/p4ZmbR7PkfEQzgJTjjecObBUmjf4jDKsvDtLnsTN7uU3PB0PzHhgFE2dQIimoAlmWPbuA+K8xrLo8
 84K5+VzI3qZbUVueEW09cGSNIBRT2l0LGXMolGuZdRr72w6/EpYcMq66BLaxXzs0SpXwAYMuvGa33dVJYVqfcHdkRiKJ9NNbvmsfAcX2O/0kElnKPmkuNBux
 hToOTduJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/19 3:09 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
>> The existing documentation was incorrect and did not correspond
>> to how actual codec drivers implemented this.
>>
>> Update the documentation to explicitly specify what is actually
>> expected.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../media/uapi/v4l/pixfmt-compressed.rst      | 36 +++++++++++++++----
>>  1 file changed, 30 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
>> index f52a7b67023d..9bb4a172a660 100644
>> --- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
>> +++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
>> @@ -41,7 +41,12 @@ Compressed Formats
>>  
>>        - ``V4L2_PIX_FMT_H264``
>>        - 'H264'
>> -      - H264 video elementary stream with start codes.
>> +      - H264 Access Unit.
>> +	The decoder expects one Access Unit per buffer.
>> +	The encoder generates one Access Unit per buffer.
>> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
>> +	then the decoder has no requirements since it can parse all the
>> +	information from the raw bytestream.
> 
> Maybe it would be clearer to mention that "no requirements" concerns the
> lack of frame/field boundary requirement? Otherwise it feels a bit unclear
> what userspace is expected to do or not do depending on the flag.

Hmm, how about:

If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
then the decoder can start streaming at any point in the bytestream and
it can parse the Access Units by itself.

What do you think?

	Hans


> 
> Cheers,
> 
> Paul
> 
>>      * .. _V4L2-PIX-FMT-H264-NO-SC:
>>  
>>        - ``V4L2_PIX_FMT_H264_NO_SC``
>> @@ -86,12 +91,20 @@ Compressed Formats
>>  
>>        - ``V4L2_PIX_FMT_MPEG1``
>>        - 'MPG1'
>> -      - MPEG1 video elementary stream.
>> +      - MPEG1 Picture. Each buffer starts with a Picture header, followed
>> +	by other headers as needed and ending with the Picture data.
>> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
>> +	then the decoder has no requirements since it can parse all the
>> +	information from the raw bytestream.
>>      * .. _V4L2-PIX-FMT-MPEG2:
>>  
>>        - ``V4L2_PIX_FMT_MPEG2``
>>        - 'MPG2'
>> -      - MPEG2 video elementary stream.
>> +      - MPEG2 Picture. Each buffer starts with a Picture header, followed
>> +	by other headers as needed and ending with the Picture data.
>> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
>> +	then the decoder has no requirements since it can parse all the
>> +	information from the raw bytestream.
>>      * .. _V4L2-PIX-FMT-MPEG2-SLICE:
>>  
>>        - ``V4L2_PIX_FMT_MPEG2_SLICE``
>> @@ -132,7 +145,9 @@ Compressed Formats
>>  
>>        - ``V4L2_PIX_FMT_VP8``
>>        - 'VP80'
>> -      - VP8 video elementary stream.
>> +      - VP8 compressed video frame. The encoder generates one
>> +	compressed frame per buffer, and the decoder requires one
>> +	compressed frame per buffer.
>>      * .. _V4L2-PIX-FMT-VP8-FRAME:
>>  
>>        - ``V4L2_PIX_FMT_VP8_FRAME``
>> @@ -157,12 +172,19 @@ Compressed Formats
>>  
>>        - ``V4L2_PIX_FMT_VP9``
>>        - 'VP90'
>> -      - VP9 video elementary stream.
>> +      - VP9 compressed video frame. The encoder generates one
>> +	compressed frame per buffer, and the decoder requires one
>> +	compressed frame per buffer.
>>      * .. _V4L2-PIX-FMT-HEVC:
>>  
>>        - ``V4L2_PIX_FMT_HEVC``
>>        - 'HEVC'
>> -      - HEVC/H.265 video elementary stream.
>> +      - HEVC/H.265 Access Unit.
>> +	The decoder expects one Access Unit per buffer.
>> +	The encoder generates one Access Unit per buffer.
>> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
>> +	then the decoder has no	requirements since it can parse all the
>> +	information from the raw bytestream.
>>      * .. _V4L2-PIX-FMT-FWHT:
>>  
>>        - ``V4L2_PIX_FMT_FWHT``
>> @@ -170,6 +192,8 @@ Compressed Formats
>>        - Video elementary stream using a codec based on the Fast Walsh Hadamard
>>          Transform. This codec is implemented by the vicodec ('Virtual Codec')
>>  	driver. See the codec-fwht.h header for more details.
>> +	:ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
>> +	since the decoder can parse all the information from the raw bytestream.
>>      * .. _V4L2-PIX-FMT-FWHT-STATELESS:
>>  
>>        - ``V4L2_PIX_FMT_FWHT_STATELESS``
>> -- 
>> 2.20.1
>>
> 

