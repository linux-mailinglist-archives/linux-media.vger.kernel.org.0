Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26923475438
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 09:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236185AbhLOIX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 03:23:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236171AbhLOIX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 03:23:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEEAC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 00:23:27 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10E0D292;
        Wed, 15 Dec 2021 09:23:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639556605;
        bh=KCuUBMjiLsp6aZRMNIkjYFsijgto6wyYqR9toObGFFs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gx7FNUs8YRoaY4bQAaxJtkAVOYPtPSUfQu3qYyaWcHRhipDYzVdJFdAtLPKD5gd6T
         7YAW3GleuzX5fAkndpIVniql0ufMFscH16hzens0w0k2nWyX/vNK7Et1efFeUmxPvQ
         eMv//SF37CTyU/unxawmiIz6WSkKi6LkbcHq/Vhw=
Subject: Re: [PATCH v10 25/38] media: add V4L2_SUBDEV_FL_MULTIPLEXED
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-26-tomi.valkeinen@ideasonboard.com>
 <20211214084120.4sfzpwpw3pti5nwy@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <87a4a17f-a41f-9015-7df9-d086445306c8@ideasonboard.com>
Date:   Wed, 15 Dec 2021 10:23:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214084120.4sfzpwpw3pti5nwy@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/12/2021 10:41, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Tue, Nov 30, 2021 at 04:15:23PM +0200, Tomi Valkeinen wrote:
>> Add subdev flag V4L2_SUBDEV_FL_MULTIPLEXED. It is used to indicate that
>> the subdev supports the new API with multiplexed streams (routing,
>> stream configs).
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   include/media/v4l2-subdev.h | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index a82fc74f4646..45861bcdccf5 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -892,6 +892,17 @@ struct v4l2_subdev_internal_ops {
>>    * should set this flag.
>>    */
>>   #define V4L2_SUBDEV_FL_HAS_EVENTS		(1U << 3)
>> +/*
>> + * Set this flag if this subdev supports multiplexed streams. This means
>> + * that the driver supports routing and handles the stream parameter in its
>> + * v4l2_subdev_pad_ops handlers. More specifically, this means:
>> + *
>> + * - Centrally managed active state is enabled
>> + * - Legacy pad config is _not_ supported (state->pads)
> 
> Does this still apply after pad config has been replaced by try states ?

What do you mean?

If a subdev is V4L2_SUBDEV_FL_MULTIPLEXED, state->pads is NULL, so 
there's no legacy pad config available.

  Tomi
