Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7AF14827
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 12:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfEFKGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 06:06:33 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58247 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726016AbfEFKGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 06:06:32 -0400
Received: from [IPv6:2001:983:e9a7:1:94cb:c5ca:b4e:5bdf] ([IPv6:2001:983:e9a7:1:94cb:c5ca:b4e:5bdf])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NaVxhMUTZNExlNaVyhxzdz; Mon, 06 May 2019 12:06:30 +0200
Subject: Re: [PATCH v6 01/13] dt-bindings: connector: analog: add tv norms
 property
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org
Cc:     laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh@kernel.org>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-2-m.felsch@pengutronix.de>
 <9989034f-4794-adba-d89c-8330bbf7b27f@xs4all.nl>
Message-ID: <03dfa20e-3f60-55e0-270d-d2f663ffe0ce@xs4all.nl>
Date:   Mon, 6 May 2019 12:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9989034f-4794-adba-d89c-8330bbf7b27f@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB+ou2QOM9rA4k3NmuFJ6I++LRiQuIGAZT8rJvMCeMnqLXOseEb//VlNNPkqV81w/BLBFNmiCsbm0PVySHN4B7xJMrocofHZI/bxo7sHd8Hmu/hQu3FC
 gBZdSFb6q6jtZ/PpJhslTiFpV5+KVlOD6pIH6hIEuPAUq+c3e4Ld8ip/24LPWansy7bQj6OiTTxqB0awn3wfWHLpQOSd0LP6qmYGlp6sXHWV2AxkpUHpuKGj
 JMuHiE4CfzAmsxDknGfvC+OGjFvjfLJWNw5tjJXaw1jMWEMj9SBEoEkmZn3raSGCSDjw22NAE2KvwiBcXMoY+eNRPQnPCIGbH5UOFbeF/i9GsRbfddW4A6Jg
 a9M2x+432pfeBDEGS3zBQEA4wqzpXeoImN+Bw2G0vCPJVPbQXiSnGErUnN7F69Lt7CZmEw82EFJV4XmtgVxIIydBbTOTPBwgw6mBwra2QxVZ2WSSTMRQ1lgr
 5a+wj4fG1g2cOTUjwYgIyCHNiEm7lUNaknZpILL+pwSlR59MVg5lVxKLAuO65mh2KeGIg4/fkgM/hK4TS2HH1jbWaPzwewBiNKrf223lf9PP5AcrknuV6IEZ
 jGhm+y0jYp5DKFR3lda57j9Oj4yZLZrN3deYHkSAEFmBMw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/6/19 12:01 PM, Hans Verkuil wrote:
> On 4/15/19 2:44 PM, Marco Felsch wrote:
>> Some connectors no matter if in- or output supports only a limited
>> range of tv norms. It doesn't matter if the hardware behind that
>> connector supports more than the listed formats since the users are
>> restriced by a label e.g. to plug only a camera into this connector
>> which uses the PAL format.
> 
> For S-Video and Composite connectors there are really just two formats
> to consider: 50 and 60 Hz. I.e. there is no difference between PAL
> and SECAM. Only for tuners/modulators does this matter.

Sorry, I'm wrong about that. SECAM does matter.

But I still recommend adding these two defines and in the bindings
examples you can do something like TVNORM_PAL | TVNORM_NTSC.

Regards,

	Hans

> 
> So it is a good idea to add TVNORM_525_60, TVNORM_625_50 to tvnorms.h.
> 
> In the various bindings examples I would recommend that you use
> TVNORM_525_60 or TVNORM_625_50 rather than e.g. PAL_M since that's what
> you would use in practice for Composite/S-Video.
> 
> Regards,
> 
> 	Hans
> 
>>
>> This patch adds the capability to describe such limitation within the
>> firmware. There are no format restrictions if the property isn't
>> present, so it's completely backward compatible.
>>
>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> [1] https://patchwork.kernel.org/cover/10794703/
>>
>> v6:
>> - tvnorms.h: use tabs instead of spaces
>> - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
>> - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
>>
>> v2-v4:
>> - nothing since the patch was squashed from series [1] into this
>>   series.
>>
>>  .../display/connector/analog-tv-connector.txt |  4 ++
>>  include/dt-bindings/media/tvnorms.h           | 56 +++++++++++++++++++
>>  2 files changed, 60 insertions(+)
>>  create mode 100644 include/dt-bindings/media/tvnorms.h
>>
>> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>> index 0c0970c210ab..346f8937a0b7 100644
>> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>> @@ -6,6 +6,9 @@ Required properties:
>>  
>>  Optional properties:
>>  - label: a symbolic name for the connector
>> +- tvnorms: limit the supported tv norms on a connector to the given ones else
>> +           all tv norms are allowed. Possible video standards are defined in
>> +           include/dt-bindings/media/tvnorms.h.
>>  
>>  Required nodes:
>>  - Video port for TV input
>> @@ -16,6 +19,7 @@ Example
>>  tv: connector {
>>  	compatible = "composite-video-connector";
>>  	label = "tv";
>> +	tvnorms = <(TVNORM_PAL_M | TVNORM_NTSC_M)>;
>>  
>>  	port {
>>  		tv_connector_in: endpoint {
>> diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
>> new file mode 100644
>> index 000000000000..058ab8414145
>> --- /dev/null
>> +++ b/include/dt-bindings/media/tvnorms.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
>> +/*
>> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
>> +#define _DT_BINDINGS_MEDIA_TVNORMS_H
>> +
>> +/* one bit for each */
>> +#define TVNORM_PAL_B		0x00000001
>> +#define TVNORM_PAL_B1		0x00000002
>> +#define TVNORM_PAL_G		0x00000004
>> +#define TVNORM_PAL_H		0x00000008
>> +#define TVNORM_PAL_I		0x00000010
>> +#define TVNORM_PAL_D		0x00000020
>> +#define TVNORM_PAL_D1		0x00000040
>> +#define TVNORM_PAL_K		0x00000080
>> +
>> +#define TVNORM_PAL		(TVNORM_PAL_B  | \
>> +				 TVNORM_PAL_B1 | \
>> +				 TVNORM_PAL_G  | \
>> +				 TVNORM_PAL_H  | \
>> +				 TVNORM_PAL_I  | \
>> +				 TVNORM_PAL_D  | \
>> +				 TVNORM_PAL_D1 | \
>> +				 TVNORM_PAL_K)
>> +
>> +#define TVNORM_PAL_M		0x00000100
>> +#define TVNORM_PAL_N		0x00000200
>> +#define TVNORM_PAL_Nc		0x00000400
>> +#define TVNORM_PAL_60		0x00000800
>> +
>> +#define TVNORM_NTSC_M		0x00001000	/* BTSC */
>> +#define TVNORM_NTSC_M_JP	0x00002000	/* EIA-J */
>> +#define TVNORM_NTSC_443		0x00004000
>> +#define TVNORM_NTSC_M_KR	0x00008000	/* FM A2 */
>> +
>> +#define TVNORM_SECAM_B		0x00010000
>> +#define TVNORM_SECAM_D		0x00020000
>> +#define TVNORM_SECAM_G		0x00040000
>> +#define TVNORM_SECAM_H		0x00080000
>> +#define TVNORM_SECAM_K		0x00100000
>> +#define TVNORM_SECAM_K1		0x00200000
>> +#define TVNORM_SECAM_L		0x00400000
>> +#define TVNORM_SECAM_LC		0x00800000
>> +
>> +#define TVNORM_SECAM		(TVNORM_SECAM_B  | \
>> +				 TVNORM_SECAM_D  | \
>> +				 TVNORM_SECAM_G  | \
>> +				 TVNORM_SECAM_H  | \
>> +				 TVNORM_SECAM_K  | \
>> +				 TVNORM_SECAM_K1 | \
>> +				 TVNORM_SECAM_L  | \
>> +				 TVNORM_SECAM_LC)
>> +
>> +#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */
>>
> 

