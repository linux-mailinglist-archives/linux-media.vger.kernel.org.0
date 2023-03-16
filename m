Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1DD36BC6F4
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 08:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjCPHUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 03:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjCPHUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 03:20:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B361514D
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 00:20:05 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB3CB7FA;
        Thu, 16 Mar 2023 08:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678951202;
        bh=MndRKOXHs0ZdENgc/f7q1jn+y23027YARDXNItAEayE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=EwEeEJ3mCOfuACpTOJrbY/aYSFNEH149XpTLcYdnxI8uEqA3OuI1CbmhPPIuKPvk6
         MAfewMcafMyBIfMJf9J/Qi8BJp459jc4l1ks6TJkwmJvuGwtqutee+YD5c8CTyQLW0
         J7Q7h/+IgI8WmN5P4ohApZ4HJnwJh0W+UTajZGHo=
Message-ID: <1e3faadb-bb57-74f8-10bb-3a7267916398@ideasonboard.com>
Date:   Thu, 16 Mar 2023 09:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: v4l2-subdev: Add new ioctl for client capabilities
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20230228154023.208465-1-tomi.valkeinen@ideasonboard.com>
 <20230312131134.GG2545@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230312131134.GG2545@pendragon.ideasonboard.com>
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

Hi,

On 12/03/2023 15:11, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Feb 28, 2023 at 05:40:23PM +0200, Tomi Valkeinen wrote:
>> Add new ioctls to set and get subdev client capabilities. Client in this
>> context means the userspace application which opens the subdev device
>> node.
>>
>> For now we only add a single flag, V4L2_SUBDEV_CLIENT_CAP_STREAMS, which
>> indicates that the client is streams-aware.
>>
>> The reason for needing such a flag is as follows:
>>
>> Many structs passed via ioctls, e.g. struct v4l2_subdev_format, contain
>> reserved fields (usually a single array field). These reserved fields
>> can be used to extend the ioctl. The userspace is required to zero the
>> reserved fields.
>>
>> We recently added a new 'stream' field to many of these structs, and the
>> space for the field was taken from these reserved arrays. The assumption
>> was that these new 'stream' fields are always initialized to zero if the
>> userspace does not use them. This was a mistake, as, as mentioned above,
>> the userspace is required to zero the _reserved_ fields. In other words,
>> there is no requirement to zero this new stream field, and if the
>> userspace doesn't use the field (which is the case for all userspace
>> applications at the moment), the field may contain random data.
>>
>> This shows that the way the reserved fields are defined in v4l2 is, in
>> my opinion, somewhat broken, but there is nothing to do about that.
> 
> For existing ioctls that's right, but we can fix it for new ioctls going
> forward.
> 
>> To fix this issue we need a way for the userspace to tell the kernel
>> that the userspace has indeed set the 'stream' field, and it's fine for
>> the kernel to access it. This is achieved with the new iotcl, which the
> 
> s/iotcl/ioctl/
> 
>> userspace should usually use right after opening the subdev device node.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   .../userspace-api/media/v4l/user-func.rst     |  1 +
>>   .../media/v4l/vidioc-subdev-g-client-cap.rst  | 56 ++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-subdev.c         | 64 ++++++++++++++++++-
>>   include/media/v4l2-subdev.h                   |  1 +
>>   include/uapi/linux/v4l2-subdev.h              | 23 +++++++
>>   5 files changed, 143 insertions(+), 2 deletions(-)
>>   create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
>>
>> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
>> index 228c1521f190..15ff0bf7bbe6 100644
>> --- a/Documentation/userspace-api/media/v4l/user-func.rst
>> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
>> @@ -72,6 +72,7 @@ Function Reference
>>       vidioc-subdev-g-frame-interval
>>       vidioc-subdev-g-routing
>>       vidioc-subdev-g-selection
>> +    vidioc-subdev-g-client-cap
>>       vidioc-subdev-querycap
>>       vidioc-subscribe-event
>>       func-mmap
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
>> new file mode 100644
>> index 000000000000..d3cfe932bb16
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
>> @@ -0,0 +1,56 @@
>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>> +.. c:namespace:: V4L
>> +
>> +.. _VIDIOC_SUBDEV_G_CLIENT_CAP:
>> +
>> +************************************************************
>> +ioctl VIDIOC_SUBDEV_G_CLIENT_CAP, VIDIOC_SUBDEV_S_CLIENT_CAP
>> +************************************************************
>> +
>> +Name
>> +====
>> +
>> +VIDIOC_SUBDEV_G_CLIENT_CAP - VIDIOC_SUBDEV_S_CLIENT_CAP - Get or set client capabilities.
> 
> Line wrap.
> 
>> +
>> +
>> +Synopsis
>> +========
>> +
>> +.. c:macro:: VIDIOC_SUBDEV_G_CLIENT_CAP
>> +
>> +``int ioctl(int fd, VIDIOC_SUBDEV_G_CLIENT_CAP, struct v4l2_subdev_client_capability *argp)``
>> +
>> +.. c:macro:: VIDIOC_SUBDEV_S_CLIENT_CAP
>> +
>> +``int ioctl(int fd, VIDIOC_SUBDEV_S_CLIENT_CAP, struct v4l2_subdev_client_capability *argp)``
>> +
>> +Arguments
>> +=========
>> +
>> +``fd``
>> +    File descriptor returned by :ref:`open() <func-open>`.
>> +
>> +``argp``
>> +    Pointer to struct :c:type:`v4l2_subdev_client_capability`.
>> +
>> +Description
>> +===========
>> +
>> +These ioctls are used to get and set the client capabilities. By default no
>> +client capabilities are set.
>> +
> 
> The documentation should explain what capabilities are, and should also
> explicitly tell that S_CLIENT_CAP replaces all capabilities (as opposed
> to enabling new capabilities).

Ok:

Description
===========

These ioctls are used to get and set the client (the application using the
subdevice ioctls) capabilities. By default no client capabilities are set.

The purpose of the client capabilities are to inform the kernel of the 
behavior
of the client, mainly related to maintaining compatibility with different
kernel and userspace versions.

The ``VIDIOC_SUBDEV_S_CLIENT_CAP`` will modify the struct
:c:type:`v4l2_subdev_client_capability` to reflect the capabilities that 
were
accepted. A common case for the kernel not accepting a capability is 
that the
kernel is older than the headers the userspace uses, and thus the 
capability is
unknown to the kernel.

The ``VIDIOC_SUBDEV_S_CLIENT_CAP`` will replace all the previously set
capabilities.

.. flat-table:: Client Capabilities
     :header-rows:  1

     * - Capability
       - Description
     * - ``V4L2_SUBDEV_CLIENT_CAP_STREAMS``
       - The client is aware of streams. Setting this flag enables the 
use of
         streams and routing related ioctls and fields. If this is not set
         (which is the default), all the 'stream' fields referring to 
the stream
         number will be forced to 0 by the kernel, and routing related 
ioctls
         will return -ENOIOCTLCMD.





>> +The ``VIDIOC_SUBDEV_S_CLIENT_CAP`` will modify the struct
>> +:c:type:`v4l2_subdev_client_capability` to reflect the capabilities that were
>> +accepted. A common case for the kernel not accepting a capability is that the
>> +kernel is older than the headers the userspace uses, and thus the capability is
>> +unknown to the kernel.
>> +
>> +Return Value
>> +============
>> +
>> +On success 0 is returned, on error -1 and the ``errno`` variable is set
>> +appropriately. The generic error codes are described at the
>> +:ref:`Generic Error Codes <gen-errors>` chapter.
>> +
>> +ENOIOCTLCMD
>> +   The kernel does not support this ioctl.
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index dff1d9be7841..e741439c6816 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -498,8 +498,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   	struct video_device *vdev = video_devdata(file);
>>   	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
>>   	struct v4l2_fh *vfh = file->private_data;
>> +	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>>   	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>>   	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
>> +	bool client_supports_streams = subdev_fh->client_caps & V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> 
> 	bool client_supports_streams = subdev_fh->client_caps
> 				     & V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> 
>>   	int rval;
>>   
>>   	switch (cmd) {
>> @@ -624,6 +626,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   	case VIDIOC_SUBDEV_G_FMT: {
>>   		struct v4l2_subdev_format *format = arg;
>>   
>> +		if (!client_supports_streams)
>> +			format->stream = 0;
>> +
>>   		memset(format->reserved, 0, sizeof(format->reserved));
>>   		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>>   		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
>> @@ -635,6 +640,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		if (format->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>>   			return -EPERM;
>>   
>> +		if (!client_supports_streams)
>> +			format->stream = 0;
>> +
>>   		memset(format->reserved, 0, sizeof(format->reserved));
>>   		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>>   		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
>> @@ -644,6 +652,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		struct v4l2_subdev_crop *crop = arg;
>>   		struct v4l2_subdev_selection sel;
>>   
>> +		if (!client_supports_streams)
>> +			crop->stream = 0;
>> +
>>   		memset(crop->reserved, 0, sizeof(crop->reserved));
>>   		memset(&sel, 0, sizeof(sel));
>>   		sel.which = crop->which;
>> @@ -665,6 +676,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>>   			return -EPERM;
>>   
>> +		if (!client_supports_streams)
>> +			crop->stream = 0;
>> +
>>   		memset(crop->reserved, 0, sizeof(crop->reserved));
>>   		memset(&sel, 0, sizeof(sel));
>>   		sel.which = crop->which;
>> @@ -683,6 +697,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
>>   		struct v4l2_subdev_mbus_code_enum *code = arg;
>>   
>> +		if (!client_supports_streams)
>> +			code->stream = 0;
>> +
>>   		memset(code->reserved, 0, sizeof(code->reserved));
>>   		return v4l2_subdev_call(sd, pad, enum_mbus_code, state,
>>   					code);
>> @@ -691,6 +708,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
>>   		struct v4l2_subdev_frame_size_enum *fse = arg;
>>   
>> +		if (!client_supports_streams)
>> +			fse->stream = 0;
>> +
>>   		memset(fse->reserved, 0, sizeof(fse->reserved));
>>   		return v4l2_subdev_call(sd, pad, enum_frame_size, state,
>>   					fse);
>> @@ -699,6 +719,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
>>   		struct v4l2_subdev_frame_interval *fi = arg;
>>   
>> +		if (!client_supports_streams)
>> +			fi->stream = 0;
>> +
>>   		memset(fi->reserved, 0, sizeof(fi->reserved));
>>   		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
>>   	}
>> @@ -709,6 +732,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		if (ro_subdev)
>>   			return -EPERM;
>>   
>> +		if (!client_supports_streams)
>> +			fi->stream = 0;
>> +
>>   		memset(fi->reserved, 0, sizeof(fi->reserved));
>>   		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
>>   	}
>> @@ -716,6 +742,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
>>   		struct v4l2_subdev_frame_interval_enum *fie = arg;
>>   
>> +		if (!client_supports_streams)
>> +			fie->stream = 0;
>> +
>>   		memset(fie->reserved, 0, sizeof(fie->reserved));
>>   		return v4l2_subdev_call(sd, pad, enum_frame_interval, state,
>>   					fie);
>> @@ -724,6 +753,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   	case VIDIOC_SUBDEV_G_SELECTION: {
>>   		struct v4l2_subdev_selection *sel = arg;
>>   
>> +		if (!client_supports_streams)
>> +			sel->stream = 0;
>> +
>>   		memset(sel->reserved, 0, sizeof(sel->reserved));
>>   		return v4l2_subdev_call(
>>   			sd, pad, get_selection, state, sel);
>> @@ -735,6 +767,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		if (sel->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>>   			return -EPERM;
>>   
>> +		if (!client_supports_streams)
>> +			sel->stream = 0;
>> +
>>   		memset(sel->reserved, 0, sizeof(sel->reserved));
>>   		return v4l2_subdev_call(
>>   			sd, pad, set_selection, state, sel);
>> @@ -805,7 +840,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		struct v4l2_subdev_routing *routing = arg;
>>   		struct v4l2_subdev_krouting *krouting;
>>   
>> -		if (!v4l2_subdev_enable_streams_api)
>> +		if (!client_supports_streams)
>>   			return -ENOIOCTLCMD;
>>   
>>   		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>> @@ -835,7 +870,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		struct v4l2_subdev_krouting krouting = {};
>>   		unsigned int i;
>>   
>> -		if (!v4l2_subdev_enable_streams_api)
>> +		if (!client_supports_streams)
>>   			return -ENOIOCTLCMD;
>>   
>>   		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>> @@ -876,6 +911,31 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   					routing->which, &krouting);
>>   	}
>>   
>> +	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>> +		struct v4l2_subdev_client_capability *client_cap = arg;
>> +
>> +		if (!v4l2_subdev_enable_streams_api)
>> +			return -ENOIOCTLCMD;
> 
> I wouldn't condition this new ioctl to the streams API, as it can be
> useful for other features in the future. Same below.

Right. I'll drop this, and change VIDIOC_SUBDEV_S_CLIENT_CAP so that it 
clears the V4L2_SUBDEV_CLIENT_CAP_STREAMS bit if 
!v4l2_subdev_enable_streams_api.

>> +
>> +		client_cap->capabilities = subdev_fh->client_caps;
>> +
>> +		return 0;
>> +	}
>> +
>> +	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
>> +		struct v4l2_subdev_client_capability *client_cap = arg;
>> +
>> +		if (!v4l2_subdev_enable_streams_api)
>> +			return -ENOIOCTLCMD;
>> +
>> +		/* Filter out unsupported capabilities */
>> +		client_cap->capabilities &= V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>> +
>> +		subdev_fh->client_caps = client_cap->capabilities;
>> +
>> +		return 0;
>> +	}
>> +
>>   	default:
>>   		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>>   	}
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 17773be4a4ee..b5bb5b802929 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1121,6 +1121,7 @@ struct v4l2_subdev_fh {
>>   	struct module *owner;
>>   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>>   	struct v4l2_subdev_state *state;
>> +	u64 client_caps;
>>   #endif
>>   };
>>   
>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
>> index 654d659de835..9f863240a458 100644
>> --- a/include/uapi/linux/v4l2-subdev.h
>> +++ b/include/uapi/linux/v4l2-subdev.h
>> @@ -233,6 +233,26 @@ struct v4l2_subdev_routing {
>>   	__u32 reserved[6];
>>   };
>>   
>> +/*
>> + * The client is aware of streams. Setting this flag enables the use of streams
>> + * and routing related ioctls and fields. If this is not set (which is the
>> + * default), all the 'stream' fields referring to the stream number will be
>> + * forced to 0 by the kernel, and routing related ioctls will return
>> + * -ENOIOCTLCMD.
> 
> Do we need the latter ? Surely if userspace calls routing ioctls, it
> should be stream-aware.

I think it makes the API more consistent. I don't think there's much use 
for the routing ioctls without the stream field.

I guess it depends on what V4L2_SUBDEV_CLIENT_CAP_STREAMS means. I 
thought it means "client wants to use streams", but if we define it to 
mean "client is aware of streams and has cleared the 'stream' fields", 
then we can only do the field clearing.

>> + */
>> + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
>> +
>> +/**
>> + * struct v4l2_subdev_client_capability - Capabilities of the client accessing the subdev
> 
> Line wrap please.
> 
>> + *
>> + * @capabilities: A bitmask of V4L2_SUBDEV_CLIENT_CAP_* flags.
>> + * @reserved: drivers and applications must zero this array
>> + */
>> +struct v4l2_subdev_client_capability {
>> +	__u64 capabilities;
>> +	__u32 reserved[6];
> 
> Let's not repeat the mistake that this patch is meant to fix, and drop
> this field. We can handle future extensions with a better mechanism.

Well, this patch has to fix the issue because the old ioctls were not 
designed properly, and thus their 'reserved' fields are difficult to use.

This ioctl's reserved fields are easily usable: we just add a flag to 
the 'capabilities' field, which tells that other reserved fields are in use.

That said, I expect 64 bits to be plenty for this ioctl, so I'm also 
fine dropping the reserved fields if that's the concensus.

  Tomi

