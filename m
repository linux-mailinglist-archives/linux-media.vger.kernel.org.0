Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888742793B4
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 23:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgIYVnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 17:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgIYVnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 17:43:35 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558F8C0613D4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 12:08:26 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so4782482wrl.12
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c6zlXlVd+JLiTfma+AWCFjNmBf3A0tjHgrCNLmh+yZc=;
        b=As86tNB7hrTQ0igU5gdohTQ29hVlKGs0oW04GJsO55JJbRwhAr2VyTExOWYGt/pjNM
         nH1RMOwXWkdHwlNPeVE0gAMiDY8fLUN6I+UpEi0+TOLUSIeal1mZX/e+ZTlFHDhzqtfF
         H6RstrVLXEaEujNKqtfqv8P/BGWFZ7KghpRog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c6zlXlVd+JLiTfma+AWCFjNmBf3A0tjHgrCNLmh+yZc=;
        b=TD9sTDZRGZtRh5fem9npLVFIc7nVMKCm3o+dPdUH2MsuKwD1Efqmv45/mMCVDNHuE8
         gs4z1iKX4926bZ4KQtCGpIxGaBw/SBdVhreUvn0AX3PK8r6efOUHlxoGfl2oLCpsNRBg
         9p7fqhRU16p2eElbWeJEUsbwMDd3F0dSCRt4AP4kfx9rQsUOVrqTbAZ4i0FCemVcN0NP
         oQxYpyWz+E2Cz2DPce7KjxL/q57pBLj9CE06IyaH+3rM+FPo3CPaE7QGbgseIRzKeFrG
         BvqZ18loNW9ZvcXmhozkMGo57iUG8MS3DlL4XrqZVMhbIq70J0jBqVydnZSnYQADOcVS
         M3Qg==
X-Gm-Message-State: AOAM530rDO5CPy7JQ7RsijLGwU3lnmb7cZqqwG4R6aAJVb3nnpBuU0IA
        bucp/6/gBPUvL1QtZt7IQs0HVA==
X-Google-Smtp-Source: ABdhPJx6R5K6nXWi3K1eRsPvjyn05rKke7YVBSo2EWfQFwf0Z6B8FYXVJunS4hdZvCeiZLI0yzfh6g==
X-Received: by 2002:adf:8285:: with SMTP id 5mr5742667wrc.97.1601060904995;
        Fri, 25 Sep 2020 12:08:24 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h2sm3963091wrp.69.2020.09.25.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 12:08:24 -0700 (PDT)
Date:   Fri, 25 Sep 2020 19:08:23 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v3 01/12] media: staging: rkisp1: params: upon stream
 stop, iterate a local list to return the buffers
Message-ID: <20200925190823.GE3607091@chromium.org>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922113402.12442-2-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Sep 22, 2020 at 01:33:51PM +0200, Dafna Hirschfeld wrote:
> The code in '.stop_streaming' callback releases and acquire the lock
> at each iteration when returning the buffers.
> Holding the lock disables interrupts so it should be minimized.
> To make the code cleaner and still minimize holding the lock,
> the buffer list is first moved to a local list and
> then can be iterated without the lock.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 31 +++++++-------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 3ca2afc51ead..85f3b340c3bf 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1469,32 +1469,23 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  {
>  	struct rkisp1_params *params = vq->drv_priv;
>  	struct rkisp1_buffer *buf;
> +	struct list_head tmp_list;
>  	unsigned long flags;
> -	unsigned int i;
>  
> -	/* stop params input firstly */
> +	INIT_LIST_HEAD(&tmp_list);

nit: This could be done at declaration time by using the LIST_HEAD()
macro to declare the list head.

> +
> +	/*
> +	 * we first move the buffers into a local list 'tmp_list'
> +	 * and then we can iterate it and call vb2_buffer_done
> +	 * without holding the lock
> +	 */
>  	spin_lock_irqsave(&params->config_lock, flags);
>  	params->is_streaming = false;
> +	list_cut_position(&tmp_list, &params->params, params->params.prev);

nit: This is equivalent to list_splice_init(&params->params, &tmp_list);
with a simpler interface and without the need to dereference
params->params.prev manually.

Best regards,
Tomasz
