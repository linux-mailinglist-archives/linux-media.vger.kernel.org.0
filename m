Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E70B5F0A84
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 13:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiI3Lcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 07:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiI3Lb6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 07:31:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E62527B18
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 04:22:46 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE23C47C;
        Fri, 30 Sep 2022 13:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664536963;
        bh=AzC5EGxg1Nvq5SJ4Ye8WR1ZCXNy3i2FOS/PevPioNKw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=J7N9JXHdYBhbbEFJN2EU5bNNAZyzR9g/d1OjC5e2lsBgYcMNtgupLahV/hugsvMG6
         81Ja23TaJb6x+FHfFpzs7xB8Dmj3rexJeUecetWhrZuzO5VvtqqZCSWhUQe5CKgc1d
         2S04JI7axfdMp3QLKBk/VMNVm7lgStQW6Mr+im/M=
Message-ID: <28f60fbb-f994-b6c6-63ff-f78b7015861f@ideasonboard.com>
Date:   Fri, 30 Sep 2022 14:22:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 20/34] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-21-tomi.valkeinen@ideasonboard.com>
 <YzbNjzENgJ9PZsiJ@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YzbNjzENgJ9PZsiJ@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hei,

On 30/09/2022 14:05, Sakari Ailus wrote:

>> @@ -191,6 +192,55 @@ struct v4l2_subdev_capability {
>>   /* The v4l2 sub-device supports routing and multiplexed streams. */
>>   #define V4L2_SUBDEV_CAP_STREAMS			0x00000002
>>   
>> +/*
>> + * Is the route active? An active route will start when streaming is enabled
>> + * on a video node.
>> + */
>> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		_BITUL(0)
> 
> _BITUL() will produce an unsigned long. This isn't necessary.
> 
> Please use (1U << 0) instead. Same below.

Ok. I used BIT() originally, but that, of course, isn't available in 
userspace...

You might also have noticed that the next flag is bit 2, not bit 1. Bit 
1 was immutable route, which I dropped, but for the time being I kept 
the numbering to keep the ABI compatibility with my already compiled 
tools. I'll change that one to bit 1 in the next series, or if we decide 
to add a static flag, I'll add the static flag as bit 1.

  Tomi
