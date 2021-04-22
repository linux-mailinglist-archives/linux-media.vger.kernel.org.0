Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D338B36807D
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 14:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbhDVMbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 08:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbhDVMbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 08:31:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDDCC06174A
        for <linux-media@vger.kernel.org>; Thu, 22 Apr 2021 05:31:00 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BC663EE;
        Thu, 22 Apr 2021 14:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619094657;
        bh=GlRCdIrX66ry8eA05V/irzqi0udIgSQHSjA8jaBw+5A=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=I6yDYx3S0OzBFYrDycL9oEcQGV8H+/Unef5Fi4ucnekI7P9LCqxif1DEC0LtXo0D1
         Xo4J0UGf2+WJVHpAAFOcq/5mpAj4iEpGTqjy4V629RY0Yw8D0OFbX470v1loKOhdJ4
         /m67NZWKRfH3NYKXpTnU6PIRP13C5Vb8VasZGrjQ=
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-16-tomi.valkeinen@ideasonboard.com>
 <YHyHN2hWN1Hb3Gv1@pendragon.ideasonboard.com>
 <20210420115050.GO3@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 15/24] v4l: Add bus type to frame descriptors
Message-ID: <2f39d7b6-ccc4-1afb-d8b2-6e0d44a311b0@ideasonboard.com>
Date:   Thu, 22 Apr 2021 15:30:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420115050.GO3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 14:50, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Sun, Apr 18, 2021 at 10:23:35PM +0300, Laurent Pinchart wrote:
>> Hi Tomi and Sakari,
>>
>> Thank you for the patch.
>>
>> On Thu, Apr 15, 2021 at 04:04:41PM +0300, Tomi Valkeinen wrote:
>>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>
>>> Add the media bus type to the frame descriptor. CSI-2 specific
>>> information will be added in next patch to the frame descriptor.
>>
>> I'd squash the next patch with this one.
>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>
>>> - Make the bus type a named enum
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>   include/media/v4l2-subdev.h | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index d0e9a5bdb08b..85977abbea46 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -340,12 +340,21 @@ struct v4l2_mbus_frame_desc_entry {
>>>   
>>>   #define V4L2_FRAME_DESC_ENTRY_MAX	4
>>>   
>>> +enum v4l2_mbus_frame_desc_type {
>>> +	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
>>> +	V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL,
>>> +	V4L2_MBUS_FRAME_DESC_TYPE_CCP2,
>>> +	V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
>>> +};
>>
>> This should be documented. In particular, I have no idea what
>> V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM is. I also wonder if we shouldn't
>> drop CCP2 (at least for now), does anyone use that anymore ?
> 
> I guess we don't need one here, not now at least.
> 
> I agree on the documentation.

As it's the first one in the list, I think it really means "undefined", 
so that current users have a value there (I presume they initialize the 
struct to 0). Sakari?

  Tomi
