Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 323C26E87FF
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 04:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjDTCep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 22:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDTCeo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 22:34:44 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D93949C6
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 19:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681958083; x=1713494083;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=DUYZPRabWpm2NmpfH6KzLXWs6nHGYEUAe1Tf9yJjTJA=;
  b=SGv8MXI8MeXZQcYMt3EX0tZORi+BOdLDSH38/wAyzSkJtKWj2v4P9gnM
   YyLlugkyNwaHM8n0npG8pKkSZSEa+hkdu3AzQUAsNKXJbz1czaO0Wm3Tw
   ILv9yni+Ut5dR77sMpXR0Xy0lvuqxr16QvJ6xo6d1MdYoMppZd9f3dwBt
   OLSaymCQKwAtxCpfyNZ5llvVycnTgbfX+hf2qq1/UE3U+X1RQZ228EUYN
   lqJtU8gaMYCibrdC/pKpZFhif04fgBZ4vnbzdwMPJDQW7+qtB9jGMPt5D
   YYT6BQGaPG/42PV+IJvEu0CiIKYc/q8cC0XawlNlId8XW8hjHEW8dllVD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325225433"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="325225433"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 19:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="641981375"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="641981375"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga003.jf.intel.com with ESMTP; 19 Apr 2023 19:34:21 -0700
Subject: Re: [PATCH] media: i2c: add ov01a10 image sensor driver
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <1675941758-21433-1-git-send-email-bingbu.cao@intel.com>
 <Y+TvvbfRSGUNKBCf@kekkonen.localdomain>
 <793aa7a4-0b8b-dc55-2d91-9aa58e6735fd@linux.intel.com>
 <ZDahyjzMD/LvOjlG@kekkonen.localdomain>
 <caac8f63-1506-1e84-87fc-4556c2f7e369@linux.intel.com>
 <ZD+geUBBvqHQ1Ssy@kekkonen.localdomain>
 <1d85b70c-a896-87b9-62a4-5161d52b1ab0@ideasonboard.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <016a07bb-78ff-da80-d7b6-cc6db41aaf5d@linux.intel.com>
Date:   Thu, 20 Apr 2023 10:33:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1d85b70c-a896-87b9-62a4-5161d52b1ab0@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi and Sakari,

On 4/19/23 4:21 PM, Tomi Valkeinen wrote:
> On 19/04/2023 11:04, Sakari Ailus wrote:
>> Hi Bingbu,
>>
>> On Wed, Apr 19, 2023 at 03:44:25PM +0800, Bingbu Cao wrote:
>>> Sakari,
>>>
>>> On 4/12/23 8:19 PM, Sakari Ailus wrote:
>>>> Hi Bingbu,
>>>>
>>>> On Wed, Apr 12, 2023 at 07:40:19PM +0800, Bingbu Cao wrote:
>>>>>>> +static int ov01a10_set_format(struct v4l2_subdev *sd,
>>>>>>> +                  struct v4l2_subdev_state *sd_state,
>>>>>>> +                  struct v4l2_subdev_format *fmt)
>>>>>>> +{
>>>>>>> +    struct ov01a10 *ov01a10 = to_ov01a10(sd);
>>>>>>> +    const struct ov01a10_mode *mode;
>>>>>>> +    s32 vblank_def, h_blank;
>>>>>>> +
>>>>>>> +    mode = v4l2_find_nearest_size(supported_modes,
>>>>>>> +                      ARRAY_SIZE(supported_modes), width,
>>>>>>> +                      height, fmt->format.width,
>>>>>>> +                      fmt->format.height);
>>>>>>> +
>>>>>>> +    mutex_lock(&ov01a10->mutex);
>>>>>>> +    ov01a10_update_pad_format(mode, &fmt->format);
>>>>>>
>>>>>> Could you switch to the sub-device state? That is now the preferred way to
>>>>>> serialise access to e.g. the format.
>>>>>>
>>>>>> See e.g.
>>>>>> <URL:https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/tree/drivers/media/i2c/ov1063x.c?h=streams/work-v16>.
>>>>>>
>>>>>> The control handler's mutex doubles as a sub-device state mutex.
>>>>>
>>>>> Is it fine to use v4l2_subdev_get_fmt()? Or will it be deprecated soon?
>>>>
>>>> Sure, it's fine to use it.
>>>>
>>>
>>> I tried to use the v4l2_subdev_state_get_stream_format() in set_fmt, but I
>>> see that the pad format of camera sensor was missing in media information.
>>>
>>> - entity 105: ov01a10 3-0036 (1 pad, 1 link)
>>>                type V4L2 subdev subtype Sensor flags 0
>>>                device node name /dev/v4l-subdev8
>>>     pad0: Source
>>>         -> "Intel IPU6 CSI2 2":0 [ENABLED]
>>>
>>> And the link validation cannot work as expected, is there something
>>> missing? My kernel head is Linux 6.3-rc2.
>>>
>>> static int ov01a10_set_format(struct v4l2_subdev *sd,
>>>                   struct v4l2_subdev_state *sd_state,
>>>                   struct v4l2_subdev_format *fmt)
>>> {
>>> ...
>>>     format = v4l2_subdev_state_get_stream_format(sd_state, fmt->pad,
>>>                              fmt->stream);
>>>     if (!format) {
>>>         dev_err(&client->dev, "Failed to get stream format\n");
>>>         return -EINVAL;
>>>     }
>>>
>>> ...
>>>     ov01a10_update_pad_format(mode, &fmt->format);
>>>     *format = fmt->format;
>>>
>>>     return 0;
>>> }
>>
>> v4l2_subdev_state_get_stream_format() will access streams and I presume you
>> won't have any in this case (not even streams support right now as it's a
>> sensor driver with a single sub-device).
>>
> 
> This perhaps gives a better example on how to migrate to subdev state:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/i2c/imx290.c?id=a2514b9a634ac0a2cfbc329822b8fb58ffe23a80

Got it, thank you!

> 
>  Tomi
> 

-- 
Best regards,
Bingbu Cao
