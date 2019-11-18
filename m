Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4E65100628
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 14:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfKRNGp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 08:06:45 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56851 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727002AbfKRNGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 08:06:44 -0500
Received: from [IPv6:2001:983:e9a7:1:51d2:6e2e:1293:dc69]
 ([IPv6:2001:983:e9a7:1:51d2:6e2e:1293:dc69])
        by smtp-cloud8.xs4all.net with ESMTPA
        id WgjoijCaQecrtWgjpixn1v; Mon, 18 Nov 2019 14:06:42 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] Add VIDIOC_DESTROY_BUFS
Message-ID: <27184315-c71b-2dc2-aa95-9489c46d3fb9@xs4all.nl>
Date:   Mon, 18 Nov 2019 14:06:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIaWhcbc013Ww2DkRg371ACpADL6Fd7Cjd6F38lioFTaExrqshUXzoxf5OCdkjprOeodBf9Uts2mlCgcZbFSlUdplkEjfh8qRoRFpQwI8dLLBaaZlF8L
 wF6KiHhsX9IxrH8zQpZS5yE6jMvWBfzCQ/NYp2BovQ0YywFei81Zq3PwNwwlEtZOvWcvTdNde2ZpWizeY+eSQOCIZAstcRvOPJ1LhWv4o07+SWiXQQAyV6m0
 niifufSC7etFWmeTDrsdsOS/usAukx9Lsog5hBAu0sy5wYIkRjWuI0Af9Y2bE85u3Qsi3eJ4VF/R35tCxoEUPy3b22pfcasVPzXtHr/i9OJt2Vyctrko0xXQ
 wbFcHPT3zeH5QLGQkxta3f58+92QljeOCsl4L6wVyrrTqw2RxqWYk6R33GHlkRYHxJTn9E+E2iEmVCATrcwmAf8e2dBGZQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here is a proposal for a new VIDIOC_DESTROY_BUFS ioctl:

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c7c1179eea65..1a80d1119768 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2423,6 +2423,19 @@ struct v4l2_create_buffers {
 	__u32			reserved[7];
 };

+/**
+ * struct v4l2_destroy_buffers - VIDIOC_DESTROY_BUFS argument
+ * @type:	stream type
+ * @index:	index of the first buffer to destroy
+ * @count:	number of consecutive buffers starting from @index to destroy
+ */
+struct v4l2_destroy_buffers {
+	__u32			type;
+	__u32			index;
+	__u32			count;
+};
+
+
 /*
  *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
  *
@@ -2522,6 +2535,7 @@ struct v4l2_create_buffers {
 #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)

 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
+#define VIDIOC_DESTROY_BUFS	_IOW ('V', 104, struct v4l2_destroy_buffers)

 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */



So this basically just destroys buffers [index..index+count-1]. Does nothing if
count == 0. All buffers in the sequence must be dequeued or it will return
-EBUSY and do nothing.

If some of the buffers in that range are already destroyed, or in fact were
never created, then they will be ignored. I.e., DESTROY_BUFS won't return
an error in that case.


VIDIOC_CREATE_BUFS will need a few changes:

CREATE_BUFS will try to find a range of <count> free consecutive buffers.
If that's not available, then it will reduce <count> to the count of the
maximum freely available consecutive buffers. If <count> is 0, then it
will set <index> to the maximum index of an existing buffer + 1.

As long as DESTROY_BUFS isn't used, then CREATE_BUFS acts exactly the same
as it does today.

I would also like to extend struct v4l2_create_buffers with a new field:
__u32 max_index. This is a maximum index possible, typically VIDEO_MAX_FRAME-1.

This is important when we want to support more than 32 buffers. But we can
postpone this as well. But this is all we need to have the API support this
feature, even though more work is needed internally to actually break the
32 buffer limit.

Regards,

	Hans
