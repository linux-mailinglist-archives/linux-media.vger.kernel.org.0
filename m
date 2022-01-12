Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C0948C0F7
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 10:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352041AbiALJZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 04:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352031AbiALJZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 04:25:23 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4AEC06173F
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 01:25:23 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id a1-20020a17090a688100b001b3fd52338eso2488197pjd.1
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 01:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zHD6nAn4eUWs41aZCzyCxokUQJygCOlJ451MtP3HAZ4=;
        b=mBi42oDB31Q4yFuXfEexnsOAonqZY/iJwsS0XEysFwwy5N9BCW+roi04YDajE7bWl7
         Zj8Ehb12NJvYLrY7o+8w6HkPlpM9tt5WwDMUkAu6OwzAJtnYnEqy94122JCw0Lg6rEFF
         UUAYSFdNKCmC6NtYj9O9hUMXaWiHLT1jk756E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zHD6nAn4eUWs41aZCzyCxokUQJygCOlJ451MtP3HAZ4=;
        b=AkW0nIVrD7Er2x9BwepEnlCEHgO9TrlgOWfdQeCIQ9oC48/lITPiGblYtMIdhmUbgX
         LiDgd1e7bPCpb8HYh8dBldrSsx1sMyi8rfml2CHbrPcrMpGy8P/mzkhx6JN2t0FgyhDr
         lPqRRLsk1+UNeEtQPNeAIRwBJsOUnFZfgvd9QnJcCMG5AlQN1iW3PLRnRQivzsMqT6Gl
         l43+V4WM6705N5yF13rs5g8M/ka4dPP+7V+T5dD3q6Q2oggTLHWRe5DaG4LtbCWxva4X
         3ez22Fbd/35UEwQAWV+h23gO2eBteP6Wt7Rg6co9A5LfQAsH3Eb8zruFfjm5tGO3Nd4d
         rx5g==
X-Gm-Message-State: AOAM532RVMEEJQEjPW3Tc+4t/itLIHAXnFhgXBqUntaRlrdp905oXkxb
        LXagEroTasXgUhrI1HT3M7IcHA==
X-Google-Smtp-Source: ABdhPJwknrg9ccDLYAx9EbeP2Lr0aQLukB24fc6czdRXmk2U9ptrzO1mdLowqMxeagXqyiXHlHCvjA==
X-Received: by 2002:a17:90b:1c01:: with SMTP id oc1mr7700301pjb.27.1641979522894;
        Wed, 12 Jan 2022 01:25:22 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:ae37:fbdd:88da:2106])
        by smtp.gmail.com with ESMTPSA id e20sm13372031pfv.219.2022.01.12.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 01:25:22 -0800 (PST)
Date:   Wed, 12 Jan 2022 18:25:17 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        kernel@collabora.com
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
Message-ID: <Yd6efUeghxZckeoT@google.com>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
 <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
 <20220111081331.GB21713@lst.de>
 <65307131-533a-3de1-7877-ca3020743cbe@collabora.com>
 <20220111085230.GA22703@lst.de>
 <6c40de5b-274d-1dc4-3aa5-498343bb3a43@collabora.com>
 <20220111085958.GA22795@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111085958.GA22795@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/01/11 09:59), Christoph Hellwig wrote:
[..]
> >>> You mean you would call "invalidate_kernel_vmap_range" before "dma_sync_sgtable_for_cpu" ?
> >>
> >> Yes.
> >
> > Could you explain why?
> 
> the vmap range is the one actually use for cpu access and thus most
> prone for speculation, so I'd invalidate it first.  It probably does
> not matter to much, but that order looks more sensible.

Shall we do the same in videobuf2?

----

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 7c4096e62173..0e3f264122af 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -132,12 +132,12 @@ static void vb2_dc_prepare(void *buf_priv)
 	if (!buf->non_coherent_mem)
 		return;
 
-	/* For both USERPTR and non-coherent MMAP */
-	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
-
 	/* Non-coherent MMAP only */
 	if (buf->vaddr)
 		flush_kernel_vmap_range(buf->vaddr, buf->size);
+
+	/* For both USERPTR and non-coherent MMAP */
+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
 }
 
 static void vb2_dc_finish(void *buf_priv)
@@ -152,12 +152,12 @@ static void vb2_dc_finish(void *buf_priv)
 	if (!buf->non_coherent_mem)
 		return;
 
-	/* For both USERPTR and non-coherent MMAP */
-	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
-
 	/* Non-coherent MMAP only */
 	if (buf->vaddr)
 		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
+
+	/* For both USERPTR and non-coherent MMAP */
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
 }
 
 /*********************************************/
