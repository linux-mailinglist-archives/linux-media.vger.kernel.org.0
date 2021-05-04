Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5F83729C1
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 13:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhEDL6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 07:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhEDL6C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 07:58:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC5BC061574
        for <linux-media@vger.kernel.org>; Tue,  4 May 2021 04:57:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1563B1F424AA
Message-ID: <2db7709801107dbacd464a919451bbafbd335748.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Fix .buf_prepare
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com, Adrian Ratiu <adrian.ratiu@collabora.com>
Date:   Tue, 04 May 2021 08:56:57 -0300
In-Reply-To: <20210504113714.30612-1-andrzej.p@collabora.com>
References: <20210504113714.30612-1-andrzej.p@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej,

Thanks a lot for picking this up.

On Tue, 2021-05-04 at 13:37 +0200, Andrzej Pietrasiewicz wrote:
> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> The driver should only set the payload on .buf_prepare if the
> buffer is CAPTURE type. If an OUTPUT buffer has a zero bytesused
> set by userspace then v4l2-core will set it to buffer length.
> 
> Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 
> ---
> @Hans: I haven't had anyone complain about the issue. The fix is needed for
> the rkvdec vp9 work, so I think 5.14 is fine.
> 
>  drivers/staging/media/rkvdec/rkvdec.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index d821661d30f3..ef2166043127 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -481,7 +481,15 @@ static int rkvdec_buf_prepare(struct vb2_buffer *vb)
>                 if (vb2_plane_size(vb, i) < sizeimage)
>                         return -EINVAL;
>         }
> -       vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> +
> +       /*
> +        * Buffer bytesused is written by driver for CAPTURE buffers.
> +        * (if userspace passes 0 bytesused for OUTPUT buffers, v4l2-core sets
> +        * it to buffer length).
> +        */
> +       if (!V4L2_TYPE_IS_OUTPUT(vq->type))

Please use V4L2_TYPE_IS_CAPTURE here.

Also, why is this change needed in rkvdec, but not in cedrus
or hantro?

Thanks!
Ezequiel

