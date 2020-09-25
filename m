Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D253C2792B0
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 22:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIYUxQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 16:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgIYUxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 16:53:16 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6773BC0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:53:16 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z1so5265647wrt.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EukrXWtY4xWPgG0jZCMMjIR703TeN7FR8MXaWyNb+cA=;
        b=AdkVo6NbbX6nmBmobAq7CSr5CbBcfGMa76Q1hOEzrcKuLI+sm+/QWpFQt0QMEG2ZGf
         YK59IYdllv6LzIVByTQXnDeI4MpEgTr/lLcw3RNOTCnJUbzi4Ttqr2V20tvm0u/gZmzi
         IdCf52t1tZgFHA9z6X6w4z1NC2Zo3hi4POLnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EukrXWtY4xWPgG0jZCMMjIR703TeN7FR8MXaWyNb+cA=;
        b=AWjMveEnrdjH/BP+rmhMc6ZycRjGdLqaOqsmX/tM2If5QDBDH8GtoutSlgStcvw5Sd
         rrFSgdNRaWgAuaNYNDwNpGy4Cvvsz+SwQBWfm0DphFef0QMMrJTtgzWaS2rZ7bXwrNvw
         2EItQ93W5zF/hw6kgWTju1hyyVa6sMhnqYye3x1jq9omvqPMtcIDn77rp+wL9mG/ekmE
         pzKkku0Tr/71tju7UsveGmgAiuT1mPXX3MfO7TCHc/EGHunOPQdDUqUwxJ7JELbbsDvU
         iIH8nF152B6K6pBSzxF/BrM8S/jFuWDEiU1EzduIXLbbojhhtJy6g/TmZhJkqhb7FyO3
         mRwg==
X-Gm-Message-State: AOAM533fGBYTe8VWkcBZGVkOwKcwdGENJjz+wX+lYPIw3PlOK1hcWDyB
        xRBmy/eniqdF2BBuo4dMHbae0Q==
X-Google-Smtp-Source: ABdhPJzAYtaPepWxHRMRTqBemT9re93/2msBEqdwUJLCX/30UFGZ0sws6MktmssdGeOBVR3A9OFhKw==
X-Received: by 2002:a5d:5312:: with SMTP id e18mr6630250wrv.95.1601067195053;
        Fri, 25 Sep 2020 13:53:15 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h4sm4812303wrm.54.2020.09.25.13.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 13:53:14 -0700 (PDT)
Date:   Fri, 25 Sep 2020 20:53:13 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v3 12/12] media: staging: rkisp1: cap: protect access to
 buf with the spin lock
Message-ID: <20200925205313.GJ3607091@chromium.org>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-13-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922113402.12442-13-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Sep 22, 2020 at 01:34:02PM +0200, Dafna Hirschfeld wrote:
> The function 'rkisp1_stream_start' calls 'rkisp1_set_next_buf'
> which access the buffers, so the call should be protected by
> taking the cap->buf.lock.
> After this patch, all locks are reviewed and commented so remove
> the TODO item "review and comment every lock"
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/TODO             | 1 -
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index f0c90d1c86a8..9662e9b51c7f 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -1,6 +1,5 @@
>  * Fix pad format size for statistics and parameters entities.
>  * Fix checkpatch errors.
> -* Review and comment every lock
>  * Handle quantization
>  * streaming paths (mainpath and selfpath) check if the other path is streaming
>  in several places of the code, review this, specially that it doesn't seem it
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 012c0825a386..b9e56dab77af 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -913,6 +913,7 @@ static void rkisp1_stream_start(struct rkisp1_capture *cap)
>  	cap->ops->config(cap);
>  
>  	/* Setup a buffer for the next frame */
> +	spin_lock_irq(&cap->buf.lock);
>  	rkisp1_set_next_buf(cap);
>  	cap->ops->enable(cap);
>  	/* It's safe to config ACTIVE and SHADOW regs for the
> @@ -930,6 +931,7 @@ static void rkisp1_stream_start(struct rkisp1_capture *cap)
>  			     RKISP1_CIF_MI_INIT_SOFT_UPD, RKISP1_CIF_MI_INIT);
>  		rkisp1_set_next_buf(cap);
>  	}
> +	spin_unlock_irq(&cap->buf.lock);
>  	cap->is_streaming = true;

Should the is_streaming flag be protected in some way?

Also, similarly to the other nodes, is the flag actually needed?

Best regards,
Tomasz
