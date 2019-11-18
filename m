Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B6B10070D
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 15:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfKROJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 09:09:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57066 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfKROJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 09:09:16 -0500
Received: from pendragon.ideasonboard.com (unknown [185.67.82.67])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6C44563;
        Mon, 18 Nov 2019 15:09:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574086154;
        bh=Pfbyae1vjwgHrmvJZoe7jGAZ/LeIUtMrjdiNbSUuchs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q6Wy5I5PG7zQg5e+I0SZTDKTwxPYCpCPlYLwbLqDsgzT2132mUNm5lsF3XKuTKZMM
         WkwqAwqvNOrCVH1Kvf/ZnVCYNMbhIS+hSVaWggNWpCV+VUWXPy82ukNKGCAewE9eMy
         p+nPr6pi0fSugCn2vf0cj2wq+s/wXpL70IhVFFbs=
Date:   Mon, 18 Nov 2019 16:09:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [RFC] Add VIDIOC_DESTROY_BUFS
Message-ID: <20191118140908.GA4958@pendragon.ideasonboard.com>
References: <27184315-c71b-2dc2-aa95-9489c46d3fb9@xs4all.nl>
 <20191118145237.27c5eea2@collabora.com>
 <2e7ba1ce-3df6-88d2-6396-6b5c58970d7a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e7ba1ce-3df6-88d2-6396-6b5c58970d7a@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Nov 18, 2019 at 02:59:50PM +0100, Hans Verkuil wrote:
> On 11/18/19 2:52 PM, Boris Brezillon wrote:
> > On Mon, 18 Nov 2019 14:06:40 +0100 Hans Verkuil wrote:
> > 
> >> Here is a proposal for a new VIDIOC_DESTROY_BUFS ioctl:
> > 
> > Thanks for sending this RFC.
> > 
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >> index c7c1179eea65..1a80d1119768 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -2423,6 +2423,19 @@ struct v4l2_create_buffers {
> >>  	__u32			reserved[7];
> >>  };
> >>
> >> +/**
> >> + * struct v4l2_destroy_buffers - VIDIOC_DESTROY_BUFS argument
> >> + * @type:	stream type
> >> + * @index:	index of the first buffer to destroy
> >> + * @count:	number of consecutive buffers starting from @index to destroy
> >> + */
> >> +struct v4l2_destroy_buffers {
> >> +	__u32			type;
> >> +	__u32			index;
> >> +	__u32			count;
> >> +};

Another option, to make this more flexible, is to replace index by a
pointer to an array of count elements, each containing an index of a
buffer to destroy.

> >> +
> >> +
> >>  /*
> >>   *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
> >>   *
> >> @@ -2522,6 +2535,7 @@ struct v4l2_create_buffers {
> >>  #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
> >>
> >>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
> >> +#define VIDIOC_DESTROY_BUFS	_IOW ('V', 104, struct v4l2_destroy_buffers)
> >>
> >>  /* Reminder: when adding new ioctls please add support for them to
> >>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> >>
> >>
> >>
> >> So this basically just destroys buffers [index..index+count-1]. Does nothing if
> >> count == 0. All buffers in the sequence must be dequeued or it will return
> >> -EBUSY and do nothing.
> >>
> >> If some of the buffers in that range are already destroyed, or in fact were
> >> never created, then they will be ignored. I.e., DESTROY_BUFS won't return
> >> an error in that case.
> > 
> > Sounds good to me.
> > 
> >> VIDIOC_CREATE_BUFS will need a few changes:
> >>
> >> CREATE_BUFS will try to find a range of <count> free consecutive buffers.
> >> If that's not available, then it will reduce <count> to the count of the
> >> maximum freely available consecutive buffers. If <count> is 0, then it
> >> will set <index> to the maximum index of an existing buffer + 1.
> >>
> >> As long as DESTROY_BUFS isn't used, then CREATE_BUFS acts exactly the same
> >> as it does today.
> > 
> > Sounds good too.
> > 
> >> I would also like to extend struct v4l2_create_buffers with a new field:
> >> __u32 max_index. This is a maximum index possible, typically VIDEO_MAX_FRAME-1.
> > 
> > Shouldn't max_buffers be a property of the queue, set through a separate
> > ioctl()? BTW, how would you decrease the queue depth?
> > CREATE_BUFS.{count=0,max_index=<new-depth>}?
> 
> I think the name might be confusing: cap_max_index might be better: this is just
> a read-only capability: i.e. how many buffers can userspace create? Currently
> this is 32, but in the future drivers should be able to allow for more buffers.
> It should be something they tell vb2.

Why should we set a limit though ? And how would driver decide ?

-- 
Regards,

Laurent Pinchart
