Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DB8DE6C8
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 10:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbfJUIli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 04:41:38 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39989 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726181AbfJUIli (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 04:41:38 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MTFqiTEA1o1ZhMTFuiL5bG; Mon, 21 Oct 2019 10:41:36 +0200
Subject: Re: [RFC PATCH v3 1/6] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
 <20191008091119.7294-2-boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9b289f76-6c09-b088-204d-ce5b5009bd7b@xs4all.nl>
Date:   Mon, 21 Oct 2019 10:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008091119.7294-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDAjzinXp+MjgGJwUKOMMCzHERS86VKWaooxzdVZTkGgu+G7qWBdL07j9kRcEtKfzwao0dAWHcHHZjRB1YBeezyAm/SKFze07p0UqI9OKAkaDIMrA4l0
 PUrdOB8Q4BnERNwP2EXTAYjaVHcMDrETeN5Aicry1fIUzuMyABFexVlRKTB8XG1UWDqIo3PWLCL7sbxxT6fN6p3Qj/NvlGiPisOTl4r/RGLji6s6VsZBaxLz
 sbtdcvzeYoGJniJP01ZqNsR9pTwWC1J52BB0tjf4QMACjuMpwdf4GifrOMWef1ILqnGyNTYciGVtBUk4kLoTTh0w7UAS8GP3mV3DER7XNJoTHYS0+dKU0JVM
 pop3cw+rEt+FmHG/UBaNAyrUbi88a8U3xEbmqnFnpvB0yH9vZhtMq5UDiAUucaPI/Wif9KLDVH56cWM3a2LNyF6p8VMpCMs6HW3YvcnQO8vxrQsKa5Q4Tcrh
 +FDCAWK+EbZQkeNHUUlhJQox78k8C5gOFPbyOiAhnEa/1TDmNHm/79qUJco=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/8/19 11:11 AM, Boris Brezillon wrote:
> This is part of the multiplanar and singleplanar unification process.
> v4l2_ext_pix_format is supposed to work for both cases.
> 
> We also add the concept of modifiers already employed in DRM to expose
> HW-specific formats (like tiled or compressed formats) and allow
> exchanging this information with the DRM subsystem in a consistent way.
> 
> Note that V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
> V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE types are no longer accepted
> in v4l2_ext_format and will be rejected if you use the {G,S,TRY}EXT_FMT
> ioctls. V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE is dropped as part
> of the multiplanar/singleplanar unification.
> V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY seems to be used mostly on old
> drivers and supporting it would require some extra rework.
> 
> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> in drivers, but, in the meantime, the core takes care of converting
> {S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
> still work if the userspace app/lib uses the new ioctls.
> The conversion is also done the other around to allow userspace
> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> _ext_ hooks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

<snip>

>  
> +#define VIDIOC_G_EXT_FMT	_IOWR('V', 104, struct v4l2_ext_format)
> +#define VIDIOC_S_EXT_FMT	_IOWR('V', 105, struct v4l2_ext_format)
> +#define VIDIOC_TRY_EXT_FMT	_IOWR('V', 106, struct v4l2_ext_format)
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>  
> 

Since we're extending g/s/try_fmt, we should also provide a replacement for
enum_fmt, esp. given this thread:

https://www.mail-archive.com/linux-media@vger.kernel.org/msg150871.html

So here is a preliminary suggestion:

struct v4l2_ext_fmtdesc {
        __u32               index;             /* Format number      */
        __u32               type;              /* enum v4l2_buf_type */
	__u32               which;             /* enum v4l2_subdev_format_whence, ignored if mbus_code == 0 */
        __u32               mbus_code;         /* Mediabus Code (set to 0 if n/a) */
        __u32               flags;
        __u8                description[32];   /* Description string */
        __u32               pixelformat;       /* Format fourcc      */
};

This would solve (I think) the issue raised in the thread since you can now get
just for formats that are valid for the given mediabus code and the which field.

Other improvements that could be made is to return more information about the
format (similar to struct v4l2_format_info). In particular v4l2_pixel_encoding
and mem/comp_planes would be useful for userspace to know.

Finally, we can also add a new ioctl that combines ENUM_FMT/ENUM_FRAMESIZES/ENUM_FRAMEINTERVALS
and returns an array of all valid formats/sizes/intervals, requiring just a single ioctl
to obtain all this information.

Regards,

	Hans
