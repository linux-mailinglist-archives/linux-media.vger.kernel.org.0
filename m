Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E1648AD80
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238656AbiAKMWA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237953AbiAKMWA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:22:00 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F970C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:21:59 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id p37so29306721uae.8
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1rlMK0T7Ps8lD4c9LWmMq0r2/WoIONY/RtilvKlpf+o=;
        b=PLPqs6Qo+LMxsfoEoc15XLvPfasP+AhhykAZ/D5wsE7vx3wXsQwzr4qgbfVi5MJ4uX
         xa/ic4HrtrVUPOFotGLryeUDJ3w6dFmRlixDtEqDXR7DXF1B0SZqMqqih7JitgiipWyx
         mvoxge2WM0URvkA5n+sE/k6RFT/KTzEhqbi05UKsYVsEuG1lxI/pZc7xHyeumr4NWsrK
         +Sv26QnMCmH+fH1QIxK4YsMXj7Z2KFTqy8xRvVTjfmwqTxqJlIkEeoNQXyjuKxpIaiMI
         akkqXbwSniyfvZlDPcneFtcVG+BuhLW2/tyU2YgeMgchY9gWzwe5WYL0iL89y05u/N+Z
         BonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1rlMK0T7Ps8lD4c9LWmMq0r2/WoIONY/RtilvKlpf+o=;
        b=3hjMzuZxgPlpbh2y/VZ6iWR1agQNdyQplGzKTepC+bXmFGTpWmiGqR2wMDvV8rOBSj
         plplqDcv8AZyBLTpOqo1mfIeEqCnjJ+gdXsCrjqcHovWTPVn6rIBSDzCejZ7ZT6gKAOd
         JD6Qr3zcSHT+4kt/7YQZ7KdwufIzwrpiUbvmGXAwwpX04XZMBAC6keZw7rt+oxpE+K1D
         jP2Demhuxx/iIp3iUKY0RfiomxEXKAQ8CL15yES8AlNWgoZYL74YGxnnd/KEYGAgsogf
         6S0yazoMnWOTjHGYu2Yfztu9z/7GjfqU2aXIoMqZk55HMjVL3LpznVcj2zvNe5Mgf9ic
         c0Cg==
X-Gm-Message-State: AOAM5329x7U73iB+yOIwM/HH5I7stg9pYUC5KPhYA3A9bzIcJq5G93hd
        mQeWktfkvRxRiSamPIw8K/3hMmyALo5jUA==
X-Google-Smtp-Source: ABdhPJxs23O+UiL13OJhiy0JgYOD3ahMI8FRvxJLvkd4IZ0OG6IVusXUTx1H4eM3/e2XEekncWyXfQ==
X-Received: by 2002:ab0:6444:: with SMTP id j4mr1739929uap.138.1641903718845;
        Tue, 11 Jan 2022 04:21:58 -0800 (PST)
Received: from eze-laptop ([190.190.187.46])
        by smtp.gmail.com with ESMTPSA id u8sm6126782vsi.18.2022.01.11.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:21:58 -0800 (PST)
Date:   Tue, 11 Jan 2022 09:21:53 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, kernel@collabora.com
Subject: Re: [PATCH 1/3] media: stk1160: fix number of buffers in case not
 all buffers are created
Message-ID: <Yd12Ydvs67FCEnSi@eze-laptop>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
 <20220111065505.6323-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111065505.6323-2-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 11, 2022 at 08:55:03AM +0200, Dafna Hirschfeld wrote:
> In case we fail to allocate a transfer_buffer then we
> break the buffers creation loop and update the number of
> buffers to the number of successfully allocated which should
> be 'i' and not 'i - 1'
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/media/usb/stk1160/stk1160-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 202b084f65a2..91bd6adccdd1 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -511,9 +511,9 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>  	usb_free_urb(dev->isoc_ctl.urb[i]);
>  	dev->isoc_ctl.urb[i] = NULL;
>  
> -	stk1160_warn("%d urbs allocated. Trying to continue...\n", i - 1);
> +	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
>  
> -	dev->isoc_ctl.num_bufs = i - 1;
> +	dev->isoc_ctl.num_bufs = i;
>  
>  	return 0;
>  
> -- 
> 2.17.1
> 
