Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F07291F21
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 10:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfHSIlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 04:41:14 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:60721 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbfHSIlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 04:41:14 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id zdDwhLXdcDqPezdDzhnQCY; Mon, 19 Aug 2019 10:41:11 +0200
Subject: Re: [PATCH v7 01/13] dt-bindings: connector: analog: add tv norms
 property
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh@kernel.org>, robh+dt@kernel.org,
        jacopo+renesas@jmondi.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
 <20190815115747.24018-2-m.felsch@pengutronix.de>
 <76aeaa4e-4a29-5abe-1af6-fc82958e9530@xs4all.nl>
 <20190819080904.ch3e3by5seha5ca7@pengutronix.de>
 <20190819081850.e3v7yyjx7onpp3al@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cfad1a13-e854-8f90-26b6-931484d184e9@xs4all.nl>
Date:   Mon, 19 Aug 2019 10:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190819081850.e3v7yyjx7onpp3al@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNqmGevYGaiTwsdmXd9stcQ+N3PE3crP/fyi3oavX68eb/TPJlkKSHGO4czjIL6tDvn+09jShTWZrxslufvfEXX755B14x9qC2JiFO5TQvPzwpkQ0T6B
 F72k3rmnH2iSFnUBmvqmo6Qi/gtIB8ZhLjYUQLRfAhTth1j3W/aK573EiXvSXh1SHEdxB91UKAa2FM/84aR8RPuEb3qQuaLvMkpGJkkVokJMTrHF2sYfWtLW
 faaDFY9u24EcU4nb+xhnHHmnH7wtOY9UeNScFm8plw2XdOPbSU9084KYfVrIPVBBTQytAdLWdu5ti0WpE1VX1HdIfgTI6e6wApWK1cOlX/WS9B7I0rfRiqGD
 AfPgw2vVqCm1PN2wvKUZGaVeR0X8FZ1LQo5PZaBIbWuL/K8Jjc8LqlaEWo8yaY8hM7SOGNK8YltTedHC6wILQYRuFvmwwlY9EPY96juTgu4kgqrDmps3Qv/i
 FuOdSmxtbN9Q/ZgrN/JGqfiCWQlg+G3fK3IBUdkC7VYby/lg/ehjaKa39+Xd4qunAooFbhYd4vlsn5CC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 10:18 AM, Marco Felsch wrote:
> Hi,
> 
> On 19-08-19 10:09, Marco Felsch wrote:
>> Hi Hans,
>>
>> On 19-08-16 13:11, Hans Verkuil wrote:
>>> On 8/15/19 1:57 PM, Marco Felsch wrote:
>>>> Some connectors no matter if in- or output supports only a limited
>>>> range of tv norms. It doesn't matter if the hardware behind that
>>>> connector supports more than the listed formats since the users are
>>>> restriced by a label e.g. to plug only a camera into this connector
>>>> which uses the PAL format.
>>>>
>>>> This patch adds the capability to describe such limitation within the
>>>> firmware. There are no format restrictions if the property isn't
>>>> present, so it's completely backward compatible.
>>>>
>>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>> ---
>>>> [1] https://patchwork.kernel.org/cover/10794703/
>>>>
>>>> v7:
>>>> I kept Robs r b tag because I only changed the example and extended
>>>> TVNORM_* macros.
>>>>
>>>> - fix some style issues
>>>> - add TVNORM_NTSC, TVNORM_525_60 and TVNORM_625_50
>>>>
>>>> v6:
>>>> - tvnorms.h: use tabs instead of spaces
>>>> - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
>>>> - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
>>>>
>>>> v2-v4:
>>>> - nothing since the patch was squashed from series [1] into this
>>>>   series.
>>>> ---
>>>>  .../display/connector/analog-tv-connector.txt |  4 ++
>>>>  include/dt-bindings/media/tvnorms.h           | 72 +++++++++++++++++++
>>>>  2 files changed, 76 insertions(+)
>>>>  create mode 100644 include/dt-bindings/media/tvnorms.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>>>> index 0c0970c210ab..434e8aa0398b 100644
>>>> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>>>> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>>>> @@ -6,6 +6,9 @@ Required properties:
>>>>  
>>>>  Optional properties:
>>>>  - label: a symbolic name for the connector
>>>> +- tvnorms: limit the supported tv norms on a connector to the given ones else
>>>
>>> tv -> TV
>>>
>>>> +           all tv norms are allowed. Possible video standards are defined in
>>>
>>> tv -> TV
>>
>> Changed both thanks.
>>
>>> And a more high-level question: I think tvnorm is a very vague name. It's a term
>>> used in media, but what does 'norm' mean anyway? 'tv_standards' or 'video_standards'
>>> would be a lot more descriptive.
>>
>> I'm with you *_standards would be more descriptive. Now the question is:
>> is it a video or a tv standard? Wikipedia says that SECAM, PAL, NTSC is
>> a television standard. So I prefer the 'tv_standards' or better the
>> 'tv-standards' approach.
> 
> While on it I noticed that the v4l_std_id is u64. Should we add the
> support for u64 here too?

No need. SDTV standards are frozen (i.e. no new standards will ever be added),
so everything fits nicely in 32 bits.

Regards,

	Hans

> 
> Regards,
>   Marco
> 
>>> 'tvnorm' is, I think, a term used only internally in the media subsystem for no
>>> clear reason. In the V4L2 spec it talks about 'video standard'.
>>>
>>> Sorry for being so late with raising this issue.
>>>
>>>> +           include/dt-bindings/media/tvnorms.h.
>>>>  
>>>>  Required nodes:
>>>>  - Video port for TV input
>>>> @@ -16,6 +19,7 @@ Example
>>>>  tv: connector {
>>>>  	compatible = "composite-video-connector";
>>>>  	label = "tv";
>>>> +	tvnorms = <(TVNORM_PAL | TVNORM_NTSC)>;
>>>>  
>>>>  	port {
>>>>  		tv_connector_in: endpoint {
>>>> diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
>>>> new file mode 100644
>>>> index 000000000000..e1275673c4d6
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/media/tvnorms.h
>>>> @@ -0,0 +1,72 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
>>>> +/*
>>>> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
>>>> + */
>>>> +
>>>> +#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
>>>> +#define _DT_BINDINGS_MEDIA_TVNORMS_H
>>>> +
>>>> +/* One bit for each standard */
>>>
>>> I would add a comment here and in videodev2.h where you mention that
>>> the two headers should remain in sync.
>>
>> Yes, good point.
>>
>>>> +#define TVNORM_PAL_B		0x00000001
>>>> +#define TVNORM_PAL_B1		0x00000002
>>>> +#define TVNORM_PAL_G		0x00000004
>>>> +#define TVNORM_PAL_H		0x00000008
>>>> +#define TVNORM_PAL_I		0x00000010
>>>> +#define TVNORM_PAL_D		0x00000020
>>>> +#define TVNORM_PAL_D1		0x00000040
>>>> +#define TVNORM_PAL_K		0x00000080
>>>> +
>>>> +#define TVNORM_PAL		(TVNORM_PAL_B		| \
>>>> +				 TVNORM_PAL_B1		| \
>>>> +				 TVNORM_PAL_G		| \
>>>> +				 TVNORM_PAL_H		| \
>>>> +				 TVNORM_PAL_I		| \
>>>> +				 TVNORM_PAL_D		| \
>>>> +				 TVNORM_PAL_D1		| \
>>>> +				 TVNORM_PAL_K)
>>>> +
>>>> +#define TVNORM_PAL_M		0x00000100
>>>> +#define TVNORM_PAL_N		0x00000200
>>>> +#define TVNORM_PAL_Nc		0x00000400
>>>> +#define TVNORM_PAL_60		0x00000800
>>>> +
>>>> +#define TVNORM_NTSC_M		0x00001000	/* BTSC */
>>>> +#define TVNORM_NTSC_M_JP	0x00002000	/* EIA-J */
>>>> +#define TVNORM_NTSC_443		0x00004000
>>>> +#define TVNORM_NTSC_M_KR	0x00008000	/* FM A2 */
>>>> +
>>>> +#define TVNORM_NTSC		(TVNORM_NTSC_M		|\
>>>> +				 TVNORM_NTSC_M_JP	|\
>>>
>>> Add space before \
>>>
>>>> +				 TVNORM_NTSC_M_KR)
>>>> +
>>>> +#define TVNORM_SECAM_B		0x00010000
>>>> +#define TVNORM_SECAM_D		0x00020000
>>>> +#define TVNORM_SECAM_G		0x00040000
>>>> +#define TVNORM_SECAM_H		0x00080000
>>>> +#define TVNORM_SECAM_K		0x00100000
>>>> +#define TVNORM_SECAM_K1		0x00200000
>>>> +#define TVNORM_SECAM_L		0x00400000
>>>> +#define TVNORM_SECAM_LC		0x00800000
>>>> +
>>>> +#define TVNORM_SECAM		(TVNORM_SECAM_B		| \
>>>> +				 TVNORM_SECAM_D		| \
>>>> +				 TVNORM_SECAM_G		| \
>>>> +				 TVNORM_SECAM_H		| \
>>>> +				 TVNORM_SECAM_K		| \
>>>> +				 TVNORM_SECAM_K1	| \
>>>> +				 TVNORM_SECAM_L		| \
>>>> +				 TVNORM_SECAM_LC)
>>>> +
>>>> +/* Standards for Countries with 60Hz Line frequency */
>>>> +#define TVNORM_525_60		(TVNORM_PAL_M		| \
>>>> +				 TVNORM_PAL_60		| \
>>>> +				 TVNORM_NTSC		| \
>>>> +				 TVNORM_NTSC_443)
>>>> +
>>>> +/* Standards for Countries with 50Hz Line frequency */
>>>> +#define TVNORM_625_50		(TVNORM_PAL		|\
>>>> +				 TVNORM_PAL_N		|\
>>>> +				 TVNORM_PAL_Nc		|\
>>>
>>> Add space before \
>>
>> Both space errors fixed.
>>
>>>> +				 TVNORM_SECAM)
>>>> +
>>>> +#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */
>>>>
>>>
>>> I was also wondering if this header shouldn't be in include/dt-bindings/display/
>>> since the bindings are also described in 'display'.
>>
>> That's a good one and I really don't know which is the 'right' place for
>> it. Since the standard has nothing to do with a display I would keep it
>> within media. But the radeon [1] gpu uses the stds too. So I really
>> don't know which place is better.
>>
>> [1] drivers/gpu/drm/radeon/radeon_mode.h. 
>>
>> Regards,
>>   Marco
>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>
>> -- 
>> Pengutronix e.K.                           |                             |
>> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
>> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>>
>>
> 

