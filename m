Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABD4440331
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 21:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhJ2T34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 15:29:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231497AbhJ2T3o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 15:29:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 991A560D07;
        Fri, 29 Oct 2021 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635535635;
        bh=wrlLeaQdneJCXxuP2usLUeHJCtlIqSI7Y3L+CH69mxU=;
        h=Date:From:Cc:Subject:In-Reply-To:References:From;
        b=jXJ+MEO9tauSPjIXg/9z5IS4SEDkwJbPc4i/XBxCCUOrF2VlDxvo59AETs6OfWLbN
         03bgkgn1ZwDSwEeu5szeZGJVqIIK4Ln3yu1uJrDyxPpeli74+1iFZf3VuPTyhoNeWO
         YBmrtEMPi15YxRW7oMQphxzMV0pSEfv9gbeH2MV2KDPGs/OqwbHpSwKowO4cVRlZrd
         v9JYleR8pTx2wETYLVLORTVdIEfYVEEqRtI+AywcoI78zbnQGpBzy/rD7g21EfOY/V
         is+B7IXqRFEOFLooZulKzm9TKZ5fQlFa5HxySlXHf/cIFpjc7Gkh04af0eQnDTsKvX
         s5paGvJEmBBNw==
Date:   Fri, 29 Oct 2021 20:27:09 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Alan <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: atomisp: set default mode
Message-ID: <20211029202709.755b9a6b@sal.lan>
In-Reply-To: <543e61dd07c90a7d8577b3a94696edc77953b9d8.1635497370.git.mchehab+huawei@kernel.org>
References: <750e50daa3ed65a7eb060cb0eb5cfc60dc9386be.1635497370.git.mchehab+huawei@kernel.org>
        <543e61dd07c90a7d8577b3a94696edc77953b9d8.1635497370.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 29 Oct 2021 09:49:36 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Without setting a default mode at open(), applications that
> don't call VIDIOC_SET_PARM with a custom atomisp parameters
> won't work, as the pipeline won't be set:
> 
> 	atomisp-isp2 0000:00:03.0: can't create streams
> 	atomisp-isp2 0000:00:03.0: __get_frame_info 1600x1200 (padded to 0) returned -22
> 
> So, as an step to allow generic apps to use this driver, put
> the device's run_mode in preview after open.
> 
> After this patch, using v4l2grab starts to work:
> 
> 	$ v4l2grab -D -f 'NV12' -x 1600 -y 1200 -d /dev/video2 -u
> 	$ nvt/raw2pnm -x1600 -y1200 -f NV12 out017.raw out017.pnm
> 	$ feh out017.pnm

Added support for YUYV at v4l2grab (at contrib/test, under v4l-utils). 
The above can now be just:

	$ v4l2grab -f YUYV  -x 1600 -y 1200 -d /dev/video2 -u
	$ feh out017.pnm

(on a side note, the colorspace conversion from YUYV seems ackward,
but this can be adjusted later on at the toolset and/or at atomisp)

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_fops.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 72cbdce2142a..7df982c80b1a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -893,6 +893,11 @@ static int atomisp_open(struct file *file)
>  	else
>  		pipe->users++;
>  	rt_mutex_unlock(&isp->mutex);
> +
> +	/* Ensure that a mode is set */
> +	if (asd)
> +		v4l2_ctrl_s_ctrl(asd->run_mode, ATOMISP_RUN_MODE_PREVIEW);
> +
>  	return 0;
>  
>  css_error:
