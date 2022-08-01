Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F755865BF
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 09:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiHAHib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 03:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiHAHiS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 03:38:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7D33AE4F
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 00:38:12 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 834992F3;
        Mon,  1 Aug 2022 09:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659339490;
        bh=rQZ4QTP5aFCtOtmXSg05jC9Fc5EW1vWiiKHHBDcfXFc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=p87MxBlm4tG5TgiktVATDIBJPbU1Lh/JHh/7nkUW+aOG1ZOUI4SCxN4BiUCPc0vxF
         BYjBx02xSGaWglH2HWE3hSK7jfcWrtumGl5UPt+Fw7mohdI5mQYG1TViOlnGDBZBhV
         Iicyq9Z+mKam1HpiWxJkHj1AnrBkmb56YtR5sGS8=
Message-ID: <b36d1383-f90c-4d52-cfec-d47c631958cf@ideasonboard.com>
Date:   Mon, 1 Aug 2022 10:38:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 15/30] media: subdev: add v4l2_subdev_set_routing
 helper()
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-16-tomi.valkeinen@ideasonboard.com>
 <Yud5w0xS/zv3auYR@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yud5w0xS/zv3auYR@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/08/2022 09:59, Sakari Ailus wrote:
> Moi,
> 
> On Wed, Jul 27, 2022 at 01:36:24PM +0300, Tomi Valkeinen wrote:
>> Add a helper function to set the subdev routing. The helper can be used
>> from subdev driver's set_routing op to store the routing table.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 27 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 16 ++++++++++++++++
>>   2 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index befd00ebf381..0b841cf74c74 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1176,6 +1176,33 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>>   
>> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>> +			    struct v4l2_subdev_state *state,
>> +			    struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct v4l2_subdev_krouting *dst = &state->routing;
>> +	const struct v4l2_subdev_krouting *src = routing;
>> +
>> +	lockdep_assert_held(state->lock);
>> +
>> +	kfree(dst->routes);
>> +	dst->routes = NULL;
>> +	dst->num_routes = 0;
> 
> Shouldn't you keep the old routing around until memory allocation (and
> anything else that can fail) has succeeded?

Indeed, good catch! I think v4l2_subdev_init_stream_configs() also needs 
improving.

  Tomi
