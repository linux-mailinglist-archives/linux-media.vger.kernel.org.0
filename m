Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA0544C360
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 15:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhKJOxN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 09:53:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232308AbhKJOxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 09:53:04 -0500
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 914378BB;
        Wed, 10 Nov 2021 15:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636555815;
        bh=ga32JeB30n3eoOye+UpCrBUOXqpdY+HETVu89eSCvHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hO5x5xxllHJu51Ax+43iZ9IUNopiaZTSyHg2LloVM9sqxF3juFaHOFfSJ2n5Qp70i
         +BZVFHxKbYJ2r212SxDuBJQPyxAunABK+U6ZUx07NP5ljO/v2xyyCf8/GXxJjw9/vP
         9JQMOtdTBtWC4s/EuCepKNs67z2xqC6t7EbJqFiI=
Date:   Wed, 10 Nov 2021 16:49:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH 2/2] media: videobuf2: add WARN_ON if bytesused is bigger
 than buffer length
Message-ID: <YYvcE24qkaImq5xK@pendragon.ideasonboard.com>
References: <20211108193933.20369-1-dafna.hirschfeld@collabora.com>
 <20211108193933.20369-3-dafna.hirschfeld@collabora.com>
 <5efc3d13-9d25-d0ce-98c8-fe1563dd91e9@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5efc3d13-9d25-d0ce-98c8-fe1563dd91e9@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 10, 2021 at 09:58:02AM +0100, Hans Verkuil wrote:
> On 08/11/2021 20:39, Dafna Hirschfeld wrote:
> > In function vb2_set_plane_payload, report if the
> > given bytesused is bigger than the buffer size.
> > 
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >  include/media/videobuf2-core.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> > index 2467284e5f26..ffaa1f3361c3 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -1155,8 +1155,10 @@ static inline void *vb2_get_drv_priv(struct vb2_queue *q)
> >  static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
> >  				 unsigned int plane_no, unsigned long size)
> >  {
> > -	if (plane_no < vb->num_planes)
> > +	if (plane_no < vb->num_planes) {
> > +		WARN_ON(size > vb->planes[plane_no].length);
> 
> I would change this to:
> 
> 		/*
> 		 * size must never be larger than the buffer length, so
> 		 * warn and clamp to the buffer length if that's the case.
> 		 */
> 		if (WARN_ON(size > vb->planes[plane_no].length))
> 			size = vb->planes[plane_no].length;

Should this also be a WARN_ON_ONCE() ? If it occurs once there's a large
risk it will occur very frequently, and flood the kernel log.

> >  		vb->planes[plane_no].bytesused = size;
> > +	}
> >  }
> >  
> >  /**

-- 
Regards,

Laurent Pinchart
