Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE2A22E1B0
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 19:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGZRaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 13:30:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47918 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgGZRaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 13:30:55 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AFC9304;
        Sun, 26 Jul 2020 19:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595784652;
        bh=UdBOdl3zi/qG8vkxOz0jQ4rKn6Xodg91lx+efNqwElY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J/V3fRTO7HzhURiH6YBF1+ryMV1bVsyzMJ/yr/LDzwQt8mkyIqOIOIkmkNBhiVu+w
         v8ngpJxW6rFXsCmpghPtyUeYGt6zUEsNzlQxefX38gYQOrSCR+gWcFe298cnmgIJKb
         Gcu1qf9iNVEjObczqVrP099+3n8lpZChOJdhsRm4=
Date:   Sun, 26 Jul 2020 20:30:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200726173044.GA14755@pendragon.ideasonboard.com>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200726164439.48973-1-yepeilin.cs@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peilin,

Thank you for the patch.

On Sun, Jul 26, 2020 at 12:44:39PM -0400, Peilin Ye wrote:
> video_put_user() is copying uninitialized stack memory to userspace. Fix
> it by initializing `vb32` using memset().

What makes you think this will fix the issue ? When initializing a
structure at declaration time, the fields that are not explicitly
specified should be initialized to 0 by the compiler. See
https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.cbclx01/strin.htm:

If a structure variable is partially initialized, all the uninitialized
structure members are implicitly initialized to zero no matter what the
storage class of the structure variable is. See the following example:

struct one {
    int a;
    int b;
    int c;
};

void main() {
    struct one z1;         // Members in z1 do not have default initial values.
    static struct one z2;  // z2.a=0, z2.b=0, and z2.c=0.
    struct one z3 = {1};   // z3.a=1, z3.b=0, and z3.c=0.
}

> Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 32 +++++++++++++++-------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a556880f225a..08909f58dc80 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3210,21 +3210,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
>  	case VIDIOC_DQBUF_TIME32:
>  	case VIDIOC_PREPARE_BUF_TIME32: {
>  		struct v4l2_buffer *vb = parg;
> -		struct v4l2_buffer_time32 vb32 = {
> -			.index		= vb->index,
> -			.type		= vb->type,
> -			.bytesused	= vb->bytesused,
> -			.flags		= vb->flags,
> -			.field		= vb->field,
> -			.timestamp.tv_sec	= vb->timestamp.tv_sec,
> -			.timestamp.tv_usec	= vb->timestamp.tv_usec,
> -			.timecode	= vb->timecode,
> -			.sequence	= vb->sequence,
> -			.memory		= vb->memory,
> -			.m.userptr	= vb->m.userptr,
> -			.length		= vb->length,
> -			.request_fd	= vb->request_fd,
> -		};
> +		struct v4l2_buffer_time32 vb32;
> +
> +		memset(&vb32, 0, sizeof(vb32));
> +
> +		vb32.index	= vb->index;
> +		vb32.type	= vb->type;
> +		vb32.bytesused	= vb->bytesused;
> +		vb32.flags	= vb->flags;
> +		vb32.field	= vb->field;
> +		vb32.timestamp.tv_sec	= vb->timestamp.tv_sec;
> +		vb32.timestamp.tv_usec	= vb->timestamp.tv_usec;
> +		vb32.timecode	= vb->timecode;
> +		vb32.sequence	= vb->sequence;
> +		vb32.memory	= vb->memory;
> +		vb32.m.userptr	= vb->m.userptr;
> +		vb32.length	= vb->length;
> +		vb32.request_fd	= vb->request_fd;
>  
>  		if (copy_to_user(arg, &vb32, sizeof(vb32)))
>  			return -EFAULT;

-- 
Regards,

Laurent Pinchart
