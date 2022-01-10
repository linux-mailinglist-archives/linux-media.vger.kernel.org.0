Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B73D489684
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 11:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244099AbiAJKin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 05:38:43 -0500
Received: from mxout02.lancloud.ru ([45.84.86.82]:41394 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244041AbiAJKh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 05:37:56 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 5C867233324C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 08/11] media: i2c: max9286: Define macros for all bits
 of register 0x15
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
CC:     <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        "Kieran Bingham" <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-9-laurent.pinchart+renesas@ideasonboard.com>
 <20220109103738.fqyehzvj4hgggu6w@uno.localdomain>
 <Ydtt+TsZ56qv8G27@pendragon.ideasonboard.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <4ef0af5a-36cd-fd40-73f0-3e5c746e7882@omp.ru>
Date:   Mon, 10 Jan 2022 13:37:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Ydtt+TsZ56qv8G27@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 1/10/22 2:21 AM, Laurent Pinchart wrote:

>>> Macros are easier to read than numerical values.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>  drivers/media/i2c/max9286.c | 27 ++++++++++++++++++---------
>>>  1 file changed, 18 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>>> index 24c2bf4fda53..4b69bd036ca6 100644
>>> --- a/drivers/media/i2c/max9286.c
>>> +++ b/drivers/media/i2c/max9286.c
[...]
>>> @@ -810,13 +815,17 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>>>  		}
>>>
>>>  		/*
>>> -		 * Enable CSI output, VC set according to link number.
>>> -		 * Bit 7 must be set (chip manual says it's 0 and reserved).
>>> +		 * Configure the CSI-2 output to line interleaved mode (W x (N
>>> +		 * x H), as opposed to the (N x W) x H mode that outputs the
>>> +		 * images stitched side-by-side) and enable it.
>>>  		 */
>>> -		max9286_write(priv, 0x15, 0x80 | MAX9286_VCTYPE |
>>> -			      MAX9286_CSIOUTEN | MAX9286_0X15_RESV);
>>> +		max9286_write(priv, 0x15, MAX9286_CSI_IMAGE_TYP | MAX9286_VCTYPE |
>>> +			      MAX9286_CSIOUTEN | MAX9286_EN_CCBSYB_CLK_STR |
>>> +			      MAX9286_EN_GPI_CCBSYB);
>>>  	} else {
>>> -		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
>>> +		max9286_write(priv, 0x15, MAX9286_VCTYPE |
>>> +			      MAX9286_EN_CCBSYB_CLK_STR |
>>> +			      MAX9286_EN_GPI_CCBSYB);
>>
>> Probably fits better on two lines only.
> 
> That would be over the 80 columns limit, which is a soft limit now, but
> still often requested by reviewers (including myself in quite a few
> cases :-)).

    The new limit is 100 columns, not 80. :-)

[...]

MBR, Sergey
