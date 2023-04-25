Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89EE36EDC57
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 09:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjDYHRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 03:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjDYHRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 03:17:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883679001
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 00:16:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 22F9862BDE
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 07:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CC4C433EF;
        Tue, 25 Apr 2023 07:16:57 +0000 (UTC)
Message-ID: <eeba026b-4588-4fd9-5aaa-54c5d1a39252@xs4all.nl>
Date:   Tue, 25 Apr 2023 09:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/13] media: bttv: move vid fmt/width/height out of fh
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
 <afb29acfbe2d19446c49894ae99a412eab894f96.1682379348.git.deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <afb29acfbe2d19446c49894ae99a412eab894f96.1682379348.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 25/04/2023 02:10, Deborah Brouwer wrote:
> Instead of storing video format, width and height separately in each file
> handle, move these fields to the main struct bttv. Use them wherever
> possible in preparation for vb2 conversion which stops using separate bttv
> file handles.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/media/pci/bt8xx/bttv-driver.c | 34 +++++++++++++--------------
>  drivers/media/pci/bt8xx/bttvp.h       |  3 +++
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
> index e59f40dfccc3..7e7658a7ed40 100644
> --- a/drivers/media/pci/bt8xx/bttv-driver.c
> +++ b/drivers/media/pci/bt8xx/bttv-driver.c
> @@ -2066,11 +2066,11 @@ static int bttv_g_fmt_vid_cap(struct file *file, void *priv,
>  					struct v4l2_format *f)
>  {
>  	struct bttv_fh *fh  = priv;
> +	struct bttv *btv = video_drvdata(file);
>  
> -	pix_format_set_size(&f->fmt.pix, fh->fmt,
> -				fh->width, fh->height);
> +	pix_format_set_size(&f->fmt.pix, btv->fmt, btv->width, btv->height);
>  	f->fmt.pix.field        = fh->cap.field;
> -	f->fmt.pix.pixelformat  = fh->fmt->fourcc;
> +	f->fmt.pix.pixelformat  = btv->fmt->fourcc;
>  	f->fmt.pix.colorspace   = V4L2_COLORSPACE_SMPTE170M;
>  
>  	return 0;
> @@ -2190,6 +2190,9 @@ static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
>  	btv->init.fmt        = fmt;
>  	btv->init.width      = f->fmt.pix.width;
>  	btv->init.height     = f->fmt.pix.height;
> +	btv->fmt = fmt;
> +	btv->width = f->fmt.pix.width;
> +	btv->height = f->fmt.pix.height;
>  
>  	return 0;
>  }
> @@ -2446,21 +2449,15 @@ static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *s
>  
>  	fh->do_crop = 1;
>  
> -	if (fh->width < c.min_scaled_width) {
> -		fh->width = c.min_scaled_width;
> -		btv->init.width = c.min_scaled_width;
> -	} else if (fh->width > c.max_scaled_width) {
> -		fh->width = c.max_scaled_width;
> -		btv->init.width = c.max_scaled_width;
> -	}
> +	if (btv->width < c.min_scaled_width)
> +		btv->width = c.min_scaled_width;
> +	else if (btv->width > c.max_scaled_width)
> +		btv->width = c.max_scaled_width;
>  
> -	if (fh->height < c.min_scaled_height) {
> -		fh->height = c.min_scaled_height;
> -		btv->init.height = c.min_scaled_height;
> -	} else if (fh->height > c.max_scaled_height) {
> -		fh->height = c.max_scaled_height;
> -		btv->init.height = c.max_scaled_height;
> -	}
> +	if (btv->height < c.min_scaled_height)
> +		btv->height = c.min_scaled_height;
> +	else if (btv->height > c.max_scaled_height)
> +		btv->height = c.max_scaled_height;
>  
>  	return 0;
>  }
> @@ -3636,6 +3633,9 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
>  	btv->init.fmt         = format_by_fourcc(V4L2_PIX_FMT_BGR24);
>  	btv->init.width       = 320;
>  	btv->init.height      = 240;
> +	btv->fmt = format_by_fourcc(V4L2_PIX_FMT_BGR24);
> +	btv->width = 320;
> +	btv->height = 240;
>  	btv->input = 0;
>  
>  	v4l2_ctrl_new_std(hdl, &bttv_ctrl_ops,
> diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
> index 717f002a41df..7f02dd5866d7 100644
> --- a/drivers/media/pci/bt8xx/bttvp.h
> +++ b/drivers/media/pci/bt8xx/bttvp.h
> @@ -449,6 +449,9 @@ struct bttv {
>  
>  	unsigned int users;
>  	struct bttv_fh init;
> +	const struct bttv_format *fmt;
> +	int width;
> +	int height;
>  
>  	/* used to make dvb-bt8xx autoloadable */
>  	struct work_struct request_module_wk;

It's a bit odd: you add these fields to struct bttv, but they are not
removed from bttv_fh. I suspect you only switched to these new fields
in cases where they are needed for the vb2 conversion and kept the
fields in bttv_fh to avoid having to change more code than is necessary
for that?

If so, that should be clearly documented in the commit log & subject
line since it currently says 'moved', not 'copied'.

The same question applies to patch 5.

Regards,

	Hans
