Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 571492BC6E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 02:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfE1AKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 20:10:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39824 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbfE1AKE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 20:10:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E65402613F6
Message-ID: <ee35f7d03df5a0684f7ccacbe5c8743f2a3f3e55.camel@collabora.com>
Subject: Re: [PATCH v2 1/4] media: v4l: Simplify dev_debug flags
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com
Date:   Mon, 27 May 2019 21:09:55 -0300
In-Reply-To: <810424a2-93e8-207d-90b6-887b032d6546@xs4all.nl>
References: <20190227170706.6258-1-ezequiel@collabora.com>
         <20190227170706.6258-2-ezequiel@collabora.com>
         <810424a2-93e8-207d-90b6-887b032d6546@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I'm sorry for the delay.

This series still sounds useful, so let's try to
revive it.

On Mon, 2019-03-11 at 12:16 +0100, Hans Verkuil wrote:
> On 2/27/19 6:07 PM, Ezequiel Garcia wrote:
> > In preparation to cleanup the debug logic, simplify the dev_debug
> > usage. In particular, make sure that a single flag is used to
> > control each debug print.
> > 
> > Before this commit V4L2_DEV_DEBUG_STREAMING and V4L2_DEV_DEBUG_FOP
> > were needed to enable read and write debugging. After this commit
> > only the former is needed.
> 
> The original idea was that ioctls are logged with V4L2_DEV_DEBUG_IOCTL
> and file ops with V4L2_DEV_DEBUG_FOP. And to see the streaming ioctls
> or fops you would have to add V4L2_DEV_DEBUG_STREAMING in addition to
> DEBUG_IOCTL/FOP.
> 
> This patch changes the behavior in that the streaming fops are now
> solely controlled by V4L2_DEV_DEBUG_STREAMING.
> 
> I do agree with this change, but this requires that the same change is
> done for the streaming ioctls (DQBUF/QBUF) and that the documentation in
> Documentation/media/kapi/v4l2-dev.rst is updated (section "video device
> debugging").
> 

Oops, I managed to somehow miss (D)QBUF, even though it's perfectly
well documented in the header!

Will fix, and will fix the documentation as well.
  
> Of course, the documentation should also mention the new dev_debug
> module parameter and the new debug flag for debugging controls.
> 
> Regards,
> 
> 	Hans
> 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index d7528f82a66a..34e4958663bf 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -315,8 +315,7 @@ static ssize_t v4l2_read(struct file *filp, char __user *buf,
> >  		return -EINVAL;
> >  	if (video_is_registered(vdev))
> >  		ret = vdev->fops->read(filp, buf, sz, off);
> > -	if ((vdev->dev_debug & V4L2_DEV_DEBUG_FOP) &&
> > -	    (vdev->dev_debug & V4L2_DEV_DEBUG_STREAMING))
> > +	if (vdev->dev_debug & V4L2_DEV_DEBUG_STREAMING)
> >  		dprintk("%s: read: %zd (%d)\n",
> >  			video_device_node_name(vdev), sz, ret);
> >  	return ret;
> > @@ -332,8 +331,7 @@ static ssize_t v4l2_write(struct file *filp, const char __user *buf,
> >  		return -EINVAL;
> >  	if (video_is_registered(vdev))
> >  		ret = vdev->fops->write(filp, buf, sz, off);
> > -	if ((vdev->dev_debug & V4L2_DEV_DEBUG_FOP) &&
> > -	    (vdev->dev_debug & V4L2_DEV_DEBUG_STREAMING))
> > +	if (vdev->dev_debug & V4L2_DEV_DEBUG_STREAMING)
> >  		dprintk("%s: write: %zd (%d)\n",
> >  			video_device_node_name(vdev), sz, ret);
> >  	return ret;
> > 


