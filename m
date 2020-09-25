Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEEE27929B
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 22:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgIYUsA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 16:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgIYUsA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 16:48:00 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B203C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:48:00 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s12so5199330wrw.11
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NOmPXNXsiaqWfpcWTEcqBI/DMgPgdqgNWElxeHogcvU=;
        b=cKpzW1H3f6rztaDN37oQL4EWIyj0968VIU8H5YMS8xgrWtI3z7DmDpmNEiJZqkVjM/
         hfiCy7jbWZ1vFirIfSGbhGMwF4P8WAOXCOkKFEHKl98OwEtnxETvozRX32toaQXj1HES
         KiMRLXl1xCjdsyIPZKzpeuRGYFtUVt3t57RJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NOmPXNXsiaqWfpcWTEcqBI/DMgPgdqgNWElxeHogcvU=;
        b=paJAwGF7HHctYtIDy/Xs+19+n3R1kdXeha1uL6zAmX0CcDx1RYM54KBC+mM6RWSQjc
         GiONPLCYAu4N/w++hSdKGF5a8jJriqH38xXfdykU9uLdAYaeTvrM6ib/+G+U8gdwhM7Y
         yX9c3AkePVJlXb3/aNQR3DkvL4pyVRzTd0nICZDKO7KDugc+b2c0TN8gqLergXLpyJZl
         F4P3JMSAQu3r1sxQchCyQ7vBavhb/Ytgk6fDieuAboAfKBYvtdLRj8bTNmItDK4YgB7I
         P20h6NZwT0hGLGh92wkpgFmMYHtn8CqLYpQZpNUPcsLhCKeYIIPC8wxZRjKN4mxBrLfn
         RsxQ==
X-Gm-Message-State: AOAM533jJ7SyyPKqQFm1c047xWQtcXb1totNenDOHzObcZ/JTEZK7BDv
        DGVjla/wbLZO8UI3P811BePpnw==
X-Google-Smtp-Source: ABdhPJy5MMzAKaDGxHLjdWLWC/Z+VTnQXMWv/O87Bhom/6rOfzUnb9wFaBtLzSHOWAJzU/bWtzJMmA==
X-Received: by 2002:adf:ff83:: with SMTP id j3mr6485161wrr.135.1601066878852;
        Fri, 25 Sep 2020 13:47:58 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id b84sm279713wmd.0.2020.09.25.13.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 13:47:58 -0700 (PDT)
Date:   Fri, 25 Sep 2020 20:47:56 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v3 09/12] media: staging: rkisp1: stats: protect write to
 'is_streaming' in start_streaming cb
Message-ID: <20200925204756.GH3607091@chromium.org>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-10-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922113402.12442-10-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Sep 22, 2020 at 01:33:59PM +0200, Dafna Hirschfeld wrote:
> The field stats->is_streaming is written in 'start_streaming' callback
> without the stats->lock protection.
> The isr might run together with the callback so 'spin_lock_irq'
> should be used.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-stats.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index 6aa18d970f2b..51c64f75fe29 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -157,7 +157,9 @@ rkisp1_stats_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>  {
>  	struct rkisp1_stats *stats = queue->drv_priv;
>  
> +	spin_lock_irq(&stats->lock);
>  	stats->is_streaming = true;

Do we need this separate stream? This is a similar note to the
parameters patch - it should be possible to handle this based on the
presence of the buffers in the list, without a custom flag.

Best regards,
Tomasz
