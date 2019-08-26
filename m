Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 522B39D60F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 20:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387422AbfHZSzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 14:55:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50736 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfHZSzw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 14:55:52 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7F21228A165;
        Mon, 26 Aug 2019 19:55:50 +0100 (BST)
Date:   Mon, 26 Aug 2019 20:55:47 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
Subject: Re: [PATCH 8/8] media: cedrus: Add support for V4L2_DEC_CMD_FLUSH
Message-ID: <20190826205547.3ecbf2a1@collabora.com>
In-Reply-To: <20190822194500.2071-9-jernej.skrabec@siol.net>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
        <20190822194500.2071-9-jernej.skrabec@siol.net>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 22 Aug 2019 21:45:00 +0200
Jernej Skrabec <jernej.skrabec@siol.net> wrote:

> This command is useful for explicitly flushing last decoded frame.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 5153b2bba21e..9eae69d5741c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -331,6 +331,37 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static int cedrus_try_decoder_cmd(struct file *file, void *fh,
> +				  struct v4l2_decoder_cmd *dc)
> +{
> +	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int cedrus_decoder_cmd(struct file *file, void *fh,
> +			      struct v4l2_decoder_cmd *dc)
> +{
> +	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
> +	struct vb2_v4l2_buffer *out_vb, *cap_vb;
> +	int ret;
> +
> +	ret = cedrus_try_decoder_cmd(file, fh, dc);
> +	if (ret < 0)
> +		return ret;

Not directly related to this patch, but it seems most drivers
implementing ->vdioc_decoder_cmd() call ->vidioc_try_decoder_cmd()
internally to make sure the cmd is supported. Maybe something
we could automate at the v4l2-ioctl.c level.


