Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19CF48ADB6
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236362AbiAKMi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239350AbiAKMi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:38:27 -0500
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2543DC06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:38:27 -0800 (PST)
Received: by mail-ua1-x92f.google.com with SMTP id p1so29378532uap.9
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lOBEhGpvVv9z4kG/t2mh5NUhwDkCFR9NZuVT0GFkbxA=;
        b=AScWNhYlfXWpppQaFsT5h1BbbZ0Wx4Xig90MFOn3MDKKYDW1OH3342XTNYQW/oO3NM
         QUSML4UtySyj7ngPkHoFC5p5Msus8EyJABTfNPmFY6hNYsXQgN0kSApTu6HRI5ZSy3Uw
         nZfEktwcZaFtI/+pO2koyrK+rJWYrut79c1YAfm/TVSKwGkIlOoJ575Yc6FvlKsLFpNM
         cx9ZC2sIg3hyQ2Wmpdo0Pukc1Q69pMxZEV0HPsAOt9d3QOv25lZtEf/IXb56vjGnbWEi
         v2ja6Nmv56kcd6TERXN8SQCcCmtDvxJvUyQEWWuceHPw70ebpDtnRQvA2ZY/BxNePe5M
         OrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lOBEhGpvVv9z4kG/t2mh5NUhwDkCFR9NZuVT0GFkbxA=;
        b=fBR+605VxXqEum3G74KRPA6BOQfk37SNWsamIgxw6S1sDg8syFwQ1Ful8bEqc8IME7
         A5PbqL1xUM+sNqKKnxJz05pPyO3Gm+A528r+3aOxjLEsepRox/cU4LLRKIOxwt2Q3tkH
         v7y+LPyLMnrA+gk/onItBrkTV/vb5Ea4ezKfQOVAGmFomTUGGMQKT9YWvc5v7D/nfYU5
         m6JFhXEFoG8ozV3sb5DeK9TEK8Ap+At9vw+y1KbaGZ5x4ZYabwmE/2tnaEFxft9VXYpz
         LLDWnQJI6lbUexeNuaaIekK2YXxFkZfbwVOwHykCtPzjMh6FcgRCaHAHt99SmZT8Au4u
         pTsw==
X-Gm-Message-State: AOAM533K1n+quc8MaGEfBb/cf9ISeQP1B9lK7qmPhQ+NeKASeLMi1nip
        TEgTvafAqkKWjid/teg4nMyVEw==
X-Google-Smtp-Source: ABdhPJxY1C6m9rjTdjkkCgTFONkm1X2JkplUvOMZ6groUr1+NV3N0DwhcNSKjRTgMxnyWKQAK4AGWQ==
X-Received: by 2002:a05:6102:3746:: with SMTP id u6mr1953420vst.40.1641904706223;
        Tue, 11 Jan 2022 04:38:26 -0800 (PST)
Received: from eze-laptop ([190.190.187.46])
        by smtp.gmail.com with ESMTPSA id t22sm6076167vsk.0.2022.01.11.04.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:38:25 -0800 (PST)
Date:   Tue, 11 Jan 2022 09:38:21 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, kernel@collabora.com
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
Message-ID: <Yd16PXCDGwF5V7aK@eze-laptop>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
 <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Very nice work.

I specially like all the testing that you mentioned in the cover-letter.

Back in the day, there were a few users trying to use STK1160 (Easycap)
with Beaglebone boards, without success due to lack of USB throughput.

If anything else, I think it's good to see additional noncontiguous API users.

On Tue, Jan 11, 2022 at 08:55:05AM +0200, Dafna Hirschfeld wrote:
> Replace the urb buffers allocation to
> use the noncontiguous API. This improve performance
> on Arm.
> The noncontiguous API require handling
> synchronization.
> This commit is similar to the one sent to
> uvc: [1]
> 
> [1] https://lkml.org/lkml/2021/3/12/1506
> 

This commit description needs lots of attention. In particular,
please add the test results here.

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/usb/stk1160/stk1160-v4l.c   |   3 +
>  drivers/media/usb/stk1160/stk1160-video.c | 109 +++++++++++++---------
>  drivers/media/usb/stk1160/stk1160.h       |  10 ++
>  3 files changed, 79 insertions(+), 43 deletions(-)
> 
[..]
> @@ -501,7 +524,7 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>  
>  free_i_bufs:
>  	/* Save the allocated buffers so far, so we can properly free them */
> -	dev->isoc_ctl.num_bufs = i+1;
> +	dev->isoc_ctl.num_bufs = i;

This looks like a separate fix, similar to 1/3 ?

>  	stk1160_free_isoc(dev);
>  	return -ENOMEM;
>  }
> diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
> index 1ffca1343d88..52bea7815ae5 100644
> --- a/drivers/media/usb/stk1160/stk1160.h
> +++ b/drivers/media/usb/stk1160/stk1160.h
> @@ -16,6 +16,8 @@
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ctrls.h>
> +#include <linux/usb.h>
> +#include <linux/usb/hcd.h>
>  
>  #define STK1160_VERSION		"0.9.5"
>  #define STK1160_VERSION_NUM	0x000905
> @@ -87,6 +89,9 @@ struct stk1160_buffer {
>  struct stk1160_urb {
>  	struct urb *urb;
>  	char *transfer_buffer;
> +	struct sg_table *sgt;
> +	struct stk1160 *dev;
> +	dma_addr_t dma;
>  };
>  
>  struct stk1160_isoc_ctl {
> @@ -190,3 +195,8 @@ void stk1160_select_input(struct stk1160 *dev);
>  
>  /* Provided by stk1160-ac97.c */
>  void stk1160_ac97_setup(struct stk1160 *dev);
> +
> +static inline struct device *stk1160_get_dmadev(struct stk1160 *dev)
> +{
> +	return bus_to_hcd(dev->udev->bus)->self.sysdev;

This function looks truly horrible, is there no other way to get the device ?

I suppose this function return something different than (struct stk1160*)dev->dev ?

Thanks,
Ezequiel
