Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADB3628A9E
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 21:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbiKNUip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 15:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236724AbiKNUif (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 15:38:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4DD11C3B
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 12:38:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5196FB812A1
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 20:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8490CC433D6;
        Mon, 14 Nov 2022 20:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668458309;
        bh=IG44oh0wtz548blOlcsSci2FbxbCfd9x/9mhwDeIXtg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AyxAz6Ya2hiMyLXXrLqP/oUelcEIBk0kL/hR62LGuFtbgarN6D4UUSKBMSNmDWacC
         QRGaDa1FkB02dYL6rKDjesSDOCcopEykd0fU4fRCRaLUh9lX5xP2D//oa590aTl4nx
         q68Sm0YvEAa33/Aiefl6bNrVuAojueAZfhMAaXuM3CM5naBGwWwpMYCqUCwEr9jP3A
         frwruGdNbhR69F3WcwtFz0r0IlAtpFchBJgGHeMDkLrBnR9ZfEbfNhGW+6t4DCNGOK
         yS5DZcNnAaWyo6qMmQYuHkE1W26giDZM9/m48Rr3yIzpzGr8bRzdqraWua0tO3v4GV
         Ay3zE9UqS8Idg==
Date:   Mon, 14 Nov 2022 20:38:19 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 12/17] media: atomisp: Fix VIDIOC_REQBUFS failing
 when VIDIOC_S_FMT has not been called yet
Message-ID: <20221114203819.44e7baad@sal.lan>
In-Reply-To: <20221020195533.114049-13-hdegoede@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
        <20221020195533.114049-13-hdegoede@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 20 Oct 2022 21:55:28 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> camorama calls VIDIOC_REQBUFS(V4L2_MEMORY_MMAP) to test if MMAP support
> works (this was added specifically because of the previously broken
> MMAP support in atomisp).
> 
> Currently this fails because atomisp_get_css_frame_info() fails in this
> case. Although it is weird to call VIDIOC_REQBUFS before VIDIOC_S_FMT,
> it is allowed to do this.
> 
> Fix this not working by doing a S_FMT to V4L2_PIX_FMT_YUV420 + the highest
> supported resolution.
> 
> Note this will cause camorama to use mmap mode, which means it will also
> use libv4l2 to do format conversion. libv4l2 will pick V4L2_PIX_FMT_RGB565
> as input format and this will lead to a garbled video display. This is
> a libv4lconvert bug, the RGB565 -> RGB24 path in libv4lconvert assumes
> that stride == width which is not true on the atomisp.

Hmm... should we add a patch on Camorama for it to not use libv4l2 if
format == V4L2_PIX_FMT_RGB565?

> 
> I've already send out a libv4lconvert fix for this. Also this can be worked
> around by passing --dont-use-libv4l2 as argument to camorama.

Was the patch already applied? The better would be to apply it at
libv4l2 upstream, as a fix, porting it to old versions, and mentioning
on what versions this got fixed on this changeset.

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/pci/atomisp_compat_css20.c  |  2 +-
>  .../staging/media/atomisp/pci/atomisp_fops.c  | 25 +++++++++++++++++--
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index ea6114679c53..f282572d69da 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -2688,7 +2688,7 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
>  
>  	if (0 != ia_css_pipe_get_info(asd->stream_env[stream_index]
>  		.pipes[pipe_index], &info)) {
> -		dev_err(isp->dev, "ia_css_pipe_get_info FAILED");
> +		dev_dbg(isp->dev, "ia_css_pipe_get_info FAILED");
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index bc47a092a8af..f539df09ebd9 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -50,15 +50,36 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
>  	u16 source_pad = atomisp_subdev_source_pad(&pipe->vdev);
>  	int ret;
>  
> +	mutex_lock(&pipe->asd->isp->mutex); /* for get_css_frame_info() / set_fmt() */
> +
> +	/*
> +	 * When VIDIOC_S_FMT has not been called before VIDIOC_REQBUFS, then
> +	 * this will fail. Call atomisp_set_fmt() ourselves and try again.
> +	 */
>  	ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		struct v4l2_format f = {
> +			.fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420,
> +			.fmt.pix.width = 10000,
> +			.fmt.pix.height = 10000,
> +		};
> +
> +		ret = atomisp_set_fmt(&pipe->vdev, &f);
> +		if (ret)
> +			goto out;
> +
> +		ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
> +		if (ret)
> +			goto out;
> +	}
>  
>  	atomisp_alloc_css_stat_bufs(pipe->asd, ATOMISP_INPUT_STREAM_GENERAL);
>  
>  	*nplanes = 1;
>  	sizes[0] = PAGE_ALIGN(pipe->pix.sizeimage);
>  
> +out:
> +	mutex_unlock(&pipe->asd->isp->mutex);
>  	return 0;
>  }
>  
