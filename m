Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39EAA4AD386
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 09:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349989AbiBHIdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 03:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350026AbiBHIdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 03:33:44 -0500
X-Greylist: delayed 58937 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 00:33:43 PST
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7771FC03FEC1
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 00:33:43 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2282E480;
        Tue,  8 Feb 2022 09:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644309221;
        bh=Zfwndmr3Sa9gVNg2mmhqTg4HdyGMVwB51jHcmpeisZk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=uYxiNLpoNLd23UaQ7Qk84UXmrGcAqB/FPSxjkFh7wJqHFX5gpNlaM93f4LV5/ox/h
         uQFLzK3CMiM44DHk5uPWop77el5IAiseII6t7v0cZhCCjtFJA6FLlpSYNLwKz1DAJo
         eTwcm3s/fmODq9wzYHV8w6bFlD87Tuj+ZQiC2r6Y=
Message-ID: <8fb94724-1620-4eed-a6ef-01c1ada37bc5@ideasonboard.com>
Date:   Tue, 8 Feb 2022 10:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 7/7] media: subdev: rename v4l2_subdev_pad_config.try_*
 fields
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
 <20220207161107.1166376-8-tomi.valkeinen@ideasonboard.com>
 <YgHYEZwjSuqVPWUk@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YgHYEZwjSuqVPWUk@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/02/2022 04:40, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Feb 07, 2022 at 06:11:07PM +0200, Tomi Valkeinen wrote:
>> struct v4l2_subdev_pad_config used to be relevant only for
>> V4L2_SUBDEV_FORMAT_TRY configuration, and thus the fields of the struct
>> were named, e.g. try_fmt.
>>
>> This struct is now used in struct v4l2_subdev_state, and thus can be
>> used in both try and active cases. Thus rename the fields and drop the
>> "try_" prefix.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/i2c/adv7183.c                   |  2 +-
>>   drivers/media/i2c/imx274.c                    | 12 ++++-----
>>   drivers/media/i2c/mt9m001.c                   |  2 +-
>>   drivers/media/i2c/mt9m111.c                   |  2 +-
>>   drivers/media/i2c/mt9t112.c                   |  2 +-
>>   drivers/media/i2c/mt9v011.c                   |  2 +-
>>   drivers/media/i2c/mt9v111.c                   |  4 +--
>>   drivers/media/i2c/ov2640.c                    |  2 +-
>>   drivers/media/i2c/ov6650.c                    | 18 ++++++-------
>>   drivers/media/i2c/ov772x.c                    |  2 +-
>>   drivers/media/i2c/ov9640.c                    |  2 +-
>>   drivers/media/i2c/rj54n1cb0c.c                |  2 +-
>>   drivers/media/i2c/saa6752hs.c                 |  2 +-
>>   drivers/media/i2c/sr030pc30.c                 |  2 +-
>>   drivers/media/i2c/tw9910.c                    |  2 +-
>>   drivers/media/i2c/vs6624.c                    |  2 +-
>>   drivers/media/platform/atmel/atmel-isc-base.c |  8 +++---
>>   drivers/media/platform/atmel/atmel-isi.c      |  8 +++---
> 
> Would it be possible to move those drivers to use the
> v4l2_subdev_get_try_*() helpers instead of accessing the fields directly
> ? It doesn't necessarily need to be done as part of this series, but
> after removing the try_ prefix from the fields it will be more difficult
> to identify the offending drivers.
> 
> In a separate patch (not part of this series) we should also rename the
> v4l2_subdev_get_try_*() functions to v4l2_subdev_state_get_*().

I _knew_ I should not have added this patch, as these only lead to 
"could you also..." ;).

Yes, I think it makes sense to use the helpers. And kernel test robot 
tells me that I forgot about the staging/

I think I will just drop this one, and go with the helper version 
directly. Or rather, first change drivers to use the helper, and then 
change the fields.

  Tomi
