Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AE1338685
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 08:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhCLHY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 02:24:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:49050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231551AbhCLHYg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 02:24:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4A2264F81;
        Fri, 12 Mar 2021 07:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615533876;
        bh=MaYx/H8dZUN6HeuCS2QypsGxsjnPq7tVcY++vIVWPmY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=paIm1PM1BKYVf+ox+NlADxfForaY9VKzPk5fwL3HZdrSG4Dj0FvbaDL8wLaPDPos2
         k+3zlZAlNJVoDCWg4BYw/jM3bDxcr/IXTg66U8zH6BSaP4QdP7eLDAPQnkUlYjh6RI
         fYtoidch7/dDY8uMWG6BuD2hoIvQVoUBHRfniBpRODEJhkvmk5MBRZCtIZftd2dpn5
         ZrRi+0eMNoiuL9M9h6+xsjIrBfIjcnZ7C2Y8a3es16Ge184U+WVx+wtjYaKK4GfiSP
         ZRJTOHdW6/obCG04mtLE7wtpBeOoEwHW8EykYt1M3/raxIO1K18oVY6+hS0A+tGVV/
         oJjLszEQckpdw==
Date:   Fri, 12 Mar 2021 08:24:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [bug report] Revert "media: staging: atomisp: Remove driver"
Message-ID: <20210312082152.0c59329e@coco.lan>
In-Reply-To: <YEsNoNRz40DSq/4k@mwanda>
References: <YEsNoNRz40DSq/4k@mwanda>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Em Fri, 12 Mar 2021 09:43:44 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> Hello Mauro Carvalho Chehab,
> 
> The patch ad85094b293e: "Revert "media: staging: atomisp: Remove
> driver"" from Apr 19, 2020, leads to the following static checker
> warning:
> 
> 	drivers/staging/media/atomisp/pci/atomisp_fops.c:261 atomisp_q_video_buffers_to_css()
> 	error: buffer overflow 'asd->stream_env[stream_id]->pipes' 6 <= 6
> 
> drivers/staging/media/atomisp/pci/atomisp_fops.c
>    234                  list_del_init(&vb->queue);
>    235                  vb->state = VIDEOBUF_ACTIVE;
>    236                  spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
>    237  
>    238                  /*
>    239                   * If there is a per_frame setting to apply on the buffer,
>    240                   * do it before buffer en-queueing.
>    241                   */
>    242                  vm_mem = vb->priv;
>    243  
>    244                  param = pipe->frame_params[vb->i];
>    245                  if (param) {
>    246                          atomisp_makeup_css_parameters(asd,
>    247                                                        &asd->params.css_param.update_flag,
>    248                                                        &param->params);
>    249                          atomisp_apply_css_parameters(asd, &param->params);
>    250  
>    251                          if (param->params.update_flag.dz_config &&
>    252                              asd->run_mode->val != ATOMISP_RUN_MODE_VIDEO) {
>    253                                  err = atomisp_calculate_real_zoom_region(asd,
>    254                                          &param->params.dz_config, css_pipe_id);
>    255                                  if (!err)
>    256                                          asd->params.config.dz_config = &param->params.dz_config;
>    257                          }
>    258                          atomisp_css_set_isp_config_applied_frame(asd,
>    259                                  vm_mem->vaddr);
>    260                          atomisp_css_update_isp_params_on_pipe(asd,
>    261                                                                asd->stream_env[stream_id].pipes[css_pipe_id]);
>                                                                                                        ^^^^^^^^^^^
> Can this be IA_CSS_PIPE_ID_NUM?  It looks that way.  The concern is
> about the last caller in atomisp_qbuffers_to_css().

Well, atomisp_q_video_buffers_to_css() should never receive
IA_CSS_PIPE_ID_NUM in practice.

See, the atomisp driver uses several different pipelines in order
to capture images and do different types of image processing (like
scaling, image improvements and format conversion). Those are
dynamically set internally inside the driver's code, depending on
the parameters set via different ioctls before starting to stream.

On other words, calling the function with IA_CSS_PIPE_ID_NUM is
invalid.

So, I guess that the best fix would be to do something like the
enclosed path.

Thanks,
Mauro

[PATCH] atomisp: don't let it go past pipes array

In practice, IA_CSS_PIPE_ID_NUM should never be used when
calling atomisp_q_video_buffers_to_css(), as the driver should
discover the right pipe before calling it.

Yet, if some pipe parsing issue happens, it could end using
it.

So, add a WARN_ON() to prevent such case.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 453bb6913550..f1e6b2597853 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -221,6 +221,9 @@ int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 	unsigned long irqflags;
 	int err = 0;
 
+	if (WARN_ON(css_pipe_id >= IA_CSS_PIPE_ID_NUM))
+		return -EINVAL;
+
 	while (pipe->buffers_in_css < ATOMISP_CSS_Q_DEPTH) {
 		struct videobuf_buffer *vb;
 

