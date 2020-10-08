Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A219286C90
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 04:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgJHCAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 22:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgJHCAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 22:00:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7CDC061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 19:00:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A5CF9DA;
        Thu,  8 Oct 2020 04:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602122435;
        bh=c550arwsSu14YLdVsMS4RP7J0ekD19h/FwPelCw7/MQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hJwy+r8we08yCtD2Aog25f7OFTjvpy5ZtjcRfXxLeJOS9q3xFbqemoL/9N/hmMUEO
         Hykq8WhPy4R0x8jZPV/87Y32FGZDetTzwK/IA886wxViK2m5GZEWFW2TxX172Fy+ux
         K2bbeYET6Yg6RgQQJppMeUNhJvUcsWd7m/TuxgIQ=
Date:   Thu, 8 Oct 2020 04:59:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     John Cox <jc@kynesim.co.uk>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: videobuf2: Fix length check for single plane
 dmabuf queueing
Message-ID: <20201008015953.GA28158@pendragon.ideasonboard.com>
References: <gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

Thank you for the patch.

On Wed, Jun 17, 2020 at 02:21:52PM +0100, John Cox wrote:
> Check against length in v4l2_buffer rather than vb2_buffer when the
> buffer is a dmabuf. This makes the single plane test the same as the
> existing multiplanar test.
> 
> Signed-off-by: John Cox <jc@kynesim.co.uk>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index e652f4318284..731c7c99c971 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -114,7 +114,8 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
>                                 return -EINVAL;
>                 }
>         } else {
> -               length = (b->memory == VB2_MEMORY_USERPTR)
> +               length = (b->memory == VB2_MEMORY_USERPTR ||
> +                         b->memory == VB2_MEMORY_DMABUF)
>                         ? b->length : vb->planes[0].length;

I don't think this is correct, as it breaks DMABUF import. For USERPTR
the length needs to be passed by userspace, but for DMABUF, we allow
userspace to set length to 0, and use the length retrieved from the
dma_buf. With this change, b->length is 0, and the check fails.

> 
>                 if (b->bytesused > length)

-- 
Regards,

Laurent Pinchart
