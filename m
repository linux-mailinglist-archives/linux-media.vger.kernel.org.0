Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3AA710DF6
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 16:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241383AbjEYOGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 10:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241532AbjEYOGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 10:06:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52CB10C9
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:05:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CCB2645F4
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 14:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7DEC433EF;
        Thu, 25 May 2023 14:05:21 +0000 (UTC)
Message-ID: <1716ca05-d906-4535-8f5e-532596e7a5d8@xs4all.nl>
Date:   Thu, 25 May 2023 16:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 5/8] HACK: include/linux: Add client capabilities
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-6-tomi.valkeinen@ideasonboard.com>
 <20230424073237.GE4926@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230424073237.GE4926@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 24/04/2023 09:32, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Apr 21, 2023 at 03:44:25PM +0300, Tomi Valkeinen wrote:
>> Add client capabilities related hanges to include/linux/v4l2-subdev.h.
>> This should be dropped when the v4l-utils kernel headers are updated to
>> the version which contains client capabilities.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> The subdev client capabilities patch is now in the media tree, maybe you
> can sync the headers already ? The media tree master branch should get
> merged in v6.4-rc1 within two weeks.

I've just synced the headers for v4l-utils.

I think it is easiest if you post a v5, assuming everything that this series
needs is now merged in the kernel. I'll pick it up.

Regards,

	Hans

> 
>> ---
>>  include/linux/v4l2-subdev.h | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/include/linux/v4l2-subdev.h b/include/linux/v4l2-subdev.h
>> index 654d659d..4a195b68 100644
>> --- a/include/linux/v4l2-subdev.h
>> +++ b/include/linux/v4l2-subdev.h
>> @@ -233,6 +233,24 @@ struct v4l2_subdev_routing {
>>  	__u32 reserved[6];
>>  };
>>  
>> +/*
>> + * The client is aware of streams. Setting this flag enables the use of 'stream'
>> + * fields (referring to the stream number) with various ioctls. If this is not
>> + * set (which is the default), the 'stream' fields will be forced to 0 by the
>> + * kernel.
>> + */
>> + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
>> +
>> +/**
>> + * struct v4l2_subdev_client_capability - Capabilities of the client accessing
>> + *					  the subdev
>> + *
>> + * @capabilities: A bitmask of V4L2_SUBDEV_CLIENT_CAP_* flags.
>> + */
>> +struct v4l2_subdev_client_capability {
>> +	__u64 capabilities;
>> +};
>> +
>>  /* Backwards compatibility define --- to be removed */
>>  #define v4l2_subdev_edid v4l2_edid
>>  
>> @@ -250,6 +268,9 @@ struct v4l2_subdev_routing {
>>  #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
>>  #define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
>>  #define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
>> +#define VIDIOC_SUBDEV_G_CLIENT_CAP		_IOR('V',  101, struct v4l2_subdev_client_capability)
>> +#define VIDIOC_SUBDEV_S_CLIENT_CAP		_IOWR('V',  102, struct v4l2_subdev_client_capability)
>> +
>>  /* The following ioctls are identical to the ioctls in videodev2.h */
>>  #define VIDIOC_SUBDEV_G_STD			_IOR('V', 23, v4l2_std_id)
>>  #define VIDIOC_SUBDEV_S_STD			_IOW('V', 24, v4l2_std_id)
> 

